from scoring import normalizer
import numpy as np

def compute(eye_feats, species):
    # Local Binary Pattern, Lower = Better for Tilapia, Higher = Better for Bangus and Carp
    if species == "tilapia":
        lbp_score = (1.0 - normalizer.normalize(eye_feats["lbp_texture_score"], "lbp_texture_score", species))
    else:
        lbp_score = normalizer.normalize(eye_feats["lbp_texture_score"], "lbp_texture_score", species)

    # Canny Edge Density, Higher = Better
    ced_score = normalizer.normalize(eye_feats["canny_edge_density"], "canny_edge_density", species)
    
    # Mean Saturation, Lower = Better
    ms_score = (1.0 - normalizer.normalize(eye_feats["mean_saturation"], "mean_saturation", species))
    
    # Mean Lab a, Lower = Better
    lab_a_score = (1.0 - normalizer.normalize(eye_feats["lab_a_mean"], "lab_a_mean", species))

    # Red Ratio, Lower = Better
    rr_score = (1.0 - normalizer.normalize(eye_feats["red_ratio"], "red_ratio", species))
    
    eye_score = (
        lbp_score * 0.30 +
        ced_score * 0.25 +
        ms_score * 0.15 +
        lab_a_score * 0.15 +
        rr_score * 0.15
    )
    
    return round(float(eye_score), 3)
