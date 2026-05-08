import cv2 as cv
import numpy as np

from config import CLAHE_GILLS, CLAHE_HEAD

def decode_image(file_bytes: bytes):
    array = np.frombuffer(file_bytes, np.uint8)
    image = cv.imdecode(array, cv.IMREAD_COLOR)
    return image

def resize_gills(img):
    h, w = img.shape[:2]

    center = (w // 2, h // 2)
    radius = min(w, h) // 8

    circle_mask = np.zeros((h, w), dtype=np.uint8)
    cv.circle(circle_mask, center, radius, 255, -1)

    # initialize roi and crop image
    img = cv.bitwise_and(img, img, mask=circle_mask)
    img = img[center[1]-radius:center[1]+radius, center[0]-radius:center[0]+radius]
    return img

def apply_clahe(img):
    lab = cv.cvtColor(img, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)
    l_clahe = CLAHE_GILLS.apply(l)
    lab = cv.merge((l_clahe, a, b))
    img = cv.cvtColor(lab, cv.COLOR_LAB2BGR)
    return img

def preprocess_head(head_roi):
    gray = cv.cvtColor(head_roi, cv.COLOR_BGR2GRAY)
    denoise = cv.fastNlMeansDenoising(gray, None, 10, 7, 21)
    
    enhanced = CLAHE_HEAD.apply(denoise)
    
    kernel = np.array([[0, -1, 0],
                       [-1, 5, -1],
                       [0, -1, 0]])
    sharpened_gray = cv.filter2D(enhanced, -1, kernel)
    sharpened_rgb = cv.cvtColor(sharpened_gray, cv.COLOR_GRAY2BGR)

    return sharpened_rgb, sharpened_gray

def get_lab_mean(img):
    lab = cv.cvtColor(img, cv.COLOR_BGR2LAB)
    L = lab[:,:,0]
    mask = L > 10

    if not np.any(mask):
        return 0.0
    
    mean_L = np.mean(L[mask]) * 100.0 / 255.0  
    return round(mean_L, 4)