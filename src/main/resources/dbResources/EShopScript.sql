-- MySQL Script generated by MySQL Workbench
-- Mon Jun 10 16:02:25 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eshop` ;

-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `eshop` ;

-- -----------------------------------------------------
-- Table `eshop`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`category` ;

CREATE TABLE IF NOT EXISTS `eshop`.`category` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eshop`.`manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`manufacturer` ;

CREATE TABLE IF NOT EXISTS `eshop`.`manufacturer` (
  `manufacturer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `manufacturerName` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`manufacturer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eshop`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`user` ;

CREATE TABLE IF NOT EXISTS `eshop`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(65) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `chosenProducts` VARCHAR(100) NULL DEFAULT NULL,
  `role` VARCHAR(45) NULL DEFAULT 'client',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eshop`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`order` ;

CREATE TABLE IF NOT EXISTS `eshop`.`order` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `products_id` VARCHAR(100) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `eshop`.`user` (`id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eshop`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`product` ;

CREATE TABLE IF NOT EXISTS `eshop`.`product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `amount` INT(11) NULL DEFAULT NULL,
  `description` VARCHAR(65) NULL DEFAULT NULL,
  `image` VARCHAR(40) NULL DEFAULT '/images/empty.png',
  `manufacturer_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `manufacturer_id`, `category_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_product_manufacturer1_idx` (`manufacturer_id` ASC) VISIBLE,
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `eshop`.`category` (`type_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_manufacturer1`
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `eshop`.`manufacturer` (`manufacturer_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `eshop`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `eshop`;
INSERT INTO `eshop`.`category` (`type_id`, `type`) VALUES (1, 'laptop');
INSERT INTO `eshop`.`category` (`type_id`, `type`) VALUES (2, 'desktop');
INSERT INTO `eshop`.`category` (`type_id`, `type`) VALUES (3, 'tablet');
INSERT INTO `eshop`.`category` (`type_id`, `type`) VALUES (4, 'accessorie');

COMMIT;


-- -----------------------------------------------------
-- Data for table `eshop`.`manufacturer`
-- -----------------------------------------------------
START TRANSACTION;
USE `eshop`;
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (1, 'Apple', 'USA');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (2, 'Dell', 'USA');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (3, 'Xiaomi', 'China');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (4, 'Samsung', 'Korea');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (5, 'Huawei', 'China');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (6, 'Acer', 'Taiwan');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (7, 'Lenovo', 'China');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (8, 'Asus', 'Taiwan');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (9, 'Msi', 'Taiwan');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (10, 'Sony', 'Japan');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (11, 'Hp', 'USA');
INSERT INTO `eshop`.`manufacturer` (`manufacturer_id`, `manufacturerName`, `country`) VALUES (12, 'Microsoft', 'USA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `eshop`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `eshop`;
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'XPS 15 9570', 2100, 10, '15.6\" 1920 x 1080 IPS', 'xps15-9570.png', 2, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'XPS 13 9360', 1600, 5, '13.3\" 1920 x 1080 IPS', 'xps13-9360.png', 2, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'G3', 800, 7, 'up to 9th Gen Intel® i7 processor', 'g3dell.png', 2, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Alienware 15', 2000, 5, 'Intel® 6-Core™ CPU', 'alienware15.png', 2, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Inspirion Chromebook 11', 200, 15, 'The 11.6\" LED backlit display', 'inspirion11.png', 2, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'XPS Tower', 600, 6, '1TB 7200RPM 3.5\" SATA HDD', 'xpstower.png', 2, 2);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Alienware Aurora', 900, 11, ' up to 18-core Intel® 9th Gen processor', 'aplienwareaurora.png', 2, 2);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Alienware  Area', 1900, 4, 'the latest NVIDIA® GeForce RTX™', 'alienwarearea.png', 2, 2);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Wireless Keyboard', 100, 17, 'and Mouse - KM717', 'dellkeyboard.png', 2, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Sculpt Comfort ', 70, 17, 'and wireless mouser 2.4 GHz', 'microsoftkeyboard.png', 12, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Galaxy Tab A', 100, 25, 'Bring the cinematic experience', 'galaxytaba.png', 4, 3);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Macbook Pro 13', 2000, 6, 'Intel Iris Plus Graphics 655', 'macbookpro13.png', 1, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Macbook Pro 15', 3000, 4, 'AMD Radeon Pro 560X, 4 GB GDDR5', 'macbookpro15.png', 1, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Macbook Air 11', 1600, 7, 'Intel HD Graphics 5000', 'macbookair11.png', 1, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Ipad Air 2', 250, 9, '9.7\" IPS (2048x1536)', 'ipadair2.png', 1, 3);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Ipad Pro 12,9', 2500, 9, 'Apple A12X Bionic', 'ipadpro.png', 1, 3);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Ipad mini 4', 500, 15, '7.9\" IPS (2048x1536)', 'ipadmini4.png', 1, 3);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Nightblade B85C', 1800, 3, '350W 80+ Bronze', 'nightblade.png', 9, 2);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'MSI GS75 Stealth', 3000, 4, 'Nvidia RTX 2080 8Gb', 'msigs375.ong', 9, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'MSI GF63', 1000, 6, 'Intel Core i7-8750H 2.20GHz', 'gf63.png', 9, 1);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Sony WH1000XM3', 300, 14, 'Built in microphone', 'sonywh1000.png', 10, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Sony MDR-RF912RK', 80, 12, 'Noise Reduction', 'sonymdr.png', 10, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'HP K1500', 15, 29, 'with indicator lights and built-in number pad', 'hpk1500.png', 11, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'HP X3000', 11, 30, 'No more pulling. No more tugging.', 'hpx3000.png', 11, 4);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Lenovo Tab 4', 80, 11, 'Quad-Core Processor', 'lenovotab4.png', 7, 3);
INSERT INTO `eshop`.`product` (`id`, `name`, `price`, `amount`, `description`, `image`, `manufacturer_id`, `category_id`) VALUES (DEFAULT, 'Huawei Ideos S7', 60, 3, '7.0\" TN+Film (800x480)', 'huaweiideos.png', 5, 3);

COMMIT;

