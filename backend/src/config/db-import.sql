-- IsdaOK synthetic history import
-- Generated from fish measurement CSV

USE `isdaok`;
START TRANSACTION;

SET @user_id = 1;

-- CSV row 2
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 67.900, 68.900, 81.800, 75.15000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.053, 242.09, -10.502);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.928, 0, 1141, 0.075, 32);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.97, 180.28, 88.26, 0.061, 0.238);

-- CSV row 3
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.00, 75.00, 56.400, 61.50000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 238.88, -12.908);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.159, 0, 629, 0.15, 42.15);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.67, 151.72, 96.54, 0.293, 0.254);

-- CSV row 4
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 44.100, 70.200, 72.900, 66.33000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 234.24, -10.309);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.725, 0.002, 481, 0.173, 38.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.35, 179.55, 88.44, 0.135, 0.246);

-- CSV row 5
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 47.900, 94.200, 72.900, 74.29000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 236.43, -12.365);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.484, 0, 1404, 0.142, 33.97);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.79, 159.59, 95.02, 0.093, 0.237);

-- CSV row 6
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 57.300, 84.00, 83.900, 78.61000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 242.67, -8.989);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.294, 0, 1350, 0.109, 37.54);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.26, 157.24, 76.01, 0.02, 0.27);

-- CSV row 7
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 52.600, 60.900, 65.100, 61.34000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 236.17, -10.94);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.737, 0.079, 845, 0.101, 38.79);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.93, 166.91, 102.48, 0.227, 0.196);

-- CSV row 8
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.300, 34.900, 59.800, 50.63000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 238.54, -9.761);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 12, 0.447, 670, 0.113, 79.65);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.34, 167.47, 82.74, 0.316, 0.27);

-- CSV row 9
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 33.300, 71.00, 67.100, 61.51000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 227.97, -10.104);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.059, 0, 1039, 0.076, 28.87);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.06, 166.68, 69, 0.18, 0.265);

-- CSV row 10
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 46.200, 78.00, 85.100, 75.19000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.029, 232.78, -10.555);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.139, 0, 1349, 0.079, 30.85);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4, 178.49, 79.61, 0.057, 0.18);

-- CSV row 11
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 53.500, 82.300, 78.700, 74.74000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.025, 240.49, -8.395);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.344, 0, 1326, 0.117, 33.86);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.02, 168.91, 130.12, 0.025, 0.226);

-- CSV row 12
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 41.800, 60.400, 89.100, 71.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.064, 233.91, -3.803);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.283, 0, 578, 0.085, 33.83);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.81, 171.5, 102.8, 0.001, 0.266);

-- CSV row 13
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.400, 77.00, 94.100, 75.83000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 233.12, -2.584);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.625, 0, 1412, 0.102, 41.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.62, 207.63, 87.72, 0, 0.19);

-- CSV row 14
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 39.300, 61.900, 78.700, 65.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.092, 235.01, 1.177);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.19, 0, 175, 0.118, 31.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.77, 146.12, 116.8, 0.029, 0.296);

-- CSV row 15
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 39.300, 67.600, 89.100, 72.69000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.082, 235.17, 0.159);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.765, 0, 411, 0.114, 35.48);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.22, 174.25, 92.59, 0.001, 0.251);

-- CSV row 16
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 65.500, 65.700, 86.100, 75.86000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 238.34, -8.825);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.686, 0, 902, 0.065, 27.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.64, 166.27, 93.59, 0.004, 0.283);

-- CSV row 17
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 26.800, 85.300, 88.300, 75.10000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.053, 230.75, -0.788);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.063, 0, 1278, 0.122, 45.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.86, 173.06, 114.02, 0.003, 0.311);

-- CSV row 18
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 39.300, 47.500, 91.100, 67.66000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.08, 236, 0.607);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.177, 0, 331, 0.087, 50.76);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.03, 169.78, 81.32, 0.002, 0.194);

-- CSV row 19
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.800, 51.00, 80.300, 61.21000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 234.08, 2.98);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.773, 0, 816, 0.064, 48.76);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.61, 152.55, 103.44, 0.024, 0.25);

-- CSV row 20
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 25.00, 47.400, 85.500, 61.97000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.054, 229.33, -0.929);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.225, 0, 277, 0.053, 35.11);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.4, 159.89, 143.24, 0.001, 0.321);

-- CSV row 21
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 31.900, 39.100, 81.900, 59.06000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.08, 233.07, 1.684);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.524, 0, 244, 0.074, 50.77);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.1, 154.9, 113.62, 0.037, 0.299);

-- CSV row 22
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 9.700, 71.600, 44.400, 45.62000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 225.73, 0.205);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.454, 0, 1148, 0.082, 13.9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.35, 167.35, 107.63, 0.588, 0.346);

-- CSV row 23
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 13.600, 69.200, 80.600, 63.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 224.2, -2.568);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.73, 0.001, 733, 0.099, 21.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.2, 176.57, 95.42, 0.067, 0.289);

-- CSV row 24
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 12.700, 48.600, 46.200, 40.22000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 222.9, -1.736);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.849, 0, 369, 0.072, 19.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.18, 168.85, 112.74, 0.522, 0.311);

-- CSV row 25
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 17.500, 69.500, 64.800, 56.75000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 226.12, -2.283);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.552, 0, 1114, 0.069, 21.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.82, 187.92, 88.28, 0.298, 0.363);

-- CSV row 26
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 7.700, 46.300, 64.00, 47.43000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 218.63, -0.137);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.368, 0, 238, 0.071, 17.57);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.61, 154.26, 77.78, 0.16, 0.25);

-- CSV row 27
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 12.600, 70.500, 74.200, 60.77000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 223.15, -2.022);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.508, 0, 1751, 0.069, 15.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.01, 158.32, 99.54, 0.091, 0.233);

-- CSV row 28
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 41.900, 77.500, 87.800, 75.53000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.055, 237.15, -2.561);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.938, 0, 1181, 0.102, 17.5);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.53, 190.18, 79.6, 0.018, 0.158);

-- CSV row 29
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 21.200, 49.300, 74.600, 56.33000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.038, 227.21, -2.604);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.283, 0, 215, 0.09, 19.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.71, 158.47, 92.77, 0.071, 0.208);

-- CSV row 30
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 33.00, 52.700, 81.700, 63.26000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.049, 232.05, -2.926);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.242, 0, 480, 0.078, 20.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.21, 178.47, 86.59, 0.048, 0.229);

-- CSV row 31
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 39.800, 60.400, 64.700, 58.43000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 234.08, -2.246);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.612, 0, 694, 0.086, 20.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.27, 163.7, 94.41, 0.215, 0.243);

-- CSV row 32
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 42.600, 72.200, 75.100, 67.73000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.101, 234.8, 0.634);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.326, 0, 1412, 0.091, 35.49);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.95, 111.33, 94.78, 0, 0.253);

-- CSV row 33
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 34.500, 70.400, 47.600, 51.82000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.09, 232.94, 1.533);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.592, 0, 1433, 0.087, 33.91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.31, 110.28, 82.47, 0.248, 0.332);

-- CSV row 34
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 40.400, 71.100, 81.800, 70.31000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.058, 237.02, -1.588);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.466, 0, 1397, 0.079, 34.36);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.17, 126.1, 57.76, 0, 0.154);

-- CSV row 35
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 67.500, 59.800, 81.600, 72.24000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.154, 240.16, -0.223);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.868, 0.001, 938, 0.079, 37.02);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.42, 142.12, 68.77, 0, 0.217);

-- CSV row 36
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 35.700, 81.200, 70.900, 66.95000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.04, 231.08, -5.764);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.703, 0, 1051, 0.144, 42.8);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.86, 144.35, 87.22, 0.147, 0.337);

-- CSV row 37
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 33.200, 63.500, 77.200, 64.29000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.031, 229.72, -6.712);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.65, 0.082, 1739, 0.082, 34.97);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.41, 144.59, 73.99, 0.029, 0.218);

-- CSV row 38
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.800, 65.200, 80.100, 70.57000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.08, 236.34, -5.8);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.802, 0, 839, 0.09, 24.85);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.07, 158.73, 83.32, 0.012, 0.166);

-- CSV row 39
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 56.300, 64.700, 89.600, 75.47000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 236.09, -6.565);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.029, 0.002, 777, 0.086, 24.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.01, 170.75, 101.9, 0.009, 0.171);

-- CSV row 40
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 65.100, 72.500, 91.00, 80.27000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.103, 240.35, -4.817);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.959, 0, 1329, 0.09, 26.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.79, 166.49, 73.43, 0, 0.15);

-- CSV row 41
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 41.800, 55.400, 82.200, 66.08000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.096, 235.33, 0.77);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.656, 0.055, 1401, 0.048, 39.88);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.82, 158.39, 98.63, 0.023, 0.229);

-- CSV row 42
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.300, 59.900, 76.900, 62.08000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.061, 235.07, 2.456);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.199, 0.017, 1402, 0.051, 25.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.59, 136.42, 82.39, 0.024, 0.282);

-- CSV row 43
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 34.300, 60.900, 83.800, 67.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.089, 234.29, 2.584);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.662, 0, 1508, 0.053, 17.17);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.26, 153.57, 66.22, 0.023, 0.236);

-- CSV row 44
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 38.00, 55.900, 80.600, 64.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.091, 236.11, 2.386);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.246, 0.028, 1006, 0.053, 26.64);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.09, 144.73, 73.84, 0.006, 0.233);

-- CSV row 45
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.800, 68.700, 74.00, 70.57000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.177, 237.06, 0.808);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.48, 0, 1318, 0.077, 28.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.32, 148.71, 71.51, 0.109, 0.304);

-- CSV row 46
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 16.00, 60.100, 92.300, 67.38000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 232.03, 0.155);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.258, 0.008, 1318, 0.066, 34.08);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.59, 180.77, 95.65, 0, 0.098);

-- CSV row 47
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 12.200, 46.300, 90.800, 61.73000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 231.01, 1.063);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.051, 0, 335, 0.043, 30.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.42, 163.56, 90.33, 0.014, 0.143);

-- CSV row 48
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 17.300, 57.200, 90.500, 65.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 230.76, -1.307);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.147, 0.006, 591, 0.09, 35.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.06, 164.83, 85.63, 0.002, 0.168);

-- CSV row 49
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 24.900, 57.900, 79.500, 62.10000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.031, 231.45, -1.948);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.024, 0.017, 972, 0.06, 38.01);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.61, 159.21, 118.7, 0.004, 0.239);

-- CSV row 50
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 43.800, 55.500, 55.300, 53.06000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 242.51, -1.992);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.405, 0, 327, 0.085, 28.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 10.24, 191.64, 86.6, 0.465, 0.183);

-- CSV row 51
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 15.800, 56.400, 92.300, 66.23000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 231.04, 1.365);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.444, 0.002, 975, 0.055, 38.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.45, 168.82, 80.25, 0.002, 0.171);

-- CSV row 52
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 18.300, 39.300, 85.400, 58.15000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.039, 228.3, -0.433);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.996, 0.017, 518, 0.067, 39.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.86, 146.28, 94.2, 0, 0.225);

-- CSV row 53
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 25.600, 63.100, 85.500, 66.80000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 229.67, 0.749);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.84, 0, 958, 0.079, 29.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.87, 147.99, 98.73, 0.004, 0.232);

-- CSV row 54
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 16.700, 73.00, 85.500, 67.99000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.026, 232.38, 1.712);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.246, 0.003, 1483, 0.086, 29);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.07, 148.76, 117.68, 0.001, 0.249);

