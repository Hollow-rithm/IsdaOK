import cv2 as cv
import numpy as np

def extract(result, mask):
    valid_pixels = cv.countNonZero(mask)
    if valid_pixels < 100:
        return {
            "hue_mean":        25.0,   # neutral fallback = brownish
            "red_purity":      0.0,
            "brown_dominance": 1.0,
            "color_cov":       1.0,
            "brightness_mean": 0.0,
            "valid_pixels":    0,
        }

    hsv = cv.cvtColor(result, cv.COLOR_BGR2HSV)

    valid = mask == 255
    h_vals = hsv[:, :, 0][valid].astype(np.float32)
    s_vals = hsv[:, :, 1][valid].astype(np.float32)
    v_vals = hsv[:, :, 2][valid].astype(np.float32)

    # Mean Hue (hue is circular)
    angles = h_vals * (np.pi / 90.0) # 2 * pi / 180
    sin_mean = np.sin(angles).mean()
    cos_mean = np.cos(angles).mean()

    circular_mean = np.degrees(np.arctan2(sin_mean, cos_mean))
    if circular_mean < 0:
        circular_mean += 360
    hue_mean = circular_mean * 0.5 # * 180/360

    # Red purity (mean saturation of red pixels)
    red_mask = (h_vals <= 8) | (h_vals >= 168)
    if red_mask.any():
        red_purity = s_vals[red_mask].mean()
    else:
        red_purity = 0.0

    # Brown dominance (brown ratio of image)
    brown_mask = (h_vals >= 10) & (h_vals <= 30) & (s_vals < 160)
    brown_dominance = np.sum(brown_mask) / valid_pixels

    # Saturation coefficient of variance (variance of saturation)
    s_mean = float(np.mean(s_vals))
    color_cov = float(np.std(s_vals) / (s_mean + 1e-6))

    # Brightness mean (mean value)
    brightness_mean = float(np.mean(v_vals))

    return {
        "hue_mean":        round(hue_mean, 2),
        "redness_purity":   round(red_purity, 2),
        "brightness_mean": round(brightness_mean, 2),
        "brown_dominance": round(brown_dominance, 4),
        "color_cov":       round(color_cov, 4),
        "valid_pixels":    int(valid_pixels),
    }