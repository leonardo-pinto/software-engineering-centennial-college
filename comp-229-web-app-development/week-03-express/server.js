import express from "express";
const app = express();
const port = 5000;

app.use("/", (req, res) => {
  res.send("Hello");
});

app.listen(port);
console.log(`Server running at http://localhost:${port}`);

export default app;
