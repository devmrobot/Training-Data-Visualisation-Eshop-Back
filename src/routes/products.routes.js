const connection = require("../db-config");
const router = require("express").Router();

/* CREATING GET ROUTE */

// SELECT CA GLOBAL & SALES NB
router.get("/global-ca", (req, res) => {
  connection.query("SELECT sum(p.price), sum(b.buy_afterclic)FROM Produits AS p INNER JOIN Buy AS b ON p.idProduits=b.produits_id WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

// SELECT CA BY MARQUES

router.get("/marques-ca", (req, res) => {
  connection.query("SELECT sum(p.price), sum(b.buy_afterclic)FROM Produits AS p INNER JOIN Buy AS b ON p.idProduits=b.produits_id WHERE b.buy_afterclic = 1;", (err, result) => {
    if (err) {
      res.status(500).send("Error retrieving users from database");
    } else {
      res.json(result);
    }
  });
});

module.exports = router;

SELECT SUM(p.price), SUM(b.buy_afterclic)
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1;

SELECT p.marque, p.price, p.article, b.buy_afterclic
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1;

SELECT p.marque, p.article, SUM(p.price), b.buy_afterclic
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1
GROUP BY p.marque, p.article;