-- CSV row 55
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 9.600, 40.900, 84.600, 56.49000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 229.72, 3.247);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.327, 0, 566, 0.05, 41.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.46, 151.05, 84.07, 0.006, 0.191);

-- CSV row 56
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 26.500, 33.600, 77.500, 54.13000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 237.63, -0.095);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.364, 0.073, 413, 0.062, 44.43);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.95, 140.76, 107.66, 0.017, 0.293);

-- CSV row 57
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 52.300, 44.00, 78.00, 62.66000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.07, 238.62, -4.299);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.627, 0, 275, 0.074, 36.8);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 175.7, 145.58, 114.78, 0.001, 0.186);

-- CSV row 58
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 50.400, 49.800, 81.00, 65.52000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.065, 236.91, -5.15);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.669, 0, 369, 0.081, 34.16);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.77, 134.43, 111.6, 0.01, 0.243);

-- CSV row 59
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 50.100, 72.600, 75.100, 69.35000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.077, 238.89, -2.359);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.712, 0.003, 1448, 0.081, 29.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.95, 128.86, 101.37, 0, 0.282);

-- CSV row 60
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 40.400, 53.700, 73.400, 60.89000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.064, 234.03, -3.089);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.659, 0, 548, 0.065, 34.15);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.66, 133.79, 115.94, 0.005, 0.2);

-- CSV row 61
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 26.00, 40.500, 80.500, 57.60000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.032, 234.54, -0.126);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.076, 0.001, 187, 0.076, 37.75);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.09, 135.17, 104.17, 0, 0.235);

-- CSV row 62
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 3.600, 57.400, 82.00, 58.94000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 227.91, 9.566);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.123, 0.001, 303, 0.105, 40.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.44, 140.88, 55.68, 0, 0.192);

-- CSV row 63
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 23.200, 58.500, 76.400, 60.39000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.044, 234.62, 6.697);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.094, 0.034, 503, 0.115, 52.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.64, 129.75, 79.48, 0, 0.224);

-- CSV row 64
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 11.400, 55.500, 83.200, 60.53000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 232.59, 7.114);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.229, 0, 489, 0.091, 43.58);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.94, 141.93, 74.05, 0.05, 0.178);

-- CSV row 65
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 19.400, 48.00, 74.900, 55.73000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.045, 232.22, 10.622);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.051, 0, 213, 0.097, 51.56);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.2, 125.04, 52.47, 0, 0.203);

-- CSV row 66
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 13.800, 56.900, 84.00, 61.83000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 231.62, 12.662);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.034, 0, 357, 0.096, 35.01);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.01, 146.88, 73.69, 0, 0.144);

-- CSV row 67
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 18.900, 54.00, 87.100, 63.53000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.043, 229.21, 0.403);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.025, 0, 416, 0.082, 34.11);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.86, 153.5, 70.28, 0.006, 0.157);

-- CSV row 68
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 0, 65.700, 87.200, 63.31000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 222.52, 4.839);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.016, 0.002, 1428, 0.052, 28.46);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.24, 156.49, 71.97, 0, 0.118);

-- CSV row 69
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 3.700, 47.700, 84.500, 57.30000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 226.95, 4.294);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.505, 0.004, 508, 0.069, 30.37);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.38, 145.31, 76.21, 0, 0.214);

-- CSV row 70
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 5.800, 40.900, 78.700, 52.78000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 225.93, 4.996);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.616, 0, 443, 0.056, 38.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.37, 132.94, 85.02, 0, 0.156);

-- CSV row 71
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 17.400, 50.300, 87.600, 62.37000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 234.62, 2.298);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.157, 0, 538, 0.063, 37.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.33, 157.52, 67.13, 0, 0.138);

-- CSV row 72
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 34.100, 64.900, 76.700, 64.64000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.076, 236.23, 8.569);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.294, 0, 765, 0.089, 41.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.13, 143.19, 76.37, 0.127, 0.211);

-- CSV row 73
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 37.400, 49.500, 85.800, 65.23000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.087, 236.5, 6.926);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.805, 0, 405, 0.065, 36.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.25, 151.41, 65.12, 0, 0.125);

-- CSV row 74
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 41.500, 53.300, 87.900, 68.24000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.078, 240.4, 3.727);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.501, 0, 418, 0.092, 42.01);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.89, 151.66, 68.27, 0.025, 0.104);

-- CSV row 75
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 39.800, 48.00, 82.400, 63.56000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.091, 237.24, 7.085);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.493, 0, 490, 0.077, 47.97);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.14, 132.88, 64.17, 0, 0.132);

-- CSV row 76
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 21.600, 49.900, 71.500, 55.04000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.059, 231.41, 4.862);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.475, 0, 282, 0.08, 38.03);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.3, 129.91, 55.37, 0.097, 0.233);

-- CSV row 77
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.700, 51.100, 92.300, 67.22000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.047, 236.94, 2.098);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.097, 0, 300, 0.069, 29.71);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.45, 166.4, 52.62, 0, 0.103);

-- CSV row 78
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 29.400, 60.500, 96.500, 72.28000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 238.75, 0.066);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.029, 0.001, 712, 0.083, 40.2);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.42, 181.53, 50, 0, 0.113);

-- CSV row 79
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 9.500, 54.600, 98.100, 67.33000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.022, 229.88, 4.83);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.19, 0, 616, 0.067, 44.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.18, 189.06, 61.97, 0, 0.091);

-- CSV row 80
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 30.400, 61.300, 97.500, 73.22000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.05, 232.86, -1.179);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.694, 0, 461, 0.097, 39.07);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.73, 190.5, 65.67, 0, 0.114);

-- CSV row 81
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 38.00, 59.700, 83.00, 67.01000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.001, 237.48, -5.394);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.313, 0.001, 540, 0.09, 32.76);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.1, 166.96, 87.95, 0.008, 0.146);

-- CSV row 82
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.900, 46.600, 88.100, 63.81000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.034, 224.81, -7.352);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.454, 0.011, 546, 0.089, 44.52);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.75, 156.53, 63.83, 0.02, 0.153);

-- CSV row 83
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 22.800, 43.100, 81.200, 58.09000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.024, 228.14, -4.186);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.008, 0, 387, 0.06, 44.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.05, 151.88, 75.48, 0.037, 0.229);

-- CSV row 84
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 22.900, 52.800, 84.100, 62.47000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.045, 225.52, -3.524);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.827, 0.003, 716, 0.071, 30.67);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.45, 157.62, 43.07, 0, 0.145);

-- CSV row 85
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 23.500, 54.700, 91.600, 66.91000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 230.64, -4.026);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.632, 0.01, 474, 0.096, 45.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.53, 163.36, 67.36, 0, 0.111);

-- CSV row 86
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 4.900, 53.500, 93.500, 63.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 226.03, 0.726);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.598, 0.003, 672, 0.077, 44.89);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.34, 176.28, 53.9, 0, 0.086);

-- CSV row 87
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 4.800, 70.100, 94.800, 69.39000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 223.44, 0.496);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.357, 0.003, 813, 0.094, 35.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.23, 176.75, 63.86, 0, 0.103);

-- CSV row 88
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 15.400, 46.900, 85.700, 60.00000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.048, 226.05, 0.156);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.387, 0, 295, 0.08, 39.1);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.67, 147.54, 80.45, 0.023, 0.123);

-- CSV row 89
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 14.700, 44.100, 85.100, 58.72000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.019, 231.6, 1.171);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.163, 0, 375, 0.067, 42.02);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.92, 170.6, 77.8, 0.079, 0.21);

-- CSV row 90
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 0, 40.700, 94.800, 59.61000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 219.71, 3.259);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.196, 0, 367, 0.039, 47.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.99, 171.31, 44.35, 0, 0.117);

-- CSV row 91
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 20.800, 64.300, 94.700, 70.80000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.002, 232.29, -1.734);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.441, 0, 900, 0.054, 37.91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.79, 176.56, 63.07, 0, 0.138);

-- CSV row 92
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 34.400, 50.800, 80.700, 62.47000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.06, 239, 3.321);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.951, 0, 322, 0.042, 25.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.49, 139.34, 81.05, 0, 0.156);

-- CSV row 93
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 15.600, 81.500, 87.800, 71.47000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.042, 230.35, 7.028);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.491, 0, 1052, 0.097, 35);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.23, 158.79, 80.43, 0, 0.098);

-- CSV row 94
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 32.400, 50.600, 87.800, 65.56000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.029, 243.64, 5.627);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.633, 0, 704, 0.066, 32.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.09, 153.9, 85.09, 0.007, 0.208);

-- CSV row 95
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 35.00, 80.300, 76.00, 69.09000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.043, 241.95, 5.707);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.485, 0.002, 1118, 0.091, 28.13);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.18, 115.56, 99.69, 0, 0.252);

-- CSV row 96
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 49.600, 77.200, 38.400, 52.28000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.109, 236.2, -0.449);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.241, 0, 550, 0.154, 27.78);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.89, 119.88, 41.49, 0.48, 0.163);

-- CSV row 97
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 56.800, 70.500, 88.900, 76.96000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.111, 240.05, -0.565);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.017, 0, 756, 0.104, 21.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.27, 164.03, 56.68, 0.004, 0.261);

-- CSV row 98
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.200, 94.300, 58.800, 68.53000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.114, 235.9, -2.036);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.819, 0, 1264, 0.121, 14.24);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.18, 179.56, 80.02, 0.397, 0.363);

-- CSV row 99
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 62.500, 89.100, 31.600, 55.03000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.129, 236.2, -3.706);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.075, 0, 1091, 0.118, 15.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 11.04, 113.37, 114.46, 0.833, 0.122);

-- CSV row 100
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 62.300, 72.800, 70.100, 69.35000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.138, 237.32, -1.923);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.442, 0, 658, 0.112, 18.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.82, 156.79, 59.51, 0.089, 0.239);

-- CSV row 101
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 70.900, 80.500, 67.100, 71.88000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.144, 236.38, -5.515);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.081, 0, 1280, 0.091, 14.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.98, 156.4, 51.29, 0.178, 0.246);

-- CSV row 102
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 69.00, 68.100, 96.800, 82.63000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.139, 241.86, -1.434);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.358, 0, 551, 0.106, 12.56);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.32, 191.58, 50.08, 0.005, 0.205);

-- CSV row 103
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.800, 78.00, 81.00, 74.26000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.151, 235.09, 2.725);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.865, 0.002, 1318, 0.106, 39.9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.83, 182.52, 68.03, 0.162, 0.26);

-- CSV row 104
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 50.0, 91.00, 70.800, 72.70000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.14, 235.72, 2.538);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.43, 0.025, 1529, 0.116, 25.24);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.15, 159.26, 80.68, 0.17, 0.355);

-- CSV row 105
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 66.100, 70.300, 89.700, 79.16000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.178, 240.33, 2.939);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.693, 0, 78, 0.151, 18.46);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.11, 170.97, 61.09, 0.001, 0.193);

-- CSV row 106
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 58.100, 77.100, 81.100, 75.30000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.137, 239.47, 1.312);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.59, 0.002, 744, 0.107, 17.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.71, 154.4, 80.7, 0.046, 0.266);

-- CSV row 107
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 69.100, 87.200, 89.600, 84.78000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.168, 237.53, -1.27);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.74, 0.01, 971, 0.11, 14.85);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.19, 163.08, 67.64, 0.015, 0.212);

