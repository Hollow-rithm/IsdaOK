def quality_extract(body_feats, eye_feats, gill_feats):
    return {
        "shine_coverage": body_feats["shine_coverage"],
        "shine_intensity": body_feats["shine_intensity"],
        "body_color_b": body_feats["body_color_b"],
        "body_L": body_feats["body_L"],
        "lbp_texture_score": eye_feats["lbp_texture_score"],
        "canny_edge_density": eye_feats["canny_edge_density"],
        "mean_saturation": eye_feats["mean_saturation"],
        "hue_mean": gill_feats["hue_mean"],
        "redness_purity": gill_feats["redness_purity"],
        "brown_dominance": gill_feats["brown_dominance"],
    }

def species_extract(body_feats, eye_feats, gill_feats, aspect_ratio):
    return {
        "aspect_ratio": aspect_ratio,	
        "shine_coverage": body_feats["shine_coverage"],	
        "shine_intensity": body_feats["shine_intensity"],	
        "body_color_b": body_feats["body_color_b"],	
        "body_L": body_feats["body_L"],	
        "mean_saturation": eye_feats["mean_saturation"],	
        "lab_a_mean": eye_feats["lab_a_mean"],	
        "red_ratio": eye_feats["red_ratio"],	
        "hue_mean": gill_feats["hue_mean"],	
        "brightness_mean": gill_feats["brightness_mean"],
    }