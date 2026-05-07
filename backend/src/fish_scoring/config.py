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
        "eye_cloudiness": {"min": 0.68, "max": 1.55},
        "red_intensity": {"min": -0.01, "max": 0.3596},
        "red_coverage": {"min": 0.0, "max": 0.015},
        "body_color_b": {"min": -17.0, "max": 5.36},
        "shine_intensity": {"min": 221.29, "max": 245.66},
        "shine_coverage": {"min": 0.0038, "max": 0.0334},
    },
    "bangus": {
        "eye_cloudiness": {"min": 0.59, "max": 1.1},
        "red_intensity": {"min": -0.12, "max": 0.2291},
        "red_coverage": {"min": 0.0, "max": 0.0028},
        "body_color_b": {"min": -10.3, "max": 2.53},
        "shine_intensity": {"min": 225.7, "max": 242.67},
        "shine_coverage": {"min": 0.012, "max": 0.173},
    },
    "carp": {
        "eye_cloudiness": {"min": 0.59, "max": 0.98},
        "red_intensity": {"min": 0.026, "max": 0.45},
        "red_coverage": {"min": 0.0, "max": 0.018},
        "body_color_b": {"min": -3.4, "max": 5.4},
        "shine_intensity": {"min": 227.0, "max": 243.0},
        "shine_coverage": {"min": 0.0145, "max": 0.095},
    },
    "unknown": {
        "eye_cloudiness": {"min": 0.61, "max": 1.39},
        "red_intensity": {"min": -0.051, "max": 0.34},
        "red_coverage": {"min": 0.0, "max": 0.0097},
        "body_color_b": {"min": -11.7, "max": 4.0},
        "shine_intensity": {"min": 223.5, "max": 243.7},
        "shine_coverage": {"min": 0.005, "max": 0.15},
    }
}