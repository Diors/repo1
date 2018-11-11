-- MySQL Script generated by MySQL Workbench
-- Tue Oct 30 04:14:52 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema xone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `xone` ;

-- -----------------------------------------------------
-- Schema xone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `xone` DEFAULT CHARACTER SET utf8 ;
USE `xone` ;

-- -----------------------------------------------------
-- Table `xone`.`sys_org`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_org` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_org` (
  `org_id` INT NOT NULL,
  `org_name` VARCHAR(45) NULL,
  `org_desc` VARCHAR(45) NULL,
  `parent_id` INT NULL,
  PRIMARY KEY (`org_id`),
  INDEX `fk_org_org1_idx` (`parent_id` ASC),
  CONSTRAINT `fk_org_org1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `xone`.`sys_org` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_user` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_code` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NULL DEFAULT now(),
  `status` CHAR(1) NULL,
  `last_login` DATETIME NULL,
  `org_id` INT NULL,
  `is_locked` CHAR(1) NULL DEFAULT 'N',
  `err_times` INT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  INDEX `fk_sys_user_org1_idx` (`org_id` ASC),
  UNIQUE INDEX `user_code_UNIQUE` (`user_code` ASC),
  UNIQUE INDEX `status_UNIQUE` (`status` ASC),
  CONSTRAINT `fk_sys_user_org1`
    FOREIGN KEY (`org_id`)
    REFERENCES `xone`.`sys_org` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`task_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`task_type` ;

CREATE TABLE IF NOT EXISTS `xone`.`task_type` (
  `task_type_id` INT NOT NULL,
  `task_type_name` VARCHAR(45) NULL,
  `task_type_desc` VARCHAR(512) NULL,
  PRIMARY KEY (`task_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`project` ;

CREATE TABLE IF NOT EXISTS `xone`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `project_code` VARCHAR(45) NULL,
  `project_name` VARCHAR(45) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`task` ;

CREATE TABLE IF NOT EXISTS `xone`.`task` (
  `task_id` INT NOT NULL,
  `task_type_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  `task_title` VARCHAR(45) NULL,
  `task_content` VARCHAR(1024) NULL,
  `create_user_id` INT NULL,
  `task_owner` INT NULL,
  `status` CHAR(1) NULL,
  `create_date` DATETIME NULL,
  `modify_date` DATETIME NULL,
  `planned_date` DATETIME NULL,
  `close_date` DATETIME NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_task_task_type_idx` (`task_type_id` ASC),
  INDEX `fk_task_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_task_task_type`
    FOREIGN KEY (`task_type_id`)
    REFERENCES `xone`.`task_type` (`task_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `xone`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_station` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_station` (
  `station_id` INT NOT NULL AUTO_INCREMENT,
  `station_name` VARCHAR(45) NOT NULL,
  `station_desc` VARCHAR(512) NULL,
  PRIMARY KEY (`station_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_job` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_job` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `job_name` VARCHAR(45) NULL,
  `job_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_job_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_job_station` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_job_station` (
  `station_id` INT NOT NULL,
  `job_id` INT NOT NULL,
  INDEX `fk_job_station_station1_idx` (`station_id` ASC),
  INDEX `fk_job_station_job1_idx` (`job_id` ASC),
  CONSTRAINT `fk_job_station_station1`
    FOREIGN KEY (`station_id`)
    REFERENCES `xone`.`sys_station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_station_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `xone`.`sys_job` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_menu` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_menu` (
  `menu_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NULL,
  `parent_menu_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `fk_menu_menu1_idx` (`parent_menu_id` ASC),
  CONSTRAINT `fk_menu_menu1`
    FOREIGN KEY (`parent_menu_id`)
    REFERENCES `xone`.`sys_menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_menu_item` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_menu_item` (
  `menu_item_id` INT NOT NULL,
  `menu_item_name` VARCHAR(45) NULL,
  `menu_item_url` VARCHAR(128) NULL,
  `menu_item_priv` CHAR(1) NULL COMMENT 'R-readonly\nE-editable',
  PRIMARY KEY (`menu_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_job_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_job_menu` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_job_menu` (
  `job_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  INDEX `fk_job_menu_job1_idx` (`job_id` ASC),
  INDEX `fk_job_menu_menu1_idx` (`menu_id` ASC),
  CONSTRAINT `fk_job_menu_job1`
    FOREIGN KEY (`job_id`)
    REFERENCES `xone`.`sys_job` (`job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_menu_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `xone`.`sys_menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_menu_menu_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_menu_menu_item` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_menu_menu_item` (
  `menu_id` INT NOT NULL,
  `menu_item_id` INT NOT NULL,
  INDEX `fk_menu_menu_item_menu1_idx` (`menu_id` ASC),
  INDEX `fk_menu_menu_item_menu_item1_idx` (`menu_item_id` ASC),
  CONSTRAINT `fk_menu_menu_item_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `xone`.`sys_menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_menu_item_menu_item1`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `xone`.`sys_menu_item` (`menu_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xone`.`sys_user_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `xone`.`sys_user_station` ;

CREATE TABLE IF NOT EXISTS `xone`.`sys_user_station` (
  `user_id` INT NOT NULL,
  `station_id` INT NOT NULL,
  INDEX `fk_user_station_sys_user1_idx` (`user_id` ASC),
  INDEX `fk_user_station_station1_idx` (`station_id` ASC),
  CONSTRAINT `fk_user_station_sys_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `xone`.`sys_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_station_station1`
    FOREIGN KEY (`station_id`)
    REFERENCES `xone`.`sys_station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO xone;
 DROP USER xone;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'xone' IDENTIFIED BY 'Xone_001';

GRANT ALL ON `xone`.* TO 'xone';
GRANT SELECT ON TABLE `xone`.* TO 'xone';
GRANT SELECT, INSERT, TRIGGER ON TABLE `xone`.* TO 'xone';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `xone`.* TO 'xone';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
