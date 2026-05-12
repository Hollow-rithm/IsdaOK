"""
Fish Eye Feature Extraction Pipeline
=====================================
Thesis: Fish Surface Quality Assessment System
Target Species: Tilapia, Milkfish, Carp

This script batch-processes a dataset of fish eye images, extracting
classical image processing features for freshness/quality assessment.

Usage:
    python eye_feature_extractor.py --dataset_dir ./dataset --output ./eye_features.csv

Directory Structure Expected:
    dataset/
        tilapia/
            high/    -> img1.jpg, img2.jpg, ...
            medium/  -> ...
            low/     -> ...
        milkfish/
            high/    -> ...
        carp/
            ...

Features are extracted per image and saved to a single CSV for
downstream analysis, normalization, and ML training.
"""

import os
import sys
import argparse
import logging
import warnings
import traceback
from pathlib import Path
from typing import Optional

import cv2
import numpy as np
import pandas as pd
from scipy.stats import entropy as scipy_entropy

# Suppress minor warnings
warnings.filterwarnings("ignore")

# ---------------------------------------------------------------------------
# Logging Setup
# ---------------------------------------------------------------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)]
)
logger = logging.getLogger(__name__)


# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------
SUPPORTED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".bmp", ".tiff", ".tif", ".webp"}
TARGET_SIZE = (128, 128)          # Standardized image size for all processing
CLAHE_CLIP_LIMIT = 2.0            # CLAHE contrast limit
CLAHE_TILE_GRID = (8, 8)          # CLAHE tile grid size
GAUSSIAN_BLUR_KERNEL = (5, 5)     # Pre-processing noise reduction kernel
CANNY_LOW = 50                    # Canny edge detection lower threshold
CANNY_HIGH = 150                  # Canny edge detection upper threshold
LBP_RADIUS = 3                    # Local Binary Pattern radius
LBP_POINTS = 8 * LBP_RADIUS       # LBP sampling points


# ---------------------------------------------------------------------------
# Image Loading
# ---------------------------------------------------------------------------
def load_images_from_directory(root_dir: str) -> list[dict]:
    """
    Recursively walk root_dir and collect all image file paths.

    Extracts metadata from the directory hierarchy:
        root_dir / <species> / <quality_label> / image.jpg
        root_dir / <species> / image.jpg   (no quality subfolder)

    Returns a list of dicts:
        {
            "path": str,
            "filename": str,
            "species": str,
            "quality_label": str   # "unknown" if not determinable
        }
    """
    root = Path(root_dir)
    if not root.exists():
        raise FileNotFoundError(f"Dataset directory not found: {root_dir}")

    records = []
    for filepath in sorted(root.rglob("*")):
        if filepath.suffix.lower() not in SUPPORTED_EXTENSIONS:
            continue

        parts = filepath.relative_to(root).parts

        species = "unknown"
        quality_label = "unknown"

        if len(parts) >= 3:
            # root / species / quality / filename.ext
            species = parts[0].lower()
            quality_label = parts[1].lower()
        elif len(parts) == 2:
            # root / species / filename.ext
            species = parts[0].lower()
        elif len(parts) == 1:
            # root / filename.ext  — try to infer from filename
            name_lower = filepath.stem.lower()
            for sp in ["tilapia", "milkfish", "carp"]:
                if sp in name_lower:
                    species = sp
                    break
            for ql in ["high", "medium", "low"]:
                if ql in name_lower:
                    quality_label = ql
                    break

        records.append({
            "path": str(filepath),
            "filename": filepath.name,
            "species": species,
            "quality_label": quality_label,
        })

    logger.info(f"Found {len(records)} image(s) under '{root_dir}'")
    return records


