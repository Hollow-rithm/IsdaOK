import numpy as np

from config import MAX_SCORE, MIN_SCORE, HUE_LOWER, HUE_UPPER, PURITY_LOWER, PURITY_UPPER, BROWN_LOWER, BROWN_UPPER, COV_LOWER, COV_UPPER, BEST_BRIGHTNESS_LOW_THRESH, BEST_BRIGHTNESS_HIGH_THRESH, BRIGHTNESS_LOWER, BRIGHTNESS_HIGHER

def compute(features):
    valid_pixels = features["valid_pixels"]
    if valid_pixels < 100:
        return 0.0, {}

    # Sub-score 1: Hue mean (lower = redder = fresher)
    # Range_1: 0 (pure red) to 20(brownish). Invert so low hue = high score.
    # Range_2: 180 = 0 (pure red) to 168 (pinkish)
    hm = features["hue_mean"]
    if hm > 90.0:
        hm = 180.0 - hm
    hue_score = np.clip(MAX_SCORE - (hm - HUE_LOWER) / (HUE_UPPER - HUE_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 2: Red purity (Mean Saturation)
    # Range: 50 (dull stale) to 200 (vibrant fresh)
    rp = features["redness_purity"]
    purity_score = np.clip((rp - PURITY_LOWER) / (PURITY_UPPER - PURITY_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 3: Brown dominance penalty (Brown ratio from segmented gills)
    # Range: 0.0 (no brown) to 0.90 (highly brown). low brown dominance = high score
    bd = features["brown_dominance"]
    brown_score = np.clip(MAX_SCORE - (bd - BROWN_LOWER) / (BROWN_UPPER - BROWN_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 4: Color/Saturation Coefficient of Variance (low = uniform = fresher)
    # Range: 0.20 (uniform) to 0.60 (patchy)
    cov = features["color_cov"]
    uniformity_score = np.clip(MAX_SCORE - (cov - COV_LOWER) / (COV_UPPER - COV_LOWER), MIN_SCORE, MAX_SCORE)

    # Sub-score 5: Brightness penalty
    # Penalize low brightness (<60) or too bright (>210)
    bm = features["brightness_mean"]

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
        hue_score        * 0.40 +
        purity_score     * 0.25 +
        brown_score      * 0.25 +
        uniformity_score * 0.10 +
        brightness_score * 0.00
    )
    return round(float(final_score), 3)
    # return {
    #     "hue_score": hue_score,
    #     "purity_score": purity_score,
    #     "brown_score": brown_score,
    #     "uniformity_score": uniformity_score,
    #     "brightness_score": brightness_score,
    #     "final_score": final_score,
    # }