-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Parts
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Parts` ;

-- -----------------------------------------------------
-- Schema Parts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Parts` DEFAULT CHARACTER SET utf8 ;
USE `Parts` ;

-- -----------------------------------------------------
-- Table `Part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Part` ;

CREATE TABLE IF NOT EXISTS `Part` (
  `part_id` CHAR(10) NOT NULL,
  `part_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`part_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PartVendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartVendor` ;

CREATE TABLE IF NOT EXISTS `PartVendor` (
  `company_id` INT NOT NULL,
  `part_id` CHAR(10) NOT NULL,
  PRIMARY KEY (`part_id`, `company_id`),
  CONSTRAINT `2`
    FOREIGN KEY (`part_id`)
    REFERENCES `Part` (`part_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PartProduct`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartProduct` ;

CREATE TABLE IF NOT EXISTS `PartProduct` (
  `part_id` CHAR(10) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`part_id`, `product_id`),
  CONSTRAINT `3`
    FOREIGN KEY (`part_id`)
    REFERENCES `Part` (`part_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PartHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartHistory` ;

CREATE TABLE IF NOT EXISTS `PartHistory` (
  `part_id` CHAR(10) NOT NULL,
  `parhis_date` DATE NOT NULL,
  `parhis_price` INT NOT NULL,
  PRIMARY KEY (`part_id`, `parhis_date`),
  CONSTRAINT ``
    FOREIGN KEY (`part_id`)
    REFERENCES `Part` (`part_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PartInventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PartInventory` ;

CREATE TABLE IF NOT EXISTS `PartInventory` (
  `part_id` CHAR(10) NOT NULL,
  `pi_qty` INT NOT NULL,
  `pi_trigger_order` INT NOT NULL,
  PRIMARY KEY (`part_id`),
  CONSTRAINT `1`
    FOREIGN KEY (`part_id`)
    REFERENCES `Part` (`part_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
