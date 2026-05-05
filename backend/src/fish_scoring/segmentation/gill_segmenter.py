import cv2 as cv
import numpy as np

from config import K5, K11

def segment(enhanced, roi, img):
    hsv = cv.cvtColor(enhanced, cv.COLOR_BGR2HSV)

    # red mask
    red1 = cv.inRange(hsv, (0, 60, 40), (8, 255, 255))
    red2 = cv.inRange(hsv, (168, 60, 40), (180, 255, 255))
    mask_red = cv.bitwise_or(red1, red2)

    # borwn mask
    mask_brown = cv.inRange(hsv, (8, 50, 40), (31, 190, 160))

    total_pixels = roi.shape[0] * roi.shape[1]
    
    mask = cv.bitwise_or(mask_red, mask_brown)

    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, K11)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)

    final_mask = np.zeros_like(mask)

    if contours:
        best = max(contours, key=cv.contourArea)
        cv.drawContours(final_mask, [best], -1, 255, -1)
    else:
        final_mask = mask  # fallback: keep raw mask

    coverage = cv.countNonZero(final_mask) / (final_mask.shape[0] * final_mask.shape[1])

    result = cv.bitwise_and(img, img, mask=final_mask)

    return result, final_mask, coverage