# ---------------------------------------------------------------------------
# Preprocessing
# ---------------------------------------------------------------------------
def preprocess_eye_image(image_path: str) -> Optional[dict]:
    """
    Load and preprocess a single eye image.

    Returns a dict of preprocessed representations:
        {
            "bgr"       : np.ndarray  [H, W, 3]  uint8
            "gray"      : np.ndarray  [H, W]     uint8
            "gray_eq"   : np.ndarray  [H, W]     uint8   (CLAHE equalized)
            "lab"       : np.ndarray  [H, W, 3]  uint8
            "hsv"       : np.ndarray  [H, W, 3]  uint8
            "edges"     : np.ndarray  [H, W]     uint8   (Canny)
            "blurred"   : np.ndarray  [H, W]     uint8   (gray + blur)
        }
    Returns None if the image cannot be loaded or preprocessed.
    """
    img_bgr = cv2.imread(image_path)
    if img_bgr is None:
        logger.warning(f"Could not read image: {image_path}")
        return None

    # Standardize size
    img_bgr = cv2.resize(img_bgr, TARGET_SIZE, interpolation=cv2.INTER_AREA)

    # Grayscale
    gray = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2GRAY)

    # CLAHE on grayscale — improves feature stability under varying lighting
    clahe = cv2.createCLAHE(clipLimit=CLAHE_CLIP_LIMIT, tileGridSize=CLAHE_TILE_GRID)
    gray_eq = clahe.apply(gray)

    # Gaussian blur for noise-robust edge / texture computation
    blurred = cv2.GaussianBlur(gray_eq, GAUSSIAN_BLUR_KERNEL, 0)

    # Color space conversions
    lab = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2LAB)
    hsv = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2HSV)

    # Canny edges on equalized+blurred grayscale
    edges = cv2.Canny(blurred, CANNY_LOW, CANNY_HIGH)

    return {
        "bgr": img_bgr,
        "gray": gray,
        "gray_eq": gray_eq,
        "blurred": blurred,
        "lab": lab,
        "hsv": hsv,
        "edges": edges,
    }


# ---------------------------------------------------------------------------
# A. Baseline / Original Features
# ---------------------------------------------------------------------------
def extract_baseline_features(imgs: dict) -> dict:
    """
    Original baseline features — kept for comparison and backward compatibility.

    Features:
        red_intensity_lab_a_mean  : Mean of LAB a-channel (positive = redness)
        red_coverage_lab_a_ratio  : Fraction of pixels with LAB a > 10
        eye_L_mean                : Mean L-channel (brightness) of eye region
        eye_cloudiness_ratio      : Placeholder (requires separate body image);
                                    set to NaN here — populated upstream if available
    """
    lab = imgs["lab"].astype(np.float32)
    l_channel = lab[:, :, 0]
    a_channel = lab[:, :, 1]

    # LAB a-channel: 0–255 in OpenCV, midpoint at 128 means neutral
    a_shifted = a_channel - 128.0   # shift so 0 = neutral, +ve = redness

    red_intensity_lab_a_mean = float(np.mean(a_shifted))
    red_coverage_lab_a_ratio = float(np.mean(a_shifted > 10))
    eye_L_mean = float(np.mean(l_channel))

    return {
        "red_intensity_lab_a_mean": red_intensity_lab_a_mean,
        "red_coverage_lab_a_ratio": red_coverage_lab_a_ratio,
        "eye_L_mean": eye_L_mean,
        "eye_cloudiness_ratio": np.nan,   # Requires body image reference
    }


# ---------------------------------------------------------------------------
# B1. Clarity / Sharpness Features
# ---------------------------------------------------------------------------
def extract_clarity_features(imgs: dict) -> dict:
    """
    Measures sharpness degradation — cloudy/spoiled eyes lose fine detail.

    Features:
        laplacian_variance   : Higher = sharper. Drops as eye clouds over.
        sobel_gradient_mean  : Mean edge gradient magnitude.
        edge_density_canny   : Fraction of edge pixels from Canny detector.
    """
    # Laplacian and Sobel require uint8 source in this OpenCV build
    gray_eq = imgs["gray_eq"]           # uint8
    gray_float = gray_eq.astype(np.float32)
    edges = imgs["edges"]

    # Laplacian — second-order derivative sharpness estimator
    laplacian = cv2.Laplacian(gray_eq, cv2.CV_32F)
    laplacian_variance = float(np.var(laplacian))

    # Sobel gradient magnitude
    sobelx = cv2.Sobel(gray_eq, cv2.CV_32F, 1, 0, ksize=3)
    sobely = cv2.Sobel(gray_eq, cv2.CV_32F, 0, 1, ksize=3)
    sobel_magnitude = np.sqrt(sobelx**2 + sobely**2)
    sobel_gradient_mean = float(np.mean(sobel_magnitude))

    # Canny edge density
    total_pixels = edges.size
    edge_pixels = float(np.count_nonzero(edges))
    edge_density_canny = edge_pixels / total_pixels if total_pixels > 0 else 0.0

    return {
        "laplacian_variance": laplacian_variance,
        "sobel_gradient_mean": sobel_gradient_mean,
        "edge_density_canny": edge_density_canny,
    }


