# from fastapi import FastAPI, File, UploadFile, HTTPException
# from fastapi.responses import JSONResponse
# import logging

# from preprocessing import image_utils
# from segmentation import fish_segmenter
# from segmentation import roi_splitter
# from segmentation import eye_segmenter
# from segmentation import gill_segmenter
# from features import eye_features, body_features, gill_features
# from scoring import eye_scorer, body_scorer, gill_scorer
# from models import evaluator
# from species import classifier

# app = FastAPI(
#     title = "Fish Surface Quality Assessment",
#     version = "1.0.0",
#     description = "Analyze fish surface quality using deep learning + rule-based scoring",
# )
# logger = logging.getLogger(__name__)

# @app.get("/health")
# async def health_check():
#     return {
#         "status": "healthy",
#         "segmenter_loaded": fish_segmenter.is_loaded(),
#         "evaluator_loaded": evaluator._evaluator is not None,
#     }

# @app.post("api/fish/analyze")
# async def analyze_fish(
#     fish_image: UploadFile = File(...),
#     gill_image: UploadFile = File(None)
# ):
#     try:
#         fish_bytes = await fish_image.read()
#         fish_img = image_utils.decode_image(fish_bytes)

#         if fish_img is None:
#             raise HTTPException(400, "fish_img could not be decoded")
        
#         gill_img = None
#         has_gills = False

#         if gill_img:
#             gill_bytes = await gill_image.read()
#             gill_img = image_utils.decode_image(gill_bytes)
#             has_gills = gill_img is not None

#         # Preprocess
        
#         if gill_img is not None:
#             gill_img = image_utils.resize_gills(gill_img)
#             gill_enhanced = image_utils.apply_clahe(gill_img)

#         # Segmentation
#         gill_result, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_img)
        
#         # Feature Extraction
#         gill_feats = gill_features.extract(gill_result, gill_mask)

#         # Scoring
#         gill_score = gill_scorer.score(gill_feats)

#         return JSONResponse({
#             "has_fish": True,
#             "species": species,
#             "features": {
#                 "eye": eye_feats,
#                 "body": body_feats,
#                 "gill": gill_feats
#             },
#             "rule_score": rule_score,
#             "rule_quality" : rule_quality,
#             "ml_quality": ml_quality,
#             "final_quality": final_quality,
#             "has_gills": has_gills,
#         })
    
#     except HTTPException:
#         raise
#     except Exception as e:
#         logger.error(f"Processing error {e}", exc_info=True)
#         raise HTTPException(500, f"Processing failed: {str(e)}")
    
def save(name, img, dir="eye_debug"):
    import os
    import cv2 as cv
    os.makedirs(dir, exist_ok=True)
    if img is None:
        return
    out = img.copy()
    h, w = out.shape[:2]
    scale = min(800 / w, 800 / h, 1.0)
    if scale < 1.0:
        out = cv.resize(out, (int(w * scale), int(h * scale)))
    cv.imwrite(f"{dir}/{name}.jpg", out)

def main():
    import cv2 as cv
    from segmentation import fish_segmenter, eye_segmenter, gill_segmenter
    from features import body_features, eye_features, gill_features
    from scoring import gill_scorer, eye_scorer, body_scorer, rule_scorer
    from preprocessing import image_utils

    img_path = "TILA_BWM_06"
    spec = img_path.split("_")[0]
    if spec == "TILA":
        species = "tilapia"
    elif spec == "BANG":
        species = "bangus"
    elif spec == "CARP":
        species = "carp"
    else:
        species = "unknown"
    
    fish_image = cv.imread(f"dataset/full/{img_path}_FULL.jpg")
    gill_image = cv.imread(f"dataset/gills/{img_path}_GILLS.jpg")
    gill_image = image_utils.resize_gills(gill_image)
    gill_enhanced = image_utils.apply_clahe(gill_image)

    # Segment   
    gill_result, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_image)
    head_roi, body_roi = fish_segmenter.segment(fish_image)
    eye_roi = eye_segmenter.segment(head_roi)

    # Features
    gill_feats = gill_features.extract(gill_result, gill_mask)
    eye_feats = eye_features.extract(eye_roi)
    body_feats = body_features.extract(body_roi)

    # Add Cloudiness Feature / Delete Some Features
    eye_feats, body_feats = eye_features.enrich(eye_feats, body_feats)
    
    # Scoring
    gill_score = gill_scorer.compute(gill_feats)
    eye_score = eye_scorer.compute(eye_feats, species)
    body_score = body_scorer.compute(body_feats, species)

    # Final Scoring
    rule_score, rule_quality = rule_scorer.compute(gill_score, eye_score, body_score)

    print({
            "has_fish": True,
            "species": species,
            "features": {
                "eye": eye_feats,
                "body": body_feats,
                "gill": gill_feats
            },
            "rule_score": rule_score,
            "rule_quality" : rule_quality,
        })

