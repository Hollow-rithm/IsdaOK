import joblib
import pandas as pd
from pathlib import Path

from sklearn.preprocessing import LabelEncoder
import numpy as np

BASE_DIR = Path(__file__).resolve().parent.parent
model = joblib.load(BASE_DIR / "artifacts" / "quality_model.pkl")
metadata = joblib.load(BASE_DIR / "artifacts" / "quality_model_metadata.pkl")
print(metadata["features"])

feature_names = metadata["features"]

def predict(features):
    X = pd.DataFrame([features])
    X = X[metadata["features"]]
    quality = int(model.predict(X)[0])
    if quality == 0:
        quality = "high"
    elif quality == 1:
        quality = "mid"
    elif quality == 2:
        quality = "low"
    else:
        quality = "unknown"
    return quality