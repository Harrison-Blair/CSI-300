-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Vendors
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Vendors` ;

-- -----------------------------------------------------
-- Schema Vendors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vendors` DEFAULT CHARACTER SET utf8 ;
USE `Vendors` ;

-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` INT NOT NULL,
  `contact_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`contact_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salesperson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salesperson` ;

CREATE TABLE IF NOT EXISTS `salesperson` (
  `s_id` INT NOT NULL,
  `s_fn` VARCHAR(255) NOT NULL,
  `s_ln` VARCHAR(255) NOT NULL,
  `company_id` INT NOT NULL,
  PRIMARY KEY (`s_id`, `company_id`),
  INDEX `3_idx` (`company_id` ASC) VISIBLE,
  UNIQUE INDEX `s_id_UNIQUE` (`s_id` ASC) VISIBLE,
  CONSTRAINT `3`
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salespersoncontact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `salespersoncontact` ;

CREATE TABLE IF NOT EXISTS `salespersoncontact` (
  `s_id` INT NOT NULL,
  `contact_id` INT NOT NULL,
  `contact` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`s_id`, `contact_id`),
  INDEX `2_idx` (`contact_id` ASC) VISIBLE,
  CONSTRAINT `1`
    FOREIGN KEY (`s_id`)
    REFERENCES `salesperson` (`s_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `2`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`contact_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `company_id` INT NOT NULL,
  `c_street` VARCHAR(255) NOT NULL,
  `c_city` VARCHAR(255) NOT NULL,
  `c_st` CHAR(2) NOT NULL,
  `c_zip` CHAR(5) NOT NULL,
  PRIMARY KEY (`company_id`),
  CONSTRAINT ``
    FOREIGN KEY (`company_id`)
    REFERENCES `company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
