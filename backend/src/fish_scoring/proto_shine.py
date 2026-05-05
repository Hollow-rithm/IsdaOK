import cv2 as cv
import numpy as np
import os
import sys
import torch
import csv
import segmentation_models_pytorch as smp

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

model = smp.Unet(
    encoder_name="resnet34",
    encoder_weights=None,
    in_channels=3,
    classes=1
).to(device)

model.load_state_dict(torch.load("unet_fish.pth", map_location=device))
model.eval()

def save(name, img, dir="eye_debug"):
    os.makedirs(dir, exist_ok=True)
    if img is None or img.size == 0:
        return
    out = img.copy()
    h, w = out.shape[:2]
    scale = min(800 / w, 800 / h, 1.0)
    if scale < 1.0:
        out = cv.resize(out, (int(w * scale), int(h * scale)))
    cv.imwrite(f"{dir}/{name}.jpg", out)

def segment_fish(img):
    original = img.copy()
    H, W = original.shape[:2]

    IMG_SIZE = 256

    img_rgb = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    img_resized = cv.resize(img_rgb, (IMG_SIZE, IMG_SIZE))
    img_norm = img_resized.astype("float32") / 255.0

    img_tensor = torch.from_numpy(img_norm).permute(2, 0, 1).unsqueeze(0).to(device)

    with torch.no_grad():
        pred = model(img_tensor)
        pred = torch.sigmoid(pred)
        pred = (pred > 0.5).float()

    mask = pred.squeeze().cpu().numpy()
    mask = (mask * 255).astype("uint8")

    mask = cv.resize(mask, (W, H))

    # clean mask
    k5 = np.ones((5, 5), np.uint8)
    mask = cv.morphologyEx(mask, cv.MORPH_CLOSE, k5)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN, k5)

    contours, _ = cv.findContours(mask, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)
    contours = [c for c in contours if cv.contourArea(c) > 5000]

    if not contours:
        return None, None, 0, 0, 0, 0

    fish_contour = max(contours, key=cv.contourArea)
    fx, fy, fw, fh = cv.boundingRect(fish_contour)

    return mask, fish_contour, fx, fy, fw, fh

def get_fish_region_coords(fx, fy, fw, fh):
    eye_end = fy + int(0.10 * fh)
    body_end = fy + int(0.80 * fh)
    tail_end = fy + fh
    x0, x1 = fx, fx + fw
    return (
        (fy, eye_end, x0, x1),
        (eye_end, body_end, x0, x1),
        (body_end, tail_end, x0, x1),
    )


def shininess_evaluation_surgical(body_roi):
    hsv = cv.cvtColor(body_roi, cv.COLOR_BGR2HSV)
    h_ch, s_ch, v_ch = cv.split(hsv)
    
    # 1. ENHANCE PEAKS (The Top-Hat "strict" kernel)
    # Using a slightly smaller kernel (15) keeps it focused on sharp reflections
    kernel = cv.getStructuringElement(cv.MORPH_ELLIPSE, (15, 15))
    tophat = cv.morphologyEx(v_ch, cv.MORPH_TOPHAT, kernel)
    
    # 2. ADAPTIVE PEAK DETECTION (Otsu #1)
    # This finds the core of the highlights
    otsu_val, seeds = cv.threshold(tophat, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)

    # 3. STRICT SATURATION GATE (Otsu #2)
    # Instead of a hard number like 100, we let Otsu find the "colorless" 
    # threshold for THIS specific fish. This is the key to strictness.
    # Shine is white (Low S), so we use BINARY_INV.
    _, s_strict_mask = cv.threshold(s_ch, 0, 255, cv.THRESH_BINARY_INV + cv.THRESH_OTSU)

    # 4. HARD INTENSITY FLOOR
    # A true "shine" is objectively bright. We ignore anything below the 60% mark.
    v_thresh = max(otsu_val, 180)  # adaptive but still strict
    _, v_hard_gate = cv.threshold(v_ch, v_thresh, 255, cv.THRESH_BINARY)
    # _, v_hard_gate = cv.threshold(v_ch, 200, 255, cv.THRESH_BINARY)

    # 5. FUSE CRITERIA
    # Seed (Peak) + Colorless (S-Otsu) + Bright (V-Gate)
    candidate_mask = cv.bitwise_and(seeds, s_strict_mask)
    strict_mask = cv.bitwise_and(candidate_mask, v_hard_gate)

    # 6. REFINEMENT (Remove tiny single-pixel noise)
    # This ensures only "real" pools of light remain.
    clean_k = cv.getStructuringElement(cv.MORPH_ELLIPSE, (3, 3))
    final_mask = cv.morphologyEx(strict_mask, cv.MORPH_OPEN, clean_k)

    # 7. METRICS
    body_mask = (v_ch > 15).astype(np.uint8) * 255
    body_area = cv.countNonZero(body_mask)
    specular_pixels = cv.countNonZero(final_mask)
    
    coverage = specular_pixels / body_area if body_area > 0 else 0
    average = np.mean(v_ch[final_mask > 0]) if specular_pixels > 0 else 0

    return coverage, average, final_mask, specular_pixels, body_area

