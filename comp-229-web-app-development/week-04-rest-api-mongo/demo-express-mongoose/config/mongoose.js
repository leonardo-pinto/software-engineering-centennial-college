const config = require("./development");
const mongoose = require("mongoose");

module.exports = async function () {
  try {
    const db = await mongoose.connect(config.db);
    require("../app/models/user.server.model");
    return db;
  } catch (error) {
    console.log(`ERROR::::: ${error}`);
  }
};
