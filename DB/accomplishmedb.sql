-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema accomplishmedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `accomplishmedb` ;

-- -----------------------------------------------------
-- Schema accomplishmedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `accomplishmedb` DEFAULT CHARACTER SET utf8 ;
USE `accomplishmedb` ;

-- -----------------------------------------------------
-- Table `visibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `visibility` ;

CREATE TABLE IF NOT EXISTS `visibility` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(250) NOT NULL,
  `height` DECIMAL(3,1) NULL COMMENT 'Height in inches',
  `weight` DECIMAL(5,2) NULL COMMENT 'Weight in lbs',
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `birthday` DATE NULL,
  `user_photo_url` VARCHAR(255) NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `visibility_id` INT NOT NULL DEFAULT 1,
  `role_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_viewability1_idx` (`visibility_id` ASC),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_viewability1`
    FOREIGN KEY (`visibility_id`)
    REFERENCES `visibility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge` ;

CREATE TABLE IF NOT EXISTS `challenge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `duration_in_days` INT NULL COMMENT 'Duration in days',
  `active` TINYINT NOT NULL DEFAULT 1,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_challenge_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_challenge_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `relation_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `relation_status` ;

CREATE TABLE IF NOT EXISTS `relation_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_relation` ;

CREATE TABLE IF NOT EXISTS `user_relation` (
  `sender_id` INT NOT NULL,
  `receiver_id` INT NOT NULL,
  `relation_status_id` INT NULL,
  PRIMARY KEY (`sender_id`, `receiver_id`),
  INDEX `fk_user_has_user_user1_idx` (`receiver_id` ASC),
  INDEX `fk_user_has_user_user_idx` (`sender_id` ASC),
  INDEX `fk_user_relation_relation_status1_idx` (`relation_status_id` ASC),
  CONSTRAINT `fk_user_has_user_user`
    FOREIGN KEY (`sender_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_relation_relation_status1`
    FOREIGN KEY (`relation_status_id`)
    REFERENCES `relation_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_challenge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_challenge` ;

CREATE TABLE IF NOT EXISTS `user_challenge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `challenge_id` INT NOT NULL,
  `details` TEXT NULL COMMENT 'User specific details',
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `complete` TINYINT NOT NULL DEFAULT 0,
  `in_progress` TINYINT NOT NULL DEFAULT 1,
  `active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_user_has_challenge_challenge1_idx` (`challenge_id` ASC),
  INDEX `fk_user_has_challenge_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_challenge_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_challenge_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `comment_date` DATE NULL,
  `user_id` INT NOT NULL,
  `visibility_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_visibility1_idx` (`visibility_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_visibility1`
    FOREIGN KEY (`visibility_id`)
    REFERENCES `visibility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge_log_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge_log_comment` ;

CREATE TABLE IF NOT EXISTS `challenge_log_comment` (
  `comment_id` INT NOT NULL,
  `challenge_log_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`, `challenge_log_id`),
  INDEX `fk_comment_has_challenge_log_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_comment_has_challenge_log_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge_detail` ;

CREATE TABLE IF NOT EXISTS `challenge_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `calories_per_serving` DECIMAL(6,2) NULL,
  `MET` DECIMAL(6,2) NULL,
  `number_of_pages` INT NULL,
  `description` TEXT NULL,
  `creator_id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_event_category2_idx` (`category_id` ASC),
  INDEX `fk_event_user1_idx` (`creator_id` ASC),
  CONSTRAINT `fk_event_category2`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge_log` ;

CREATE TABLE IF NOT EXISTS `challenge_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `entry_date` DATE NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `user_challenge_id` INT NOT NULL,
  `visibility_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_challenge_log_user_challenge1_idx` (`user_challenge_id` ASC),
  INDEX `fk_challenge_log_visibility1_idx` (`visibility_id` ASC),
  CONSTRAINT `fk_challenge_log_user_challenge1`
    FOREIGN KEY (`user_challenge_id`)
    REFERENCES `user_challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_challenge_log_visibility1`
    FOREIGN KEY (`visibility_id`)
    REFERENCES `visibility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge_log_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge_log_detail` ;

CREATE TABLE IF NOT EXISTS `challenge_log_detail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `challenge_detail_id` INT NOT NULL,
  `duration_in_minutes` INT NULL,
  `servings_eaten` VARCHAR(45) NULL,
  `pages_read` VARCHAR(45) NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `challenge_log_id` INT NOT NULL,
  INDEX `fk_challenge_detail_has_challenge_log_challenge_detail1_idx` (`challenge_detail_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_challenge_log_detail_challenge_log1_idx` (`challenge_log_id` ASC),
  CONSTRAINT `fk_challenge_detail_has_challenge_log_challenge_detail1`
    FOREIGN KEY (`challenge_detail_id`)
    REFERENCES `challenge_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_challenge_log_detail_challenge_log1`
    FOREIGN KEY (`challenge_log_id`)
    REFERENCES `challenge_log` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `challenge_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `challenge_category` ;

CREATE TABLE IF NOT EXISTS `challenge_category` (
  `category_id` INT NOT NULL,
  `challenge_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `challenge_id`),
  INDEX `fk_category_has_challenge_challenge1_idx` (`challenge_id` ASC),
  INDEX `fk_category_has_challenge_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_challenge_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_challenge_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS accomplishuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'accomplishuser'@'localhost' IDENTIFIED BY 'accomplishuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'accomplishuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `visibility`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `visibility` (`id`, `name`) VALUES (1, 'public');
INSERT INTO `visibility` (`id`, `name`) VALUES (2, 'private');
INSERT INTO `visibility` (`id`, `name`) VALUES (3, 'friend');

COMMIT;


-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `role` (`id`, `name`) VALUES (1, 'admin');
INSERT INTO `role` (`id`, `name`) VALUES (2, 'user');
INSERT INTO `role` (`id`, `name`) VALUES (3, 'moderator');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (1, 'admin', 'password', NULL, NULL, NULL, NULL, '2010-03-16', NULL, 1, 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (2, 'Mason', 'founder', 71, 206, 'Mason', 'Zuchinni', '1989-07-13', NULL, 1, 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (3, 'userman', 'userman', 65, 175, 'Guy', 'Manson', '1987-08-15', NULL, 1, 2, 2);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (4, 'Chris', 'founder', 73, 175, 'Chris', 'LightBright', '1988-04-14', NULL, 1, 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (5, 'Henry', 'founder', 69, 190, 'Henry', 'Melendor', '1989-11-16', NULL, 1, 2, 1);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (6, 'deleteduser', 'deleteduser', NULL, NULL, NULL, NULL, '2018-02-16', NULL, 0, 3, 3);
INSERT INTO `user` (`id`, `username`, `password`, `height`, `weight`, `first_name`, `last_name`, `birthday`, `user_photo_url`, `active`, `visibility_id`, `role_id`) VALUES (7, 'userdude', 'userdude', 77, 180, 'Dude', 'Manson', '1976-05-17', NULL, 1, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `challenge`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `challenge` (`id`, `name`, `description`, `duration_in_days`, `active`, `creator_id`) VALUES (1, '75 hard', '\"2 workouts per day, 1 gallon of water, etc..\"', 75, 1, 1);
INSERT INTO `challenge` (`id`, `name`, `description`, `duration_in_days`, `active`, `creator_id`) VALUES (2, 'NaNoWriMo', '\"Write 1000 words per day\"', 30, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `relation_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `relation_status` (`id`, `name`) VALUES (1, 'pending');
INSERT INTO `relation_status` (`id`, `name`) VALUES (2, 'friend');
INSERT INTO `relation_status` (`id`, `name`) VALUES (3, 'blocked');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_relation`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `user_relation` (`sender_id`, `receiver_id`, `relation_status_id`) VALUES (2, 3, 2);
INSERT INTO `user_relation` (`sender_id`, `receiver_id`, `relation_status_id`) VALUES (2, 4, NULL);
INSERT INTO `user_relation` (`sender_id`, `receiver_id`, `relation_status_id`) VALUES (4, 5, NULL);
INSERT INTO `user_relation` (`sender_id`, `receiver_id`, `relation_status_id`) VALUES (5, 6, NULL);
INSERT INTO `user_relation` (`sender_id`, `receiver_id`, `relation_status_id`) VALUES (3, 5, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_challenge`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `user_challenge` (`id`, `user_id`, `challenge_id`, `details`, `start_date`, `end_date`, `complete`, `in_progress`, `active`) VALUES (1, 2, 1, '\'no details\'', '2022-05-20', '2022-08-15', 0, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'workout', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'book', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'food', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `comment` (`id`, `content`, `comment_date`, `user_id`, `visibility_id`) VALUES (1, '\"a comment\"', NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `challenge_log_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `challenge_log_comment` (`comment_id`, `challenge_log_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `challenge_detail`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `challenge_detail` (`id`, `category_id`, `name`, `calories_per_serving`, `MET`, `number_of_pages`, `description`, `creator_id`, `active`) VALUES (1, 1, 'Swimming (freestyle)', 0, 5.8, 0, '\"Swimming is a low-impact, whole body cardio workout\"', 2, DEFAULT);
INSERT INTO `challenge_detail` (`id`, `category_id`, `name`, `calories_per_serving`, `MET`, `number_of_pages`, `description`, `creator_id`, `active`) VALUES (2, 2, 'Carrot', 30, 0, 0, NULL, 2, DEFAULT);
INSERT INTO `challenge_detail` (`id`, `category_id`, `name`, `calories_per_serving`, `MET`, `number_of_pages`, `description`, `creator_id`, `active`) VALUES (3, 3, '\'The Secret Life of Cats\'', NULL, NULL, 290, '\"A book about cats\"', 2, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `challenge_log`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `challenge_log` (`id`, `entry_date`, `active`, `user_challenge_id`, `visibility_id`) VALUES (1, '2022-05-20', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `challenge_log_detail`
-- -----------------------------------------------------
START TRANSACTION;
USE `accomplishmedb`;
INSERT INTO `challenge_log_detail` (`id`, `challenge_detail_id`, `duration_in_minutes`, `servings_eaten`, `pages_read`, `active`, `challenge_log_id`) VALUES (1, 1, 45, NULL, NULL, 1, 1);

COMMIT;

