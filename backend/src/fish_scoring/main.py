from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from contextlib import asynccontextmanager
import logging
import numpy as np

from preprocessing import image_utils, error_validator
from segmentation import fish_segmenter, eye_segmenter, gill_segmenter
from features import eye_features, body_features, gill_features, ml_features
from scoring import eye_scorer, body_scorer, gill_scorer, rule_scorer, final_scorer
from predicting import classifier, evaluator
from config import DEFAULT_GILL_FEATS

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    print("Loading models...")
    fish_segmenter._load_segmenter()
    classifier._load_classifier()
    evaluator._load_evaluator()
    error_validator._load_validator()
    print("Ready!")

    yield  # Application runs here

    print("Shutting down...")

app = FastAPI(
    lifespan=lifespan,
    title = "Fish Surface Quality Assessment",
    version = "1.0.0",
    description = "Analyze fish surface quality using deep learning + rule-based scoring",
)

# For handling features wrapper    
def _to_serializable(d):
    return {k: float(v) if isinstance(v, np.float32) else v for k, v in d.items()}

def _build_incomplete_response(*, has_fish, has_gills, has_eyes, message):
    return JSONResponse(
        status_code=200,
        content={
            "success": False,
            "has_fish": has_fish,
            "has_gills": has_gills,
            "has_eyes": has_eyes,
            "message": message,
        }
    )


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
        result = await _run_pipeline(fish_image, gill_image, eye_image)
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Processing error {e}", exc_info=True)
        raise HTTPException(500, f"Processing failed: {str(e)}")
    return result


async def _run_pipeline(
    fish_image: UploadFile,
    gill_image: UploadFile | None,
    eye_image: UploadFile | None,
):   
    #Decode Images

    print("Reading image")
    fish_img = _decode_or_raise(await fish_image.read(), "Fish image could not be decoded.")
    # Image Error Handling
    print("Validating image")
    error_validation_result = error_validator.validate_image(fish_img)
    if (error_validation_result is not None):
        return JSONResponse(
            status_code=200,
            content={
                "success": False,
                "status": error_validation_result["status"],
                "message" : error_validation_result["message"],
                "confidence": error_validation_result["confidence"],
            }
        )

    print("Processing image")
    has_gills, gill_feats, gill_img = await _process_gill(gill_image)
    eye_provided = eye_image is not None

    # Segment Fish Body and optional Eye      
    if eye_provided:
        _, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)
        eye_roi = _decode_or_raise(await eye_image.read(), "Eye image could not be decoded.")
    else:
        head_roi, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)
        eye_roi = eye_segmenter.segment(head_roi)
        eye_roi = image_utils.resize_eyes(eye_roi) if eye_roi is not None else None

    has_eyes = eye_roi is not None

    if body_roi is None:
        return JSONResponse(
            status_code=200,
            content={
                "success": False,
                "status": "MISSING_BODY",
                "message" : "Fish body could not be segmented.",
            }
        )
    image_utils.save("body_roi", body_roi)

    if eye_roi is None:
        return JSONResponse(
            status_code=200,
            content={
                "success": False,
                "status": "MISSING_EYE",
                "message" : "Fish eye could not be segmented.",
            }
        )
    image_utils.save("eye_roi", eye_roi)
    
    previews = {
        "body": image_utils.encode_preview(body_roi),
        "gill": image_utils.encode_preview(gill_img),
        "eye": image_utils.encode_preview(eye_roi),
    }

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

    #Response
    print({
        "has_fish": True,
        "has_gills": has_gills,
        "has_eyes": has_eyes,
        "species": species,
        "features": {
            "eye": _to_serializable(eye_feats),
            "body": _to_serializable(body_feats),
            "gill": _to_serializable(gill_feats),
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

    return JSONResponse(
        status_code=200,
        content={
        "success": True,
        "has_fish": True,
        "has_gills": has_gills,
        "has_eyes": has_eyes,
        "species": species,
        "features": {
            "eye": _to_serializable(eye_feats),
            "body": _to_serializable(body_feats),
            "gill": _to_serializable(gill_feats),
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
        "previews": previews,
    })

def _decode_or_raise(image_bytes, error_message):
    img = image_utils.decode_image(image_bytes)
    if img is None:
        raise HTTPException(status_code=400, detail=error_message)
    return img

async def _process_gill(gill_image: UploadFile | None):
    if gill_image is None:
        return False, DEFAULT_GILL_FEATS, None
 
    gill_img = image_utils.decode_image(await gill_image.read())
 
    if gill_img is None:
        logger.warning("Gill image could not be decoded; using defaults.")
        return None, False, DEFAULT_GILL_FEATS, None
 
    gill_img = image_utils.resize_gills(gill_img)
    image_utils.save("gill_roi", gill_img)
    gill_enhanced = image_utils.apply_clahe(gill_img)
    gill_roi, gill_mask, _ = gill_segmenter.segment(gill_enhanced, gill_img)
    gill_feats   = gill_features.extract(gill_roi, gill_mask)
 
    return True, gill_feats, gill_roi