import cv2 as cv
import numpy as np
import sys
import os
from pathlib import Path
import pandas as pd

from combine_images import save_from_twodirs

DISABLE_SAVE = False  # Set to False to enable saving debug images
file_dir = "analyzeGills5_alldata"

def save(name, img, dir="gills_debug"):
    if DISABLE_SAVE:
        return
    os.makedirs(dir, exist_ok=True)
    if img is None:
        return
    cv.imwrite(f"{dir}/{name}.jpg", img)

def save_strip(roi, enhanced, red_mask, brown_mask, combined_mask, final_mask, result, file_name, dir=f"{file_dir}/strips"):
    if DISABLE_SAVE:
        return
    os.makedirs(dir, exist_ok=True)
    stages = [roi, enhanced, red_mask, brown_mask, combined_mask, final_mask, result]
    labels = ["roi", "enhanced", "red_mask", "brown_mask", "combined_mask", "final_mask", "result"]

    panels = []
    for img, label in zip(stages, labels):
        if len(img.shape) == 2:
            img = cv.cvtColor(img, cv.COLOR_GRAY2BGR)
        cv.putText(img, label, (5, 20), cv.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 255), 1)
        panels.append(img)

    strip = np.hstack(panels)
    cv.imwrite(f"{dir}/{file_name}.jpg", strip)

def save_canny_strip(color_mask, l_channel, blur, edges, edges_dilated, inv, enclosed_regions, refined,  file_name, dir=f"{file_dir}/canny_debug"):
    if DISABLE_SAVE:
        return
    os.makedirs(dir, exist_ok=True)
    stages = [color_mask, l_channel, blur, edges, edges_dilated, inv, enclosed_regions, refined]
    labels = ["color_mask", "l_channel", "blur", "edges", "edges_dilated", "inv", "enclosed_regions", "refined"]

    panels = []
    for img, label in zip(stages, labels):
        if len(img.shape) == 2:
            img = cv.cvtColor(img, cv.COLOR_GRAY2BGR)
        cv.putText(img, label, (5, 20), cv.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 255), 1)
        panels.append(img)

    strip = np.hstack(panels)
    cv.imwrite(f"{dir}/{file_name}.jpg", strip)

def get_final_mask(mask, total_pixels):
    k5 = np.ones((5,5), np.uint8)
    k11 = np.ones((11,11), np.uint8)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, k5)
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, k11)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, k5)

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)

    final_mask = np.zeros_like(mask)

    if contours:
        best = max(contours, key=cv.contourArea)
        cv.drawContours(final_mask, [best], -1, 255, -1)
    else:
        final_mask = mask  # fallback: keep raw mask
    
    return final_mask

def canny_enhancement(combined_mask, l_channel, file_name, dir=f"{file_dir}/canny_debug"):
    blur = cv.GaussianBlur(l_channel, (5, 5), 0)

    otsu_thresh, _ = cv.threshold(blur, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)
    low = otsu_thresh * 0.4
    high = otsu_thresh * 1.0
    edges = cv.Canny(blur, low, high)

    k3 = np.ones((3,3), np.uint8)
    edges_dilated = cv.dilate(edges, k3, iterations=2)

    inv = cv.bitwise_not(edges_dilated)
    flood = inv.copy()
    h, w = inv.shape
    flood_mask = np.zeros((h + 2, w + 2), dtype=np.uint8)

    for pt in [(0,0), (w-1,0), (0,h-1), (w-1,h-1)]:
        cv.floodFill(flood, flood_mask, pt, 0)
    
    enclosed_regions = flood

    refined = cv.bitwise_and(combined_mask, enclosed_regions)
    refined_result = cv.bitwise_and(l_channel, l_channel, mask=refined)

    save_canny_strip(combined_mask, l_channel, blur, edges, edges_dilated, inv, enclosed_regions, refined_result, file_name, dir)

    if cv.countNonZero(refined) < cv.countNonZero(combined_mask) * 0.15:
        return combined_mask

    return refined

