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