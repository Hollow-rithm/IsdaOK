from scoring import normalizer
import numpy

def compute(body_feats, species):
    color = body_feats["body_color_b"]
    color_score = normalizer.normalize(color, "body_color_b", species)
    color_score = (1 - color_score)

    sc = body_feats["shine_coverage"]
    sc_score = normalizer.normalize(sc, "shine_coverage", species)

    si = body_feats["shine_intensity"]
    si_score = normalizer.normalize(si, "shine_intensity", species)

    shine_score = (sc_score * 0.6) + (si_score * 0.4)
    body_score = (
        shine_score * 0.7 +
        color_score * 0.3
    )

    return round(float(body_score), 3)