def segment_gills(img_path, debug=False):
    file_name = Path(img_path).stem
    print (f"Processing {img_path}...")
    img = cv.imread(img_path)

    if img is None:
        print("Image not found")
        return None, None, None

    h, w = img.shape[:2]

    center = (w // 2, h // 2)
    radius = min(w, h) // 8

    circle_mask = np.zeros((h, w), dtype=np.uint8)
    cv.circle(circle_mask, center, radius, 255, -1)

    # initialize roi and crop image
    roi = cv.bitwise_and(img, img, mask=circle_mask)
    img = img[center[1]-radius:center[1]+radius, center[0]-radius:center[0]+radius]
    roi = roi[center[1]-radius:center[1]+radius, center[0]-radius:center[0]+radius]

    # clahe
    lab = cv.cvtColor(roi, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)
    clahe = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
    l_clahe = clahe.apply(l)
    lab = cv.merge((l_clahe, a, b))
    enhanced = cv.cvtColor(lab, cv.COLOR_LAB2BGR)

    hsv = cv.cvtColor(enhanced, cv.COLOR_BGR2HSV)

    # red mask
    red1 = cv.inRange(hsv, (0, 60, 40), (8, 255, 255))
    red2 = cv.inRange(hsv, (168, 60, 40), (180, 255, 255))
    mask_red = cv.bitwise_or(red1, red2)

    # borwn mask
    mask_brown = cv.inRange(hsv, (8, 50, 40), (31, 190, 160))

    total_pixels = roi.shape[0] * roi.shape[1]
    
    red_pixels_ratio = cv.countNonZero(mask_red) / total_pixels
    brown_pixels_ratio = cv.countNonZero(mask_brown) / total_pixels
        
    final_mask_red = get_final_mask(mask_red, total_pixels)
    final_mask_brown = get_final_mask(mask_brown, total_pixels)
    
    combined_masks = cv.bitwise_or(mask_red, mask_brown)
    if debug:
        refined = canny_enhancement(combined_masks, l_clahe, file_name, dir="debug_canny_strip")
    else:
        refined = canny_enhancement(combined_masks, l_clahe, file_name)
        
    result_red = cv.bitwise_and(img, img, mask=final_mask_red)
    result_brown = cv.bitwise_and(img, img, mask=final_mask_brown)

    if red_pixels_ratio > brown_pixels_ratio:
        color = "red"
        result = result_red
        final_mask = final_mask_red
    else:
        color = "brown"
        result = result_brown
        final_mask = final_mask_brown

    final_mask = get_final_mask(combined_masks, total_pixels)
    result = cv.bitwise_and(img, img, mask=final_mask)

    if debug:
        save_strip(roi, enhanced, mask_red, mask_brown, combined_masks, final_mask, result, file_name, dir="debug_strip")
        return
    else:
        mask_red = cv.bitwise_and(img, img, mask=mask_red)
        mask_brown = cv.bitwise_and(img, img, mask=mask_brown)
        combined_masks = cv.bitwise_and(img, img, mask=combined_masks)
        save_strip(roi, enhanced, mask_red, mask_brown, combined_masks, final_mask, result, file_name, dir=f"{file_dir}/strips")
        return result, final_mask, color

def extract_gill_features(result, final_mask):
    valid_pixels = cv.countNonZero(final_mask)
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

    h_vals = hsv[:, :, 0][final_mask == 255].astype(float)
    s_vals = hsv[:, :, 1][final_mask == 255].astype(float)
    v_vals = hsv[:, :, 2][final_mask == 255].astype(float)

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

def score_gills(features):
    MAX_SCORE = 1.0
    MIN_SCORE = 0.0

    valid_pixels = features["valid_pixels"]
    if valid_pixels < 100:
        return 0.0, {}

    # Sub-score 1: Hue mean (lower = redder = fresher)
    # Range_1: 0 (pure red) to 20(brownish). Invert so low hue = high score.
    # Range_2: 180 = 0 (pure red) to 168 (pinkish)
    hm = features["hue_mean"]
    HUE_LOWER_1 = 0.0
    HUE_UPPER_1 = 20.0
    HUE_LOWER_2 = 168.0
    HUE_UPPER_2 = 180.0
    if hm > 20.0:
        hue_score = np.clip((hm - HUE_LOWER_2) / (HUE_UPPER_2 - HUE_LOWER_2), MIN_SCORE, MAX_SCORE)
    else:
        hue_score = np.clip(MAX_SCORE - (hm - HUE_LOWER_1) / (HUE_UPPER_1 - HUE_LOWER_1), MIN_SCORE, MAX_SCORE)

    # Sub-score 2: Red purity (Mean Saturation)
    # Range: 50 (dull stale) to 200 (vibrant fresh)
    PURITY_LOWER = 80.0
    PURITY_UPPER = 200.0
    rp = features["redness_purity"]
    purity_score = np.clip((rp - PURITY_LOWER) / (PURITY_UPPER - PURITY_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 3: Brown dominance penalty (Brown ratio from segmented gills)
    # Range: 0.0 (no brown) to 0.90 (highly brown). low brown dominance = high score
    BROWN_UPPER = 0.80 # 80% brown = bad
    BROWN_LOWER = 0.0
    bd = features["brown_dominance"]
    brown_score = np.clip(MAX_SCORE - (bd - BROWN_LOWER) / (BROWN_UPPER - BROWN_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 4: Color/Saturation Coefficient of Variance (low = uniform = fresher)
    # Range: 0.20 (uniform) to 0.60 (patchy)
    COV_UPPER = 0.60
    COV_LOWER = 0.20
    cov = features["color_cov"]
    uniformity_score = np.clip(MAX_SCORE - (cov - COV_LOWER) / (COV_UPPER - COV_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 5: Brightness penalty
    # Penalize low brightness (<60) or too bright (>210)
    bm = features["brightness_mean"]
    BEST_BRIGHTNESS_LOW_THRESH = 100.0
    BEST_BRIGHTNESS_HIGH_THRESH = 180.0

    BRIGHTNESS_LOWER = 60.0
    BRIGHTNESS_HIGHER = 210.0

    # 0 to BRIGHTNESS_LOWER | BRIGHTNESS_HIGHER to 255.0 = BAD | 0.0
    # BEST_BRIGHTNESS_LOW_THRESH to BEST_BRIGHTNESS_HIGH_THRESH = BEST | 1.0
    # BRIGHTNESS_LOWER to BEST_BRIGHTNESS_LOW_THRESH | BEST_BRIGHTNESS_HIGH_THRESH to BRIGHTNESS_HIGHER = 0.0 - 1.0
    if BEST_BRIGHTNESS_LOW_THRESH <= bm <= BEST_BRIGHTNESS_HIGH_THRESH:
        brightness_score = 1.0
    elif bm < BEST_BRIGHTNESS_LOW_THRESH:
        # Lower brightness than threshold = lower score
        brightness_score = np.clip((bm - BRIGHTNESS_LOWER) / (BEST_BRIGHTNESS_LOW_THRESH - BRIGHTNESS_LOWER), MIN_SCORE, MAX_SCORE)
    else:
        # Higher brightness than threshold = lower score
        brightness_score = np.clip(1.0 - (BEST_BRIGHTNESS_HIGH_THRESH - bm) / (BRIGHTNESS_HIGHER - BEST_BRIGHTNESS_HIGH_THRESH), MIN_SCORE, MAX_SCORE)

    final_score = (
        hue_score        * 0.35 +
        purity_score     * 0.30 +
        brown_score      * 0.20 +
        uniformity_score * 0.10 +
        brightness_score * 0.05
    )

    sub_scores = {
        "hue_score":        round(hue_score, 2),
        "purity_score":     round(purity_score, 2),
        "brown_score":      round(brown_score, 2),
        "uniformity_score": round(uniformity_score, 2),
        "brightness_score": round(brightness_score, 2),
        "valid_pixels": round(valid_pixels, 2)
    }

    return round(float(final_score), 2), sub_scores

def main():
    if len(sys.argv) > 1:
        #BANG_BWM_01
        # species, location, img_no = sys.argv[1].split("_")
        img_path = f"gill_example.jpg"
        segment_gills(img_path, True)
    else:
        rows = []
        folder_path = "dataset/gills"
        num_files = 0
        for file in Path(folder_path).rglob("*.jpg"):
            # Quick debug
            # if (species == "Tilapia" or species == "Carp"):
            #     continue
            # if num_files == 10:
            #     break
            # num_files += 1

            stem = file.stem
            species, location = file.relative_to(folder_path).parts[:2]

            img_path = f"{folder_path}/{species}/{location}/{file.name}"

            result, final_mask, color = segment_gills(img_path)

            if result is None or final_mask is None:
                print("Skipping due to read error: ", file)
                continue
            spec, loc, num, _ = stem.split("_")
            save(f"{spec}_{loc}_{num}_result", result, f"{file_dir}/results")

            features = extract_gill_features(result, final_mask)
            # gill_score, sub_score = score_gills(features)

            rows.append({
                "spec": spec,
                "loc": loc,
                "num": num,
                "color": color,
                # **features,
                # **sub_score
                # "gill_score": gill_score,
            })
        df = pd.DataFrame(rows)
        print(df.describe())
        df.to_csv(f"{file_dir}/gill_scores_final.csv", index=False, float_format="%.3f")

    print("Done processing.")
        
if __name__ == "__main__":
    main()
    # save_from_twodirs("analyzeGills/results2", "analyzeGills/plain_masks")