-- CSV row 108
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 66.00, 86.200, 71.900, 75.01000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.097, 242.39, -4.458);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.142, 0, 1195, 0.109, 15.35);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.08, 143.31, 91.72, 0.115, 0.263);

-- CSV row 109
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 68.800, 79.800, 86.200, 80.80000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.112, 242.23, -4.1);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.093, 0, 1602, 0.089, 19.45);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.25, 164.13, 74.7, 0.026, 0.248);

-- CSV row 110
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 63.500, 84.100, 75.400, 75.63000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.129, 236.09, -4.255);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.286, 0, 1132, 0.09, 23.57);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.88, 147.54, 88.91, 0.09, 0.309);

-- CSV row 111
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 60.600, 79.500, 83.600, 77.77000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.157, 235.23, -0.443);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.017, 0.002, 704, 0.154, 23.47);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.31, 139.7, 92.43, 0.001, 0.184);

-- CSV row 112
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 67.100, 99.500, 77.300, 81.92000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.159, 238.96, -0.456);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.788, 0, 1371, 0.131, 21.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.58, 145.71, 96.13, 0.065, 0.23);

-- CSV row 113
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 71.800, 83.400, 78.700, 78.73000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.191, 239.19, -0.675);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.985, 0, 546, 0.153, 19.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.55, 136.85, 105.89, 0.011, 0.257);

-- CSV row 114
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 81.900, 85.200, 86.700, 85.29000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.221, 242.25, -2.847);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -2.192, 0, 610, 0.151, 18.92);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.21, 164.32, 78.59, 0.045, 0.273);

-- CSV row 115
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 70.900, 91.300, 82.00, 82.57000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.172, 238.33, -0.997);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.618, 0, 1396, 0.115, 20.39);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.34, 150.79, 85.79, 0, 0.211);

-- CSV row 116
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 81.600, 87.100, 91.300, 88.10000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.171, 242.5, -2.829);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.341, 0.016, 805, 0.149, 17.6);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.82, 183.43, 85.21, 0.032, 0.279);

-- CSV row 117
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 71.300, 79.100, 83.400, 79.69000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.152, 241.18, -1.45);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.441, 0, 1092, 0.087, 13.48);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.33, 150.63, 70.76, 0.024, 0.258);

-- CSV row 118
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 58.600, 96.800, 78.800, 80.16000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.167, 232.62, -0.381);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.567, 0, 1232, 0.123, 21.35);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.91, 156.27, 87.32, 0.128, 0.276);

-- CSV row 119
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.500, 97.100, 82.300, 83.18000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.167, 237.86, 0.849);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.509, 0.011, 1449, 0.142, 15.42);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.38, 152.42, 99.16, 0.002, 0.216);

-- CSV row 120
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 78.200, 80.700, 89.100, 84.40000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.147, 243.7, -3.931);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.338, 0.005, 653, 0.126, 14.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.37, 167.54, 113.36, 0.011, 0.25);

-- CSV row 121
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 43.500, 54.800, 81.100, 65.69000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.109, 234.89, 1.222);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.895, 0, 282, 0.098, 27.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.08, 143, 73.02, 0.062, 0.181);

-- CSV row 122
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 43.900, 63.800, 76.400, 66.12000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.114, 235.71, 2.255);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.375, 0, 401, 0.116, 25.2);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.13, 130.91, 82.35, 0.001, 0.199);

-- CSV row 123
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 59.400, 75.600, 54.300, 61.71000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.135, 237.37, -0.869);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.879, 0, 900, 0.105, 16.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.18, 82.94, 132.62, 0.126, 0.136);

-- CSV row 124
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 49.100, 51.900, 76.600, 63.69000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.091, 238.73, -0.476);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.355, 0, 158, 0.103, 26.54);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.73, 143.75, 98.32, 0.088, 0.245);

-- CSV row 125
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 44.800, 62.200, 86.100, 70.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.097, 235.96, 0.092);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.498, 0, 443, 0.112, 28.29);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.58, 149.74, 99.37, 0.01, 0.186);

-- CSV row 126
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 81.700, 91.800, 68.200, 77.98000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.18, 240.15, -4.231);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.596, 0, 1468, 0.114, 30.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.54, 136.39, 88.94, 0.125, 0.276);

-- CSV row 127
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 70.800, 66.700, 56.00, 62.17000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.151, 239.1, -2.819);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.986, 0, 1126, 0.087, 30.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.62, 116.67, 86.72, 0.281, 0.232);

-- CSV row 128
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 67.900, 75.800, 63.500, 68.07000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.139, 238.38, -3.394);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.675, 0, 1213, 0.095, 18.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.05, 110.18, 81.03, 0.138, 0.197);

-- CSV row 129
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 71.300, 69.600, 50.400, 60.34000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.126, 240.19, -5.046);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.771, 0, 1115, 0.071, 23.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.07, 117.47, 67.05, 0.256, 0.238);

-- CSV row 130
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 68.300, 81.00, 57.900, 66.91000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.139, 240.03, -2.343);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.109, 0, 1299, 0.114, 25.02);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.36, 117.25, 71.04, 0.165, 0.251);

-- CSV row 131
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 57.00, 84.700, 72.900, 73.26000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.102, 240.03, -1.746);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.629, 0.001, 1328, 0.119, 20.59);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.69, 135.21, 67.46, 0.064, 0.195);

-- CSV row 132
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.900, 46.500, 62.900, 55.78000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.098, 239.5, -0.31);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.46, 0, 243, 0.087, 32.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.42, 153.54, 74.55, 0.244, 0.148);

-- CSV row 133
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.00, 69.600, 42.400, 52.88000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.095, 239.89, -1.356);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.176, 0, 1292, 0.058, 15.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.99, 150.72, 67.51, 0.475, 0.254);

-- CSV row 134
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 62.700, 65.500, 62.600, 63.49000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.114, 242.96, -0.958);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.627, 0, 694, 0.095, 30.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.68, 117.48, 108.09, 0.064, 0.245);

-- CSV row 135
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 60.800, 74.800, 29.500, 49.35000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.104, 243.87, -1.24);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.755, 0, 1394, 0.095, 27.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 12.72, 124.86, 70.52, 0.804, 0.218);

-- CSV row 136
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 29.800, 81.200, 71.100, 65.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.042, 232.6, -2.058);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.834, 0, 1479, 0.102, 22.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.23, 146.51, 69.42, 0.088, 0.14);

-- CSV row 137
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.300, 89.400, 79.700, 79.53000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.117, 242.85, -1.31);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.306, 0, 1178, 0.103, 25.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.23, 150.01, 73.81, 0.03, 0.192);

-- CSV row 138
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 65.400, 82.700, 80.0, 77.89000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.134, 241.81, -0.503);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.054, 0, 1579, 0.099, 27.6);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.37, 155.73, 85.26, 0.059, 0.18);

-- CSV row 139
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 67.00, 69.900, 28.900, 48.82000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.134, 241.79, -1.212);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.55, 0, 1418, 0.081, 28.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 12.7, 122.45, 84.7, 0.828, 0.217);

-- CSV row 140
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 53.800, 44.900, 30.300, 39.38000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 241.28, -1.785);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.698, 0, 58, 0.092, 35.04);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 11.91, 121.71, 75.44, 0.725, 0.216);

-- CSV row 141
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 68.900, 65.300, 58.100, 62.42000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.142, 240.45, -2.02);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.416, 0.004, 1495, 0.061, 24.91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.24, 144.09, 70.31, 0.275, 0.253);

-- CSV row 142
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 57.500, 67.900, 74.100, 68.92000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.092, 241.11, -2.253);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.071, 0, 612, 0.087, 23.95);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.25, 154.09, 67.57, 0.03, 0.216);

-- CSV row 143
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.800, 90.900, 63.300, 71.88000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.119, 242.4, -1.48);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.235, 0, 1429, 0.117, 34.59);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.66, 147.35, 89.23, 0.185, 0.23);

-- CSV row 144
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 62.700, 55.300, 38.500, 48.38000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.127, 238.94, -2.139);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.359, 0.034, 1350, 0.053, 40.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 10.94, 148.21, 102.72, 0.748, 0.254);

-- CSV row 145
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 58.500, 84.900, 70.200, 72.27000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.101, 242.13, -0.961);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.154, 0, 1475, 0.102, 23.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.21, 130.01, 72.76, 0.039, 0.247);

-- CSV row 146
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 59.00, 80.100, 56.900, 64.28000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.108, 238.95, -2.578);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.083, 0, 1380, 0.101, 16.78);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.41, 169.17, 79.45, 0.379, 0.202);

-- CSV row 147
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 8.100, 48.800, 75.800, 54.16000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 225.58, -0.696);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.151, 0, 264, 0.074, 24.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.05, 145.67, 61.84, 0.035, 0.137);

-- CSV row 148
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 50.300, 70.100, 60.0, 61.09000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.027, 238.78, -8.127);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.219, 0.025, 1267, 0.091, 24.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.51, 169.14, 77.01, 0.342, 0.155);

-- CSV row 149
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.100, 75.400, 72.00, 68.84000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.059, 237.82, -5.488);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.272, 0, 997, 0.101, 23.91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.12, 127.78, 80.12, 0.047, 0.224);

-- CSV row 150
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 53.300, 76.00, 81.300, 74.11000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.038, 241.7, -6.085);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.701, 0, 1162, 0.097, 27.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.63, 182.42, 83.85, 0.067, 0.084);

-- CSV row 151
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 40.900, 72.100, 20.600, 40.11000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.05, 235.85, -3.543);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.503, 0.006, 809, 0.118, 25.89);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 14.09, 53.22, 91.03, 0.981, 0.193);

-- CSV row 152
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 45.200, 78.300, 61.900, 63.48000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.05, 233.69, -6.893);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.098, 0, 1704, 0.096, 17.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.39, 145.64, 74.35, 0.187, 0.206);

-- CSV row 153
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 36.700, 86.400, 33.00, 49.76000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.043, 235.88, -2.503);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.909, 0, 1391, 0.117, 17.88);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.12, 107.8, 123.59, 0.571, 0.184);

-- CSV row 154
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 38.800, 38.300, 69.600, 54.05000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.037, 237.25, -3.086);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.263, 0, 292, 0.051, 37.46);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.49, 156.51, 94.49, 0.13, 0.207);

-- CSV row 155
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 45.800, 45.200, 65.700, 55.57000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.095, 233.94, -2.057);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.036, 0, 90, 0.076, 9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.35, 129.22, 61.65, 0.171, 0.226);

-- CSV row 156
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 63.800, 66.00, 56.500, 60.81000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.098, 243.6, -3.246);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.81, 0.018, 1123, 0.087, 33.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.06, 135.61, 81.95, 0.268, 0.18);

-- CSV row 157
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 37.800, 70.700, 56.900, 57.22000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.061, 231.98, -3.766);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.631, 0, 1130, 0.082, 21.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.54, 153.38, 82.58, 0.282, 0.21);

-- CSV row 158
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.700, 87.600, 74.700, 76.57000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.109, 240.42, -3.903);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.736, 0, 1251, 0.118, 19.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.21, 143.18, 90.64, 0.078, 0.147);

-- CSV row 159
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 59.300, 69.300, 73.100, 69.20000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.101, 241.98, -1.434);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.283, 0, 1143, 0.06, 22.76);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.2, 138.83, 92.89, 0.018, 0.199);

