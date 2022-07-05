const router = require("express").Router();
const productRouter = require("./product.routes");
const visitorRouter = require("./visitor.routes");

router.use('/products', productRouter);
router.use('/visitors', visitorRouter);

module.exports = router;