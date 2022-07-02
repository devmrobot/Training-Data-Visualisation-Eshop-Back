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
-- Table `enooco`.`Visiteurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`Visiteurs` ;

CREATE TABLE IF NOT EXISTS `enooco`.`Visiteurs` (
  `idVisiteurs` INT NOT NULL COMMENT '	',
  `Nom` VARCHAR(45) NOT NULL,
  `Prénom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Last_connexion` VARCHAR(45) NOT NULL,
  `Nb_connexions` INT NOT NULL,
  `Nb_articles consultés` INT NOT NULL COMMENT '	',
  `Déjà acheté` TINYINT NOT NULL,
  PRIMARY KEY (`idVisiteurs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enooco`.`Produits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`Produits` ;

CREATE TABLE IF NOT EXISTS `enooco`.`Produits` (
  `idProduits` INT NOT NULL,
  `Marque` VARCHAR(45) NOT NULL,
  `Type_article` VARCHAR(45) NOT NULL,
  `Article` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  PRIMARY KEY (`idProduits`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enooco`.`Visiteurs_has_Produits (Logs Clics)`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `enooco`.`Visiteurs_has_Produits (Logs Clics)` ;

CREATE TABLE IF NOT EXISTS `enooco`.`Visiteurs_has_Produits (Logs Clics)` (
  `idLogs` INT NOT NULL AUTO_INCREMENT,
  `Produits_idProduits` INT NOT NULL,
  `Visiteurs_idVisiteurs` INT NOT NULL,
  `Date clic` DATETIME NOT NULL,
  `Durée consultation` INT NOT NULL,
  `Achat après clic` TINYINT NOT NULL,
  PRIMARY KEY (`idLogs`),
  INDEX `fk_Visiteurs_has_Produits_Produits1_idx` (`Produits_idProduits` ASC) VISIBLE,
  INDEX `fk_Visiteurs_has_Produits_Visiteurs_idx` (`Visiteurs_idVisiteurs` ASC) VISIBLE,
  CONSTRAINT `fk_Visiteurs_has_Produits_Visiteurs`
    FOREIGN KEY (`Visiteurs_idVisiteurs`)
    REFERENCES `enooco`.`Visiteurs` (`idVisiteurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visiteurs_has_Produits_Produits1`
    FOREIGN KEY (`Produits_idProduits`)
    REFERENCES `enooco`.`Produits` (`idProduits`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `enooco`.`Visiteurs`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`Visiteurs` (`idVisiteurs`, `Nom`, `Prénom`, `Email`, `Last_connexion`, `Nb_connexions`, `Nb_articles consultés`, `Déjà acheté`) VALUES (24, 'Martin', 'Gabriel', 'g.martin99@gmail.com', '2021/01/01', 4, 4, true);
INSERT INTO `enooco`.`Visiteurs` (`idVisiteurs`, `Nom`, `Prénom`, `Email`, `Last_connexion`, `Nb_connexions`, `Nb_articles consultés`, `Déjà acheté`) VALUES (25, 'Petit', 'Marie', 'm.petit99@gmail.com', '2021/01/04', 5, 5, true);
INSERT INTO `enooco`.`Visiteurs` (`idVisiteurs`, `Nom`, `Prénom`, `Email`, `Last_connexion`, `Nb_connexions`, `Nb_articles consultés`, `Déjà acheté`) VALUES (26, 'Robert', 'Luc', 'l.robert99@gmail.com', '2021/01/03', 7, 7, true);
INSERT INTO `enooco`.`Visiteurs` (`idVisiteurs`, `Nom`, `Prénom`, `Email`, `Last_connexion`, `Nb_connexions`, `Nb_articles consultés`, `Déjà acheté`) VALUES (27, 'Richard', 'Stéphanie', 's.richard99@gmail.com', '2020/12/11', 2, 2, false);

COMMIT;


-- -----------------------------------------------------
-- Data for table `enooco`.`Produits`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (1001, 'Levis', 'Jeans', '501', 99);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (1002, 'Levis', 'Jeans', '511', 119);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (2001, 'Gap', 'Jeans', 'Slim natural', 99);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (2002, 'Gap', 'Jeans', 'Skinny', 119);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (2003, 'Gap', 'Jeans', 'Droit', 109);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (3001, 'Diesel', 'Jeans', 'Skinny', 129);
INSERT INTO `enooco`.`Produits` (`idProduits`, `Marque`, `Type_article`, `Article`, `Price`) VALUES (3002, 'Diesel', 'Jeans', 'Slim', 139);

COMMIT;


-- -----------------------------------------------------
-- Data for table `enooco`.`Visiteurs_has_Produits (Logs Clics)`
-- -----------------------------------------------------
START TRANSACTION;
USE `enooco`;
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1001, 24, '2021/01/01', 20, true);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1002, 24, '2021/01/01', 25, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2001, 24, '2021/01/01', 22, true);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2002, 24, '2021/01/01', 20, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2001, 25, '2021/01/04', 8, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2002, 25, '2021/01/04', 7, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2003, 25, '2021/01/04', 9, true);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 3001, 25, '2021/01/04', 10, true);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 3002, 25, '2021/01/04', 7, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1001, 26, '2021/01/03', 5, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1002, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2001, 26, '2021/01/03', 5, true);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2002, 26, '2021/01/03', 5, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 2003, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 3001, 26, '2021/01/03', 3, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 3002, 26, '2021/01/03', 4, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1001, 27, '2021/12/11', 32, false);
INSERT INTO `enooco`.`Visiteurs_has_Produits (Logs Clics)` (`idLogs`, `Produits_idProduits`, `Visiteurs_idVisiteurs`, `Date clic`, `Durée consultation`, `Achat après clic`) VALUES (DEFAULT, 1002, 27, '2020/12/11', 27, false);

COMMIT;

