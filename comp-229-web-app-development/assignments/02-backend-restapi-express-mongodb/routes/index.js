const express = require("express");
const router = express.Router();
const asyncWrapper = require("../utils/async-wrapper");
const {
  getAllProducts,
  createProduct,
  getProductById,
  updateProduct,
  deleteProduct,
  deleteAllProducts,
} = require("../controllers/products");

// /GET all products
// /GET product by name
// same router was used to return all products and productsByName
// for the product by name, a validation is perform to check if a name query is passed
router.get("/", asyncWrapper(getAllProducts));

// /GET/:id get product by id
router.get("/:id", asyncWrapper(getProductById));

// /POST create product
router.post("/", asyncWrapper(createProduct));

// /PUT update product by id
router.put("/:id", asyncWrapper(updateProduct));

// /DELETE delete product by id
router.delete("/:id", asyncWrapper(deleteProduct));

// /DELETE delete all products
router.delete("/", asyncWrapper(deleteAllProducts));

module.exports = router;
