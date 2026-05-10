from fastapi.responses import JSONResponse

from preprocessing import image_utils
from segmentation import fish_segmenter, gill_segmenter
from features import eye_features, body_features, gill_features
from scoring import eye_scorer, body_scorer, gill_scorer, rule_scorer, final_scorer
from species import classifier
from quality import evaluator

def analyze(fish_img, gill_img, eye_roi):
    print("has eyes.")
    gill_img = image_utils.resize_gills(gill_img)
    gill_enhanced = image_utils.apply_clahe(gill_img)

    # Segmentation
    gill_roi, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_img)
    _, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)

    # Feature Extraction
    if body_roi is None or eye_roi is None:
        return JSONResponse({
            "has_fish": False,
        })
    
    gill_feats = gill_features.extract(gill_roi, gill_mask)
    body_feats = body_features.extract(body_roi)
    eye_feats = eye_features.extract(eye_roi)

    # Add Cloudiness Feature / Delete Some Features
    eye_feats, body_feats = eye_features.enrich(eye_feats, body_feats) 

    # ML Species Prediction
    base_features = {
        "hue_mean": gill_feats["hue_mean"],
        "redness_purity": gill_feats["redness_purity"],
        "brightness_mean": gill_feats["brightness_mean"],
        "brown_dominance": gill_feats["brown_dominance"],
        "color_cov": gill_feats["color_cov"],
        "red_intensity": eye_feats["red_intensity"],
        "red_coverage": eye_feats["red_coverage"],
        "eye_cloudiness": eye_feats["eye_cloudiness"],
        "shine_coverage": body_feats["shine_coverage"],
        "shine_intensity": body_feats["shine_intensity"],
        "body_color_b": body_feats["body_color_b"],
    }
    species_features = {
        **base_features,
        "aspect_ratio": aspect_ratio,
    }
    species = classifier.predict(species_features)
    quality_features = {
        **base_features,
        "species": species
    }
    ml_quality = evaluator.predict(quality_features)
    species = classifier.num_to_species(species)

    # Scoring
    gill_score = gill_scorer.compute(gill_feats)
    eye_score = eye_scorer.compute(eye_feats, species)
    body_score = body_scorer.compute(body_feats, species)

    # Final Scoring
    rule_score, rule_quality = rule_scorer.compute(gill_score, eye_score, body_score)
    final_quality = final_scorer.compute(rule_score, rule_quality, ml_quality)
    return JSONResponse({
        "has_fish": True,
        "has_gills": True,
        "has_eyes": True,
        "species": species,
        # "features": {
        #     "eye": eye_feats,
        #     "body": body_feats,
        #     "gill": gill_feats,
        # },
        "scores": {
            "eye_score": eye_score,
            "body_score": body_score,
            "gill_score": gill_score,
        },
        "rule_score": rule_score,
        "rule_quality" : rule_quality,
        "ml_quality": ml_quality,
        "final_quality": final_quality,
    })