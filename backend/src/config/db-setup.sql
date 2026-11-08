-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 3:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

CREATE DATABASE IF NOT EXISTS isdaok;
USE isdaok;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `users`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(20) NOT NULL DEFAULT 'user',
    `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
    `is_verified` TINYINT(1) DEFAULT 0,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user_tokens`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `type` ENUM('verification', 'reset', 'refresh') NOT NULL,
    `token` VARCHAR(512) NOT NULL,
    `expires_at` DATETIME NOT NULL,
    `used` TINYINT(1) DEFAULT 0,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `scans`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NULL,
    `species` VARCHAR(100) DEFAULT NULL,
    `body_score` DOUBLE DEFAULT NULL,
    `gill_score` DOUBLE DEFAULT NULL,
    `eye_score` DOUBLE DEFAULT NULL,
    `rule_score` DOUBLE DEFAULT NULL,
    `rule_quality` ENUM('LOW', 'MID', 'HIGH') DEFAULT NULL,
    `ml_quality` ENUM('LOW', 'MID', 'HIGH') DEFAULT NULL,
    `final_quality` ENUM('LOW', 'MID', 'HIGH') DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `fish_eye`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `scan_id` BIGINT NULL,
    `lab_a_mean` DOUBLE DEFAULT NULL,
    `red_ratio` DOUBLE DEFAULT NULL,
    `lbp_texture_score` DOUBLE DEFAULT NULL,
    `canny_edge_density` DOUBLE DEFAULT NULL,
    `mean_saturation` DOUBLE DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `fish_body`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `scan_id` BIGINT NULL,
    `shine_coverage` DOUBLE DEFAULT NULL,
    `shine_intensity` DOUBLE DEFAULT NULL,
    `body_color_b` DOUBLE DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `fish_gills`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `scan_id` BIGINT NULL,
    `hue_mean` DOUBLE DEFAULT NULL,
    `redness_purity` DOUBLE DEFAULT NULL,
    `brightness_mean` DOUBLE DEFAULT NULL,
    `brown_dominance` DOUBLE DEFAULT NULL,
    `color_cov` DOUBLE DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE
    `user_tokens` ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE;

ALTER TABLE
    `scans` ADD CONSTRAINT `scans_ibfk_1` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL;

ALTER TABLE
    `fish_eye` ADD CONSTRAINT `fish_eye_ibfk_1` FOREIGN KEY(`scan_id`) REFERENCES `scans`(`id`) ON DELETE SET NULL;

ALTER TABLE
    `fish_body` ADD CONSTRAINT `fish_body_ibfk_1` FOREIGN KEY(`scan_id`) REFERENCES `scans`(`id`) ON DELETE SET NULL;

ALTER TABLE
    `fish_gills` ADD CONSTRAINT `fish_gills_ibfk_1` FOREIGN KEY(`scan_id`) REFERENCES `scans`(`id`) ON DELETE SET NULL;
  
INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `is_verified`, `updated_at`) 
    VALUES ('1', 'admin', 'hollowrithm@gmail.com', '$2b$10$erM.qKrFunchodKsZixZc..JdvYmsPHLGfTLfXIAV2kbyB16wS9e2', 'admin', NOW(), 1, NOW());
INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `is_verified`, `updated_at`) 
	VALUES ('2', 'Aldrin', 'aldrin@gmail.com', '$2b$10$erM.qKrFunchodKsZixZc..JdvYmsPHLGfTLfXIAV2kbyB16wS9e2', 'user', NOW(), 1, NOW());
INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `is_verified`, `updated_at`) 
	VALUES ('3', 'Jwaine', 'jwaine@gmail.com', '$2b$10$erM.qKrFunchodKsZixZc..JdvYmsPHLGfTLfXIAV2kbyB16wS9e2', 'user', NOW(), 1, NOW());
INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `is_verified`, `updated_at`) 
	VALUES ('4', 'Kyle', 'kyle@gmail.com', '$2b$10$erM.qKrFunchodKsZixZc..JdvYmsPHLGfTLfXIAV2kbyB16wS9e2', 'user', NOW(), 1, NOW());
INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `is_verified`, `updated_at`) 
	VALUES ('5', 'Jhuv', 'jhuv@gmail.com', '$2b$10$erM.qKrFunchodKsZixZc..JdvYmsPHLGfTLfXIAV2kbyB16wS9e2', 'user', NOW(), 1, NOW());

