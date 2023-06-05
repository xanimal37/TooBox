-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema toolboxdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `toolboxdb` ;

-- -----------------------------------------------------
-- Schema toolboxdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `toolboxdb` DEFAULT CHARACTER SET utf8 ;
USE `toolboxdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(11) NOT NULL,
  `street1` VARCHAR(100) NULL DEFAULT NULL,
  `street2` VARCHAR(100) NULL DEFAULT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `state` VARCHAR(2) NULL DEFAULT NULL,
  `zip_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `building_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `building_material` ;

CREATE TABLE IF NOT EXISTS `building_material` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(600) NULL DEFAULT NULL,
  `img_url` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `specialty` ;

CREATE TABLE IF NOT EXISTS `specialty` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(800) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL,
  `username` VARCHAR(60) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(200) NOT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `first_name` VARCHAR(100) NULL DEFAULT NULL,
  `last_name` VARCHAR(100) NULL DEFAULT NULL,
  `preferred_name` VARCHAR(100) NULL DEFAULT NULL,
  `enabled` TINYINT(4) NOT NULL DEFAULT '1',
  `role` VARCHAR(45) NOT NULL DEFAULT 'USER',
  `hourly_rate` VARCHAR(45) NULL,
  `address_id` INT(11) NOT NULL,
  `specialty_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  INDEX `fk_user_specialty1_idx` (`specialty_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_specialty1`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT(11) NOT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_inventory_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `consumable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consumable` ;

CREATE TABLE IF NOT EXISTS `consumable` (
  `id` INT(11) NOT NULL,
  `inventory_id` INT(11) NOT NULL,
  `brand` VARCHAR(80) NULL DEFAULT NULL,
  `name` VARCHAR(80) NULL DEFAULT NULL,
  `description` VARCHAR(600) NULL DEFAULT NULL,
  `count` INT(11) NULL DEFAULT NULL,
  `ref_image_url` VARCHAR(300) NULL DEFAULT NULL,
  `minimium` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_consumable_inventory1_idx` (`inventory_id` ASC),
  CONSTRAINT `fk_consumable_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portfolio` ;

CREATE TABLE IF NOT EXISTS `portfolio` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_portfolio_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_portfolio_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `portfolio_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portfolio_item` ;

CREATE TABLE IF NOT EXISTS `portfolio_item` (
  `id` INT(11) NOT NULL,
  `portfolio_id` INT(11) NOT NULL,
  `img_url` VARCHAR(200) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_portfolio_item_portfolio1_idx` (`portfolio_id` ASC),
  CONSTRAINT `fk_portfolio_item_portfolio1`
    FOREIGN KEY (`portfolio_id`)
    REFERENCES `portfolio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project` ;

CREATE TABLE IF NOT EXISTS `project` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(100) NULL,
  `schedule_date` DATETIME NULL DEFAULT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `finish_date` DATETIME NULL DEFAULT NULL,
  `payment_date` DATETIME NULL DEFAULT NULL,
  `estimated_cost` DECIMAL(10,0) NULL DEFAULT NULL,
  `final_cost` DECIMAL(10,0) NULL DEFAULT NULL,
  `hours` INT(11) NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `update_date` DATETIME NULL DEFAULT NULL,
  `address_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_project_address1_idx` (`address_id` ASC),
  INDEX `fk_project_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_project_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_material` ;

CREATE TABLE IF NOT EXISTS `project_material` (
  `project_id` INT(11) NOT NULL,
  `building_material_id` INT(11) NOT NULL,
  `count` INT(11) NULL DEFAULT NULL,
  `cost_per_unit` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`, `building_material_id`),
  INDEX `fk_building_material_project1_idx` (`project_id` ASC),
  INDEX `fk_project_material_used_building_material1_idx` (`building_material_id` ASC),
  CONSTRAINT `fk_building_material_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_material_used_building_material1`
    FOREIGN KEY (`building_material_id`)
    REFERENCES `building_material` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tool_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tool_condition` ;

CREATE TABLE IF NOT EXISTS `tool_condition` (
  `id` INT(11) NOT NULL,
  `condition` VARCHAR(100) NULL DEFAULT NULL,
  `description` VARCHAR(600) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tool` ;

CREATE TABLE IF NOT EXISTS `tool` (
  `id` INT(11) NOT NULL,
  `brand` VARCHAR(80) NULL DEFAULT NULL,
  `name` VARCHAR(200) NULL DEFAULT NULL,
  `description` VARCHAR(800) NULL DEFAULT NULL,
  `ref_image_url` VARCHAR(600) NULL DEFAULT NULL,
  `inventory_id` INT(11) NOT NULL,
  `tool_condition_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tool_inventory1_idx` (`inventory_id` ASC),
  INDEX `fk_tool_tool_condition1_idx` (`tool_condition_id` ASC),
  CONSTRAINT `fk_tool_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tool_tool_condition1`
    FOREIGN KEY (`tool_condition_id`)
    REFERENCES `tool_condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `workday`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workday` ;

CREATE TABLE IF NOT EXISTS `workday` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_time` DATETIME NULL,
  `finish_time` DATETIME NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  `hours` DECIMAL NULL,
  `project_id` INT(11) NOT NULL,
  `note` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workday_project1_idx` (`project_id` ASC),
  CONSTRAINT `fk_workday_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS builder1@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'builder1'@'localhost' IDENTIFIED BY 'builder1';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'builder1'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zip_code`) VALUES (1, '3815 Hiawatha Ave', 'Unit 331', 'Minneapolis', 'MN', '55406');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zip_code`) VALUES (2, '7832 Apple St.', NULL, 'Mendota Heights', 'MN', '55555');
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zip_code`) VALUES (3, '8383 Project Ave', NULL, 'Project', 'MN', '55050');

COMMIT;


-- -----------------------------------------------------
-- Data for table `specialty`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (1, 'Carpentry', 'woodworking; framing');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (2, 'Electrical', 'wiring, outlets, lighting');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (3, 'Plumbing', 'toilets, drains, repair');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (4, 'Drywall', 'hanging and/or finishing');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (5, 'Roofing', 'roofing');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `enabled`, `role`, `hourly_rate`, `address_id`, `specialty_id`) VALUES (1, 'admin', 'admin@mytoolbox.com', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', NULL, NULL, 'L', 'Zeeb', 'Z', 1, 'ADMIN', '25.00', 1, 4);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `enabled`, `role`, `hourly_rate`, `address_id`, `specialty_id`) VALUES (2, 'xanimal37', 'xanimal@gmail.moc', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', NULL, NULL, 'Lisa', 'Zeeb', 'Z', 1, 'USER', '25.00', 1, 4);
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `enabled`, `role`, `hourly_rate`, `address_id`, `specialty_id`) VALUES (3, 'lech05', 'lech05@gmail.moc', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', NULL, NULL, 'Sarah', 'Lechowich', NULL, 1, 'USER', '42.00', 2, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `portfolio`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `portfolio` (`id`, `name`, `description`, `create_date`, `update_date`, `user_id`) VALUES (1, 'drywall project 1', 'basement room, unusual house', NULL, NULL, 2);
INSERT INTO `portfolio` (`id`, `name`, `description`, `create_date`, `update_date`, `user_id`) VALUES (2, 'best roof ever', 'huge complicated roof', NULL, NULL, 3);
INSERT INTO `portfolio` (`id`, `name`, `description`, `create_date`, `update_date`, `user_id`) VALUES (3, 'small floor tile project', 'small floor at stair landing', NULL, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `project` (`id`, `project_name`, `schedule_date`, `start_date`, `finish_date`, `payment_date`, `estimated_cost`, `final_cost`, `hours`, `create_date`, `update_date`, `address_id`, `user_id`) VALUES (1, 'A small person', NULL, NULL, NULL, NULL, 1300.00, 1230.00, 10, NULL, NULL, 3, 2);
INSERT INTO `project` (`id`, `project_name`, `schedule_date`, `start_date`, `finish_date`, `payment_date`, `estimated_cost`, `final_cost`, `hours`, `create_date`, `update_date`, `address_id`, `user_id`) VALUES (2, 'huge roof johnson', NULL, NULL, NULL, NULL, 14000.00, 14000.00, 8, NULL, NULL, 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `workday`
-- -----------------------------------------------------
START TRANSACTION;
USE `toolboxdb`;
INSERT INTO `workday` (`id`, `start_time`, `finish_time`, `create_date`, `update_date`, `hours`, `project_id`, `note`) VALUES (1, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `workday` (`id`, `start_time`, `finish_time`, `create_date`, `update_date`, `hours`, `project_id`, `note`) VALUES (2, NULL, NULL, NULL, NULL, NULL, 2, 'ran out of paint');
INSERT INTO `workday` (`id`, `start_time`, `finish_time`, `create_date`, `update_date`, `hours`, `project_id`, `note`) VALUES (3, NULL, NULL, NULL, NULL, NULL, 2, NULL);

COMMIT;

