const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const ProductSchema = new Schema({
  name: String,
  description: String,
  price: Number,
  quantity: Number,
  category: String,
});

const CategoriesSchema = new Schema({
  name: String,
});

const Product = mongoose.model("Product", ProductSchema);
const Category = mongoose.model("Categories", CategoriesSchema);

module.exports = { Product, Category };
