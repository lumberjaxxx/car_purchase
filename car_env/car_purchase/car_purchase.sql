-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_purchase` DEFAULT CHARACTER SET utf8 ;
USE `car_purchase` ;

-- -----------------------------------------------------
-- Table `mydb`.`Item_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`Item_status` (
  `item_code` INT NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `item_quantity_available` INT NOT NULL,
  `other_item_details` VARCHAR(255) NULL,
  PRIMARY KEY (`item_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff_Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`Staff_Member` (
  `staff_code` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `other_details` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`Client` (
  `client_id` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `other_details` VARCHAR(45) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`Purchase` (
  `purchase_id` INT NOT NULL,
  `date_of_purchase` DATETIME NOT NULL,
  `purchase_quatity` INT NOT NULL,
  `Staff_Member_staff_code` INT NOT NULL,
  `Client_client_id` INT NOT NULL,
  `Item_status_item_code` INT NOT NULL,
  `other_details` VARCHAR(45) NULL,
  PRIMARY KEY (`purchase_id`),
  INDEX `fk_Purchase_Staff_Member_idx` (`Staff_Member_staff_code` ASC) VISIBLE,
  INDEX `fk_Purchase_Client1_idx` (`Client_client_id` ASC) VISIBLE,
  INDEX `fk_Purchase_Item_status1_idx` (`Item_status_item_code` ASC) VISIBLE,
  CONSTRAINT `fk_Purchase_Staff_Member`
    FOREIGN KEY (`Staff_Member_staff_code`)
    REFERENCES `car_purchase`.`Staff_Member` (`staff_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_Client1`
    FOREIGN KEY (`Client_client_id`)
    REFERENCES `car_purchase`.`Client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_Item_status1`
    FOREIGN KEY (`Item_status_item_code`)
    REFERENCES `car_purchase`.`Item_status` (`item_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
