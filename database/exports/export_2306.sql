-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: forge
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB-1:10.3.13+maria~xenial-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_ingredients`
--

DROP TABLE IF EXISTS `additional_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_ingredients` (
  `customer_meal_id` int(10) unsigned NOT NULL,
  `ingredient_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_meal_id`,`ingredient_id`),
  KEY `additional_ingredients_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `additional_ingredients_customer_meal_id_foreign` FOREIGN KEY (`customer_meal_id`) REFERENCES `customer_meals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `additional_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_ingredients`
--

LOCK TABLES `additional_ingredients` WRITE;
/*!40000 ALTER TABLE `additional_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_disliked_ingredients`
--

DROP TABLE IF EXISTS `customer_disliked_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_disliked_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_disliked_ingredients_ingredient_id_foreign` (`ingredient_id`),
  KEY `customer_disliked_ingredients_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_disliked_ingredients_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customer_disliked_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_disliked_ingredients`
--

LOCK TABLES `customer_disliked_ingredients` WRITE;
/*!40000 ALTER TABLE `customer_disliked_ingredients` DISABLE KEYS */;
INSERT INTO `customer_disliked_ingredients` VALUES (1,71,29,'2019-04-08 08:21:19','2019-04-08 08:21:19'),(2,2,29,'2019-04-08 08:22:14','2019-04-08 08:22:14'),(3,31,29,'2019-04-08 08:22:14','2019-04-08 08:22:14'),(4,31,25,'2019-04-08 08:23:36','2019-04-08 08:23:36'),(5,124,25,'2019-04-08 08:23:36','2019-04-08 08:23:36'),(6,40,30,'2019-04-08 08:48:11','2019-04-08 08:48:11'),(7,53,30,'2019-04-08 08:48:11','2019-04-08 08:48:11'),(8,22,33,'2019-04-08 12:14:12','2019-04-08 12:14:12'),(9,8,33,'2019-04-08 12:15:37','2019-04-08 12:15:37'),(10,9,33,'2019-04-08 12:15:37','2019-04-08 12:15:37'),(11,73,37,'2019-04-08 13:18:52','2019-04-08 13:18:52'),(12,9,37,'2019-04-08 13:20:13','2019-04-08 13:20:13'),(13,73,14,'2019-04-10 11:34:28','2019-04-10 11:34:28'),(14,22,53,'2019-04-11 07:10:20','2019-04-11 07:10:20'),(15,13,53,'2019-04-11 07:10:20','2019-04-11 07:10:20'),(16,42,53,'2019-04-11 07:10:20','2019-04-11 07:10:20'),(17,44,53,'2019-04-11 07:10:20','2019-04-11 07:10:20'),(18,43,53,'2019-04-11 07:10:20','2019-04-11 07:10:20'),(19,57,68,'2019-04-11 13:26:09','2019-04-11 13:26:09'),(20,63,76,'2019-04-15 06:46:59','2019-04-15 06:46:59'),(21,76,76,'2019-04-15 06:46:59','2019-04-15 06:46:59'),(22,95,76,'2019-04-15 06:46:59','2019-04-15 06:46:59'),(23,4,94,'2019-04-15 12:30:11','2019-04-15 12:30:11'),(24,2,115,'2019-04-17 07:37:52','2019-04-17 07:37:52'),(25,2,139,'2019-04-24 06:26:37','2019-04-24 06:26:37'),(26,6,139,'2019-04-24 06:26:37','2019-04-24 06:26:37'),(27,8,139,'2019-04-24 06:26:37','2019-04-24 06:26:37'),(28,139,139,'2019-04-24 06:26:37','2019-04-24 06:26:37'),(29,2,168,'2019-04-25 08:55:52','2019-04-25 08:55:52'),(30,3,168,'2019-04-25 08:55:53','2019-04-25 08:55:53'),(31,4,168,'2019-04-25 08:55:53','2019-04-25 08:55:53'),(32,5,168,'2019-04-25 08:55:53','2019-04-25 08:55:53'),(33,49,168,'2019-04-25 08:55:53','2019-04-25 08:55:53'),(34,57,115,'2019-04-25 09:03:06','2019-04-25 09:03:06'),(35,4,173,'2019-04-25 10:20:31','2019-04-25 10:20:31'),(36,5,173,'2019-04-25 10:20:31','2019-04-25 10:20:31'),(37,31,174,'2019-04-25 11:54:41','2019-04-25 11:54:41'),(38,45,174,'2019-04-25 11:54:41','2019-04-25 11:54:41'),(39,73,175,'2019-04-25 12:02:56','2019-04-25 12:02:56'),(40,67,175,'2019-04-25 12:02:56','2019-04-25 12:02:56'),(41,7,179,'2019-04-27 13:42:19','2019-04-27 13:42:19'),(42,8,179,'2019-04-27 13:42:19','2019-04-27 13:42:19'),(43,9,179,'2019-04-27 13:42:19','2019-04-27 13:42:19'),(44,31,179,'2019-04-27 13:42:19','2019-04-27 13:42:19'),(45,45,179,'2019-04-27 13:42:19','2019-04-27 13:42:19'),(46,6,256,'2019-06-13 12:22:23','2019-06-13 12:22:23'),(47,8,256,'2019-06-13 12:22:23','2019-06-13 12:22:23'),(48,9,256,'2019-06-13 12:22:23','2019-06-13 12:22:23'),(49,2,256,'2019-06-13 12:22:23','2019-06-13 12:22:23'),(50,3,256,'2019-06-13 12:22:23','2019-06-13 12:22:23'),(51,33,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(52,34,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(53,35,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(54,57,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(55,58,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(56,59,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(57,67,266,'2019-06-20 12:11:02','2019-06-20 12:11:02'),(58,7,265,'2019-06-20 12:14:18','2019-06-20 12:14:18'),(59,24,261,'2019-06-20 12:18:36','2019-06-20 12:18:36'),(60,116,253,'2019-06-20 12:24:30','2019-06-20 12:24:30'),(61,152,253,'2019-06-20 12:27:25','2019-06-20 12:27:25'),(62,7,252,'2019-06-20 12:28:16','2019-06-20 12:28:16'),(63,28,250,'2019-06-20 12:32:20','2019-06-20 12:32:20'),(64,123,248,'2019-06-20 12:36:33','2019-06-20 12:36:33'),(65,18,248,'2019-06-20 12:37:32','2019-06-20 12:37:32'),(66,154,248,'2019-06-20 12:41:12','2019-06-20 12:41:12'),(67,153,248,'2019-06-20 12:41:12','2019-06-20 12:41:12'),(68,137,245,'2019-06-20 12:48:43','2019-06-20 12:48:43'),(69,49,244,'2019-06-20 12:49:15','2019-06-20 12:49:15'),(70,43,243,'2019-06-20 12:50:30','2019-06-20 12:50:30'),(71,44,243,'2019-06-20 12:51:00','2019-06-20 12:51:00'),(72,42,243,'2019-06-20 12:51:00','2019-06-20 12:51:00'),(73,21,282,'2019-06-20 13:23:13','2019-06-20 13:23:13'),(74,49,282,'2019-06-20 13:23:13','2019-06-20 13:23:13');
/*!40000 ALTER TABLE `customer_disliked_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_ingredients_amount`
--

DROP TABLE IF EXISTS `customer_ingredients_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_ingredients_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `ingredient_type_id` int(10) unsigned DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meal_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_ingredients_amount_customer_id_foreign` (`customer_id`),
  KEY `customer_ingredients_amount_ingredient_type_id_foreign` (`ingredient_type_id`),
  KEY `customer_ingredients_amount_meal_type_id_foreign` (`meal_type_id`),
  CONSTRAINT `customer_ingredients_amount_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customer_ingredients_amount_ingredient_type_id_foreign` FOREIGN KEY (`ingredient_type_id`) REFERENCES `ingredient_types` (`id`),
  CONSTRAINT `customer_ingredients_amount_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_ingredients_amount`
--

LOCK TABLES `customer_ingredients_amount` WRITE;
/*!40000 ALTER TABLE `customer_ingredients_amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_ingredients_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_meal`
--

DROP TABLE IF EXISTS `customer_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meal` (
  `customer_id` int(10) unsigned NOT NULL,
  `meal_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`meal_id`,`date`),
  KEY `customer_meal_customer_id_index` (`customer_id`),
  KEY `customer_meal_meal_id_index` (`meal_id`),
  CONSTRAINT `customer_meal_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_meal_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meal`
--

