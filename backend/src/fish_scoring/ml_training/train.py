"""
===============================================================
  FISH SURFACE QUALITY ASSESSMENT — ML CLASSIFICATION PIPELINE
  Research: Species & Quality Classification using Random Forest
  Author: [Your Name]
  Target: Undergraduate Research Defense
===============================================================

IMPORTANT RESEARCH NOTE on Quality Labels:
  The quality labels (High / Medium / Low) used in this pipeline
  are OPERATIONAL (surrogate) labels derived from a rule-based
  scoring rubric applied to extracted image features. They are
  NOT scientifically validated freshness measurements (e.g.,
  TVB-N values, K-values, or sensory panel scores from subject
  matter experts). The purpose of the ML model here is to check
  whether the rule-based scoring pipeline is internally
  consistent and learnable — not to claim biological ground truth.
  This must be clearly stated in your thesis.
"""

# ─────────────────────────────────────────────
# 0.  IMPORTS
# ─────────────────────────────────────────────
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import joblib
import os
import warnings
warnings.filterwarnings("ignore")

from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier

from sklearn.model_selection import (
    train_test_split,
    StratifiedKFold,
    cross_validate,
)
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import (
    accuracy_score,
    balanced_accuracy_score,
    classification_report,
    confusion_matrix,
    ConfusionMatrixDisplay,
    f1_score,
)

# ─────────────────────────────────────────────
# 1.  CONFIGURATION  (edit these as needed)
# ─────────────────────────────────────────────

CSV_PATH        = "quality_data1.csv"   # path to your feature CSV
MODEL_DIR       = "models"              # folder where models are saved

# All feature columns extracted from images
FEATURE_COLS = [
    "hue_mean",
    "redness_purity",
    "brightness_mean",
    "brown_dominance",
    "color_cov",
    "red_intensity",
    "red_coverage",
    "eye_cloudiness",
    "shine_coverage",
    "shine_intensity",
    "body_color_b",
]

SPECIES_LABEL_COL = "species"    # column name for species label
QUALITY_LABEL_COL = "quality"    # column name for quality label (High/Medium/Low)

RANDOM_STATE = 42   # for reproducibility
TEST_SIZE    = 0.2  # 80% train, 20% test
N_FOLDS      = 5    # for stratified k-fold cross-validation

os.makedirs(MODEL_DIR, exist_ok=True)


# ─────────────────────────────────────────────
# 2.  DATA LOADING & PREPARATION
# ─────────────────────────────────────────────

def load_data(csv_path: str) -> pd.DataFrame:
    """
    Load the CSV file into a pandas DataFrame.
    Raises a clear error if the file is not found.
    """
    if not os.path.exists(csv_path):
        raise FileNotFoundError(
            f"CSV not found at '{csv_path}'. "
            "Please check your file path."
        )
    df = pd.read_csv(csv_path)
    print(f"Loaded dataset: {df.shape[0]} rows x {df.shape[1]} columns")
    return df


def prepare_features_and_labels(
    df: pd.DataFrame,
    feature_cols: list,
    label_col: str,
):
    """
    Separate features (X) from labels (y).
    Label-encode the target column so sklearn can use it.

    Returns:
        X          : numpy array of features
        y          : numpy array of encoded integer labels
        le         : fitted LabelEncoder (needed to decode predictions later)
        class_names: list of original class names in the order sklearn uses
    """
    # Drop rows where either features or the target label is missing
    cols_needed = feature_cols + [label_col]
    df_clean = df[cols_needed].dropna()

    missing = df.shape[0] - df_clean.shape[0]
    if missing > 0:
        print(f"WARNING: Dropped {missing} rows with missing values.")

    X = df_clean[feature_cols].values          # shape: (n_samples, n_features)

    le = LabelEncoder()
    y  = le.fit_transform(df_clean[label_col]) # integers: 0, 1, 2 ...

    class_names = [str(c) for c in le.classes_]
    print(f"   Label column  : '{label_col}'")
    print(f"   Classes found : {class_names}")
    print(f"   Class counts  :")
    for cls, count in zip(class_names, np.bincount(y)):
        print(f"     {cls}: {count}")

    return X, y, le, class_names


