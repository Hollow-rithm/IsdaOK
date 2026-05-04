from fastapi import FastAPI, File, UploadFile
import numpy as np
import cv2 as cv
import joblib
from typing import Optional

app = FastAPI()

model = joblib.load("quality_model.pkl")

@app.post("/process_fish")
async def image_analysis(fish_image: UploadFile = File(...),
                         gill_image: Optional[UploadFile] = File(None),
                         eye_image: Optional[UploadFile] = File(None)):
    
    data = await fish_image.read()

    image_bfr = np.frombuffer(data, np.uint8)
    img = cv.imdecode(image_bfr, cv.IMREAD_COLOR)

    if img is None:
        # returns a json
        return {"error" : "Image decoding failed"}

    # Test
    sample_features = [0.61723,0.354569,56,0.472635,164,0.478455,0.087595,0.339651,0]
    ml_score = float(model.predict([sample_features])[0])

    rule_score = 0.70
    final_score = (ml_score * 0.6) + (rule_score * 0.4)
    quality = "HIGH" if final_score >= 0.75 else "MEDIUM" if final_score >= 0.5 else "LOW"
    
    return {
        "has_fish": True,
        "species": "Tilapia",
        "ml_score": round(ml_score, 2),
        "features": {
            "eye_score": 0.70,
            "gill_score": 0.65,
            "body_score": 0.72,
        },
        "final_score": round(final_score, 2),
        "quality": quality,
    }

# placeholder route for predict.py
@app.post("/predict")
async def predict():
    sample_features = [0.61723,0.354569,56,0.472635,164,0.478455,0.087595,0.339651,0]

    result = model.predict([sample_features])

    print(f"Prediction: {result}")

    return {"prediction": result.tolist()}
