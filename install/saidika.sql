SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `saidika` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `saidika` ;

-- -----------------------------------------------------
-- Table `saidika`.`emergency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`emergency` ;

CREATE TABLE IF NOT EXISTS `saidika`.`emergency` (
  `id` INT NOT NULL COMMENT 'Tracks the nature of emergencies .e.g Accident, Fire, Leakage, Robbery\netc' ,
  `emergency_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider` (
  `id` INT NOT NULL ,
  `provider_name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider_contact` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider_contact` (
  `id` INT NOT NULL ,
  `service_provider_location_id` INT NOT NULL ,
  `contact_type_id` INT NOT NULL ,
  `contact_value` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider_location` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider_location` (
  `id` INT NOT NULL ,
  `service_provider_id` INT NOT NULL ,
  `location_name` VARCHAR(45) NULL ,
  `latitude` DOUBLE NOT NULL ,
  `longitude` DOUBLE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`contact_type` ;

CREATE TABLE IF NOT EXISTS `saidika`.`contact_type` (
  `id` INT NOT NULL ,
  `contact_type_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `contact_type_name_idx` (`contact_type_name`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`emergency_request_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`emergency_request_log` ;

CREATE  TABLE IF NOT EXISTS `saidika`.`emergency_request_log` (
  `id` INT NOT NULL ,
  `request_msisdn` VARCHAR(45) NOT NULL ,
  `request_content` VARCHAR(45) NULL ,
  `request_date` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `request_msisdn_idx` (`request_msisdn`) )
ENGINE = InnoDB
COMMENT = 'Tracks the raw emergency requests and whether they\'ve been p' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `saidika`.`emergency_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`emergency_request` ;

CREATE TABLE IF NOT EXISTS `saidika`.`emergency_request` (
  `id` INT NOT NULL ,
  `request_msisdn` VARCHAR(45) NOT NULL ,
  `emergency_id` INT NOT NULL ,
  `emergency_location_name` VARCHAR(45) NOT NULL ,
  `emergency_request_date` TIMESTAMP NOT NULL ,
  `sms_notification_response` VARCHAR(160) NULL ,
  `sms_notification_sent` TINYINT NULL DEFAULT 0 ,
  `emergency_requestcol` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `emergency_id_msisdn_idx` (`request_msisdn`, `emergency_id`) )
ENGINE = InnoDB, 
COMMENT = 'Breaks down an emergency request into the emergency category' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `saidika`.`delivery_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`delivery_report` ;

CREATE TABLE IF NOT EXISTS `saidika`.`delivery_report` (
  `id` INT NOT NULL ,
  `emergency_request_id` INT NOT NULL ,
  `delivery_status` TINYINT(2) NOT NULL DEFAULT 0 ,
  `delivery_report_date` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB, 
COMMENT = 'Tracks the status of the delivery report of the SMS that is ' /* comment truncated */ ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