-- CSV row 160
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.200, 82.400, 80.200, 75.06000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.026, 237.94, -9.159);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.388, 0, 1556, 0.093, 35.05);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.19, 186.73, 103.06, 0.091, 0.149);

-- CSV row 161
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.200, 53.00, 78.100, 65.79000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 239.97, -10.991);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.885, 0, 295, 0.086, 40.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.91, 188.69, 105.44, 0.128, 0.196);

-- CSV row 162
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 60.100, 67.800, 84.200, 74.46000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 245.37, -10.554);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.582, 0.001, 917, 0.087, 33.54);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.37, 179.87, 76.54, 0.043, 0.155);

-- CSV row 163
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 54.800, 63.100, 81.600, 70.69000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 238.34, -4.272);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.71, 0, 479, 0.094, 39.18);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7, 193.81, 104.98, 0.072, 0.179);

-- CSV row 164
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 44.600, 67.400, 63.600, 60.94000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.051, 236.36, -4.619);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.532, 0, 362, 0.114, 29.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.24, 183.01, 80.97, 0.294, 0.265);

-- CSV row 165
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 48.100, 59.00, 91.100, 72.87000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.029, 241.5, -5.049);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.619, 0, 334, 0.101, 39.71);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.36, 184.04, 62.45, 0.004, 0.164);

-- CSV row 166
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 65.500, 72.500, 88.100, 78.90000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.117, 236.63, -6.093);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.326, 0, 1185, 0.072, 30.97);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.04, 167.31, 63.37, 0.008, 0.189);

-- CSV row 167
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 51.00, 48.700, 81.900, 65.76000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.029, 245.37, -5.439);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.209, 0, 194, 0.089, 41.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.41, 166.87, 90.66, 0.021, 0.212);

-- CSV row 168
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 44.600, 65.700, 80.300, 68.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 240.63, -4.985);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.813, 0, 724, 0.083, 33.72);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.99, 177.06, 83.33, 0.09, 0.206);

-- CSV row 169
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 35.00, 58.800, 79.700, 64.49000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.04, 230.08, -6.3);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.077, 0, 445, 0.085, 25.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.41, 166.06, 77.32, 0.04, 0.249);

-- CSV row 170
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 42.500, 66.100, 84.700, 70.68000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 236.45, -6.245);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.398, 0, 576, 0.083, 24.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.48, 180.72, 80.44, 0.054, 0.185);

-- CSV row 171
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 27.700, 53.600, 81.300, 62.27000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.058, 225.45, -4.194);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.59, 0, 214, 0.092, 35.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.42, 167.46, 81.33, 0.048, 0.194);

-- CSV row 172
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 35.600, 84.600, 61.700, 63.35000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.025, 229.02, -8.944);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.451, 0, 1322, 0.093, 28.52);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.73, 176.08, 95.55, 0.29, 0.165);

-- CSV row 173
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.500, 78.00, 81.500, 69.85000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 229.57, -6.907);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.293, 0, 1024, 0.097, 20.75);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.8, 196.45, 87.2, 0.131, 0.164);

-- CSV row 174
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 33.600, 90.200, 80.400, 73.98000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 231.52, -7.731);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.111, 0, 1297, 0.119, 22.9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.1, 174.34, 84.74, 0.089, 0.171);

-- CSV row 175
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 25.700, 80.700, 59.800, 59.25000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 226.5, -7.918);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.295, 0, 1425, 0.09, 23.08);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 10.34, 185.25, 103.91, 0.308, 0.248);

-- CSV row 176
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 25.700, 67.500, 58.800, 54.79000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 229.29, -5.311);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.278, 0, 328, 0.123, 34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.98, 169.01, 83.51, 0.34, 0.165);

-- CSV row 177
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 37.700, 43.00, 68.700, 54.79000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 234.16, -7.614);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.397, 0, 358, 0.086, 41.68);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.77, 200.17, 100.52, 0.257, 0.183);

-- CSV row 178
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 47.200, 70.400, 80.400, 70.76000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.039, 237.58, -6.229);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.638, 0.052, 1505, 0.104, 38.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.59, 206.33, 71.43, 0.074, 0.174);

-- CSV row 179
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 44.300, 71.00, 21.600, 40.96000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 239.69, -6.562);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.183, 0, 1037, 0.076, 25.11);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 13.18, 21.79, 135.64, 0.99, 0.223);

-- CSV row 180
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 31.800, 52.900, 72.500, 58.48000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.038, 232.16, -3.635);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.905, 0, 284, 0.096, 31.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.67, 155, 80.76, 0.151, 0.252);

-- CSV row 181
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 24.800, 64.800, 92.600, 70.70000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.047, 221.25, -4.15);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.293, 0, 552, 0.085, 28.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.24, 170.97, 77.04, 0.008, 0.195);

-- CSV row 182
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 33.600, 89.300, 61.700, 64.36000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.052, 232.23, -2.775);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.277, 0, 1162, 0.104, 22.83);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.55, 173.92, 115.63, 0.327, 0.233);

-- CSV row 183
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 23.800, 86.00, 77.800, 69.46000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.032, 227.48, -4.223);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.46, 0, 1601, 0.102, 16.73);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.53, 160.46, 103.77, 0.09, 0.233);

-- CSV row 184
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 38.200, 75.00, 71.100, 65.69000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 232.63, -2.535);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.534, 0, 327, 0.137, 32.56);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.57, 174.65, 94.45, 0.218, 0.24);

-- CSV row 185
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.400, 75.700, 78.400, 67.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.039, 228.42, -4.649);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.086, 0, 591, 0.121, 19.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.62, 158.51, 62.07, 0.095, 0.249);

-- CSV row 186
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 58.500, 70.700, 92.200, 79.01000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 230.95, 0.497);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.34, 0.11, 1385, 0.073, 20.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.39, 164.94, 92.36, 0, 0.12);

-- CSV row 187
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 38.200, 56.100, 89.200, 69.07000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.052, 227.5, 0.137);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.032, 0.03, 197, 0.102, 28.94);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.71, 158.32, 94.1, 0.002, 0.168);

-- CSV row 188
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 63.900, 86.500, 91.800, 84.63000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.08, 231.94, -0.821);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.992, 0.006, 1065, 0.121, 17.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.87, 161.29, 58.34, 0, 0.093);

-- CSV row 189
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 30.900, 67.600, 93.600, 73.26000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.037, 237.87, 6.22);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.34, 0.002, 1422, 0.049, 22.07);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.51, 170.61, 84.84, 0, 0.129);

-- CSV row 190
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 14.600, 81.700, 92.400, 73.63000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.042, 223.58, 7.493);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.435, 0.003, 1301, 0.092, 35.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.79, 193.8, 125.1, 0, 0.104);

-- CSV row 191
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 10.700, 65.300, 24.600, 34.03000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.027, 222.18, 4.247);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.385, 0.002, 1197, 0.048, 43.96);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 11.4, 85.95, 138.9, 0.777, 0.239);

-- CSV row 192
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 45.500, 51.900, 73.400, 61.37000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.086, 230.81, 4.965);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.992, 0.028, 97, 0.083, 21.18);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 171.92, 152.42, 130.57, 0, 0.137);

-- CSV row 193
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 18.800, 41.300, 88.300, 60.30000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 237.76, 10.511);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.288, 0, 74, 0.07, 70.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.95, 180.62, 59.69, 0.07, 0.201);

-- CSV row 194
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 24.300, 71.100, 45.100, 48.74000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.036, 234.56, 11.28);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.42, 0, 660, 0.066, 53.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.42, 62.99, 182.34, 0.214, 0.233);

-- CSV row 195
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 96.500, 71.900, 78.900, 80.32000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.096, 241.02, -7.918);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.512, 0.013, 566, 0.084, 32.87);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.9, 148.86, 105.92, 0.006, 0.26);

-- CSV row 196
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 74.700, 58.100, 94.100, 79.42000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.135, 231.91, -1.685);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.848, 0, 79, 0.136, 58.35);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.31, 182.48, 135.26, 0.002, 0.232);

-- CSV row 197
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 82.900, 54.100, 79.500, 72.56000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.104, 238.35, -0.763);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.723, 0, 49, 0.11, 38.67);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.87, 158.73, 150.65, 0.042, 0.29);

-- CSV row 198
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 60.200, 63.100, 83.300, 72.62000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.071, 238.81, 2.457);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.894, 0.175, 862, 0.079, 34.97);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.32, 156.4, 92.47, 0.003, 0.242);

-- CSV row 199
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 73.00, 52.100, 71.500, 65.98000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.087, 234.58, -1.086);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.891, 0.251, 1341, 0.066, 53.04);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.64, 139.95, 131.77, 0.097, 0.309);

-- CSV row 200
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 55.400, 80.100, 82.900, 76.56000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.079, 230.11, 0.612);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.224, 0, 1293, 0.091, 16.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.91, 152.22, 118.62, 0.026, 0.271);

-- CSV row 201
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 39.200, 64.200, 83.100, 68.65000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 230.32, -1.51);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.465, 0.319, 683, 0.109, 29.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.41, 166.21, 101.8, 0.013, 0.249);

-- CSV row 202
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 55.100, 88.800, 76.800, 76.06000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.048, 231.34, -3.646);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.778, 0, 1584, 0.12, 32.95);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.76, 137.89, 112.93, 0.052, 0.241);

-- CSV row 203
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 46.800, 78.200, 80.700, 73.17000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.042, 231.71, -1.78);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.721, 0.024, 599, 0.107, 38.76);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.72, 147.46, 99.7, 0.013, 0.338);

-- CSV row 204
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 58.400, 74.300, 80.500, 74.22000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 230.05, -1.812);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.137, 0.082, 965, 0.084, 26.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.12, 161.32, 138.86, 0.054, 0.309);

-- CSV row 205
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 31.400, 61.800, 77.700, 63.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.037, 230.92, 1.631);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.469, 0.274, 1506, 0.096, 38.85);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.55, 131.73, 118.09, 0, 0.262);

-- CSV row 206
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 44.300, 66.00, 72.300, 64.81000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.052, 232.43, 0.927);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.415, 0.161, 1122, 0.084, 36.47);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.69, 148.33, 100.25, 0.105, 0.342);

-- CSV row 207
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 64.300, 74.400, 69.100, 69.73000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.09, 226.62, -1.946);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.393, 0.033, 804, 0.094, 33.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.98, 154.46, 158.53, 0.159, 0.258);

-- CSV row 208
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 54.300, 80.0, 76.200, 72.96000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.068, 232.5, 0.451);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.247, 0.001, 1016, 0.098, 15.89);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.81, 147.8, 119.3, 0.049, 0.289);

-- CSV row 209
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 42.600, 70.0, 78.100, 68.57000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.075, 230.52, 3.972);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.901, 0.108, 1208, 0.083, 24.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.76, 148.1, 154.54, 0.029, 0.336);

-- CSV row 210
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 38.900, 75.100, 81.900, 71.26000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.032, 231.27, -1.147);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.466, 0.025, 1056, 0.095, 41.18);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.14, 153.71, 76.36, 0.015, 0.253);

-- CSV row 211
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 66.900, 77.500, 76.700, 74.98000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.076, 231.42, -2.457);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.694, 0, 1093, 0.092, 17.95);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.44, 136.3, 106.84, 0.018, 0.31);

-- CSV row 212
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 67.200, 68.700, 80.200, 74.15000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.07, 231.78, -3.559);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.725, 0, 381, 0.095, 24.12);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.46, 150.96, 141.26, 0.042, 0.289);

