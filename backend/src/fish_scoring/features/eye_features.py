import cv2 as cv
import numpy as np

from preprocessing import image_utils

def extract(eye_result):
    # Local Binary Pattern (LBP) Texture Score
    gray = cv.cvtColor(eye_result, cv.COLOR_BGR2GRAY)
    clahe = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    gray_eq = clahe.apply(gray)
    h, w = gray.shape
    lbp_map = np.zeros((h, w), dtype=np.uint8)
    gray_f = gray.astype(np.float32)
    radius = 3
    n_points = 8 * radius

    for i in range(n_points):
        angle = 2 * np.pi * i / n_points
        dx = radius * np.cos(angle)
        dy = -radius * np.sin(angle)  # flip y for image coords
 
        # Bilinear interpolation of neighbor pixel
        x0 = int(np.floor(dx))
        x1 = x0 + 1
        y0 = int(np.floor(dy))
        y1 = y0 + 1
 
        wx = dx - x0
        wy = dy - y0
 
        # Shift maps for neighbor positions (border handling via reflection)
        def shift(arr, sx, sy):
            return np.roll(np.roll(arr, sy, axis=0), sx, axis=1)
 
        neighbor = (
            (1 - wx) * (1 - wy) * shift(gray_f, x0, y0)
            + wx       * (1 - wy) * shift(gray_f, x1, y0)
            + (1 - wx) * wy       * shift(gray_f, x0, y1)
            + wx       * wy       * shift(gray_f, x1, y1)
        )
        lbp_map += ((neighbor >= gray_f).astype(np.uint8) << i)
 
    hist, _ = np.histogram(lbp_map, bins=256, range=(0, 256))
    lbp_texture_score = float(np.var(hist.astype(np.float32)))

    # Canny edge density
    blurred = cv.GaussianBlur(gray_eq, (5,5), 0)
    edges = cv.Canny(blurred, 50, 150)
    total_pixels = edges.size
    edge_pixels = float(np.count_nonzero(edges))
    canny_edge_density = edge_pixels / total_pixels if total_pixels > 0 else 0.0

    # Mean Saturation
    hsv = cv.cvtColor(eye_result, cv.COLOR_BGR2HSV)
    _, s_ch, _ = cv.split(hsv)
    mean_saturation = float(np.mean(s_ch.astype(np.float32)))

    # LAB a mean
    lab = cv.cvtColor(eye_result, cv.COLOR_BGR2LAB)
    a_channel = lab[:, :, 1] - 128.0
    lab_a_mean = float(np.mean(a_channel))

    # Red Ratio
    red_pixels = a_channel > 10
    red_ratio = float(np.sum(red_pixels) / (eye_result.shape[0] * eye_result.shape[1]))

    return {
        "lbp_texture_score": round(lbp_texture_score // 1000, 2),
        "canny_edge_density": round(canny_edge_density, 4),
        "mean_saturation": round(mean_saturation, 2),
        "lab_a_mean": round(lab_a_mean, 3),
        "red_ratio": round(red_ratio, 4),
    }