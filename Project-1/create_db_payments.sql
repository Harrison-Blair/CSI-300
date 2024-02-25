-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema payments
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `payments` ;

-- -----------------------------------------------------
-- Schema payments
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payments` DEFAULT CHARACTER SET utf8 ;
USE `payments` ;

-- -----------------------------------------------------
-- Table `PaymentMethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PaymentMethod` ;

CREATE TABLE IF NOT EXISTS `PaymentMethod` (
  `method_id` INT NOT NULL,
  `method_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`method_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerPaymentMethod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerPaymentMethod` ;

CREATE TABLE IF NOT EXISTS `CustomerPaymentMethod` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  PRIMARY KEY (`cid`, `method_id`),
  INDEX `1_idx` (`method_id` ASC) VISIBLE,
  CONSTRAINT `1`
    FOREIGN KEY (`method_id`)
    REFERENCES `PaymentMethod` (`method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustCard` ;

CREATE TABLE IF NOT EXISTS `CustCard` (
  `card_number` BIGINT(16) NOT NULL,
  `card_name` VARCHAR(45) NOT NULL,
  `card_ccv2` CHAR(4) NOT NULL,
  `card_zip` CHAR(5) NOT NULL,
  `card_month` CHAR(2) NOT NULL,
  `card_year` CHAR(4) NOT NULL,
  PRIMARY KEY (`card_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GiftCardAmt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GiftCardAmt` ;

CREATE TABLE IF NOT EXISTS `GiftCardAmt` (
  `gift_card_number` BIGINT(16) NOT NULL,
  `card_amt` INT NULL,
  PRIMARY KEY (`gift_card_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bank` ;

CREATE TABLE IF NOT EXISTS `Bank` (
  `routing_id` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`routing_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Checking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Checking` ;

CREATE TABLE IF NOT EXISTS `Checking` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `acc_id` BIGINT(16) NOT NULL,
  `routing_id` INT NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `acc_id`),
  INDEX `5_idx` (`cid` ASC, `method_id` ASC) VISIBLE,
  INDEX `8_idx` (`routing_id` ASC) VISIBLE,
  CONSTRAINT `5`
    FOREIGN KEY (`cid` , `method_id`)
    REFERENCES `CustomerPaymentMethod` (`cid` , `method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `8`
    FOREIGN KEY (`routing_id`)
    REFERENCES `Bank` (`routing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GiftCardHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GiftCardHistory` ;

CREATE TABLE IF NOT EXISTS `GiftCardHistory` (
  `date_used` DATETIME NOT NULL,
  `amount_used` INT NOT NULL,
  `gift_card_number` BIGINT(16) NOT NULL,
  PRIMARY KEY (`date_used`, `gift_card_number`),
  INDEX `2_idx` (`gift_card_number` ASC) VISIBLE,
  CONSTRAINT `2`
    FOREIGN KEY (`gift_card_number`)
    REFERENCES `GiftCardAmt` (`gift_card_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GiftCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GiftCard` ;

CREATE TABLE IF NOT EXISTS `GiftCard` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `gift_card_number` BIGINT(16) NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `gift_card_number`),
  INDEX `4_idx` (`gift_card_number` ASC) VISIBLE,
  CONSTRAINT `3`
    FOREIGN KEY (`cid` , `method_id`)
    REFERENCES `CustomerPaymentMethod` (`cid` , `method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `4`
    FOREIGN KEY (`gift_card_number`)
    REFERENCES `GiftCardAmt` (`gift_card_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CreditDebit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditDebit` ;

CREATE TABLE IF NOT EXISTS `CreditDebit` (
  `cid` INT NOT NULL,
  `method_id` INT NOT NULL,
  `card_number` BIGINT(16) NOT NULL,
  PRIMARY KEY (`cid`, `method_id`, `card_number`),
  INDEX `7_idx` (`cid` ASC, `method_id` ASC) VISIBLE,
  CONSTRAINT `6`
    FOREIGN KEY (`card_number`)
    REFERENCES `CustCard` (`card_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `7`
    FOREIGN KEY (`cid` , `method_id`)
    REFERENCES `CustomerPaymentMethod` (`cid` , `method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