# ---------------------------------------------------------------------------
# B2. Texture Features
# ---------------------------------------------------------------------------
def extract_texture_features(imgs: dict) -> dict:
    """
    Measures structural texture loss — spoiled eyes become smooth/uniform.

    Features:
        gray_std_dev      : Standard deviation of grayscale pixel intensities.
        gray_entropy      : Shannon entropy of intensity histogram.
        local_contrast    : Mean of local standard deviation (3×3 patches).
        lbp_texture_score : Mean LBP (Local Binary Pattern) histogram variance.
    """
    gray_eq = imgs["gray_eq"]
    gray_float = gray_eq.astype(np.float32)

    # Standard deviation — higher = more texture variation
    gray_std_dev = float(np.std(gray_float))

    # Shannon entropy from normalized histogram
    hist, _ = np.histogram(gray_eq, bins=256, range=(0, 256))
    hist_prob = hist / (hist.sum() + 1e-9)
    gray_entropy = float(scipy_entropy(hist_prob + 1e-9))

    # Local contrast: compute std in 3×3 patches using integral image approach
    kernel = np.ones((3, 3), np.float32) / 9.0
    local_mean = cv2.filter2D(gray_float, -1, kernel)
    local_sq_mean = cv2.filter2D(gray_float**2, -1, kernel)
    local_variance = local_sq_mean - local_mean**2
    local_variance = np.clip(local_variance, 0, None)
    local_contrast = float(np.mean(np.sqrt(local_variance)))

    # LBP texture score
    lbp_score = _compute_lbp_score(gray_eq)

    return {
        "gray_std_dev": gray_std_dev,
        "gray_entropy": gray_entropy,
        "local_contrast": local_contrast,
        "lbp_texture_score": lbp_score,
    }


def _compute_lbp_score(gray: np.ndarray) -> float:
    """
    Compute LBP manually using circular neighbor sampling.
    Returns the variance of the LBP histogram (higher = richer texture).
    """
    h, w = gray.shape
    lbp_map = np.zeros((h, w), dtype=np.uint8)
    gray_f = gray.astype(np.float32)
    radius = LBP_RADIUS
    n_points = LBP_POINTS

    for i in range(n_points):
        angle = 2 * np.pi * i / n_points
        dx = radius * np.cos(angle)
        dy = -radius * np.sin(angle)  # flip y for image coords

        # Bilinear interpolation of neighbor pixel
        x0 = int(np.floor(dx))
        x1 = x0 + 1
        y0 = int(np.floor(dy))
        y1 = y0 + 1

        wx = dx - x0
        wy = dy - y0

        # Shift maps for neighbor positions (border handling via reflection)
        def shift(arr, sx, sy):
            return np.roll(np.roll(arr, sy, axis=0), sx, axis=1)

        neighbor = (
            (1 - wx) * (1 - wy) * shift(gray_f, x0, y0)
            + wx       * (1 - wy) * shift(gray_f, x1, y0)
            + (1 - wx) * wy       * shift(gray_f, x0, y1)
            + wx       * wy       * shift(gray_f, x1, y1)
        )
        lbp_map += ((neighbor >= gray_f).astype(np.uint8) << i)

    hist, _ = np.histogram(lbp_map, bins=256, range=(0, 256))
    return float(np.var(hist.astype(np.float32)))


