import { Router } from "express";
import { register, login, verifyEmail, resendVerification, forgotPassword, resetPassword, verifyToken, googleLogin, googleRegister} from "../controllers/auth.controllers.js";
import { showUsers } from "../controllers/admin.controllers.js";
import { auth } from "../utils/auth.js";
import rateLimit from "express-rate-limit";

const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 3,
  message: { message: "Too many requests, please try again later." }
});

const router = Router();

router.post("/register", register);
router.post("/login", login);
router.get("/verify-email", verifyEmail);
router.post("/resend-verification", authLimiter, resendVerification);
router.post("/forgot-password", authLimiter,forgotPassword);
router.get("/reset-password", resetPassword);
router.post("/reset-password", resetPassword);
router.post("/verify-token", auth, verifyToken);
router.post("/login/google", googleLogin);
router.post("/register/google", googleRegister);

export default router;
