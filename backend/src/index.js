import dotenv from "dotenv";
dotenv.config({ path: ".env" });

import express from "express";
import cors from "cors";
import authRoutes from "./routes/auth.routes.js";
import adminRoutes from "./routes/admin.routes.js";
import fishRoutes from "./routes/fish.routes.js";
import errorMiddleware from "./middleware/error.middleware.js"

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use("/api/auth", authRoutes);
app.use("/api", adminRoutes);
app.use("/api/fish", fishRoutes);
app.use(errorMiddleware);

app.listen(PORT, () => {
	console.log(`App is listening on Port: ${PORT}`);
});
