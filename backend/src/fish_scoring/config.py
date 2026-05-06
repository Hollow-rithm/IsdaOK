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

HUE_LOWER_1 = 0.0
HUE_UPPER_1 = 20.0
HUE_LOWER_2 = 168.0
HUE_UPPER_2 = 180.0

PURITY_LOWER = 80.0
PURITY_UPPER = 200.0

BROWN_UPPER = 0.80
BROWN_LOWER = 0.0

COV_UPPER = 0.60
COV_LOWER = 0.20

BEST_BRIGHTNESS_LOW_THRESH = 100.0
BEST_BRIGHTNESS_HIGH_THRESH = 180.0

BRIGHTNESS_LOWER = 60.0
BRIGHTNESS_HIGHER = 210.0

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