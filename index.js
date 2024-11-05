import express from "express";
import "dotenv/config";
import router from "./routes/index.js";

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware to parse JSON request bodies
app.use(express.json());

app.get("/", (req,res)=>{
    return res.send("Server Code Is Working, so don't Touch it!")
})

app.use("/api",router);


app.listen(PORT, ()=>{
    console.log(`Server is running on PORT: ${PORT}`)
})
