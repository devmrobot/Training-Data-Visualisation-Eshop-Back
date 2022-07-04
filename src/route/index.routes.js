const router = require("express").Router();
const userRouter = require("./users.routes");
const productRouter = require("./products.routes");
const visitorRouter = require("./visitors.routes");

router.use('/users', userRouter);
router.use('/products', productRouter);
router.use('/visitors', visitorRouter);

module.exports = router;