# ─────────────────────────────────────────────
# 3.  TRAIN / TEST SPLIT
# ─────────────────────────────────────────────

def split_data(X, y, test_size=TEST_SIZE, random_state=RANDOM_STATE):
    """
    Split data into training and test sets.
    stratify=y ensures each class is proportionally represented
    in both splits -- very important for imbalanced data (e.g., Carp).
    """
    X_train, X_test, y_train, y_test = train_test_split(
        X, y,
        test_size=test_size,
        stratify=y,             # keeps class proportions intact
        random_state=random_state,
    )
    print(f"\n   Train size: {len(X_train)} | Test size: {len(X_test)}")
    return X_train, X_test, y_train, y_test


# ─────────────────────────────────────────────
# 4.  MODEL DEFINITIONS
# ─────────────────────────────────────────────

def get_models():
    """
    Returns a dict of {model_name: model_instance}.

    - Random Forest  : main model; handles imbalance via class_weight='balanced'
    - Decision Tree  : simple baseline; single tree is interpretable
    - KNN            : distance-based baseline; no training phase

    All use class_weight='balanced' where supported to handle Carp's small
    sample size (52 samples vs 183-184 for the other classes).
    """
    return {
        "Random Forest": RandomForestClassifier(
            n_estimators=100,         # number of trees
            class_weight="balanced",  # compensates for imbalanced classes
            random_state=RANDOM_STATE,
            n_jobs=-1,                # use all CPU cores
        ),
        "Decision Tree": DecisionTreeClassifier(
            class_weight="balanced",
            random_state=RANDOM_STATE,
        ),
        "KNN": KNeighborsClassifier(
            n_neighbors=5,
            # KNN does not support class_weight; imbalance is handled
            # through stratified splitting and evaluation metrics instead
        ),
    }


# ─────────────────────────────────────────────
# 5.  EVALUATION HELPERS
# ─────────────────────────────────────────────

def print_evaluation(y_test, y_pred, class_names: list, model_name: str):
    """
    Print a full set of evaluation metrics:
    - Accuracy            : overall % correct (can be misleading on imbalance)
    - Balanced Accuracy   : mean recall per class (better for imbalance)
    - Macro F1            : F1 averaged equally across classes (penalizes poor minority class)
    - Weighted F1         : F1 averaged weighted by class support
    - Per-class report    : precision, recall, F1 per class
    """
    print(f"\n{'='*55}")
    print(f"  MODEL: {model_name}")
    print(f"{'='*55}")

    acc  = accuracy_score(y_test, y_pred)
    bacc = balanced_accuracy_score(y_test, y_pred)
    mf1  = f1_score(y_test, y_pred, average="macro")
    wf1  = f1_score(y_test, y_pred, average="weighted")

    print(f"  Accuracy          : {acc:.4f}")
    print(f"  Balanced Accuracy : {bacc:.4f}  <- prefer this for imbalanced data")
    print(f"  Macro F1          : {mf1:.4f}  <- penalizes poor minority class")
    print(f"  Weighted F1       : {wf1:.4f}  <- accounts for class size")
    print()
    print(classification_report(y_test, y_pred, target_names=class_names))


def plot_confusion_matrix(y_test, y_pred, class_names: list, title: str, save_path: str = None):
    """
    Plot and optionally save a confusion matrix heatmap.
    Each cell shows: true label (row) vs predicted label (col).
    Diagonal = correct predictions.
    """
    cm  = confusion_matrix(y_test, y_pred)
    fig, ax = plt.subplots(figsize=(6, 5))
    disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=class_names)
    disp.plot(ax=ax, cmap="Blues", colorbar=False)
    ax.set_title(title, fontsize=13, fontweight="bold")
    plt.tight_layout()
    if save_path:
        plt.savefig(save_path, dpi=150)
        print(f"   Confusion matrix saved -> {save_path}")
    plt.show()


# ─────────────────────────────────────────────
# 6.  STRATIFIED K-FOLD CROSS-VALIDATION
# ─────────────────────────────────────────────

