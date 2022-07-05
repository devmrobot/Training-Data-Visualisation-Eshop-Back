const router = require('express').Router();
const productController = require('../controller/productController');

router.get("/", (productController.getAllProduct));
router.get("/global-ca-product", (productController.getGlobalCaProduct));
router.get("/number-of-orders", (productController.getNumberOfOrders));
router.get("/order-conversion-rate", (productController.getOrderConversionRate));
router.get("/brand-article-ordered", (productController.getBrandAndArticleOrdered));
router.get("/ca-by-brand", (productController.getCaByBrand));

module.exports = router;