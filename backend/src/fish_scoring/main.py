from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
import logging
import numpy as np

from preprocessing import image_utils
from segmentation import fish_segmenter, eye_segmenter, gill_segmenter
from features import eye_features, body_features, gill_features, ml_features
from scoring import eye_scorer, body_scorer, gill_scorer, rule_scorer, final_scorer
from predicting import classifier, evaluator

app = FastAPI(
    title = "Fish Surface Quality Assessment",
    version = "1.0.0",
    description = "Analyze fish surface quality using deep learning + rule-based scoring",
)
logger = logging.getLogger(__name__)

@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "segmenter_loaded": fish_segmenter.is_loaded(),
        "classifier_loaded": classifier.is_loaded(),
        "evaluator_loaded": evaluator.is_loaded(),
    }

@app.post("/api/fish/analyze")
async def analyze_fish(
    fish_image: UploadFile = File(...),
    gill_image: UploadFile = File(None),
    eye_image: UploadFile = File(None)
):
    try:
        fish_bytes = await fish_image.read()
        fish_img = image_utils.decode_image(fish_bytes)

        if fish_img is None:
            raise HTTPException(400, "Fish image could not be decoded")
        
        gill_img = None
        eye_roi = None
        has_gills = False
        has_eyes = False
        
        if gill_image:
            gill_bytes = await gill_image.read()
            gill_img = image_utils.decode_image(gill_bytes)
            if gill_img is None:
                return JSONResponse({
                    "has_fish": True,
                    "has_gills": False,
                    "has_eyes": eye_image is not None,
                    "message": "Gill image missing"
                })
            has_gills = gill_img is not None
            gill_img = image_utils.resize_gills(gill_img)
            image_utils.save("gill_roi", gill_img)
            gill_enhanced = image_utils.apply_clahe(gill_img)
            gill_roi, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_img)
            gill_feats = gill_features.extract(gill_roi, gill_mask)
        else:
            gill_feats = {
                "hue_mean": 10.0,
                "redness_purity": 145.0,
                "brightness_mean": 100.0,
                "brown_dominance": 0.25,
                "color_cov": 0.325,
                "valid_pixels": 5000,
            }
            has_gills = False

        # Segmentation        
        if eye_image:
            _, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)
            eye_bytes = await eye_image.read()
            eye_roi = image_utils.decode_image(eye_bytes)
        else:
            head_roi, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)
            eye_roi = eye_segmenter.segment(head_roi)
            eye_roi = image_utils.resize_eyes(eye_roi)
        has_eyes = eye_roi is not None

        if body_roi is None:
            return JSONResponse({
                "has_fish": False,
                "has_gills": has_gills,
                "has_eyes": eye_roi is not None,
                "message": "Gill image missing"
            })
        image_utils.save("body_roi", body_roi)
        has_fish = True
        if eye_roi is None:
            return JSONResponse({
                "has_fish": has_fish,
                "has_gills": has_gills,
                "has_eyes": False,
                "message": "Eye image missing"
            })
        image_utils.save("eye_roi", eye_roi)
        
        # Feature Extraction
        body_feats = body_features.extract(body_roi)
        eye_feats = eye_features.extract(eye_roi)

        # # ML Species Prediction
        species = classifier.predict(ml_features.species_extract(body_feats, eye_feats, gill_feats, aspect_ratio))
        ml_quality = evaluator.predict(ml_features.quality_extract(body_feats, eye_feats, gill_feats))
        species = classifier.num_to_species(species)

        # Scoring
        gill_score = gill_scorer.compute(gill_feats)
        eye_score = eye_scorer.compute(eye_feats, species)
        body_score = body_scorer.compute(body_feats, species)

        # Final Scoring
        rule_score, rule_quality = rule_scorer.compute(gill_score, eye_score, body_score)
        final_quality = final_scorer.compute(rule_score, rule_quality, ml_quality)

        print({
            "has_fish": True,
            "has_gills": has_gills,
            "has_eyes": has_eyes,
            "species": species,
            "features": {
                "eye": jsonify(eye_feats),
                "body": jsonify(body_feats),
                "gill": jsonify(gill_feats),
            },
            "scores": {
                "eye_score": eye_score * 100,
                "body_score": body_score * 100,
                "gill_score": gill_score * 100,
            },
            "rule_score": rule_score * 100,
            "rule_quality" : rule_quality,
            "ml_quality": ml_quality,
            "final_quality": final_quality,
        })
        return JSONResponse({
            "has_fish": True,
            "has_gills": has_gills,
            "has_eyes": has_eyes,
            "species": species,
            "features": {
                "eye": jsonify(eye_feats),
                "body": jsonify(body_feats),
                "gill": jsonify(gill_feats),
            },
            "scores": {
                "eye_score": eye_score * 100,
                "body_score": body_score * 100,
                "gill_score": gill_score * 100,
            },
            "rule_score": rule_score * 100,
            "rule_quality" : rule_quality,
            "ml_quality": ml_quality,
            "final_quality": final_quality,
        })
    
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Processing error {e}", exc_info=True)
        raise HTTPException(500, f"Processing failed: {str(e)}")

# For handling features wrapper    
def jsonify(d):
    return {k: float(v) if isinstance(v, np.float32) else v for k, v in d.items()}