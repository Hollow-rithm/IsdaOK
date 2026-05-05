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

def get_dominant_color(eye):
    hsv = cv.cvtColor(eye, cv.COLOR_BGR2HSV)
    h, s, v = cv.split(hsv)

    valid = (s > 40) & (v > 50) & (v < 240)

    if np.sum(valid) < 50:
        return 0, 0  # or some fallback value
    
    h_vals = h[valid].astype(np.float32)

    angles = h_vals * np.pi / 90  # convert to radians (OpenCV scale)

    mean_sin = np.mean(np.sin(angles))
    mean_cos = np.mean(np.cos(angles))

    mean_angle = np.arctan2(mean_sin, mean_cos)
    if mean_angle < 0:
        mean_angle += 2*np.pi

    dominant_hue = mean_angle * 90 / np.pi

    diff = np.angle(np.exp(1j*(angles - mean_angle)))
    hue_std = np.sqrt(np.mean(diff**2)) * 90 / np.pi
    
    return dominant_hue, hue_std

def cloudiness_score(eye):
    gray = cv.cvtColor(eye, cv.COLOR_BGR2GRAY)
    clahe = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
    norm = clahe.apply(gray)
    
    dark_thresh = np.percentile(norm, 20)
    dark_mask   = norm <= dark_thresh
    bright_mask = ~dark_mask
    
    dark_mean   = float(norm[dark_mask].mean())
    bright_mean = float(norm[bright_mask].mean())
    
    # Michelson contrast — 1.0 = max contrast, 0.0 = flat/cloudy
    contrast = (bright_mean - dark_mean) / (bright_mean + dark_mean + 1e-6)
    return float(1.0 - contrast)   # invert: high = cloudy

def sharpness_score(eye):
    gray = cv.cvtColor(eye, cv.COLOR_BGR2GRAY)
    clahe = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8,8))
    norm = clahe.apply(gray)
    
    laplacian = cv.Laplacian(norm, cv.CV_64F)
    variance  = laplacian.var()
    
    cap = 500.0
    clarity = min(variance / cap, 1.0)
    return float(1.0 - clarity)   # invert: high = cloudy

def get_lab_mean(roi_bgr):
    lab = cv.cvtColor(roi_bgr, cv.COLOR_BGR2LAB)
    L, a, b = cv.split(lab)

    mask = L > 10
    if np.sum(mask) == 0:
        return 0.0, 0.0, 0.0
    mean_L = np.mean(L[mask]) * 100.0 / 255.0          # 0–100
    mean_a = np.mean(a[mask].astype(float)) - 128.0    # -128 to +127
    mean_b = np.mean(b[mask].astype(float)) - 128.0    # -128 to +127
    return round(mean_L, 4), round(mean_a, 4), round(mean_b, 4)

def check_blood(eye):
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)
    
    clahe = cv.createCLAHE(clipLimit=3.0, tileGridSize=(8, 8))
    l = clahe.apply(l)
    
    lab = cv.merge([l, a, b])
    norm = cv.cvtColor(lab, cv.COLOR_LAB2BGR)
    
    hsv = cv.cvtColor(norm, cv.COLOR_BGR2HSV)
    h, s, v = cv.split(hsv)
    
    lower_red1 = np.array([0, 80, 50])
    upper_red1 = np.array([10, 255, 255])

    lower_red2 = np.array([170, 80, 50])
    upper_red2 = np.array([180, 255, 255])

    mask1 = cv.inRange(hsv, lower_red1, upper_red1)
    mask2 = cv.inRange(hsv, lower_red2, upper_red2)

    red_mask = cv.bitwise_or(mask1, mask2)
    
    kernel = np.ones((5,5), np.uint8)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_OPEN, kernel)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_CLOSE, kernel)
    
    valid = (s > 80) & (v > 60) & (v < 240)
    red_mask = red_mask & valid.astype(np.uint8)*255
    
    return red_mask

