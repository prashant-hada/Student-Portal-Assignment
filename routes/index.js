import RegistrationRouter from "./userRegistrationRoutes.js";
import { Router } from "express";

const router = Router();

router.use("/user/registration", RegistrationRouter);


//For any other Route which is not handled.
router.all("*", (req, res) => {
  try {
    const error = Error(`cant find the ${req.originalUrl}`);
    throw error;
  } catch (error) {
    return res.status(404).json({ error });
  }
});

export default router;
