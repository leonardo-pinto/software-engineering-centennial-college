const successResponse = require("../../utils/success-response");
const apiError = require("../../utils/api-error");
const { Product } = require("../../models");

async function getAllProducts(req) {
  const name = req.query.name;

  if (!name) {
    
    const products = await Product.find();
    return new successResponse(200, products);
  } else {
    const formattedName = name.slice(1, -1); // requirement to receive inside []
    const productsByName = await Product.find({
      name: new RegExp(formattedName, "i"),
    });
    return new successResponse(200, productsByName);
  }
}

async function getProductById(req) {
  const { id } = req.params;
  const product = await Product.findById(id);
  return new successResponse(200, product);
}

function getProductsByName(req) {
  return new successResponse(200);
}

async function createProduct(req) {
  const product = new Product({ ...req.body });
  const createdProduct = await product.save();
  return new successResponse(201, createdProduct);
}

async function updateProduct(req) {
  const { id } = req.params;
  const updatedProduct = await Product.findByIdAndUpdate(id, req.body);
  return new successResponse(200, updatedProduct);
}

async function deleteProduct(req) {
  const { id } = req.params;
  await Product.findByIdAndDelete(id);
  return new successResponse(204);
}

async function deleteAllProducts() {
  await Product.deleteMany({});
  return new successResponse(204);
}

module.exports = {
  getAllProducts,
  getProductById,
  getProductsByName,
  createProduct,
  updateProduct,
  deleteProduct,
  deleteAllProducts,
};
