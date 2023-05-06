-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema builderdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `builderdb` ;

-- -----------------------------------------------------
-- Schema builderdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `builderdb` DEFAULT CHARACTER SET utf8 ;
USE `builderdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL,
  `username` VARCHAR(60) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(200) NOT NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `preferred_name` VARCHAR(100) NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC));


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `street1` VARCHAR(100) NULL,
  `street2` VARCHAR(100) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` VARCHAR(10) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `specialty` ;

CREATE TABLE IF NOT EXISTS `specialty` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(800) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `builder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `builder` ;

CREATE TABLE IF NOT EXISTS `builder` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `specialty_id` INT NOT NULL,
  `hourly_rate` DECIMAL NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_builder_user1_idx` (`user_id` ASC),
  INDEX `fk_builder_specialty1_idx` (`specialty_id` ASC),
  CONSTRAINT `fk_builder_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_builder_specialty1`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_customer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project` ;

CREATE TABLE IF NOT EXISTS `project` (
  `id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `builder_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `schedule_date` DATETIME NULL,
  `start_date` DATETIME NULL,
  `finish_date` DATETIME NULL,
  `payment_date` DATETIME NULL,
  `estimated_cost` DECIMAL NULL,
  `final_cost` DECIMAL NULL,
  `hours` INT NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_project_customer1_idx` (`customer_id` ASC),
  INDEX `fk_project_builder1_idx` (`builder_id` ASC),
  INDEX `fk_project_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_project_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_builder1`
    FOREIGN KEY (`builder_id`)
    REFERENCES `builder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_project_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventory` ;

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` INT NOT NULL,
  `builder_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_inventory_builder1_idx` (`builder_id` ASC),
  CONSTRAINT `fk_inventory_builder1`
    FOREIGN KEY (`builder_id`)
    REFERENCES `builder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consumable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consumable` ;

CREATE TABLE IF NOT EXISTS `consumable` (
  `id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `brand` VARCHAR(80) NULL,
  `name` VARCHAR(80) NULL,
  `description` VARCHAR(600) NULL,
  `count` INT NULL,
  `ref_image_url` VARCHAR(300) NULL,
  `minimium` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_consumable_inventory1_idx` (`inventory_id` ASC),
  CONSTRAINT `fk_consumable_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tool_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tool_condition` ;

CREATE TABLE IF NOT EXISTS `tool_condition` (
  `id` INT NOT NULL,
  `condition` VARCHAR(100) NULL,
  `description` VARCHAR(600) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tool` ;

