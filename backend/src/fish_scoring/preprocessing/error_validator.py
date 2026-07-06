import os
import cv2 as cv
from torchvision import models, transforms
from PIL import Image

_model = None
_device = None
_torch = None
_smp = None

MODEL_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), '../artifacts/error_model.pth'))

# Must match the folder names used during training
class_names = [
    "multiple_fish",
    "no_fish",
    "out_of_scope",
    "partial_fish",
    "valid",
    "wrong_orientation"
]

transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(
        mean=[0.485, 0.456, 0.406],
        std=[0.229, 0.224, 0.225]
    )
])

def _load_validator():
    global _model, _device, _torch, _smp

    if _model is not None:
        return
    
    print("Loading validation model...")

    import torch
    import torch.nn as nn

    _torch = torch
    _device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    # FOR error_model.pth
    _model = models.resnet18(weights=None)
    _model.fc = nn.Linear(_model.fc.in_features, 6)
    
    # FOR error_model2.pth
    # _model = models.efficientnet_b0(weights=None)
    # _model.classifier[1] = nn.Linear(_model.classifier[1].in_features, 6)

    checkpoint = torch.load(MODEL_PATH, map_location=_device)
    _model.load_state_dict(checkpoint)
    _model.to(_device)
    _model.eval()

    print(f"Validator loaded on {_device}..")

def validate_image(img):
    _load_validator()
    image = Image.fromarray(cv.cvtColor(img, cv.COLOR_BGR2RGB))
    img_tensor = transform(image).unsqueeze(0).to(_device)

    with _torch.no_grad():
        outputs = _model(img_tensor)
        probs = _torch.softmax(outputs, dim=1)

        confidence, pred = _torch.max(probs, 1)

    prediction = class_names[pred.item()]
    confidence = confidence.item()

    if prediction == "no_fish":
        status = "NO_FISH"
        message = "No fish detected in the image."
    elif prediction == "multiple_fish":
        status = "MULTIPLE_FISH"
        message = "Multiple fish detected. Please capture singular fish."
    elif prediction == "out_of_scope":
        status = "OUT_OF_SCOPE"
        message = "Out of scope species detected."
    elif prediction == "partial_fish":
        status = "PARTIAL_FISH"
        message = "Partial fish detected. Please recapture."
    elif prediction == "wrong_orientation":
        status = "WRONG_ORIENTATION"
        message = "Fish detected with wrong orientation. Please recapture."
    elif prediction == "valid":
        return None
    
    return {
        "status": status,
        "message": message,
        "confidence": f"{confidence:.2f}"
    }


def is_loaded():
    return _model is not None