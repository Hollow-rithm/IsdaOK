import cv2 as cv
import numpy as np
import os
import sys
import torch
import segmentation_models_pytorch as smp

import csv

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
    eye_end = fy + int(0.15 * fh)
    body_end = fy + int(0.80 * fh)
    tail_end = fy + fh
    x0, x1 = fx, fx + fw
    return (
        (fy, eye_end, x0, x1),
        (eye_end, body_end, x0, x1),
        (body_end, tail_end, x0, x1),
    )

def preprocess(head_roi):
    gray = cv.cvtColor(head_roi, cv.COLOR_BGR2GRAY)
    denoise = cv.fastNlMeansDenoising(gray, None, 10, 7, 21)
    
    clahe = cv.createCLAHE(clipLimit=6.0, tileGridSize=(4, 4))  # was 3.0
    enhanced = clahe.apply(denoise)
    
    kernel = np.array([[0, -1, 0],
                       [-1, 5, -1],
                       [0, -1, 0]])
    sharpened_gray = cv.filter2D(enhanced, -1, kernel)
    sharpened_rgb = cv.cvtColor(sharpened_gray, cv.COLOR_GRAY2BGR)

    return sharpened_rgb, sharpened_gray

def get_edges(head_roi):
    b, g, r = cv.split(head_roi)
    
    r = cv.GaussianBlur(r, (5, 5), 0)
    g = cv.GaussianBlur(g, (5, 5), 0)
    b = cv.GaussianBlur(b, (5, 5), 0)
    
    r_edges = cv.Canny(r, 20, 200)
    g_edges = cv.Canny(g, 20, 200)
    b_edges = cv.Canny(b, 20, 200)

    rg = cv.bitwise_or(r_edges, g_edges, mask=None)
    edges = cv.bitwise_or(rg, b_edges, mask=None)
    
    kernel = np.ones((5, 5), np.uint8)
    edges = cv.morphologyEx(edges, cv.MORPH_CLOSE, kernel)
    
    return edges

def isolate_eye_hough(gray):
    blur = cv.GaussianBlur(gray, (5, 5), 0)
    h, w = gray.shape
    circles = cv.HoughCircles(
        blur,
        cv.HOUGH_GRADIENT,
        dp=1,
        minDist=int(min(h, w) * 0.5),
        param1=80,
        param2=32,
        minRadius=20,
        maxRadius=60
    )
    return circles

def pick_darkest_largest_circle(circles, gray, reflect_mask=None):
    if circles is None:
        return None

    # circles = np.uint16(np.around(circles))
    circles = np.int32(np.around(circles))
    h, w = gray.shape

    best_circle = None
    best_score = -1e9

    for i in circles[0, :]:
        x, y, r = i

        mask = np.zeros((h, w), dtype=np.uint8)
        cv.circle(mask, (x, y), r, 255, -1)

        if reflect_mask is not None:
            mask = cv.bitwise_and(mask, cv.bitwise_not(reflect_mask))

        pixels = gray[mask == 255]

        if len(pixels) < 10:
            continue

        mean_intensity = np.mean(pixels)          # lower = darker
        darkness_score = 255 - mean_intensity      # higher = better

        dark_pixel = pixels < 60
        # darkness_score = np.sum(dark_pixel) / len(pixels)
        radius_score = r                           # larger = better

        # --- COMBINE SCORE ---
        score = (
            0.3 * darkness_score +
            0.7 * radius_score
        )

        if score > best_score:
            best_score = score
            best_circle = (x, y, r)

    return best_circle

def get_lab_mean(roi_bgr):
    lab = cv.cvtColor(roi_bgr, cv.COLOR_BGR2LAB)
    L, a, b = cv.split(lab)

    mask = L > 10
    if np.sum(mask) == 0:
        return 0.0, 0.0, 0.0
    mean_L = np.mean(L[mask]) * 100.0 / 255.0          
    mean_a = np.mean(a[mask].astype(float)) - 128.0    
    mean_b = np.mean(b[mask].astype(float)) - 128.0    
    return round(mean_L, 4), round(mean_a, 4), round(mean_b, 4)

def check_blood(eye):
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)

    a_centered = a.astype(np.float32) - 128.0

    mean_a = float(np.mean(a_centered))        
    std_a = float(np.std(a_centered))          

    red_pixels = a_centered > 10   
    red_ratio = np.sum(red_pixels) / (eye.shape[0] * eye.shape[1])

    return mean_a, std_a, red_ratio

