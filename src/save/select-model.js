// // CA GLOBAL
// SELECT SUM(p.price) AS total, SUM(b.buy_afterclic) 
// FROM product AS p INNER JOIN Buy AS b ON p.idProduct=b.product_id 
// WHERE b.buy_afterclic = 1;


// // NOMBRE DE COMMANDES
// SELECT SUM(b.buy_afterclic) AS orders
// FROM buy AS b
// WHERE b.buy_afterclic = 1;

// // TX DE CONVERSION COMMANDES ((Nombre total de commandes passées/ Total des visites) * 100) avec deux decimals après la virgule
// SELECT CAST((COUNT(b.buy_afterclic)*100.0/(SELECT COUNT(*) FROM buy)) AS DECIMAL(8,2)) AS duration FROM buy AS b WHERE b.buy_afterclic = 1;


// // MARQUE & ARTICLES COMMANDEES
// SELECT p.brand, p.price, p.article, b.buy_afterclic 
// FROM products AS p 
// INNER JOIN Buy AS b ON p.idProducts=b.products_id
// WHERE b.buy_afterclic = 1;


// // CA PAR MARQUE
// SELECT p.brand, p.article, SUM(p.price), b.buy_afterclic
// FROM products AS p
// INNER JOIN buy AS b ON p.idProducts=b.products_id
// WHERE b.buy_afterclic = 1
// GROUP BY p.brand, p.article;


// // DUREE CONSULTATION MOYENNE
// SELECT AVG(b.time_spent)FROM buy AS b;


// // CA BY VISITOR
// SELECT v.firstname, v.lastname, b.buy_afterclic, SUM(p.price)
// FROM visitor AS v INNER JOIN buy AS b ON v.idVisitor=b.visitor_id
// INNER JOIN product As p ON b.product_id=p.idProduct
// WHERE b.buy_afterclic = 1
// GROUP BY v.firstname, v.lastname;


// // CA & TYPOLOGIE PAR VISITEURS
// SELECT v.firstname, v.lastname, v.email, b.buy_afterclic, SUM(p.price) AS price, p.brand, p.article
// FROM visitor AS v
// INNER JOIN buy AS b ON v.idVisitor=b.visitor_id
// INNER JOIN product As p ON b.product_id=p.idProduct
// WHERE b.buy_afterclic = 1
// GROUP BY v.firstname, v.lastname, v.email, p.brand, p.article;