-- CSV row 213
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 42.100, 47.500, 77.100, 61.22000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.04, 232.73, -0.132);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.577, 0.01, 81, 0.078, 38.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.41, 131.58, 93.62, 0.019, 0.252);

-- CSV row 214
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 55.00, 80.800, 87.200, 78.84000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.03, 242.77, -0.276);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.344, 0, 949, 0.102, 23.04);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.78, 169.35, 94.56, 0.023, 0.233);

-- CSV row 215
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 53.00, 81.100, 79.700, 74.78000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.075, 231.93, 1.599);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.687, 0, 1382, 0.098, 27.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.99, 148.54, 93.93, 0.033, 0.262);

-- CSV row 216
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 9.100, 64.00, 73.400, 57.72000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.032, 226.78, 5.504);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.466, 0, 342, 0.083, 22.56);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.3, 133.68, 133.02, 0.022, 0.263);

-- CSV row 217
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 44.200, 73.200, 71.700, 66.65000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 245.32, 0.636);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.045, 0, 537, 0.084, 24.14);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.14, 167.41, 120.33, 0.196, 0.288);

-- CSV row 218
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 40.600, 64.400, 82.100, 68.49000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.03, 231.04, -1.991);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.893, 0, 319, 0.085, 12.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.3, 152.92, 119.31, 0.015, 0.23);

-- CSV row 219
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 43.300, 77.300, 74.00, 68.85000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.044, 231.73, -0.404);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.184, 0, 992, 0.08, 30.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.34, 147.39, 125.76, 0.076, 0.28);

-- CSV row 220
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 58.700, 73.800, 71.100, 69.43000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.058, 233.3, -1.882);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.296, 0, 551, 0.077, 23.47);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.12, 128.92, 120.61, 0.017, 0.32);

-- CSV row 221
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 49.100, 81.700, 83.00, 75.83000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.066, 234.7, 2.764);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.618, 0.024, 1540, 0.1, 20.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.08, 142.82, 114.91, 0.001, 0.278);

-- CSV row 222
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 44.900, 80.900, 76.600, 71.55000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.048, 238.06, 3.021);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.552, 0, 1416, 0.117, 49.31);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.82, 130.24, 118.37, 0.034, 0.202);

-- CSV row 223
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 46.300, 87.500, 75.300, 73.16000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.059, 230, 0.212);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.362, 0, 1056, 0.112, 15.08);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.99, 147.74, 102.25, 0.093, 0.231);

-- CSV row 224
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 34.700, 79.500, 78.00, 69.79000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.036, 230.74, 0.502);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.456, 0, 414, 0.12, 19.36);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.33, 139.1, 128.76, 0.015, 0.238);

-- CSV row 225
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 52.600, 80.800, 80.700, 75.11000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.081, 232.09, 2.796);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.847, 0, 391, 0.14, 18.26);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.61, 158.67, 121.07, 0.074, 0.209);

-- CSV row 226
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 39.800, 50.400, 92.00, 69.08000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.067, 230.04, 3.389);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.118, 0, 101, 0.077, 17.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.25, 170.72, 111.15, 0.001, 0.155);

-- CSV row 227
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 76.400, 52.800, 78.300, 70.27000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.076, 235.56, -3.219);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.623, 0, 85, 0.093, 33.64);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.87, 126.12, 88.59, 0.002, 0.225);

-- CSV row 228
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 49.900, 76.900, 76.700, 71.40000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 240.75, -1.892);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.924, 0, 1162, 0.076, 19.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.23, 139.34, 81.89, 0.076, 0.255);

-- CSV row 229
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 49.800, 77.400, 93.800, 80.08000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 246.2, -1);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.679, 0.053, 1095, 0.1, 31.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.88, 182.05, 114.53, 0, 0.21);

-- CSV row 230
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 37.200, 68.00, 89.200, 72.44000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 239.45, 0.876);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.104, 0, 305, 0.103, 17.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.01, 166.38, 96.56, 0.006, 0.217);

-- CSV row 231
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 37.700, 74.500, 92.600, 76.19000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.044, 234.76, 2.911);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.692, 0.084, 935, 0.096, 21.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.04, 173.81, 109.78, 0, 0.179);

-- CSV row 232
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 21.600, 87.00, 76.900, 68.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 229.19, 2.975);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.734, 0, 1375, 0.129, 19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.91, 147.72, 99.1, 0.043, 0.268);

-- CSV row 233
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 39.700, 71.300, 66.900, 62.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.062, 233.96, 4.604);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.648, 0.01, 180, 0.145, 32.46);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.18, 152.59, 154.93, 0.137, 0.202);

-- CSV row 234
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 49.100, 51.400, 42.800, 46.64000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.051, 234.04, 0.206);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.252, 0.308, 1461, 0.073, 51.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 10.03, 136.45, 109.87, 0.383, 0.259);

-- CSV row 235
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 43.300, 72.900, 80.600, 70.83000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.065, 231.15, 2.564);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.573, 0, 455, 0.103, 29.69);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.9, 173.32, 69.85, 0.064, 0.211);

-- CSV row 236
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 25.00, 69.100, 62.700, 57.08000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.035, 229.35, 2.455);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.229, 0, 508, 0.083, 23.5);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.44, 152.83, 87.52, 0.189, 0.243);

-- CSV row 237
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 23.400, 53.200, 82.800, 62.04000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.034, 229.39, 2.746);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 8.1, 0.368, 475, 0.114, 48.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.37, 157.72, 81.9, 0.008, 0.261);

-- CSV row 238
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 46.200, 63.200, 57.200, 56.80000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 234.35, 3.972);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.789, 0.025, 203, 0.126, 28.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.09, 154.62, 87.63, 0.3, 0.213);

-- CSV row 239
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 55.00, 59.00, 79.700, 68.55000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.076, 235.26, 2.918);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.117, 0.075, 388, 0.077, 34.88);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.93, 182.55, 106.49, 0.04, 0.161);

-- CSV row 240
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'CARP', 44.200, 80.200, 64.100, 64.95000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.039, 231.46, -1.473);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.869, 0, 896, 0.099, 37.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 8.61, 158.99, 95.12, 0.187, 0.174);

-- CSV row 241
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'carp', 38.600, 75.100, 78.500, 69.50000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.046, 235.96, 3.527);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.585, 0.046, 1169, 0.1, 45.89);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.41, 169.82, 102.45, 0.086, 0.177);

-- CSV row 242
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.700, 45.800, 92.500, 68.33000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 240.62, -6.964);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.664, 0.058, 1200, 0.102, 54.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.75, 177.64, 127.72, 0.002, 0.2);

-- CSV row 243
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.900, 54.200, 91.100, 68.79000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 229.79, -8.918);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.251, 0.067, 507, 0.11, 74.17);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.39, 170.35, 107.58, 0, 0.158);

-- CSV row 244
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 49.400, 39.800, 74.500, 59.07000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 240.04, -15.113);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.943, 0.098, 1457, 0.103, 82.1);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.63, 117.88, 153.13, 0.013, 0.222);

-- CSV row 245
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 50.400, 45.500, 86.00, 66.73000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 225.38, -10.814);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.608, 0.283, 520, 0.095, 57.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.27, 161.91, 116.13, 0.063, 0.167);

-- CSV row 246
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.100, 39.300, 85.600, 62.61000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 238.28, -7.47);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.37, 0.019, 788, 0.063, 48.96);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.93, 152.51, 138.78, 0.003, 0.125);

-- CSV row 247
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.500, 59.400, 92.500, 72.37000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 236.84, -5.298);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.701, 0.059, 457, 0.089, 39.09);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 180, 164.74, 155.09, 0.001, 0.165);

-- CSV row 248
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 46.300, 56.300, 87.900, 70.10000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.019, 232.5, -3.505);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.197, 0.012, 697, 0.127, 45.85);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.25, 159.79, 136.75, 0.026, 0.182);

-- CSV row 249
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.500, 38.500, 87.600, 63.85000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 229.66, -9.012);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.032, 0.062, 1096, 0.095, 66.67);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.66, 167.79, 128.85, 0.001, 0.204);

-- CSV row 250
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 25.900, 40.0, 86.900, 60.63000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.002, 223.78, -11.792);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.932, 0.008, 381, 0.041, 89.45);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.74, 154.97, 96.73, 0.001, 0.177);

-- CSV row 251
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.500, 38.900, 87.100, 60.52000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 226.46, -5.931);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.186, 0.046, 880, 0.054, 51.57);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.3, 151.35, 106.11, 0, 0.204);

-- CSV row 252
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 52.300, 54.00, 77.300, 65.31000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.044, 217.42, -2.306);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.138, 0.042, 1219, 0.109, 39.21);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.4, 134.19, 107.05, 0, 0.291);

-- CSV row 253
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 55.600, 52.500, 82.100, 67.92000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.062, 225.26, -1.383);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.304, 0.179, 493, 0.109, 54);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.44, 145.32, 96.02, 0.005, 0.225);

-- CSV row 254
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.800, 48.00, 75.900, 57.71000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 220.09, -2.47);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.928, 0.117, 1354, 0.102, 41.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.68, 149.57, 107.56, 0.078, 0.232);

-- CSV row 255
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 59.400, 41.900, 86.200, 67.55000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.044, 227.81, -2.062);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.571, 0.146, 1247, 0.094, 44.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.2, 153.11, 72.98, 0.008, 0.204);

-- CSV row 256
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.00, 42.900, 86.400, 62.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 221.41, -2.248);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.771, 0.144, 1176, 0.094, 47.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.68, 154.71, 92.44, 0.019, 0.225);

-- CSV row 257
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 19.300, 58.600, 62.800, 52.84000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 221.69, 0.821);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.611, 0.08, 420, 0.083, 30.87);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 173.14, 124.93, 117.62, 0.002, 0.336);

-- CSV row 258
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 14.500, 43.600, 74.700, 53.33000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 216.31, 0.93);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.093, 0.13, 1137, 0.094, 40.31);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 174.87, 143.79, 120.53, 0, 0.226);

-- CSV row 259
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 25.100, 40.600, 74.900, 54.65000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 217.45, -2.772);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.892, 0.096, 1201, 0.068, 32.81);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.89, 123.2, 132.04, 0.006, 0.291);

-- CSV row 260
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 56.700, 32.500, 76.600, 59.39000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.042, 228.08, 0.244);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.434, 0.301, 1162, 0.073, 48.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.59, 132.06, 139.9, 0, 0.169);

-- CSV row 261
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.300, 52.00, 72.100, 59.71000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.024, 222.35, -2.924);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.404, 0.118, 1383, 0.123, 34.14);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.39, 115, 119.23, 0, 0.356);

-- CSV row 262
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.900, 40.100, 75.900, 57.76000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 238.86, -3.703);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.809, 0.05, 1046, 0.073, 43.24);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.81, 126.36, 122.22, 0.001, 0.22);

-- CSV row 263
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.400, 41.300, 77.900, 57.62000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 232.25, -3.905);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.9, 0.154, 535, 0.05, 40.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.13, 142.47, 134.13, 0, 0.19);

-- CSV row 264
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.200, 37.600, 80.600, 59.62000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 238.84, -2.88);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.019, 0.214, 549, 0.064, 49.16);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.32, 142.6, 162.3, 0.005, 0.314);

-- CSV row 265
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.300, 38.600, 78.600, 59.54000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 240.56, 1.103);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.331, 0.104, 694, 0.045, 34.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.8, 140.43, 121.46, 0.001, 0.192);