def main():
    img_path = f"datasets/images/{sys.argv[1]}_{sys.argv[2]}_{sys.argv[3]}_FULL.jpg" if len(sys.argv) >= 3 else "tila.jpg"
    img = cv.imread(img_path)
    
    print("File Name: ", img_path)

    if img is None:
        print("Cannot read image")
        return

    mask, fish_contour, fx, fy, fw, fh = segment_fish(img)

    if fish_contour is None:
        print("No fish detected")
        return

    fish_only = cv.bitwise_and(img, img, mask=mask)

    eye_coords, body_coords, tail_coords = get_fish_region_coords(fx, fy, fw, fh)

    ey0, ey1, ex0, ex1 = eye_coords
    by0, by1, bx0, bx1 = body_coords

    eye_roi = fish_only[ey0:ey1, ex0:ex1]
    body_roi = fish_only[by0:by1, bx0:bx1]
    
    specular_coverage, specular_average, specular_mask, reflection, pixel = shininess_evaluation_surgical(body_roi)
    
    save("specular_mask", specular_mask)
    save("body", body_roi)
    
    print("average", specular_average)
    print("coverage", specular_coverage)
    print("Reflections", reflection)
    print("Pixel", pixel)
    
def batch_process(folder):
    files = [f for f in os.listdir(folder) if f.lower().endswith(".jpg")]

    fields = ['Name', 'Average', 'Coverage', 'Reflection Count', 'Pixel Count']
    rows = []
    for f in files:
        path = os.path.join(folder, f)
        img = cv.imread(path)


        if img is None:
            continue

        try:
            mask, fish_contour, fx, fy, fw, fh = segment_fish(img)

            if fish_contour is None:
                print(f"[FAIL] No fish: {f}")
                continue

            fish_only = cv.bitwise_and(img, img, mask=mask)

            _, body_coords, _ = get_fish_region_coords(fx, fy, fw, fh)
            by0, by1, bx0, bx1 = body_coords

            body_roi = fish_only[by0:by1, bx0:bx1]

            if body_roi.size == 0:
                print(f"[FAIL] Empty ROI: {f}")
                continue
            
            specular_coverage, specular_average, specular_mask, reflection, pixel = shininess_evaluation_surgical(body_roi)

            rows.append([f, specular_average, specular_coverage, reflection, pixel])
            
            print(f"{f}: DONE")

        except Exception as e:
            print(f"[ERROR] {f}: {e}")
    
    filename = "shininess.csv"
    with open(filename, "w", newline="") as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(fields)
        csvwriter.writerows(rows)

if __name__ == "__main__":
    main()
    # batch_process("datasets/images")