const connection = require("../db-config");
const router = require("express").Router();

/* CREATING GET ROUTE */

// MAIN ROUTE
router.get("/", (req, res) => {
  connection.query("SELECT * FROM product", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// GLOBAL CA
router.get("/global-ca-product", (req, res) => {
  connection.query("SELECT SUM(p.price), SUM(b.buy_afterclic) FROM product AS p INNER JOIN Buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// NUMBER OF ORDERS
router.get("/number-of-orders", (req, res) => {
  connection.query("SELECT SUM(p.price), SUM(b.buy_afterclic) FROM product AS p INNER JOIN buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// ORDER CONVERSION RATE
router.get("/order-conversion-rate", (req, res) => {
  connection.query("SELECT COUNT(b.buy_afterclic)*100.0/(SELECT COUNT(*) FROM buy) FROM buy AS b WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// AVERAGE CONSULTATION DURATION
router.get("/average-consultation-duration", (req, res) => {
  connection.query("SELECT COUNT(b.buy_afterclic)*100.0/(SELECT COUNT(*) FROM buy) FROM buy AS b WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// BRAND AND ARTICLE ORDERED
router.get("/brand-article-ordered", (req, res) => {
  connection.query("SELECT p.brand, p.price, p.article, b.buy_afterclic FROM product AS p INNER JOIN Buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// CA BY BRAND
router.get("/ca-by-brand", (req, res) => {
  connection.query("SELECT p.brand, p.article, SUM(p.price), b.buy_afterclic FROM product AS p INNER JOIN buy AS b ON p.idProduct=b.product_id WHERE b.buy_afterclic = 1 GROUP BY p.brand, p.article;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

module.exports = router;