-- CSV row 266
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 29.400, 45.600, 81.00, 60.06000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 229.33, 1.981);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.054, 0.088, 1841, 0.088, 29.71);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.45, 147.85, 104.62, 0.037, 0.24);

-- CSV row 267
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 55.600, 46.200, 88.400, 69.18000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.049, 223.27, -3.059);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.232, 0.077, 727, 0.096, 38.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.39, 177.01, 137.84, 0.002, 0.174);

-- CSV row 268
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 54.700, 45.100, 88.600, 68.77000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 225.21, -0.713);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.408, 0.045, 1382, 0.081, 30.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.68, 152.2, 115.62, 0, 0.161);

-- CSV row 269
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.600, 48.400, 79.500, 62.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.024, 224.04, -1.54);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.083, 0.125, 361, 0.061, 26.48);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.57, 133.51, 154.81, 0.004, 0.21);

-- CSV row 270
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.900, 60.500, 85.500, 67.28000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 222.18, -2.234);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.119, 0, 704, 0.126, 32.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.19, 171.16, 144.23, 0.004, 0.201);

-- CSV row 271
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 39.800, 53.400, 82.100, 65.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 221.29, -4.196);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.439, 0.254, 373, 0.094, 49.3);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.6, 139.79, 131.13, 0, 0.259);

-- CSV row 272
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.500, 49.400, 75.400, 57.82000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 233.45, 2.274);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.884, 0.104, 777, 0.12, 48.29);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.73, 140.23, 113.39, 0.002, 0.404);

-- CSV row 273
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.900, 44.500, 92.600, 68.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 233.51, 1.831);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.875, 0.082, 725, 0.094, 37.67);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.12, 173.06, 69.29, 0, 0.184);

-- CSV row 274
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.300, 46.900, 89.300, 66.18000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 234.06, -0.821);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.808, 0.026, 1461, 0.099, 32.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.24, 182.52, 90.97, 0.087, 0.213);

-- CSV row 275
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 30.900, 55.900, 93.300, 69.60000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 231.79, 1.595);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.093, 0, 1160, 0.104, 18.7);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.85, 179.71, 100.75, 0.018, 0.194);

-- CSV row 276
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 56.500, 44.400, 90.500, 69.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 242.66, -0.559);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.817, 0.103, 1142, 0.094, 39.48);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.15, 169.03, 73.75, 0, 0.139);

-- CSV row 277
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.400, 40.0, 88.400, 63.88000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 236.93, -0.118);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.651, 0.16, 1584, 0.096, 45.13);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.73, 163.81, 64.79, 0, 0.181);

-- CSV row 278
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.400, 46.600, 90.200, 65.36000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 233.92, -1.658);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.608, 0.131, 359, 0.047, 35.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.69, 166.36, 82.85, 0.001, 0.17);

-- CSV row 279
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 53.300, 36.600, 92.500, 67.89000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 244.15, -3.036);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.084, 0.17, 1123, 0.092, 53.05);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.86, 171.83, 70.25, 0, 0.158);

-- CSV row 280
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 27.200, 50.500, 96.600, 68.89000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 233.27, 1.806);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.562, 0.24, 315, 0.095, 76.96);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.97, 186.82, 82.13, 0.011, 0.147);

-- CSV row 281
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 32.600, 54.800, 82.400, 64.16000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 242.51, -0.581);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.213, 0.046, 370, 0.075, 46.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.28, 150.55, 96.44, 0.004, 0.185);

-- CSV row 282
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.300, 45.500, 83.900, 63.26000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 240.66, -3.602);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.622, 0.023, 1270, 0.082, 40.92);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.25, 149.62, 102.57, 0.01, 0.25);

-- CSV row 283
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.900, 58.400, 79.400, 65.40000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 247.58, 2.649);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.091, 0.143, 456, 0.096, 38.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.08, 136.21, 116.74, 0.007, 0.331);

-- CSV row 284
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.200, 52.900, 82.300, 62.26000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 235.93, 2.061);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.694, 0.222, 370, 0.1, 62.8);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.59, 150.59, 115.72, 0, 0.219);

-- CSV row 285
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 1.100, 44.300, 75.100, 51.06000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 220.89, 5.253);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.334, 0.099, 1056, 0.091, 41.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.15, 121.19, 115.39, 0.003, 0.217);

-- CSV row 286
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.100, 48.300, 87.900, 63.66000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 239.72, 2.325);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.484, 0.281, 451, 0.108, 74.39);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.39, 165.73, 90.47, 0.003, 0.152);

-- CSV row 287
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.700, 31.600, 75.900, 54.97000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 243.23, 2.694);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.484, 0.2, 782, 0.07, 49.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.73, 137.25, 113.97, 0.024, 0.28);

-- CSV row 288
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.500, 43.700, 78.600, 58.11000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 230.77, 0.911);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.806, 0.13, 1463, 0.088, 34.78);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.27, 135.94, 102.6, 0.027, 0.308);

-- CSV row 289
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 39.100, 30.600, 84.400, 59.20000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 243.07, 2.505);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.79, 0.157, 753, 0.069, 64.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.77, 149.88, 104.54, 0.017, 0.19);

-- CSV row 290
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 46.800, 45.100, 86.100, 65.94000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.025, 234.58, 4.505);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.422, 0.002, 1447, 0.087, 41.25);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.48, 150.05, 102.5, 0.001, 0.211);

-- CSV row 291
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.00, 46.00, 78.700, 61.55000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 240.8, 2.638);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.063, 0.128, 1265, 0.101, 47.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.07, 143.49, 111.64, 0.071, 0.245);

-- CSV row 292
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.900, 57.200, 74.300, 61.89000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 234.8, 10.739);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.575, 0.004, 336, 0.066, 46.83);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.98, 120.97, 130.07, 0.001, 0.233);

-- CSV row 293
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.00, 81.900, 77.900, 69.72000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 232.45, 8.337);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.16, 0, 131, 0.104, 21.73);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.26, 135.3, 120.64, 0.005, 0.189);

-- CSV row 294
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 23.100, 35.400, 75.600, 53.04000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 231.86, 12.602);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.414, 0.157, 677, 0.062, 56.45);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.64, 141.42, 110.24, 0.09, 0.26);

-- CSV row 295
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 30.900, 61.300, 76.900, 63.02000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 227.52, 2.988);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.081, 0.188, 328, 0.096, 42.07);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.55, 147.61, 125.55, 0.08, 0.299);

-- CSV row 296
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 32.900, 70.200, 75.300, 65.29000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.019, 231.24, 7.246);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.087, 0.022, 385, 0.1, 33.56);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.82, 126.28, 83.69, 0.005, 0.305);

-- CSV row 297
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.300, 37.500, 82.900, 61.56000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 242.66, -3.969);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.008, 0.043, 1041, 0.066, 45.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.37, 147.67, 120.73, 0.001, 0.221);

-- CSV row 298
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 48.300, 30.0, 81.200, 59.26000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 242.24, -5.066);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.134, 0.156, 749, 0.057, 40.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.85, 146.4, 91.62, 0.001, 0.232);

-- CSV row 299
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 36.700, 52.300, 86.300, 66.18000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 238.86, -3.639);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.852, 0.091, 436, 0.08, 44.82);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.3, 167.3, 114.06, 0, 0.15);

-- CSV row 300
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.100, 46.100, 84.100, 63.90000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 234.24, -0.518);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.404, 0.005, 539, 0.054, 19.18);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.61, 149.56, 122.64, 0.018, 0.255);

-- CSV row 301
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.100, 43.00, 80.900, 60.17000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 237.05, -1.714);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.498, 0.099, 919, 0.091, 45.37);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.1, 140.25, 147.04, 0.002, 0.267);

-- CSV row 302
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 24.600, 46.200, 80.300, 58.93000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 229.95, 8.828);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.704, 0.088, 1396, 0.088, 43.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.08, 135.2, 111.16, 0.009, 0.228);

-- CSV row 303
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 16.300, 57.200, 82.100, 61.47000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.003, 235.44, 11.828);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.381, 0.125, 521, 0.124, 63.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.28, 150.34, 77.01, 0.008, 0.186);

-- CSV row 304
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 7.700, 65.700, 77.500, 60.00000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 220.14, 5.635);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.439, 0.111, 140, 0.08, 46.59);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.79, 140.92, 99.6, 0.071, 0.212);

-- CSV row 305
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.800, 62.400, 88.200, 68.18000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 241.64, 4.072);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.589, 0.186, 341, 0.116, 54.26);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.84, 160.85, 85.84, 0.016, 0.24);

-- CSV row 306
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 27.700, 64.500, 91.100, 70.44000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 241.48, 9.053);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.114, 0, 324, 0.079, 45.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.96, 158.99, 65.61, 0.001, 0.154);

-- CSV row 307
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 66.500, 55.500, 88.300, 74.10000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 245.57, -4.942);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.706, 0.103, 538, 0.104, 38.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.72, 159.51, 83.8, 0.003, 0.169);

-- CSV row 308
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 54.200, 31.600, 84.100, 62.37000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 237.47, -4.183);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.852, 0.219, 769, 0.06, 37.86);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.16, 141.89, 80.61, 0.006, 0.218);

-- CSV row 309
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.900, 44.700, 82.500, 62.44000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 236.45, -1.685);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.749, 0.003, 1047, 0.095, 39.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.72, 138.66, 93.87, 0.003, 0.24);

-- CSV row 310
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 61.500, 34.900, 87.300, 66.42000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 248.32, -8.099);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.256, 0.135, 1018, 0.081, 55.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.75, 161.94, 105.89, 0.001, 0.163);

-- CSV row 311
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.300, 47.00, 87.500, 66.51000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 244.31, 0.444);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.588, 0.018, 985, 0.089, 32.69);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.15, 158.77, 97.67, 0.002, 0.147);

-- CSV row 312
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.100, 65.500, 80.100, 66.52000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 240.7, 9.811);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.275, 0.151, 170, 0.087, 42.51);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.36, 152.53, 90.38, 0.011, 0.21);

-- CSV row 313
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 48.800, 53.100, 80.100, 65.74000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 242.27, 9.037);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.591, 0.081, 1119, 0.113, 43.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.55, 149.23, 102.68, 0.007, 0.196);

-- CSV row 314
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 50.600, 57.600, 81.00, 67.90000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.025, 239.15, 11.541);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 9.329, 0.377, 220, 0.086, 51.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.68, 146.12, 93.75, 0.007, 0.214);

-- CSV row 315
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.500, 65.100, 84.400, 70.83000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 241.09, 10.517);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.046, 0.105, 187, 0.079, 42);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.17, 155.8, 83.97, 0.008, 0.143);

-- CSV row 316
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 52.300, 65.700, 82.900, 71.62000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 243.63, 13.739);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.333, 0.068, 495, 0.113, 23.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.59, 146.34, 92.98, 0, 0.155);

-- CSV row 317
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.600, 43.400, 92.500, 67.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 234.95, -5.565);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.111, 0.071, 1020, 0.084, 48.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.47, 181.95, 82.71, 0, 0.159);

-- CSV row 318
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 58.500, 59.200, 89.100, 74.01000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 245.12, -5.449);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.007, 0.026, 398, 0.08, 47.36);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.85, 162.01, 105.61, 0.001, 0.177);

-- CSV row 319
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.100, 79.500, 86.600, 75.37000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 240.59, -3.109);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.115, 0.011, 229, 0.137, 46.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.89, 159.55, 109.71, 0, 0.174);