CREATE TABLE IF NOT EXISTS `tool` (
  `id` INT NOT NULL,
  `brand` VARCHAR(80) NULL,
  `name` VARCHAR(200) NULL,
  `description` VARCHAR(800) NULL,
  `ref_image_url` VARCHAR(600) NULL,
  `inventory_id` INT NOT NULL,
  `tool_condition_id` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `building_material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `building_material` ;

CREATE TABLE IF NOT EXISTS `building_material` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(600) NULL,
  `img_url` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_material_used`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_material_used` ;

CREATE TABLE IF NOT EXISTS `project_material_used` (
  `project_id` INT NOT NULL,
  `building_material_id` INT NOT NULL,
  `count` INT NULL,
  `cost_per_unit` DECIMAL NULL,
  INDEX `fk_building_material_project1_idx` (`project_id` ASC),
  INDEX `fk_project_material_used_building_material1_idx` (`building_material_id` ASC),
  PRIMARY KEY (`project_id`, `building_material_id`),
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portfolio` ;

CREATE TABLE IF NOT EXISTS `portfolio` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  `builder_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_portfolio_builder1_idx` (`builder_id` ASC),
  CONSTRAINT `fk_portfolio_builder1`
    FOREIGN KEY (`builder_id`)
    REFERENCES `builder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `portfolio_item` ;

CREATE TABLE IF NOT EXISTS `portfolio_item` (
  `id` INT NOT NULL,
  `portfolio_id` INT NOT NULL,
  `img_url` VARCHAR(200) NULL,
  `title` VARCHAR(100) NULL,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_portfolio_item_portfolio1_idx` (`portfolio_id` ASC),
  CONSTRAINT `fk_portfolio_item_portfolio1`
    FOREIGN KEY (`portfolio_id`)
    REFERENCES `portfolio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `builder_has_customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `builder_has_customer` ;

CREATE TABLE IF NOT EXISTS `builder_has_customer` (
  `builder_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`builder_id`, `customer_id`),
  INDEX `fk_builder_has_customer_customer1_idx` (`customer_id` ASC),
  INDEX `fk_builder_has_customer_builder1_idx` (`builder_id` ASC),
  CONSTRAINT `fk_builder_has_customer_builder1`
    FOREIGN KEY (`builder_id`)
    REFERENCES `builder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_builder_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`id`)
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `active`, `role`) VALUES (1, 'admin', 'admin@admin.com', 'admin1', NULL, NULL, 'L', 'Zeeb', 'Zeeb', 1, 'ADMIN');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `active`, `role`) VALUES (2, 'xanimal37', 'hawkbit37@gmail.com', 'password1', NULL, NULL, 'Lisa', 'Zeeb', 'Zeeb', 1, 'USER');
INSERT INTO `user` (`id`, `username`, `email`, `password`, `create_date`, `update_date`, `first_name`, `last_name`, `preferred_name`, `active`, `role`) VALUES (3, 'slech', 'slech@gmail.com', 'hockey!', NULL, NULL, 'Sarah', 'Lechowich', 'Sarah', 1, 'USER');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zip_code`, `user_id`) VALUES (1, '3815 Hiawatha Ave', 'Unit 331', 'Minneapolis', 'MN', '55406', 2);
INSERT INTO `address` (`id`, `street1`, `street2`, `city`, `state`, `zip_code`, `user_id`) VALUES (2, '1234 Apple Street', NULL, 'Mendota Heights', 'MN', '55234', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `specialty`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (1, 'Carpentry', 'Framing');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (2, 'Fine Carpentry', 'Trim, Railing, Finishes');
INSERT INTO `specialty` (`id`, `name`, `description`) VALUES (3, 'Drywall', 'sheetrock, mudding, taping and finishing');

COMMIT;


-- -----------------------------------------------------
-- Data for table `builder`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `builder` (`id`, `user_id`, `specialty_id`, `hourly_rate`) VALUES (1, 2, 3, 30.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `customer` (`id`, `user_id`) VALUES (1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `project` (`id`, `customer_id`, `builder_id`, `address_id`, `schedule_date`, `start_date`, `finish_date`, `payment_date`, `estimated_cost`, `final_cost`, `hours`, `create_date`, `update_date`) VALUES (1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `inventory` (`id`, `builder_id`, `create_date`, `update_date`) VALUES (1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `consumable`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `consumable` (`id`, `inventory_id`, `brand`, `name`, `description`, `count`, `ref_image_url`, `minimium`) VALUES (1, 1, 'Fibafuse', 'Join Tape', '500 ft roll', 2, NULL, 2);
INSERT INTO `consumable` (`id`, `inventory_id`, `brand`, `name`, `description`, `count`, `ref_image_url`, `minimium`) VALUES (2, 1, 'Straitflex', 'shims', '45, 100 pack', 1, NULL, 2);
INSERT INTO `consumable` (`id`, `inventory_id`, `brand`, `name`, `description`, `count`, `ref_image_url`, `minimium`) VALUES (3, 1, 'Trim-tex', 'Bullnose', '2-way, 3/4\"', 10, NULL, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tool_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `tool_condition` (`id`, `condition`, `description`) VALUES (1, 'EXCELLENT', 'brand new; barely used; well-maintained');
INSERT INTO `tool_condition` (`id`, `condition`, `description`) VALUES (2, 'GOOD', 'in good, useable condition');
INSERT INTO `tool_condition` (`id`, `condition`, `description`) VALUES (3, 'OK', 'serviceable, getting worn');
INSERT INTO `tool_condition` (`id`, `condition`, `description`) VALUES (4, 'BAD', 'useable but should be replaced or fixed');
INSERT INTO `tool_condition` (`id`, `condition`, `description`) VALUES (5, 'BROKEN', 'unuseable: fix or replace');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tool`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `tool` (`id`, `brand`, `name`, `description`, `ref_image_url`, `inventory_id`, `tool_condition_id`) VALUES (1, NULL, 'mud pan', '24 inches, stainless steel', NULL, 1, 2);
INSERT INTO `tool` (`id`, `brand`, `name`, `description`, `ref_image_url`, `inventory_id`, `tool_condition_id`) VALUES (2, 'Columbia', 'Tomahawk smoothing blade', '14 inches', NULL, 1, 1);
INSERT INTO `tool` (`id`, `brand`, `name`, `description`, `ref_image_url`, `inventory_id`, `tool_condition_id`) VALUES (3, 'USG', 'mud mixer', '30 inches', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `building_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `building_material` (`id`, `name`, `description`, `img_url`) VALUES (1, 'Sheetrock', '1/2\" 8x4', NULL);
INSERT INTO `building_material` (`id`, `name`, `description`, `img_url`) VALUES (2, 'Sheetrock', '3/4\" 8x4', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_material_used`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `project_material_used` (`project_id`, `building_material_id`, `count`, `cost_per_unit`) VALUES (1, 1, 6, 23.44);

COMMIT;


-- -----------------------------------------------------
-- Data for table `portfolio`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `portfolio` (`id`, `name`, `description`, `create_date`, `update_date`, `builder_id`) VALUES (1, 'details', 'examples of complex sheetrock details', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `portfolio_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `portfolio_item` (`id`, `portfolio_id`, `img_url`, `title`, `description`) VALUES (1, 1, NULL, 'arch', 'sheetrock and mud arch detail');

COMMIT;


-- -----------------------------------------------------
-- Data for table `builder_has_customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `builderdb`;
INSERT INTO `builder_has_customer` (`builder_id`, `customer_id`) VALUES (1, 1);

COMMIT;

