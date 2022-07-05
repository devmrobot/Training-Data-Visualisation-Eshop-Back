const connection = require('../db-config');

// MAIN ROUTE
const findAllVisitor = async () => {
  const result = await connection.promise().query("SELECT * FROM visitor");
  return result[0];
};

// AVERAGE CONSULTATION DURATION
const findAverageConsultationDuration = async () => {
    const result = await connection.promise().query("SELECT AVG(b.time_spent) FROM buy AS b;");
    return result[0];
};

// CA BY VISITOR
const findCaByVisitor = async () => {
    const result = await connection.promise().query("SELECT v.firstname, v.lastname, b.buy_afterclic, SUM(p.price) FROM visitor AS v INNER JOIN buy AS b ON v.idVisitor=b.visitor_id INNER JOIN product As p ON b.product_id=p.idProduct WHERE b.buy_afterclic = 1 GROUP BY v.firstname, v.lastname;");
    return result[0];
};

// ARTICLE AND BRAND BOUGHT BY VISITOR
const findArticleAndBoughtVisitor = async () => {
    const result = await connection.promise().query("SELECT v.firstname, v.lastname, b.buy_afterclic, SUM(p.price), p.brand, p.article FROM visitor AS v INNER JOIN buy AS b ON v.idVisitor=b.visitor_id INNER JOIN product As p ON b.product_id=p.idProduct WHERE b.buy_afterclic = 1 GROUP BY v.firstname, v.lastname, p.brand, p.article;");
    return result[0];
};

module.exports = {
    findAllVisitor,
    findAverageConsultationDuration,
    findCaByVisitor,
    findArticleAndBoughtVisitor
};


