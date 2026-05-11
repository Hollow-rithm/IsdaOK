import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
_model = None
_metadata = None

def _load_classifier():
    global _model, _metadata

    if _model is not None:
        return
    
    print("Loading classification model...")

    import joblib

    _model = joblib.load(BASE_DIR / "artifacts" / "species_model.pkl")
    _metadata = joblib.load(BASE_DIR / "artifacts" / "species_model_metadata.pkl")

    print(f"Classifier model loaded..")

def predict(features):
    _load_classifier()
    X = pd.DataFrame([features])
    X = X[_metadata["features"]]
    species = int(_model.predict(X)[0])
    return species

def predict_dataset(dataset_filepath):
    data = pd.read_csv(dataset_filepath)
    new_data = data.copy()

    features = data.iloc[:, 3:-1]

    prediction = _model.predict(features)

    new_data["prediction"] = prediction
    new_data.to_csv("species_predictions.csv", index=False)

    print("Predictions saved to species_predictions.csv")
    return

def num_to_species(num):
    if num == 0:
        species = "bangus"
    elif num == 1:
        species = "carp"
    elif num == 2:
        species = "tilapia"
    else:
        species = "unknown"
    return species

def is_loaded():
    return _model is not None