import db from "../config/database.js";
import axios from "axios";
import FormData from "form-data";
import fs from "fs";

const ML_SERVICE_URL = process.env.ML_SERVICE_URL;

export const analyzeFish = async ({ fishImage, gillImage, eyeImage, userId }) => {
    const form_data = new FormData();

    form_data.append("fish_image", fs.createReadStream(fishImage.path));

    if (gillImage?.path){
        form_data.append("gill_image", fs.createReadStream(gillImage.path));
    }
    if (eyeImage?.path){
        form_data.append("eye_image", fs.createReadStream(eyeImage.path));
    }

    try {
        const response = await axios.post(ML_SERVICE_URL, form_data, {
            headers: form_data.getHeaders(),
            timeout: 15000,
        });

        const result = response.data;

        if (userId) {
            const [scan] = await db.query(
                `INSERT INTO scans
                 (user_id, species, eye_score, body_score, gill_score, rule_score, rule_quality, ml_quality, final_quality)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    userId,
                    result.species,
                    result.scores.eye_score,
                    result.scores.body_score,
                    result.scores.gill_score,
                    result.rule_score,
                    result.rule_quality,
                    result.ml_quality,
                    result.final_quality
                ]
            );

            await db.query(
                `INSERT INTO fish_eye
                 (scan_id, red_intensity, red_coverage, eye_cloudiness) 
                 VALUES (?, ?, ?, ?)`,
                [
                    scan.insertId,
                    result.features.eye.red_intensity,
                    result.features.eye.red_coverage,
                    result.features.eye.eye_cloudiness
                ]
            );
            
            await db.query(
                `INSERT INTO fish_body
                 (scan_id, shine_coverage, shine_intensity, body_color_b) 
                 VALUES (?, ?, ?, ?)`,
                [
                    scan.insertId,
                    result.features.body.shine_coverage,
                    result.features.body.shine_intensity,
                    result.features.body.body_color_b
                ]
            );

            await db.query(
                `INSERT INTO fish_gills
                 (scan_id, hue_mean, redness_purity, brightness_mean, brown_dominance, color_cov) 
                 VALUES (?, ?, ?, ?, ?, ?)`,
                [
                    scan.insertId,
                    result.features.gill.hue_mean,
                    result.features.gill.redness_purity,
                    result.features.gill.brightness_mean,
                    result.features.gill.brown_dominance,
                    result.features.gill.color_cov
                ]
            );
        }

        return {
            has_fish: result.has_fish,
            species: result.species,
            eye_score: result.scores.eye_score,
            gill_score: result.scores.gill_score,
            body_score: result.scores.body_score,
            rule_score: result.rule_score,
            rule_quality : result.rule_quality,
            ml_quality: result.ml_quality,
            final_quality: result.final_quality,
        };

    } catch (err) {
        if (err.code === "ECONNREFUSED") {
            const error = new Error ("Python ML service is down or unreachable.");
            error.status = 503;
            throw error;
        }

        if (err.code === "ECONNABORTED") {
            const error = new Error("Python ML service timed out.");
            error.status = 504;
            throw error;
        }

        if (err.response) {
            const error = new Error(err.response.data.detail || "ML service returned an error.");
            error.status = err.response.status;
            throw error;
        }

        const error = new Error ("Unknown error occured.");
        error.status = 500;
        throw error;

    } finally {
        const files = [fishImage, gillImage, eyeImage];

        for (const file of files){
            try {
                if (file?.path && fs.existsSync(file.path)) {
                    await fs.promises.unlink(file.path);
                }
            } catch (e) {
                console.error("Failed to delete file: ", e);
            }
        }
    }
};

export const getHistory = async (userId) => {
  const [records] = await db.query(`
    SELECT
      id,
      created_at,
      species,
      rule_score,
      final_quality
    FROM scans
    WHERE user_id = ?
    ORDER BY created_at DESC
  `, [userId]);
  return records;
};

export const deleteRecord = async (scanId, userId) => {
	const [records] = await db.query("SELECT `id` FROM `scans` WHERE `id` = ? AND user_id = ?", [scanId, userId]);

	if(!records.length){
		const error = new Error("Record not found");
		error.status = 404;
		throw error;
	}

	await db.query("DELETE FROM `scans` WHERE `id` = ?", [scanId]);

	return {
		status: "success",
		message: "Record deleted successfully",
		scanId: records[0].id,
		userId: records[0].user_id
	};
};