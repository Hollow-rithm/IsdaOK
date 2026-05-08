import cv2 as cv
import numpy as np

from config import K5, K11

def segment(enhanced, img):
    hsv = cv.cvtColor(enhanced, cv.COLOR_BGR2HSV)

    # red mask
    mask_red = cv.inRange(hsv, (0, 60, 40), (8, 255, 255))
    mask_red2 = cv.inRange(hsv, (168, 60, 40), (180, 255, 255))
    cv.bitwise_or(mask_red, mask_red2, dst=mask_red)

    # borwn mask
    mask = cv.inRange(hsv, (8, 50, 40), (31, 190, 160))

    # combine masks    
    cv.bitwise_or(mask_red, mask, dst=mask)

    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, K11)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)

    if contours:
        final_mask = np.zeros_like(mask)
        best = max(contours, key=cv.contourArea)
        cv.drawContours(final_mask, [best], -1, 255, -1)
    else:
        final_mask = mask  # fallback: keep raw mask

    coverage = cv.countNonZero(final_mask) / (final_mask.shape[0] * final_mask.shape[1])

    result = cv.bitwise_and(img, img, mask=final_mask)

    return result, final_mask, coverage

def get_mask(gill_roi):
    gray = cv.cvtColor(gill_roi, cv.COLOR_BGR2GRAY)
    _, mask = cv.threshold(gray, 1, 255, cv.THRESH_BINARY)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, K11)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)
    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)

    if contours:
        final_mask = np.zeros_like(mask)
        best = max(contours, key=cv.contourArea)
        cv.drawContours(final_mask, [best], -1, 255, -1)
    else:
        final_mask = mask  # fallback: keep raw mask

    return final_mask