LOCK TABLES `customer_meal` WRITE;
/*!40000 ALTER TABLE `customer_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_meal_amounts`
--

DROP TABLE IF EXISTS `customer_meal_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meal_amounts` (
  `customer_meal_id` int(10) unsigned NOT NULL,
  `ingredient_type_id` int(10) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_meal_id`,`ingredient_type_id`),
  KEY `cmamounts_it` (`ingredient_type_id`),
  CONSTRAINT `cmamounts_cm` FOREIGN KEY (`customer_meal_id`) REFERENCES `customer_meals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cmamounts_it` FOREIGN KEY (`ingredient_type_id`) REFERENCES `ingredient_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meal_amounts`
--

LOCK TABLES `customer_meal_amounts` WRITE;
/*!40000 ALTER TABLE `customer_meal_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_meal_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_meals`
--

DROP TABLE IF EXISTS `customer_meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `week_meal_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_calories` int(11) DEFAULT NULL,
  `cooked` tinyint(4) NOT NULL DEFAULT 0,
  `total_fats` int(11) NOT NULL DEFAULT 0,
  `total_proteins` int(11) NOT NULL DEFAULT 0,
  `total_carbs` int(11) NOT NULL DEFAULT 0,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_meals_customer_id_foreign` (`customer_id`),
  KEY `customer_meals_week_meal_id_foreign` (`week_meal_id`),
  CONSTRAINT `customer_meals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_meals_week_meal_id_foreign` FOREIGN KEY (`week_meal_id`) REFERENCES `week_meals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meals`
--

LOCK TABLES `customer_meals` WRITE;
/*!40000 ALTER TABLE `customer_meals` DISABLE KEYS */;
INSERT INTO `customer_meals` VALUES (311,2,278,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(312,2,307,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(313,2,348,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(314,2,357,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(315,2,398,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(316,2,423,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(317,2,432,'2019-06-23 10:24:28','2019-06-23 10:24:28',394,0,0,0,0,NULL),(318,2,295,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(319,2,302,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(320,2,324,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(321,2,352,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(322,2,394,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(323,2,419,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(324,2,424,'2019-06-23 10:24:28','2019-06-23 10:24:28',111,0,0,0,0,NULL),(325,2,296,'2019-06-23 10:24:28','2019-06-23 10:24:28',65,0,0,0,0,NULL),(326,2,305,'2019-06-23 10:24:28','2019-06-23 10:24:28',146,0,0,0,0,NULL),(327,2,325,'2019-06-23 10:24:28','2019-06-23 10:24:28',65,0,0,0,0,NULL),(328,2,355,'2019-06-23 10:24:28','2019-06-23 10:24:28',146,0,0,0,0,NULL),(329,2,392,'2019-06-23 10:24:28','2019-06-23 10:24:28',146,0,0,0,0,NULL),(330,2,405,'2019-06-23 10:24:28','2019-06-23 10:24:28',146,0,0,0,0,NULL),(331,2,425,'2019-06-23 10:24:28','2019-06-23 10:24:28',65,0,0,0,0,NULL);
/*!40000 ALTER TABLE `customer_meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_programs`
--

DROP TABLE IF EXISTS `customer_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `meal_type_id` int(10) unsigned NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_programs_customer_id_foreign` (`customer_id`),
  KEY `customer_programs_meal_type_id_foreign` (`meal_type_id`),
  CONSTRAINT `customer_programs_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customer_programs_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_programs`
--

LOCK TABLES `customer_programs` WRITE;
/*!40000 ALTER TABLE `customer_programs` DISABLE KEYS */;
INSERT INTO `customer_programs` VALUES (1,135,8,'[{\"data\":[{\"ingredient_type_id\":\"1\",\"amount\":\"100\"},{\"ingredient_type_id\":\"5\",\"amount\":\"100\"}]}]','2019-04-21 11:45:29','2019-04-21 11:45:35'),(2,5,8,'[{\"data\":[{\"ingredient_type_id\":\"15\",\"amount\":\"76\"},{\"ingredient_type_id\":\"5\",\"amount\":\"51\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"17\",\"amount\":\"62\"},{\"ingredient_type_id\":\"5\",\"amount\":\"49\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"19\",\"amount\":\"59\"},{\"ingredient_type_id\":\"5\",\"amount\":\"83\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"20\",\"amount\":\"70\"},{\"ingredient_type_id\":\"5\",\"amount\":\"55\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"4\",\"amount\":\"180\"},{\"ingredient_type_id\":\"5\",\"amount\":\"123\"}],\"kitchen_id\":\"5\"}]','2019-04-21 12:04:26','2019-04-21 13:31:38'),(4,5,9,'[{\"data\":[{\"ingredient_type_id\":\"15\",\"amount\":\"126\"},{\"ingredient_type_id\":\"5\",\"amount\":\"114\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"17\",\"amount\":\"117\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"16\",\"amount\":\"120\"},{\"ingredient_type_id\":\"5\",\"amount\":\"120\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"14\",\"amount\":\"115\"},{\"ingredient_type_id\":\"5\",\"amount\":\"125\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"19\",\"amount\":\"70\"},{\"ingredient_type_id\":\"5\",\"amount\":\"121\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"20\",\"amount\":\"129\"},{\"ingredient_type_id\":\"5\",\"amount\":\"111\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"18\",\"amount\":\"66\"},{\"ingredient_type_id\":\"5\",\"amount\":\"124\"}],\"kitchen_id\":\"5\"}]','2019-04-21 12:08:25','2019-04-21 13:31:59'),(5,5,10,'[{\"data\":[{\"ingredient_type_id\":\"15\",\"amount\":\"133\"},{\"ingredient_type_id\":\"5\",\"amount\":\"107\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"17\",\"amount\":\"128\"},{\"ingredient_type_id\":\"5\",\"amount\":\"112\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"16\",\"amount\":\"115\"},{\"ingredient_type_id\":\"16\",\"amount\":\"125\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"14\",\"amount\":\"120\"},{\"ingredient_type_id\":\"5\",\"amount\":\"120\"}],\"kitchen_id\":\"5\"},{\"data\":[{\"ingredient_type_id\":\"20\",\"amount\":\"135\"},{\"ingredient_type_id\":\"5\",\"amount\":\"105\"}],\"kitchen_id\":\"5\"}]','2019-04-21 12:16:36','2019-04-21 13:32:13'),(7,4,9,'[{\"data\":[{\"ingredient_type_id\":\"16\",\"amount\":\"100\"}],\"kitchen_id\":\"5\"}]','2019-06-23 10:19:06','2019-06-23 10:21:04');
/*!40000 ALTER TABLE `customer_programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `waist_measurements` double NOT NULL,
  `hip_measurements` double NOT NULL,
  `blood_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_history` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `present_medication` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise_frequency` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alchohol` tinyint(4) NOT NULL,
  `smoke` tinyint(4) NOT NULL,
  `pregnancy` tinyint(4) NOT NULL,
  `breastfeeding` tinyint(4) NOT NULL,
  `vaccinations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `worktype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weightchange` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `customers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'Bassam Al Ali','Mr',37,'1981-09-26',1,175,81,34,0,'O+','BLDG 2495,RD 2832,SEEF 428, AHLI UNITED BANK','36733777','36733777','bas.alali@gmail.com','NONE','NONE','1',0,0,0,0,'0','Mental',2,'2019-03-30 08:48:47','2019-04-06 07:37:25',1,1),(4,'Laila Al-Beiti','MS.',35,'1983-08-17',0,167,84,112,112,'0','House 25, Granada Garden Road 2251,Jidhafs 442','39977832','39977832','laila.albeiti@gmail.com','NONE','NONE','1',0,0,0,0,'0','MENTAL',0,'2019-03-30 09:40:31','2019-06-23 10:16:39',1,1),(5,'Humood Almuhanna','Mr.',28,'1990-07-28',1,190,103,109,69,'O+','House 215, RD 90, BLK 945, Awali','3831001','3831001','humood.almuhanna@gmail.com','Mixed connective tissue disease','Adalat, Imuran, Nuxium','1',0,0,0,0,'0','Mental',0,'2019-03-30 10:01:25','2019-04-06 07:35:48',2,1),(6,'Najlaa Salman Alkhalifa','Sh.',27,'1991-10-19',0,158,88,95,121,'O+','House 174\r\nSh. Khalifa Bin Mohd Ave.\r\nBusaiteen\r\nBlock 221','33505505','33505505','niyalalkhalifa@gmail.com','NONE','NONE\r\n\r\n\r\n\r\nNote : minced meat only no to steaks','1',0,0,0,0,'0','MENTAL',0,'2019-04-01 15:52:43','2019-04-17 05:52:08',2,1),(7,'Saleh Nass','Mr.',34,'1985-03-08',1,0,0,0,0,'0','Villa 429\r\nElements Production \r\nRd 1212\r\nGufool 312','39973337','39973337','smnass@mac.com','0','0','1',0,0,0,0,'0','Physical',2,'2019-04-06 07:39:23','2019-04-06 07:41:12',1,1),(8,'Sarah Abdulmajeed Mohammed','Mr.',31,'1988-02-20',0,167,71,0,0,'B+','House 99\r\nRd 2702\r\nBLK 927\r\nBukwarah','38889883','39912223','saramohd88@hotmail.com','NONE','NONE','0',0,0,0,0,'0','Mental',2,'2019-04-06 07:44:01','2019-04-06 07:44:01',1,1),(9,'Sara Al Dallal','Mrs.',31,'1987-12-22',0,172,91,0,0,'A+','v23\r\nHuda Palms\r\nAl Nakheel Higway Gate 1129\r\nRoad 60 Barbar 528','36704999','36704999','sara.aldallal@gmail.com','none','none','1',0,0,0,1,'0','both',0,'2019-04-06 13:44:53','2019-04-06 14:00:31',3,1),(10,'Mohamed Raees','Mr.',37,'1982-03-04',1,180,88,0,0,'0','Kuwait Finance House Bahrain\r\nWord Trade Center Ground Floor\r\nKFH Branch next to Maki Restaurant','39885522','39885522','m.raees@gmail.com','none','none','1',0,1,0,0,'0','mental',2,'2019-04-06 14:09:35','2019-04-06 14:09:35',3,1),(11,'Dalal Essa Najibi','Ms',25,'1994-02-15',0,166,58,0,0,'B+','House No. 989 Road 2520\r\nBlock 525 \r\nSaar','39722002','39722002','dalalnajibi@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-04-07 07:41:02','2019-04-07 07:41:02',2,1),(12,'Mehrunissa Anis','Dr.',30,'1988-06-11',0,172,60,71,91,'B+','Flat 83,8th flr. Bldg.2450,\r\nRoad 2835 Block 228\r\nBusaiteen','38816472','38816472','mehrunissa.anis@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-04-07 08:44:15','2019-04-07 08:44:15',3,1),(14,'Ahmed Ishaq','Mr.',36,'1983-08-18',1,190,91,34,20,'AB+','House no. 1100, Road 1518\r\nBlock 915 East Riffa','39412414','39412414','aishaq1983@gmail.com','none','none','1',0,1,0,0,'0','mental',0,'2019-04-07 12:20:50','2019-04-24 09:48:25',2,1),(15,'Habib Ali Gowhary','Mr.',28,'1990-08-30',1,192,75,81,0,'0','Flat 11, Bldg. 3551\r\nRoad 7552 Block 575\r\nJanabiya','36676701','36676701','habib.ali90@hotmail.com','none','none','0',0,0,0,0,'0','mental',1,'2019-04-08 05:41:02','2019-04-08 06:16:51',3,1),(16,'Maryam Hamad','Ms.',39,'1979-05-23',0,162,60.5,0,0,'0+','Villa 589 Road 1619\r\nBlock 916 West Riffa','36766661','36766661','riffa.events@gmail.com','high cholesterol','none','1',0,0,0,0,'0','both',0,'2019-04-08 06:16:16','2019-04-08 06:16:16',2,1),(17,'Ahmed Salahuddin','Mr.',32,'1986-08-01',1,172,92,120,109,'0+','House no. 1077,Road \r\n2521, Block 525\r\nSaar','34454445','39416600','salahaldeen.a@gmail.com','none','multi vitamins supplements\r\n\r\n\r\nNote : no to spciy','0',0,1,0,0,'0','both',0,'2019-04-08 06:38:11','2019-04-08 06:40:41',2,1),(18,'Sara Davies','Mrs.',32,'1986-12-24',0,5.7,83,0,0,'0+','Villa 682, Hani Gardens\r\nRoad 2033 Block 520\r\nBarbar','33324120','33324120','saradavies86@hotmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-08 06:46:09','2019-04-08 06:49:06',2,1),(19,'James Davies','Mr.',32,'1986-10-23',1,6,82,0,0,'0','Villa 682, Hani Gardens\r\nRoad 2033, Block 520\r\nBarbar','32121448','32121448','jamesdavies0@hotmail.com','none','none','1',1,0,0,0,'0','mental',0,'2019-04-08 06:48:37','2019-04-08 06:48:37',2,1),(20,'Stephanie Hsu','Dr.',29,'1989-09-14',0,163,58,71,91,'B+','No.57,ar Al Ezz 1\r\nBldg.2372 Road 2834 Block 228\r\nBusaiteen','39926958','39926958','steph.hsu89@gmail.com','none\r\n\r\nNote : less salt','none','0',0,0,0,0,'0','both',2,'2019-04-08 06:52:44','2019-04-08 06:53:22',3,1),(21,'Nahar Ahmed Kamal','Mrs.',30,'1989-04-22',0,159,57,0,0,'A+','Villa 915,Road 1514,\r\nBlock 915 East Riffa','39545995','39545995','nahar.akamal@gmail.com','none','none\r\n\r\n\r\nNote : NO OATMEAL PLS.','1',0,0,0,0,'0','mental',2,'2019-04-08 06:56:23','2019-04-08 07:00:19',3,1),(22,'Khalid Al Shater','Mr.',17,'2002-01-05',1,132,96,101,0,'0','House 995,Road 7415\r\nBlock 579\r\nHamala','36660066','36660066','khalidalshater@gmai.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-08 07:08:59','2019-04-08 07:08:59',2,1),(23,'Amina Humood','Ms',30,'1988-07-14',0,150,48,0,0,'A+','Villa 139 Road 29\r\nBlock 242\r\nArad','37766377','37766377','amina.humood@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-08 07:12:51','2019-04-08 07:12:51',2,1),(24,'Nadia Haqiqi','Mrs.',31,'1987-04-18',0,158,61,0,0,'0+','Villa no.2 Gate 1007\r\nBlock 332 Bu Ashira','36654455','17170441','nhaqiqi@1stenergybank.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-08 07:16:14','2019-04-08 07:16:14',2,1),(25,'May Taqi','Ms.',27,'0091-09-26',0,160,95,101,127,'0+','Villa 1117 Road 919\r\nBlock 1209 \r\nMiadinat  Hamad (Roundabout 9)','39722205','17420858','m.f.taqi@gmail.com','none','daily vitamins for hai and skin','2',0,0,0,0,'0','both',0,'2019-04-08 07:29:18','2019-04-08 07:29:18',2,1),(26,'Fatima Yateem','Ms.',29,'1990-02-07',0,174,78,0,0,'0+','Yateem Gardens Villa 30\r\n2469,Road 2762 \r\nBlock 327, Manama Bahrain','38883828','38883828','fatima.yateem@gmail.com','none','none','2',0,0,0,0,'0','both',0,'2019-04-08 07:43:46','2019-04-08 13:56:33',8,1),(27,'Shaika May Bit Sulaiman Al Otaibi','Dr.',62,'1957-12-17',0,100,69,97,91,'B+','House no..196, Block 221\r\nRoad Sh.Khalifa Bin Moohd.Avenue','3880011','3880011','maysalute@gmail.com','none\r\n\r\n\r\nNote : NO KIWI & LESS EGGS','none','0',0,0,0,0,'0','both',0,'2019-04-08 08:02:02','2019-06-15 12:04:02',2,1),(28,'Amal Khalil Ismail','Ms.',29,'1989-08-03',0,157,90,0,0,'0+','House no.2613,Road 2966\r\nBlock 729 Jurdab\r\nIsa Town','36626266','36626266','amalkhalil@;live.com','none','none','2',0,0,0,0,'0','mental',0,'2019-04-08 08:09:59','2019-04-08 08:09:59',2,1),(29,'Fatima Al Hadi','Mrs.',26,'1983-01-24',0,155,56.8,0,0,'A+','Lagoon Gate No.2 Block 943\r\nStreet no. 4317 H GB004\r\nRiffa Views','39993899','39993899','alhadifatima@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-08 08:19:44','2019-04-08 08:19:44',2,1),(30,'Fahad Barbar','Mr.',29,'1987-03-12',1,0,182,33,0,'B+','Villa 14, Gate 756,Road 1725\r\nIsa Park Compound\r\nSaar','39050656','33889991','fahadbabar@gmail.com','none\r\n\r\nNote : no sugar, gluten free,low carb high protein meal','none','2',1,1,0,0,'0','mental',2,'2019-04-08 08:46:25','2019-04-08 08:51:23',2,1),(31,'Lara Elie Semaan','Ms.',25,'1994-09-01',0,166,86,114,114,'0+','House 3228, Road 5770,\r\nBlock 457 Buqowah\r\nSeraya 2','66666056','66666056','lara.elie.semaan@gmail.com','none','accutane for the last 2 months\r\n\r\nNote : no to seafood','0',0,0,0,0,'0','both',2,'2019-04-08 09:21:04','2019-04-08 09:23:17',3,1),(32,'Nouf Khalfan','Mrs.',34,'1984-12-07',0,5.6,69.5,93.9,104,'0','Villa 2545, Road 7169\r\nBlock 571 Janabiya','39944994','39944994','noufkhalfan@gmail.com','none','none','0',1,0,0,0,'0','both',2,'2019-04-08 09:29:07','2019-04-08 09:29:07',2,1),(33,'Sara Jawahery','Ms.',36,'1982-05-31',0,5.3,53,0,0,'B+','House no.2,Gate 262, Road 7311\r\nBlk. 473,Abu Saiba','39699773','39699773','sara.jawahery@gmail.com','none','none\r\n\r\nnote: no gluten, no dairy,no fish\r\nmore of proteim ,low carb','1',0,0,0,0,'0','both',2,'2019-04-08 11:09:57','2019-04-08 12:15:58',3,1),(34,'Shaika Methayelle Al Khalifa','Shaika',27,'1992-04-11',0,154,57,65.5,97,'0+','shaikh Isa\'s palace','36977777','36977777','methayelle@gmail.cm','none','none\r\n\r\nNote : no eggs,gluten free,no brown rice','1',0,0,0,0,'0','mental',2,'2019-04-08 13:02:20','2019-04-08 13:02:20',3,1),(35,'Stephanie Long','Ms',34,'0000-00-00',0,169,79,0,0,'0','Capricorn Gardens, Flat 40\r\n1st Floor Avenue 65,131\r\nBlock 565 Janabiyah','36121122','36121122','stephaniealexlong@gmail.com','none','PCOS','0',0,0,0,0,'0','both',0,'2019-04-08 13:08:52','2019-04-08 13:09:40',3,1),(36,'Mohamed Alsaati','Mr.',28,'1992-04-10',1,171,65,30,0,'AB+','House no. 141,Road 2307\r\nBlock 523\r\nSaar','39988009','39988009','mohamed.alsaati@gmail.com','none','none\r\n\r\nNote : no to ketchup and pickles','1',0,1,0,0,'0','both',2,'2019-04-08 13:13:07','2019-04-08 13:14:55',3,1),(37,'Ameera Nasralla','Mrs.',35,'1984-04-24',0,157,68,0,0,'B+','House no.1333, Road 5337\r\nBlock 553,\r\nBudaiya','39633327','39633327','nasrallaameera@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-08 13:17:51','2019-04-08 13:17:51',3,1),(38,'Sara Abdulla','Ms.',30,'1989-10-29',0,160,54,0,0,'0','House no.1061,Road 1119, \r\nBlock 911\r\nEast Riffa','36330075','36330075','s.abdulla@gmail.com','none','none\r\n\r\nNote : no lentils and no beans','1',0,0,0,0,'0','mental',0,'2019-04-08 13:26:22','2019-04-08 13:28:36',3,1),(47,'Noora Hasan Isa','Ms.',38,'1980-08-24',0,167,74,0,0,'0','Villa no.993, Road 1626, \r\nBlock 916 \r\nWest Riffa','39444462','39444462','n.h.alghatam@gmail.com','none','Taking Vitamin D & Omega','1',0,0,0,0,'0','both',2,'2019-04-10 05:59:19','2019-04-10 05:59:19',3,1),(50,'Kumail Al Noaimi','Mr.',36,'1982-01-01',1,179,72,32,0,'0','Compound no 141,Villa no.96\r\nRoad 24, Block 1020\r\nHamad Town','39600874','39600874','kumail.alnoaimi@gmail.com','none\r\n\r\n\r\nNote : into a lot of sports hence need more carbs','none','2',0,0,0,0,'0','both',2,'2019-04-10 11:28:13','2019-04-10 11:30:28',11,1),(52,'Abdulla Al Aradi','Mr.',35,'0983-06-07',1,197,88,91,0,'A+','Villa 1047,Road 4032\r\nBlock 240 Arad\r\nMuharraq (opposite to arad bay pedestrian bridge)','33335757','33335757','abdulla.aradi@gmail.com','none','mome','0',1,1,0,0,'0','both',2,'2019-04-11 06:57:24','2019-04-11 06:57:24',1,1),(53,'Fatima Karimi','Ms.',32,'1986-08-05',0,164,72,0,0,'B+','Viva Tower 15, 428 Seef District\r\n17th Floor','39711397','34011393','fkarimi@gmail.com','none','none\r\n\r\nNote : No legumes,gluten Free,quinoa\r\n and beans','1',0,1,0,0,'0','mental',2,'2019-04-11 07:05:37','2019-04-11 07:11:48',1,1),(54,'Maryam Al Zayani','Ms.',26,'0001-01-01',0,0,0,0,0,'0','Khaleej Commercial Bank  - Financial Harbour \r\n25th Floor','36561666','36561666','malzayyani@khcbonline.com','none','none','0',0,0,0,0,'0','both',2,'2019-04-11 07:54:22','2019-04-11 07:54:22',1,1),(55,'Alanood Alnoami','Mrs.',38,'0981-09-09',0,169,74,90,105,'AB','House no. 1522, Road 2426\r\nBlock 324, Al Juffair','39402828','39402828','aalnoaimi9@gmail.com','none\r\n\r\n\r\n\r\nNote : With TLC  results','1.Adalat,Imuran, Nexium\r\n2.Mixed connective tissue disease','1',0,0,0,0,'0','both',2,'2019-04-11 08:37:42','2019-04-11 08:59:00',3,1),(57,'Hamza Saleem','Mr.',34,'1985-03-04',1,170,73,86,99,'B+','Villa no.1 Compound No. 1016-D\r\nRoad 2933,Area 529\'\r\nMarkh,Saar  (Behind Saar Mosque)','39655622','39655622','hmaza_saleemiqbal@hotmail.com','Borderline Cholesterol Level','none','1',1,0,0,0,'0','both',0,'2019-04-11 11:05:25','2019-04-11 11:05:25',3,1),(58,'Khulood Al Jassim','Ms.',32,'1964-04-19',0,169,65,32,0,'B+','House no.989, Road 2520,\r\nBlock 525 Saar','39698030','39698030','k.aljassim7@gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-04-11 11:26:14','2019-04-11 11:26:14',2,1),(61,'Dalal Essa Najibi','Ms.',25,'1994-02-15',0,166,58,26,0,'B+','House 989 Road 2520\r\nBlock 525 Saar','39722002','39722002','dalal.najibi@gmail.com','none','none','0',0,0,0,0,'0','both',2,'2019-04-11 12:04:54','2019-04-11 12:04:54',2,1),(62,'Amal Al Bader','Mrs.',37,'1981-01-10',0,153,60,0,0,'A+','House 1731, Road 4555\r\nBlock 745 Sanad','66309999','66309999','ahmedakeel@gmail.com','none','Note : Sudden has had a sudden increase in weight gain, and depression.','1',0,0,0,0,'0','mental',0,'2019-04-11 12:09:44','2019-04-11 12:09:44',2,1),(63,'Muna Ali Yateem','Ms.',32,'1986-10-06',0,165,64.6,72,91,'0+','Villa 2469, Road 2762\r\nYateem Graden\r\nAdliya','39988822','39988822','munayateem@gmail.com','none','Taking daily : omega 3 fish oil and some\r\nother supplements\r\n\r\nNote : No to quinoa , no milk,  yogurt and cheese','1',1,1,0,0,'0','both',0,'2019-04-11 12:14:29','2019-04-11 12:14:29',2,1),(66,'Khaled Al Alawi','Mr.',32,'1987-03-25',1,179,86.5,0,0,'AB+','Apartment 11, Bldg.2116\r\nRoad 1334,Block 513\r\nMaqabah','39400878','39400878','khalilalawi@hotmail.com','none','None\r\n\r\nNote : no shellfish,shrimp,crab etc. but fish is ok','1',0,0,0,0,'0','mental',2,'2019-04-11 13:11:21','2019-04-11 13:11:21',3,1),(68,'Huda Al Shamlan','Mrs.',31,'1987-10-16',0,158,52,0,0,'B+','Apartment 11,Bldg.2116,\r\nRoad 1334 Block 513\r\nMaqabah Saar','36655533','36655533','huda.alshamlan@gmail.com','none','none','0',1,1,0,0,'0','mental',2,'2019-04-11 13:23:09','2019-04-11 13:23:09',3,1),(70,'Emad Bader','Mr.',32,'1986-03-26',1,176,76.7,93,101,'0','Compound 177, Road 20\r\nBlock 522 Barbar','39999662','39999662','emadbader@gmail.com','none','none','1',1,1,0,0,'0','both',2,'2019-04-11 13:46:34','2019-04-11 13:46:34',3,1),(72,'Latifa Salman Flaifel','Mrs.',28,'1990-08-31',0,158,54,80,96,'0+','BIBF OFFICE\r\nBldg.1456, Road 4034,\r\nBlock 340\r\nJuffair','36630161','36630161','latifaflaifel@gmail.com','none','none\r\n\r\nNote : No beef and spicy','1',0,0,0,0,'1','both',2,'2019-04-13 06:22:31','2019-04-14 15:27:58',1,1),(73,'Asma Alarayyedh','Mrs.',31,'1988-01-07',0,155,50,0,0,'A+','Ahli United Bank  HQ\r\nSeef District \r\nReception only','36066520','36066520','asmaalarrayed@hotmail.com','none','none\r\n\r\n\r\n\r\nNote : no to all types of beans, corn and oats , and sweet potato not white potato','1',0,0,0,0,'0','mental',2,'2019-04-13 06:35:11','2019-04-14 15:27:44',1,1),(75,'Dalia Al Jurf','Ms.',32,'1986-11-04',0,158,62,0,0,'AB+','Reef Island, Le Reef Bldg.,\r\nEast Tower, 3rd floor\r\nApartment 38','36314397','36314397','daliajurf@gmail.com','none','none\r\n\r\n\r\nNote : prefer almond milk instead of dairy milk','1',0,0,0,0,'0','mental',2,'2019-04-15 06:33:05','2019-04-15 06:33:05',3,1),(76,'Yasmeen Qaedi','Mrs.',29,'1989-11-21',0,158,73,86,108,'A+','Viva HQ, Al Seef District\r\n16th floor','34444481','34444481','yasmeen.k89@gmail.com','Irritable Bowel Syndrome (IBS)\r\nGERD, but as confirmed  by phone vinegar,lemons are fine with her.','none','1',0,0,0,0,'0','mental',2,'2019-04-15 06:43:46','2019-04-15 06:43:46',1,1),(77,'Heyam A.Rahman Rad','Ms.',32,'1986-12-02',0,151,67,88,92,'A+','Viva Tower,Al Seef District\r\n16th floor','33011616','33011616','heyamrad844@gmail.com','none','Seroxat \r\nAnxiety disorder\r\n\r\nNote : no cow milk,lentils and barley','1',0,0,0,0,'0','mental',0,'2019-04-15 06:50:43','2019-04-15 06:50:43',1,1),(78,'Reem Kaiksow','Ms.',36,'1982-07-06',0,5.1,62,0,0,'B+','Villa no.7, Gate 464\r\nRoad 7113, \r\nJanabiyah 571','39451444','39451444','reemkaicksow@gmail.com','none','none','0',0,0,0,1,'0','both',0,'2019-04-15 06:57:13','2019-04-15 06:57:13',5,1),(79,'Nabeel Kazim','Mr.',47,'1971-05-05',1,164,110,40,42,'0+','House no.212, Road 66\r\nBlock 364, Bilad Al Qadeem\r\n(Next to Ram Dental Clinic)','66386638','66386638','nabeelkazim@hotmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-15 07:07:14','2019-04-15 07:07:14',4,1),(80,'Ameera Alababasi','Mrs.',37,'1981-08-25',0,153,62,0,0,'B+','Villa 2563, road 6238,\r\nBlock 1062 Al Areen','66677760','66677760','alabbasi258@gmail.com','none','none','0',0,0,0,0,'0','mental',2,'2019-04-15 07:15:24','2019-04-15 07:15:24',1,1),(81,'Nayla Alkaabi','Ms.',30,'1988-07-06',0,162,64,0,0,'0+','Villa 1601 Road 2627\r\nBlock 926 Jari alshaikh\r\nRiffa','36777447','36777447','nayla.alkaabi@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-04-15 07:34:15','2019-04-15 07:34:15',1,0),(82,'Mariam Al Nasser','Mrs.',31,'1986-05-23',0,164,84,38,46,'0+','Flat 11, Bldg.1483 A\r\nRoad 2549, Block 925, \r\n1st Floor East Riffa\r\n\r\nDelivery Add : #14123 Road 2926 Block 929 East Riffa','36415555','36415555','asoola.2.star@gmail.com','none\r\n\r\nNote : dpne blood test and NA','none','0',0,0,0,0,'0','mental',0,'2019-04-15 07:43:40','2019-04-15 07:43:40',2,1),(83,'Mai Mattar','Ms.',35,'1982-07-08',0,160,106,103,71,'0+','House 2715,Road 4578\r\nSanad 745','367411110','36741110','maimatter@gmail.com','Acid reflux','Nexium 20 to 40','0',0,0,0,0,'0','mental',0,'2019-04-15 08:25:43','2019-04-15 08:25:43',1,1),(86,'Amani Alasfoor','Ms.',27,'1992-02-03',0,173,59,0,0,'0','Gate 61, Road 69\r\nBlock 463, Al Hajar 5643','36391231','39391231','amani@shaik.net','none','omega 3, vitamin D','1',0,1,0,0,'0','mental',2,'2019-04-15 11:29:39','2019-04-15 11:29:39',1,1),(88,'Maryam Fuad Ali','Ms.',25,'1993-07-14',0,156,55,73,99,'0','House no.20 , Road 901\r\nBlock 109,Hidd','36663326','36663326','maryam.fuad.ali@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-15 11:39:04','2019-04-15 11:39:04',2,1),(89,'Sarah Ulhaq','Mrs.',33,'1985-11-06',0,164,88,0,0,'0-','Flat 22, Bldg.572\r\nRoad 7510, Block 575\r\nJanabiyah','36267274','36267274','sarahulhaq@gmail.com','Thyroid','eythyrox','1',0,0,0,0,'0','mental',0,'2019-04-15 11:52:47','2019-04-15 11:52:47',2,1),(90,'Lolwa Al Noaimi','Ms.',27,'1991-05-27',0,168,95.6,93,117,'0+','Riffa Views, GV 27\r\nHouse 971\r\nBlock 943 Road 4308','39777370','39998838','lolwaahmedalnoaimi@gmail.com','none','none\r\n\r\n\r\n\r\n\r\nNote : gluten free and no dairy','0',0,0,0,0,'0','mental',0,'2019-04-15 12:01:29','2019-04-15 12:02:40',2,1),(92,'Yasmin Al Aswad','Ms.',30,'1988-12-07',0,173,64.5,77,102,'0+','House 190, Um Al Hassam\r\nBlock 337 Road 3703\r\n(Garage Door)','39645046','39645046','yasminalaswad@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-15 12:22:46','2019-04-15 12:22:46',2,1),(93,'Nout Faisal','Ms.',26,'1989-09-15',0,164,67,27,41,'0','GATE 4, House no. C375\r\nRiffa View / House no.L375\r\nHighway 96','39114388','39114388','faisalnout@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-15 12:26:09','2019-04-15 12:26:09',2,1),(94,'Noor Salman Al Khalifa','Sh.',37,'1980-03-13',0,166,180,145,167,'A+','174 Sh.Khalifa Bin Mohammed\r\nAvenue , Block 221\r\nMuharraq','360009963','36009963','noor.alkh@gmail.com','slight elevated blood sugar','Gluccophage','0',0,0,0,0,'0','both',0,'2019-04-15 12:29:35','2019-04-15 12:29:35',2,1),(95,'Noora Yusuf Al Hadi','Mrs.',31,'1985-05-25',0,156,55,0,0,'A+','House 1099, Road 2521\r\nSaar 525 \r\nOpposite Saar Mall','38448884','38448884','noora.alhadi@gmail.com','High cholesterol','Crestor -10mg every other day','1',0,0,0,0,'0','both',0,'2019-04-15 12:33:31','2019-04-15 12:33:31',2,1),(96,'Eva Hasan','Mrs.',40,'1978-12-29',0,154,62.5,29,44,'0+','House 145, Road 197\r\nBlock 919 \r\nEast riffa','39443944','39443944','eva.hasan@gmail.com','none','none','2',0,0,0,0,'0','mental',0,'2019-04-15 12:35:38','2019-04-15 12:35:38',2,1),(97,'Kanoo Talal','Mr.',23,'1975-06-23',0,0,0,0,0,'0','Villa 1542, Road 7329\r\nBughazal 373\r\nZinj','36366363','36366363','none','none','none','1',0,0,0,0,'0','mental',0,'2019-04-15 12:39:13','2019-04-15 12:39:13',2,1),(99,'Amna Alkhan','Ms.',35,'1983-11-24',0,163,54,0,0,'0','House 1068, Road 4308\r\nLagoon 417, Block 943 Riffa Views\r\nRiffa Mazrowah','39672882','39672882','amnaalkhan@gmail.com','none','none\r\n\r\n\r\n\r\nNote : fruits not be mixed with other receips','1',1,0,0,0,'0','both',0,'2019-04-15 12:52:25','2019-04-15 12:52:25',2,1),(100,'Mashael Al Awadhi','Mrs.',28,'1990-07-24',0,157,64,0,0,'0+','Block 457m Road 5774\r\nHouse 3662A\r\nBuqowah','33114473','33114473','mashael.alawadhi@live.com','none','none','0',0,1,0,0,'0','mental',0,'2019-04-15 12:55:00','2019-04-15 12:55:00',2,1),(101,'Audrey Al Otaibi','Mrs.',57,'1961-05-30',0,158,110,40,53,'0+','House 1070, Road 7130\r\nArea 571 janabiya','39455725','17793977','quarrayah@yahoo.com','none','concor 5mg for blood pressure and  Lipitor 10mg for cholesterol\r\n\r\n\r\n\r\nNote : no peppercorns','1',1,0,0,0,'0','mental',0,'2019-04-15 13:24:34','2019-06-20 11:52:16',2,1),(102,'Khalid Kanoo','Mr.',30,'1988-11-20',1,182,92.5,41,39,'0','Villa 1527, Road 7329\r\nBlock 373 Abu Ghazal\r\nZinj','39426426','39426426','kfkanoo@gmail.com','none','none','1',1,1,0,0,'0','mental',0,'2019-04-15 13:31:55','2019-04-15 13:31:55',2,1),(103,'Jehan Qaedi','Mrs.',31,'1988-02-01',0,6.3,75,0,0,'B+','Apt. 21, Bldg.1229\r\n2nd Floor, Road 4621\r\nBlock 246 , Arad','33066697','33066697','jehankhalid88@gmail.com','none','none\r\n\r\n\r\n\r\n\r\nNote : limit only dairy and gluten ..intolerance but not allergic','1',0,0,0,0,'0','both',0,'2019-04-16 06:27:52','2019-04-16 06:27:52',2,1),(104,'Khalid Mattar','Mr.',36,'1982-08-28',1,174,99,92,0,'A+','House no. 195,Road 3605\r\nAdliya 336','39404440','39404440','kmkmattar@hotmail.com','none','none','1',1,0,0,0,'0','both',0,'2019-04-16 06:31:03','2019-04-16 06:31:03',2,1),(105,'Noor Abdulkarim','Mrs.',35,'1980-07-14',0,164,80,81,0,'B+','House no. 195, Road 3605\r\nAdliya 336','39651144','39651144','nooryboory@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-16 06:39:01','2019-04-16 06:39:01',2,1),(106,'Sameera Al Bitar','Mrs.',29,'1990-02-21',0,175,61,0,0,'A+','Villa no. 674 Road 2033\r\nBlock 520, Hani Garden \r\nBudaiya (Beside Al Osra Supermarket)','36615661','36615661','sameera@rlsbahrain.org','none','none\r\n\r\n\r\n\r\nNote : would like to have chicken and vegetables only but needs 1500 calories','2',0,0,0,0,'0','both',0,'2019-04-16 06:44:10','2019-04-16 06:44:10',4,1),(107,'Maryam  Mohamed Alkahlifa','Mrs.',27,'1991-05-06',0,170,82.4,0,0,'A','House 862, Road 2419\r\nBlock 924 ,Riffa','33033300','33033300','m.msk@gmail.com','none','none\r\n\r\n\r\n\r\nNote : no seafood','1',0,0,0,0,'0','both',2,'2019-04-16 06:54:11','2019-04-16 06:55:35',2,1),(108,'Ameena Al Rafaei','Mrs.',32,'1986-03-11',0,156,57.8,0,0,'B+','Villa O-126, Block 943\r\nRoad 4303 Gate 1\r\nRiffa Views','38333200','38333200','ameenalrafai@gmail.com','none','none','1',0,1,0,0,'0','both',2,'2019-04-16 06:58:22','2019-04-17 05:55:32',3,1),(110,'Mike Smith','Mr.',43,'1975-05-23',1,188,193,87,0,'0','12th Floor Worky Parsons Gulf Executive Office\r\nBldg.15,Road 3801 Blk.338\r\nGulf hotel','36895021','368895021','mike.smith@worleyparsons.com','none\r\n\r\n\r\n\r\nNote : no dairy','none','1',0,0,0,0,'0','both',2,'2019-04-16 08:18:30','2019-04-16 08:19:04',9,1),(114,'Fatima  Ebrahim AlHashimi','Mrs.',35,'1983-10-01',0,151,55,0,0,'0','House 489B, Road 3419\r\nBlk.934,North Riffa','34343444','34343444','famaalhashimi@gmail.com','none','none\r\n\r\n\r\n\r\nNote : need extra rich iron food','0',0,0,0,0,'0','both',0,'2019-04-17 05:58:57','2019-04-17 05:58:57',2,1),(115,'Layla Shirazi','Mrs.',36,'1983-01-15',0,180,59.5,26,20,'A+','Villa 1242, Road 7139\r\nBlock 571, Janabiya','39698208','39698208','layla.shirazi@gmail.com','none','none','1',1,0,0,0,'0','mental',0,'2019-04-17 07:36:37','2019-04-25 09:04:26',2,1),(116,'Maha Al Mannai','Ms.',33,'1983-09-07',0,163,57,34,40,'-0','Villa 49, Road 35, \r\nBlock 561,Al Janabiyah Gardens\r\nJanabiya','38888958','38888958','maha.almannai@gmail.com','none','none\r\n\r\n\r\n\r\nNote : Less cheese\r\nNote : less cheese and dairy','0',0,0,0,0,'0','mental',0,'2019-04-17 09:00:58','2019-04-20 13:36:33',2,1),(117,'Sh. Latifa Ebrahim AlKahlifa','Shaika',36,'1982-07-23',0,65,76,0,0,'0+','180 Shaikh Khalifa Road\r\nBlock 906,West Riffa RODHA','39421000','39421000','LATIFA.ALKHALIFA@ICLOUD.COM','NONE','NONE\r\n\r\n\r\n\r\n\r\nNote : no seafood','0',0,0,0,0,'0','mental',0,'2019-04-17 10:44:13','2019-04-17 10:44:13',2,1),(119,'Maha Hamad Alkhalifa','Shaika',28,'1990-08-05',0,161,70,31,44,'0+','House no.589 Road 1619\r\nBlock 916 North Riffa','33333019','33333019','ladymaha990@gmail.com','none','note\r\n\r\n\r\n\r\nNote : allergic to peanuts, no to goat cheese,no seafoods but shrimp is ok','1',0,0,0,0,'0','both',0,'2019-04-18 06:04:17','2019-06-20 14:10:05',2,0),(120,'Wafa Hameed','Ms.',38,'1981-10-13',0,161,72,0,0,'A+','3 Palace Avenue\r\nGIB Diplomatic Area 5th floor \r\n\r\nHouse 809,6525, Block 565\r\nJanabiya','39333393','39333393','wafa.hameed@gmail.com','none','none','2',0,1,0,0,'0','mental',0,'2019-04-18 08:52:08','2019-04-18 08:53:15',2,1),(121,'Mona Neama','Ms.',27,'1991-06-18',0,176,73,31,0,'0+','House 919, Road 3335\r\nBlock 533 Al mark Saar','39772000','39772000','monanemah@gmail.com','PCOS,IBS','Gimcopixige 1000xR (2xa day)','0',1,0,0,0,'0','mental',0,'2019-04-18 09:00:31','2019-04-18 09:00:31',2,1),(122,'Talal Almoayed','Mr.',31,'1987-01-31',1,168,65,81,94,'0+','Villa 4, Almoayed Homes Compound\r\nRoad 002 Block 1002 Hamala','32211222','17171616','talal@almoayedgeneral.com','none','none','1',1,1,0,0,'0','mental',0,'2019-04-18 10:43:30','2019-04-18 10:43:30',2,1),(125,'Christina Welsh','Ms.',51,'1968-06-04',0,5.6,95,0,0,'0','Villa 64, Al Jasser Compoubd Avenue 6\r\nAl Jasra Block 1002','+966503320355','+966503320355','tlaingnleshsh@hotmail.com','Under active thyroid , high cholesterol\r\n\r\n\r\n\r\nNote : no beef or lamb except minced)','euthyrox  and lipitol','0',1,0,0,0,'0','mental',0,'2019-04-18 11:19:30','2019-04-18 11:19:30',2,1),(126,'Sarbeel Jehad','Mrs.',36,'1982-04-13',0,159,66,83,95.5,'0+','Villa 1307, Block 529, Road 2941\r\nSaar Al Markh','39933133','39933133','sarbeel@gmail.com','none','none','2',0,0,0,0,'0','both',0,'2019-04-18 11:31:06','2019-04-18 11:31:06',2,0),(127,'Narmeen Nedham Khonji','Ms.',0,'0001-01-01',0,167,61,0,0,'AB','Road 1512, Block 915\r\nHouse no.811 East Riffa','39619600','39619600','narmeenned@icloud.com','none','nobe','1',1,1,0,0,'0','both',0,'2019-04-18 11:36:44','2019-04-18 11:36:44',2,0),(128,'Layal Saeed','Mrs.',40,'1978-11-07',0,171,65.8,0,0,'0','Villa 54 Sheik Mohd Avenue\r\nRoad 87, Block 912\r\nWest Riffa','39797972','39797972','isaeed711@gmail.com','none','none\r\n\r\n\r\nNote : no spicy, no tomato ,no olives,no avocado','1',0,0,0,0,'0','both',0,'2019-04-18 11:46:54','2019-04-18 11:46:54',2,0),(129,'Naeema AlBalooshi','Mrs.',67,'1950-11-20',0,151,49,0,0,'0','House 1061, Road 1119\r\nBlock 911, East Riffa','39450571','39450571','n.albalosshi@almawred.org','none','none','0',0,0,0,0,'0','mental',2,'2019-04-20 10:30:54','2019-04-20 10:30:54',1,1),(130,'Adam Patrick Wilkes','Mr.',42,'1976-09-12',1,192,85,33,0,'0','Villa 38, West Gate Compound\r\nRoad 2957, Block 529, Saar','39925215','39925215','adam@nassasphalt.com','none','none','2',1,1,0,0,'0','mental',2,'2019-04-20 13:13:14','2019-04-20 13:13:14',4,1),(131,'Maha Al Khalifa','Ms.',33,'1985-09-22',0,157,127,49,0,'0','House 1033, Road 1627\r\nBlock 916, West Riffa','36330063','36366363','mahatiti@gmaill.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-20 13:23:04','2019-04-20 13:23:04',3,1),(132,'Noor Alwardi','Ms.',23,'1996-01-05',0,153,66,0,0,'0','Gate 860,Villa 8\r\nRoad 4515 Block 545 Wasna Compound','36666555','36666555','noortalwardi@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-20 13:29:34','2019-04-20 13:29:34',3,1),(134,'Zaid Alwardi','Mr.',17,'2002-03-02',1,180,90,0,0,'0','Gate 860, Villa 8, Road 4515\r\nBlock 545 Wasna Garden compound','39611155','39611155','zaidoo-75@hotmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-04-20 13:39:43','2019-04-20 13:39:43',2,1),(135,'Zainab Khalaf','Mrs.',34,'1985-07-20',0,164,78,0,0,'B+','House no.1049, Block 447\r\nRoad 1726 Al Qadem\r\nBudaiya','36554333','36554333','zainab.abdulshaheed@gmail.com','none','none','0',0,0,0,0,'0','both',2,'2019-04-21 06:40:08','2019-04-21 06:40:08',1,1),(136,'Muneera Mohamed Alkhalifa','Ms.',38,'1981-01-27',0,167,104,129,122,'0+','House no.2613, Road 2613,\r\nBlock 926, Riffa','39222229','39222229','mmk1313@gmail.com','Note : as per her app.tnk 1332 lots of medication','Type 2 diabetes\r\nHigh cholesterol\r\n\r\nNote : as per her app.tnk 1332 lots of medication','1',0,0,0,0,'0','mental',0,'2019-04-23 06:01:13','2019-04-23 06:01:13',2,0),(137,'Alajmi Noof','Ms.',23,'1995-08-29',0,157,56,20,20,'0','House 144,Road 3403\r\nBlock 934, Riffa','33711217','33711217','noof.alajmi@hotmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-23 06:09:54','2019-04-23 06:09:54',3,0),(138,'Aimee Louise Dormer','Ms.',37,'1981-11-25',0,173,78,20,20,'0','Villa 183, Road 5704\r\nFloating City Amwaj','36667559','36667559','aimee.dormer@royalflight.gov.bh','none','none','1',1,0,0,0,'0','both',0,'2019-04-23 11:33:40','2019-04-23 11:33:40',9,1),(139,'Dahouk Al Aswad','Ms.',35,'1984-02-15',0,173,78,93,113,'0','Road 1419,Block 1014,Al Dar \r\nCompound Villa 2 Hamala','66667444','66667444','dahouk.7a@gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-04-24 06:25:31','2019-04-24 06:25:31',2,1),(140,'Sarah Janahi','Ms.',29,'1987-06-23',0,165,72,20,20,'0-','House 3201,Road 5770\r\nBlock 457 Buqowah','39000432','39000432','sarah.janahi@live.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 06:29:38','2019-04-24 06:29:38',2,1),(141,'Zahra Taher','Mrs.',45,'1973-08-14',0,159,66,20,20,'A+','GATE 685,ROAD 421,BLOCK 1004\r\nVILLA 3 JASRA','39630997','39630997','z.taher@finmarkcoms.com','eyrodine','hypothnoid','1',0,0,0,0,'0','mental',2,'2019-04-24 08:11:58','2019-04-24 08:11:58',2,1),(142,'Paul Laing','Mr.',34,'1984-09-21',1,148,73,20,20,'0','Flat 6, Palm 1\r\nTala Island ,Block 257,,Amwaj','36455000','36455000','paul.laing@behbehani.com.bh','none','none','1',0,1,0,0,'0','mental',2,'2019-04-24 08:27:15','2019-04-24 08:44:04',3,1),(143,'Eman Alkooheji','Mrs.',41,'1977-12-30',0,165,64,20,20,'A+','Gate 685, Road 421, \r\nBlock 1004,Villa 3 Jasra','37373377','37373377','eman.kooheji@hotmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 08:30:18','2019-04-24 08:30:18',2,1),(144,'Lara Danesh','Ms.',45,'1973-06-24',0,157,65,20,20,'0','Villa 1427,Road 2835\r\nBlock 328, Segaya','39493665','39493665','ldanesh@finmarkcoms.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 08:43:43','2019-04-24 08:43:43',2,1),(145,'Danah Alwardi','Mrs.',29,'1990-01-29',0,164,57,68,100,'B+','House 1671, Road 1734\r\nBlock 1017 Damistan Hamad Town','66676663','66676663','danaalwardi@gmail.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-24 09:28:06','2019-04-24 09:28:06',2,0),(146,'Khalifa Al Khalifa','Mr.',32,'1986-10-11',1,179,108,45,44,'0','House 8-232, Road 2008\r\nBlock 920 West Riffa','39660999','39660999','rayaalkhalifa@gmail.com','none','multi vitamins and vitamin c','2',0,1,0,0,'0','both',0,'2019-04-24 09:33:15','2019-04-24 09:33:15',2,1),(147,'Aseel Alkhalifa','Shaika',45,'1973-04-13',0,160,64,20,20,'0+','Villa 418, Alshahab Avenue\r\nJuffair','36446444','36446444','aseelkk@gmail.com','Thyroidnone','75 mg Thyroxine','1',0,0,0,0,'0','mental',0,'2019-04-24 09:36:46','2019-04-24 09:37:05',3,1),(148,'Nada Salman Habib','Ms.',39,'1979-10-15',0,157,68,20,20,'0','House 1031, Road 1121\r\nBlock 711 Tubli','33308005','33308005','n.salmanhabib@gmail.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-24 09:41:17','2019-04-24 09:41:17',2,0),(149,'Shahab Saeed','Mr.',38,'1980-06-08',1,168,84,32,20,'B-','House 797, Road 2525\r\nBlock 925 East Riffa','38881666','38881666','shahabsaeed@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 09:44:58','2019-04-24 09:44:58',2,0),(150,'Sarah Naseeb','Mrs.',31,'1988-01-28',0,169,100,115,117,'B+','House 2114, Road 4565\r\nSaar Central Compound Al Qurrayah','39488889','39488889','sarah.naseeb@live.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-24 09:50:47','2019-04-24 09:50:47',2,0),(151,'Hussain Sharaf','Mr.',39,'1979-03-21',1,174,94,110,114,'AB+','House 2114, Road 4565\r\nBlock 545 Saar Central compound \r\nAl Qurrayah','39095600','39095600','hussain.sharaf@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 11:03:07','2019-04-24 11:03:07',2,0),(152,'Fatema Al Aali','Ms.',28,'1991-09-22',0,168,68,20,20,'A+','House 663 Road 1811\r\nBlock 518 Barbar','39963369','39963369','fatema.a.alaali@gmail.com','PCOS','Glucophage\r\n\r\n\r\n\r\nNote : No Tahini','1',0,0,0,0,'0','physical',0,'2019-04-24 11:26:27','2019-04-24 11:26:27',5,1),(153,'Lubna Fakhro','Ms.',34,'1989-07-12',0,115,78,82,115,'0+','Villa 1,Gate 807,Road 1419, \r\nAl Dar Compound Hamala','39443300','39443300','lubna.fakhro@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-04-24 11:37:22','2019-04-24 11:37:22',2,1),(154,'Nouf Al Gosaibi','Mrs.',37,'1981-07-16',0,162,88,103,115,'B+','Fahad Garden Villa 20 Road 203\r\nBlk.1002 Al Jasra','39673900','39673900','noufgosaibli@gmail.com','Under active thyroid glands','125 thyroxine','1',0,0,0,0,'0','mental',0,'2019-04-24 11:42:24','2019-04-24 11:42:24',2,1),(155,'Nahla Al Hasan Khalfan','Mrs.',31,'1987-08-30',0,168,87,20,20,'0','House 670, Road 3519\r\nBlock 335,Manama','39638392','39638392','nahla.khalfan@gmail.com','none','none\r\n\r\n\r\n\r\nNote : Vegan','1',0,0,0,0,'0','mental',2,'2019-04-24 12:24:01','2019-04-24 12:25:00',1,0),(156,'Maryam Abdulnaser','Ms.',25,'1998-07-25',0,159,52,63,91,'0+','House 3031, Road 2656\r\nBlock 226, Busaiteen','36232272','36232272','mrymalmahmeed@icloud.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-24 12:27:55','2019-04-24 12:27:55',1,0),(157,'Arran Fraser Dall','Mr.',39,'0001-01-01',1,100,40,20,20,'0','Villa 1157,Road 5710\r\nBlock 257,Tala Island Amwaj','36555398','36555398','arranfraser@gmail.com','none','none\r\n\r\n\r\n\r\nNote : Gluten free,no tomato sauces','1',0,0,0,0,'0','mental',2,'2019-04-24 12:33:36','2019-04-24 12:33:36',1,1),(158,'Zahra Akbar','Ms.',27,'1992-05-22',0,157,50,63,84,'A+','Office 2502, Alomoaayed Tower\r\nFloor 25, Seef','33776661','33776661','z.younis@hotmail.com','none','none\r\n\r\n\r\n\r\nNote: no shrimps, flavors of coconut','1',1,0,0,0,'0','both',2,'2019-04-24 12:37:21','2019-04-24 12:37:21',1,0),(159,'Duaa Abdulmohsen','Dr.',28,'1990-03-01',0,163,66,20,20,'B+','Salmaniya Medical Complex\r\nOutpatient clinic Dermatology Clinci No.16','3318161','33318161','Dr_Duaa@icloud.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-24 13:47:31','2019-04-24 13:47:31',1,1),(160,'Aysha Almedfa','Ms.',26,'1992-06-01',0,100,40,20,20,'0','Salmaniya Hospital ,Accident and Emergency','39045554','39045554','asyha.almedfa@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-24 13:59:12','2019-04-24 13:59:12',1,1),(161,'Nouf Ali Alkhaja','Mrs.',33,'1985-05-29',0,154,56,20,20,'B+','House 1134, Road 2934\r\nBlock 529 Al Markh Saar','39111511','39111511','noufalkhaja@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-24 14:04:14','2019-04-24 14:04:14',1,0),(162,'Hesham Moosa Hasan','Mr.',22,'1996-08-14',1,165,65,20,20,'0+','Rmasis Engineering, Entance 2,1st Floor IT Dept.\r\nBldg.1305, Road 5136, Block 951 Askar','36180064','36180064','syedhisham242@gmail.com','Have G6PD-','none\r\n\r\n\r\n\r\nNote : no beans please','0',0,1,0,0,'0','mental',2,'2019-04-24 14:40:26','2019-04-24 14:40:26',1,0),(163,'Jacqueline Bunce','Mrs.',62,'1957-01-01',0,168,78,20,20,'0','Villa 682, Hani Gradens \r\nRoad 2033 Block 520 Barbar','33324120','33324120','saradavies86@outlook.com','none','none','1',1,0,0,0,'0','mental',0,'2019-04-25 06:14:54','2019-06-20 11:07:09',2,0),(164,'Trichard Astria','Ms.',35,'1983-11-28',0,167,62,84,75,'0','Flat 41, Palm 2 Road 5710\r\nBlock 257 Tala Amwaj','39909262','39909262','astrid@gctbahrain.com','none','none','0',0,0,0,0,'0','both',0,'2019-04-25 08:35:36','2019-04-25 08:35:36',2,0),(165,'Layla Janahi','Mrs.',28,'1962-10-28',0,160,69,20,20,'0','Villa 109, Road 2302, \r\nBlock 923, East Riffa','330011331','33011331','ljanahi@viva.com.bh','BP','none','0',0,0,0,0,'0','both',0,'2019-04-25 08:38:24','2019-04-25 08:38:24',2,0),(167,'Samra Alaal','Mrs.',55,'0001-10-01',0,156,85,20,20,'0','House 2109, Bldg. 1002\r\nRoad 277 Jasra','39671198','39671198','no@mail','none','none','0',0,0,0,0,'0','both',0,'2019-04-25 08:50:51','2019-04-25 08:50:51',2,0),(168,'Mahmood Janahi','Mr.',35,'1983-05-20',1,178,105,38,20,'0','House 1059, Road 4326\r\nBlock 243 Arad Muharraq (Behind Al zayani motors)','39203030','39203030','mahmoodjanahicakes@gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-04-25 08:54:14','2019-04-25 08:54:14',2,0),(169,'Maryam  Mohamed Alkahlifa','Mrs.',27,'1991-05-06',0,170,83,20,20,'A','House 862, Road 2419\r\nBlock 924 Riffa','33033300','33033300','m_msk@hotmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-04-25 09:13:41','2019-04-25 09:13:41',2,1),(173,'Mona Abdulla Fenaish','Mrs.',54,'1964-12-06',0,154,61,20,20,'AB+','Villa 179, Road 1103, Block 711\r\nKhaleej Tubli','39661090','39661090','mona.feniash@batelco.com.bh','none','none','0',0,0,0,0,'0','both',2,'2019-04-25 10:18:47','2019-04-25 10:18:47',1,1),(174,'Muneera Alhammadi','Dr.',27,'1992-01-01',0,168,68,27.5,38.5,'0+','Salmaniya Medical Complex Dermatology\r\nOutpatient Clinic 21','38330066','38330066','muneera.alhammdai@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-25 11:51:43','2019-04-25 11:51:43',1,1),(175,'Sarah Shobber','Dr.',36,'1983-03-10',0,165,57,20,20,'o+','Flat 501, 2nd Flr. Amani Tower, Bldg.964\r\nRoad 3620, Bock 436 Seef Area','33133732','33133732','sshobber@globemedbahrain.com','Multiple sclerosis, gastritis','Tecfidera,Sirdalud, Vitamin D, Zantac','1',0,0,0,0,'0','mental',2,'2019-04-25 12:00:57','2019-04-25 12:00:57',1,1),(176,'Sabeeka Engineer','Mrs.',26,'1993-02-07',0,160,54,67,93,'0+','BCCI Tower,Bldg.519\r\nRoad 1010,Sanabis','39079075','39079075','sabeeka.engineer@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-04-25 12:08:26','2019-04-25 12:08:26',1,1),(177,'Fatema Alansari','Ms.',32,'1987-06-17',0,100,40,20,20,'000','BCCI Tower, Bldg.519, Road 1010\r\nSanabis \r\n17th Floor TAMKEEN','39795979','39795979','falansari176@gmail.com','none','none','0',0,0,0,0,'0','mental',2,'2019-04-25 12:11:54','2019-04-25 12:11:54',1,0),(178,'Yara Ishaq','Ms.',26,'1992-05-20',0,155,50,20,20,'b+','Ahli Unted Banck Bldg.2495\r\nRoad 2832, Al Seef District 428','39478766','39478766','yaraa205@hotmail.com','none','none','0',0,0,0,0,'0','mental',2,'2019-04-25 12:17:20','2019-04-25 12:17:20',1,0),(179,'Sh.Jawaher','Shaika',45,'1974-07-18',0,100,75,38,44,'AB','Road 638,House no. 1181\r\nBlock 906,West Riffa','39144374','39144374','sgtarin75@gmail.com','none','none\r\n\r\n\r\n\r\nNote : no onion.garlic and any kinds of seafood, only organic eggs,','1',0,0,0,0,'0','mental',0,'2019-04-27 13:40:11','2019-04-27 13:40:11',3,1),(180,'Faisal Engineer','Mr.',31,'1987-12-26',1,175,82,20,20,'0','Villa 469,Road 3308,Block 333\r\nUm Al Hassam','39623535','38811771','faisal@foosco.com','none','none','0',0,0,0,0,'0','mental',0,'2019-04-28 08:12:36','2019-04-28 08:12:36',2,1),(181,'Haneen Ishaq','Mrs.',43,'1975-09-13',0,162,90,20,20,'0','House 535, Road 4609\r\nBlock 946, Awali','39669719','39729993','haneen.ishaq@gmail.com','none','none','0',0,0,0,0,'0','mental',2,'2019-04-29 08:27:43','2019-04-29 08:27:43',1,1),(182,'Areej Al Noaimi','Mrs.',29,'1989-11-17',0,166,78,31,45,'0+','House 269,Road 1503\r\nBlock 915 Riffa','34506144','17773222','areej.alnoaimi@gmail.com','none','Thyroid 50 mg','0',0,0,0,0,'0','mental',0,'2019-04-29 08:34:14','2019-04-29 08:34:14',3,1),(184,'Eman Ali Qudrat','Ms.',37,'1982-01-17',0,165,73,20,20,'0','Seef Tower, Commercial Banking Seef Area','37777090','37777090','eman.qudrat@hotmail.co.uk','none','none','1',0,0,0,0,'0','mental',0,'2019-04-29 09:29:23','2019-04-29 09:29:23',1,1),(185,'Ranya AlHashimi','Mrs.',23,'1995-08-03',0,160,60,35,38,'0+','House no. 1971,Blk. 732\r\nRoad 3245, A ali','39991250','39456438','alhashimi.r@gmail.com','none','Metaformin','0',0,0,0,0,'0','mental',0,'2019-04-29 09:33:24','2019-04-29 09:33:24',3,1),(187,'Ahmed al-Qaed','Mr.',22,'1997-04-04',1,100,40,20,20,'0','House no.2408, Road 2437\r\nBlock 324, Al Fateh Juffair','39611260','39611260','ahmedqaed60@hotmail.com','none','none','2',0,0,0,0,'0','both',0,'2019-05-01 06:51:56','2019-05-01 06:51:56',5,1),(188,'Samar Hasan Matar','Ms.',22,'1996-10-24',0,100,40,20,20,'0','House no.2370, Block 507,\r\nRoad 740 Maghaba Saraiya','39458844','39458844','samarmattar96@gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-05-01 06:54:19','2019-05-01 06:54:19',5,1),(189,'Kim Claassen','Ms.',26,'1992-11-30',0,182,110,20,20,'0','Office : IBN Khuldoon National School, Bldg.161,Road 4111, Block 841, Isa Town\r\nHouse : Park Lane Tower,Block 324,Road 2445,Bldg.3156 ,2nd Flr. Juffair','33094491','33459091','k.claassen@yahoo.com','none','none\r\n\r\n\r\nNote : Paleo meal','1',1,0,0,0,'0','both',2,'2019-05-02 08:48:05','2019-05-02 08:48:05',1,1),(190,'Banan Yaquby','Ms.',33,'1985-06-21',0,161,67,20,20,'0','Villa 429, Block 525\r\nRoad 2511, Saar','39442486','39442486','banan@qubygroup.com','none','none\r\n\r\nNote : no bananas, if posssible less dairy and gluten.','1',0,0,0,0,'0','mental',0,'2019-05-04 14:03:48','2019-05-04 14:03:48',2,1),(191,'Hesa Ali Jaber Al Khalifa','Mrs.',29,'1989-06-19',0,160,80,20,20,'A+','Villa 323 ,Road 411\r\nBlock 904 West Riffa','39994666','39994666','alkhalifahessa@gmail.com','asthma, eczema','seritide inhaler','1',0,0,0,0,'0','mental',0,'2019-05-09 14:43:03','2019-05-09 14:43:03',2,0),(192,'Eirini Karanitsou','Mrs.',42,'1977-10-31',1,168,63,80,100,'0','Suk Villa Compound 1452\r\nVilla # 5 Road 7732 Block 577 Janabiya','39754754','39754754','ikaranitsu@gmail.com','none','none','1',1,1,0,0,'0','both',0,'2019-05-09 14:47:49','2019-05-09 14:47:49',2,0),(193,'Sara Abul','Mrs.',37,'1981-08-06',0,158,70,20,20,'0','Villa 1 Gate 1227\r\nRoad 3228 Block 733','36787116','36787116','sarahamadabul@gmail.com','none','multivitamins & Vit D & Iron','1',0,1,0,0,'0','both',0,'2019-05-11 09:08:12','2019-05-11 09:08:12',2,0),(194,'Sayed Mohammed Naser','Mr.',36,'1982-07-18',1,172,76,46,50,'0+','Flat 96, Bldg.123\r\nRoad 3306, Um Al Hassam 333','39628666','39628666','snasaer82@gmail.com','none','omega 3 fish oils,Proxeed Plus','1',0,0,0,0,'1','mental',0,'2019-05-11 09:12:46','2019-05-11 09:12:46',2,0),(195,'Faten Al Haddad','Ms.',34,'1984-08-06',0,154,68,93,110,'0+','Villa 10,1007,Road 3221\r\nBlock 332 Mahooz','36596593','36596593','alhaddad.faten@gmail.com','none','none','1',1,0,0,0,'0','mental',0,'2019-05-11 09:16:40','2019-05-11 09:16:40',2,0),(196,'Fadia Talal Al Zain','Mrs.',32,'1986-03-22',0,165,62,73,100,'A+','Villa 12,Saha 152 Zone 67\r\nDoha Qatar','00974 55491166','0974 55491166','fadiatalzain@gmail.com','none','none','2',0,0,0,0,'0','both',0,'2019-05-11 09:24:57','2019-05-11 09:24:57',2,0),(197,'Alyaa Aljeeb','Ms.',20,'1991-01-20',0,155,51,20,20,'A+','House 2728, Road 7172\r\nBlock 571 Janabiya','39915158','39915158','alyaa.aljeeb\"gmail.com','none','none','0',0,0,0,0,'0','both',0,'2019-05-11 09:27:12','2019-05-11 09:27:12',2,0),(198,'Shayma Nurruddin','Ms.',33,'1984-04-13',0,170,65,88,105,'0','Riffa Views','39476464','39476464','snurruddin\"gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-05-11 09:32:34','2019-05-11 09:32:34',2,0),(199,'Junaid Usman','Mr.',34,'1984-11-04',1,165,87.5,109,107,'0','gate 1 Riffa Views','66686886','66686886','junaid@bfginternational.com','Crestor','High Cholesterol','1',0,0,0,0,'0','mental',0,'2019-05-11 09:36:40','2019-05-11 09:36:40',2,0),(200,'Aisha Al Bastaki','Mrs.',33,'1985-05-05',0,168,79,20,20,'B+','BBK Head office,43 Govt.Avenue\r\nManama','38888191','38888191','aisha.albastaki.5@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-05-11 09:38:49','2019-05-11 09:38:49',1,0),(201,'Lora Hase','Mrs.',49,'1969-09-14',0,170,90,20,20,'0','Worley - Gulf Hotel Executive Office\r\n12th Floor','34317811','34317811','ihase@live.com','none','none\r\n\r\n\r\n\r\nNote : Low carb options','1',0,0,0,0,'0','mental',0,'2019-05-12 07:05:28','2019-05-12 07:05:28',1,1),(202,'Hashim Karimi','Mr.',33,'1986-06-17',1,182,87,20,20,'0+','Flat 42F Capricorn Gardens\r\nGate 347 Block 565 Avenue 65\r\nJanabiyah','39637667','33377723','hashimkarimi@gmail.com','none','none','1',1,0,0,0,'0','mental',0,'2019-05-13 14:01:16','2019-05-13 14:01:16',2,1),(203,'Shaika Salah Al Qaed','Mrs.',31,'1988-06-01',0,164,90,20,20,'0','House no. 2408, Road 2437\r\nBlock 324, Juffair','39952330','3952330','shaikhasalah88@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-05-13 14:06:07','2019-05-13 14:06:07',5,1),(204,'Lora Hase','Mrs.',49,'1969-09-14',0,170,90,20,20,'0','Worley - Gulf Hotel Executive Offices\r\n12th Floor','34317811','34317811','lhase@live.com','none','none','0',0,0,0,0,'0','mental',0,'2019-05-13 14:18:01','2019-05-13 14:18:01',1,1),(205,'Naela Al Binali (yousif mufeez)','Mrs.',71,'1948-07-16',0,155,68,20,20,'A+','Bldg.94,Road 30, Block 330\r\nAbu Ghazal Avenue Zinj','36999311','39456753','yousifmufeez@gmail.com','diabetes, high blood pressure,rheumatoid arthritis','high cholesterol, minor heart condition\r\n\r\n\r\n\r\nNote : low to no sugar diet','0',0,0,0,0,'0','mental',0,'2019-05-14 07:19:05','2019-05-14 07:19:05',3,1),(206,'Safa Al Sairafi','Ms.',31,'1987-08-27',0,165,40,20,20,'0','BCCI Bldg.Road 1010\r\nBlock 410,7th Floor Tamkeen','39200680','39200680','safa.alsairi87@gmail.com','none','none','0',0,0,0,0,'0','mental',0,'2019-05-14 08:43:31','2019-05-14 08:43:31',1,0),(207,'Nouf Yateem','Ms.',27,'1990-12-24',0,160,52,68,20,'A+','House 479, Block 340, Road 4011 Juffair','37330330','37330330','nouf.yateem@gmail.com','none','Melatonin Supplements','0',0,0,0,0,'0','both',0,'2019-05-14 11:08:48','2019-05-14 11:08:48',3,1),(208,'Laura Bale','Ms.',35,'1983-08-14',0,170,63,71,91,'0','Palm 1 Apartment 6\r\nRoad 5710 Block 257 Tala Island Amwaj','36397370','3639370','l.bale@hotmail.co.uk','none','none\r\n\r\nnote: no naan','1',0,0,0,0,'0','physical',2,'2019-05-14 12:04:26','2019-05-14 12:05:50',2,1),(210,'Najla AlKhalifa','Ms.',22,'1995-11-27',0,168,66,64,100,'0+','Block 910, Road 1015\r\nHouse no.454 West Riffa','36118882','33505505','nkas1495@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-05-14 12:25:14','2019-05-14 12:25:14',3,1),(212,'Nayla Alkahlifa','Ms.',33,'1985-09-09',0,158,67,30,43,'0','House 1711,Road 4647\r\nBlock 946, Awali','36363699','36363699','nayla9@gmail.com','Hypothyrodism - Anemia','Euthyrox','0',0,0,0,0,'0','mental',2,'2019-05-16 06:42:56','2019-05-16 06:42:56',4,0),(217,'Martel Fabrice','Mr.',36,'0001-01-01',1,183,82,20,20,'0','Juffair Heights (South Tower) Appt 1405 \r\nBuilding 1101 Road 4022  Juffair','33646901','33646401','mar.fabrice@gmail.com','none','none','1',0,0,0,0,'0','mental',0,'2019-05-21 10:56:14','2019-05-21 10:56:14',2,1),(218,'Muneera Adel Aldoseri','Mrs.',29,'1989-09-20',0,156,68,20,20,'0+','House no. 1773, Road 7736\r\nBlock 577 Janabiyah','38830033','38830033','ummashael2012@gmail.com','none','Seroxat , contraception pills','0',0,0,0,0,'0','mental',0,'2019-05-21 11:03:06','2019-05-21 11:03:06',2,0),(219,'Abdulla Adel','Mr.',26,'1992-06-11',1,167,65,32,20,'AB+','Flat 11, Bldg.1676\r\nRoad 3033,Block 430 Kabbabad','39752567','39752567','abdulla.adel.abdulla@gmail.com','none','supplements,whey protein,multi vitamins & fish oil','1',0,0,0,0,'0','mental',0,'2019-05-21 11:12:36','2019-05-21 11:12:36',2,0),(220,'Hela Al Khalifa','Mrs.',35,'1984-03-27',0,172,52,20,20,'0','Block 221, House 178 Sh.Khalifa Road Avenue Busaiteen','38820803','38820803','hela327@gmail.com','none','none','1',0,0,0,1,'0','mental',0,'2019-05-25 10:12:00','2019-05-25 10:12:00',3,1),(221,'Anna Marie Dowling','Ms.',54,'1965-03-07',0,100,40,20,20,'0','Reception Area-estin Hotel City Centre','38885829','38885829','viktorijia.butenaite@marriot.com','none','none','1',0,0,0,0,'0','mental',2,'2019-05-26 14:14:51','2019-05-26 14:14:51',5,1),(222,'Hala Almoayyed','Mrs.',39,'1979-12-18',0,167,77,20,20,'0+','House no.16, Bldg.140 Block No.517\r\nRoad no. 25, Saar','39335555','39335555','hala@almoayyedcg.com','none','none\r\n\r\n\r\nNote: no nuts to be mixed with her food, but nuts alone will be ok. no arabic sweets i.e. baklava or Maámoul and no shrimps','1',0,0,0,0,'0','mental',0,'2019-05-29 07:44:04','2019-05-29 07:47:37',2,1),(223,'Etaf Youssef Chehade','Mrs.',35,'1982-01-24',0,168,94,38,47,'0','455 Essi Garden Villa 2 Road 4418\r\nBlock 441, North Sehla','36996676','36996676','etafchehade@gmail.com','hypothyroidism - hashimotos','eltroxin 200 mg','0',0,1,0,0,'0','mental',0,'2019-05-29 07:57:33','2019-05-29 07:57:33',2,1),(224,'Nariman Alkhan','Mrs.',51,'1968-01-18',0,152,94,42,49,'0','Villa 2757, Road 338, Block 1203\r\nHamad Town','39411149','39411149','narimanalkkhan@gmail.com','high cholesterol','none\r\n\r\nCalories requested : 1200\r\nNO to milk,turkey,murtadella and liver','0',0,0,0,0,'0','both',2,'2019-05-29 08:01:10','2019-05-29 08:02:36',2,0),(225,'Ameena AlJishi','Mrs.',37,'1981-07-01',0,160,60,20,20,'0+','House 1604,Road 5713, Block 257\r\nAmwaj Island','39309993','39309993','amooon.j@gmail.com','none','none','2',0,0,0,0,'0','mental',2,'2019-05-29 08:08:48','2019-05-29 08:08:48',2,1),(226,'Yara Alawadhi','Ms.',25,'1994-03-19',0,171,75,30,42,'0','Villa 2757, Road 338,\r\nBlock 1203 Hamad Town','39227007','39227007','yaralawadhi@gmail.com','high cholesterol','none\r\n\r\n\r\nNote : requested calories 1400','1',0,0,0,0,'0','mental',0,'2019-05-29 08:13:13','2019-05-29 08:13:13',2,0),(229,'Mariam Mahri','Ms.',31,'1987-09-25',0,159,66,73,75,'0+','Office :Arcapita Bldg.,5th Floor Bahrain Bay\r\nHouse :no. 151 Road 2512,Block 225 Busaiteen','37797900','37797900','maryammahri87@gmail.com','none','none\r\n\r\nNote : no cinnamon','0',0,0,0,0,'0','mental',0,'2019-05-29 08:23:15','2019-05-29 08:25:55',2,1),(230,'Manal Al Zayani','Mrs.',40,'1978-12-18',0,161,70,20,20,'A+','House 4704,Road 2863,Block 228\r\nBusaiteen, Next to Blue Mosque','36633225','36633225','manal.alzayani@fitology-bh.com','none','marveloun\r\n\r\n\r\nNote : NO cauliflower,mustard,lentils and tamarind','1',1,1,0,0,'0','physical',2,'2019-05-29 08:30:25','2019-05-29 08:33:35',2,1),(231,'Fawzi Al Gosaibi','Mr.',75,'1944-01-01',1,152,42,20,20,'0','House no.6, Road 813,\r\nBlock 577,Hamad Town','39466366','39466366','ralgosaibi@gmail.com','osteoporosis\r\n\r\n\r\nNote : ONLY LOW FAT','none','0',0,0,0,0,'0','mental',2,'2019-06-11 13:11:41','2019-06-11 13:12:22',3,1),(232,'Muneera Alkuwari','Mrs.',29,'1990-02-23',0,156,59.5,74,100,'B','House 782, Block 921 \r\nRoad 2116, East Riffa','33338806','33338806','muneerasmk@gmail.com','none','none\r\n\r\n\r\nNote : No cabbage,paprika, onions,garlic,\r\nLOW CARD , DAIRY FREE','1',0,0,0,0,'0','mental',0,'2019-06-11 13:15:59','2019-06-11 13:15:59',3,1),(233,'Mariam Alkuwari','Mrs.',31,'1988-04-13',0,165,79,76,99,'AB','House 1046, Road 1028, Block 9110\r\nWest Riffa','33133137','33133137','mskalkuwari@gmail.com','none\r\n\r\nNote: No onion,garlic,cabbage\r\nLow Carb','none','0',0,0,0,0,'0','mental',2,'2019-06-11 13:28:17','2019-06-11 13:29:46',1,1),(234,'Pakiza Abdulrahman','Ms.',37,'1981-08-28',0,164,118,20,20,'B+','EDB Office 3rd Floor\r\nArcapita Bldg.,\r\nBahrain Bay','66668068','66668068','paczie@gmail.com','none\r\n\r\n\r\n\r\nNote : No pickles,ketchup,no olives\r\nLOW CARB','none','1',0,0,0,0,'0','mental',2,'2019-06-11 13:32:11','2019-06-11 13:32:11',1,1),(235,'Dina Jamal','Mrs.',30,'1989-05-07',0,152,42,20,20,'0','Batelco Hamala -Opposite the British School','39394344','39394344','dinajamal.89@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-06-11 13:42:43','2019-06-11 13:42:43',1,1),(236,'Amal Ali Shams','Ms.',40,'1978-12-17',0,157,56,20,20,'0+','Villa 804, Road 3325\r\nBlock 733 Sanad','66600067','66600067','amal.shams@me.com','migraine\r\n\r\n\r\nNote : no raw cabbage,no raw broccoli,no raw sweet pepper,dairy free,no papaya ,no rocca leaf, no beef and no chicken','migraine medication','0',0,0,0,0,'0','both',2,'2019-06-12 06:37:02','2019-06-13 15:18:45',3,0),(237,'Hend Ali Alkhalifa','Ms.',48,'1970-10-11',0,167,88,35,48,'0+','Villa 1169, Road 2426\r\nBlock 924, West Riffa','36633366','36633366','hend.ali1@gmail.com','n.a.\r\n\r\nNote : Gluten,Dairy and wheat FREE','n.a.','1',0,0,0,0,'0','both',0,'2019-06-12 06:45:12','2019-06-12 06:45:12',3,1),(239,'Shireen Zulaikh','Mrs.',26,'1991-06-23',0,156,66,20,20,'0+','House 2266, Block 1203, Road 331\r\nHamad Town Rundabout 1 (House)\r\n\r\n9th Floor Al Zamil Tower Manama (Office)','39399669','39399669','shireen.zulaikh@gmail.com','G6PD Deficient\r\n\r\n\r\nNote : No beans,lentils and chickpeas','none','1',0,0,0,0,'0','mental',2,'2019-06-12 07:11:30','2019-06-20 12:58:27',1,0),(240,'Mirela Micic','Ms.',38,'1980-11-05',0,159,59,20,20,'B','Road 344, Block 2444,Flat 21\r\n21st Floor Juffar','34066910','34066910','mirelamicic@gmail.com','none\r\n\r\n\r\n\r\nNote: Gluten FREE','none','1',0,0,0,0,'0','both',0,'2019-06-12 07:16:40','2019-06-20 12:57:32',2,0),(241,'Sharifa Almahmeed','Mrs.',25,'1992-12-31',0,160,54,20,20,'A+','Office : Al Zamil Tower\r\n9th Floor Manama','33308800','33308800','sharifa.khalifa@gmail.com','none','none','0',0,0,0,0,'0','mental',2,'2019-06-12 07:21:32','2019-06-20 12:56:53',1,0),(242,'Mohamed Juma','Mr.',31,'1987-04-16',1,168,67,86,90,'A+','Villa 451,Road 2514\r\nBlock 25 Busaiteen','39977797','39977797','mkjuma87@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-06-12 07:25:38','2019-06-20 12:51:52',3,0),(243,'Reem Salman Aabed','Mrs.',32,'1987-05-06',0,161,65,88,105,'A+','House 3930, Road 917 Block 809\r\nIsa Town','38380339','38380339','raabed87@gmail.com','G6PD deficiency\r\n\r\n\r\nNote : NO beans, no seafood except Fish','none','1',0,0,0,0,'0','mental',2,'2019-06-12 07:30:52','2019-06-20 12:51:21',3,0),(244,'Noor Maher Abul','Mrs.',25,'1994-04-12',0,162,62,28,20,'A+','House no. 3405A Road 752\r\nBlock 507 Maqabah','33000880','33000880','nour.abul4@gmail.com','None\r\n\r\n\r\nNote : Feta Cheese , no corn','none','1',0,0,0,0,'0','both',0,'2019-06-12 13:46:44','2019-06-20 12:49:21',3,0),(245,'Andrew Ridgeway','Mr.',40,'1978-09-22',1,180,78,34,35,'0+','Flat 41, Palm 2 Tala Island\r\nRoad 5710 Blk. 257','38789190','38789190','ridgy666@msn.com','none\r\n\r\n\r\nNote : No seafood and mushroom','none','1',1,1,0,0,'0','both',2,'2019-06-12 14:20:17','2019-06-20 12:48:46',2,0),(246,'Huda AlKooheji','Mrs.',36,'1983-02-24',0,166,72,20,20,'A+','Villa 3053, Block 934\r\nAvenue 34, West Riffa','66363666','66369666','huda_kooheji@hotmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-06-12 14:25:50','2019-06-20 12:48:13',2,0),(247,'Sara Faraj','Mrs.',27,'1991-10-31',1,159,56,85,90,'0','Villa 451. Road 2514\r\nBlok 225, Busaiteen','36319916','36319916','sarafaraj19911@gmail.com','none','none','1',0,0,0,0,'0','mental',2,'2019-06-12 14:29:51','2019-06-20 12:47:34',3,0),(248,'Maricris Constantino','Ms.',40,'1979-03-03',0,156,68,20,20,'0+','House no. 2429, Road 4053,\r\nBlock 740 A aali','66337772','66337772','maricris_constantino@yahoo.com','Hypertension\r\n\r\nNote : no milk,cauliflower,cabbage,brocolli','Fertility Vitamins','1',0,0,0,0,'0','both',0,'2019-06-12 14:35:54','2019-06-20 12:37:34',2,0),(250,'Ahmed Al Rayes','Mr.',26,'1993-01-02',1,172,70,20,20,'B+','Villa 539, Road 5707,\r\nBlock 257 Amwaj','39817171','39817171','afareedalrayes@gmail.om','none\r\n\r\n\r\n\r\nNOTE : NO BEANS','NONE','1',0,0,0,0,'0','mental',0,'2019-06-13 10:21:54','2019-06-20 13:06:28',2,0),(251,'Sameera Al Bitar','Mrs.',29,'1990-02-21',0,175,62,20,20,'A+','Office no.102,10th Floor \r\nAl Zamil Tower Manama','36615661','36615661','albitar@gmail.com','Stomach infection\r\n\r\n\r\n\r\nNote : Vegetarian Meal','Nexium','2',0,0,0,0,'0','both',2,'2019-06-13 12:01:50','2019-06-20 12:30:05',13,0),(252,'Mariam Abdulrahman Alkhalifa','Mrs.',28,'1990-08-19',0,161,65,81,112,'A+','Villa 6, Bldg.224\r\nRoad 2207 Block 922\r\nNorth Riffa','32200222','32200222','mariam.a.alkhalifa@gmail.com','under active thyroid\r\n9 MONTHS POST PARTUM\r\n\r\n\r\nNO SHRIMPS','EUTHYROX 50 mg','0',0,0,0,0,'0','none',2,'2019-06-13 12:07:24','2019-06-20 12:28:59',1,0),(253,'Rica Mae Macaraeg','Ms.',30,'1989-01-05',0,175,77,85,104,'0','Block 324, 2468 St.,\r\n5th Floor Flat no.53\r\nRiviera Plaza 2 Juffair','35459605','35459605','rica.macaraeg@ymail.com','none\r\n\r\nNote : No cumin and cardamon','none','0',0,0,0,0,'0','both',2,'2019-06-13 12:10:46','2019-06-20 12:27:46',1,0),(254,'Fatima Buasally','Ms.',27,'1992-05-06',0,160,58,73,98,'A+','House no. 1907 Road 2642\r\nBlock 226 Busaiteen','39975530','39975530','f.buasally@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-06-13 12:15:38','2019-06-20 12:23:18',3,0),(256,'Maryam Mohamed Al Khalifa','Mrs.',27,'1991-05-06',0,170,83,20,20,'A','House no. 862, Road 2419, Block 924 Riffa','33033300','33033300','m_msk@gmail.com','none\r\n\r\n\r\n\r\nNote : No eggs no fish','none','1',0,0,0,0,'0','none',0,'2019-06-13 12:21:23','2019-06-20 12:21:58',2,0),(258,'Noof Alghatam','Mrs.',35,'1984-02-14',0,165,58,20,20,'0+','House 1210, Road 5221 Block 1052 Zallaq','33771117','33771117','n.alghattam@hotmail.com','none','none','0',0,0,0,0,'0','none',0,'2019-06-13 15:12:28','2019-06-20 12:20:52',5,0),(259,'Fadia Algosaibi','Mrs.',70,'1948-01-01',0,164,75.5,20,20,'0+','Reef Island, House 54, Farouk Almoaayed\r\nHouse no. 3000','39404000','39404000','falgosaibi@gmail.com','Type 2 Diabetic\r\n\r\nNO SEAFOOD,NO RICE CRACKER ,NO SUGAR','Glucophage tablet for sugar','0',0,1,0,0,'0','none',0,'2019-06-13 15:16:58','2019-06-20 12:20:27',3,0),(260,'Latifa AlKhalifa','Mrs.',18,'2001-04-23',0,163,76,163,80,'112','House 252,Road 2008\r\nBlock 920 Riffa','36568888','36568888','latifa.alkhalifa5@gmail.com','none\r\n\r\n\r\nNote : no seafood, but OJK WITH SALMON','none','1',0,0,0,0,'0','none',0,'2019-06-15 11:55:58','2019-06-20 12:19:18',2,0),(261,'Fatima Alkhalifa','Shaikha',35,'1984-04-25',0,157,77,82,106,'A+','House 447, Road 1009 West Riffa','39610222','39610222','tima254@gmail.com','none\r\n\r\n\r\nNote : NO AVOCADO,NO BEEF/NO LAMB/NO FISH\r\nLOW CARB','NONE','1',0,0,0,0,'0','none',0,'2019-06-15 12:27:16','2019-06-20 12:18:44',12,0),(262,'Duaa Alaali','Ms.',23,'1995-09-03',0,169,60,69,99,'AB','House 163, Road 4603\r\nBlock 746 Al Aali','37733371','37733371','duaa.alaali@gmail.com','none','none','1',0,0,0,0,'0','none',2,'2019-06-18 08:28:27','2019-06-20 12:17:11',5,0),(263,'Amal Khalaf Jameel','Mrs.',40,'1978-12-06',0,158,66,20,20,'0+','Viva Building  Seef Area\r\n9th Floor','33011135','33011135','amalj11@hotmail.com','none\r\n\r\n\r\nNote : No Chinese and Japanese flavors\r\n Vegan meal but OK with Fish','none','1',0,0,0,0,'0','both',2,'2019-06-19 07:46:25','2019-06-20 12:16:37',1,0),(264,'Karim Haroun','Mr.',37,'1982-03-21',1,180,83,20,20,'A+','Flat 2210,22th Flr. EWA Towers,Bldg.3381\r\nBlock 428,Road 2845 Seef Area','35068600','35068600','alharoun@gmail.com','none\r\n\r\nNote : no milk','Ulcerative Colitis','1',1,1,0,0,'0','both',2,'2019-06-19 08:12:30','2019-06-20 12:15:34',4,0),(265,'Sylvia Moreta','Ms.',37,'1982-04-24',0,168,78.5,31,43,'0','Apr.no.23,Bldg.2793\r\nThe Flagship Amwaj','39421068','39421068','syldawg@gmail.com','none\r\n\r\nNote : No shellfish','none','1',1,0,0,0,'0','mental',0,'2019-06-19 08:45:37','2019-06-20 12:14:20',2,0),(266,'Yasmeen Abdul','Mrs.',27,'1992-02-22',0,168,72.5,20,20,'A+','Villa no.4,Gate 1227 Road 3228\r\nBlock 732 Aaali Venus Compound','3393929','33993929','yasmeen.abul@gmail.com','Cancer Survivor','none','1',0,0,0,0,'0','mental',0,'2019-06-19 08:55:54','2019-06-20 12:12:15',2,0),(267,'Asyha Kooheji','Ms.',28,'1991-01-31',0,162,50,20,20,'B+','Bldg.551,Road 4612 Block 346\r\nOffice no. 301 Arcapita Bldg., EDB','33377744','33377744','ayshakooheji.31@gmail.com','none\r\n\r\n\r\n\r\nNote : NO TOFU','none','1',0,0,0,0,'0','none',2,'2019-06-19 09:05:07','2019-06-20 12:08:56',1,0),(268,'Fajer Alpachachi','Ms.',33,'1986-08-18',0,179,75,20,20,'0+','Arcapita Bldg.\r\n3rd floor Bahrain Bay','66333339','66333339','fajer.alpachachi@bahrainedb.com','none','none','0',0,0,0,0,'0','mental',2,'2019-06-19 09:10:10','2019-06-20 12:02:04',1,0),(269,'Bayan Abdulla Ishaq','Ms.',24,'1994-12-03',0,170,41,20,20,'B+','Bahrain TV Main Gate\r\nBlock 840, Al Esteglal Highway Isa Town','39468820','39468820','bayan.abdulla@gmail.com','none\r\n\r\n\r\nNote : no chicken','none','1',0,0,0,0,'0','none',2,'2019-06-19 09:29:13','2019-06-20 12:01:39',1,0),(270,'Jehan Jalal','Ms.',34,'1984-07-18',0,170,70,20,20,'0+','Road 3621,Bldg.1042,Block 436\r\nAl Saffar Bldg.','36638995','36638995','jehan.jalal182717@gmail.com','none','none','0',0,0,0,0,'0','both',0,'2019-06-19 09:39:07','2019-06-20 12:01:01',1,0),(271,'Suha Al Hazeem','Ms.',49,'0001-01-01',0,165,61,74,98,'AB','Viva Tower,Block 428\r\nSeef Area , 5th Floor','33011262','33011262','suha.alhazeem@gmail.com','none\r\n\r\n\r\nNote : no tomato, no coconut, salmon fish ok but NO SHRIMP','none','1',0,0,0,0,'0','both',0,'2019-06-19 09:45:06','2019-06-20 12:00:34',1,0),(272,'Marwa Alawi','Ms.',26,'1992-10-23',0,158,55,20,20,'O','British Council  AMA Bldg.,\r\n146 Sh.Salman Highway Salmaniya','33393130','33393130','m.alawi@live.com','none','none','1',0,0,0,0,'0','mental',2,'2019-06-19 10:19:11','2019-06-20 11:59:36',1,0),(273,'Nada Tarada','Ms.',31,'2019-06-16',0,163,84,32,20,'B+','House no. 3213, Road 2182,\r\nBlock 721 Jid Ali','39770799','39770799','nada.tarradah@gmail.com','none\r\n\r\n\r\nNote : No seafood , No cauliflower','none','1',0,0,0,0,'0','mental',0,'2019-06-19 12:23:55','2019-06-20 11:59:48',2,0),(274,'Mayas Baluch','Ms.',39,'1980-08-07',0,155,57,78,100,'0','Gate 1 , Oasis .,Road 4303,\r\nBlock 943, Villa0-76 Riffa Views','36180666','36180666','mayas.bal@gmail.com','none\r\n\r\n\r\nNote : No bellpepper (capsicum) , no spicy','none','1',0,0,0,0,'0','both',0,'2019-06-20 09:25:02','2019-06-20 11:58:57',2,0),(277,'Nayla Abdulla Alnoami','Mrs.',36,'1982-09-18',0,158,88,20,20,'0','Villa 2241, Road 1048,\r\nBlock 910 West Riffa','39996667','39996667','nayla.abdulla@gmail.com','none','none','1',0,0,0,0,'0','both',0,'2019-06-20 10:17:35','2019-06-20 12:21:14',2,0),(279,'Hamad Alkhalifa','Mr.',22,'1997-02-07',1,172,165,20,20,'0+','House 252, Road 2008 Block 920\r\nJary Al Shaikh Riffa','36567777','36567777','hamad@alkhalifa.me','none','none','1',0,0,0,0,'0','both',0,'2019-06-20 12:28:39','2019-06-20 12:28:39',3,0),(280,'Abraham Madrid','Mr.',35,'1983-10-26',1,170,190,20,91,'0+','The Flagship Amwaj, Apr.23,Bldg.2793,\r\nRoad 5722 Amwaj 0257','38885160','38885160','abemadrid99@gmail.com','none','none','1',0,0,0,0,'0','both',2,'2019-06-20 13:10:48','2019-06-20 13:10:48',3,0),(281,'Hisham Al Kooheji','Mr.',32,'1986-11-14',1,174,79,31,20,'0+','House no.1324, Road 2527,\r\nBlock 525 Saar','36266000','36266000','hishamyk@gmail.com','none','blood pressure pill,aspirin and for cholesterol','1',0,0,0,0,'0','mental',0,'2019-06-20 13:13:36','2019-06-20 13:13:36',3,0),(282,'Amal Al Aali','Mrs.',39,'1980-07-27',0,175,74,29,43,'B+','House 1784 Road 4042\r\nBlock 740 Aaali','39442728','39442728','aaalaali@gmail.com','IBS','probiotics','1',0,0,0,0,'0','both',0,'2019-06-20 13:17:48','2019-06-20 13:35:12',12,0),(283,'Dalal Ali Safar','Mrs.',35,'1983-08-17',0,168,83,41,44,'B-','House 620, Road 3819\r\nBlock 338 Adliya','39777987','39777987','dalalsafar@gmail.com','none','none','0',0,0,0,0,'0','both',0,'2019-06-20 14:21:18','2019-06-20 14:21:18',5,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_allergic_ingredient_types`
--

DROP TABLE IF EXISTS `customers_allergic_ingredient_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_allergic_ingredient_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ingredient_type_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_allergic_ingredient_types_ingredient_type_id_foreign` (`ingredient_type_id`),
  KEY `customers_allergic_ingredient_types_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customers_allergic_ingredient_types_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customers_allergic_ingredient_types_ingredient_type_id_foreign` FOREIGN KEY (`ingredient_type_id`) REFERENCES `ingredient_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_allergic_ingredient_types`
--

LOCK TABLES `customers_allergic_ingredient_types` WRITE;
/*!40000 ALTER TABLE `customers_allergic_ingredient_types` DISABLE KEYS */;
INSERT INTO `customers_allergic_ingredient_types` VALUES (2,4,152,'2019-04-24 11:26:39','2019-04-24 11:26:39'),(3,21,168,'2019-04-25 08:55:56','2019-04-25 08:55:56'),(4,17,168,'2019-04-25 08:56:09','2019-04-25 08:56:09'),(5,14,168,'2019-04-25 08:56:49','2019-04-25 08:56:49'),(6,22,168,'2019-04-25 08:56:58','2019-04-25 08:56:58'),(8,22,115,'2019-04-25 09:01:10','2019-04-25 09:01:10'),(9,17,169,'2019-04-25 09:14:17','2019-04-25 09:14:17'),(10,16,88,'2019-04-25 09:18:35','2019-04-25 09:18:35'),(11,14,173,'2019-04-25 10:19:16','2019-04-25 10:19:16'),(12,16,173,'2019-04-25 10:19:26','2019-04-25 10:19:26'),(13,21,173,'2019-04-25 10:19:30','2019-04-25 10:19:30'),(15,4,175,'2019-04-25 12:01:36','2019-04-25 12:01:36'),(16,14,178,'2019-04-25 12:18:19','2019-04-25 12:18:19'),(17,21,178,'2019-04-25 12:18:25','2019-04-25 12:18:25'),(18,17,179,'2019-04-27 13:40:35','2019-04-27 13:40:35'),(19,15,179,'2019-04-27 13:41:33','2019-04-27 13:41:33'),(20,4,182,'2019-04-29 08:44:40','2019-04-29 08:44:40'),(21,22,182,'2019-04-29 08:44:45','2019-04-29 08:44:45'),(22,4,185,'2019-04-29 09:33:50','2019-04-29 09:33:50'),(23,7,189,'2019-05-02 08:48:53','2019-05-02 08:48:53'),(24,4,190,'2019-05-04 14:04:04','2019-05-04 14:04:04'),(25,24,193,'2019-05-11 09:08:51','2019-05-11 09:08:51'),(26,7,193,'2019-05-11 09:09:08','2019-05-11 09:09:08'),(27,17,194,'2019-05-11 09:13:20','2019-05-11 09:13:20'),(28,4,208,'2019-05-14 12:04:43','2019-05-14 12:04:43'),(29,4,210,'2019-05-14 12:25:37','2019-05-14 12:25:37'),(30,17,212,'2019-05-16 06:43:17','2019-05-16 06:43:17'),(31,17,219,'2019-05-21 11:12:58','2019-05-21 11:12:58'),(32,15,220,'2019-05-25 10:12:14','2019-05-25 10:12:14'),(33,13,222,'2019-05-29 07:44:29','2019-05-29 07:44:29'),(34,22,229,'2019-05-29 08:25:03','2019-05-29 08:25:03'),(35,16,236,'2019-06-12 06:39:45','2019-06-12 06:39:45'),(36,4,237,'2019-06-12 06:45:26','2019-06-12 06:45:26'),(37,24,237,'2019-06-12 06:45:38','2019-06-12 06:45:38'),(38,24,240,'2019-06-12 07:17:05','2019-06-12 07:17:05'),(39,17,243,'2019-06-12 07:31:40','2019-06-12 07:31:40'),(40,18,244,'2019-06-12 14:14:31','2019-06-12 14:14:31'),(41,17,245,'2019-06-12 14:20:38','2019-06-12 14:20:38'),(43,17,259,'2019-06-13 15:17:14','2019-06-13 15:17:14'),(45,17,260,'2019-06-15 11:56:15','2019-06-15 11:56:15'),(46,14,261,'2019-06-15 12:27:48','2019-06-15 12:27:48'),(47,15,261,'2019-06-15 12:27:50','2019-06-15 12:27:50'),(48,21,261,'2019-06-15 12:27:56','2019-06-15 12:27:56'),(49,21,263,'2019-06-19 07:47:02','2019-06-19 07:47:02'),(50,22,263,'2019-06-19 07:47:06','2019-06-19 07:47:06'),(51,24,263,'2019-06-19 07:47:07','2019-06-19 07:47:07'),(52,15,266,'2019-06-19 08:56:25','2019-06-19 08:56:25'),(53,20,267,'2019-06-19 09:05:24','2019-06-19 09:05:24'),(54,17,272,'2019-06-19 10:23:38','2019-06-19 10:23:38'),(55,17,273,'2019-06-19 12:24:21','2019-06-19 12:24:21'),(56,16,269,'2019-06-20 12:01:27','2019-06-20 12:01:27'),(58,17,265,'2019-06-20 12:14:04','2019-06-20 12:14:04'),(59,22,256,'2019-06-20 12:21:45','2019-06-20 12:21:45'),(60,15,256,'2019-06-20 12:21:49','2019-06-20 12:21:49'),(62,4,282,'2019-06-20 13:32:33','2019-06-20 13:32:33'),(63,19,119,'2019-06-20 14:08:25','2019-06-20 14:08:25');
/*!40000 ALTER TABLE `customers_allergic_ingredient_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_allergic_ingredients`
--

DROP TABLE IF EXISTS `customers_allergic_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_allergic_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `ingredient_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_allergic_ingredients_customer_id_foreign` (`customer_id`),
  KEY `customers_allergic_ingredients_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `customers_allergic_ingredients_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customers_allergic_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_allergic_ingredients`
--

LOCK TABLES `customers_allergic_ingredients` WRITE;
/*!40000 ALTER TABLE `customers_allergic_ingredients` DISABLE KEYS */;
INSERT INTO `customers_allergic_ingredients` VALUES (5,9,43,'2019-04-06 13:50:26','2019-04-06 13:50:26'),(6,9,42,'2019-04-06 13:50:26','2019-04-06 13:50:26'),(7,9,44,'2019-04-06 13:50:26','2019-04-06 13:50:26'),(8,9,7,'2019-04-06 13:50:26','2019-04-06 13:50:26'),(10,33,8,'2019-04-08 12:15:38','2019-04-08 12:15:38'),(11,33,6,'2019-04-08 12:15:38','2019-04-08 12:15:38'),(12,33,9,'2019-04-08 12:15:38','2019-04-08 12:15:38'),(13,34,2,'2019-04-08 13:03:21','2019-04-08 13:03:21'),(14,70,4,'2019-04-11 13:47:24','2019-04-11 13:47:24'),(15,70,5,'2019-04-11 13:47:24','2019-04-11 13:47:24'),(16,70,119,'2019-04-11 13:47:24','2019-04-11 13:47:24'),(17,73,50,'2019-04-13 06:40:31','2019-04-13 06:40:31'),(18,73,49,'2019-04-13 06:40:31','2019-04-13 06:40:31'),(19,76,75,'2019-04-15 06:45:31','2019-04-15 06:45:31'),(20,76,76,'2019-04-15 06:45:31','2019-04-15 06:45:31'),(21,76,95,'2019-04-15 06:45:31','2019-04-15 06:45:31'),(22,101,75,'2019-04-15 13:27:02','2019-04-15 13:27:02'),(23,149,7,'2019-04-24 09:46:23','2019-04-24 09:46:23'),(24,168,49,'2019-04-25 08:56:30','2019-04-25 08:56:30'),(26,115,57,'2019-04-25 08:59:30','2019-04-25 08:59:30'),(27,115,3,'2019-04-25 08:59:58','2019-04-25 08:59:58'),(28,88,1,'2019-04-25 09:18:16','2019-04-25 09:18:16'),(29,174,31,'2019-04-25 11:52:14','2019-04-25 11:52:14'),(30,175,73,'2019-04-25 12:01:21','2019-04-25 12:01:21'),(31,175,67,'2019-04-25 12:01:24','2019-04-25 12:01:24'),(32,179,31,'2019-04-27 13:40:58','2019-04-27 13:40:58'),(33,189,70,'2019-05-02 08:48:39','2019-05-02 08:48:39'),(34,195,6,'2019-05-11 09:16:56','2019-05-11 09:16:56'),(35,207,62,'2019-05-14 11:09:55','2019-05-14 11:09:55'),(36,207,97,'2019-05-14 11:10:36','2019-05-14 11:10:36'),(37,208,37,'2019-05-14 12:04:56','2019-05-14 12:04:56'),(38,229,30,'2019-05-29 08:23:45','2019-05-29 08:23:45'),(40,229,110,'2019-05-29 08:24:04','2019-05-29 08:24:04'),(41,229,29,'2019-05-29 08:24:11','2019-05-29 08:24:11'),(42,229,79,'2019-05-29 08:24:38','2019-05-29 08:24:38'),(43,230,123,'2019-05-29 08:31:11','2019-05-29 08:31:11'),(44,230,44,'2019-05-29 08:31:25','2019-05-29 08:31:25'),(45,230,43,'2019-05-29 08:31:26','2019-05-29 08:31:26'),(46,232,45,'2019-06-11 13:18:21','2019-06-11 13:18:21'),(47,233,45,'2019-06-11 13:28:51','2019-06-11 13:28:51'),(48,234,130,'2019-06-11 13:32:43','2019-06-11 13:32:43'),(49,236,4,'2019-06-12 06:39:38','2019-06-12 06:39:38'),(50,236,18,'2019-06-12 06:40:08','2019-06-12 06:40:08'),(51,236,33,'2019-06-12 06:40:13','2019-06-12 06:40:13'),(52,236,34,'2019-06-12 06:40:14','2019-06-12 06:40:14'),(53,236,35,'2019-06-12 06:40:17','2019-06-12 06:40:17'),(54,236,64,'2019-06-12 06:40:46','2019-06-12 06:40:46'),(56,27,73,'2019-06-15 11:59:00','2019-06-15 11:59:00'),(57,271,29,'2019-06-19 10:10:19','2019-06-19 10:10:19'),(58,271,135,'2019-06-19 10:10:32','2019-06-19 10:10:32'),(60,273,123,'2019-06-19 12:24:40','2019-06-19 12:24:40'),(61,274,33,'2019-06-20 09:25:33','2019-06-20 09:25:33'),(62,274,34,'2019-06-20 09:25:34','2019-06-20 09:25:34'),(63,274,35,'2019-06-20 09:25:35','2019-06-20 09:25:35'),(64,119,80,'2019-06-20 14:08:10','2019-06-20 14:08:10');
/*!40000 ALTER TABLE `customers_allergic_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(14,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(23,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(24,4,'name','text','Name',1,1,1,1,1,1,'{}',2),(25,4,'protein','text','Protein',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',3),(26,4,'fat','text','Fat',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',4),(27,4,'carbohydrates','text','Carbohydrates',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',5),(28,4,'calories','text','Calories',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',6),(29,4,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',8),(30,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(31,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,5,'name','text','Name',1,1,1,1,1,1,'{}',2),(33,5,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(34,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(35,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(36,6,'name','text','Name',1,1,1,1,1,1,'{}',3),(37,6,'kitchen_id','select_dropdown','Kitchen Id',1,1,1,1,1,1,'{}',2),(38,6,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',5),(39,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(40,6,'meal_belongsto_kitchen_relationship','relationship','Kitchen',0,1,1,1,1,1,'{\"model\":\"App\\\\Kitchen\",\"table\":\"kitchens\",\"type\":\"belongsTo\",\"column\":\"kitchen_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(41,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(42,7,'startdate','date','Start date',1,1,1,1,1,1,'{\"format\":\"%d-%m-%Y\"}',3),(43,7,'enddate','date','End date',1,1,1,1,1,1,'{\"format\":\"%d-%m-%Y\"}',4),(44,7,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',5),(45,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(46,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(47,8,'name','text','Name',1,1,1,1,1,1,'{}',2),(48,8,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(49,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(50,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(51,10,'fullname','text','Fullname',1,1,1,1,1,1,'{}',3),(52,10,'title','text','Title',1,1,1,1,1,1,'{}',4),(53,10,'age','text','Age',1,1,1,1,1,1,'{}',5),(54,10,'birthdate','date','Birthdate',1,1,1,1,1,1,'{}',6),(55,10,'gender','select_dropdown','Gender',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}',7),(56,10,'height','text','Height',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:100\"}}',8),(57,10,'weight','text','Weight',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:40\"}}',9),(58,10,'waist_measurements','text','Waist Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:20\"}}',10),(59,10,'hip_measurements','text','Hip Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric|min:20\"}}',11),(60,10,'blood_type','text','Blood Type',1,1,1,1,1,1,'{}',12),(61,10,'address','text_area','Address',1,0,1,1,1,1,'{}',13),(62,10,'mobile','text','Mobile',1,1,1,1,1,1,'{}',14),(63,10,'telephone','text','Telephone',1,1,1,1,1,1,'{}',15),(64,10,'email','text','Email',1,1,1,1,1,1,'{}',16),(65,10,'medical_history','text_area','Medical History',1,0,1,1,1,1,'{}',17),(66,10,'present_medication','text_area','Present Medication',1,0,1,1,1,1,'{}',18),(67,10,'exercise_frequency','select_dropdown','Exercise Frequency',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Sedentary or light activity\",\"1\":\"Active or moderately active\",\"2\":\"Vigorously active\"}}',19),(68,10,'alchohol','select_dropdown','Alchohol',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',20),(69,10,'smoke','select_dropdown','Smoke',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',21),(70,10,'pregnancy','select_dropdown','Pregnancy',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',22),(71,10,'breastfeeding','select_dropdown','Breastfeeding',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',23),(72,10,'vaccinations','select_dropdown','Vaccinations',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',24),(73,10,'worktype','text','Worktype',1,1,1,1,1,1,'{}',25),(74,10,'weightchange','select_dropdown','Weightchange',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Need to Lose Weight\",\"1\":\"Need to Gain Weight\",\"2\":\"Maintain\"}}',26),(75,10,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',27),(76,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',28),(77,10,'plan_id','text','Plan Id',1,1,1,1,1,1,'{}',2),(78,10,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Deactived\",\"1\":\"Activated\"}}',29),(79,10,'customer_belongsto_plan_relationship','relationship','Plan',0,1,1,1,1,1,'{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"belongsTo\",\"column\":\"plan_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',30),(80,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(81,11,'name','text','Name',1,1,1,1,1,1,'{}',2),(82,11,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',3),(83,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(89,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(90,13,'name','text','Name',1,1,1,1,1,1,'{}',2),(91,13,'calories_percentage','number','Calories Percentage %',1,1,1,1,1,1,'{}',3),(92,13,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',4),(93,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(94,6,'meal_belongsto_meal_type_relationship','relationship','Meal Type',0,1,1,1,1,1,'{\"model\":\"App\\\\MealType\",\"table\":\"meal_types\",\"type\":\"belongsTo\",\"column\":\"meal_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(95,6,'meal_type_id','select_dropdown','Meal Type Id',1,1,1,1,1,1,'{}',4),(96,7,'name','text','Name',1,1,1,1,1,1,'{}',2),(97,14,'id','text','Id',1,0,0,0,0,0,'{}',1),(98,14,'customer_id','text','Customer Id',1,1,1,1,1,1,'{}',2),(99,14,'week_meal_id','text','Week Meal Id',1,1,1,1,1,1,'{}',3),(100,14,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',4),(101,14,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(102,6,'total_calories','number','Total Calories',0,1,1,0,0,1,'{}',9),(103,4,'ingredient_belongsto_ingredient_type_relationship','relationship','Ingredient Type',0,1,1,1,1,1,'{\"model\":\"App\\\\IngredientType\",\"table\":\"ingredient_types\",\"type\":\"belongsTo\",\"column\":\"ingredient_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"additional_ingredients\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(104,4,'ingredient_type_id','text','Ingredient Type Id',0,1,1,1,1,1,'{}',7),(105,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(106,15,'name','text','Name',1,1,1,1,1,1,'{}',2),(107,15,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(108,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(109,15,'kitchen_id','select_dropdown','Kitchen',0,1,1,1,1,1,'{}',2),(110,15,'ingredient_type_belongsto_kitchen_relationship','relationship','kitchens',0,1,1,1,1,1,'{\"model\":\"App\\\\Kitchen\",\"table\":\"kitchens\",\"type\":\"belongsTo\",\"column\":\"kitchen_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"additional_ingredients\",\"pivot\":\"0\",\"taggable\":null}',5),(111,14,'total_calories','text','Total Calories',0,1,1,1,1,1,'{}',6),(112,14,'cooked','number','Cooked',1,1,1,1,1,1,'{}',10),(113,14,'total_fats','number','Total Fats',1,1,1,1,1,1,'{}',7),(114,14,'total_proteins','number','Total Proteins',1,1,1,1,1,1,'{}',9),(115,14,'total_carbs','number','Total Carbs',1,1,1,1,1,1,'{}',8),(116,6,'custom','select_dropdown','Custom',1,0,0,0,0,0,'{\"default\":\"0\",\"options\":{\"0\":\"Normal\",\"1\":\"Custom Recipes Meal\"}}',13),(117,6,'total_fats','number','Total Fats',1,1,1,0,0,1,'{}',10),(118,6,'total_proteins','number','Total Proteins',1,1,1,0,0,1,'{}',12),(119,6,'total_carbs','number','Total Carbs',1,1,1,0,0,1,'{}',11);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(4,'ingredients','ingredients','Ingredient','Ingredients',NULL,'App\\Ingredient',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:14:49','2019-02-13 06:43:21'),(5,'kitchens','kitchens','Kitchen','Kitchens',NULL,'App\\Kitchen',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:16:46','2019-01-14 09:54:01'),(6,'meals','meals','Meal','Meals',NULL,'App\\Meal',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:17:08','2019-03-14 08:37:02'),(7,'weeks','weeks','Week','Weeks',NULL,'App\\Week',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:29','2019-01-16 09:25:50'),(8,'plans','plans','Plan','Plans',NULL,'App\\Plan',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:41','2019-01-14 09:54:11'),(9,'meal_category','meal-category','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:57','2019-01-09 12:19:57'),(10,'customers','customers','Customer','Customers',NULL,'App\\Customer',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:34:55','2019-04-21 11:27:09'),(11,'meal_categories','meal-categories','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 13:11:33','2019-01-09 13:11:33'),(13,'meal_types','meal-types','Meal Type','Meal Types','voyager-backpack','App\\MealType',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-15 12:19:42','2019-01-15 12:19:42'),(14,'customer_meals','customer-meals','Customer Meal','Customer Meals',NULL,'App\\CustomerMeal',NULL,NULL,'Customers Meals List',1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-22 05:42:21','2019-03-14 07:08:29'),(15,'ingredient_types','ingredient-types','Ingredient Type','Ingredient Types',NULL,'App\\IngredientType',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-02-13 06:39:58','2019-03-04 08:15:10');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_meal`
--

DROP TABLE IF EXISTS `ingredient_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_meal` (
  `ingredient_id` int(10) unsigned NOT NULL,
  `meal_id` int(10) unsigned NOT NULL,
  `amount` double NOT NULL,
  `removable` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ingredient_id`,`meal_id`),
  KEY `ingredient_meal_ingredient_id_index` (`ingredient_id`),
  KEY `ingredient_meal_meal_id_index` (`meal_id`),
  CONSTRAINT `ingredient_meal_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ingredient_meal_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_meal`
--

LOCK TABLES `ingredient_meal` WRITE;
/*!40000 ALTER TABLE `ingredient_meal` DISABLE KEYS */;
INSERT INTO `ingredient_meal` VALUES (1,497,150,0),(1,502,120,1),(1,507,150,0),(1,508,150,0),(1,513,150,0),(1,522,150,0),(2,505,200,0),(2,514,17,0),(5,500,100,0),(5,511,150,0),(6,512,150,0),(11,515,180,0),(11,516,180,0),(12,499,100,0),(13,498,100,0),(13,501,40,1),(13,509,50,0),(13,523,100,0),(14,511,70,0),(16,497,10,0),(16,498,10,0),(16,499,10,0),(16,500,10,0),(16,501,10,0),(16,502,5,0),(16,506,10,0),(16,507,10,0),(16,508,10,0),(16,509,10,0),(16,511,10,0),(16,512,15,0),(16,513,15,0),(16,522,15,0),(16,523,15,0),(18,499,25,0),(18,502,60,0),(18,507,100,0),(19,502,40,0),(23,517,35,0),(24,497,50,0),(24,498,50,1),(24,501,50,0),(24,505,50,0),(24,508,50,0),(24,509,50,0),(24,513,70,0),(26,522,10,0),(26,523,10,0),(29,500,50,0),(29,508,20,0),(29,509,20,0),(29,511,30,0),(29,513,40,0),(30,499,25,0),(31,500,10,0),(31,506,10,0),(31,507,10,0),(31,508,10,0),(31,509,10,0),(31,510,10,0),(31,511,10,0),(31,512,0,0),(31,513,15,0),(32,499,25,0),(32,501,40,1),(33,502,20,1),(33,512,10,0),(33,522,10,0),(33,523,10,0),(34,512,10,0),(34,522,10,0),(34,523,10,0),(35,512,10,0),(35,522,10,0),(35,523,10,0),(37,497,40,0),(37,498,40,1),(37,499,40,0),(37,501,40,1),(37,510,10,0),(37,522,30,0),(37,523,30,0),(41,497,50,0),(41,499,40,0),(41,501,30,0),(41,508,50,0),(41,509,50,0),(41,522,50,0),(41,523,50,0),(42,508,50,1),(42,509,50,0),(45,499,5,0),(45,500,5,0),(45,507,10,0),(45,511,5,0),(45,512,10,0),(45,513,10,0),(45,522,15,0),(45,523,20,0),(46,499,5,0),(46,507,10,0),(47,506,2,0),(48,501,80,0),(48,509,50,0),(49,506,60,0),(51,499,5,0),(51,506,10,0),(51,512,5,0),(51,513,10,0),(52,499,25,0),(53,499,5,0),(53,522,10,0),(53,523,10,0),(56,513,5,0),(57,517,30,0),(60,515,30,0),(60,516,30,0),(61,520,20,0),(62,519,100,0),(63,497,10,0),(63,498,10,0),(63,499,10,0),(63,501,10,0),(63,505,10,0),(63,508,10,0),(63,509,10,0),(65,520,50,0),(66,520,50,0),(67,520,50,0),(68,498,10,1),(68,499,3,0),(68,520,10,0),(69,518,180,0),(71,520,50,0),(71,522,0,0),(73,520,50,0),(74,497,3,0),(74,498,3,0),(74,499,5,0),(74,500,2,0),(74,501,2,0),(74,507,2,0),(74,508,2,0),(74,511,2,0),(74,512,2,0),(74,513,2,0),(74,514,0.1,0),(74,522,5,0),(74,523,5,0),(75,497,2,0),(75,498,2,0),(75,499,5,0),(75,500,2,0),(75,501,2,0),(75,507,2,0),(75,508,2,0),(75,511,2,0),(75,512,2,0),(75,513,2,0),(75,522,5,0),(75,523,5,0),(76,508,10,0),(76,509,10,0),(76,513,20,0),(76,522,20,0),(76,523,20,0),(77,499,10,0),(77,522,20,0),(77,523,20,0),(79,502,5,1),(80,517,30,0),(83,514,10,0),(87,508,15,0),(87,509,15,0),(88,507,8,0),(88,522,10,0),(88,523,10,0),(90,517,5,0),(92,500,1,0),(94,507,15,0),(95,522,10,0),(95,523,10,0),(96,510,10,0),(104,514,5,0),(116,499,2,0),(116,512,15,0),(117,512,5,0),(117,513,5,0),(120,516,10,0),(122,514,12,0),(123,499,25,0),(123,500,100,0),(123,511,100,0),(123,512,70,0),(124,499,5,0),(125,514,10,0),(135,497,20,0),(135,498,20,1),(135,499,30,0),(135,501,20,1),(135,512,15,0),(135,522,20,0),(135,523,20,0),(137,499,25,0),(137,502,80,0),(137,512,20,0),(140,506,20,0),(140,517,90,0),(141,507,15,0),(142,506,40,0),(143,506,10,0),(144,506,2,0),(145,512,1,0),(146,512,15,0),(147,512,5,0),(149,514,6,0),(150,515,100,0),(156,522,20,0),(156,523,10,0),(157,522,10,0),(157,523,10,0);
/*!40000 ALTER TABLE `ingredient_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_types`
--

DROP TABLE IF EXISTS `ingredient_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kitchen_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredient_types_kitchen_id_foreign` (`kitchen_id`),
  CONSTRAINT `ingredient_types_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_types`
--

LOCK TABLES `ingredient_types` WRITE;
/*!40000 ALTER TABLE `ingredient_types` DISABLE KEYS */;
INSERT INTO `ingredient_types` VALUES (1,'Protein','2019-03-26 17:34:55','2019-03-26 17:34:55',NULL),(2,'Carbohydrate','2019-03-26 17:35:09','2019-03-26 17:35:09',NULL),(3,'Fat','2019-03-26 17:35:16','2019-03-26 17:35:16',NULL),(4,'Dairy','2019-03-26 17:35:45','2019-03-26 17:35:45',NULL),(5,'Vegetable','2019-03-26 17:35:54','2019-03-26 17:35:54',NULL),(6,'Fruit','2019-03-26 17:36:06','2019-03-26 17:36:06',NULL),(7,'NonDairy','2019-03-26 17:36:48','2019-03-26 17:36:48',NULL),(8,'Juices','2019-03-26 17:36:56','2019-03-26 17:36:56',NULL),(9,'Nut Milks','2019-03-26 17:37:16','2019-03-26 17:37:16',NULL),(10,'Smoothies','2019-03-26 17:37:25','2019-03-26 17:37:25',NULL),(11,'Herbs, Spices & Condiments','2019-03-27 15:32:30','2019-04-01 16:20:13',5),(13,'Nuts & Seeds','2019-03-30 09:19:11','2019-04-01 16:53:41',1),(14,'Red Meat','2019-04-21 11:47:03','2019-04-21 11:47:03',2),(15,'Fish','2019-04-21 11:47:48','2019-04-21 11:47:48',2),(16,'Poultry','2019-04-21 11:48:13','2019-04-21 11:48:13',2),(17,'Seafood','2019-04-21 11:48:24','2019-04-21 11:48:24',2),(18,'Feta','2019-04-21 11:50:16','2019-04-21 11:50:16',1),(19,'Cheese','2019-04-21 11:50:25','2019-04-21 11:50:25',1),(20,'Tofu','2019-04-21 11:50:40','2019-04-21 11:50:40',1),(21,'Red Meat','2019-04-21 11:50:50','2019-04-21 11:50:50',2),(22,'Egg','2019-04-21 12:29:26','2019-04-21 12:29:26',2),(24,'Gluten','2019-04-21 12:34:43','2019-04-21 12:34:43',4);
/*!40000 ALTER TABLE `ingredient_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protein` double NOT NULL,
  `fat` double NOT NULL,
  `carbohydrates` double NOT NULL,
  `calories` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ingredient_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredients_ingredient_type_id_foreign` (`ingredient_type_id`),
  CONSTRAINT `ingredients_ingredient_type_id_foreign` FOREIGN KEY (`ingredient_type_id`) REFERENCES `ingredient_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Chicken Breast',21,0,0,102,'2019-03-26 17:38:34','2019-03-26 17:38:34',1),(2,'Egg',6.3,4.8,0,72,'2019-03-26 17:40:35','2019-03-26 17:40:35',NULL),(3,'Egg White',3.6,0.1,0.2,17,'2019-03-26 17:47:16','2019-03-26 17:47:16',1),(4,'Beef Tenderloin',26,4,0,141,'2019-03-26 17:47:51','2019-04-21 13:40:02',14),(5,'Minced Beef',21,5,0,130,'2019-03-26 17:48:25','2019-04-21 13:39:38',21),(6,'Salmon',26,6,0,170,'2019-03-26 17:49:18','2019-04-21 13:40:40',15),(7,'Shrimp',20.31,1.73,0.91,106,'2019-03-26 17:50:02','2019-03-26 17:50:02',1),(8,'Hamour',25.6,1.2,5.3,118,'2019-03-26 17:50:39','2019-04-21 13:40:23',15),(9,'Talapia',26,3,0,129,'2019-03-26 17:51:24','2019-03-26 17:51:24',1),(10,'Tofu',12.7,3.8,1.3,89,'2019-03-26 17:52:02','2019-03-26 17:52:02',1),(11,'Yoghurt Plain',4.7,1.2,7.1,58,'2019-03-26 17:52:59','2019-03-26 17:52:59',1),(12,'Brown Rice',3.6,1.3,24.3,118,'2019-03-26 17:53:31','2019-03-26 17:53:31',2),(13,'Quinoa (Cooked)',4.4,1.9,21.3,120,'2019-03-26 17:54:24','2019-03-26 17:56:14',2),(14,'Potato (Raw)',2,0,17,72,'2019-03-26 17:55:11','2019-03-26 17:55:11',2),(15,'Sweet Potato (Raw)',1.6,0,20,86,'2019-03-26 17:55:59','2019-03-26 17:55:59',2),(16,'Olive Oil',0,94.7,0,812,'2019-03-26 17:57:02','2019-03-26 17:57:02',3),(17,'Leek',0.5,0.3,14,61,'2019-03-26 17:57:32','2019-03-26 17:57:32',5),(18,'Broccoli',3.7,0.3,2.1,31,'2019-03-26 17:58:10','2019-03-26 17:58:10',5),(19,'Buckwheat Gluten Free Noodle (Uncooked)',13,3,72,365,'2019-03-27 15:05:15','2019-03-27 15:05:15',2),(20,'Biona Wholegrain Pasta (Uncooked)',12.3,2.2,65.5,350,'2019-03-27 15:06:05','2019-03-27 15:06:05',2),(21,'Barley (Cooked)',2.3,0.4,28.2,123,'2019-03-27 15:07:08','2019-04-21 14:19:28',24),(22,'Gluten Free Penne (Uncooked)',6.7,1.3,79,359,'2019-03-27 15:07:59','2019-03-27 15:07:59',2),(23,'Bobs Red Mill Gluten Free Oats (Uncooked)',14.6,7.3,66.7,396,'2019-03-27 15:08:51','2019-03-27 15:08:51',2),(24,'Avocado',2,15,3.5,175,'2019-03-27 15:09:29','2019-03-27 15:09:29',3),(25,'Green Olives',2,17,3.5,175,'2019-03-27 15:10:21','2019-03-27 15:10:21',3),(26,'Black Olives',0,16.5,6.6,165,'2019-03-27 15:10:54','2019-03-27 15:10:54',3),(27,'Coconut Oil',0,92.4,0,858,'2019-03-27 15:11:34','2019-03-27 15:11:34',3),(28,'Green Beans',0.8,0,3.3,17,'2019-03-27 15:12:30','2019-03-27 15:12:30',5),(29,'Tomatoes',0.9,0.2,3.9,18,'2019-03-27 15:13:16','2019-03-27 15:13:16',5),(30,'Zucchini',1.2,0.3,3.1,17,'2019-03-27 15:14:25','2019-03-27 15:14:25',5),(31,'Onion',1.1,0.1,9,40,'2019-03-27 15:16:11','2019-03-27 15:16:11',5),(32,'Carrot',0.9,0.2,10,41,'2019-03-27 15:16:59','2019-03-27 15:16:59',5),(33,'Red Capsicum',2,0.2,9,40,'2019-03-27 15:17:40','2019-03-27 15:17:40',5),(34,'Green Capsicum',0.8,0.2,4.6,20,'2019-03-27 15:18:09','2019-03-27 15:18:09',5),(35,'Yellow Capsicum',1,0.2,6,27,'2019-03-27 15:18:43','2019-03-27 15:18:43',5),(36,'Spinach',3,0,3.7,23,'2019-03-27 15:20:58','2019-03-27 15:20:58',5),(37,'Cucumber',0.7,0,4,16,'2019-03-27 15:21:32','2019-03-27 15:21:32',5),(38,'Celery',0.7,0.2,3,16,'2019-03-27 15:24:25','2019-03-27 15:24:25',5),(39,'Iceberg Lettuce',0.5,0.1,1.5,7,'2019-03-27 15:25:09','2019-03-27 15:25:09',5),(40,'Rocket Leaves (Jarjeer, Rucola)',3.6,0.5,1.5,29,'2019-03-27 15:26:06','2019-03-27 15:26:06',5),(41,'Mixed Lettuce Leaves',0.7,0.7,3,16,'2019-03-27 15:26:37','2019-03-27 15:26:37',5),(42,'Chickpeas',7,2.8,22.5,139,'2019-03-27 15:27:25','2019-03-27 15:27:25',5),(43,'Red Lentils',9,0.4,20.1,116,'2019-03-27 15:29:16','2019-03-27 15:29:16',5),(44,'Green Lentils',5,0.4,10.2,65,'2019-03-27 15:29:45','2019-03-27 15:29:45',5),(45,'Garlic',0,0,25,100,'2019-03-27 15:30:16','2019-03-27 15:33:33',11),(46,'Ginger',1.8,0.8,17.8,80,'2019-03-27 15:31:05','2019-03-27 15:33:19',11),(47,'Turmeric',7.9,9.9,64.9,354,'2019-03-27 15:31:58','2019-03-27 15:32:56',11),(48,'Edemame',12.7,4.2,11.3,127,'2019-03-27 15:36:15','2019-03-27 15:36:15',5),(49,'Corn',3.3,0.5,21,88,'2019-03-27 15:37:01','2019-03-27 15:37:01',5),(50,'Green Peas',8.3,0.4,12.8,105,'2019-03-27 15:37:44','2019-03-27 15:37:44',5),(51,'Parsley',3,0.8,6.3,38,'2019-03-27 15:38:23','2019-03-27 15:38:23',5),(52,'Asparagus',2.2,0.1,3.9,20,'2019-03-27 15:39:01','2019-03-27 15:39:01',5),(53,'Coriander',2.1,0.5,3.7,23,'2019-03-27 15:39:48','2019-03-27 15:39:48',11),(54,'Palm Heart',6.1,5.2,16,28,'2019-03-27 15:40:21','2019-03-27 15:40:21',5),(55,'Capers (In Brine)',0.8,0.7,2,27,'2019-03-27 15:41:05','2019-03-27 15:41:05',5),(56,'Mint Leaves',4,1,15,70,'2019-03-27 15:41:32','2019-03-27 15:41:56',5),(57,'Banana',1,0.3,21.4,83,'2019-03-27 15:43:02','2019-03-27 15:43:02',6),(58,'Red Apple',0,0,14.3,57,'2019-03-27 15:43:51','2019-03-27 15:45:52',6),(59,'Green Apple',0.3,0,14,52,'2019-03-27 15:46:38','2019-03-27 15:46:38',6),(60,'Strawberry',0.7,0.3,7.7,32,'2019-03-27 15:47:42','2019-03-27 15:47:42',6),(61,'Blueberries',0.8,0.3,14.5,60,'2019-03-27 15:48:21','2019-03-27 15:48:21',6),(62,'Mango',0.7,0.2,13.6,63,'2019-03-27 15:49:03','2019-03-27 15:49:03',6),(63,'Lemon (Juice)',0.2,0.1,3.2,10,'2019-03-27 15:51:29','2019-03-27 15:51:29',6),(64,'Papaya',1,0,10,39,'2019-03-27 15:52:24','2019-03-27 15:52:24',6),(65,'Dragon Fruit',2,2,9,60,'2019-03-27 15:53:14','2019-03-27 15:53:14',6),(66,'Watermelon',0.6,0.2,7.6,30,'2019-03-27 15:54:27','2019-03-27 15:54:27',6),(67,'Pineapple',0.5,0.1,13.1,50,'2019-03-27 15:55:50','2019-03-27 15:55:50',6),(68,'Pomegranate',1,0.3,17.2,75,'2019-03-27 15:57:38','2019-03-27 15:57:38',6),(69,'Honeydew (Green Melon)',0.5,0.1,9,36,'2019-03-27 15:58:49','2019-03-27 16:02:42',6),(70,'Yellow Melon (Cantaloupe)',0.8,0.2,8.2,34,'2019-03-27 16:00:50','2019-03-27 16:02:10',6),(71,'Orange',1,0,13,49,'2019-03-27 16:03:37','2019-03-27 16:03:37',6),(72,'Pear',0.4,0.1,15.2,57,'2019-03-27 16:04:42','2019-03-27 16:04:42',6),(73,'Kiwi',1,1,15,61,'2019-03-27 16:05:26','2019-03-27 16:05:26',6),(74,'Salt',0,0,0,0,'2019-03-27 16:26:02','2019-03-27 16:26:02',11),(75,'Pepper',10,3.3,64,64,'2019-03-27 16:27:22','2019-03-27 16:27:22',11),(76,'Lime Juice',0.4,0.1,8.8,26,'2019-03-27 16:29:19','2019-03-27 16:29:19',6),(77,'Radish',0.7,0.1,3.4,16,'2019-03-30 09:04:17','2019-03-30 09:04:17',5),(78,'Lite Soy Sauce (Kikomann)',6.8,0,6.8,68,'2019-03-30 09:05:30','2019-04-01 16:19:19',11),(79,'Sesame Seeds',17.8,50,23.3,578,'2019-03-30 09:18:47','2019-03-30 09:19:56',13),(80,'Peanuts',24.7,49.4,17.6,564,'2019-03-30 09:21:30','2019-03-30 09:21:30',13),(81,'Cashews',17.9,46.4,28.6,571,'2019-03-30 09:22:29','2019-03-30 09:22:29',13),(82,'Almonds',21.1,49.9,21.5,579,'2019-03-30 09:23:12','2019-03-30 09:23:12',13),(83,'Cocoa Powder',19,20.6,19.7,263,'2019-04-01 16:07:38','2019-04-01 16:07:38',11),(84,'Tuttorusso (Crushed Tomato)',1.6,0,8.2,41,'2019-04-01 16:09:25','2019-04-01 16:09:25',11),(86,'Beetroot (Fresh)',1.6,0.2,10,43,'2019-04-01 16:15:05','2019-04-01 16:15:05',5),(87,'Tahina',18,51,24,586,'2019-04-01 16:18:20','2019-04-01 16:18:20',11),(88,'Honey',0.3,0,82.6,304,'2019-04-01 16:22:07','2019-04-01 16:22:07',11),(89,'Coconut Yoghurt',1.5,23.7,3.4,229,'2019-04-01 16:23:31','2019-04-01 16:23:31',7),(90,'Dates (Pitted)',2,0.2,67.2,306,'2019-04-01 16:25:23','2019-04-01 16:25:23',6),(91,'Turmeric (Powder)',0,0,60,240,'2019-04-01 16:29:00','2019-04-01 16:29:00',11),(92,'Oregano (Powder)',9,4.28,68.9,265,'2019-04-01 16:32:20','2019-04-01 16:32:20',11),(93,'Oregano (Fresh)',9,4.3,69,265,'2019-04-01 16:35:21','2019-04-01 16:35:21',11),(94,'Tamari',13.5,0,6.8,81,'2019-04-01 16:37:19','2019-04-01 16:37:19',11),(95,'Balsamic Vinegar',0,0,67.6,271,'2019-04-01 16:39:23','2019-04-01 16:39:23',11),(96,'White Vinegar',0.5,0.4,0.2,24,'2019-04-01 16:40:49','2019-04-01 16:40:49',11),(97,'Peanut Butter',24,21,120,165,'2019-04-01 16:44:06','2019-04-01 16:44:06',11),(98,'Chia Seeds',17,31,8,447,'2019-04-01 16:52:39','2019-04-01 16:52:39',13),(99,'Walnuts',15.2,65.2,13.7,653,'2019-04-01 16:55:18','2019-04-01 16:55:18',13),(100,'Peanuts',24.7,49.4,17.6,564,'2019-04-01 16:56:30','2019-04-01 16:56:30',13),(101,'Cashew Nuts',18.2,43.8,30.1,552,'2019-04-01 16:57:50','2019-04-01 16:57:50',13),(102,'Almonds',21.1,49.9,21.5,579,'2019-04-01 16:59:06','2019-04-01 16:59:06',13),(103,'Bare Dark Chocolate',9,43,33,577,'2019-04-01 17:01:26','2019-04-01 17:01:26',11),(104,'Chocolat Stella (No Added Sugar)',9,42,34,570,'2019-04-01 17:07:15','2019-04-01 18:00:52',11),(105,'Cooking Cream',2.6,12,5.8,134,'2019-04-01 17:15:25','2019-04-01 17:15:25',4),(106,'Hellmans (Light Mayo)',0,23.3,6.7,200,'2019-04-01 17:16:35','2019-04-01 17:16:35',11),(107,'Plain White Flour',10.3,1.3,70.6,345,'2019-04-01 17:18:47','2019-04-21 14:19:06',24),(108,'Wholewheat Flour',13.8,1.6,67.5,338,'2019-04-01 17:19:51','2019-04-21 14:20:32',24),(109,'Rice Noodle',0.9,0.2,24.9,109,'2019-04-01 17:21:16','2019-04-01 17:21:16',2),(110,'Eggplant',1,0.2,6,25,'2019-04-01 17:22:39','2019-04-01 17:22:39',5),(111,'Maple Syrup',0,0,87.9,352,'2019-04-01 17:25:24','2019-04-01 17:25:24',11),(112,'Chickpea Flour',24,8,60,408,'2019-04-01 17:30:27','2019-04-01 17:30:27',2),(113,'Pine Nuts',14,68.6,4,693,'2019-04-01 17:33:37','2019-04-01 17:33:37',13),(114,'Sunflower Seeds',20.8,51.5,20,586,'2019-04-01 17:34:48','2019-04-01 17:34:48',13),(115,'Grapefruit',0.8,0.1,9.8,42,'2019-04-01 17:36:42','2019-04-01 17:36:42',6),(116,'Cumin Powder',17.8,4.8,44.2,375,'2019-04-01 17:39:39','2019-04-01 17:39:39',11),(117,'Rosemary (Fresh)',0.4,0.7,2.4,14,'2019-04-01 17:41:51','2019-04-01 17:41:51',11),(118,'Rosemary (Dried)',4.9,15.2,64.1,331,'2019-04-01 17:43:04','2019-04-01 17:43:04',11),(119,'Lamb (Lean Meat)',17.1,14.6,0,215,'2019-04-01 17:44:24','2019-06-20 11:38:32',14),(120,'Stevia',0,0,0,0,'2019-04-01 17:46:57','2019-04-01 17:46:57',11),(121,'Agave',0,0,108.2,406,'2019-04-01 17:48:23','2019-04-01 17:48:23',11),(122,'Xylitol',0,0,0,0,'2019-04-01 17:49:24','2019-04-01 17:49:24',11),(123,'Cauliflower',2,0.1,5.3,25,'2019-04-01 17:57:31','2019-04-01 17:57:31',5),(124,'Spring Onion',1.8,0.2,7.3,30,'2019-04-01 17:58:54','2019-04-01 17:58:54',5),(125,'Butter (Kerrygold)',0,32.8,0,296,'2019-04-01 18:02:29','2019-04-01 18:02:29',3),(126,'Crisco Vegetable Shortening',0,100,0,875,'2019-04-01 18:05:23','2019-04-01 18:05:23',3),(127,'Earth Balance (Vegan Butter)',0,81.8,0,727,'2019-04-01 18:07:18','2019-04-01 18:07:18',3),(128,'Green Earth',1.24,0.32,19,37,'2019-04-06 07:00:21','2019-04-06 07:00:21',8),(129,'Sweet Green',0.583,0.182,12.161,38,'2019-04-06 07:02:13','2019-04-06 07:02:13',8),(130,'pickles',0.9,0.4,2.6,17,'2019-04-08 13:52:41','2019-04-08 13:52:41',5),(131,'Mozerella',28.2,17.6,3.5,282,'2019-04-21 11:55:01','2019-04-21 11:55:01',19),(132,'Feta Cheese Lite',14.5,11.6,5.3,184,'2019-04-21 11:55:58','2019-04-21 11:55:58',18),(133,'Edam',23.3,30,0,333,'2019-04-21 11:56:49','2019-04-21 11:56:49',19),(134,'Gruyere',29.8,32.3,0.4,413,'2019-04-21 11:57:46','2019-04-21 11:57:46',19),(135,'Cherry Tomatoes',0.9,0.2,2,18,'2019-04-21 12:24:57','2019-04-21 12:24:57',5),(136,'Sumac',0,0,20.3,203,'2019-04-21 12:26:32','2019-04-21 12:26:32',11),(137,'Mushroom',2.4,0,3.5,24,'2019-04-21 12:27:22','2019-04-21 12:27:22',5),(139,'Seabass',22.1,5.8,0.4,148,'2019-04-22 10:44:12','2019-04-22 10:44:12',15),(140,'Almond Milk',1.37,2.6,5.62,51,'2019-06-12 09:16:22','2019-06-12 09:16:22',9),(141,'Rice Vinegar',0,0,0.1,19,'2019-06-12 09:28:35','2019-06-20 11:33:50',11),(142,'Polenta',2,0,18,84,'2019-06-12 09:50:37','2019-06-12 09:50:37',2),(143,'Basil',0,0,0.1,19,'2019-06-12 10:05:30','2019-06-20 11:33:24',11),(144,'Paprika',14,13,54,282,'2019-06-12 10:07:40','2019-06-12 10:07:40',11),(145,'Saffron',11.4,5.8,65.3,310,'2019-06-18 09:22:20','2019-06-20 11:32:19',11),(146,'Baby Marrow',1,0,3,17,'2019-06-18 09:24:02','2019-06-18 09:24:02',5),(147,'Thyme',5.6,1.7,24.5,101,'2019-06-18 09:25:32','2019-06-20 07:54:13',11),(148,'Cocoa Powder (Cadbury Bourneville)',25.8,11,24,347,'2019-06-20 07:49:51','2019-06-20 07:51:40',11),(149,'Almond Flour',21.4,50,10.7,571,'2019-06-20 07:51:05','2019-06-20 07:51:05',13),(150,'Granola',2.1,9.4,16.4,154,'2019-06-20 10:09:50','2019-06-20 10:09:50',13),(151,'Semolina',13,1.1,73,360,'2019-06-20 11:40:56','2019-06-20 11:40:56',24),(152,'Cardamom (Ground)',10.8,6.7,68.5,311,'2019-06-20 12:26:22','2019-06-20 12:26:22',11),(153,'Red Cabbage',1.4,0.2,7.4,31,'2019-06-20 12:39:02','2019-06-20 12:39:02',5),(154,'White Cabbage',1.3,0.1,6,22,'2019-06-20 12:39:43','2019-06-20 12:39:43',5),(155,'Baby Spinach',8,0,12,80,'2019-06-20 12:40:32','2019-06-20 12:40:32',5),(156,'Cilantro',2,1,4,23,'2019-06-23 07:53:42','2019-06-23 07:53:42',11),(157,'Orange Juice',0,0,13,50,'2019-06-23 08:09:29','2019-06-23 08:09:29',8),(158,'Coconut Milk',1,20,2,188,'2019-06-23 08:41:00','2019-06-23 08:41:00',9);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchens`
--

DROP TABLE IF EXISTS `kitchens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kitchens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchens`
--

LOCK TABLES `kitchens` WRITE;
/*!40000 ALTER TABLE `kitchens` DISABLE KEYS */;
INSERT INTO `kitchens` VALUES (1,'Vegetables','2019-03-17 13:29:54','2019-03-17 13:29:54'),(2,'Meat','2019-03-26 17:43:19','2019-03-26 17:43:19'),(3,'Vegetable & Juice','2019-03-26 17:43:30','2019-03-26 17:43:48'),(4,'Baking','2019-03-26 17:43:54','2019-03-26 17:43:54'),(5,'Hot Kitchen','2019-03-27 16:35:15','2019-03-27 16:35:15');
/*!40000 ALTER TABLE `kitchens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_categories`
--

DROP TABLE IF EXISTS `meal_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meal_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_categories`
--

LOCK TABLES `meal_categories` WRITE;
/*!40000 ALTER TABLE `meal_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_types`
--

DROP TABLE IF EXISTS `meal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meal_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories_percentage` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_types`
--

LOCK TABLES `meal_types` WRITE;
/*!40000 ALTER TABLE `meal_types` DISABLE KEYS */;
INSERT INTO `meal_types` VALUES (8,'Breakfast',20,'2019-04-06 06:44:16','2019-04-06 07:50:38'),(9,'Lunch',30,'2019-04-06 06:44:26','2019-04-06 07:50:56'),(10,'Dinner',30,'2019-04-06 06:44:33','2019-04-06 07:55:02'),(11,'Snack 1',10,'2019-04-06 07:03:46','2019-04-06 07:50:19'),(12,'Snack 2',10,'2019-04-06 07:03:57','2019-04-06 07:50:25');
/*!40000 ALTER TABLE `meal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kitchen_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meal_type_id` int(10) unsigned NOT NULL,
  `total_calories` int(11) NOT NULL DEFAULT 0,
  `custom` tinyint(4) NOT NULL DEFAULT 0,
  `total_fats` int(11) NOT NULL DEFAULT 0,
  `total_proteins` int(11) NOT NULL DEFAULT 0,
  `total_carbs` int(11) NOT NULL DEFAULT 0,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meals_kitchen_id_foreign` (`kitchen_id`),
  KEY `meals_meal_type_id_foreign` (`meal_type_id`),
  CONSTRAINT `meals_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meals_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (497,'Chicken Avocado Salad',1,'2019-04-21 11:43:19','2019-04-21 13:08:03',9,342,0,17,33,7,NULL),(498,'Quinoa & Avocado Salad',1,'2019-04-21 12:00:00','2019-04-21 12:56:15',9,309,0,19,5,28,NULL),(499,'Vegetable Kebab with Saffron Rice & Sumac Salad',5,'2019-04-21 12:57:12','2019-04-21 13:05:23',9,285,0,10,9,43,NULL),(500,'Shepherds Pie',5,'2019-04-21 13:08:27','2019-04-21 13:09:08',10,139,0,5,21,2,NULL),(501,'Edamame Salad',1,'2019-04-21 13:11:51','2019-04-21 13:13:30',9,217,0,11,11,18,NULL),(502,'Mixed Vegetables with GF Noodles',5,'2019-04-22 10:49:51','2019-04-22 10:54:10',9,262,0,9,10,36,NULL),(505,'Poached Eggs with Smashed Avocado',5,'2019-06-12 06:15:42','2019-06-23 09:47:35',8,230,0,18,14,2,NULL),(506,'Corn Polenta Fritters',5,'2019-06-12 06:20:17','2019-06-16 16:30:27',8,159,0,10,2,17,NULL),(507,'Sticky Chicken with Broccoli',5,'2019-06-12 09:20:53','2019-06-16 16:30:00',9,327,0,9,38,17,NULL),(508,'Shredded Chicken Shawarma Bowl with Avocado with Tahina Dressing',5,'2019-06-16 07:18:17','2019-06-16 12:52:52',9,409,0,18,37,17,NULL),(509,'Edamame, Quinoa & Avocado Buddha Bowl with Tahina Dressing',1,'2019-06-16 07:27:56','2019-06-16 12:55:23',9,380,0,21,13,34,NULL),(510,'Vegetable Pickle',1,'2019-06-16 08:20:34','2019-06-16 08:22:02',9,8,0,0,0,1,NULL),(511,'Carb Free Shephers Pie',2,'2019-06-17 11:36:36','2019-06-17 11:45:05',9,366,0,17,35,21,NULL),(512,'Cumin Crusted Salmon with Cauliflower Puree & Herb Roasted Vegetables',5,'2019-06-18 09:03:42','2019-06-18 09:44:45',9,502,0,24,43,22,NULL),(513,'Grilled Chicken & Guacamole Salad with Tomato Salsa with Lemon & Herb Dressing',2,'2019-06-18 09:29:20','2019-06-18 09:34:14',10,436,0,25,33,13,NULL),(514,'Fudge Brownie',4,'2019-06-20 07:37:31','2019-06-20 07:45:41',11,111,0,10,3,4,NULL),(515,'Yoghurt with Strawberry Coulis & Granola',1,'2019-06-20 08:00:53','2019-06-20 10:12:27',8,268,0,11,10,31,NULL),(516,'Yoghurt with Strawberry Coulis',3,'2019-06-20 10:13:02','2019-06-20 10:13:29',8,114,0,2,8,15,NULL),(517,'Overnight Oats with Peanut Butter & Banana',3,'2019-06-20 10:14:04','2019-06-20 10:15:28',8,394,0,20,13,42,NULL),(518,'Melon',3,'2019-06-20 10:16:33','2019-06-20 10:18:24',12,65,0,0,1,16,NULL),(519,'Mango',3,'2019-06-20 10:18:48','2019-06-20 10:20:37',12,63,0,0,1,14,NULL),(520,'Exotic Fruit Salad',3,'2019-06-20 11:42:09','2019-06-20 11:44:01',12,146,0,2,3,36,NULL),(521,'\'Ala King\' Chicken & Mushroom with Mashed Potato & Mixed Seasonal Vegetables',5,'2019-06-22 07:55:09','2019-06-22 07:56:17',9,0,0,0,0,0,NULL),(522,'Cilantro Lime Marinated Chicken with Mixed Green Salad & Citrusy Dressing',5,'2019-06-22 11:46:14','2019-06-23 08:07:49',9,408,0,16,33,32,NULL),(523,'Cilantro Lime Quinoa with Mixed Green Salad & Citrusy Dressing',1,'2019-06-23 08:14:04','2019-06-23 08:29:51',9,382,0,18,5,54,NULL);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-dashboard','#000000',NULL,1,'2019-01-10 07:25:28','2019-02-12 08:43:47','voyager.dashboard','null'),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2019-01-10 07:25:28','2019-01-10 07:25:28','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2019-01-10 07:25:28','2019-01-10 07:25:28','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,14,'2019-01-10 07:25:28','2019-02-13 06:41:26',NULL,NULL),(7,1,'Database','','_self','voyager-data',NULL,5,1,'2019-01-10 07:25:28','2019-01-15 12:21:54','voyager.database.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,2,'2019-01-10 07:25:28','2019-01-15 12:21:54','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,15,'2019-01-10 07:25:28','2019-02-13 06:41:26','voyager.settings.index',NULL),(11,1,'Ingredients','','_self','voyager-params','#000000',NULL,9,'2019-01-09 12:14:50','2019-03-17 13:31:53','voyager.ingredients.index','null'),(12,1,'Kitchens','','_self','voyager-lab','#000000',NULL,4,'2019-01-09 12:16:46','2019-03-17 13:31:37','voyager.kitchens.index','null'),(13,1,'Meals','','_self','voyager-pizza','#000000',NULL,10,'2019-01-09 12:17:08','2019-02-13 06:41:26','voyager.meals.index','null'),(14,1,'Weeks','','_self','voyager-calendar','#000000',NULL,11,'2019-01-09 12:19:29','2019-02-13 06:41:26','voyager.weeks.index','null'),(15,1,'Plans','','_self','voyager-file-text','#000000',NULL,7,'2019-01-09 12:19:41','2019-03-17 13:31:51','voyager.plans.index','null'),(16,1,'Customers','','_self','voyager-group','#000000',NULL,8,'2019-01-09 12:34:55','2019-03-17 13:31:53','voyager.customers.index','null'),(19,1,'Meal Types','','_self','voyager-backpack',NULL,NULL,6,'2019-01-15 12:19:42','2019-03-17 13:31:48','voyager.meal-types.index',NULL),(20,1,'Customer Meals','','_self','voyager-hotdog','#000000',NULL,12,'2019-01-22 05:42:21','2019-02-13 06:41:26','voyager.customer-meals.index','null'),(21,1,'Kitchens Calendar','','_self','voyager-calendar','#000000',NULL,13,'2019-02-10 08:41:06','2019-02-13 06:41:26',NULL,''),(35,1,'Ingredient Types','','_self','voyager-dot-2','#000000',NULL,5,'2019-02-13 06:39:58','2019-03-17 13:31:37','voyager.ingredient-types.index','null'),(46,1,'Vegetables','','_self','voyager-dot',NULL,21,0,'2019-03-27 16:35:15','2019-03-27 16:35:15','meals_calendar','{\"kitchen_id\":1}'),(47,1,'Meat','','_self','voyager-dot',NULL,21,0,'2019-03-27 16:35:15','2019-03-27 16:35:15','meals_calendar','{\"kitchen_id\":2}'),(48,1,'Vegetable & Juice','','_self','voyager-dot',NULL,21,0,'2019-03-27 16:35:15','2019-03-27 16:35:15','meals_calendar','{\"kitchen_id\":3}'),(49,1,'Baking','','_self','voyager-dot',NULL,21,0,'2019-03-27 16:35:15','2019-03-27 16:35:15','meals_calendar','{\"kitchen_id\":4}'),(50,1,'Hot Kitchen','','_self','voyager-dot',NULL,21,0,'2019-03-27 16:35:15','2019-03-27 16:35:15','meals_calendar','{\"kitchen_id\":5}');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2019-01-10 07:25:28','2019-01-10 07:25:28');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_01_09_110215_create_customers_table',1),(24,'2019_01_09_110254_create_plans_table',1),(25,'2019_01_09_110402_add_plan_id_to_customers_table',1),(26,'2019_01_09_110546_add_status_to_customers_table',1),(27,'2019_01_09_110716_create_kitchens_table',1),(28,'2019_01_09_110824_create_ingredients_table',1),(29,'2019_01_09_110916_create_meal_categories_table',1),(30,'2019_01_09_111048_create_meals_table',1),(31,'2019_01_09_111130_create_weeks_table',1),(32,'2019_01_09_111326_create_customer_meal_pivot_table',1),(33,'2019_01_09_112036_create_ingredient_meal_pivot_table',1),(34,'2019_01_14_102833_create_plan_prohibited_ingredients_table',1),(35,'2019_01_15_081132_create_customers_allergic_ingredients_table',1),(36,'2019_01_15_121229_create_meal_types_table',1),(37,'2019_01_15_133301_add_meal_type_id_to_meals_table',1),(38,'2019_01_16_092449_add_name_to_weeks_table',1),(39,'2019_01_17_124041_create_week_meals_table',1),(40,'2019_01_17_124506_create_customer_meals_table',1),(41,'2019_01_24_061644_add_total_calories_to_meals_table',1),(42,'2019_02_03_064243_create_additional_ingredients_table',1),(43,'2019_02_04_092556_add_total_calories_to_customer_meals_table',1),(44,'2019_02_10_122311_add_cooked_to_customer_meals_table',1),(45,'2019_02_13_062734_create_ingredient_types_table',1),(46,'2019_02_13_062823_add_ingredient_type_to_ingredients_table',1),(47,'2019_02_13_072630_create_customer_disliked_ingredients',1),(48,'2019_02_13_104026_create_customer_ingredients_amount_table',1),(49,'2019_02_24_060216_add_removable_to_ingredient_meal_table',1),(50,'2019_03_03_085213_add_meal_type_id_to_customer_ingredients_amount_table',1),(51,'2019_03_04_063725_add_custom_to_meals_table',1),(52,'2019_03_04_081014_add_kitchen_id_to_ingredient_types_table',1),(53,'2019_03_05_055421_create_customer_meal_custom_amounts_table',1),(54,'2019_03_14_065526_add_total_fats_to_meals_table',1),(55,'2019_03_14_065536_add_total_proteins_to_meals_table',1),(56,'2019_03_14_065537_add_total_carbs_to_meals_table',1),(57,'2019_03_14_065539_add_total_fats_to_customer_meals_table',1),(58,'2019_03_14_065540_add_total_proteins_to_customer_meals_table',1),(59,'2019_03_14_065541_add_total_carbs_to_customer_meals_table',1),(60,'2019_04_08_104832_create_customers_allergic_ingredient_types',2),(61,'2019_04_08_105038_create_plan_prohibited_ingredient_types',2),(62,'2019_04_09_131923_make_ingredient_type_id_and_amount_nullable_in_customer_ingredients_amount_table',2),(63,'2019_04_09_132525_create_customer_program_table',2),(64,'2019_04_15_130521_add_meal_notes_to_meals_table',2),(65,'2019_04_17_104031_add_meal_notes_to_customer_meal_table',2),(66,'2019_04_17_112140_add_notes_to_customer_meals_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(2,'browse_bread',NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(3,'browse_database',NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(4,'browse_media',NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(5,'browse_compass',NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(6,'browse_menus','menus','2019-01-10 07:25:28','2019-01-10 07:25:28'),(7,'read_menus','menus','2019-01-10 07:25:28','2019-01-10 07:25:28'),(8,'edit_menus','menus','2019-01-10 07:25:28','2019-01-10 07:25:28'),(9,'add_menus','menus','2019-01-10 07:25:28','2019-01-10 07:25:28'),(10,'delete_menus','menus','2019-01-10 07:25:28','2019-01-10 07:25:28'),(11,'browse_roles','roles','2019-01-10 07:25:28','2019-01-10 07:25:28'),(12,'read_roles','roles','2019-01-10 07:25:28','2019-01-10 07:25:28'),(13,'edit_roles','roles','2019-01-10 07:25:28','2019-01-10 07:25:28'),(14,'add_roles','roles','2019-01-10 07:25:28','2019-01-10 07:25:28'),(15,'delete_roles','roles','2019-01-10 07:25:28','2019-01-10 07:25:28'),(16,'browse_users','users','2019-01-10 07:25:28','2019-01-10 07:25:28'),(17,'read_users','users','2019-01-10 07:25:28','2019-01-10 07:25:28'),(18,'edit_users','users','2019-01-10 07:25:28','2019-01-10 07:25:28'),(19,'add_users','users','2019-01-10 07:25:28','2019-01-10 07:25:28'),(20,'delete_users','users','2019-01-10 07:25:28','2019-01-10 07:25:28'),(21,'browse_settings','settings','2019-01-10 07:25:28','2019-01-10 07:25:28'),(22,'read_settings','settings','2019-01-10 07:25:28','2019-01-10 07:25:28'),(23,'edit_settings','settings','2019-01-10 07:25:28','2019-01-10 07:25:28'),(24,'add_settings','settings','2019-01-10 07:25:28','2019-01-10 07:25:28'),(25,'delete_settings','settings','2019-01-10 07:25:28','2019-01-10 07:25:28'),(27,'browse_ingredients','ingredients','2019-01-09 12:14:50','2019-01-09 12:14:50'),(28,'read_ingredients','ingredients','2019-01-09 12:14:50','2019-01-09 12:14:50'),(29,'edit_ingredients','ingredients','2019-01-09 12:14:50','2019-01-09 12:14:50'),(30,'add_ingredients','ingredients','2019-01-09 12:14:50','2019-01-09 12:14:50'),(31,'delete_ingredients','ingredients','2019-01-09 12:14:50','2019-01-09 12:14:50'),(32,'browse_kitchens','kitchens','2019-01-09 12:16:46','2019-01-09 12:16:46'),(33,'read_kitchens','kitchens','2019-01-09 12:16:46','2019-01-09 12:16:46'),(34,'edit_kitchens','kitchens','2019-01-09 12:16:46','2019-01-09 12:16:46'),(35,'add_kitchens','kitchens','2019-01-09 12:16:46','2019-01-09 12:16:46'),(36,'delete_kitchens','kitchens','2019-01-09 12:16:46','2019-01-09 12:16:46'),(37,'browse_meals','meals','2019-01-09 12:17:08','2019-01-09 12:17:08'),(38,'read_meals','meals','2019-01-09 12:17:08','2019-01-09 12:17:08'),(39,'edit_meals','meals','2019-01-09 12:17:08','2019-01-09 12:17:08'),(40,'add_meals','meals','2019-01-09 12:17:08','2019-01-09 12:17:08'),(41,'delete_meals','meals','2019-01-09 12:17:08','2019-01-09 12:17:08'),(42,'browse_weeks','weeks','2019-01-09 12:19:29','2019-01-09 12:19:29'),(43,'read_weeks','weeks','2019-01-09 12:19:29','2019-01-09 12:19:29'),(44,'edit_weeks','weeks','2019-01-09 12:19:29','2019-01-09 12:19:29'),(45,'add_weeks','weeks','2019-01-09 12:19:29','2019-01-09 12:19:29'),(46,'delete_weeks','weeks','2019-01-09 12:19:29','2019-01-09 12:19:29'),(47,'browse_plans','plans','2019-01-09 12:19:41','2019-01-09 12:19:41'),(48,'read_plans','plans','2019-01-09 12:19:41','2019-01-09 12:19:41'),(49,'edit_plans','plans','2019-01-09 12:19:41','2019-01-09 12:19:41'),(50,'add_plans','plans','2019-01-09 12:19:41','2019-01-09 12:19:41'),(51,'delete_plans','plans','2019-01-09 12:19:41','2019-01-09 12:19:41'),(52,'browse_meal_category','meal_category','2019-01-09 12:19:57','2019-01-09 12:19:57'),(53,'read_meal_category','meal_category','2019-01-09 12:19:57','2019-01-09 12:19:57'),(54,'edit_meal_category','meal_category','2019-01-09 12:19:57','2019-01-09 12:19:57'),(55,'add_meal_category','meal_category','2019-01-09 12:19:57','2019-01-09 12:19:57'),(56,'delete_meal_category','meal_category','2019-01-09 12:19:57','2019-01-09 12:19:57'),(57,'browse_customers','customers','2019-01-09 12:34:55','2019-01-09 12:34:55'),(58,'read_customers','customers','2019-01-09 12:34:55','2019-01-09 12:34:55'),(59,'edit_customers','customers','2019-01-09 12:34:55','2019-01-09 12:34:55'),(60,'add_customers','customers','2019-01-09 12:34:55','2019-01-09 12:34:55'),(61,'delete_customers','customers','2019-01-09 12:34:55','2019-01-09 12:34:55'),(62,'browse_meal_categories','meal_categories','2019-01-09 13:11:33','2019-01-09 13:11:33'),(63,'read_meal_categories','meal_categories','2019-01-09 13:11:33','2019-01-09 13:11:33'),(64,'edit_meal_categories','meal_categories','2019-01-09 13:11:33','2019-01-09 13:11:33'),(65,'add_meal_categories','meal_categories','2019-01-09 13:11:33','2019-01-09 13:11:33'),(66,'delete_meal_categories','meal_categories','2019-01-09 13:11:33','2019-01-09 13:11:33'),(72,'browse_meal_types','meal_types','2019-01-15 12:19:42','2019-01-15 12:19:42'),(73,'read_meal_types','meal_types','2019-01-15 12:19:42','2019-01-15 12:19:42'),(74,'edit_meal_types','meal_types','2019-01-15 12:19:42','2019-01-15 12:19:42'),(75,'add_meal_types','meal_types','2019-01-15 12:19:42','2019-01-15 12:19:42'),(76,'delete_meal_types','meal_types','2019-01-15 12:19:42','2019-01-15 12:19:42'),(77,'browse_customer_meals','customer_meals','2019-01-22 05:42:21','2019-01-22 05:42:21'),(78,'read_customer_meals','customer_meals','2019-01-22 05:42:21','2019-01-22 05:42:21'),(79,'edit_customer_meals','customer_meals','2019-01-22 05:42:21','2019-01-22 05:42:21'),(80,'add_customer_meals','customer_meals','2019-01-22 05:42:21','2019-01-22 05:42:21'),(81,'delete_customer_meals','customer_meals','2019-01-22 05:42:21','2019-01-22 05:42:21'),(82,'browse_ingredient_types','ingredient_types','2019-02-13 06:39:58','2019-02-13 06:39:58'),(83,'read_ingredient_types','ingredient_types','2019-02-13 06:39:58','2019-02-13 06:39:58'),(84,'edit_ingredient_types','ingredient_types','2019-02-13 06:39:58','2019-02-13 06:39:58'),(85,'add_ingredient_types','ingredient_types','2019-02-13 06:39:58','2019-02-13 06:39:58'),(86,'delete_ingredient_types','ingredient_types','2019-02-13 06:39:58','2019-02-13 06:39:58');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_prohibited_ingredient_types`
--

DROP TABLE IF EXISTS `plan_prohibited_ingredient_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_prohibited_ingredient_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(10) unsigned NOT NULL,
  `ingredient_type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_prohibited_ingredient_types_plan_id_foreign` (`plan_id`),
  KEY `plan_prohibited_ingredient_types_ingredient_type_id_foreign` (`ingredient_type_id`),
  CONSTRAINT `plan_prohibited_ingredient_types_ingredient_type_id_foreign` FOREIGN KEY (`ingredient_type_id`) REFERENCES `ingredient_types` (`id`),
  CONSTRAINT `plan_prohibited_ingredient_types_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_prohibited_ingredient_types`
--

LOCK TABLES `plan_prohibited_ingredient_types` WRITE;
/*!40000 ALTER TABLE `plan_prohibited_ingredient_types` DISABLE KEYS */;
INSERT INTO `plan_prohibited_ingredient_types` VALUES (3,12,2,'2019-04-21 12:31:47','2019-04-21 12:31:47'),(4,11,4,'2019-04-21 12:32:14','2019-04-21 12:32:14'),(5,11,19,'2019-04-21 12:32:19','2019-04-21 12:32:19'),(6,11,18,'2019-04-21 12:32:19','2019-04-21 12:32:19'),(7,9,2,'2019-04-21 12:32:47','2019-04-21 12:32:47'),(8,9,4,'2019-04-21 12:32:49','2019-04-21 12:32:49'),(9,9,18,'2019-04-21 12:32:55','2019-04-21 12:32:55'),(10,9,19,'2019-04-21 12:32:56','2019-04-21 12:32:56'),(11,7,2,'2019-04-21 12:33:14','2019-04-21 12:33:14'),(12,7,6,'2019-04-21 12:33:17','2019-04-21 12:33:17'),(13,5,1,'2019-04-21 13:35:44','2019-04-21 13:35:44'),(14,5,2,'2019-04-21 13:35:45','2019-04-21 13:35:45'),(15,5,3,'2019-04-21 13:35:46','2019-04-21 13:35:46'),(16,5,4,'2019-04-21 13:35:47','2019-04-21 13:35:47'),(17,5,5,'2019-04-21 13:35:48','2019-04-21 13:35:48'),(18,5,6,'2019-04-21 13:35:49','2019-04-21 13:35:49'),(19,5,7,'2019-04-21 13:35:50','2019-04-21 13:35:50'),(20,5,11,'2019-04-21 13:35:51','2019-04-21 13:35:51'),(21,5,13,'2019-04-21 13:35:52','2019-04-21 13:35:52'),(22,5,18,'2019-04-21 13:35:54','2019-04-21 13:35:54'),(23,5,19,'2019-04-21 13:35:54','2019-04-21 13:35:54'),(24,14,18,'2019-04-21 14:09:50','2019-04-21 14:09:50'),(25,14,19,'2019-04-21 14:09:51','2019-04-21 14:09:51'),(26,14,21,'2019-04-21 14:09:53','2019-04-21 14:09:53'),(27,14,22,'2019-04-21 14:09:55','2019-04-21 14:09:55'),(28,14,14,'2019-04-21 14:09:59','2019-04-21 14:09:59'),(29,14,4,'2019-04-21 14:10:09','2019-04-21 14:10:09'),(30,14,16,'2019-04-21 14:10:13','2019-04-21 14:10:13'),(31,13,14,'2019-04-21 14:10:39','2019-04-21 14:10:39'),(32,13,16,'2019-04-21 14:10:48','2019-04-21 14:10:48'),(34,13,21,'2019-04-21 14:10:53','2019-04-21 14:10:53'),(35,13,22,'2019-04-21 14:11:22','2019-04-21 14:11:22'),(36,6,14,'2019-04-21 14:12:08','2019-04-21 14:12:08'),(37,6,4,'2019-04-21 14:12:12','2019-04-21 14:12:12'),(38,6,17,'2019-04-21 14:12:15','2019-04-21 14:12:15'),(39,6,16,'2019-04-21 14:12:16','2019-04-21 14:12:16'),(40,6,15,'2019-04-21 14:12:17','2019-04-21 14:12:17'),(41,6,18,'2019-04-21 14:12:19','2019-04-21 14:12:19'),(42,6,19,'2019-04-21 14:12:20','2019-04-21 14:12:20'),(44,6,21,'2019-04-21 14:12:25','2019-04-21 14:12:25'),(45,6,22,'2019-04-21 14:12:26','2019-04-21 14:12:26'),(46,10,24,'2019-04-21 14:21:47','2019-04-21 14:21:47'),(48,10,4,'2019-04-21 14:22:01','2019-04-21 14:22:01'),(49,10,19,'2019-04-21 14:22:09','2019-04-21 14:22:09'),(50,10,18,'2019-04-21 14:22:10','2019-04-21 14:22:10'),(51,8,24,'2019-04-21 14:22:27','2019-04-21 14:22:27');
/*!40000 ALTER TABLE `plan_prohibited_ingredient_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_prohibited_ingredients`
--

DROP TABLE IF EXISTS `plan_prohibited_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_prohibited_ingredients` (
  `plan_id` int(10) unsigned NOT NULL,
  `ingredient_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`,`plan_id`),
  KEY `plan_prohibited_ingredients_plan_id_foreign` (`plan_id`),
  CONSTRAINT `plan_prohibited_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `plan_prohibited_ingredients_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_prohibited_ingredients`
--

LOCK TABLES `plan_prohibited_ingredients` WRITE;
/*!40000 ALTER TABLE `plan_prohibited_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_prohibited_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Lunch Meals','2019-03-26 17:03:05','2019-03-26 17:03:05'),(2,'Weightloss Meals','2019-03-26 17:03:17','2019-03-26 17:03:17'),(3,'Klean Meals','2019-03-26 17:03:24','2019-03-26 17:03:24'),(4,'Retox','2019-03-26 17:03:31','2019-03-26 17:03:31'),(5,'Juice Cleanse','2019-03-26 17:03:41','2019-03-26 17:03:41'),(6,'Vegan','2019-04-06 07:10:34','2019-04-06 07:10:34'),(7,'Keto','2019-04-06 07:10:42','2019-04-06 07:10:42'),(8,'Gluten Free','2019-04-06 07:10:47','2019-04-06 07:10:47'),(9,'Paleo','2019-04-06 07:10:53','2019-04-06 07:10:53'),(10,'Gluten Free & Dairy Free','2019-04-06 07:11:09','2019-04-06 07:11:09'),(11,'Dairy Free','2019-04-06 07:11:18','2019-04-06 07:11:18'),(12,'Low Carb','2019-04-06 07:11:29','2019-04-06 07:11:29'),(13,'Vegetarian','2019-04-06 07:11:39','2019-04-06 07:11:39'),(14,'Pescatarian','2019-04-06 07:11:57','2019-04-06 07:11:57');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-01-10 07:25:28','2019-01-10 07:25:28'),(2,'user','Normal User','2019-01-10 07:25:28','2019-01-10 07:25:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','The Natural Kitchen','','text',1,'Site'),(2,'site.description','Site Description','The Natural Kitchen','','text',2,'Site'),(3,'site.logo','Site Logo','settings/March2019/Xf0TuG9JRJmKAtFGWVzo.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/March2019/mxvxOdFy8KBgXhFCo9Hh.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','Mannai-Tech Admin Panel','','text',1,'Admin'),(7,'admin.description','Admin Description','Mannai-Tech Admin Panel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings/March2019/j6boOxosjtGCdVJPR0Uz.png','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/March2019/Vvqy1XxyorirFW8JuzfL.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(11,'calories.tolerance','Calories Tolerance','200',NULL,'text',6,'Calories'),(12,'site.bg_image','Homepage Background Image','',NULL,'image',7,'Site'),(15,'widgets.customers_widget_image','Customers Widget Image','settings/March2019/WdQ8DqwI4KZxisJKvYnc.png',NULL,'image',8,'Widgets');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@tnk.test','users/March2019/a0KyzBa4VYxvjLbIlm7u.png',NULL,'$2y$10$UE1YpKbOvdfgLFByFjuBkOJXCfnZrJaAINnAkKVE50qEu1/TqXFge',NULL,'{\"locale\":\"en\"}','2019-03-17 13:22:24','2019-03-17 13:25:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_meals`
--

DROP TABLE IF EXISTS `week_meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_meals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `week_id` int(10) unsigned NOT NULL,
  `meal_type_id` int(10) unsigned NOT NULL,
  `meal_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `week_meals_week_id_foreign` (`week_id`),
  KEY `week_meals_meal_type_id_foreign` (`meal_type_id`),
  KEY `week_meals_meal_id_foreign` (`meal_id`),
  CONSTRAINT `week_meals_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `week_meals_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `week_meals_week_id_foreign` FOREIGN KEY (`week_id`) REFERENCES `weeks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_meals`
--

LOCK TABLES `week_meals` WRITE;
/*!40000 ALTER TABLE `week_meals` DISABLE KEYS */;
INSERT INTO `week_meals` VALUES (274,3,8,505,'2019-06-23','2019-06-23 10:02:34','2019-06-23 10:02:34'),(275,3,8,506,'2019-06-23','2019-06-23 10:02:34','2019-06-23 10:02:34'),(276,3,8,515,'2019-06-23','2019-06-23 10:02:34','2019-06-23 10:02:34'),(277,3,8,516,'2019-06-23','2019-06-23 10:02:34','2019-06-23 10:02:34'),(278,3,8,517,'2019-06-23','2019-06-23 10:02:34','2019-06-23 10:02:34'),(279,3,9,497,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(280,3,9,498,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(281,3,9,499,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(282,3,9,501,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(283,3,9,502,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(284,3,9,507,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(285,3,9,508,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(286,3,9,509,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(287,3,9,510,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(288,3,9,511,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(289,3,9,512,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(290,3,9,521,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(291,3,9,522,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(292,3,9,523,'2019-06-23','2019-06-23 10:02:36','2019-06-23 10:02:36'),(293,3,10,500,'2019-06-23','2019-06-23 10:02:54','2019-06-23 10:02:54'),(294,3,10,513,'2019-06-23','2019-06-23 10:02:54','2019-06-23 10:02:54'),(295,3,11,514,'2019-06-23','2019-06-23 10:02:55','2019-06-23 10:02:55'),(296,3,12,518,'2019-06-23','2019-06-23 10:02:55','2019-06-23 10:02:55'),(297,3,12,519,'2019-06-23','2019-06-23 10:02:55','2019-06-23 10:02:55'),(298,3,12,520,'2019-06-23','2019-06-23 10:02:55','2019-06-23 10:02:55'),(299,3,8,505,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(300,3,12,518,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(301,3,8,506,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(302,3,11,514,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(303,3,8,515,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(304,3,12,519,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(305,3,12,520,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(306,3,8,516,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(307,3,8,517,'2019-06-24','2019-06-23 10:03:10','2019-06-23 10:03:10'),(308,3,9,497,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(309,3,10,500,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(310,3,9,498,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(311,3,10,513,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(312,3,9,499,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(313,3,9,501,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(314,3,9,502,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(315,3,9,507,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(316,3,9,508,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(317,3,9,509,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(318,3,9,510,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(319,3,9,511,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(320,3,9,512,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(321,3,9,521,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(322,3,9,522,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(323,3,9,523,'2019-06-24','2019-06-23 10:03:11','2019-06-23 10:03:11'),(324,3,11,514,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(325,3,12,518,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(326,3,9,497,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(327,3,12,519,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(328,3,9,498,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(329,3,12,520,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(330,3,9,499,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(331,3,9,501,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(332,3,9,502,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(333,3,9,507,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(334,3,9,508,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(335,3,9,509,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(336,3,9,510,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(337,3,9,511,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(338,3,9,512,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(339,3,9,521,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(340,3,9,522,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(341,3,9,523,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(342,3,10,500,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(343,3,8,505,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(344,3,10,513,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(345,3,8,506,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(346,3,8,515,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(347,3,8,516,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(348,3,8,517,'2019-06-25','2019-06-23 10:03:18','2019-06-23 10:03:18'),(349,3,8,505,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(350,3,12,518,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(351,3,8,506,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(352,3,11,514,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(353,3,12,519,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(354,3,8,515,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(355,3,12,520,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(356,3,8,516,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(357,3,8,517,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(358,3,10,500,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(359,3,9,497,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(360,3,10,513,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(361,3,9,498,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(362,3,9,499,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(363,3,9,501,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(364,3,9,502,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(365,3,9,507,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(366,3,9,508,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(367,3,9,509,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(368,3,9,510,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(369,3,9,511,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(370,3,9,512,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(371,3,9,521,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(372,3,9,522,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(373,3,9,523,'2019-06-26','2019-06-23 10:03:29','2019-06-23 10:03:29'),(374,3,10,500,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(375,3,10,513,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(376,3,9,497,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(377,3,9,498,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(378,3,9,499,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(379,3,9,501,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(380,3,9,502,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(381,3,9,507,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(382,3,9,508,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(383,3,9,509,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(384,3,9,510,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(385,3,9,511,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(386,3,9,512,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(387,3,9,521,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(388,3,9,522,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(389,3,9,523,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(390,3,12,518,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(391,3,12,519,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(392,3,12,520,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(393,3,8,505,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(394,3,11,514,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(395,3,8,506,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(396,3,8,515,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(397,3,8,516,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(398,3,8,517,'2019-06-27','2019-06-23 10:03:41','2019-06-23 10:03:41'),(399,3,12,518,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(400,3,10,500,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(401,3,9,497,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(402,3,12,519,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(403,3,10,513,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(404,3,9,498,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(405,3,12,520,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(406,3,9,499,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(407,3,9,501,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(408,3,9,502,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(409,3,9,507,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(410,3,9,508,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(411,3,9,509,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(412,3,9,510,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(413,3,9,511,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(414,3,9,512,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(415,3,9,521,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(416,3,9,522,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(417,3,9,523,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(418,3,8,505,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(419,3,11,514,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(420,3,8,506,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(421,3,8,515,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(422,3,8,516,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(423,3,8,517,'2019-06-28','2019-06-23 10:03:48','2019-06-23 10:03:48'),(424,3,11,514,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(425,3,12,518,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(426,3,8,505,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(427,3,12,519,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(428,3,8,506,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(429,3,12,520,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(430,3,8,515,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(431,3,8,516,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(432,3,8,517,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(433,3,10,500,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(434,3,10,513,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(435,3,9,497,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(436,3,9,498,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(437,3,9,499,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(438,3,9,501,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(439,3,9,502,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(440,3,9,507,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(441,3,9,508,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(442,3,9,509,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(443,3,9,510,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(444,3,9,511,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(445,3,9,512,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(446,3,9,521,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(447,3,9,522,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54'),(448,3,9,523,'2019-06-29','2019-06-23 10:03:54','2019-06-23 10:03:54');
/*!40000 ALTER TABLE `week_meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeks`
--

DROP TABLE IF EXISTS `weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weeks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeks`
--

LOCK TABLES `weeks` WRITE;
/*!40000 ALTER TABLE `weeks` DISABLE KEYS */;
INSERT INTO `weeks` VALUES (3,'2019-06-23','2019-06-29','2019-06-23 10:02:19','2019-06-23 10:03:00','Week 1');
/*!40000 ALTER TABLE `weeks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-23 11:28:53
