import cv2 as cv
import numpy as np

def extract_gill_features(result, mask):
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

    h_vals = hsv[:, :, 0][mask == 255].astype(float)
    s_vals = hsv[:, :, 1][mask == 255].astype(float)
    v_vals = hsv[:, :, 2][mask == 255].astype(float)

    # Mean Hue (hue is circular)
    angles = h_vals * (2 * np.pi / 180.0)
    sin_mean = np.mean(np.sin(angles))
    cos_mean = np.mean(np.cos(angles))
    circular_mean = np.degrees(np.arctan2(sin_mean, cos_mean))
    if circular_mean < 0:
        circular_mean += 360
    hue_mean = circular_mean * (180.0 / 360.0)

    # Red purity (mean saturation of red pixels)
    red_mask = (h_vals <= 8) | (h_vals >= 168)
    if np.sum(red_mask) > 0:
        red_purity = np.mean(s_vals[red_mask])
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