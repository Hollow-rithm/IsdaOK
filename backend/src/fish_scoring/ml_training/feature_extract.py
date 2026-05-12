import cv2 as cv
from pathlib import Path
import os
import pandas as pd
import numpy as np

from preprocessing import image_utils
from segmentation import fish_segmenter, eye_segmenter, gill_segmenter
from features import eye_features, body_features, gill_features
from scoring import eye_scorer, body_scorer, gill_scorer, rule_scorer

def crop_and_save(name, img, dir="feature_training/segment/segmented_eyes"):
    import os
    import cv2 as cv

    if img is None or img.size == 0:
        return

    os.makedirs(dir, exist_ok=True)

    # Faster grayscale
    gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY) if len(img.shape) == 3 else img

    # Binary mask of foreground
    _, mask = cv.threshold(gray, 1, 255, cv.THRESH_BINARY)

    # Get bounding box directly
    x, y, w, h = cv.boundingRect(mask)

    if w == 0 or h == 0:
        return

    # Crop ROI
    out = img[y:y+h, x:x+w]

    # Resize only if larger than max size
    max_dim = 800
    h, w = out.shape[:2]

    if h > max_dim or w > max_dim:
        scale = min(max_dim / w, max_dim / h)
        new_size = (int(w * scale), int(h * scale))
        out = cv.resize(out, new_size, interpolation=cv.INTER_AREA)

    cv.imwrite(f"{dir}/{name}.jpg", out)

    return out

def main():
    file_path = "feature_training/dataset/Fish"
    rows = []
    for file in Path(file_path).iterdir():
        print(f"{file_path}/{file.name}")
        fish_img = cv.imread(f"{file_path}/{file.name}")
        spec, loc, no, _ = file.stem.split("_")
        gill_img = cv.imread(f"{file_path}/../Gills/{spec}_{loc}_{no}_GILLS.jpg")
        head_roi, body_roi, aspect_ratio = fish_segmenter.segment(fish_img)
        if body_roi is None:
            print(f"No body. Passing {file.name}")
            continue
        eye_roi = eye_segmenter.segment(head_roi)
        if eye_roi is None:
            print(f"No eye. Passing {file.name}")
            continue
        gill_img = image_utils.resize_gills(gill_img)
        gill_enhanced = image_utils.apply_clahe(gill_img)
        gill_roi, gill_mask, coverage = gill_segmenter.segment(gill_enhanced, gill_img)

        eye_roi = crop_and_save(f"{spec}_{loc}_{no}", eye_roi, "feature_training/segments/eye")
        _ = crop_and_save(f"{spec}_{loc}_{no}", gill_roi, "feature_training/segments/gill")
        _ = crop_and_save(f"{spec}_{loc}_{no}", body_roi, "feature_training/segments/body")

        body_feats = body_features.extract(body_roi)
        eye_feats = eye_features.extract(eye_roi)
        gill_feats = gill_features.extract(gill_roi, gill_mask)

        if spec == "TILA":
            species = "tilapia"
        elif spec == "CARP":
            species = "carp"
        elif spec == "BANG":
            species = "bangus"
        else:
            species = "unknown"
        body_score = body_scorer.compute(body_feats, species)
        eye_score = eye_scorer.compute(eye_feats, species)
        gill_score = gill_scorer.compute(gill_feats)

        rule_score, rule_quality = rule_scorer.compute(gill_score, eye_score, body_score)
        rows.append({
            "spec": spec,
            "loc": loc,
            "no": no,
            "aspect_ratio": aspect_ratio,
            **body_feats,
            **eye_feats,
            **gill_feats,
            "body_score": body_score,
            "eye_score": eye_score,
            "gill_score": gill_score,
            "rule_quality": rule_quality,
        })
    df = pd.DataFrame(rows)
    df.to_csv(f"feature_training/ml_features_new_eye_more.csv", index=False, float_format="%.3f")


if __name__ == "__main__":
    main()