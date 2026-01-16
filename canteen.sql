/*
SQLyog Enterprise - MySQL GUI v8.02 RC
MySQL - 5.5.5-10.4.32-MariaDB : Database - canteen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`canteen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `canteen`;

/*Table structure for table `admin_data` */

DROP TABLE IF EXISTS `admin_data`;

CREATE TABLE `admin_data` (
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `admin_data` */

insert  into `admin_data`(`name`,`address`,`contact`,`email`) values ('Hitakshi Choudhary','Kunhari','7896525627','hitakshi1@gmail.com');

/*Table structure for table `cart_items` */

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_item` (`user_email`,`item_id`),
  KEY `fk_cart_item_food` (`item_id`),
  CONSTRAINT `fk_cart_item_food` FOREIGN KEY (`item_id`) REFERENCES `food_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cart_items` */

insert  into `cart_items`(`id`,`user_email`,`item_id`,`quantity`,`added_at`) values (879,'itisha@gmail.com',5,1,'2025-12-08 11:32:51'),(880,'itisha@gmail.com',3,1,'2025-12-08 11:32:51'),(881,'ronitpareta@gamil.com',5,2,'2025-12-08 11:53:19'),(886,'kunal@gmail.com',3,1,'2025-12-08 12:13:54'),(887,'kunal@gmail.com',5,1,'2025-12-08 12:14:01'),(888,'kunal@gmail.com',9,1,'2025-12-08 12:14:02'),(889,'kunal@gmail.com',10,1,'2025-12-08 12:14:03'),(890,'kunal@gmail.com',11,1,'2025-12-08 12:14:05');

/*Table structure for table `food_category` */

DROP TABLE IF EXISTS `food_category`;

CREATE TABLE `food_category` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `availability` enum('in_stock','out_of_stock') NOT NULL DEFAULT 'in_stock',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `food_category` */

insert  into `food_category`(`id`,`name`,`price`,`type`,`photo`,`availability`) values (3,'Rajasthani Thali',250,'Dinner','1764046578.jpg','in_stock'),(4,'Marathi Thali',250,'Lunch','1765167024.jpeg','out_of_stock'),(5,'Shahi Panner',150,'Curry','1763966867.jpg','in_stock'),(9,'Fried Rice',150,'Fast Food','1764655766.jpeg','in_stock'),(10,'Kabaab ',250,'Fast Food','1764655696.jpg','in_stock'),(11,'Hakka Noodles',100,'Fast Food','1764655714.jpg','in_stock'),(12,'Chocolate Shake',150,'Soft Drink','1764655735.jpg','in_stock'),(13,'Honey Chilly Potato',100,'Fast Food','1764655752.jpg','in_stock'),(14,'Raj Kachori',450,'Lunch',NULL,'in_stock');

/*Table structure for table `login_data` */

DROP TABLE IF EXISTS `login_data`;

CREATE TABLE `login_data` (
  `email` varchar(100) NOT NULL,
  `password` int(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `login_data` */

insert  into `login_data`(`email`,`password`,`usertype`) values ('hitakshi1@gmail.com',96,'admin'),('itisha@gmail.com',45,'user'),('kunal@gmail.com',11,'user'),('ronitpareta@gamil.com',45,'user');

/*Table structure for table `order_data` */

DROP TABLE IF EXISTS `order_data`;

CREATE TABLE `order_data` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(110) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `st_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT 'pending',
  `order_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order_data` */

insert  into `order_data`(`order_id`,`food_name`,`quantity`,`total_price`,`type`,`st_id`,`status`,`order_datetime`) values (1,'Chocolate Shake',1,150,'Soft Drink',1,'rejected','2025-12-08 10:14:08'),(2,'Fried Rice',1,120,'Fast Food',1,'accepted','2025-12-08 10:14:08'),(3,'Hakka Noodles',1,100,'Fast Food',1,'pending','2025-12-08 10:14:08'),(4,'Honey Chilly Potato',1,100,'Fast Food',1,'pending','2025-12-08 10:14:08'),(5,'Kabaab ',1,250,'Fast Food',1,'pending','2025-12-08 10:14:08'),(6,'Marathi Thali',2,500,'Lunch',1,'pending','2025-12-08 10:14:08'),(7,'Rajasthani Thali',1,200,'Dinner',1,'pending','2025-12-08 10:14:08'),(8,'Fried Rice',1,120,'Fast Food',6,'pending','2025-12-08 10:14:08'),(9,'Honey Chilly Potato',1,100,'Fast Food',6,'accepted','2025-12-08 10:14:08'),(10,'Marathi Thali',1,250,'Lunch',6,'pending','2025-12-08 10:14:08'),(11,'Rajasthani Thali',1,200,'Dinner',6,'pending','2025-12-08 10:14:08'),(12,'Shahi Panner',2,300,'Curry',6,'pending','2025-12-08 10:14:08'),(13,'Marathi Thali',1,250,'Lunch',6,'accepted','2025-12-08 10:14:08'),(14,'Shahi Panner',1,150,'Curry',6,'pending','2025-12-08 10:14:08'),(15,'Fried Rice',2,240,'Fast Food',0,'accepted','2025-12-08 10:14:08'),(16,'Marathi Thali',1,250,'Lunch',0,'accepted','2025-12-08 10:14:08'),(17,'Shahi Panner',1,150,'Curry',0,'accepted','2025-12-08 10:14:08'),(18,'Fried Rice',1,120,'Fast Food',0,'pending','2025-12-08 10:14:08'),(19,'Marathi Thali',3,750,'Lunch',0,'pending','2025-12-08 10:14:08'),(20,'Shahi Panner',2,300,'Curry',0,'pending','2025-12-08 10:14:08'),(21,'Chocolate Shake',3,450,'Soft Drink',0,'pending','2025-12-08 10:14:08'),(22,'Fried Rice',2,300,'Fast Food',0,'pending','2025-12-08 10:14:08'),(23,'Hakka Noodles',1,100,'Fast Food',0,'pending','2025-12-08 10:14:08'),(24,'Honey Chilly Potato',1,100,'Fast Food',0,'pending','2025-12-08 10:14:08'),(25,'Shahi Panner',3,450,'Curry',0,'pending','2025-12-08 10:14:08'),(26,'Shahi Panner',4,600,'Curry',8,'pending','2025-12-08 10:14:08'),(27,'Fried Rice',1,150,'Fast Food',0,'pending','2025-12-08 10:15:09'),(28,'Kabaab ',1,250,'Fast Food',0,'pending','2025-12-08 10:15:09'),(29,'Shahi Panner',1,150,'Curry',0,'pending','2025-12-08 10:15:09'),(30,'Kabaab ',2,500,'Fast Food',1,'pending','2025-12-08 11:09:40'),(31,'Shahi Panner',3,450,'Curry',1,'pending','2025-12-08 11:09:40');

/*Table structure for table `photo_data` */

DROP TABLE IF EXISTS `photo_data`;

CREATE TABLE `photo_data` (
  `email` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `photo_data` */

insert  into `photo_data`(`email`,`photo`) values ('hitakshi1@gmail.com','1765170914.jpeg'),('itisha@gmail.com','1765000292.jpeg'),('ronitpareta@gamil.com','1765004829.jpg');

/*Table structure for table `transactions_history` */

DROP TABLE IF EXISTS `transactions_history`;

CREATE TABLE `transactions_history` (
  `pt_id` int(255) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `st_id` int(255) NOT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transactions_history` */

insert  into `transactions_history`(`pt_id`,`date`,`email`,`amount`,`st_id`) values (1,'2025-12-06','pranav@gmail.com',1000,0),(2,'2025-12-06','pranav@gmail.com',2000,0),(3,'2025-12-07','itisha@gmail.com',5000,1),(4,'2025-12-07','itisha@gmail.com',5000,1),(5,'2025-12-07','itisha@gmail.com',2000,1),(6,'2025-12-08','pranav@gmail.com',5000,0),(7,'2025-12-08','itisha@gmail.com',200,1),(8,'2025-12-08','kunal@gmail.com',1000,8);

/*Table structure for table `user_data` */

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE `user_data` (
  `st_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`st_id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user_data` */

insert  into `user_data`(`st_id`,`name`,`gender`,`address`,`contact`,`email`,`balance`) values (1,'Itisha Nagar','Female','Borkheda','8954562023','itisha@gmail.com',12080),(7,'Ronit','Male','dadabari','7340680499','ronitpareta@gamil.com',0),(8,'Kunal','Male','mahaveer nagar','8564902345','kunal@gmail.com',1000);

/* Trigger structure for table `order_data` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_order_accept_deduct_balance` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_order_accept_deduct_balance` AFTER UPDATE ON `order_data` FOR EACH ROW BEGIN
    -- Sirf jab status 'pending' se 'accepted' ban raha ho
    IF OLD.status = 'pending' AND NEW.status = 'accepted' THEN
        UPDATE user_data
        SET balance = balance - NEW.total_price
        WHERE st_id = NEW.st_id;
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `transactions_history` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_balance` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_balance` AFTER INSERT ON `transactions_history` FOR EACH ROW BEGIN
	update user_data
	set balance = balance + NEW.amount
	where st_id = NEW.st_id;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
