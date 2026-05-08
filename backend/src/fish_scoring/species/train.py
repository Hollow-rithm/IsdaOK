import pandas as pd
import numpy as np
import joblib
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split, StratifiedKFold, cross_val_score
from sklearn.metrics import (
    classification_report,
    confusion_matrix,
    ConfusionMatrixDisplay
)
from sklearn.utils.class_weight import compute_class_weight

# ─── 1. Load Data ────────────────────────────────────────────────────────────
data = pd.read_csv("species_data.csv")

X = data.iloc[:, 3:-1]
y = data.iloc[:, -1]

FEATURE_NAMES = X.columns.tolist()
print(f"Features: {FEATURE_NAMES}")
print(f"\nClass distribution:\n{y.value_counts()}")

# ─── 2. Stratified Train/Test Split ──────────────────────────────────────────
# Stratified ensures each split has proportional class representation
X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,        # reproducibility
    stratify=y              # critical for imbalanced classes
)

print(f"\nTrain size: {len(X_train)}, Test size: {len(X_test)}")
print(f"Train class dist:\n{y_train.value_counts()}")
print(f"Test class dist:\n{y_test.value_counts()}")

# ─── 3. Handle Class Imbalance ───────────────────────────────────────────────
# class_weight='balanced' makes the model penalize Carp misclassifications more
# This compensates for having only 52 Carp samples vs 185+ for others
classes = np.unique(y_train)
weights = compute_class_weight(class_weight='balanced', classes=classes, y=y_train)
class_weight_dict = dict(zip(classes, weights))
print(f"\nComputed class weights: {class_weight_dict}")

# ─── 4. Train Model ──────────────────────────────────────────────────────────
model = RandomForestClassifier(
    n_estimators=200,           # more trees = more stable (was 100)
    class_weight='balanced',    # handles Carp underrepresentation
    max_depth=None,             # let trees grow fully
    min_samples_leaf=2,         # prevents overfitting on rare Carp samples
    random_state=42,            # reproducibility
    n_jobs=-1                   # use all CPU cores
)

model.fit(X_train, y_train)

# ─── 5. Evaluate on Test Set ─────────────────────────────────────────────────
y_pred = model.predict(X_test)

print("\n" + "="*50)
print("CLASSIFICATION REPORT")
print("="*50)
print(classification_report(y_test, y_pred))

# ─── 6. Confusion Matrix ─────────────────────────────────────────────────────
cm = confusion_matrix(y_test, y_pred, labels=model.classes_)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=model.classes_)
disp.plot(cmap='Blues')
plt.title("Species Classification — Confusion Matrix")
plt.tight_layout()
plt.savefig("/artifacts/confusion_matrix.png", dpi=150)
plt.close()
print("Confusion matrix saved.")

# ─── 7. Stratified K-Fold Cross-Validation ───────────────────────────────────
# More reliable than single split — especially important for small Carp class
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)
cv_scores = cross_val_score(model, X, y, cv=cv, scoring='f1_macro', n_jobs=-1)

print(f"\nCross-Validation F1 (macro) scores: {cv_scores.round(3)}")
print(f"Mean: {cv_scores.mean():.3f} ± {cv_scores.std():.3f}")

# ─── 8. Feature Importance ───────────────────────────────────────────────────
importances = model.feature_importances_
feat_df = pd.DataFrame({
    'feature': FEATURE_NAMES,
    'importance': importances
}).sort_values('importance', ascending=False)

print(f"\nFeature Importances:\n{feat_df.to_string(index=False)}")

plt.figure(figsize=(10, 6))
sns.barplot(data=feat_df, x='importance', y='feature', palette='viridis')
plt.title("Feature Importance — Species Classifier")
plt.tight_layout()
plt.savefig("/artifacts/feature_importance.png", dpi=150)
plt.close()
print("Feature importance chart saved.")

# ─── 9. Save Model + Metadata ────────────────────────────────────────────────
joblib.dump(model, "/artifacts/species_model.pkl")

metadata = {
    "features": FEATURE_NAMES,
    "classes": model.classes_.tolist(),
    "n_estimators": model.n_estimators,
    "cv_f1_mean": round(cv_scores.mean(), 4),
    "cv_f1_std": round(cv_scores.std(), 4),
    "class_weights": class_weight_dict,
    "train_size": len(X_train),
    "test_size": len(X_test),
}
joblib.dump(metadata, "/artifacts/species_model_metadata.pkl")

print("\nModel and metadata saved.")
print(f"Classes: {model.classes_}")