def cross_validate_model(model, X, y, class_names: list, n_folds=N_FOLDS):
    """
    Stratified K-Fold cross-validation.

    Why use this?
    - With only 52 Carp samples, a single train/test split may be lucky or unlucky.
    - K-fold runs the model K times on different splits and averages the results.
    - 'Stratified' means each fold keeps the class proportion -> important here.

    Returns mean +/- std for key metrics.
    """
    skf = StratifiedKFold(n_splits=n_folds, shuffle=True, random_state=RANDOM_STATE)

    scoring = {
        "accuracy"         : "accuracy",
        "balanced_accuracy": "balanced_accuracy",
        "f1_macro"         : "f1_macro",
        "f1_weighted"      : "f1_weighted",
    }

    results = cross_validate(
        model, X, y,
        cv=skf,
        scoring=scoring,
        n_jobs=-1,
    )

    print(f"\n  Stratified {n_folds}-Fold Cross-Validation")
    print(f"  {'Metric':<25} {'Mean':>8}  {'Std':>8}")
    print(f"  {'-'*45}")
    for key in scoring:
        vals = results[f"test_{key}"]
        print(f"  {key:<25} {vals.mean():.4f}  +/-{vals.std():.4f}")

    return results


# ─────────────────────────────────────────────
# 7.  SAVE & LOAD MODEL
# ─────────────────────────────────────────────

def save_model(model, le: LabelEncoder, model_name: str, task: str):
    """
    Save the trained model and its label encoder using joblib.
    Both files are needed to make predictions later.
    """
    slug   = model_name.lower().replace(" ", "_")
    mpath  = os.path.join(MODEL_DIR, f"{task}_{slug}_model.joblib")
    lepath = os.path.join(MODEL_DIR, f"{task}_{slug}_label_encoder.joblib")

    joblib.dump(model, mpath)
    joblib.dump(le,    lepath)
    print(f"   Model saved        -> {mpath}")
    print(f"   LabelEncoder saved -> {lepath}")
    return mpath, lepath


def load_model(model_path: str, le_path: str):
    """
    Load a previously saved model and label encoder from disk.
    Use this in production (FastAPI endpoint) to make predictions.
    """
    model = joblib.load(model_path)
    le    = joblib.load(le_path)
    print(f"Model loaded from: {model_path}")
    return model, le


# ─────────────────────────────────────────────
# 8.  PREDICT ON NEW DATA
# ─────────────────────────────────────────────

def predict_new(model, le: LabelEncoder, feature_values: list) -> dict:
    """
    Make a prediction on a single new fish observation.

    Args:
        model          : trained sklearn model
        le             : fitted LabelEncoder
        feature_values : list of 11 feature values in the same order as FEATURE_COLS

    Returns:
        dict with predicted class label and per-class probabilities

    Example call:
        result = predict_new(rf_model, le, [45.2, 0.3, 120.0, ...])
    """
    X_new   = np.array(feature_values).reshape(1, -1)
    y_enc   = model.predict(X_new)[0]
    label   = le.inverse_transform([y_enc])[0]
    proba   = model.predict_proba(X_new)[0]
    classes = le.classes_

    return {
        "predicted_label": label,
        "probabilities"  : {c: round(float(p), 4) for c, p in zip(classes, proba)},
    }


# ─────────────────────────────────────────────
# 9.  FULL PIPELINE RUNNER
# ─────────────────────────────────────────────

def print_feature_importance(model, feature_cols: list):
    """Print and plot which features the Random Forest found most useful."""
    importances = model.feature_importances_
    indices     = np.argsort(importances)[::-1]

    print("\n  Feature Importances (Random Forest):")
    for rank, idx in enumerate(indices):
        print(f"    {rank+1:>2}. {feature_cols[idx]:<25} {importances[idx]:.4f}")

    fig, ax = plt.subplots(figsize=(8, 4))
    ax.bar(
        range(len(importances)),
        importances[indices],
        align="center",
        color="steelblue",
    )
    ax.set_xticks(range(len(importances)))
    ax.set_xticklabels([feature_cols[i] for i in indices], rotation=45, ha="right")
    ax.set_title("Random Forest -- Feature Importances")
    ax.set_ylabel("Importance Score")
    plt.tight_layout()
    imp_path = os.path.join(MODEL_DIR, "feature_importances.png")
    plt.savefig(imp_path, dpi=150)
    print(f"   Feature importance chart saved -> {imp_path}")
    plt.show()


