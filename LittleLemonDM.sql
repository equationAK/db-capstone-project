-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(100) NOT NULL,
  `fullName` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `staffID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(100) NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `role` VARCHAR(60) NOT NULL,
  `salary` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `LittleLemonDB`.`customers` (`customerID`),
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`staffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`staffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(100) NULL DEFAULT NULL,
  `StarterName` VARCHAR(100) NULL DEFAULT NULL,
  `DesertName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menuID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(60) NOT NULL,
  `MenuName` VARCHAR(60) NOT NULL,
  `MemuItemsID` INT NOT NULL,
  PRIMARY KEY (`menuID`),
  INDEX `menuItems_id_fk_idx` (`MemuItemsID` ASC) VISIBLE,
  CONSTRAINT `menuItems_id_fk`
    FOREIGN KEY (`MemuItemsID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL(10,0) NOT NULL,
  `bookingID` INT NOT NULL,
  `menuID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `booking_id_fk_idx` (`bookingID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`menuID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`bookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`bookingID`),
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`menuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
