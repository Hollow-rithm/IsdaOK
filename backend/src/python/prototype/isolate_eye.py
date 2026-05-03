import cv2 as cv
import numpy as np
import os

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

def auto_canny(image, sigma=0.33):
    v = np.median(image)

    lower = int(max(0, (1.0 - sigma) * v))
    upper = int(min(255, (1.0 + sigma) * v))

    return cv.Canny(image, lower, upper)

def preprocess(head_roi):
    gray = cv.cvtColor(head_roi, cv.COLOR_BGR2GRAY)
    denoise = cv.fastNlMeansDenoising(gray, None, 10, 7, 21)
    
    # More aggressive CLAHE for low contrast eyes
    clahe = cv.createCLAHE(clipLimit=6.0, tileGridSize=(4, 4))  # was 3.0
    enhanced = clahe.apply(denoise)
    
    # Additional sharpening to bring out edges
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
    # r_edges = auto_canny(r, 0.45)
    # g_edges = auto_canny(g,  0.45)
    # b_edges = auto_canny(b, 0.45)
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

def pick_darkest_largest_circle2(circles, gray, reflect_mask=None):
    if circles is None:
        return None
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
        mean_intensity = np.mean(pixels)
        darkness_norm = (255 - mean_intensity) / 255.0   # 0-1
        radius_norm = r / 60.0                            # 0-1
        score = 0.6 * darkness_norm + 0.4 * radius_norm
        if score > best_score:
            best_score = score
            best_circle = (x, y, r)
    return best_circle

def main():
    # img_path = "eye_debug/head.jpg"
    img_path = "eye_success/TILA_BWM_17_FULL.jpg"
    img = cv.imread(img_path)
    
    enhanced, gray = preprocess(img)
    edges = get_edges(enhanced)
    circles = isolate_eye_hough(edges)
    best = pick_darkest_largest_circle(circles, gray)
    
    circles = np.uint16(np.around(circles))
    for i in circles[0,:]:
        # draw the outer circle
        cv.circle(img,(i[0],i[1]),i[2],(0,255,0),2)
        # draw the center of the circle
        cv.circle(img,(i[0],i[1]),2,(0,0,255),3)
        
    if best is not None:
        x, y, r = best
        # cv.circle(eye_roi, (x, y), r, (0, 255, 0), 2)

        h, w = img.shape[:2]

        min_dim = min(h, w)

        if r < min_dim * 0.15:
            scale = 2.0
        else:
            scale = 1.2

        r_scaled = int(r * scale)

        x0 = max(x - r_scaled, 0)
        y0 = max(y - r_scaled, 0)
        x1 = min(x + r_scaled, w)
        y1 = min(y + r_scaled, h)

        box_mask = np.zeros((h, w), dtype=np.uint8)
        box_mask[y0:y1, x0:x1] = 255

        eye_box = cv.bitwise_and(img, img, mask=box_mask)

        save("eye_box", eye_box)
        
        circle_mask = np.zeros((h, w), dtype=np.uint8)
    
        internal_radius = int(r_scaled * 0.9) 
        cv.circle(circle_mask, (x, y), internal_radius, 255, -1)

        final_mask = cv.bitwise_and(box_mask, circle_mask)

        eye_box_circular = cv.bitwise_and(img, img, mask=final_mask)

        # Save results
        save("eye_box_circular", eye_box_circular)
    else:
        print("no eye detected")
    
    save("edges", edges)
    save("enhanced", enhanced)
    save("eye", eye_box_circular)
    
def batch_process(folder):
    files = [f for f in os.listdir(folder) if f.lower().endswith(".jpg")]
    
    out_dir = "circles"
    os.makedirs(out_dir, exist_ok=True)
    total = 0
    fail = 0

    for f in files:
        path = os.path.join(folder, f)
        img = cv.imread(path)

        if img is None:
            continue 
            
        total += 1
        
        try:
            enhanced, gray = preprocess(img)
            edges = get_edges(enhanced)
            circles = isolate_eye_hough(edges)
            best = pick_darkest_largest_circle(circles, gray)
            
            # enhanced = preprocessing(img)
            # edges = get_edges(enhanced)
            # circles = isolate_eye(edges)

            if circles is None:
                print(f, ": No Circle")
                fail += 1
                continue

            # circles = np.uint16(np.around(circles))
            # for i in circles[0,:]:
            #     # draw the outer circle
            #     cv.circle(img,(i[0],i[1]),i[2],(0,255,0),2)
            #     # draw the center of the circle
            #     cv.circle(img,(i[0],i[1]),2,(0,0,255),3)
                
            if best is not None:
                x, y, r = best
                cv.circle(img, (x, y), r, (255, 0, 0), 2)

                h, w = img.shape[:2]

                min_dim = min(h, w)

                if r < min_dim * 0.5:
                    scale = 1.2
                else:
                    scale = 5.0

                r_scaled = int(r * scale)

                x0 = max(x - r_scaled, 0)
                y0 = max(y - r_scaled, 0)
                x1 = min(x + r_scaled, w)
                y1 = min(y + r_scaled, h)

                box_mask = np.zeros((h, w), dtype=np.uint8)
                box_mask[y0:y1, x0:x1] = 255

                eye_box = cv.bitwise_and(img, img, mask=box_mask)

                save("eye_box", eye_box)
                
                circle_mask = np.zeros((h, w), dtype=np.uint8)
            
                internal_radius = int(r_scaled * 0.9) 
                cv.circle(circle_mask, (x, y), internal_radius, 255, -1)

                final_mask = cv.bitwise_and(box_mask, circle_mask)

                eye_box_circular = cv.bitwise_and(img, img, mask=final_mask)

                save("eye_box_circular", eye_box_circular)
            else:
                print("no eye detected") 

            save_path = os.path.join(out_dir, f)
            cv.imwrite(save_path, eye_box_circular)
            print(f, ": Done")
        except Exception as e:
            print(f"[ERROR] {f}: {e}")
        
    print("All Done")
    print("Total: ", total)
    print("Fail/s: ", fail)
    
if __name__ == "__main__":
    # main()
    batch_process("eye_success/")