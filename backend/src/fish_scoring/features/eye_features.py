import cv2 as cv
import numpy as np

from preprocessing import image_utils

def extract(eye_result):
    lab = cv.cvtColor(eye_result, cv.COLOR_BGR2LAB)
    _, a, _ = cv.split(lab)

    a_centered = a.astype(np.float32) - 128.0

    mean_a = float(np.mean(a_centered))        

    red_pixels = a_centered > 10   
    red_ratio = float(np.sum(red_pixels) / (eye_result.shape[0] * eye_result.shape[1]))

    eye_L = float(image_utils.get_lab_mean(eye_result))

    return {"red_intensity": round(mean_a, 4),
            "red_coverage": round(red_ratio, 4),
            "eye_L": eye_L,
            }

def enrich(eye_feats, body_feats):
    eye_feats["cloudiness"] = round(eye_feats["eye_L"] / (body_feats["body_L"] + 1e-6), 4)
    del eye_feats["eye_L"], body_feats["body_L"]
    return eye_feats, body_feats