if __name__ == "__main__":
    # main()
    import cv2 as cv
    from segmentation import fish_segmenter, eye_segmenter, gill_segmenter
    from features import body_features, eye_features, gill_features
    from pathlib import Path
    import csv
    from scoring import gill_scorer, eye_scorer, body_scorer, rule_scorer
    from preprocessing import image_utils
    # import pandas as pd

    rows = []
    folder_path = "dataset/full"
    counter = 0
    for file in Path(folder_path).iterdir():
        # print(file.stem)
        # if counter == 6:
        #     break
        # counter += 1
        print(f"Processing {file.name}")
        stem = file.stem
        fish_path = f"{folder_path}"
        gill_path = f"{folder_path}/../gills/"
        spec, loc, num, _ = stem.split("_")

        if spec == "TILA":
            species = "tilapia"
        elif spec == "BANG":
            species = "bangus"
        elif spec == "CARP":
            species = "carp"
        else:
            species = "unknown"

        fish_image = cv.imread(f"{fish_path}/{file.name}")
        gill_image = cv.imread(f"{gill_path}/{spec}_{loc}_{num}_GILLS.jpg")
        gill_image = image_utils.resize_gills(gill_image)
        gill_enhanced = image_utils.apply_clahe(gill_image)

        # print("Segmenting.")
        # Segment
        gill_roi, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_image)
        head_roi, body_roi, aspect_ratio = fish_segmenter.segment(fish_image)
        eye_roi = eye_segmenter.segment(head_roi)

        # print("Feature Extraction..")
        # Features
        if body_roi is None or eye_roi is None:
            print(f"Passing {file.name}")
            rows.append({
                "spec": spec,
                "loc": loc,
                "num": num,
                "rule_quality": "none",
            })
            continue
        gill_feats = gill_features.extract(gill_roi, gill_mask)
        body_feats = body_features.extract(body_roi)
        eye_feats = eye_features.extract(eye_roi)

        # Add Cloudiness Feature / Delete Some Features
        eye_feats, body_feats = eye_features.enrich(eye_feats, body_feats) 
        
        # Scoring
        gill_score = gill_scorer.compute(gill_feats)
        eye_score = eye_scorer.compute(eye_feats, species)
        body_score = body_scorer.compute(body_feats, species)

        # Final Scoring
        rule_score, rule_quality = rule_scorer.compute(gill_score, eye_score, body_score)

        # print("Appending...")
        rows.append({
            "spec": spec,
            "loc": loc,
            "num": num,
            "aspect_ratio": aspect_ratio,
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
            "gill_score": gill_score,
            "eye_score": eye_score,
            "body_score": body_score,
            "rule_score": rule_score,
            "rule_quality": rule_quality,
            # "hue_score": gill_score["hue_score"],
            # "purity_score": gill_score["purity_score"],
            # "brown_score": gill_score["brown_score"],
            # "uniformity_score": gill_score["uniformity_score"],
            # "brightness_score": gill_score["brightness_score"],
            # "final_score": gill_score["final_score"],
        })
    # df = pd.DataFrame(rows)
    # print(df.describe())

    output_path = "csvs/rule_scoring2.csv"
    # get column names from the first row
    fieldnames = rows[0].keys() if rows else []

    Path("csvs").mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)

        writer.writeheader()
        for row in rows:
            writer.writerow({
                **row,
            })