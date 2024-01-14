const express = require("express");
const cors = require("cors");
const routes = require("./routes");
const app = express();

app.use(cors());
app.use(express.json());
app.use("/api/products", routes);

module.exports = app;
