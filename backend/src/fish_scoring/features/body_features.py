import cv2 as cv
import numpy as np

from preprocessing import image_utils

def extract(body_roi):
    hsv = cv.cvtColor(body_roi, cv.COLOR_BGR2HSV)
    _, s_ch, v_ch = cv.split(hsv)
    
    # 1. ENHANCE PEAKS (The Top-Hat "strict" kernel)
    # Using a slightly smaller kernel (15) keeps it focused on sharp reflections
    kernel = cv.getStructuringElement(cv.MORPH_ELLIPSE, (15, 15))
    tophat = cv.morphologyEx(v_ch, cv.MORPH_TOPHAT, kernel)
    
    # 2. ADAPTIVE PEAK DETECTION (Otsu #1)
    # This finds the core of the highlights
    otsu_val, seeds = cv.threshold(tophat, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)

    # 3. STRICT SATURATION GATE (Otsu #2)
    # Instead of a hard number like 100, we let Otsu find the "colorless" 
    # threshold for THIS specific fish. This is the key to strictness.
    # Shine is white (Low S), so we use BINARY_INV.
    _, s_strict_mask = cv.threshold(s_ch, 0, 255, cv.THRESH_BINARY_INV + cv.THRESH_OTSU)

    # 4. HARD INTENSITY FLOOR
    # A true "shine" is objectively bright. We ignore anything below the 60% mark.
    v_thresh = max(otsu_val, 180)  # adaptive but still strict
    _, v_hard_gate = cv.threshold(v_ch, v_thresh, 255, cv.THRESH_BINARY)
    # _, v_hard_gate = cv.threshold(v_ch, 200, 255, cv.THRESH_BINARY)

    # 5. FUSE CRITERIA
    # Seed (Peak) + Colorless (S-Otsu) + Bright (V-Gate)
    candidate_mask = cv.bitwise_and(seeds, s_strict_mask)
    strict_mask = cv.bitwise_and(candidate_mask, v_hard_gate)

    # 6. REFINEMENT (Remove tiny single-pixel noise)
    # This ensures only "real" pools of light remain.
    clean_k = cv.getStructuringElement(cv.MORPH_ELLIPSE, (3, 3))
    final_mask = cv.morphologyEx(strict_mask, cv.MORPH_OPEN, clean_k)

    # 7. METRICS
    body_mask = (v_ch > 15).astype(np.uint8) * 255
    body_area = cv.countNonZero(body_mask)
    specular_pixels = cv.countNonZero(final_mask)
    
    coverage = float(specular_pixels / body_area) if body_area > 0 else 0
    average = float(np.mean(v_ch[final_mask > 0])) if specular_pixels > 0 else 0

    body_L = float(image_utils.get_lab_mean(body_roi))

    return {"shine_coverage": round(coverage, 4),
            "shine_intensity": round(average, 2),
            "body_L": round(body_L, 2),
            }