def check_blood2(eye):
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)

    clahe = cv.createCLAHE(clipLimit=3.0, tileGridSize=(8, 8))
    l = clahe.apply(l)

    lab = cv.merge([l, a, b])
    norm = cv.cvtColor(lab, cv.COLOR_LAB2BGR)

    hsv = cv.cvtColor(norm, cv.COLOR_BGR2HSV)
    h, s, v = cv.split(hsv)

    b_ch, g_ch, r_ch = cv.split(norm.astype(np.float32))
    red_dom = r_ch / (g_ch + b_ch + 1e-6)

    strict = (
        ((h <= 10) | (h >= 170)) &   # pure red
        (s > 90) &                   # strong saturation
        (red_dom > 1.2)              # strong red dominance
    )

    loose = (
        ((h <= 25) | (h >= 155)) &   # allow orange-red shift
        (s > 50) &                   # allow weaker saturation
        (red_dom > 1.05)             # still reddish
    )

    red_mask = strict | (loose & (v < 230))

    dark_red = (
        (r_ch > g_ch * 1.1) &
        (r_ch > b_ch * 1.1) &
        (v < 140)
    )

    red_mask = red_mask | dark_red

    red_mask = red_mask.astype(np.uint8) * 255

    kernel = np.ones((3, 3), np.uint8)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_OPEN, kernel)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_CLOSE, kernel)

    # --- 7. Feature extraction (IMPORTANT for ML) ---
    total_pixels = eye.shape[0] * eye.shape[1]
    blood_pixels = np.sum(red_mask > 0)

    blood_ratio = blood_pixels / total_pixels

    if blood_pixels > 0:
        avg_red_dom = float(np.mean(red_dom[red_mask > 0]))
        avg_sat = float(np.mean(s[red_mask > 0]))
        avg_val = float(np.mean(v[red_mask > 0]))
    else:
        avg_red_dom = 0.0
        avg_sat = 0.0
        avg_val = 0.0

    return red_mask, blood_ratio, avg_red_dom, avg_sat, avg_val

def check_blood3(eye):
    # --- Normalize lighting (keep this) ---
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)

    clahe = cv.createCLAHE(clipLimit=3.0, tileGridSize=(8, 8))
    l = clahe.apply(l)

    lab = cv.merge([l, a, b])
    norm = cv.cvtColor(lab, cv.COLOR_LAB2BGR)

    # --- Convert ---
    hsv = cv.cvtColor(norm, cv.COLOR_BGR2HSV)
    h, s, v = cv.split(hsv)

    # --- STRICT RED RULES ONLY ---
    red_mask = (
        (
            (h <= 10) | (h >= 170)   # ONLY red hue range
        ) &
        (s > 70)                   # strong saturation only
    )

    # --- HARD FILTER: remove anything bright (kills orange ring) ---
    red_mask = red_mask & (v < 200)

    # --- OPTIONAL: reinforce with red dominance ---
    b_ch, g_ch, r_ch = cv.split(norm.astype(np.float32))
    red_dom = r_ch / (g_ch + b_ch + 1e-6)

    red_mask = red_mask & (red_dom > 1.25)

    # --- Convert mask ---
    red_mask = red_mask.astype(np.uint8) * 255

    # --- Clean noise (light only) ---
    kernel = np.ones((3, 3), np.uint8)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_OPEN, kernel)

    # --- Features ---
    total_pixels = eye.shape[0] * eye.shape[1]
    blood_pixels = np.sum(red_mask > 0)

    blood_ratio = blood_pixels / total_pixels

    if blood_pixels > 0:
        avg_red_dom = float(np.mean(red_dom[red_mask > 0]))
        avg_sat = float(np.mean(s[red_mask > 0]))
        avg_val = float(np.mean(v[red_mask > 0]))
    else:
        avg_red_dom = 0.0
        avg_sat = 0.0
        avg_val = 0.0

    return red_mask, blood_ratio, avg_red_dom, avg_sat, avg_val

def check_blood4(eye):
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)

    clahe = cv.createCLAHE(clipLimit=3.0, tileGridSize=(8, 8))
    l = clahe.apply(l)

    lab = cv.merge([l, a, b])
    norm = cv.cvtColor(lab, cv.COLOR_LAB2BGR)

    hsv = cv.cvtColor(norm, cv.COLOR_BGR2HSV)
    h, s, v = cv.split(hsv)

    b_ch, g_ch, r_ch = cv.split(norm.astype(np.float32))
    red_dom = r_ch / (g_ch + b_ch + 1e-6)

    # 🔥 balanced mask (not too strict)
    red_mask = (
        ((h <= 10) | (h >= 170)) &
        (s > 50) &
        (red_dom > 1.05)
    )

    red_mask = red_mask.astype(np.uint8) * 255

    # light cleanup
    kernel = np.ones((3, 3), np.uint8)
    red_mask = cv.morphologyEx(red_mask, cv.MORPH_OPEN, kernel)

    total_pixels = eye.shape[0] * eye.shape[1]
    blood_pixels = np.sum(red_mask > 0)

    # 🔥 suppress false positives
    if blood_pixels < 20:
        blood_ratio = 0.0
    else:
        blood_ratio = blood_pixels / total_pixels

    if blood_pixels > 0:
        avg_red_dom = float(np.mean(red_dom[red_mask > 0]))
        avg_sat = float(np.mean(s[red_mask > 0]))
        avg_val = float(np.mean(v[red_mask > 0]))
    else:
        avg_red_dom = 0.0
        avg_sat = 0.0
        avg_val = 0.0

    return red_mask, blood_ratio, avg_red_dom, avg_sat, avg_val

