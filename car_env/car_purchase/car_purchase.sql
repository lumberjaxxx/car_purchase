-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_purchase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_purchase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_purchase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_purchase` ;

-- -----------------------------------------------------
-- Table `car_purchase`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `other_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_purchase`.`item_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`item_status` (
  `item_code` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NOT NULL,
  `item_quantity_available` INT NOT NULL,
  `other_item_details` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`item_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_purchase`.`staff_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`staff_member` (
  `staff_code` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `other_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_purchase`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_purchase`.`purchase` (
  `purchase_id` INT NOT NULL,
  `date_of_purchase` DATETIME NOT NULL,
  `purchase_quatity` INT NOT NULL,
  `Staff_Member_staff_code` INT NOT NULL,
  `Client_client_id` INT NOT NULL,
  `Item_status_item_code` INT NOT NULL,
  `other_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  INDEX `fk_Purchase_Staff_Member_idx` (`Staff_Member_staff_code` ASC) VISIBLE,
  INDEX `fk_Purchase_Client1_idx` (`Client_client_id` ASC) VISIBLE,
  INDEX `fk_Purchase_Item_status1_idx` (`Item_status_item_code` ASC) VISIBLE,
  CONSTRAINT `fk_Purchase_Client1`
    FOREIGN KEY (`Client_client_id`)
    REFERENCES `car_purchase`.`client` (`client_id`),
  CONSTRAINT `fk_Purchase_Item_status1`
    FOREIGN KEY (`Item_status_item_code`)
    REFERENCES `car_purchase`.`item_status` (`item_code`),
  CONSTRAINT `fk_Purchase_Staff_Member`
    FOREIGN KEY (`Staff_Member_staff_code`)
    REFERENCES `car_purchase`.`staff_member` (`staff_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
