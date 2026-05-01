import { Router } from "express";
import upload from "../middleware/upload.middleware.js";
import { analyzeFish, getHistory } from "../controllers/fish.controller.js";
import { auth, optionalAuth } from "../utils/auth.js";

const router = Router();

const uploadFields = (req, res, next) => {
    upload.fields([
        {name: "fish_image", maxCount: 1},
        {name: "gill_image", maxCount: 1},
        {name: "eye_image", maxCount: 1},
    ])(req, res, (err) => {
        if (err) return next(err);
        next();
    });
};


router.get("/history", auth, getHistory);
router.post("/analyze", optionalAuth, uploadFields, analyzeFish);

export default router;