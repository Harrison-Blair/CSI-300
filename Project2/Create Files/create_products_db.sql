-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema products
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `products` ;

-- -----------------------------------------------------
-- Schema products
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `products` DEFAULT CHARACTER SET utf8 ;
USE `products` ;

-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product` ;

CREATE TABLE IF NOT EXISTS `Product` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `product_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductInventory` ;

CREATE TABLE IF NOT EXISTS `ProductInventory` (
  `product_id` INT NOT NULL,
  `pi_qty` INT NOT NULL,
  `pi_date` DATE NOT NULL,
  `pi_trigger_order` INT NOT NULL,
  PRIMARY KEY (`product_id`, `pi_date`),
  CONSTRAINT ``
    FOREIGN KEY (`product_id`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductPriceHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductPriceHistory` ;

CREATE TABLE IF NOT EXISTS `ProductPriceHistory` (
  `product_id` INT NOT NULL,
  `pph_date` DATE NOT NULL,
  `pph_price` INT NOT NULL,
  PRIMARY KEY (`product_id`, `pph_date`),
  CONSTRAINT `1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