# ---------------------------------------------------------------------------
# B3. Cloudiness / Opacity Features
# ---------------------------------------------------------------------------
def extract_cloudiness_features(imgs: dict) -> dict:
    """
    Detects hazy, opaque appearance — hallmark of spoiled fish eyes.

    In HSV space:
        Cloudy pixels = high Value (V) but low Saturation (S)
        Fresh eyes = more saturated, vivid appearance

    Features:
        cloudy_pixel_ratio   : Fraction of pixels with V > 180 and S < 50
        mean_saturation      : Mean HSV saturation (lower = cloudier)
        mean_value           : Mean HSV value (brightness)
        saturation_std_dev   : Std deviation of saturation
    """
    hsv = imgs["hsv"]
    h_ch, s_ch, v_ch = cv2.split(hsv)

    # Cloudiness mask: bright (high V) but desaturated (low S)
    cloudy_mask = (v_ch.astype(np.float32) > 180) & (s_ch.astype(np.float32) < 50)
    cloudy_pixel_ratio = float(np.mean(cloudy_mask))

    mean_saturation = float(np.mean(s_ch.astype(np.float32)))
    mean_value = float(np.mean(v_ch.astype(np.float32)))
    saturation_std_dev = float(np.std(s_ch.astype(np.float32)))

    return {
        "cloudy_pixel_ratio": cloudy_pixel_ratio,
        "mean_saturation": mean_saturation,
        "mean_value": mean_value,
        "saturation_std_dev": saturation_std_dev,
    }


# ---------------------------------------------------------------------------
# B4. Specular Highlight / Glossiness Features
# ---------------------------------------------------------------------------
def extract_highlight_features(imgs: dict) -> dict:
    """
    Fresh eyes exhibit stronger specular (mirror-like) reflections.
    Spoiled eyes lose this gloss.

    Features:
        highlight_ratio        : Fraction of pixels above 95th percentile brightness
        brightest_pixel_ratio  : Fraction of pixels with value ≥ 240 (near-white)
        reflection_intensity   : Mean intensity within highlight mask
        highlight_area_std     : Spatial variation of highlight region (spread)
    """
    gray = imgs["gray"].astype(np.float32)
    total_pixels = gray.size

    p95 = float(np.percentile(gray, 95))
    highlight_mask = gray >= p95
    highlight_ratio = float(np.mean(highlight_mask))

    bright_mask = gray >= 240.0
    brightest_pixel_ratio = float(np.count_nonzero(bright_mask) / total_pixels)

    if np.any(highlight_mask):
        reflection_intensity = float(np.mean(gray[highlight_mask]))
        # Spatial spread: std of row/col positions of highlight pixels
        coords = np.argwhere(highlight_mask)
        highlight_area_std = float(np.std(coords.astype(np.float32)))
    else:
        reflection_intensity = 0.0
        highlight_area_std = 0.0

    return {
        "highlight_ratio": highlight_ratio,
        "brightest_pixel_ratio": brightest_pixel_ratio,
        "reflection_intensity": reflection_intensity,
        "highlight_area_std": highlight_area_std,
    }


# ---------------------------------------------------------------------------
# B5. Color Robustness Features
# ---------------------------------------------------------------------------
def extract_color_features(imgs: dict) -> dict:
    """
    Multi-channel redness and color features for spoilage detection.
    More robust than single LAB a-channel alone.

    Features:
        rgb_redness_ratio        : R / (R + G + B) — normalized redness
        lab_a_mean               : LAB a-channel mean (shifted to zero-center)
        lab_a_std                : LAB a-channel standard deviation
        hsv_hue_mean             : Mean hue in HSV
        hsv_hue_std              : Hue standard deviation (color consistency)
        red_channel_dominance    : Mean(R - max(G, B)) — R dominant pixels
        bgr_blue_ratio           : B / (R + G + B) — bluish discoloration
    """
    bgr = imgs["bgr"].astype(np.float32)
    lab = imgs["lab"].astype(np.float32)
    hsv = imgs["hsv"].astype(np.float32)

    b, g, r = cv2.split(bgr)
    channel_sum = r + g + b + 1e-9
    rgb_redness_ratio = float(np.mean(r / channel_sum))
    bgr_blue_ratio = float(np.mean(b / channel_sum))

    a_channel = lab[:, :, 1] - 128.0
    lab_a_mean = float(np.mean(a_channel))
    lab_a_std = float(np.std(a_channel))

    h_ch = hsv[:, :, 0]
    hsv_hue_mean = float(np.mean(h_ch))
    hsv_hue_std = float(np.std(h_ch))

    # Red channel dominance: pixels where R > G and R > B
    red_dominant_mask = (r > g) & (r > b)
    red_channel_dominance = float(np.mean((r - np.maximum(g, b))[red_dominant_mask])) \
        if np.any(red_dominant_mask) else 0.0

    return {
        "rgb_redness_ratio": rgb_redness_ratio,
        "lab_a_mean": lab_a_mean,
        "lab_a_std": lab_a_std,
        "hsv_hue_mean": hsv_hue_mean,
        "hsv_hue_std": hsv_hue_std,
        "red_channel_dominance": red_channel_dominance,
        "bgr_blue_ratio": bgr_blue_ratio,
    }


