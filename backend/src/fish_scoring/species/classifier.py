import joblib
import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
model = joblib.load(BASE_DIR / "artifacts" / "species_model.pkl")
metadata = joblib.load(BASE_DIR / "artifacts" / "species_model_metadata.pkl")

feature_names = metadata["features"]

def predict(features):
    X = pd.DataFrame([features])
    X = X[metadata["features"]]
    species = int(model.predict(X)[0])
    return species

def predict_dataset(dataset_filepath):
    data = pd.read_csv(dataset_filepath)
    new_data = data.copy()

    features = data.iloc[:, 3:-1]

    prediction = model.predict(features)

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