def main():
    img_path = f"datasets/images/{sys.argv[1]}_{sys.argv[2]}_{sys.argv[3]}_FULL.jpg" if len(sys.argv) >= 3 else "tila.jpg"
    img = cv.imread(img_path)

    mask, _, fx, fy, fw, fh = segment_fish(img)

    fish_only = cv.bitwise_and(img, img, mask=mask)

    eye_coords, body_coords, _ = get_fish_region_coords(fx, fy, fw, fh)

    ey0, ey1, ex0, ex1 = eye_coords
    by0, by1, bx0, bx1 = body_coords

    head_roi = fish_only[ey0:ey1, ex0:ex1]
    body_roi = fish_only[by0:by1, bx0:bx1]
   
    enhanced, gray = preprocess(head_roi)
    edges = get_edges(enhanced)
    circles = isolate_eye_hough(edges)
    best = pick_darkest_largest_circle(circles, gray)
    
    eye_box_circular = None
    
    if best is not None:
        x, y, r = best
        print("Radius: ", r)

        h, w = head_roi.shape[:2]

        min_dim = min(h, w)
        print("min_dim * scale: ", min_dim * 0.099)

        if r < min_dim * 0.09999:
            scale = 1.5
        else:
            scale = 1.0

        r_scaled = int(r * scale)

        x0 = max(x - r_scaled, 0)
        y0 = max(y - r_scaled, 0)
        x1 = min(x + r_scaled, w)
        y1 = min(y + r_scaled, h)

        box_mask = np.zeros((h, w), dtype=np.uint8)
        box_mask[y0:y1, x0:x1] = 255

        eye_box = cv.bitwise_and(head_roi, head_roi, mask=box_mask)

        circle_mask = np.zeros((h, w), dtype=np.uint8)
    
        internal_radius = int(r_scaled * 0.9) 
        cv.circle(circle_mask, (x, y), internal_radius, 255, -1)

        final_mask = cv.bitwise_and(box_mask, circle_mask)

        eye_box_circular = cv.bitwise_and(head_roi, head_roi, mask=final_mask)

    else:
        print("no eye detected")
        return
        
    mean_a, std_a, red_ratio = check_blood(eye_box_circular)
    eye_L, _, _ = get_lab_mean(eye_box_circular)
    body_L, _, _ = get_lab_mean(body_roi)
    relative_L = round(eye_L / (body_L + 1e-6), 4)
    
    print("Mean a: ", mean_a)
    print("Std a: ", std_a)
    print("Red Ratio: ", red_ratio)
    print("RelativeL: ", relative_L)

    save("eye", eye_box)
    save("body", body_roi)
    
def batch_process(folder):
    files = [f for f in os.listdir(folder) if f.lower().endswith(".jpg")]
    
    fields = ['Species', 'Location', 'No#', 'RelativeL', 'Red Ratio', 'Mean a', 'Std. a']
    rows = []
    
    out_dir = "eyes3"
    os.makedirs(out_dir, exist_ok=True)
    total = 0
    fail = 0

    for f in files:
        path = os.path.join(folder, f)
        img = cv.imread(path)
        
        species = f.split("_")[0].upper()
        loc = f.split("_")[1].upper()
        num = f.split("_")[2].upper()

        if img is None:
            continue 
            
        total += 1
        
        try:
            mask, fish_contour, fx, fy, fw, fh = segment_fish(img)

            if fish_contour is None:
                print(f"[FAIL] No fish: {f}")
                continue

            fish_only = cv.bitwise_and(img, img, mask=mask)

            eye_coords, body_coords, _ = get_fish_region_coords(fx, fy, fw, fh)

            ey0, ey1, ex0, ex1 = eye_coords
            by0, by1, bx0, bx1 = body_coords

            head_roi = fish_only[ey0:ey1, ex0:ex1]
            body_roi = fish_only[by0:by1, bx0:bx1]

            if head_roi.size == 0:
                print(f"[FAIL] Empty ROI: {f}")
                continue
            

            enhanced, gray = preprocess(head_roi)
            edges = get_edges(enhanced)
            circles = isolate_eye_hough(edges)
            best = pick_darkest_largest_circle(circles, gray)

            if circles is None:
                print(f, ": No Circle")
                fail += 1
                continue

            if best is not None:
                x, y, r = best
                h, w = head_roi.shape[:2]

                min_dim = min(h, w)

                if r < min_dim * 0.0999:
                    scale = 1.5
                else:
                    scale = 1.0
                
                r_scaled = int(r * 2)

                x0 = max(x - r_scaled, 0)
                y0 = max(y - r_scaled, 0)
                x1 = min(x + r_scaled, w)
                y1 = min(y + r_scaled, h)

                box_mask = np.zeros((h, w), dtype=np.uint8)
                box_mask[y0:y1, x0:x1] = 255

                eye_box = cv.bitwise_and(head_roi, head_roi, mask=box_mask)

                save("eye_box", eye_box)
                
                circle_mask = np.zeros((h, w), dtype=np.uint8)
            
                internal_radius = int(r_scaled * 0.9) 
                cv.circle(circle_mask, (x, y), internal_radius, 255, -1)

                final_mask = cv.bitwise_and(box_mask, circle_mask)

                eye_box_circular = cv.bitwise_and(head_roi, head_roi, mask=final_mask)

                save("eye_box_circular", eye_box_circular)
            else:
                print("no eye detected") 
            
            eye_L, _, _ = get_lab_mean(eye_box_circular)
            body_L, _, _ = get_lab_mean(body_roi)
            relative_L = round(eye_L / (body_L + 1e-6), 4)
            

            mean_a, std_a, red_ratio = check_blood6(eye_box_circular)

            save_path = os.path.join(out_dir, f)
            cv.imwrite(save_path, eye_box_circular)
                
            rows.append([species, loc, num, relative_L, red_ratio, mean_a, std_a])
            print(f, ": Done")
        except Exception as e:
            print(f"[ERROR] {f}: {e}")
     
    filename = "features2.csv"
    with open(filename, "w", newline="") as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(fields)
        csvwriter.writerows(rows)
     
    print("All Done")
    print("Total: ", total)
    print("Fail/s: ", fail)
    
if __name__ == "__main__":
    main()
    # batch_process("fish/")