-- CSV row 320
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 47.200, 76.500, 90.800, 77.79000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 244.09, -4.269);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.248, 0.123, 176, 0.133, 56.54);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.11, 171.18, 85.11, 0.004, 0.134);

-- CSV row 321
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.400, 67.200, 89.800, 74.14000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 240.73, -3.929);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.072, 0.259, 141, 0.105, 45.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.63, 165.75, 83.9, 0.011, 0.155);

-- CSV row 322
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 48.100, 63.600, 96.300, 76.85000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 239.21, 1.798);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.843, 0.215, 97, 0.098, 65.9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.11, 182.99, 90.95, 0, 0.148);

-- CSV row 323
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 29.100, 64.00, 81.300, 65.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 238.69, 5.439);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.317, 0.142, 404, 0.122, 43.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.48, 144.77, 108.28, 0.001, 0.187);

-- CSV row 324
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.700, 40.0, 86.200, 63.24000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 238.62, -3.924);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.835, 0.101, 1128, 0.083, 47.14);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.27, 149.48, 99.63, 0.001, 0.186);

-- CSV row 325
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 36.800, 35.800, 90.600, 63.40000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 240.13, -0.826);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.107, 0.133, 1570, 0.073, 52.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.89, 164.07, 105.11, 0, 0.141);

-- CSV row 326
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 23.600, 41.700, 82.100, 58.28000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 236.28, 7.245);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.866, 0.079, 1452, 0.081, 45.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.46, 146.2, 107.79, 0, 0.173);

-- CSV row 327
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 46.200, 25.100, 79.500, 56.52000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 245.7, 14.246);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 8.247, 0.336, 1099, 0.067, 76.19);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 176.13, 152.22, 75.33, 0.003, 0.223);

-- CSV row 328
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 63.400, 61.900, 83.300, 72.90000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.03, 244.38, 14.035);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.491, 0.298, 165, 0.121, 86.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.62, 153.59, 66.58, 0.021, 0.176);

-- CSV row 329
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.800, 42.600, 82.900, 60.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 233.89, 2.608);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.844, 0.118, 516, 0.067, 58.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.15, 160.31, 102.7, 0.009, 0.243);

-- CSV row 330
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.100, 49.100, 89.400, 68.05000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 235.44, 0.444);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.87, 0.115, 388, 0.085, 66.55);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.94, 157.66, 98.24, 0.001, 0.203);

-- CSV row 331
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 47.400, 40.200, 84.100, 63.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.027, 229.45, 1.374);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.746, 0.021, 1492, 0.08, 42.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.04, 156.39, 121.54, 0, 0.174);

-- CSV row 332
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 51.700, 52.900, 79.300, 65.86000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 244.78, 5.363);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.327, 0.025, 1187, 0.092, 36.52);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.58, 140.1, 128.74, 0.051, 0.259);

-- CSV row 333
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.700, 50.200, 75.700, 60.45000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 240.95, 3.754);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.17, 0.035, 1484, 0.091, 28.84);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.89, 139.38, 117.04, 0.075, 0.242);

-- CSV row 334
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.700, 56.600, 63.00, 57.22000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.019, 240.56, 5.691);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.079, 0.045, 1182, 0.118, 38.31);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.08, 136.25, 128.02, 0.236, 0.224);

-- CSV row 335
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.200, 62.700, 83.400, 68.75000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 229.6, -15.825);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.528, 0.081, 183, 0.122, 84.84);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.23, 174.35, 146.76, 0.106, 0.237);

-- CSV row 336
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 58.700, 47.800, 75.800, 63.98000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 245.66, -16.581);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.367, 0.048, 713, 0.152, 87.49);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 177.92, 138.91, 89.32, 0.048, 0.269);

-- CSV row 337
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 63.100, 27.200, 83.200, 62.38000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 246.51, -27.303);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 7.691, 0.283, 1305, 0.098, 119.2);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.15, 176.37, 110.19, 0.089, 0.298);

-- CSV row 338
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 54.500, 61.200, 73.300, 65.91000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 245.73, -11.09);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.328, 0, 438, 0.118, 64.15);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.78, 154.67, 113.31, 0.141, 0.228);

-- CSV row 339
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 57.400, 45.700, 77.500, 63.94000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 246.34, -16.549);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.009, 0.102, 337, 0.087, 85.08);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.49, 138.67, 97.77, 0.075, 0.272);

-- CSV row 340
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 66.200, 46.600, 90.500, 72.47000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 243, -17.009);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.348, 0.006, 1250, 0.135, 86.28);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.27, 170.04, 120.88, 0.02, 0.234);

-- CSV row 341
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 57.700, 59.800, 74.300, 66.63000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 244.88, -16.783);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.037, 0.026, 77, 0.094, 91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.13, 133.27, 110.81, 0.068, 0.249);

-- CSV row 342
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 39.00, 40.100, 80.900, 60.28000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.004, 229.15, -18.008);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.241, 0.045, 411, 0.087, 104.72);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.38, 149.42, 112.1, 0.043, 0.321);

-- CSV row 343
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.200, 47.800, 70.600, 58.68000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.002, 238.97, -13.221);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.098, 0.006, 1382, 0.135, 82.49);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.46, 158.75, 127.41, 0.178, 0.392);

-- CSV row 344
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.200, 33.100, 76.700, 57.12000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 232.42, -23.71);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 16.791, 0.699, 151, 0.081, 158.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.51, 137.46, 118.11, 0.084, 0.271);

-- CSV row 345
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 58.00, 49.700, 73.600, 63.31000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.002, 247.67, -25.758);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 9.962, 0.516, 177, 0.114, 116.75);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.72, 124.87, 118.9, 0.068, 0.273);

-- CSV row 346
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.200, 42.500, 73.500, 57.54000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.001, 230.13, -22.105);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 9.522, 0.477, 138, 0.073, 121.1);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.91, 126.87, 129.16, 0.078, 0.251);

-- CSV row 347
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 49.600, 55.700, 86.600, 69.93000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 244.31, 3.314);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.318, 0.003, 1337, 0.105, 25.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.33, 210.47, 59.34, 0.054, 0.221);

-- CSV row 348
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.800, 61.600, 87.700, 70.69000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 238.63, 3.468);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.001, 0.014, 1153, 0.137, 38.75);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.34, 202.95, 110.15, 0.08, 0.276);

-- CSV row 349
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.200, 62.100, 80.0, 67.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 244.61, 4.239);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.218, 0.015, 1142, 0.129, 31.04);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.47, 153.42, 119.71, 0.043, 0.247);

-- CSV row 350
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 50.500, 67.700, 49.900, 55.36000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 243.6, 2.03);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.415, 0.035, 1120, 0.145, 33.13);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.8, 146.17, 109.88, 0.344, 0.399);

-- CSV row 351
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 52.100, 76.700, 61.500, 64.18000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 243.36, 3.916);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.594, 0, 418, 0.136, 32.16);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.98, 147.83, 115.44, 0.175, 0.364);

-- CSV row 352
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.00, 62.200, 75.900, 65.41000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 241.56, 3.481);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.575, 0.042, 564, 0.134, 50.43);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.08, 165.83, 127.96, 0.14, 0.299);

-- CSV row 353
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 27.200, 48.400, 71.500, 55.71000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 240.16, 3.795);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.282, 0.013, 1285, 0.073, 23.23);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 174.02, 139.93, 84.21, 0, 0.242);

-- CSV row 354
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 29.500, 65.800, 69.500, 60.39000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 240.22, 4.237);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.783, 0.219, 152, 0.113, 63.21);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 175.43, 125.27, 144, 0, 0.267);

-- CSV row 355
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 36.500, 46.900, 66.100, 54.42000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 239.06, 2.89);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.756, 0.033, 1428, 0.075, 30.72);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.39, 149.9, 129.94, 0.184, 0.458);

-- CSV row 356
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.100, 46.200, 73.400, 57.98000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 239.94, 2.794);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.279, 0.013, 1224, 0.069, 39.38);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.09, 120.48, 122.64, 0.03, 0.276);

-- CSV row 357
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 33.600, 63.400, 69.500, 60.49000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 243.41, 2.657);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.439, 0.022, 965, 0.135, 27.15);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.45, 128.62, 111.91, 0.07, 0.258);

-- CSV row 358
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 32.00, 66.100, 86.400, 69.43000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 240.38, 2.691);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.406, 0.119, 280, 0.099, 39.2);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.44, 151.95, 122.35, 0.001, 0.213);

-- CSV row 359
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.700, 51.100, 84.800, 65.27000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 243.11, 2.218);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.594, 0.013, 1155, 0.09, 33.61);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.88, 197.35, 64.3, 0.053, 0.178);

-- CSV row 360
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 32.00, 51.500, 71.00, 57.35000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 242.46, 3.035);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.921, 0.036, 887, 0.103, 35.03);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.22, 166.12, 106.27, 0.203, 0.213);

-- CSV row 361
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.100, 57.400, 87.200, 68.84000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 243.64, 3.505);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.356, 0.017, 1289, 0.106, 28.07);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.11, 159.31, 88.22, 0, 0.237);

-- CSV row 362
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 46.300, 51.400, 66.200, 57.78000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 236.17, -1.505);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.775, 0.012, 1253, 0.1, 27.45);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.49, 108.51, 76.79, 0.119, 0.229);

-- CSV row 363
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 25.800, 53.400, 66.100, 54.23000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 234.87, -0.446);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.525, 0.049, 522, 0.072, 27.04);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.61, 132.05, 100.61, 0.101, 0.202);

-- CSV row 364
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 31.200, 50.0, 76.00, 59.24000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 230.39, -1.756);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.541, 0, 674, 0.108, 26.17);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.41, 157.18, 119.57, 0.042, 0.148);

-- CSV row 365
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 21.900, 65.900, 61.900, 55.10000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 229.24, -0.68);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.357, 0, 184, 0.077, 24.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.69, 157.14, 82.73, 0.254, 0.182);

-- CSV row 366
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.100, 69.00, 68.700, 63.07000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 235.82, -3.659);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.778, 0, 420, 0.108, 8.86);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.29, 161.43, 103.45, 0.208, 0.164);

-- CSV row 367
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 24.900, 64.100, 77.200, 62.81000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 230.33, -0.807);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.983, 0.037, 552, 0.113, 29.58);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.71, 161.98, 81.88, 0.123, 0.201);

-- CSV row 368
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 27.500, 43.800, 79.100, 58.19000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 232.17, 1.259);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.257, 0.03, 1066, 0.085, 46.37);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.28, 161.25, 71.71, 0.042, 0.159);

-- CSV row 369
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 26.400, 57.500, 54.700, 49.88000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 228.71, -0.949);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.94, 0.024, 1202, 0.117, 25.92);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.94, 136.82, 83.2, 0.326, 0.232);

-- CSV row 370
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 23.00, 44.700, 42.600, 39.31000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 229.07, 1.021);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.017, 0.053, 1245, 0.095, 46.36);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.3, 147.52, 89.5, 0.473, 0.266);

-- CSV row 371
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 35.200, 55.600, 67.500, 57.47000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 230.29, -5.564);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.683, 0, 1281, 0.108, 30.88);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.12, 136.43, 110.71, 0.075, 0.209);

-- CSV row 372
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 30.400, 51.400, 69.700, 56.35000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 235.31, -0.748);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.362, 0.009, 1521, 0.089, 25.73);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.34, 147.8, 78.25, 0.166, 0.204);

