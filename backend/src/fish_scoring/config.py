import cv2 as cv
import numpy as np

# Preprocess
CLAHE_GILLS = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
CLAHE_HEAD = cv.createCLAHE(clipLimit=6.0, tileGridSize=(4, 4))

# Segmentation
K5 = np.ones((5,5), np.uint8)
K11 = np.ones((11,11), np.uint8)
IMG_SIZE = 256

# Scoring
MAX_SCORE = 1.0
MIN_SCORE = 0.0

GILL_BOUNDS = {
    "hue_mean_1": {"min": 0.0, "max": 20.0},
    "hue_mean_2": {"min": 168.0, "max": 180.0},
    "purity": {"min": 153.58, "max": 183.94},
    "brown": {"min": 0.026, "max": 0.326},
    "cov": {"min": 0.216, "max": 0.314},
    "best_brightness": {"min": 100.0, "max": 180.0},
    "brightness": {"min": 60.0, "max": 210.0},
}

HUE_LOWER = 0.0
HUE_UPPER = 20.0

PURITY_LOWER = 100.0
PURITY_UPPER = 190.0

BROWN_UPPER = 0.5
BROWN_LOWER = 0.0

COV_UPPER = 0.50
COV_LOWER = 0.15

BEST_BRIGHTNESS_LOW_THRESH = 80.0
BEST_BRIGHTNESS_HIGH_THRESH = 160.0

BRIGHTNESS_LOWER = 41.0
BRIGHTNESS_HIGHER = 200.0

SPECIES_BOUNDS = {
    "tilapia": {
        "lbp_texture_score": {"min": 45.0, "max": 724.0},
        "canny_edge_density": {"min": 0.052, "max": 0.147},
        "mean_saturation": {"min": 33.5, "max": 106.27},
        "lab_a_mean": {"min": -1.285, "max": 6.054},
        "red_ratio": {"min": 0.4, "max": 0.7},
        "body_color_b": {"min": -17.0, "max": 5.36},
        "shine_intensity": {"min": 221.29, "max": 245.66},
        "shine_coverage": {"min": 0.0038, "max": 0.0334},
    },
    "bangus": {
        "lbp_texture_score": {"min": 66.1, "max": 1140.1},
        "canny_edge_density": {"min": 0.0639, "max": 0.1321},
        "mean_saturation": {"min": 25.467, "max": 71.9645},
        "lab_a_mean": {"min": -1.346, "max": 2.914},
        "red_ratio": {"min": 0.1, "max": 0.4},
        "body_color_b": {"min": -10.3, "max": 2.53},
        "shine_intensity": {"min": 225.7, "max": 242.67},
        "shine_coverage": {"min": 0.012, "max": 0.173},
    },
    "carp": {
        "lbp_texture_score": {"min": 30.0, "max": 600.0},
        "canny_edge_density": {"min": 0.052, "max": 0.147},
        "mean_saturation": {"min": 33.5, "max": 106.27},
        "lab_a_mean": {"min": -1.285, "max": 6.054},
        "red_ratio": {"min": 0.1, "max": 0.4},
        "body_color_b": {"min": -3.4, "max": 5.4},
        "shine_intensity": {"min": 227.0, "max": 243.0},
        "shine_coverage": {"min": 0.0145, "max": 0.095},
    },
    "unknown": {
        "lbp_texture_score": {"min": 48.8, "max": 862.0},
        "canny_edge_density": {"min": 0.0574, "max": 0.14},
        "mean_saturation": {"min": 27.1, "max": 87.722},
        "lab_a_mean": {"min": -1.2728, "max": 5.428},
        "red_ratio": {"min": 0.2, "max": 0.5},
        "body_color_b": {"min": -11.7, "max": 4.0},
        "shine_intensity": {"min": 223.5, "max": 243.7},
        "shine_coverage": {"min": 0.005, "max": 0.15},
    }
}