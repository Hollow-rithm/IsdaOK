import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
_model = None
_metadata = None

def _load_evaluator():
    global _model, _metadata

    if _model is not None:
        return
    
    print("Loading evaluation model...")

    import joblib

    _model = joblib.load(BASE_DIR / "artifacts" / "quality_model.pkl")
    _metadata = joblib.load(BASE_DIR / "artifacts" / "quality_model_metadata.pkl")

    print(f"Evaluator model loaded..")

def predict(features):
    _load_evaluator()
    X = pd.DataFrame([features])
    X = X[_metadata["features"]]
    quality = int(_model.predict(X)[0])
    if quality == 0:
        quality = "high"
    elif quality == 1:
        quality = "mid"
    elif quality == 2:
        quality = "low"
    else:
        quality = "unknown"
    return quality

def is_loaded():
    return _model is not None