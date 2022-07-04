const router = require("express").Router();
const userRouter = require("./user.routes");
const productRouter = require("./product.routes");
const visitorRouter = require("./visitor.routes");

router.use('/users', userRouter);
router.use('/products', productRouter);
router.use('/visitors', visitorRouter);

module.exports = router;