const {
    findAllProduct,
    findGlobalCaProduct,
    findNumberOfOrders,
    findOrderConversionRate,
    findBrandAndArticleOrdered,
    findCaByBrand
} = require('../model/productModel');

// MAIN ROUTE
const getAllProduct = async (req, res) => {
    try {
      const result = await findAllProduct();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// GLOBAL CA
const getGlobalCaProduct = async (req, res) => {
    try {
      const result = await findGlobalCaProduct();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// NUMBER OF ORDERS
const getNumberOfOrders = async (req, res) => {
    try {
      const result = await findNumberOfOrders();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// ORDER CONVERSION RATE
const getOrderConversionRate = async (req, res) => {
    try {
      const result = await findOrderConversionRate();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// BRAND AND ARTICLE ORDERED
const getBrandAndArticleOrdered = async (req, res) => {
    try {
      const result = await findBrandAndArticleOrdered();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// CA BY BRAND
const getCaByBrand = async (req, res) => {
    try {
      const result = await findCaByBrand();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

module.exports = {
    getAllProduct,
    getGlobalCaProduct,
    getNumberOfOrders,
    getOrderConversionRate,
    getBrandAndArticleOrdered,
    getCaByBrand
};