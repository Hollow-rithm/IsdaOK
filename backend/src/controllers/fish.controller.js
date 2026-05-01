import * as fishService from "../services/fish.service.js";
import db from "../config/database.js";

export const analyzeFish = async (req, res) => {
    try {
        console.log("HEADERS:", req.headers);
        console.log("FILE:", req.files);
        console.log("BODY:", req.body);

        const fishImage = req.files?.fish_image?.[0];
        const gillImage = req.files?.gill_image?.[0];

        if (!fishImage) {
            return res.status(400).json({
                status: "error",
                message: "Fish image is required.",
            })
        }

        const userId = req.user?.id ?? null;
        const result = await fishService.analyzeFish({fishImage, gillImage});

        if (!result.has_fish) {
            return res.status(400).json({
                status: "error",
                message: "No fish detected in image.",
            })
        }
        return res.status(200).json({
            status: "success",
            message: "Fish image analyzed successfully",
            data: result,
        });

    } catch (err) {
        return res.status(err.status || 500).json({
            status: "error",
            message: err.message || "Failed to analyze fish image.",
        });
    }
};

export const getHistory = async (req, res) => {
     console.log("User from token:", req.user);
  try {
    const result = await fishService.getHistory(req.user.id);
    res.status(200).json(result);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};