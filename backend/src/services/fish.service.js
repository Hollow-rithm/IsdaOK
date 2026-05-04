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
                "INSERT INTO scans (user_id, fish_image_path, gill_image_path, eye_image_path) VALUES (?, ?, ?, ?)",
                [userId, fishImage.path, gillImage?.path ?? null, eyeImage?.path ?? null]
            );

            await db.query(
                `INSERT INTO scan_results
                (scan_id, species, species_confidence, eye_score, gill_score, body_score, overall_score, quality_grade)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
                [
                    scan.insertId,
                    result.species,
                    result.features.eye_score,
                    result.features.gill_score,
                    result.features.body_score,
                    result.ml_score,
                    result.final_score,
                    result.quality.toUpperCase(),
                    //computeGrade(result.final_score)
                ]
            );
        }

        return {
            has_fish: result.has_fish,
            species: result.species,
            eye_score: result.features.eye_score,
            gill_score: result.features.gill_score,
            body_score: result.features.body_score,
            ml_score: result.ml_score,
            final_score: result.final_score,
            quality: result.quality,

            // species: response.data.species,
            // features: response.data.features,
            // rule_score: response.data.rule_score,
            // ml_score: response.data.ml_score,
            // quality: response.data.quality,
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
      s.id,
      s.created_at,
      sr.species,
      sr.overall_score,
      sr.quality_grade
    FROM scans s
    JOIN scan_results sr ON s.id = sr.scan_id
    WHERE s.user_id = ?
    ORDER BY s.created_at DESC
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