-- CSV row 373
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.500, 51.500, 73.00, 57.65000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 234.59, -0.865);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.184, 0.049, 1150, 0.096, 31.11);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.14, 152.55, 102.84, 0.063, 0.19);

-- CSV row 374
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 23.700, 46.800, 66.200, 51.88000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 230.26, -2.961);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.784, 0.116, 667, 0.087, 41.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.46, 152.94, 83.52, 0.214, 0.215);

-- CSV row 375
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 24.500, 39.800, 74.00, 53.84000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 232.32, 0.848);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.796, 0.033, 777, 0.065, 34.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.38, 154.9, 111.56, 0.097, 0.173);

-- CSV row 376
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.300, 43.900, 85.200, 61.43000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 232.14, -1.248);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.108, 0, 818, 0.066, 26.62);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6, 191.15, 111.93, 0.056, 0.148);

-- CSV row 377
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.500, 90.100, 72.500, 72.18000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 236.52, -2.93);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.161, 0, 127, 0.134, 8.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.12, 150.1, 109.67, 0.093, 0.204);

-- CSV row 378
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.600, 56.200, 70.0, 59.58000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 238.14, -0.975);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.565, 0.007, 949, 0.109, 26.82);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.52, 147.62, 81.28, 0.171, 0.172);

-- CSV row 379
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 27.00, 46.200, 78.400, 58.46000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 232.7, -0.569);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.666, 0, 792, 0.081, 35.18);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.01, 169.51, 127.29, 0.037, 0.148);

-- CSV row 380
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.00, 61.900, 71.00, 60.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 233.74, -3.53);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.014, 0.014, 332, 0.08, 38.53);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.79, 150.9, 91.16, 0.145, 0.194);

-- CSV row 381
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 24.400, 88.200, 72.900, 67.79000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 229.35, -2.04);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.846, 0, 32, 0.129, 36.96);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.22, 137.1, 79.18, 0.071, 0.235);

-- CSV row 382
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.200, 52.900, 74.700, 58.86000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 232.35, -0.565);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.419, 0.003, 1439, 0.095, 24.7);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.37, 158.54, 106.86, 0.064, 0.171);

-- CSV row 383
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.200, 46.200, 63.00, 51.00000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 235.93, -0.483);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.491, 0, 800, 0.078, 32.21);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.97, 153.4, 107.27, 0.221, 0.214);

-- CSV row 384
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 25.500, 61.400, 65.800, 56.42000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 232.9, -0.039);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.153, 0, 756, 0.115, 18.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.73, 158.67, 80.35, 0.226, 0.176);

-- CSV row 385
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.300, 42.600, 71.700, 56.09000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 237.83, -2.985);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.085, 0, 1149, 0.069, 27.15);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 5.37, 141.97, 126.73, 0.045, 0.219);

-- CSV row 386
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 33.200, 42.900, 62.100, 50.56000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 231.22, -3.409);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.581, 0, 1071, 0.072, 41.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.89, 118.92, 117.25, 0.106, 0.257);

-- CSV row 387
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.200, 57.00, 84.00, 67.14000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 239, -0.417);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.443, 0.003, 1172, 0.111, 29.46);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.6, 148.58, 108.36, 0.027, 0.131);

-- CSV row 388
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 28.800, 40.700, 56.100, 46.02000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 233.55, -2.089);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.712, 0, 905, 0.059, 19.87);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.21, 171.56, 108.2, 0.376, 0.204);

-- CSV row 389
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 21.300, 43.200, 76.900, 55.67000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 228.74, 0.709);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.036, 0.041, 910, 0.079, 33.52);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.19, 167.35, 96.59, 0.083, 0.159);

-- CSV row 390
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 35.00, 53.00, 74.400, 60.10000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.013, 233.38, -0.763);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.479, 0.011, 742, 0.105, 34.9);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.38, 166.68, 74.32, 0.111, 0.178);

-- CSV row 391
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 37.500, 88.300, 62.700, 65.34000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 233.03, -3.772);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.236, 0, 124, 0.135, 18.5);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.58, 165.02, 105.09, 0.27, 0.211);

-- CSV row 392
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 22.100, 70.700, 81.300, 66.28000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.005, 230.76, -1.541);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.357, 0, 94, 0.069, 39.63);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.73, 180.28, 107.53, 0.042, 0.166);

-- CSV row 393
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.400, 54.300, 82.00, 65.77000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 235.69, -0.999);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.509, 0.014, 1071, 0.11, 44.02);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.53, 163.59, 137.25, 0.037, 0.28);

-- CSV row 394
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 64.300, 92.200, 89.200, 85.12000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.043, 232.17, -1.975);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.08, 0, 27, 0.144, 31.86);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.22, 160.8, 125.48, 0.001, 0.189);

-- CSV row 395
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 52.500, 53.300, 84.600, 68.79000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 245.89, -3.801);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.947, 0.041, 493, 0.085, 43.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.06, 165.02, 154.76, 0.054, 0.209);

-- CSV row 396
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.800, 36.500, 92.100, 65.36000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 234.98, -1.677);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 6.224, 0.214, 575, 0.069, 55.96);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.11, 185.59, 72.56, 0.018, 0.202);

-- CSV row 397
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.900, 38.400, 81.300, 61.15000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 243.06, -3);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.116, 0.091, 1160, 0.072, 48.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.28, 147.76, 142, 0.023, 0.264);

-- CSV row 398
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 38.500, 37.700, 88.300, 63.16000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.009, 239.45, -1.864);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.267, 0.187, 1218, 0.088, 50.01);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.45, 163.64, 144.73, 0.01, 0.184);

-- CSV row 399
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.00, 47.200, 86.600, 66.26000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 243.91, -4.128);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.497, 0.003, 747, 0.09, 44.36);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.23, 151.24, 173.31, 0.002, 0.153);

-- CSV row 400
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 47.800, 40.800, 81.800, 62.70000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 240.14, -3.308);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.166, 0.164, 840, 0.096, 55.68);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.86, 140.35, 160.53, 0.005, 0.166);

-- CSV row 401
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 34.00, 38.00, 82.600, 59.50000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 240.41, -0.552);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.212, 0.183, 614, 0.066, 54.37);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.31, 163.71, 141.34, 0.068, 0.221);

-- CSV row 402
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 41.500, 50.300, 85.600, 66.19000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 242.96, -2.789);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.594, 0.119, 1276, 0.116, 50.71);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.31, 159.3, 143.81, 0.003, 0.189);

-- CSV row 403
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.900, 34.600, 84.800, 61.36000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 242.68, -1.626);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.7, 0.218, 1068, 0.084, 55.48);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.51, 160.96, 150.24, 0.046, 0.214);

-- CSV row 404
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 50.900, 38.900, 87.800, 65.75000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 239.06, -3.586);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.505, 0, 1282, 0.063, 58.91);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0, 164.01, 126.12, 0.047, 0.242);

-- CSV row 405
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.00, 47.800, 87.700, 66.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.008, 243.5, -2.694);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.84, 0.027, 1558, 0.084, 39.27);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.83, 162.42, 119.25, 0.021, 0.217);

-- CSV row 406
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.300, 46.700, 75.400, 60.77000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 243.12, -2.107);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.885, 0.14, 950, 0.101, 45.98);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.85, 147.84, 173.94, 0.087, 0.252);

-- CSV row 407
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.700, 37.200, 87.200, 63.50000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 243.5, -2.055);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.5, 0.111, 1217, 0.069, 45.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.53, 153.11, 137.91, 0.013, 0.179);

-- CSV row 408
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.200, 47.200, 83.300, 64.65000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 246.51, -2.985);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.584, 0.034, 822, 0.091, 43.79);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.86, 158.78, 124.19, 0.056, 0.203);

-- CSV row 409
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 29.800, 39.700, 81.400, 58.57000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 221.22, -2.984);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.773, 0.025, 1295, 0.066, 46.45);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.03, 146.73, 163.71, 0.003, 0.162);

-- CSV row 410
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.700, 51.300, 81.300, 64.58000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.01, 241.08, -2.51);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.166, 0.018, 1488, 0.091, 38.02);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.87, 160.94, 138.14, 0.076, 0.26);

-- CSV row 411
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.500, 83.100, 74.00, 71.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.022, 228.77, -2.377);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.686, 0.011, 46, 0.116, 56.88);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.4, 164.31, 128.16, 0.168, 0.278);

-- CSV row 412
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.500, 68.800, 83.300, 70.99000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 242.84, 2.142);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.406, 0, 378, 0.098, 11.71);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.59, 149.99, 159.54, 0.028, 0.184);

-- CSV row 413
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 49.900, 34.400, 78.900, 59.75000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 240.74, -2.07);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.826, 0.183, 960, 0.079, 48.34);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.61, 146.97, 155.03, 0.04, 0.29);

-- CSV row 414
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 42.800, 66.400, 77.100, 67.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.02, 232.03, -0.297);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.85, 0.139, 270, 0.095, 40.26);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.79, 161.56, 145.38, 0.142, 0.3);

-- CSV row 415
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 46.00, 61.600, 88.100, 71.73000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 240.92, -0.986);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.795, 0.085, 502, 0.111, 45.12);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.34, 161.9, 142.35, 0.004, 0.193);

-- CSV row 416
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 43.500, 45.800, 73.800, 59.34000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.014, 239.14, -0.543);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 5.306, 0.202, 384, 0.068, 58.03);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 3.74, 164.33, 140.84, 0.149, 0.296);

-- CSV row 417
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 63.500, 41.600, 64.100, 57.23000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.04, 232.47, -1.104);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.823, 0.177, 634, 0.087, 53.12);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.35, 149.19, 153.13, 0.216, 0.327);

-- CSV row 418
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 40.900, 52.400, 86.900, 67.35000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.021, 228.58, -0.18);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.289, 0.18, 319, 0.071, 54.03);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.8, 153.41, 145, 0.004, 0.188);

-- CSV row 419
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 49.700, 54.00, 77.400, 64.84000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.012, 244.8, -2.859);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.894, 0.142, 530, 0.094, 44.31);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.1, 141.28, 154.43, 0.044, 0.243);

-- CSV row 420
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 45.800, 46.00, 82.800, 64.36000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 238.53, -2.348);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.213, 0.114, 1368, 0.089, 41.52);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.55, 149.62, 135.88, 0.003, 0.314);

-- CSV row 421
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 57.400, 48.400, 83.300, 67.65000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.017, 247.5, -2.39);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.466, 0.076, 1282, 0.086, 25.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.55, 159.93, 142.24, 0.062, 0.227);

-- CSV row 422
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 44.500, 57.300, 81.00, 66.59000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.011, 245.92, 0.546);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.827, 0.106, 481, 0.1, 56.95);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.52, 155.11, 141.14, 0.059, 0.267);

-- CSV row 423
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 39.900, 73.00, 91.200, 75.48000, 'HIGH', 'HIGH', 'HIGH');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.016, 236.12, 1.252);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.693, 0, 103, 0.077, 28.89);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 0.93, 174.71, 127.95, 0.012, 0.221);

-- CSV row 424
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 59.500, 44.300, 80.500, 65.44000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.031, 231.62, -1.492);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.754, 0.124, 402, 0.055, 59.74);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.24, 153.28, 137.44, 0.071, 0.194);

-- CSV row 425
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'tilapia', 47.100, 42.300, 79.700, 61.96000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 238.66, -2.522);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -1.154, 0, 1017, 0.053, 46.39);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.89, 161.86, 119.52, 0.116, 0.253);

COMMIT;
