import cv2 as cv
import numpy as np

from config import K5

from preprocessing import image_utils

def _get_edges(head_roi):
    blurred = cv.GaussianBlur(head_roi, (5,5), 0)
    b, g, r = cv.split(blurred)
    
    # r = cv.GaussianBlur(r, (5, 5), 0)
    # g = cv.GaussianBlur(g, (5, 5), 0)
    # b = cv.GaussianBlur(b, (5, 5), 0)
    
    r_edges = cv.Canny(r, 20, 200)
    g_edges = cv.Canny(g, 20, 200)
    b_edges = cv.Canny(b, 20, 200)

    rg = cv.bitwise_or(r_edges, g_edges, mask=None)
    edges = cv.bitwise_or(rg, b_edges, mask=None)

    edges = cv.morphologyEx(edges, cv.MORPH_CLOSE, K5)
    
    return edges

def _isolate_eye_hough(gray):
    blur = cv.GaussianBlur(gray, (5, 5), 0)
    h, w = gray.shape
    circles = cv.HoughCircles(
        blur,
        cv.HOUGH_GRADIENT,
        dp=1,
        minDist=int(min(h, w) * 0.5),
        param1=80,
        param2=32,
        minRadius=20,
        maxRadius=60
    )
    return circles

def _pick_darkest_largest_circle(circles, gray, reflect_mask=None):
    if circles is None:
        return None

    # circles = np.uint16(np.around(circles))
    circles = np.int32(np.around(circles))
    h, w = gray.shape

    best_circle = None
    best_score = -1e9

    for i in circles[0, :]:
        x, y, r = i

        mask = np.zeros((h, w), dtype=np.uint8)
        cv.circle(mask, (x, y), r, 255, -1)

        if reflect_mask is not None:
            mask = cv.bitwise_and(mask, cv.bitwise_not(reflect_mask))

        pixels = gray[mask == 255]

        if len(pixels) < 10:
            continue

        mean_intensity = np.mean(pixels)          # lower = darker
        darkness_score = 255 - mean_intensity      # higher = better

        dark_pixel = pixels < 60
        # darkness_score = np.sum(dark_pixel) / len(pixels)
        radius_score = r                           # larger = better

        # --- COMBINE SCORE ---
        score = (
            0.3 * darkness_score +
            0.7 * radius_score
        )

        if score > best_score:
            best_score = score
            best_circle = (x, y, r)

    return best_circle

def segment(head_roi):
    head_rgb, head_gray = image_utils.preprocess_head(head_roi)
    edges = _get_edges(head_rgb)
    circles = _isolate_eye_hough(edges)
    best = _pick_darkest_largest_circle(circles, head_gray)
    eye_box_circular = None
    
    if best is not None:
        x, y, r = best

        h, w = head_roi.shape[:2]

        r_scaled = int(r * 2)

        x0 = max(x - r_scaled, 0)
        y0 = max(y - r_scaled, 0)
        x1 = min(x + r_scaled, w)
        y1 = min(y + r_scaled, h)

        box_mask = np.zeros((h, w), dtype=np.uint8)
        box_mask[y0:y1, x0:x1] = 255
                
        circle_mask = np.zeros((h, w), dtype=np.uint8)
    
        internal_radius = int(r_scaled * 0.9) 
        cv.circle(circle_mask, (x, y), internal_radius, 255, -1)

        final_mask = cv.bitwise_and(box_mask, circle_mask)

        eye_box_circular = cv.bitwise_and(head_roi, head_roi, mask=final_mask)

        return eye_box_circular

    else:
        print("no eye detected")
        return None