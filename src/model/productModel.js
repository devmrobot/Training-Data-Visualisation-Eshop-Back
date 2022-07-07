const connection = require('../db-config');

// MAIN ROUTE
const findAllProduct = async () => {
  const result = await connection.promise().query("SELECT * FROM product");
  return result[0];
};

// GLOBAL CA
const findGlobalCaProduct = async () => {
    const result = await connection.promise().query("SELECT SUM(p.price), SUM(b.buy_afterclic) FROM product AS p INNER JOIN Buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1;");
    return result[0];
};

// NUMBER OF ORDERS
const findNumberOfOrders = async () => {
    const result = await connection.promise().query("SELECT SUM(b.buy_afterclic) FROM buy AS b WHERE b.buy_afterclic = 1;");
    return result[0];
};

// ORDER CONVERSION RATE
const findOrderConversionRate = async () => {
    const result = await connection.promise().query("SELECT CAST((COUNT(b.buy_afterclic)*100.0/(SELECT COUNT(*) FROM buy)) AS DECIMAL(8,2)) AS duration FROM buy AS b WHERE b.buy_afterclic = 1;");
    return result[0];
};

// BRAND AND ARTICLE ORDERED
const findBrandAndArticleOrdered = async () => {
    const result = await connection.promise().query("SELECT p.brand, p.price, p.article, b.buy_afterclic FROM product AS p INNER JOIN Buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1;");
    return result[0];
};

// CA BY BRAND
const findCaByBrand = async () => {
    const result = await connection.promise().query("SELECT p.brand, p.article, SUM(p.price), b.buy_afterclic FROM product AS p INNER JOIN buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1 GROUP BY p.brand, p.article;");
    return result[0];
};

module.exports = {
    findAllProduct,
    findGlobalCaProduct,
    findNumberOfOrders,
    findOrderConversionRate,
    findBrandAndArticleOrdered,
    findCaByBrand
};