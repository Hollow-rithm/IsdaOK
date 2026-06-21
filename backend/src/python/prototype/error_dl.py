import torch
import torch.nn as nn
from torchvision import models, transforms
from PIL import Image

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# DAPAT NAKA MATCH YUNG FOLDER NAME SA CLASS NAMES
class_names = ["partial_fish", "valid", "wrong_orientation"]

transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(
        mean=[0.485, 0.456, 0.406],
        std=[0.229, 0.224, 0.225]
    )
])

model = models.resnet18(weights=None)
model.fc = nn.Linear(model.fc.in_features, 3)

model.load_state_dict(torch.load("best_error_model.pth", map_location=device))
model.to(device)
model.eval()

def predict_image(image_path):
    image = Image.open(image_path).convert("RGB")
    img_tensor = transform(image).unsqueeze(0).to(device)

    with torch.no_grad():
        output = model(img_tensor)
        probs = torch.softmax(output, dim=1)

        confidence, pred = torch.max(probs, 1)

    class_id = pred.item()
    confidence = confidence.item()

    return class_id, confidence

def validate_image(image_path, threshold=0.6):
    class_id, conf = predict_image(image_path)
    label = class_names[class_id]

    print("\nPrediction:", label)
    print("Confidence:", round(conf, 4))

    if label == "valid" and conf >= threshold:
        print("Valid")
        return "PASS"

    elif label == "partial_fish":
        print("Partial Fish")
        return "REJECT"

    elif label == "wrong_orientation":
        print("Wrong Orientation")
        return "REJECT"

    else:
        print("invalid input")
        return "REJECT"

if __name__ == "__main__":
    img_path = "test6.jpg"

    result = validate_image(img_path)

    print("\nFinal Result:", result)