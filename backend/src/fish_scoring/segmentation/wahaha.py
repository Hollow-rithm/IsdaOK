import cv2 as cv
IMG_SIZE = 256
img = cv.imread("dataset/gills/BANG_BWM_01_GILLS.jpg")
img_resized = cv.resize(img, (IMG_SIZE, IMG_SIZE))
cv.imshow("orig image", img)
cv.imshow("resized", img_resized)
cv.waitKey(0)
cv.destroyAllWindows()