def run_pipeline(task: str, label_col: str):
    """
    End-to-end pipeline for one classification task.

    task      : human-readable name, e.g. "species" or "quality"
    label_col : column name in the CSV, e.g. "species" or "quality"
    """
    print(f"\n{'#'*60}")
    print(f"  TASK: {task.upper()} CLASSIFICATION")
    print(f"{'#'*60}")

    # Step 1: Load data
    df = load_data(CSV_PATH)

    # Step 2: Prepare features & labels
    X, y, le, class_names = prepare_features_and_labels(
        df, FEATURE_COLS, label_col
    )

    # Step 3: Train/test split
    X_train, X_test, y_train, y_test = split_data(X, y)

    # Step 4: Train & evaluate each model
    models          = get_models()
    best_model      = None
    best_bacc       = -1
    best_model_name = ""

    for name, model in models.items():
        print(f"\n  Training: {name} ...")
        model.fit(X_train, y_train)
        y_pred = model.predict(X_test)

        print_evaluation(y_test, y_pred, class_names, name)

        cm_path = os.path.join(MODEL_DIR, f"{task}_{name.lower().replace(' ','_')}_cm.png")
        plot_confusion_matrix(
            y_test, y_pred, class_names,
            title=f"{task.title()} -- {name}",
            save_path=cm_path,
        )

        # Track the best model by balanced accuracy
        bacc = balanced_accuracy_score(y_test, y_pred)
        if bacc > best_bacc:
            best_bacc       = bacc
            best_model      = model
            best_model_name = name

    # Step 5: Cross-validate the best model
    print(f"\n  Running cross-validation on best model: {best_model_name}")
    cross_validate_model(best_model, X, y, class_names)

    # Step 6: Feature importance (Random Forest only)
    if hasattr(best_model, "feature_importances_"):
        print_feature_importance(best_model, FEATURE_COLS)

    # Step 7: Save the best model
    print(f"\n  Saving best model: {best_model_name}")
    save_model(best_model, le, best_model_name, task)

    return best_model, le


# ─────────────────────────────────────────────
# 10. ENTRY POINT
# ─────────────────────────────────────────────

if __name__ == "__main__":

    # Task 1: Species Classification
    species_model, species_le = run_pipeline(
        task      = "species",
        label_col = SPECIES_LABEL_COL,
    )

    # Task 2: Quality Classification
    # NOTE: Quality labels MUST already exist in your CSV.
    # Generate them from your rule-based scoring rubric BEFORE running this.
    # Example rubric: score >= 70 -> "High", 40-69 -> "Medium", <40 -> "Low"
    quality_model, quality_le = run_pipeline(
        task      = "quality",
        label_col = QUALITY_LABEL_COL,
    )

    # Demo: Predict on a new fish observation
    print("\n" + "="*55)
    print("  DEMO PREDICTION -- new fish sample")
    print("="*55)

    # Replace these 11 values with real extracted feature values
    sample_features = [
        45.2,   # hue_mean
        0.31,   # redness_purity
        118.5,  # brightness_mean
        0.12,   # brown_dominance
        0.22,   # color_cov
        0.45,   # red_intensity
        0.33,   # red_coverage
        0.18,   # eye_cloudiness
        0.27,   # shine_coverage
        0.39,   # shine_intensity
        95.0,   # body_color_b
    ]

    species_result = predict_new(species_model, species_le, sample_features)
    quality_result = predict_new(quality_model, quality_le, sample_features)

    print(f"\n  Species Prediction : {species_result['predicted_label']}")
    print(f"  Probabilities      : {species_result['probabilities']}")
    print(f"\n  Quality Prediction : {quality_result['predicted_label']}")
    print(f"  Probabilities      : {quality_result['probabilities']}")