def check_blood5(eye):
    img = eye.astype(np.float32)
    b_ch, g_ch, r_ch = cv.split(img)

    # Red intensity
    red_intensity = r_ch - (g_ch + b_ch) / 2
    red_intensity = np.clip(red_intensity, 0, 255)


    mean_red_intensity = float(np.mean(red_intensity))
    max_red_intensity = float(np.max(red_intensity))
    std_red_intensity = float(np.std(red_intensity))
    high_intensity_ratio = float(np.sum(red_intensity > 80) / red_intensity.size)

    return mean_red_intensity, max_red_intensity, std_red_intensity, high_intensity_ratio

def check_blood6(eye):
    lab = cv.cvtColor(eye, cv.COLOR_BGR2LAB)
    l, a, b = cv.split(lab)

    # OpenCV a-channel is [0–255], center is 128
    a_centered = a.astype(np.float32) - 128.0

    # --- basic features ---
    mean_a = float(np.mean(a_centered))        # overall redness
    std_a = float(np.std(a_centered))          # variation (patchiness)

    # --- red pixel ratio (soft, not strict) ---
    red_pixels = a_centered > 10   # threshold for “reddish”
    red_ratio = np.sum(red_pixels) / (eye.shape[0] * eye.shape[1])

    return mean_a, std_a, red_ratio

def main():
    img_path = f"datasets/images/{sys.argv[1]}_{sys.argv[2]}_{sys.argv[3]}_FULL.jpg" if len(sys.argv) >= 3 else "tila.jpg"
    img = cv.imread(img_path)

    mask, fish_contour, fx, fy, fw, fh = segment_fish(img)

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
    
    # circles = np.uint16(np.around(circles))
    # for i in circles[0,:]:
    #     # draw the outer circle
    #     cv.circle(img,(i[0],i[1]),i[2],(0,255,0),2)
    #     # draw the center of the circle
    #     cv.circle(img,(i[0],i[1]),2,(0,0,255),3)
        
    if best is not None:
        x, y, r = best
        # cv.circle(head_roi, (x, y), r, (0, 255, 0), 2)
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

        # Save results
    else:
        print("no eye detected")
        return
        
    #blood = check_blood2(eye_box_circular)
    
    # red_mask, blood_ratio, avg_red_dom, avg_sat, avg_val = check_blood4(eye_box_circular)
    # blood = cv.bitwise_and(eye_box_circular, eye_box_circular, mask=red_mask)

    # print("Blood Ratio: ", blood_ratio)
    # print("Average Red Dom: ", avg_red_dom)
    # print("Average Sat: ", avg_sat)
    # print("Average Val: ", avg_val)
    
    mean_a, std_a, red_ratio = check_blood6(eye_box_circular)
    
    # mean_red_intensity, max_red_intensity, std_red_intensity, high_intensity_ratio = check_blood5(eye_box)
    # print("mean red intesity: ", mean_red_intensity)
    # print("max red intesity: ", max_red_intensity)
    # print("std red intesity: ", std_red_intensity)
    # print("high intesity ratio: ", high_intensity_ratio)

    print("mean a: ", mean_a)
    print("std a: ", std_a)
    print("red ratio: ", red_ratio)
    save("eye", eye_box)
    save("body", body_roi)
    
def batch_process(folder):
    files = [f for f in os.listdir(folder) if f.lower().endswith(".jpg")]
    
    # fields = ['Species', 'Location', 'No#', 'RelativeL', 'Mean Red Intensity', 'Max Red Intensity', 'Std. Red Intensity', 'High Intensity Ratio']
    fields = ['Species', 'Location', 'No#', 'RelativeL', 'Red Ratio', 'Mean a', 'Std. a']
    rows = []
    
    out_dir = "circles"
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
                # cv.circle(img, (x, y), r, (255, 0, 0), 2)

                h, w = head_roi.shape[:2]

                min_dim = min(h, w)

                if r < min_dim * 0.0999:
                    scale = 1.5
                else:
                    scale = 1.0
                
                # r_scaled = int(r * scale)
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
            cv.imwrite(save_path, fish_only)
                
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
    # main()
    batch_process("fish/")