-- Aldrin Scans
SET @user_id = 2;
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 13.600, 69.200, 80.600, 63.78000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 224.2, -2.568);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.73, 0.001, 733, 0.099, 21.22);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.2, 176.57, 95.42, 0.067, 0.289);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 12.700, 48.600, 46.200, 40.22000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 222.9, -1.736);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.849, 0, 369, 0.072, 19.06);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 9.18, 168.85, 112.74, 0.522, 0.311);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 17.500, 69.500, 64.800, 56.75000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 226.12, -2.283);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.552, 0, 1114, 0.069, 21.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 6.82, 187.92, 88.28, 0.298, 0.363);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 7.700, 46.300, 64.00, 47.43000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.018, 218.63, -0.137);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.368, 0, 238, 0.071, 17.57);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 7.61, 154.26, 77.78, 0.16, 0.25);

-- Jwaine Scans
SET @user_id = 3;
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 28.300, 59.900, 76.900, 62.08000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.061, 235.07, 2.456);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.199, 0.017, 1402, 0.051, 25.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.59, 136.42, 82.39, 0.024, 0.282);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 34.300, 60.900, 83.800, 67.03000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.089, 234.29, 2.584);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.662, 0, 1508, 0.053, 17.17);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.26, 153.57, 66.22, 0.023, 0.236);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 38.00, 55.900, 80.600, 64.67000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.091, 236.11, 2.386);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 3.246, 0.028, 1006, 0.053, 26.64);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.09, 144.73, 73.84, 0.006, 0.233);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 64.800, 68.700, 74.00, 70.57000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.177, 237.06, 0.808);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.48, 0, 1318, 0.077, 28.93);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.32, 148.71, 71.51, 0.109, 0.304);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 16.00, 60.100, 92.300, 67.38000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.007, 232.03, 0.155);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.258, 0.008, 1318, 0.066, 34.08);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 2.59, 180.77, 95.65, 0, 0.098);

-- Kyle Scans
SET @user_id = 4;
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 17.300, 57.200, 90.500, 65.87000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.006, 230.76, -1.307);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.147, 0.006, 591, 0.09, 35.41);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.06, 164.83, 85.63, 0.002, 0.168);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 24.900, 57.900, 79.500, 62.10000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.031, 231.45, -1.948);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.024, 0.017, 972, 0.06, 38.01);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 4.61, 159.21, 118.7, 0.004, 0.239);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 43.800, 55.500, 55.300, 53.06000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.033, 242.51, -1.992);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, -0.405, 0, 327, 0.085, 28.99);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 10.24, 191.64, 86.6, 0.465, 0.183);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 15.800, 56.400, 92.300, 66.23000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.028, 231.04, 1.365);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.444, 0.002, 975, 0.055, 38.33);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.45, 168.82, 80.25, 0.002, 0.171);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 18.300, 39.300, 85.400, 58.15000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.039, 228.3, -0.433);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.996, 0.017, 518, 0.067, 39.66);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.86, 146.28, 94.2, 0, 0.225);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 25.600, 63.100, 85.500, 66.80000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.069, 229.67, 0.749);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 1.84, 0, 958, 0.079, 29.44);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.87, 147.99, 98.73, 0.004, 0.232);

-- Jhuv Scans
SET @user_id = 5;
INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 9.600, 40.900, 84.600, 56.49000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.023, 229.72, 3.247);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 2.327, 0, 566, 0.05, 41.4);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 178.46, 151.05, 84.07, 0.006, 0.191);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 26.500, 33.600, 77.500, 54.13000, 'LOW', 'LOW', 'LOW');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.015, 237.63, -0.095);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 4.364, 0.073, 413, 0.062, 44.43);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 1.95, 140.76, 107.66, 0.017, 0.293);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 52.300, 44.00, 78.00, 62.66000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.07, 238.62, -4.299);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.627, 0, 275, 0.074, 36.8);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 175.7, 145.58, 114.78, 0.001, 0.186);

INSERT INTO `scans` (`user_id`, `species`, `body_score`, `eye_score`, `gill_score`, `rule_score`, `rule_quality`, `ml_quality`, `final_quality`) VALUES (@user_id, 'bangus', 50.400, 49.800, 81.00, 65.52000, 'MID', 'MID', 'MID');
SET @scan_id = LAST_INSERT_ID();
INSERT INTO `fish_body` (`scan_id`, `shine_coverage`, `shine_intensity`, `body_color_b`) VALUES (@scan_id, 0.065, 236.91, -5.15);
INSERT INTO `fish_eye` (`scan_id`, `lab_a_mean`, `red_ratio`, `lbp_texture_score`, `canny_edge_density`, `mean_saturation`) VALUES (@scan_id, 0.669, 0, 369, 0.081, 34.16);
INSERT INTO `fish_gills` (`scan_id`, `hue_mean`, `redness_purity`, `brightness_mean`, `brown_dominance`, `color_cov`) VALUES (@scan_id, 179.77, 134.43, 111.6, 0.01, 0.243);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
