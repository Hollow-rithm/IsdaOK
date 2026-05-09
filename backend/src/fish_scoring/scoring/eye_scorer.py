from scoring import normalizer
import numpy as np

def compute(eye_feats, species):
    ec = eye_feats["eye_cloudiness"]
    ec_score = normalizer.normalize(ec, "eye_cloudiness", species)
    ec_score = (1 - ec_score)

    ri = eye_feats["red_intensity"]
    ri_score = normalizer.normalize(ri, "red_intensity", species)
    ri_score = (1 - ri_score)

    rc = eye_feats["red_coverage"]
    rc_score = normalizer.normalize(rc, "red_coverage", species)
    rc_score = (1 - rc_score)
    
    eye_score = (
        ec_score * 0.35 +
        ri_score * 0.35 +
        rc_score * 0.3
    )

    return round(float(eye_score), 3)
