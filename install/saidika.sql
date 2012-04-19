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
  `id` INT NOT NULL AUTO_INCREMENT,
  `emergency_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `provider_name` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider_emergency`;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider_emergency`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`service_provider_id` INT NOT NULL,
	`emergency_id` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY `spr_fk_service_provider_id`(`service_provider_id`) REFERENCES `service_provider`(`id`),
	FOREIGN KEY `spr_fk_emergency_id`(`emergency_id`) REFERENCES `emergency`(`id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `saidika`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`location`;

CREATE TABLE IF NOT EXISTS `saidika`.`location` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`location_name` VARCHAR(45) NULL ,
	`latitude` DOUBLE NOT NULL ,
	`longitude` DOUBLE NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider_location` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider_location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `service_provider_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY `spl_fk_service_provider_id`(`service_provider_id`) REFERENCES `service_provider`(`id`),
  FOREIGN KEY `spl_fk_location_id`(`location_id`) REFERENCES `location`(`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`service_provider_contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`service_provider_contact` ;

CREATE TABLE IF NOT EXISTS `saidika`.`service_provider_contact` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `service_provider_location_id` INT NOT NULL ,
  `contact_type_id` INT NOT NULL ,
  `contact_value` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`),
  FOREIGN KEY `spc_service_provider_loaction_id`(`service_provider_location_id`) REFERENCES `service_provider_location`(`id`),
  FOREIGN KEY `spc_contact_type_id`(`contact_type_id`) REFERENCES `contact_type`(`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`contact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`contact_type` ;

CREATE TABLE IF NOT EXISTS `saidika`.`contact_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contact_type_name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `contact_type_name_idx` (`contact_type_name`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saidika`.`emergency_request_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`emergency_request_log` ;

CREATE  TABLE IF NOT EXISTS `saidika`.`emergency_request_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `request_msisdn` VARCHAR(45) NOT NULL ,
  `request_content` VARCHAR(45) NULL ,
  `request_date` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `request_msisdn_idx` (`request_msisdn`
) ENGINE = InnoDB
COMMENT = 'Tracks the raw emergency requests and whether they\'ve been p' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `saidika`.`emergency_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`emergency_request` ;

CREATE TABLE IF NOT EXISTS `saidika`.`emergency_request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `request_msisdn` VARCHAR(45) NOT NULL ,
  `emergency_id` INT NOT NULL ,
  `emergency_location_name` VARCHAR(45) NOT NULL ,
  `emergency_request_date` TIMESTAMP NOT NULL ,
  `sms_notification_response` VARCHAR(160) NULL ,
  `sms_notification_sent` TINYINT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  FOREIGN KEY `er_fk_emergency_id` (`emergency_id`) REFERENCES `emergency` (`id`),
  INDEX `emergency_id_msisdn_idx` (`request_msisdn`, `emergency_id`)
) ENGINE = InnoDB, 
COMMENT = 'Breaks down an emergency request into the emergency category' /* comment truncated */ ;


-- -----------------------------------------------------
-- Table `saidika`.`delivery_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saidika`.`delivery_report` ;

CREATE TABLE IF NOT EXISTS `saidika`.`delivery_report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `emergency_request_id` INT NOT NULL ,
  `delivery_status` TINYINT(2) NOT NULL DEFAULT 0 ,
  `delivery_report_date` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`),
  FOREIGN KEY `dr_fk_emergency_request_id`(`emergency_request_id`) REFERENCES `emergency_request`(`id`)
) ENGINE = InnoDB, 
COMMENT = 'Tracks the status of the delivery report of the SMS that is ' /* comment truncated */ ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
