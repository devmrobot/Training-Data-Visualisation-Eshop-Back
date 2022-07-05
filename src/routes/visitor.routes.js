const router = require('express').Router();
const visitorController = require('../controller/visitorController');

router.get("/", (visitorController.getAllVisitor));
router.get("/average-consultation-duration", (visitorController.getAverageConsultationDuration));
router.get("/ca-by-visitor", (visitorController.getCaByVisitor));
router.get("/article-bought-visitor", (visitorController.getArticleAndBoughtVisitor));

module.exports = router;