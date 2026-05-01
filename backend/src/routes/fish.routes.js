import { Router } from "express";
import upload from "../middleware/upload.middleware.js";
import { analyzeFish, getHistory } from "../controllers/fish.controller.js";
import { auth, optionalAuth } from "../utils/auth.js";

const router = Router();

router.get("/history", auth, getHistory);
router.post("/analyze", optionalAuth, upload.fields([
    {name: "fish_image", maxCount: 1},
    {name: "gill_image", maxCount: 1}
]), analyzeFish);

export default router;