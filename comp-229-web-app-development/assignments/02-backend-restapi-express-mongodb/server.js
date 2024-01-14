require("dotenv").config();
const mongoose = require("mongoose");
const app = require("./app");

const mongoConnection =
  process.env.MONGO_CONNECTION || "mongodb://0.0.0.0:27017/market-place";
const port = process.env.PORT || 3000;

(async () => {
  try {
    await mongoose.connect(mongoConnection);
    app.listen(port, () => console.log(`Server running on port ${port}`));
  } catch (error) {
    console.error(
      `An error occurred while connecting to the dabatase: ${error}`
    );
  }
})();