# ---------------------------------------------------------------------------
# B6. Morphological Shape Integrity
# ---------------------------------------------------------------------------
def extract_shape_features(imgs: dict) -> dict:
    """
    Measures eye deformation and collapse — degraded fish eyes lose roundness.

    Circularity = 4π × Area / Perimeter²
        → 1.0 = perfect circle, 0 = irregular

    Features:
        eye_area             : Area of detected eye contour in pixels²
        eye_perimeter        : Perimeter of detected contour
        circularity          : Shape roundness measure
        aspect_ratio         : Bounding box W / H
        contour_compactness  : Perimeter² / Area (inverse of circularity)
        otsu_threshold_value : Otsu threshold used (useful for lighting analysis)
    """
    gray_eq = imgs["gray_eq"]

    # Otsu thresholding to separate eye from background
    otsu_val, binary = cv2.threshold(
        gray_eq, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU
    )

    # Morphological cleanup
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
    binary = cv2.morphologyEx(binary, cv2.MORPH_CLOSE, kernel)
    binary = cv2.morphologyEx(binary, cv2.MORPH_OPEN, kernel)

    contours, _ = cv2.findContours(binary, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    if not contours:
        return {
            "eye_area": 0.0,
            "eye_perimeter": 0.0,
            "circularity": 0.0,
            "aspect_ratio": 1.0,
            "contour_compactness": 0.0,
            "otsu_threshold_value": float(otsu_val),
        }

    # Use largest contour as eye region
    largest = max(contours, key=cv2.contourArea)
    area = float(cv2.contourArea(largest))
    perimeter = float(cv2.arcLength(largest, closed=True))

    circularity = (4 * np.pi * area / (perimeter**2)) if perimeter > 0 else 0.0
    compactness = (perimeter**2 / area) if area > 0 else 0.0

    x, y, w, h = cv2.boundingRect(largest)
    aspect_ratio = float(w) / float(h) if h > 0 else 1.0

    return {
        "eye_area": area,
        "eye_perimeter": perimeter,
        "circularity": float(circularity),
        "aspect_ratio": aspect_ratio,
        "contour_compactness": float(compactness),
        "otsu_threshold_value": float(otsu_val),
    }


# ---------------------------------------------------------------------------
# Master Feature Extractor
# ---------------------------------------------------------------------------
def extract_all_features(record: dict) -> Optional[dict]:
    """
    Full pipeline for a single image record.
    Returns a flat dict of all features, or None on failure.
    """
    imgs = preprocess_eye_image(record["path"])
    if imgs is None:
        return None

    features = {
        "filename": record["filename"],
        "species": record["species"],
        "quality_label": record["quality_label"],
        "image_path": record["path"],
    }

    feature_groups = [
        ("baseline",   extract_baseline_features),
        ("clarity",    extract_clarity_features),
        ("texture",    extract_texture_features),
        ("cloudiness", extract_cloudiness_features),
        ("highlight",  extract_highlight_features),
        ("color",      extract_color_features),
        ("shape",      extract_shape_features),
    ]

    for group_name, extractor_fn in feature_groups:
        try:
            group_features = extractor_fn(imgs)
            features.update(group_features)
        except Exception as e:
            logger.debug(f"Feature group '{group_name}' failed for {record['filename']}: {e}")
            # Fill with NaN so the row is still usable
            features[f"{group_name}_error"] = str(e)

    return features


# ---------------------------------------------------------------------------
# Dataset Processor
# ---------------------------------------------------------------------------
def process_dataset(root_dir: str, max_images: Optional[int] = None) -> pd.DataFrame:
    """
    Process all images in root_dir and return a DataFrame of features.

    Args:
        root_dir   : Root dataset directory.
        max_images : Optional cap for testing (None = process all).

    Returns:
        pd.DataFrame with one row per image.
    """
    records = load_images_from_directory(root_dir)

    if max_images is not None:
        records = records[:max_images]
        logger.info(f"Capped to {max_images} images for this run.")

    total = len(records)
    all_features = []
    failed = []

    logger.info(f"Starting feature extraction for {total} image(s)...")

    for i, record in enumerate(records, start=1):
        # Progress logging
        if i % 50 == 0 or i == total:
            logger.info(f"  Progress: {i}/{total} ({100*i/total:.1f}%)")

        try:
            features = extract_all_features(record)
            if features is None:
                failed.append(record["path"])
                logger.warning(f"  Skipped (load error): {record['filename']}")
            else:
                all_features.append(features)
        except Exception as e:
            failed.append(record["path"])
            logger.error(f"  Failed: {record['filename']} — {e}")
            logger.debug(traceback.format_exc())

    # Build DataFrame
    df = pd.DataFrame(all_features)

    # Summary
    logger.info("\n" + "=" * 60)
    logger.info("PROCESSING SUMMARY")
    logger.info(f"  Total images found   : {total}")
    logger.info(f"  Successfully processed: {len(all_features)}")
    logger.info(f"  Failed / skipped     : {len(failed)}")
    if failed:
        logger.info("  Failed files:")
        for f in failed:
            logger.info(f"    - {f}")
    logger.info("=" * 60)

    return df


# ---------------------------------------------------------------------------
# CSV Saver
# ---------------------------------------------------------------------------
def save_to_csv(df: pd.DataFrame, output_path: str) -> str:
    """
    Save feature DataFrame to CSV with proper encoding and precision.

    Returns the resolved output path.
    """
    out = Path(output_path)
    out.parent.mkdir(parents=True, exist_ok=True)

    # Round floats to 6 decimal places to keep CSV clean
    float_cols = df.select_dtypes(include=[np.floating, float]).columns
    df[float_cols] = df[float_cols].round(6)

    df.to_csv(out, index=False, encoding="utf-8-sig")
    logger.info(f"CSV saved → {out.resolve()}")
    logger.info(f"  Rows    : {len(df)}")
    logger.info(f"  Columns : {len(df.columns)}")

    return str(out.resolve())


# ---------------------------------------------------------------------------
# CLI Entry Point
# ---------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(
        description="Fish Eye Feature Extraction Pipeline — Thesis Tool",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python eye_feature_extractor.py --dataset_dir ./dataset --output eye_features.csv
  python eye_feature_extractor.py --dataset_dir ./dataset --output eye_features.csv --max_images 100
        """
    )
    parser.add_argument(
        "--dataset_dir",
        type=str,
        required=True,
        help="Root directory containing fish eye images (organized by species/quality).",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="eye_features.csv",
        help="Output CSV file path (default: eye_features.csv).",
    )
    parser.add_argument(
        "--max_images",
        type=int,
        default=None,
        help="Optional: maximum number of images to process (for quick testing).",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Enable verbose debug logging.",
    )

    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    logger.info("Fish Eye Feature Extraction Pipeline")
    logger.info(f"  Dataset : {args.dataset_dir}")
    logger.info(f"  Output  : {args.output}")

    df = process_dataset(args.dataset_dir, max_images=args.max_images)

    if df.empty:
        logger.error("No features extracted. Check dataset directory and image formats.")
        sys.exit(1)

    save_to_csv(df, args.output)

    # Quick stats overview
    logger.info("\nFEATURE STATISTICS PREVIEW:")
    numeric_df = df.select_dtypes(include=[np.number])
    print(numeric_df.describe().T.to_string())


if __name__ == "__main__":
    main()