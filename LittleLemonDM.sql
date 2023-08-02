-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(100) NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `staffID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(100) NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `role` VARCHAR(60) NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `tableNr` INT NOT NULL,
  `customerID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `customer_id_fk_idx` (`customerID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`customers` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menuID` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `category` VARCHAR(45) NULL,
  `subcategory` VARCHAR(45) NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL NOT NULL,
  `bookingID` INT NOT NULL,
  `menuID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `booking_id_fk_idx` (`bookingID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`menuID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
