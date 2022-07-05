const {
  findAllVisitor,
  findAverageConsultationDuration,
  findCaByVisitor,
  findArticleAndBoughtVisitor
} = require('../model/visitorModel');


// MAIN ROUTE
const getAllVisitor = async (req, res) => {
    try {
      const result = await findAllVisitor();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// AVERAGE CONSULTATION DURATION
const getAverageConsultationDuration = async (req, res) => {
    try {
      const result = await findAverageConsultationDuration();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// CA BY VISITOR
const getCaByVisitor = async (req, res) => {
    try {
      const result = await findCaByVisitor();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

// ARTICLE AND BRAND BOUGHT BY VISITOR
const getArticleAndBoughtVisitor = async (req, res) => {
    try {
      const result = await findArticleAndBoughtVisitor();
      res.status(200).json(result);
    } catch (err) {
      res.status(500).send(`internal server error : ${err.message}`);
    }
};

module.exports = {
  getAllVisitor,
  getAverageConsultationDuration,
  getCaByVisitor,
  getArticleAndBoughtVisitor
};
