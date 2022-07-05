-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema enooco
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `enooco` ;

-- -----------------------------------------------------
-- Schema enooco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `enooco` DEFAULT CHARACTER SET utf8 ;
USE `enooco` ;

-- -----------------------------------------------------
-- Table `enooco`.`visitor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`visitor` ;

CREATE TABLE IF NOT EXISTS `enooco`.`visitor` (
  `idVisitor` INT NOT NULL COMMENT '	',
  `lastname` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `last_connexion` VARCHAR(45) NOT NULL,
  `nb_connexions` INT NOT NULL,
  `nb_articles reviewed` INT NOT NULL COMMENT '	',
  `allready_buy` TINYINT NOT NULL,
  PRIMARY KEY (`idVisitor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enooco`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`product` ;

CREATE TABLE IF NOT EXISTS `enooco`.`product` (
  `idProduct` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `type_article` VARCHAR(45) NOT NULL,
  `article` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enooco`.`buy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`buy` ;

CREATE TABLE IF NOT EXISTS `enooco`.`buy` (
  `idLogs` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `visitor_id` INT NOT NULL,
  `date_clic` DATETIME NOT NULL,
  `time_spent` INT NOT NULL,
  `buy_afterclic` TINYINT NOT NULL,
  PRIMARY KEY (`idLogs`),
  INDEX `fk_Visiteurs_has_Produits_Produits1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_Visiteurs_has_Produits_Visiteurs_idx` (`visitor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Visiteurs_has_Produits_Visiteurs`
    FOREIGN KEY (`visitor_id`)
    REFERENCES `enooco`.`visitor` (`idVisitor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visiteurs_has_Produits_Produits1`
    FOREIGN KEY (`product_id`)
    REFERENCES `enooco`.`product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `enooco`.`visitor`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`visitor` (`idVisitor`, `lastname`, `firstname`, `email`, `last_connexion`, `nb_connexions`, `nb_articles reviewed`, `allready_buy`) VALUES (24, 'Martin', 'Gabriel', 'g.martin99@gmail.com', '2021/01/01', 4, 4, true);
INSERT INTO `enooco`.`visitor` (`idVisitor`, `lastname`, `firstname`, `email`, `last_connexion`, `nb_connexions`, `nb_articles reviewed`, `allready_buy`) VALUES (25, 'Petit', 'Marie', 'm.petit99@gmail.com', '2021/01/04', 5, 5, true);
INSERT INTO `enooco`.`visitor` (`idVisitor`, `lastname`, `firstname`, `email`, `last_connexion`, `nb_connexions`, `nb_articles reviewed`, `allready_buy`) VALUES (26, 'Robert', 'Luc', 'l.robert99@gmail.com', '2021/01/03', 7, 7, true);
INSERT INTO `enooco`.`visitor` (`idVisitor`, `lastname`, `firstname`, `email`, `last_connexion`, `nb_connexions`, `nb_articles reviewed`, `allready_buy`) VALUES (27, 'Richard', 'Stéphanie', 's.richard99@gmail.com', '2020/12/11', 2, 2, false);

COMMIT;


-- -----------------------------------------------------
-- Data for table `enooco`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (1001, 'Levis', 'Jeans', '501', 99);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (1002, 'Levis', 'Jeans', '511', 119);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (2001, 'Gap', 'Jeans', 'Slim natural', 99);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (2002, 'Gap', 'Jeans', 'Skinny', 119);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (2003, 'Gap', 'Jeans', 'Droit', 109);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (3001, 'Diesel', 'Jeans', 'Skinny', 129);
INSERT INTO `enooco`.`product` (`idProduct`, `brand`, `type_article`, `article`, `price`) VALUES (3002, 'Diesel', 'Jeans', 'Slim', 139);

COMMIT;


-- -----------------------------------------------------
-- Data for table `enooco`.`buy`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1001, 24, '2021/01/01', 20, true);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1002, 24, '2021/01/01', 25, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2001, 24, '2021/01/01', 22, true);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2002, 24, '2021/01/01', 20, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2001, 25, '2021/01/04', 8, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2002, 25, '2021/01/04', 7, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2003, 25, '2021/01/04', 9, true);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 3001, 25, '2021/01/04', 10, true);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 3002, 25, '2021/01/04', 7, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1001, 26, '2021/01/03', 5, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1002, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2001, 26, '2021/01/03', 5, true);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2002, 26, '2021/01/03', 5, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 2003, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 3001, 26, '2021/01/03', 3, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 3002, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1001, 27, '2021/12/11', 32, false);
INSERT INTO `enooco`.`buy` (`idLogs`, `product_id`, `visitor_id`, `date_clic`, `time_spent`, `buy_afterclic`) VALUES (DEFAULT, 1002, 27, '2020/12/11', 27, false);

COMMIT;

