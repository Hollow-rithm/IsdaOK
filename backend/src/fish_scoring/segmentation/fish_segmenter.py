import os
import numpy as np
import cv2 as cv

from config import K5, IMG_SIZE

_model = None
_device = None
_torch = None
_smp = None

MODEL_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '../artifacts/unet_fish.pth'))

def _load_segmenter():
    global _model, _device, _torch, _smp

    if _model is not None:
        print("Model is already loaded.")
        return
    
    print("Loading segmentation model...")

    import torch
    import segmentation_models_pytorch as smp

    _torch = torch
    _smp = smp
    _device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    _model = smp.Unet(
                encoder_name="resnet34",
                encoder_weights=None,
                in_channels=3,
                classes=1
            )
    
    checkpoint = torch.load(MODEL_PATH, map_location=_device)
    _model.load_state_dict(checkpoint)
    _model.to(_device)
    _model.eval()

    print(f"✓ Segmenter loaded on {_device}")

def get_fish_region_coords(fx, fy, fw, fh):
    eye_end = fy + int(0.15 * fh)
    body_end = fy + int(0.80 * fh)
    x0, x1 = fx, fx + fw
    return (
        (fy, eye_end, x0, x1),
        (eye_end, body_end, x0, x1),
    )

def segment(img):
    _load_segmenter()


    ############################################################################################# segment_fish
    h, w = img.shape[:2]

    # img_resized = cv.resize(cv.cvtColor(img, cv.COLOR_BGR2RGB), (IMG_SIZE, IMG_SIZE))
    # img_norm = img_resized.astype("float32") / 255.0
    # img_tensor = _torch.from_numpy(img_norm).permute(2, 0, 1).unsqueeze(0).to(_device)
    img_resized = cv.resize(cv.cvtColor(img, cv.COLOR_BGR2RGB), (IMG_SIZE, IMG_SIZE))
    img_tensor = _torch.from_numpy(img_resized).permute(2, 0, 1).unsqueeze(0).to(_device)
    img_tensor = img_tensor.float().div_(255.0).to(_device)

    with _torch.inference_mode():
        pred = _model(img_tensor)
        pred = _torch.sigmoid(pred)
        pred = (pred > 0.5).float()

    mask = pred.squeeze().cpu().numpy()

    del img_tensor, pred

    mask = (mask * 255).astype("uint8")

    mask = cv.resize(mask, (w, h))

    # clean mask
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, K5)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, K5)

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)
    contours = [c for c in contours if cv.contourArea(c) > 5000]

    if not contours:
        return None, None, None, None, None

    fish_contour = max(contours, key=cv.contourArea)
    fx, fy, fw, fh = cv.boundingRect(fish_contour)

    fish_only = cv.bitwise_and(img, img, mask=mask)

    ############################################################################################# get_fish_region
    eye_coords, body_coords = get_fish_region_coords(fx, fy, fw, fh)

    ey0, ey1, ex0, ex1 = eye_coords
    by0, by1, bx0, bx1 = body_coords

    head_roi = fish_only[ey0:ey1, ex0:ex1]
    body_roi = fish_only[by0:by1, bx0:bx1]

    return head_roi, body_roi


def is_loaded():
    return _model is not None