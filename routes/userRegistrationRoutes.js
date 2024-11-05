import { Router } from "express";
import { registerUser } from "../controllers/registration.js";

const router = Router();

router.post("/profile-details", registerUser);

export default router;