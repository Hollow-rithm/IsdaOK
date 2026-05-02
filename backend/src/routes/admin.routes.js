import { Router } from "express";
import { showUsers, searchUsers, deleteUser, getUserHistory, deleteUserRecord } from "../controllers/admin.controllers.js";
import { auth, requireRole } from "../utils/auth.js";

const router = Router();

router.get("/admin", auth, requireRole("admin"), showUsers);
router.get("/admin/search", auth, requireRole("admin"), searchUsers);
router.get("/admin/users/:id/history", auth, requireRole("admin"), getUserHistory);
router.delete("/admin/delete/record/:id", auth, requireRole("admin"), deleteUserRecord);
router.delete("/admin/delete/:id", auth, requireRole("admin"), deleteUser);

export default router;
