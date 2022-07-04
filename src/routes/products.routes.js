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

// CA GLOBAL
SELECT SUM(p.price), SUM(b.buy_afterclic)
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1;

// DUREE CONSULTATION MOYENNE
SELECT AVG(b.duree_consultation)
FROM buy AS b;

// NOMBRE DE COMMANDES
SELECT SUM(b.buy_afterclic)
FROM buy AS b
WHERE b.buy_afterclic = 1;

// TX DE CONVERSION COMMANDES ((Nombre total de commandes passées/ Total des visites) * 100)
SELECT b.buy_afterclic / COUNT(b.date_clic)
FROM buy AS b
WHERE b.buy_afterclic = 1;

// TX DE CONVERSION COMMANDES ((Nombre total de commandes passées/ Total des visites) * 100)
SELECT COUNT(b.buy_afterclic)*100.0/(SELECT COUNT(*) FROM buy)
FROM buy AS b
WHERE b.buy_afterclic = 1;


// MARQUE & ARTICLES COMMANDEES
SELECT p.marque, p.price, p.article, b.buy_afterclic
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1;

// CA PAR MARQUE
SELECT p.marque, p.article, SUM(p.price), b.buy_afterclic
FROM Produits AS p
INNER JOIN Buy AS b ON p.idProduits=b.produits_id
WHERE b.buy_afterclic = 1
GROUP BY p.marque, p.article;

// CA PAR VISITEURS
SELECT v.nom, v.prénom, b.buy_afterclic, SUM(p.price)
FROM Visiteurs AS v
INNER JOIN Buy AS b ON v.idVisiteurs=b.visiteurs_id
INNER JOIN Produits As p ON b.produits_id=p.idProduits
WHERE b.buy_afterclic = 1
GROUP BY v.nom, v.prénom;

// CA & TYPOLOGIE PAR VISITEURS
SELECT v.nom, v.prénom, b.buy_afterclic, SUM(p.price), p.marque, p.article
FROM Visiteurs AS v
INNER JOIN Buy AS b ON v.idVisiteurs=b.visiteurs_id
INNER JOIN Produits As p ON b.produits_id=p.idProduits
WHERE b.buy_afterclic = 1
GROUP BY v.nom, v.prénom, p.marque, p.article;