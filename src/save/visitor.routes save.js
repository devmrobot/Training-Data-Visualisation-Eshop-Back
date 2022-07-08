const connection = require("../db-config");
const router = require("express").Router();

/* CREATING GET ROUTE */

// MAIN ROUTE
router.get("/", (req, res) => {
  connection.query("SELECT * FROM visitor", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// AVERAGE CONSULTATION DURATION
router.get("/average-consultation-duration", (req, res) => {
  connection.query("SELECT CAST((AVG(b.time_spent)) AS DECIMAL(8,2)) AS time FROM buy AS b;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// CA BY VISITOR
router.get("/ca-by-visitor", (req, res) => {
  connection.query("SELECT v.firstname, v.lastname, b.buy_afterclic, SUM(p.price) AS price FROM visitor AS v INNER JOIN buy AS b ON v.idVisitor=b.visitor_id INNER JOIN product As p ON b.product_id=p.idProduct WHERE b.buy_afterclic = 1 GROUP BY v.firstname, v.lastname;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});


// ARTICLE AND BRAND BOUGHT BY VISITOR
router.get("/ca-by-visitor", (req, res) => {
  connection.query("SELECT v.firstname, v.lastname, v.email, b.buy_afterclic, SUM(p.price) AS price, p.brand, p.article FROM visitor AS v INNER JOIN buy AS b ON v.idVisitor=b.visitor_id INNER JOIN product As p ON b.product_id=p.idProduct WHERE b.buy_afterclic = 1 GROUP BY v.firstname, v.lastname, v.email, p.brand, p.article;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

module.exports = router;
