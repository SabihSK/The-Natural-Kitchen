-- MySQL dump 10.13  Distrib 5.7.24, for osx10.14 (x86_64)
--
-- Host: localhost    Database: tnk_
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_disliked_ingredients`
--

LOCK TABLES `customer_disliked_ingredients` WRITE;
/*!40000 ALTER TABLE `customer_disliked_ingredients` DISABLE KEYS */;
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
  `notes` json DEFAULT NULL,
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
  `cooked` tinyint(4) NOT NULL DEFAULT '0',
  `total_fats` int(11) NOT NULL DEFAULT '0',
  `total_proteins` int(11) NOT NULL DEFAULT '0',
  `total_carbs` int(11) NOT NULL DEFAULT '0',
  `notes` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_meals_customer_id_foreign` (`customer_id`),
  KEY `customer_meals_week_meal_id_foreign` (`week_meal_id`),
  CONSTRAINT `customer_meals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_meals_week_meal_id_foreign` FOREIGN KEY (`week_meal_id`) REFERENCES `week_meals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meals`
--

LOCK TABLES `customer_meals` WRITE;
/*!40000 ALTER TABLE `customer_meals` DISABLE KEYS */;
INSERT INTO `customer_meals` VALUES (11,1,79,'2019-04-09 04:52:55','2019-04-09 04:52:55',812,0,0,0,0,NULL),(12,1,481,'2019-04-09 04:52:55','2019-04-09 04:52:55',664,0,0,0,0,NULL),(13,1,550,'2019-04-09 04:52:55','2019-04-09 04:52:55',484,0,0,0,0,NULL),(14,1,437,'2019-04-09 04:52:55','2019-04-09 04:52:55',590,0,0,0,0,NULL),(15,1,709,'2019-04-09 04:52:55','2019-04-09 04:52:55',619,0,0,0,0,NULL),(16,1,150,'2019-04-09 04:52:55','2019-04-09 04:52:55',483,0,0,0,0,NULL),(17,1,254,'2019-04-09 04:52:55','2019-04-09 04:52:55',483,0,0,0,0,NULL),(18,1,78,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(19,1,376,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(20,1,710,'2019-04-09 04:52:55','2019-04-09 04:52:55',1154,0,0,0,0,NULL),(21,1,568,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(22,1,464,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(23,1,274,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(24,1,230,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(25,1,111,'2019-04-09 04:52:55','2019-04-09 04:52:55',298,0,0,0,0,NULL),(26,1,500,'2019-04-09 04:52:55','2019-04-09 04:52:55',276,0,0,0,0,NULL),(27,1,562,'2019-04-09 04:52:55','2019-04-09 04:52:55',304,0,0,0,0,NULL),(28,1,392,'2019-04-09 04:52:55','2019-04-09 04:52:55',383,0,0,0,0,NULL),(29,1,687,'2019-04-09 04:52:55','2019-04-09 04:52:55',583,0,0,0,0,NULL),(30,1,148,'2019-04-09 04:52:55','2019-04-09 04:52:55',641,0,0,0,0,NULL),(31,1,323,'2019-04-09 04:52:55','2019-04-09 04:52:55',276,0,0,0,0,NULL),(32,2,91,'2019-04-09 04:52:55','2019-04-09 04:52:55',629,0,0,0,0,NULL),(33,2,634,'2019-04-09 04:52:55','2019-04-09 04:52:55',768,0,0,0,0,NULL),(34,2,405,'2019-04-09 04:52:55','2019-04-09 04:52:55',887,0,0,0,0,NULL),(35,2,523,'2019-04-09 04:52:55','2019-04-09 04:52:55',619,0,0,0,0,NULL),(36,2,735,'2019-04-09 04:52:55','2019-04-09 04:52:55',768,0,0,0,0,NULL),(37,2,235,'2019-04-09 04:52:55','2019-04-09 04:52:55',768,0,0,0,0,NULL),(38,2,278,'2019-04-09 04:52:55','2019-04-09 04:52:55',624,0,0,0,0,NULL),(39,2,133,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(40,2,409,'2019-04-09 04:52:55','2019-04-09 04:52:55',1154,0,0,0,0,NULL),(41,2,677,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(42,2,568,'2019-04-09 04:52:55','2019-04-09 04:52:55',1251,0,0,0,0,NULL),(43,2,509,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(44,2,328,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(45,2,230,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(46,2,74,'2019-04-09 04:52:55','2019-04-09 04:52:55',634,0,0,0,0,NULL),(47,2,479,'2019-04-09 04:52:55','2019-04-09 04:52:55',702,0,0,0,0,NULL),(48,2,581,'2019-04-09 04:52:55','2019-04-09 04:52:55',549,0,0,0,0,NULL),(49,2,416,'2019-04-09 04:52:55','2019-04-09 04:52:55',709,0,0,0,0,NULL),(50,2,675,'2019-04-09 04:52:55','2019-04-09 04:52:55',609,0,0,0,0,NULL),(51,2,210,'2019-04-09 04:52:55','2019-04-09 04:52:55',376,0,0,0,0,NULL),(52,2,296,'2019-04-09 04:52:55','2019-04-09 04:52:55',383,0,0,0,0,NULL),(74,4,123,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(75,4,229,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(76,4,330,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(77,4,429,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(78,4,530,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(79,4,624,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(80,4,729,'2019-04-09 04:52:55','2019-04-09 04:52:55',28,0,0,0,0,NULL),(81,4,59,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(82,4,156,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(83,4,256,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(84,4,354,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(85,4,449,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(86,4,569,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(87,4,655,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(88,5,73,'2019-04-09 04:52:55','2019-04-09 04:52:55',624,0,0,0,0,NULL),(89,5,513,'2019-04-09 04:52:55','2019-04-09 04:52:55',624,0,0,0,0,NULL),(90,5,603,'2019-04-09 04:52:55','2019-04-09 04:52:55',619,0,0,0,0,NULL),(91,5,355,'2019-04-09 04:52:55','2019-04-09 04:52:55',484,0,0,0,0,NULL),(92,5,651,'2019-04-09 04:52:55','2019-04-09 04:52:55',483,0,0,0,0,NULL),(93,5,208,'2019-04-09 04:52:55','2019-04-09 04:52:55',619,0,0,0,0,NULL),(94,5,259,'2019-04-09 04:52:55','2019-04-09 04:52:55',653,0,0,0,0,NULL),(95,5,104,'2019-04-09 04:52:55','2019-04-09 04:52:55',1016,0,0,0,0,NULL),(96,5,623,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(97,5,489,'2019-04-09 04:52:55','2019-04-09 04:52:55',1154,0,0,0,0,NULL),(98,5,430,'2019-04-09 04:52:55','2019-04-09 04:52:55',1257,0,0,0,0,NULL),(99,5,704,'2019-04-09 04:52:55','2019-04-09 04:52:55',1016,0,0,0,0,NULL),(100,5,213,'2019-04-09 04:52:55','2019-04-09 04:52:55',902,0,0,0,0,NULL),(101,5,307,'2019-04-09 04:52:55','2019-04-09 04:52:55',1154,0,0,0,0,NULL),(102,5,74,'2019-04-09 04:52:55','2019-04-09 04:52:55',634,0,0,0,0,NULL),(103,5,601,'2019-04-09 04:52:55','2019-04-09 04:52:55',583,0,0,0,0,NULL),(104,5,392,'2019-04-09 04:52:55','2019-04-09 04:52:55',383,0,0,0,0,NULL),(105,5,485,'2019-04-09 04:52:55','2019-04-09 04:52:55',298,0,0,0,0,NULL),(106,5,684,'2019-04-09 04:52:55','2019-04-09 04:52:55',579,0,0,0,0,NULL),(107,5,207,'2019-04-09 04:52:55','2019-04-09 04:52:55',298,0,0,0,0,NULL),(108,5,311,'2019-04-09 04:52:55','2019-04-09 04:52:55',376,0,0,0,0,NULL),(109,6,42,'2019-04-09 04:52:55','2019-04-09 04:52:55',381,0,0,0,0,NULL),(110,6,510,'2019-04-09 04:52:55','2019-04-09 04:52:55',454,0,0,0,0,NULL),(111,6,564,'2019-04-09 04:52:55','2019-04-09 04:52:55',454,0,0,0,0,NULL),(112,6,364,'2019-04-09 04:52:55','2019-04-09 04:52:55',390,0,0,0,0,NULL),(113,6,727,'2019-04-09 04:52:55','2019-04-09 04:52:55',74,0,0,0,0,NULL),(114,6,173,'2019-04-09 04:52:55','2019-04-09 04:52:55',384,0,0,0,0,NULL),(115,6,333,'2019-04-09 04:52:55','2019-04-09 04:52:55',84,0,0,0,0,NULL),(116,6,46,'2019-04-09 04:52:55','2019-04-09 04:52:55',609,0,0,0,0,NULL),(117,6,589,'2019-04-09 04:52:55','2019-04-09 04:52:55',520,0,0,0,0,NULL),(118,6,427,'2019-04-09 04:52:55','2019-04-09 04:52:55',593,0,0,0,0,NULL),(119,6,466,'2019-04-09 04:52:55','2019-04-09 04:52:55',457,0,0,0,0,NULL),(120,6,671,'2019-04-09 04:52:55','2019-04-09 04:52:55',639,0,0,0,0,NULL),(121,6,227,'2019-04-09 04:52:55','2019-04-09 04:52:55',593,0,0,0,0,NULL),(122,6,268,'2019-04-09 04:52:55','2019-04-09 04:52:55',639,0,0,0,0,NULL),(123,6,111,'2019-04-09 04:52:55','2019-04-09 04:52:55',298,0,0,0,0,NULL),(124,6,631,'2019-04-09 04:52:55','2019-04-09 04:52:55',276,0,0,0,0,NULL),(125,6,485,'2019-04-09 04:52:55','2019-04-09 04:52:55',298,0,0,0,0,NULL),(126,6,410,'2019-04-09 04:52:55','2019-04-09 04:52:55',376,0,0,0,0,NULL),(127,6,655,'2019-04-09 04:52:55','2019-04-09 04:52:55',68,0,0,0,0,NULL),(128,6,222,'2019-04-09 04:52:55','2019-04-09 04:52:55',276,0,0,0,0,NULL),(129,6,248,'2019-04-09 04:52:55','2019-04-09 04:52:55',304,0,0,0,0,NULL),(130,4,43,'2019-04-09 04:53:02','2019-04-09 04:53:02',582,0,0,0,0,NULL),(131,4,140,'2019-04-09 04:53:05','2019-04-09 04:53:05',582,0,0,0,0,NULL),(132,4,283,'2019-04-09 04:53:15','2019-04-09 04:53:15',746,0,0,0,0,NULL),(133,4,439,'2019-04-09 04:53:17','2019-04-09 04:53:17',582,0,0,0,0,NULL),(134,4,704,'2019-04-09 04:53:22','2019-04-09 04:53:22',1016,0,0,0,0,NULL),(135,4,539,'2019-04-09 04:53:27','2019-04-09 04:53:27',582,0,0,0,0,NULL),(136,4,340,'2019-04-09 04:53:31','2019-04-09 04:53:31',582,0,0,0,0,NULL),(214,3,917,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"122\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"340\", \"ingredient_type_id\": \"5\"}, {\"amount\": \"74\", \"ingredient_type_id\": \"2\"}]'),(215,3,897,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"1233\", \"ingredient_type_id\": \"1\"}, {\"amount\": \"421\", \"ingredient_type_id\": \"2\"}]'),(216,3,918,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"74\", \"ingredient_type_id\": \"2\"}, {\"amount\": \"274\", \"ingredient_type_id\": \"5\"}]'),(217,3,899,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"74\", \"ingredient_type_id\": \"2\"}, {\"amount\": \"274\", \"ingredient_type_id\": \"5\"}]'),(218,3,919,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"122\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"340\", \"ingredient_type_id\": \"5\"}, {\"amount\": \"74\", \"ingredient_type_id\": \"2\"}]'),(219,3,920,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"74\", \"ingredient_type_id\": \"2\"}, {\"amount\": \"274\", \"ingredient_type_id\": \"5\"}]'),(220,3,902,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"122\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"340\", \"ingredient_type_id\": \"5\"}, {\"amount\": \"74\", \"ingredient_type_id\": \"2\"}]'),(221,3,903,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(222,3,904,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(223,3,905,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(224,3,906,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(225,3,907,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(226,3,908,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(227,3,909,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}]'),(228,3,910,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(229,3,911,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(230,3,912,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(231,3,913,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(232,3,914,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(233,3,915,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]'),(234,3,916,'2019-04-17 10:28:21','2019-04-17 10:28:21',0,0,0,0,0,'[{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]');
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
  `options` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_program_customer_id_foreign` (`customer_id`),
  KEY `customer_program_meal_type_id_foreign` (`meal_type_id`),
  CONSTRAINT `customer_program_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customer_program_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_programs`
--

LOCK TABLES `customer_programs` WRITE;
/*!40000 ALTER TABLE `customer_programs` DISABLE KEYS */;
INSERT INTO `customer_programs` VALUES (15,3,8,'[{\"data\": [{\"amount\": \"1233\", \"ingredient_type_id\": \"1\"}, {\"amount\": \"421\", \"ingredient_type_id\": \"2\"}], \"kitchen_id\": \"3\"}, {\"data\": [{\"amount\": \"122\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"340\", \"ingredient_type_id\": \"5\"}, {\"amount\": \"74\", \"ingredient_type_id\": \"2\"}], \"kitchen_id\": \"5\"}, {\"data\": [{\"amount\": \"74\", \"ingredient_type_id\": \"2\"}, {\"amount\": \"274\", \"ingredient_type_id\": \"5\"}], \"kitchen_id\": \"1\"}]','2019-04-16 07:59:55','2019-04-17 02:54:27'),(21,3,10,'[{\"data\": [{\"amount\": \"350\", \"ingredient_type_id\": \"10\"}], \"kitchen_id\": \"3\"}]','2019-04-17 02:54:43','2019-04-17 02:54:47'),(22,3,9,'[{\"data\": [{\"amount\": \"530\", \"ingredient_type_id\": \"4\"}, {\"amount\": \"230\", \"ingredient_type_id\": \"6\"}, {\"amount\": \"125\", \"ingredient_type_id\": \"13\"}]}]','2019-04-17 02:55:52','2019-04-17 02:56:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Mike Smith','Mr',43,'0000-00-00',1,188,87.5,0,0,'0','12','36895021','36895021','mike.smith@worleyparson.com','NONE','NONE','0',1,0,0,0,'0','MENTAL',2,'2019-03-26 17:21:53','2019-03-30 08:50:07',1,1),(2,'Bassam Al Ali','Mr',37,'0000-00-00',1,175,81,34,0,'O+','BLDG 2495,RD 2832,SEEF 428, AHLI UNITED BANK','36733777','36733777','bas.alali@gmail.com','NONE','NONE','1',0,0,0,0,'0','Mental',2,'2019-03-30 08:48:47','2019-03-30 08:48:47',1,1),(3,'Amani Alasfoor','Ms.',27,'1991-05-11',0,173,59,0,0,'O+','GATE 61, ROAD 69, BLOCK 463, AL HAJAR 5643','36391231','36391231','amani@shaikh.net','NONE','NONE','1',0,0,0,0,'0','MENTAL',2,'2019-03-30 08:53:23','2019-04-09 07:57:58',1,1),(4,'Laila Al-Beiti','MS.',35,'0000-00-00',0,0,0,0,0,'0','House 25, Granada Garden Road 2251,Jidhafs 442','39977832','39977832','laila.albeiti@gmail.com','NONE','NONE','1',0,0,0,0,'0','MENTAL',2,'2019-03-30 09:40:31','2019-03-30 09:46:38',1,1),(5,'Humood Almuhanna','Mr.',28,'0000-00-00',1,190,103,109,69,'O+','House 215, RD 90, BLK 945, Awali','3831001','3831001','humood.almuhanna@gmail.com','Mixed connective tissue disease','Adalat, Imuran, Nuxium','1',0,0,0,0,'0','Mental',0,'2019-03-30 10:01:25','2019-03-30 10:04:11',2,1),(6,'Najlaa Salman Alkhalifa','Sh.',27,'0000-00-00',0,158,88,95,121,'O+','House 174\r\nSh. Khalifa Bin Mohd Ave.\r\nBusaiteen\r\nBlock 221','33505505','33505505','niyalalkhalifa@gmail.com','NONE','NONE','0',0,0,0,0,'0','MENTAL',0,'2019-04-01 15:52:43','2019-04-01 15:53:32',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_allergic_ingredient_types`
--

LOCK TABLES `customers_allergic_ingredient_types` WRITE;
/*!40000 ALTER TABLE `customers_allergic_ingredient_types` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_allergic_ingredients`
--

LOCK TABLES `customers_allergic_ingredients` WRITE;
/*!40000 ALTER TABLE `customers_allergic_ingredients` DISABLE KEYS */;
INSERT INTO `customers_allergic_ingredients` VALUES (280,3,21,'2019-04-09 07:58:18','2019-04-09 07:58:18');
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
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(14,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(23,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(24,4,'name','text','Name',1,1,1,1,1,1,'{}',2),(25,4,'protein','text','Protein',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',3),(26,4,'fat','text','Fat',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',4),(27,4,'carbohydrates','text','Carbohydrates',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',5),(28,4,'calories','text','Calories',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',6),(29,4,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',8),(30,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(31,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,5,'name','text','Name',1,1,1,1,1,1,'{}',2),(33,5,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(34,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(35,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(36,6,'name','text','Name',1,1,1,1,1,1,'{}',3),(37,6,'kitchen_id','select_dropdown','Kitchen Id',1,1,1,1,1,1,'{}',2),(38,6,'created_at','timestamp','Created At',0,0,0,0,0,0,'{}',5),(39,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(40,6,'meal_belongsto_kitchen_relationship','relationship','',0,1,1,1,1,1,'{\"model\":\"App\\\\Kitchen\",\"table\":\"kitchens\",\"type\":\"belongsTo\",\"column\":\"kitchen_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(41,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(42,7,'startdate','date','Start date',1,1,1,1,1,1,'{\"format\":\"%d-%m-%Y\"}',3),(43,7,'enddate','date','End date',1,1,1,1,1,1,'{\"format\":\"%d-%m-%Y\"}',4),(44,7,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',5),(45,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(46,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(47,8,'name','text','Name',1,1,1,1,1,1,'{}',2),(48,8,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(49,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(50,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(51,10,'fullname','text','Fullname',1,1,1,1,1,1,'{}',3),(52,10,'title','text','Title',1,1,1,1,1,1,'{}',4),(53,10,'age','text','Age',1,1,1,1,1,1,'{}',5),(54,10,'birthdate','date','Birthdate',1,1,1,1,1,1,'{}',6),(55,10,'gender','select_dropdown','Gender',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}',7),(56,10,'height','text','Height',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',8),(57,10,'weight','text','Weight',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',9),(58,10,'waist_measurements','text','Waist Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',10),(59,10,'hip_measurements','text','Hip Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',11),(60,10,'blood_type','text','Blood Type',1,1,1,1,1,1,'{}',12),(61,10,'address','text_area','Address',1,0,1,1,1,1,'{}',13),(62,10,'mobile','text','Mobile',1,1,1,1,1,1,'{}',14),(63,10,'telephone','text','Telephone',1,1,1,1,1,1,'{}',15),(64,10,'email','text','Email',1,1,1,1,1,1,'{}',16),(65,10,'medical_history','text_area','Medical History',1,0,1,1,1,1,'{}',17),(66,10,'present_medication','text_area','Present Medication',1,0,1,1,1,1,'{}',18),(67,10,'exercise_frequency','select_dropdown','Exercise Frequency',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Sedentary or light activity\",\"1\":\"Active or moderately active\",\"2\":\"Vigorously active\"}}',19),(68,10,'alchohol','select_dropdown','Alchohol',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',20),(69,10,'smoke','select_dropdown','Smoke',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',21),(70,10,'pregnancy','select_dropdown','Pregnancy',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',22),(71,10,'breastfeeding','select_dropdown','Breastfeeding',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',23),(72,10,'vaccinations','select_dropdown','Vaccinations',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',24),(73,10,'worktype','text','Worktype',1,1,1,1,1,1,'{}',25),(74,10,'weightchange','select_dropdown','Weightchange',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Need to Lose Weight\",\"1\":\"Need to Gain Weight\",\"2\":\"Maintain\"}}',26),(75,10,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',27),(76,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',28),(77,10,'plan_id','text','Plan Id',1,1,1,1,1,1,'{}',2),(78,10,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Deactived\",\"1\":\"Activated\"}}',29),(79,10,'customer_belongsto_plan_relationship','relationship','Plan',0,1,1,1,1,1,'{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"belongsTo\",\"column\":\"plan_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',30),(80,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(81,11,'name','text','Name',1,1,1,1,1,1,'{}',2),(82,11,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',3),(83,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(89,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(90,13,'name','text','Name',1,1,1,1,1,1,'{}',2),(91,13,'calories_percentage','number','Calories Percentage %',1,1,1,1,1,1,'{}',3),(92,13,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',4),(93,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(94,6,'meal_belongsto_meal_type_relationship','relationship','',0,1,1,1,1,1,'{\"model\":\"App\\\\MealType\",\"table\":\"meal_types\",\"type\":\"belongsTo\",\"column\":\"meal_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meals\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(95,6,'meal_type_id','select_dropdown','Meal Type Id',1,1,1,1,1,1,'{}',4),(96,7,'name','text','Name',1,1,1,1,1,1,'{}',2),(97,14,'id','text','Id',1,0,0,0,0,0,'{}',1),(98,14,'customer_id','text','Customer Id',1,1,1,1,1,1,'{}',2),(99,14,'week_meal_id','text','Week Meal Id',1,1,1,1,1,1,'{}',3),(100,14,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',4),(101,14,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(102,6,'total_calories','number','Total Calories',1,1,1,0,0,1,'{}',9),(103,4,'ingredient_belongsto_ingredient_type_relationship','relationship','Ingredient Type',0,1,1,1,1,1,'{\"model\":\"App\\\\IngredientType\",\"table\":\"ingredient_types\",\"type\":\"belongsTo\",\"column\":\"ingredient_type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"additional_ingredients\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(104,4,'ingredient_type_id','text','Ingredient Type Id',0,1,1,1,1,1,'{}',7),(105,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(106,15,'name','text','Name',1,1,1,1,1,1,'{}',2),(107,15,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',3),(108,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(109,15,'kitchen_id','select_dropdown','Kitchen',0,1,1,1,1,1,'{}',2),(110,15,'ingredient_type_belongsto_kitchen_relationship','relationship','kitchens',0,1,1,1,1,1,'{\"model\":\"App\\\\Kitchen\",\"table\":\"kitchens\",\"type\":\"belongsTo\",\"column\":\"kitchen_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"additional_ingredients\",\"pivot\":\"0\",\"taggable\":null}',5),(111,14,'total_calories','text','Total Calories',0,1,1,1,1,1,'{}',6),(112,14,'cooked','number','Cooked',1,1,1,1,1,1,'{}',10),(113,14,'total_fats','number','Total Fats',1,1,1,1,1,1,'{}',7),(114,14,'total_proteins','number','Total Proteins',1,1,1,1,1,1,'{}',9),(115,14,'total_carbs','number','Total Carbs',1,1,1,1,1,1,'{}',8),(116,6,'custom','select_dropdown','Custom',1,0,0,0,0,0,'{\"default\":\"0\",\"options\":{\"0\":\"Normal\",\"1\":\"Custom Recipes Meal\"}}',13),(117,6,'total_fats','number','Total Fats',1,1,1,0,0,1,'{}',10),(118,6,'total_proteins','number','Total Proteins',1,1,1,0,0,1,'{}',12),(119,6,'total_carbs','number','Total Carbs',1,1,1,0,0,1,'{}',11),(120,6,'notes','text','Notes',0,1,1,1,1,1,'{}',12);
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
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-01-10 07:25:28','2019-01-10 07:25:28'),(4,'ingredients','ingredients','Ingredient','Ingredients',NULL,'App\\Ingredient',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:14:49','2019-02-13 06:43:21'),(5,'kitchens','kitchens','Kitchen','Kitchens',NULL,'App\\Kitchen',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:16:46','2019-01-14 09:54:01'),(6,'meals','meals','Meal','Meals',NULL,'App\\Meal',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":\"notCustom\"}','2019-01-09 12:17:08','2019-04-17 09:49:19'),(7,'weeks','weeks','Week','Weeks',NULL,'App\\Week',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:29','2019-01-16 09:25:50'),(8,'plans','plans','Plan','Plans',NULL,'App\\Plan',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:41','2019-01-14 09:54:11'),(9,'meal_category','meal-category','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:19:57','2019-01-09 12:19:57'),(10,'customers','customers','Customer','Customers',NULL,'App\\Customer',NULL,NULL,NULL,1,1,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 12:34:55','2019-02-24 11:10:11'),(11,'meal_categories','meal-categories','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 13:11:33','2019-01-09 13:11:33'),(13,'meal_types','meal-types','Meal Type','Meal Types','voyager-backpack','App\\MealType',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-15 12:19:42','2019-01-15 12:19:42'),(14,'customer_meals','customer-meals','Customer Meal','Customer Meals',NULL,'App\\CustomerMeal',NULL,NULL,'Customers Meals List',1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-22 05:42:21','2019-03-14 07:08:29'),(15,'ingredient_types','ingredient-types','Ingredient Type','Ingredient Types',NULL,'App\\IngredientType',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-02-13 06:39:58','2019-03-04 08:15:10');
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
  `removable` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `ingredient_meal` VALUES (1,345,70,0),(1,378,71,0),(1,382,61,0),(2,362,56,0),(2,375,58,0),(2,389,74,0),(3,393,94,0),(3,422,75,0),(4,344,62,0),(4,357,63,0),(4,425,95,0),(5,348,73,0),(5,353,95,0),(5,386,100,0),(5,432,51,0),(6,392,83,0),(7,349,62,0),(7,351,68,0),(7,366,91,0),(7,367,60,0),(7,384,83,0),(8,370,71,0),(8,377,75,0),(8,389,94,0),(8,421,72,0),(9,357,79,0),(9,368,95,0),(9,415,72,0),(9,425,92,0),(10,360,56,0),(10,365,68,0),(10,373,50,0),(10,374,50,0),(10,426,85,0),(10,431,87,0),(11,367,60,0),(11,376,53,0),(11,392,50,0),(12,381,90,0),(12,389,70,0),(12,390,70,0),(12,413,81,0),(13,379,64,0),(13,402,90,0),(14,364,87,0),(15,369,76,0),(15,408,62,0),(16,365,59,0),(16,388,76,0),(17,345,79,0),(17,348,72,0),(17,389,66,0),(18,334,94,0),(18,360,63,0),(18,420,84,0),(19,371,60,0),(19,405,77,0),(19,413,55,0),(19,423,74,0),(19,432,92,0),(20,396,54,0),(20,403,87,0),(21,343,97,0),(21,351,73,0),(21,359,69,0),(21,364,88,0),(21,367,59,0),(22,359,53,0),(22,371,77,0),(22,383,100,0),(22,392,83,0),(22,411,50,0),(22,423,99,0),(22,424,72,0),(23,349,72,0),(23,350,54,0),(23,364,99,0),(23,372,69,0),(23,427,53,0),(24,334,50,0),(24,363,56,0),(24,392,91,0),(24,418,52,0),(24,427,96,0),(25,339,53,0),(25,349,71,0),(25,353,52,0),(25,398,72,0),(25,405,77,0),(25,420,93,0),(26,335,72,0),(26,405,93,0),(26,417,52,0),(26,421,87,0),(27,344,58,0),(27,346,50,0),(27,388,95,0),(27,423,52,0),(29,352,75,0),(29,395,93,0),(29,399,75,0),(30,346,61,0),(30,350,88,0),(30,368,63,0),(30,407,80,0),(30,417,88,0),(31,354,88,0),(31,371,59,0),(31,395,66,0),(31,401,89,0),(31,429,64,0),(32,359,59,0),(32,395,88,0),(33,352,75,0),(33,358,89,0),(33,359,98,0),(33,387,64,0),(34,346,52,0),(35,425,96,0),(35,431,98,0),(37,348,54,0),(37,355,70,0),(37,368,86,0),(37,383,51,0),(37,426,87,0),(38,368,85,0),(38,375,82,0),(38,402,60,0),(38,412,70,0),(39,369,55,0),(39,388,81,0),(39,389,78,0),(39,404,54,0),(40,357,72,0),(40,370,77,0),(40,381,69,0),(40,390,63,0),(40,422,92,0),(40,431,88,0),(40,432,95,0),(41,352,79,0),(41,353,69,0),(41,408,88,0),(42,338,89,0),(42,394,98,0),(42,406,54,0),(43,375,66,0),(43,405,99,0),(44,345,93,0),(44,346,51,0),(44,409,70,0),(44,415,67,0),(45,334,80,0),(46,337,76,0),(46,382,100,0),(46,383,71,0),(46,385,72,0),(47,347,79,0),(47,370,81,0),(47,392,65,0),(47,433,83,0),(48,376,81,0),(48,403,97,0),(48,429,51,0),(49,356,80,0),(49,376,95,0),(49,398,67,0),(49,423,76,0),(50,376,82,0),(50,388,74,0),(50,391,89,0),(51,363,92,0),(51,402,84,0),(51,415,67,0),(51,419,63,0),(52,378,54,0),(52,392,96,0),(52,401,86,0),(52,414,95,0),(53,345,86,0),(53,373,67,0),(54,351,96,0),(54,362,100,0),(54,387,59,0),(54,409,95,0),(54,424,62,0),(55,351,80,0),(55,358,82,0),(55,422,70,0),(56,400,86,0),(56,407,90,0),(56,427,89,0),(57,386,85,0),(57,389,71,0),(57,408,56,0),(57,413,96,0),(57,415,99,0),(57,432,82,0),(58,347,61,0),(58,356,80,0),(58,378,76,0),(58,402,83,0),(58,425,76,0),(59,337,94,0),(59,365,82,0),(59,377,80,0),(60,342,52,0),(60,395,90,0),(61,357,75,0),(61,364,51,0),(61,368,70,0),(61,401,51,0),(61,422,96,0),(62,347,58,0),(62,374,97,0),(62,408,90,0),(62,433,70,0),(63,334,76,0),(63,355,76,0),(63,360,85,0),(63,384,91,0),(63,401,81,0),(63,418,70,0),(64,347,56,0),(64,352,87,0),(64,354,92,0),(64,357,91,0),(65,343,92,0),(65,395,80,0),(65,420,67,0),(65,423,85,0),(66,347,95,0),(66,349,78,0),(66,350,84,0),(66,351,87,0),(66,399,74,0),(66,412,55,0),(66,414,85,0),(66,418,75,0),(66,433,58,0),(67,423,51,0),(68,337,83,0),(68,363,56,0),(68,376,65,0),(68,383,87,0),(68,395,76,0),(68,407,65,0),(68,410,70,0),(68,425,53,0),(69,350,97,0),(69,401,71,0),(69,419,82,0),(70,361,91,0),(70,366,59,0),(70,385,99,0),(70,408,89,0),(70,410,64,0),(70,411,50,0),(70,427,70,0),(71,416,78,0),(72,335,81,0),(72,365,66,0),(72,419,54,0),(72,421,74,0),(73,356,91,0),(73,380,75,0),(74,337,52,0),(74,346,82,0),(74,394,77,0),(74,398,68,0),(74,407,76,0),(75,388,86,0),(75,401,77,0),(76,340,53,0),(76,359,78,0),(76,381,76,0),(77,338,55,0),(77,363,66,0),(77,377,70,0),(78,363,82,0),(78,382,62,0),(78,402,57,0),(79,396,58,0),(80,339,63,0),(80,367,81,0),(80,377,50,0),(81,357,54,0),(81,382,81,0),(81,394,77,0),(81,397,91,0),(81,409,53,0),(81,426,97,0),(82,335,99,0),(82,361,73,0),(82,371,80,0),(82,372,58,0),(82,379,85,0),(82,405,85,0),(83,336,55,0),(83,380,89,0),(83,405,84,0),(83,409,70,0),(84,339,100,0),(84,353,93,0),(84,383,81,0),(84,415,91,0),(84,421,84,0),(86,339,97,0),(86,359,73,0),(86,387,92,0),(86,393,80,0),(87,336,76,0),(87,348,74,0),(87,355,60,0),(87,418,60,0),(88,341,86,0),(88,347,79,0),(88,376,63,0),(88,395,56,0),(88,403,90,0),(88,404,78,0),(88,415,99,0),(89,354,70,0),(89,373,83,0),(89,384,83,0),(89,428,86,0),(90,337,70,0),(90,351,81,0),(90,378,68,0),(90,383,90,0),(90,408,61,0),(91,343,86,0),(91,373,73,0),(91,397,76,0),(91,409,89,0),(92,337,84,0),(93,348,74,0),(93,363,54,0),(93,406,77,0),(94,336,91,0),(94,366,97,0),(94,416,81,0),(95,344,94,0),(95,352,54,0),(95,365,76,0),(95,393,61,0),(95,396,80,0),(96,339,86,0),(96,350,63,0),(96,365,91,0),(96,371,68,0),(96,430,58,0),(97,341,51,0),(97,371,54,0),(97,387,84,0),(98,402,99,0),(98,409,82,0),(98,425,91,0),(98,428,88,0),(99,355,53,0),(99,430,77,0),(99,431,71,0),(100,393,54,0),(102,375,70,0),(102,398,75,0),(103,367,80,0),(103,380,63,0),(103,388,52,0),(103,432,62,0),(104,352,73,0),(104,356,82,0),(105,370,100,0),(105,427,100,0),(106,367,81,0),(107,341,86,0),(107,365,79,0),(107,377,72,0),(107,385,57,0),(107,402,98,0),(107,415,76,0),(108,376,68,0),(108,378,53,0),(108,384,65,0),(108,411,69,0),(109,370,98,0),(109,388,89,0),(109,401,81,0),(110,374,97,0),(110,409,60,0),(110,414,89,0),(111,368,91,0),(111,405,85,0),(111,407,63,0),(112,349,70,0),(112,364,72,0),(112,371,72,0),(113,345,69,0),(113,364,90,0),(113,366,76,0),(113,421,54,0),(113,429,98,0),(114,341,83,0),(114,377,51,0),(114,433,84,0),(115,400,62,0),(115,421,70,0),(116,340,64,0),(116,374,85,0),(116,378,62,0),(116,389,74,0),(116,414,52,0),(116,418,94,0),(117,374,58,0),(117,379,75,0),(117,433,83,0),(118,373,60,0),(118,394,94,0),(118,426,63,0),(119,382,77,0),(119,404,74,0),(120,344,61,0),(120,378,72,0),(121,334,93,0),(121,391,61,0),(121,400,90,0),(121,433,98,0),(122,342,82,0),(122,374,58,0),(122,375,80,0),(123,348,61,0),(123,355,79,0),(124,406,64,0),(125,375,96,0),(125,432,98,0),(126,348,91,0),(126,375,62,0),(126,381,50,0),(127,369,66,0),(127,383,85,0),(127,411,65,0),(127,430,72,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_types`
--

LOCK TABLES `ingredient_types` WRITE;
/*!40000 ALTER TABLE `ingredient_types` DISABLE KEYS */;
INSERT INTO `ingredient_types` VALUES (1,'Protein','2019-03-26 17:34:55','2019-03-26 17:34:55',NULL),(2,'Carbohydrate','2019-03-26 17:35:09','2019-03-26 17:35:09',NULL),(3,'Fat','2019-03-26 17:35:16','2019-03-26 17:35:16',NULL),(4,'Dairy','2019-03-26 17:35:45','2019-03-26 17:35:45',NULL),(5,'Vegetable','2019-03-26 17:35:54','2019-03-26 17:35:54',NULL),(6,'Fruit','2019-03-26 17:36:06','2019-03-26 17:36:06',NULL),(7,'NonDairy','2019-03-26 17:36:48','2019-03-26 17:36:48',NULL),(8,'Juices','2019-03-26 17:36:56','2019-03-26 17:36:56',NULL),(9,'Nut Milks','2019-03-26 17:37:16','2019-03-26 17:37:16',NULL),(10,'Smoothies','2019-03-26 17:37:25','2019-03-26 17:37:25',NULL),(11,'Herbs, Spices & Condiments','2019-03-27 15:32:30','2019-04-01 16:20:13',5),(13,'Nuts & Seeds','2019-03-30 09:19:11','2019-04-01 16:53:41',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Chicken Breast',21,0,0,102,'2019-03-26 17:38:34','2019-03-26 17:38:34',1),(2,'Egg',6.3,4.8,0,72,'2019-03-26 17:40:35','2019-03-26 17:40:35',1),(3,'Egg White',3.6,0.1,0.2,17,'2019-03-26 17:47:16','2019-03-26 17:47:16',1),(4,'Beef Tenderloin',26,4,0,141,'2019-03-26 17:47:51','2019-03-26 17:47:51',1),(5,'Minced Beef',21,5,0,130,'2019-03-26 17:48:25','2019-03-26 17:48:38',1),(6,'Salmon',26,6,0,170,'2019-03-26 17:49:18','2019-03-26 17:49:18',1),(7,'Shrimp',20.31,1.73,0.91,106,'2019-03-26 17:50:02','2019-03-26 17:50:02',1),(8,'Hamour',25.6,1.2,5.3,118,'2019-03-26 17:50:39','2019-03-26 17:50:39',1),(9,'Talapia',26,3,0,129,'2019-03-26 17:51:24','2019-03-26 17:51:24',1),(10,'Tofu',12.7,3.8,1.3,89,'2019-03-26 17:52:02','2019-03-26 17:52:02',1),(11,'Yoghurt Plain',4.7,1.2,7.1,58,'2019-03-26 17:52:59','2019-03-26 17:52:59',1),(12,'Brown Rice',3.6,1.3,24.3,118,'2019-03-26 17:53:31','2019-03-26 17:53:31',2),(13,'Quinoa (Cooked)',4.4,1.9,21.3,120,'2019-03-26 17:54:24','2019-03-26 17:56:14',2),(14,'Potato (Raw)',2,0,17,72,'2019-03-26 17:55:11','2019-03-26 17:55:11',2),(15,'Sweet Potato (Raw)',1.6,0,20,86,'2019-03-26 17:55:59','2019-03-26 17:55:59',2),(16,'Olive Oil',0,94.7,0,812,'2019-03-26 17:57:02','2019-03-26 17:57:02',3),(17,'Leek',0.5,0.3,14,61,'2019-03-26 17:57:32','2019-03-26 17:57:32',5),(18,'Broccoli',3.7,0.3,2.1,31,'2019-03-26 17:58:10','2019-03-26 17:58:10',5),(19,'Buckwheat Gluten Free Noodle (Uncooked)',13,3,72,365,'2019-03-27 15:05:15','2019-03-27 15:05:15',2),(20,'Biona Wholegrain Pasta (Uncooked)',12.3,2.2,65.5,350,'2019-03-27 15:06:05','2019-03-27 15:06:05',2),(21,'Barley (Cooked)',2.3,0.4,28.2,123,'2019-03-27 15:07:08','2019-03-27 15:07:08',2),(22,'Gluten Free Penne (Uncooked)',6.7,1.3,79,359,'2019-03-27 15:07:59','2019-03-27 15:07:59',2),(23,'Bobs Red Mill Gluten Free Oats (Uncooked)',14.6,7.3,66.7,396,'2019-03-27 15:08:51','2019-03-27 15:08:51',2),(24,'Avocado',2,15,3.5,175,'2019-03-27 15:09:29','2019-03-27 15:09:29',3),(25,'Green Olives',2,17,3.5,175,'2019-03-27 15:10:21','2019-03-27 15:10:21',3),(26,'Black Olives',0,16.5,6.6,165,'2019-03-27 15:10:54','2019-03-27 15:10:54',3),(27,'Coconut Oil',0,92.4,0,858,'2019-03-27 15:11:34','2019-03-27 15:11:34',3),(28,'Green Beans',0.8,0,3.3,17,'2019-03-27 15:12:30','2019-03-27 15:12:30',5),(29,'Tomatoes',0.9,0.2,3.9,18,'2019-03-27 15:13:16','2019-03-27 15:13:16',5),(30,'Zucchini',1.2,0.3,3.1,17,'2019-03-27 15:14:25','2019-03-27 15:14:25',5),(31,'Onion',1.1,0.1,9,40,'2019-03-27 15:16:11','2019-03-27 15:16:11',5),(32,'Carrot',0.9,0.2,10,41,'2019-03-27 15:16:59','2019-03-27 15:16:59',5),(33,'Red Capsicum',2,0.2,9,40,'2019-03-27 15:17:40','2019-03-27 15:17:40',5),(34,'Green Capsicum',0.8,0.2,4.6,20,'2019-03-27 15:18:09','2019-03-27 15:18:09',5),(35,'Yellow Capsicum',1,0.2,6,27,'2019-03-27 15:18:43','2019-03-27 15:18:43',5),(36,'Spinach',3,0,3.7,23,'2019-03-27 15:20:58','2019-03-27 15:20:58',5),(37,'Cucumber',0.7,0,4,16,'2019-03-27 15:21:32','2019-03-27 15:21:32',5),(38,'Celery',0.7,0.2,3,16,'2019-03-27 15:24:25','2019-03-27 15:24:25',5),(39,'Iceberg Lettuce',0.5,0.1,1.5,7,'2019-03-27 15:25:09','2019-03-27 15:25:09',5),(40,'Rocket Leaves (Jarjeer, Rucola)',3.6,0.5,1.5,29,'2019-03-27 15:26:06','2019-03-27 15:26:06',5),(41,'Mixed Lettuce Leaves',0.7,0.7,3,16,'2019-03-27 15:26:37','2019-03-27 15:26:37',5),(42,'Chickpeas',7,2.8,22.5,139,'2019-03-27 15:27:25','2019-03-27 15:27:25',5),(43,'Red Lentils',9,0.4,20.1,116,'2019-03-27 15:29:16','2019-03-27 15:29:16',5),(44,'Green Lentils',5,0.4,10.2,65,'2019-03-27 15:29:45','2019-03-27 15:29:45',5),(45,'Garlic',0,0,25,100,'2019-03-27 15:30:16','2019-03-27 15:33:33',11),(46,'Ginger',1.8,0.8,17.8,80,'2019-03-27 15:31:05','2019-03-27 15:33:19',11),(47,'Turmeric',7.9,9.9,64.9,354,'2019-03-27 15:31:58','2019-03-27 15:32:56',11),(48,'Edemame',12.7,4.2,11.3,127,'2019-03-27 15:36:15','2019-03-27 15:36:15',5),(49,'Corn',3.3,0.5,21,88,'2019-03-27 15:37:01','2019-03-27 15:37:01',5),(50,'Green Peas',8.3,0.4,12.8,105,'2019-03-27 15:37:44','2019-03-27 15:37:44',5),(51,'Parsley',3,0.8,6.3,38,'2019-03-27 15:38:23','2019-03-27 15:38:23',5),(52,'Asparagus',2.2,0.1,3.9,20,'2019-03-27 15:39:01','2019-03-27 15:39:01',5),(53,'Coriander',2.1,0.5,3.7,23,'2019-03-27 15:39:48','2019-03-27 15:39:48',11),(54,'Palm Heart',6.1,5.2,16,28,'2019-03-27 15:40:21','2019-03-27 15:40:21',5),(55,'Capers (In Brine)',0.8,0.7,2,27,'2019-03-27 15:41:05','2019-03-27 15:41:05',5),(56,'Mint Leaves',4,1,15,70,'2019-03-27 15:41:32','2019-03-27 15:41:56',5),(57,'Banana',1,0.3,21.4,83,'2019-03-27 15:43:02','2019-03-27 15:43:02',6),(58,'Red Apple',0,0,14.3,57,'2019-03-27 15:43:51','2019-03-27 15:45:52',6),(59,'Green Apple',0.3,0,14,52,'2019-03-27 15:46:38','2019-03-27 15:46:38',6),(60,'Strawberry',0.7,0.3,7.7,32,'2019-03-27 15:47:42','2019-03-27 15:47:42',6),(61,'Blueberries',0.8,0.3,14.5,60,'2019-03-27 15:48:21','2019-03-27 15:48:21',6),(62,'Mango',0.7,0.2,13.6,63,'2019-03-27 15:49:03','2019-03-27 15:49:03',6),(63,'Lemon (Juice)',0.2,0.1,3.2,10,'2019-03-27 15:51:29','2019-03-27 15:51:29',6),(64,'Papaya',1,0,10,39,'2019-03-27 15:52:24','2019-03-27 15:52:24',6),(65,'Dragon Fruit',2,2,9,60,'2019-03-27 15:53:14','2019-03-27 15:53:14',6),(66,'Watermelon',0.6,0.2,7.6,30,'2019-03-27 15:54:27','2019-03-27 15:54:27',6),(67,'Pineapple',0.5,0.1,13.1,50,'2019-03-27 15:55:50','2019-03-27 15:55:50',6),(68,'Pomegranate',1,0.3,17.2,75,'2019-03-27 15:57:38','2019-03-27 15:57:38',6),(69,'Honeydew (Green Melon)',0.5,0.1,9,36,'2019-03-27 15:58:49','2019-03-27 16:02:42',6),(70,'Yellow Melon (Cantaloupe)',0.8,0.2,8.2,34,'2019-03-27 16:00:50','2019-03-27 16:02:10',6),(71,'Orange',1,0,13,49,'2019-03-27 16:03:37','2019-03-27 16:03:37',6),(72,'Pear',0.4,0.1,15.2,57,'2019-03-27 16:04:42','2019-03-27 16:04:42',6),(73,'Kiwi',1,1,15,61,'2019-03-27 16:05:26','2019-03-27 16:05:26',6),(74,'Salt',0,0,0,0,'2019-03-27 16:26:02','2019-03-27 16:26:02',11),(75,'Pepper',10,3.3,64,64,'2019-03-27 16:27:22','2019-03-27 16:27:22',11),(76,'Lime Juice',0.4,0.1,8.8,26,'2019-03-27 16:29:19','2019-03-27 16:29:19',6),(77,'Radish',0.7,0.1,3.4,16,'2019-03-30 09:04:17','2019-03-30 09:04:17',5),(78,'Lite Soy Sauce (Kikomann)',6.8,0,6.8,68,'2019-03-30 09:05:30','2019-04-01 16:19:19',11),(79,'Sesame Seeds',17.8,50,23.3,578,'2019-03-30 09:18:47','2019-03-30 09:19:56',13),(80,'Peanuts',24.7,49.4,17.6,564,'2019-03-30 09:21:30','2019-03-30 09:21:30',13),(81,'Cashews',17.9,46.4,28.6,571,'2019-03-30 09:22:29','2019-03-30 09:22:29',13),(82,'Almonds',21.1,49.9,21.5,579,'2019-03-30 09:23:12','2019-03-30 09:23:12',13),(83,'Cocoa Powder',19,20.6,19.7,263,'2019-04-01 16:07:38','2019-04-01 16:07:38',11),(84,'Tuttorusso (Crushed Tomato)',1.6,0,8.2,41,'2019-04-01 16:09:25','2019-04-01 16:09:25',11),(86,'Beetroot (Fresh)',1.6,0.2,10,43,'2019-04-01 16:15:05','2019-04-01 16:15:05',5),(87,'Tahina',18,51,24,586,'2019-04-01 16:18:20','2019-04-01 16:18:20',11),(88,'Honey',0.3,0,82.6,304,'2019-04-01 16:22:07','2019-04-01 16:22:07',11),(89,'Coconut Yoghurt',1.5,23.7,3.4,229,'2019-04-01 16:23:31','2019-04-01 16:23:31',7),(90,'Dates (Pitted)',2,0.2,67.2,306,'2019-04-01 16:25:23','2019-04-01 16:25:23',6),(91,'Turmeric (Powder)',0,0,60,240,'2019-04-01 16:29:00','2019-04-01 16:29:00',11),(92,'Oregano (Powder)',9,4.28,68.9,265,'2019-04-01 16:32:20','2019-04-01 16:32:20',11),(93,'Oregano (Fresh)',9,4.3,69,265,'2019-04-01 16:35:21','2019-04-01 16:35:21',11),(94,'Tamari',13.5,0,6.8,81,'2019-04-01 16:37:19','2019-04-01 16:37:19',11),(95,'Balsamic Vinegar',0,0,67.6,271,'2019-04-01 16:39:23','2019-04-01 16:39:23',11),(96,'White Vinegar',0.5,0.4,0.2,24,'2019-04-01 16:40:49','2019-04-01 16:40:49',11),(97,'Peanut Butter',24,21,120,165,'2019-04-01 16:44:06','2019-04-01 16:44:06',11),(98,'Chia Seeds',17,31,8,447,'2019-04-01 16:52:39','2019-04-01 16:52:39',13),(99,'Walnuts',15.2,65.2,13.7,653,'2019-04-01 16:55:18','2019-04-01 16:55:18',13),(100,'Peanuts',24.7,49.4,17.6,564,'2019-04-01 16:56:30','2019-04-01 16:56:30',13),(101,'Cashew Nuts',18.2,43.8,30.1,552,'2019-04-01 16:57:50','2019-04-01 16:57:50',13),(102,'Almonds',21.1,49.9,21.5,579,'2019-04-01 16:59:06','2019-04-01 16:59:06',13),(103,'Bare Dark Chocolate',9,43,33,577,'2019-04-01 17:01:26','2019-04-01 17:01:26',11),(104,'Chocolat Stella (No Added Sugar)',9,42,34,570,'2019-04-01 17:07:15','2019-04-01 18:00:52',11),(105,'Cooking Cream',2.6,12,5.8,134,'2019-04-01 17:15:25','2019-04-01 17:15:25',4),(106,'Hellmans (Light Mayo)',0,23.3,6.7,200,'2019-04-01 17:16:35','2019-04-01 17:16:35',11),(107,'Plain White Flour',10.3,1.3,70.6,345,'2019-04-01 17:18:47','2019-04-01 17:18:47',2),(108,'Wholewheat Flour',13.8,1.6,67.5,338,'2019-04-01 17:19:51','2019-04-01 17:19:51',2),(109,'Rice Noodle',0.9,0.2,24.9,109,'2019-04-01 17:21:16','2019-04-01 17:21:16',2),(110,'Eggplant',1,0.2,6,25,'2019-04-01 17:22:39','2019-04-01 17:22:39',5),(111,'Maple Syrup',0,0,87.9,352,'2019-04-01 17:25:24','2019-04-01 17:25:24',11),(112,'Chickpea Flour',24,8,60,408,'2019-04-01 17:30:27','2019-04-01 17:30:27',2),(113,'Pine Nuts',14,68.6,4,693,'2019-04-01 17:33:37','2019-04-01 17:33:37',13),(114,'Sunflower Seeds',20.8,51.5,20,586,'2019-04-01 17:34:48','2019-04-01 17:34:48',13),(115,'Grapefruit',0.8,0.1,9.8,42,'2019-04-01 17:36:42','2019-04-01 17:36:42',6),(116,'Cumin Powder',17.8,4.8,44.2,375,'2019-04-01 17:39:39','2019-04-01 17:39:39',11),(117,'Rosemary (Fresh)',0.4,0.7,2.4,14,'2019-04-01 17:41:51','2019-04-01 17:41:51',11),(118,'Rosemary (Dried)',4.9,15.2,64.1,331,'2019-04-01 17:43:04','2019-04-01 17:43:04',11),(119,'Lamb (Lean Meat)',17.1,14.6,0,215,'2019-04-01 17:44:24','2019-04-01 17:44:24',1),(120,'Stevia',0,0,0,0,'2019-04-01 17:46:57','2019-04-01 17:46:57',11),(121,'Agave',0,0,108.2,406,'2019-04-01 17:48:23','2019-04-01 17:48:23',11),(122,'Xylitol',0,0,0,0,'2019-04-01 17:49:24','2019-04-01 17:49:24',11),(123,'Cauliflower',2,0.1,5.3,25,'2019-04-01 17:57:31','2019-04-01 17:57:31',5),(124,'Spring Onion',1.8,0.2,7.3,30,'2019-04-01 17:58:54','2019-04-01 17:58:54',5),(125,'Butter (Kerrygold)',0,32.8,0,296,'2019-04-01 18:02:29','2019-04-01 18:02:29',3),(126,'Crisco Vegetable Shortening',0,100,0,875,'2019-04-01 18:05:23','2019-04-01 18:05:23',3),(127,'Earth Balance (Vegan Butter)',0,81.8,0,727,'2019-04-01 18:07:18','2019-04-01 18:07:18',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_types`
--

LOCK TABLES `meal_types` WRITE;
/*!40000 ALTER TABLE `meal_types` DISABLE KEYS */;
INSERT INTO `meal_types` VALUES (8,'Breakfast',30,'2019-04-09 04:39:39','2019-04-09 04:39:39'),(9,'Lunch',50,'2019-04-09 04:39:51','2019-04-09 04:39:51'),(10,'Dinner',20,'2019-04-09 04:39:57','2019-04-09 04:39:57');
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
  `total_calories` int(11) NOT NULL DEFAULT '0',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `total_fats` int(11) NOT NULL DEFAULT '0',
  `total_proteins` int(11) NOT NULL DEFAULT '0',
  `total_carbs` int(11) NOT NULL DEFAULT '0',
  `notes` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meals_kitchen_id_foreign` (`kitchen_id`),
  KEY `meals_meal_type_id_foreign` (`meal_type_id`),
  CONSTRAINT `meals_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meals_meal_type_id_foreign` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (304,'Custom Breakfast Meal (Vegetables)',1,'2019-04-09 04:39:39','2019-04-09 04:39:39',8,0,1,0,0,0,NULL),(305,'Custom Breakfast Meal (Meat)',2,'2019-04-09 04:39:39','2019-04-09 04:39:39',8,0,1,0,0,0,NULL),(306,'Custom Breakfast Meal (Vegetable & Juice)',3,'2019-04-09 04:39:39','2019-04-09 04:39:39',8,0,1,0,0,0,NULL),(307,'Custom Breakfast Meal (Baking)',4,'2019-04-09 04:39:39','2019-04-09 04:39:39',8,0,1,0,0,0,NULL),(308,'Custom Breakfast Meal (Hot Kitchen)',5,'2019-04-09 04:39:39','2019-04-09 04:39:39',8,0,1,0,0,0,NULL),(309,'Custom Breakfast Meal (Vegetables)',1,'2019-04-09 04:39:51','2019-04-09 04:39:51',8,0,1,0,0,0,NULL),(310,'Custom Breakfast Meal (Meat)',2,'2019-04-09 04:39:51','2019-04-09 04:39:51',8,0,1,0,0,0,NULL),(311,'Custom Breakfast Meal (Vegetable & Juice)',3,'2019-04-09 04:39:51','2019-04-09 04:39:51',8,0,1,0,0,0,NULL),(312,'Custom Breakfast Meal (Baking)',4,'2019-04-09 04:39:51','2019-04-09 04:39:51',8,0,1,0,0,0,NULL),(313,'Custom Breakfast Meal (Hot Kitchen)',5,'2019-04-09 04:39:51','2019-04-09 04:39:51',8,0,1,0,0,0,NULL),(314,'Custom Lunch Meal (Vegetables)',1,'2019-04-09 04:39:51','2019-04-09 04:39:51',9,0,1,0,0,0,NULL),(315,'Custom Lunch Meal (Meat)',2,'2019-04-09 04:39:51','2019-04-09 04:39:51',9,0,1,0,0,0,NULL),(316,'Custom Lunch Meal (Vegetable & Juice)',3,'2019-04-09 04:39:51','2019-04-09 04:39:51',9,0,1,0,0,0,NULL),(317,'Custom Lunch Meal (Baking)',4,'2019-04-09 04:39:51','2019-04-09 04:39:51',9,0,1,0,0,0,NULL),(318,'Custom Lunch Meal (Hot Kitchen)',5,'2019-04-09 04:39:51','2019-04-09 04:39:51',9,0,1,0,0,0,NULL),(319,'Custom Breakfast Meal (Vegetables)',1,'2019-04-09 04:39:58','2019-04-09 04:39:58',8,0,1,0,0,0,NULL),(320,'Custom Breakfast Meal (Meat)',2,'2019-04-09 04:39:58','2019-04-09 04:39:58',8,0,1,0,0,0,NULL),(321,'Custom Breakfast Meal (Vegetable & Juice)',3,'2019-04-09 04:39:58','2019-04-09 04:39:58',8,0,1,0,0,0,NULL),(322,'Custom Breakfast Meal (Baking)',4,'2019-04-09 04:39:58','2019-04-09 04:39:58',8,0,1,0,0,0,NULL),(323,'Custom Breakfast Meal (Hot Kitchen)',5,'2019-04-09 04:39:58','2019-04-09 04:39:58',8,0,1,0,0,0,NULL),(324,'Custom Lunch Meal (Vegetables)',1,'2019-04-09 04:39:58','2019-04-09 04:39:58',9,0,1,0,0,0,NULL),(325,'Custom Lunch Meal (Meat)',2,'2019-04-09 04:39:58','2019-04-09 04:39:58',9,0,1,0,0,0,NULL),(326,'Custom Lunch Meal (Vegetable & Juice)',3,'2019-04-09 04:39:58','2019-04-09 04:39:58',9,0,1,0,0,0,NULL),(327,'Custom Lunch Meal (Baking)',4,'2019-04-09 04:39:58','2019-04-09 04:39:58',9,0,1,0,0,0,NULL),(328,'Custom Lunch Meal (Hot Kitchen)',5,'2019-04-09 04:39:58','2019-04-09 04:39:58',9,0,1,0,0,0,NULL),(329,'Custom Dinner Meal (Vegetables)',1,'2019-04-09 04:39:58','2019-04-09 04:39:58',10,0,1,0,0,0,NULL),(330,'Custom Dinner Meal (Meat)',2,'2019-04-09 04:39:58','2019-04-09 04:39:58',10,0,1,0,0,0,NULL),(331,'Custom Dinner Meal (Vegetable & Juice)',3,'2019-04-09 04:39:58','2019-04-09 04:39:58',10,0,1,0,0,0,NULL),(332,'Custom Dinner Meal (Baking)',4,'2019-04-09 04:39:58','2019-04-09 04:39:58',10,0,1,0,0,0,NULL),(333,'Custom Dinner Meal (Hot Kitchen)',5,'2019-04-09 04:39:58','2019-04-09 04:39:58',10,0,1,0,0,0,NULL),(334,'Non qui fugit. (Meal)',2,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,582,0,8,5,127,NULL),(335,'Dicta voluptas. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',10,738,0,61,21,38,NULL),(336,'Numquam autem. (Meal)',2,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,664,0,50,36,35,NULL),(337,'Eaque. (Meal)',5,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,609,0,5,11,146,NULL),(338,'Eum officia. (Meal)',3,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,133,0,3,7,22,NULL),(339,'Eos ut odit. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,551,0,41,20,31,NULL),(340,'Qui. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,254,0,3,12,33,NULL),(341,'Vitae est quia. (Meal)',1,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,1129,0,55,39,210,NULL),(342,'Quaerat qui. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,17,0,0,0,4,NULL),(343,'Rerum eos. (Meal)',1,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,381,0,2,4,87,NULL),(344,'Sint quia qui. (Meal)',3,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,840,0,56,16,64,NULL),(345,'Veritatis sunt. (Meal)',1,'2019-04-09 04:40:10','2019-04-09 04:40:11',10,678,0,48,31,26,NULL),(346,'Impedit et hic. (Meal)',1,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,483,0,47,4,9,NULL),(347,'Voluptates. (Meal)',5,'2019-04-09 04:40:10','2019-04-09 04:40:11',10,641,0,8,8,146,NULL),(348,'Pariatur. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,1589,0,136,37,84,NULL),(349,'Officiis qui. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,784,0,24,42,99,NULL),(350,'Quas rerum aut. (Meal)',2,'2019-04-09 04:40:10','2019-04-09 04:40:11',10,304,0,5,10,54,NULL),(351,'Cumque. (Meal)',5,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,484,0,7,24,99,NULL),(352,'Ea vero et. (Meal)',4,'2019-04-09 04:40:10','2019-04-09 04:40:11',8,653,0,32,10,82,NULL),(353,'Qui maxime. (Meal)',2,'2019-04-09 04:40:10','2019-04-09 04:40:11',9,264,0,14,23,12,NULL),(354,'Dolor sunt sit. (Meal)',4,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,231,0,17,3,20,NULL),(355,'Error in. (Meal)',3,'2019-04-09 04:40:15','2019-04-09 04:40:16',9,736,0,65,21,31,NULL),(356,'Quia. (Meal)',1,'2019-04-09 04:40:15','2019-04-09 04:40:16',9,639,0,36,11,70,NULL),(357,'Aut eum sunt. (Meal)',2,'2019-04-09 04:40:15','2019-04-09 04:40:16',9,600,0,31,51,36,NULL),(358,'Omnis. (Meal)',4,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,58,0,1,2,10,NULL),(359,'Et ut eligendi. (Meal)',3,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,390,0,2,9,90,NULL),(360,'Dolore tenetur. (Meal)',4,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,78,0,2,10,5,NULL),(361,'Quae eveniet. (Meal)',3,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,454,0,37,16,23,NULL),(362,'Qui. (Meal)',5,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,68,0,8,10,16,NULL),(363,'Est debitis. (Meal)',4,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,384,0,12,15,62,NULL),(364,'Dignissimos. (Meal)',5,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,1511,0,75,49,160,NULL),(365,'At aperiam qui. (Meal)',3,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,1120,0,60,18,130,NULL),(366,'Ipsa id. (Meal)',1,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,722,0,54,43,15,NULL),(367,'Nesciunt. (Meal)',1,'2019-04-09 04:40:15','2019-04-09 04:40:16',9,1251,0,95,44,68,NULL),(368,'Quia quod. (Meal)',2,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,523,0,3,27,98,NULL),(369,'Dolorem. (Meal)',2,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,549,0,54,1,16,NULL),(370,'Ut ducimus. (Meal)',2,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,634,0,21,31,88,NULL),(371,'Eius quibusdam. (Meal)',4,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,1381,0,60,61,235,NULL),(372,'Corporis quas. (Meal)',3,'2019-04-09 04:40:15','2019-04-09 04:40:16',10,609,0,34,22,58,NULL),(373,'Vel qui est. (Meal)',5,'2019-04-09 04:40:15','2019-04-09 04:40:16',8,624,0,31,12,88,NULL),(374,'Veniam. (Meal)',5,'2019-04-09 04:40:17','2019-04-09 04:40:18',9,457,0,7,23,59,NULL),(375,'Similique. (Meal)',2,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,1363,0,132,25,31,NULL),(376,'Dolores nemo. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',10,773,0,6,33,152,NULL),(377,'Dolore quis et. (Meal)',1,'2019-04-09 04:40:18','2019-04-09 04:40:18',10,971,0,53,50,87,NULL),(378,'Quia. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,746,0,4,36,122,NULL),(379,'Nobis corrupti. (Meal)',2,'2019-04-09 04:40:18','2019-04-09 04:40:18',10,579,0,44,21,34,NULL),(380,'Qui quod. (Meal)',3,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,643,0,46,23,50,NULL),(381,'Esse nihil. (Meal)',3,'2019-04-09 04:40:18','2019-04-09 04:40:18',10,583,0,52,6,30,NULL),(382,'A suscipit. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,812,0,50,46,45,NULL),(383,'Error pariatur. (Meal)',5,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,1416,0,72,12,176,NULL),(384,'Atque quia. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,507,0,22,27,50,NULL),(385,'Architecto. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,288,0,2,8,61,NULL),(386,'Velit quia. (Meal)',1,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,201,0,5,22,18,NULL),(387,'Sed cumque. (Meal)',3,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,220,0,21,27,125,NULL),(388,'Dolorem itaque. (Meal)',4,'2019-04-09 04:40:18','2019-04-09 04:40:18',10,1968,0,186,21,105,NULL),(389,'Nihil incidunt. (Meal)',2,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,629,0,10,46,80,NULL),(390,'Aut id. (Meal)',2,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,101,0,1,5,18,NULL),(391,'Provident. (Meal)',2,'2019-04-09 04:40:18','2019-04-09 04:40:18',8,341,0,0,7,77,NULL),(392,'Quod nesciunt. (Meal)',3,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,877,0,27,39,118,NULL),(393,'Ratione magnam. (Meal)',1,'2019-04-09 04:40:18','2019-04-09 04:40:18',9,520,0,27,18,59,NULL),(394,'Magni dolores. (Meal)',1,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,887,0,53,25,104,NULL),(395,'In non non et. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,383,0,3,6,92,NULL),(396,'Voluptas. (Meal)',5,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,741,0,30,17,103,NULL),(397,'Est eum nulla. (Meal)',1,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,702,0,42,16,72,NULL),(398,'Dolor. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,619,0,50,19,33,NULL),(399,'Aut quam sint. (Meal)',4,'2019-04-09 04:40:20','2019-04-09 04:40:20',9,36,0,0,1,9,NULL),(400,'Incidunt qui. (Meal)',4,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,452,0,1,4,116,NULL),(401,'Omnis. (Meal)',5,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,255,0,3,12,97,NULL),(402,'Dolorem. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',9,1016,0,34,38,119,NULL),(403,'Magni repellat. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,701,0,6,23,142,NULL),(404,'Non neque sed. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,400,0,11,13,65,NULL),(405,'Non sunt ad. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',9,1696,0,91,54,194,NULL),(406,'In nihil est. (Meal)',5,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,298,0,5,12,70,NULL),(407,'Quisquam nulla. (Meal)',4,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,347,0,1,5,83,NULL),(408,'Molestias. (Meal)',2,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,388,0,1,5,88,NULL),(409,'Aut et facere. (Meal)',4,'2019-04-09 04:40:20','2019-04-09 04:40:20',9,1154,0,70,47,115,NULL),(410,'Sequi itaque. (Meal)',4,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,74,0,0,1,17,NULL),(411,'Non ratione. (Meal)',1,'2019-04-09 04:40:20','2019-04-09 04:40:20',9,902,0,55,13,90,NULL),(412,'Laboriosam. (Meal)',1,'2019-04-09 04:40:20','2019-04-09 04:40:20',8,28,0,0,1,6,NULL),(413,'Officia aut. (Meal)',1,'2019-04-09 04:40:20','2019-04-09 04:40:20',10,376,0,3,11,80,NULL),(414,'Quas aliquam. (Meal)',4,'2019-04-09 04:40:31','2019-04-09 04:40:31',9,262,0,3,13,38,NULL),(415,'Similique eius. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:31',10,845,0,4,35,175,NULL),(416,'Quia facere et. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:31',8,104,0,0,12,16,NULL),(417,'Consequuntur. (Meal)',5,'2019-04-09 04:40:31','2019-04-09 04:40:31',8,101,0,9,1,6,NULL),(418,'Aut sunt autem. (Meal)',4,'2019-04-09 04:40:31','2019-04-09 04:40:31',9,825,0,43,29,66,NULL),(419,'Voluptatibus. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:31',8,84,0,1,3,20,NULL),(420,'Qui beatae. (Meal)',3,'2019-04-09 04:40:31','2019-04-09 04:40:31',9,229,0,17,6,11,NULL),(421,'Et dolores. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:32',10,709,0,52,28,37,NULL),(422,'Ullam laborum. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:32',8,116,0,1,7,17,NULL),(423,'Quis et magni. (Meal)',2,'2019-04-09 04:40:31','2019-04-09 04:40:32',10,1215,0,54,21,162,NULL),(424,'Nihil aperiam. (Meal)',1,'2019-04-09 04:40:31','2019-04-09 04:40:32',10,276,0,4,9,67,NULL),(425,'Sit asperiores. (Meal)',4,'2019-04-09 04:40:31','2019-04-09 04:40:32',8,768,0,35,66,33,NULL),(426,'Ut qui hic. (Meal)',5,'2019-04-09 04:40:31','2019-04-09 04:40:32',10,852,0,58,32,73,NULL),(427,'Non quia nemo. (Meal)',2,'2019-04-09 04:40:31','2019-04-09 04:40:32',8,598,0,31,16,64,NULL),(428,'Aperiam. (Meal)',2,'2019-04-09 04:40:31','2019-04-09 04:40:32',8,590,0,48,16,10,NULL),(429,'Cupiditate. (Meal)',2,'2019-04-09 04:40:31','2019-04-09 04:40:32',9,770,0,69,21,15,NULL),(430,'Aut laborum. (Meal)',4,'2019-04-09 04:40:31','2019-04-09 04:40:32',10,1040,0,109,12,11,NULL),(431,'Ex ut totam. (Meal)',2,'2019-04-09 04:40:31','2019-04-09 04:40:32',9,593,0,50,26,18,NULL),(432,'Veritatis qui. (Meal)',3,'2019-04-09 04:40:31','2019-04-09 04:40:32',8,1146,0,65,32,106,NULL),(433,'Quibusdam. (Meal)',4,'2019-04-09 04:40:31','2019-04-09 04:40:32',9,1257,0,52,25,193,NULL);
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
  `parameters` text COLLATE utf8mb4_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_01_09_110215_create_customers_table',1),(24,'2019_01_09_110254_create_plans_table',1),(25,'2019_01_09_110402_add_plan_id_to_customers_table',1),(26,'2019_01_09_110546_add_status_to_customers_table',1),(27,'2019_01_09_110716_create_kitchens_table',1),(28,'2019_01_09_110824_create_ingredients_table',1),(29,'2019_01_09_110916_create_meal_categories_table',1),(30,'2019_01_09_111048_create_meals_table',1),(31,'2019_01_09_111130_create_weeks_table',1),(32,'2019_01_09_111326_create_customer_meal_pivot_table',1),(33,'2019_01_09_112036_create_ingredient_meal_pivot_table',1),(34,'2019_01_14_102833_create_plan_prohibited_ingredients_table',1),(35,'2019_01_15_081132_create_customers_allergic_ingredients_table',1),(36,'2019_01_15_121229_create_meal_types_table',1),(37,'2019_01_15_133301_add_meal_type_id_to_meals_table',1),(38,'2019_01_16_092449_add_name_to_weeks_table',1),(39,'2019_01_17_124041_create_week_meals_table',1),(40,'2019_01_17_124506_create_customer_meals_table',1),(41,'2019_01_24_061644_add_total_calories_to_meals_table',1),(42,'2019_02_03_064243_create_additional_ingredients_table',1),(43,'2019_02_04_092556_add_total_calories_to_customer_meals_table',1),(44,'2019_02_10_122311_add_cooked_to_customer_meals_table',1),(45,'2019_02_13_062734_create_ingredient_types_table',1),(46,'2019_02_13_062823_add_ingredient_type_to_ingredients_table',1),(47,'2019_02_13_072630_create_customer_disliked_ingredients',1),(48,'2019_02_13_104026_create_customer_ingredients_amount_table',1),(49,'2019_02_24_060216_add_removable_to_ingredient_meal_table',1),(50,'2019_03_03_085213_add_meal_type_id_to_customer_ingredients_amount_table',1),(51,'2019_03_04_063725_add_custom_to_meals_table',1),(52,'2019_03_04_081014_add_kitchen_id_to_ingredient_types_table',1),(53,'2019_03_05_055421_create_customer_meal_custom_amounts_table',1),(54,'2019_03_14_065526_add_total_fats_to_meals_table',1),(55,'2019_03_14_065536_add_total_proteins_to_meals_table',1),(56,'2019_03_14_065537_add_total_carbs_to_meals_table',1),(57,'2019_03_14_065539_add_total_fats_to_customer_meals_table',1),(58,'2019_03_14_065540_add_total_proteins_to_customer_meals_table',1),(59,'2019_03_14_065541_add_total_carbs_to_customer_meals_table',1),(60,'2019_04_08_104832_create_customers_allergic_ingredient_types',2),(61,'2019_04_08_105038_create_plan_prohibited_ingredient_types',2),(62,'2019_04_09_131923_make_ingredient_type_id_and_amount_nullable_in_customer_ingredients_amount_table',3),(64,'2019_04_09_132525_create_customer_program_table',4),(65,'2019_04_15_130521_add_meal_notes_to_meals_table',5),(66,'2019_04_17_104031_add_meal_notes_to_customer_meal_table',6),(67,'2019_04_17_112140_add_notes_to_customer_meals_table',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_prohibited_ingredient_types`
--

LOCK TABLES `plan_prohibited_ingredient_types` WRITE;
/*!40000 ALTER TABLE `plan_prohibited_ingredient_types` DISABLE KEYS */;
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
INSERT INTO `plan_prohibited_ingredients` VALUES (1,2,'2019-04-09 08:01:45','2019-04-09 08:01:45'),(6,2,'2019-04-09 07:55:28','2019-04-09 07:55:28'),(6,3,'2019-04-09 07:52:18','2019-04-09 07:52:18'),(6,26,'2019-04-09 07:57:47','2019-04-09 07:57:47'),(1,105,'2019-04-09 08:02:15','2019-04-09 08:02:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Lunch Meals','2019-03-26 17:03:05','2019-03-26 17:03:05'),(2,'Weightloss Meals','2019-03-26 17:03:17','2019-03-26 17:03:17'),(3,'Klean Meals','2019-03-26 17:03:24','2019-03-26 17:03:24'),(4,'Retox','2019-03-26 17:03:31','2019-03-26 17:03:31'),(5,'Juice Cleanse','2019-03-26 17:03:41','2019-03-26 17:03:41'),(6,'Vegan','2019-04-09 07:03:04','2019-04-09 07:03:04');
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
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
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
INSERT INTO `settings` VALUES (1,'site.title','Site Title','The Natural Kitchen','','text',1,'Site'),(2,'site.description','Site Description','The Natural Kitchen','','text',2,'Site'),(3,'site.logo','Site Logo','settings/March2019/Xf0TuG9JRJmKAtFGWVzo.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/April2019/uaS6EPinO22w6aPeS3nc.png','','image',5,'Admin'),(6,'admin.title','Admin Title','Mannai-Tech Admin Panel','','text',1,'Admin'),(7,'admin.description','Admin Description','Mannai-Tech Admin Panel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings/April2019/cWEC98oafi6YyudAqADQ.png','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/April2019/5X7k5hvSIgCHXbX7dS3W.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(11,'calories.tolerance','Calories Tolerance','200',NULL,'text',6,'Calories'),(12,'site.bg_image','Homepage Background Image','settings/April2019/nc0xca23aeE3U53To6hq.jpg',NULL,'image',7,'Site'),(15,'widgets.customers_widget_image','Customers Widget Image','settings/March2019/WdQ8DqwI4KZxisJKvYnc.png',NULL,'image',8,'Widgets');
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
  `settings` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `users` VALUES (1,1,'Admin','admin@tnk.test','users/April2019/INDRpKDFIgUwDjrMT2qe.png',NULL,'$2y$10$UE1YpKbOvdfgLFByFjuBkOJXCfnZrJaAINnAkKVE50qEu1/TqXFge',NULL,'{\"locale\":\"en\"}','2019-03-17 13:22:24','2019-04-07 04:27:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_meals`
--

LOCK TABLES `week_meals` WRITE;
/*!40000 ALTER TABLE `week_meals` DISABLE KEYS */;
INSERT INTO `week_meals` VALUES (39,1,8,336,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(40,1,8,339,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(41,1,8,341,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(42,1,8,343,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(43,1,9,334,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(44,1,8,346,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(45,1,10,335,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(46,1,9,337,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(47,1,10,345,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(48,1,8,351,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(49,1,9,338,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(50,1,10,347,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(51,1,9,340,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(52,1,8,352,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(53,1,10,350,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(54,1,9,342,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(55,1,8,358,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(56,1,10,354,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(57,1,9,344,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(58,1,8,359,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(59,1,10,362,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(60,1,9,348,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(61,1,8,360,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(62,1,10,364,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(63,1,9,349,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(64,1,10,365,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(65,1,8,361,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(66,1,9,353,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(67,1,8,363,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(68,1,10,366,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(69,1,9,355,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(70,1,8,368,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(71,1,10,369,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(72,1,9,356,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(73,1,8,373,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(74,1,10,370,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(75,1,9,357,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(76,1,8,380,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(77,1,10,371,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(78,1,9,367,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(79,1,8,382,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(80,1,10,372,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(81,1,9,374,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(82,1,8,383,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(83,1,10,376,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(84,1,9,375,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(85,1,8,384,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(86,1,10,377,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(87,1,9,378,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(88,1,8,385,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(89,1,10,379,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(90,1,9,386,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(91,1,8,389,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(92,1,10,381,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(93,1,9,387,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(94,1,8,390,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(95,1,10,388,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(96,1,9,392,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(97,1,8,391,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(98,1,10,395,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(99,1,9,393,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(100,1,8,394,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(101,1,9,399,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(102,1,10,396,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(103,1,8,398,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(104,1,9,402,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(105,1,10,397,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(106,1,8,400,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(107,1,9,405,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(108,1,10,403,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(109,1,8,401,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(110,1,9,409,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(111,1,10,406,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(112,1,8,404,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(113,1,10,413,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(114,1,8,407,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(115,1,9,411,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(116,1,10,415,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(117,1,8,408,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(118,1,9,414,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(119,1,10,421,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(120,1,8,410,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(121,1,9,418,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(122,1,10,423,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(123,1,8,412,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(124,1,9,420,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(125,1,10,424,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(126,1,8,416,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(127,1,9,429,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(128,1,10,426,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(129,1,8,417,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(130,1,9,431,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(131,1,10,430,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(132,1,8,419,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(133,1,9,433,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(134,1,8,422,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(135,1,8,425,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(136,1,8,427,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(137,1,8,428,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(138,1,8,432,'2019-04-01','2019-04-09 04:52:02','2019-04-09 04:52:02'),(139,1,8,336,'2019-04-02','2019-04-09 04:52:08','2019-04-09 04:52:08'),(140,1,9,334,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(141,1,8,339,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(142,1,10,335,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(143,1,9,337,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(144,1,8,341,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(145,1,10,345,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(146,1,9,338,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(147,1,8,343,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(148,1,10,347,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(149,1,9,340,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(150,1,8,346,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(151,1,10,350,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(152,1,9,342,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(153,1,10,354,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(154,1,9,344,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(155,1,8,351,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(156,1,10,362,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(157,1,9,348,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(158,1,8,352,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(159,1,10,364,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(160,1,9,349,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(161,1,8,358,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(162,1,10,365,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(163,1,9,353,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(164,1,8,359,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(165,1,10,366,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(166,1,9,355,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(167,1,8,360,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(168,1,10,369,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(169,1,9,356,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(170,1,8,361,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(171,1,10,370,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(172,1,9,357,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(173,1,8,363,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(174,1,10,371,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(175,1,9,367,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(176,1,8,368,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(177,1,10,372,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(178,1,9,374,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(179,1,8,373,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(180,1,10,376,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(181,1,9,375,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(182,1,8,380,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(183,1,10,377,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(184,1,9,378,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(185,1,8,382,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(186,1,10,379,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(187,1,9,386,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(188,1,10,381,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(189,1,8,383,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(190,1,9,387,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(191,1,10,388,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(192,1,8,384,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(193,1,9,392,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(194,1,10,395,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(195,1,8,385,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(196,1,9,393,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(197,1,10,396,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(198,1,8,389,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(199,1,9,399,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(200,1,10,397,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(201,1,8,390,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(202,1,9,402,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(203,1,8,391,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(204,1,10,403,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(205,1,8,394,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(206,1,9,405,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(207,1,10,406,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(208,1,8,398,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(209,1,9,409,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(210,1,10,413,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(211,1,8,400,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(212,1,10,415,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(213,1,9,411,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(214,1,8,401,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(215,1,9,414,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(216,1,10,421,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(217,1,8,404,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(218,1,9,418,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(219,1,10,423,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(220,1,8,407,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(221,1,9,420,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(222,1,10,424,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(223,1,8,408,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(224,1,9,429,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(225,1,10,426,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(226,1,8,410,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(227,1,9,431,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(228,1,10,430,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(229,1,8,412,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(230,1,9,433,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(231,1,8,416,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(232,1,8,417,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(233,1,8,419,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(234,1,8,422,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(235,1,8,425,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(236,1,8,427,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(237,1,8,428,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(238,1,8,432,'2019-04-02','2019-04-09 04:52:09','2019-04-09 04:52:09'),(239,1,9,334,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(240,1,8,336,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(241,1,10,335,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(242,1,9,337,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(243,1,10,345,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(244,1,8,339,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(245,1,9,338,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(246,1,10,347,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(247,1,9,340,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(248,1,10,350,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(249,1,8,341,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(250,1,9,342,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(251,1,8,343,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(252,1,10,354,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(253,1,9,344,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(254,1,8,346,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(255,1,9,348,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(256,1,10,362,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(257,1,8,351,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(258,1,9,349,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(259,1,8,352,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(260,1,10,364,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(261,1,9,353,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(262,1,8,358,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(263,1,10,365,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(264,1,8,359,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(265,1,9,355,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(266,1,10,366,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(267,1,8,360,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(268,1,9,356,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(269,1,10,369,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(270,1,8,361,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(271,1,9,357,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(272,1,8,363,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(273,1,10,370,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(274,1,9,367,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(275,1,8,368,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(276,1,10,371,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(277,1,9,374,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(278,1,8,373,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(279,1,10,372,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(280,1,9,375,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(281,1,8,380,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(282,1,10,376,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(283,1,9,378,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(284,1,10,377,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(285,1,8,382,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(286,1,9,386,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(287,1,10,379,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(288,1,8,383,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(289,1,9,387,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(290,1,10,381,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(291,1,8,384,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(292,1,9,392,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(293,1,10,388,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(294,1,8,385,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(295,1,9,393,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(296,1,10,395,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(297,1,8,389,'2019-04-03','2019-04-09 04:52:18','2019-04-09 04:52:18'),(298,1,9,399,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(299,1,10,396,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(300,1,8,390,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(301,1,9,402,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(302,1,10,397,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(303,1,8,391,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(304,1,9,405,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(305,1,10,403,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(306,1,8,394,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(307,1,9,409,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(308,1,10,406,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(309,1,8,398,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(310,1,9,411,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(311,1,10,413,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(312,1,8,400,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(313,1,9,414,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(314,1,10,415,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(315,1,8,401,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(316,1,9,418,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(317,1,10,421,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(318,1,8,404,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(319,1,9,420,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(320,1,10,423,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(321,1,8,407,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(322,1,9,429,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(323,1,10,424,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(324,1,8,408,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(325,1,9,431,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(326,1,10,426,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(327,1,8,410,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(328,1,9,433,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(329,1,10,430,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(330,1,8,412,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(331,1,8,416,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(332,1,8,417,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(333,1,8,419,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(334,1,8,422,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(335,1,8,425,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(336,1,8,427,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(337,1,8,428,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(338,1,8,432,'2019-04-03','2019-04-09 04:52:19','2019-04-09 04:52:19'),(339,1,10,335,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(340,1,9,334,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(341,1,10,345,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(342,1,8,336,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(343,1,9,337,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(344,1,8,339,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(345,1,10,347,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(346,1,9,338,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(347,1,10,350,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(348,1,8,341,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(349,1,9,340,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(350,1,10,354,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(351,1,8,343,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(352,1,9,342,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(353,1,8,346,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(354,1,10,362,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(355,1,8,351,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(356,1,9,344,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(357,1,10,364,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(358,1,8,352,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(359,1,9,348,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(360,1,10,365,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(361,1,8,358,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(362,1,9,349,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(363,1,10,366,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(364,1,8,359,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(365,1,9,353,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(366,1,10,369,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(367,1,8,360,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(368,1,9,355,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(369,1,10,370,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(370,1,9,356,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(371,1,8,361,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(372,1,10,371,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(373,1,9,357,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(374,1,8,363,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(375,1,10,372,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(376,1,9,367,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(377,1,10,376,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(378,1,8,368,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(379,1,9,374,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(380,1,10,377,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(381,1,8,373,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(382,1,9,375,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(383,1,8,380,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(384,1,10,379,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(385,1,9,378,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(386,1,8,382,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(387,1,10,381,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(388,1,8,383,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(389,1,10,388,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(390,1,9,386,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(391,1,8,384,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(392,1,10,395,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(393,1,9,387,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(394,1,8,385,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(395,1,10,396,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(396,1,9,392,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(397,1,8,389,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(398,1,9,393,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(399,1,10,397,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(400,1,8,390,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(401,1,9,399,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(402,1,8,391,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(403,1,10,403,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(404,1,9,402,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(405,1,8,394,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(406,1,10,406,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(407,1,9,405,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(408,1,8,398,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(409,1,9,409,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(410,1,10,413,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(411,1,8,400,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(412,1,9,411,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(413,1,10,415,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(414,1,8,401,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(415,1,9,414,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(416,1,10,421,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(417,1,8,404,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(418,1,9,418,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(419,1,10,423,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(420,1,8,407,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(421,1,9,420,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(422,1,10,424,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(423,1,8,408,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(424,1,9,429,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(425,1,10,426,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(426,1,8,410,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(427,1,9,431,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(428,1,10,430,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(429,1,8,412,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(430,1,9,433,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(431,1,8,416,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(432,1,8,417,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(433,1,8,419,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(434,1,8,422,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(435,1,8,425,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(436,1,8,427,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(437,1,8,428,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(438,1,8,432,'2019-04-04','2019-04-09 04:52:22','2019-04-09 04:52:22'),(439,1,9,334,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(440,1,10,335,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(441,1,10,345,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(442,1,9,337,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(443,1,10,347,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(444,1,9,338,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(445,1,10,350,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(446,1,9,340,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(447,1,10,354,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(448,1,9,342,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(449,1,10,362,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(450,1,9,344,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(451,1,10,364,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(452,1,9,348,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(453,1,10,365,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(454,1,9,349,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(455,1,10,366,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(456,1,9,353,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(457,1,10,369,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(458,1,9,355,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(459,1,10,370,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(460,1,9,356,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(461,1,10,371,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(462,1,9,357,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(463,1,10,372,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(464,1,9,367,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(465,1,10,376,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(466,1,9,374,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(467,1,10,377,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(468,1,9,375,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(469,1,10,379,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(470,1,9,378,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(471,1,10,381,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(472,1,9,386,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(473,1,10,388,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(474,1,9,387,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(475,1,10,395,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(476,1,9,392,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(477,1,10,396,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(478,1,9,393,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(479,1,10,397,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(480,1,9,399,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(481,1,8,336,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(482,1,10,403,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(483,1,8,339,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(484,1,9,402,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(485,1,10,406,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(486,1,8,341,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(487,1,9,405,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(488,1,10,413,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(489,1,9,409,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(490,1,8,343,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(491,1,10,415,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(492,1,9,411,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(493,1,8,346,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(494,1,10,421,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(495,1,9,414,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(496,1,8,351,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(497,1,10,423,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(498,1,9,418,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(499,1,8,352,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(500,1,10,424,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(501,1,9,420,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(502,1,8,358,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(503,1,10,426,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(504,1,9,429,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(505,1,8,359,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(506,1,10,430,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(507,1,9,431,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(508,1,8,360,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(509,1,9,433,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(510,1,8,361,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(512,1,8,368,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(513,1,8,373,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(514,1,8,380,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(515,1,8,382,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(516,1,8,383,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(517,1,8,384,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(518,1,8,385,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(519,1,8,389,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(520,1,8,390,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(521,1,8,391,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(522,1,8,394,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(523,1,8,398,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(524,1,8,400,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(525,1,8,401,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(526,1,8,404,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(527,1,8,407,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(528,1,8,408,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(529,1,8,410,'2019-04-05','2019-04-09 04:52:26','2019-04-09 04:52:26'),(530,1,8,412,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(531,1,8,416,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(532,1,8,417,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(533,1,8,419,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(534,1,8,422,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(535,1,8,425,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(536,1,8,427,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(537,1,8,428,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(538,1,8,432,'2019-04-05','2019-04-09 04:52:27','2019-04-09 04:52:27'),(539,1,9,334,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(540,1,8,336,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(541,1,9,337,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(542,1,8,339,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(543,1,9,338,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(544,1,8,341,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(545,1,9,340,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(546,1,8,343,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(547,1,9,342,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(548,1,8,346,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(549,1,9,344,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(550,1,8,351,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(551,1,9,348,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(552,1,8,352,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(553,1,10,335,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(554,1,9,349,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(555,1,8,358,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(556,1,10,345,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(557,1,9,353,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(558,1,8,359,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(559,1,9,355,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(560,1,10,347,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(561,1,8,360,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(562,1,10,350,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(563,1,9,356,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(564,1,8,361,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(565,1,9,357,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(566,1,10,354,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(567,1,8,363,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(568,1,9,367,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(569,1,10,362,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(570,1,8,368,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(571,1,9,374,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(572,1,10,364,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(573,1,8,373,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(574,1,9,375,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(575,1,10,365,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(576,1,8,380,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(577,1,9,378,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(578,1,10,366,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(579,1,8,382,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(580,1,9,386,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(581,1,10,369,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(582,1,8,383,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(583,1,10,370,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(584,1,9,387,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(585,1,8,384,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(586,1,10,371,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(587,1,9,392,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(588,1,8,385,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(589,1,9,393,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(590,1,10,372,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(591,1,8,389,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(592,1,10,376,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(593,1,9,399,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(594,1,8,390,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(595,1,10,377,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(596,1,9,402,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(597,1,8,391,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(598,1,10,379,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(599,1,9,405,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(600,1,8,394,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(601,1,10,381,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(602,1,9,409,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(603,1,8,398,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(604,1,10,388,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(605,1,9,411,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(606,1,8,400,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(607,1,10,395,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(608,1,9,414,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(609,1,8,401,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(610,1,10,396,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(611,1,9,418,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(612,1,8,404,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(613,1,10,397,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(614,1,9,420,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(615,1,8,407,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(616,1,10,403,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(617,1,9,429,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(618,1,8,408,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(619,1,10,406,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(620,1,9,431,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(621,1,8,410,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(622,1,10,413,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(623,1,9,433,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(624,1,8,412,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(625,1,10,415,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(626,1,8,416,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(627,1,10,421,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(628,1,8,417,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(629,1,10,423,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(630,1,8,419,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(631,1,10,424,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(632,1,8,422,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(633,1,10,426,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(634,1,8,425,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(635,1,10,430,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(636,1,8,427,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(637,1,8,428,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(638,1,8,432,'2019-04-06','2019-04-09 04:52:32','2019-04-09 04:52:32'),(639,1,8,336,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(640,1,9,334,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(641,1,10,335,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(642,1,8,339,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(643,1,10,345,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(644,1,9,337,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(645,1,8,341,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(646,1,10,347,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(647,1,9,338,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(648,1,8,343,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(649,1,10,350,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(650,1,9,340,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(651,1,8,346,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(652,1,10,354,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(653,1,9,342,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(654,1,8,351,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(655,1,10,362,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(656,1,9,344,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(657,1,8,352,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(658,1,10,364,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(659,1,9,348,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(660,1,8,358,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(661,1,10,365,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(662,1,9,349,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(663,1,8,359,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(664,1,10,366,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(665,1,9,353,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(666,1,10,369,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(667,1,8,360,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(668,1,9,355,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(669,1,10,370,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(670,1,8,361,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(671,1,9,356,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(672,1,10,371,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(673,1,8,363,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(674,1,9,357,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(675,1,10,372,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(676,1,8,368,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(677,1,9,367,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(678,1,10,376,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(679,1,8,373,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(680,1,9,374,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(681,1,10,377,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(682,1,8,380,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(683,1,9,375,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(684,1,10,379,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(685,1,8,382,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(686,1,9,378,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(687,1,10,381,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(688,1,8,383,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(689,1,9,386,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(690,1,10,388,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(691,1,8,384,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(692,1,9,387,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(693,1,8,385,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(694,1,10,395,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(695,1,9,392,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(696,1,8,389,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(697,1,10,396,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(698,1,9,393,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(699,1,8,390,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(700,1,10,397,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(701,1,9,399,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(702,1,10,403,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(703,1,8,391,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(704,1,9,402,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(705,1,10,406,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(706,1,8,394,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(707,1,9,405,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(708,1,10,413,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(709,1,8,398,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(710,1,9,409,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(711,1,10,415,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(712,1,8,400,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(713,1,9,411,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(714,1,10,421,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(715,1,8,401,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(716,1,9,414,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(717,1,10,423,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(718,1,8,404,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(719,1,9,418,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(720,1,10,424,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(721,1,8,407,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(722,1,9,420,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(723,1,10,426,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(724,1,8,408,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(725,1,9,429,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(726,1,10,430,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(727,1,8,410,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(728,1,9,431,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(729,1,8,412,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(730,1,9,433,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(731,1,8,416,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(732,1,8,417,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(733,1,8,419,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(734,1,8,422,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(735,1,8,425,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(736,1,8,427,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(737,1,8,428,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(738,1,8,432,'2019-04-07','2019-04-09 04:52:36','2019-04-09 04:52:36'),(739,1,8,363,'2019-04-05','2019-04-10 07:45:58','2019-04-10 07:45:58'),(740,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(741,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(742,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(743,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(744,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(745,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(746,1,8,308,'0000-00-00','2019-04-17 07:43:59','2019-04-17 07:43:59'),(747,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(748,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(749,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(750,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(751,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(752,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(753,1,8,304,'0000-00-00','2019-04-17 07:44:16','2019-04-17 07:44:16'),(754,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(755,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(756,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(757,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(758,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(759,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(760,1,8,304,'0000-00-00','2019-04-17 07:44:18','2019-04-17 07:44:18'),(761,1,8,304,'0000-00-00','2019-04-17 07:44:25','2019-04-17 07:44:25'),(762,1,8,304,'0000-00-00','2019-04-17 07:44:25','2019-04-17 07:44:25'),(763,1,8,304,'0000-00-00','2019-04-17 07:44:26','2019-04-17 07:44:26'),(764,1,8,304,'0000-00-00','2019-04-17 07:44:26','2019-04-17 07:44:26'),(765,1,8,304,'0000-00-00','2019-04-17 07:44:26','2019-04-17 07:44:26'),(766,1,8,304,'0000-00-00','2019-04-17 07:44:26','2019-04-17 07:44:26'),(767,1,8,304,'0000-00-00','2019-04-17 07:44:26','2019-04-17 07:44:26'),(768,1,8,306,'0000-00-00','2019-04-17 07:45:12','2019-04-17 07:45:12'),(769,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(770,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(771,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(772,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(773,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(774,1,8,306,'0000-00-00','2019-04-17 07:45:13','2019-04-17 07:45:13'),(775,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(776,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(777,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(778,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(779,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(780,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(781,1,8,306,'0000-00-00','2019-04-17 07:45:27','2019-04-17 07:45:27'),(782,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(783,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(784,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(785,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(786,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(787,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(788,1,8,308,'0000-00-00','2019-04-17 07:45:37','2019-04-17 07:45:37'),(789,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(790,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(791,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(792,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(793,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(794,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(795,1,8,304,'0000-00-00','2019-04-17 07:45:44','2019-04-17 07:45:44'),(796,1,8,304,'0000-00-00','2019-04-17 07:45:51','2019-04-17 07:45:51'),(797,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(798,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(799,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(800,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(801,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(802,1,8,304,'0000-00-00','2019-04-17 07:45:52','2019-04-17 07:45:52'),(803,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(804,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(805,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(806,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(807,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(808,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(809,1,8,304,'0000-00-00','2019-04-17 07:45:58','2019-04-17 07:45:58'),(810,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(811,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(812,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(813,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(814,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(815,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(816,1,8,306,'0000-00-00','2019-04-17 07:46:01','2019-04-17 07:46:01'),(817,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(818,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(819,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(820,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(821,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(822,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(823,1,8,304,'0000-00-00','2019-04-17 07:47:18','2019-04-17 07:47:18'),(824,1,8,304,'0000-00-00','2019-04-17 08:19:28','2019-04-17 08:19:28'),(825,1,8,304,'0000-00-00','2019-04-17 08:20:08','2019-04-17 08:20:08'),(826,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(827,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(828,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(829,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(830,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(831,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(832,1,8,308,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(833,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(834,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(835,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(836,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(837,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(838,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(839,1,10,331,'0000-00-00','2019-04-17 08:22:24','2019-04-17 08:22:24'),(840,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(841,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(842,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(843,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(844,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(845,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(846,1,8,308,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(847,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(848,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(849,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(850,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(851,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(852,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(853,1,10,331,'0000-00-00','2019-04-17 08:24:28','2019-04-17 08:24:28'),(896,1,8,304,'2019-04-01','2019-04-17 09:00:52','2019-04-17 09:00:52'),(897,1,8,306,'2019-04-02','2019-04-17 09:00:52','2019-04-17 09:00:52'),(898,1,8,306,'2019-04-03','2019-04-17 09:00:52','2019-04-17 09:00:52'),(899,1,8,304,'2019-04-04','2019-04-17 09:00:52','2019-04-17 09:00:52'),(900,1,8,306,'2019-04-05','2019-04-17 09:00:52','2019-04-17 09:00:52'),(901,1,8,308,'2019-04-06','2019-04-17 09:00:52','2019-04-17 09:00:52'),(902,1,8,308,'2019-04-07','2019-04-17 09:00:52','2019-04-17 09:00:52'),(903,1,10,331,'2019-04-01','2019-04-17 09:00:52','2019-04-17 09:00:52'),(904,1,10,331,'2019-04-02','2019-04-17 09:00:52','2019-04-17 09:00:52'),(905,1,10,331,'2019-04-03','2019-04-17 09:00:52','2019-04-17 09:00:52'),(906,1,10,331,'2019-04-04','2019-04-17 09:00:52','2019-04-17 09:00:52'),(907,1,10,331,'2019-04-05','2019-04-17 09:00:52','2019-04-17 09:00:52'),(908,1,10,331,'2019-04-06','2019-04-17 09:00:52','2019-04-17 09:00:52'),(909,1,10,331,'2019-04-07','2019-04-17 09:00:52','2019-04-17 09:00:52'),(910,1,9,314,'2019-04-01','2019-04-17 09:00:52','2019-04-17 09:00:52'),(911,1,9,314,'2019-04-02','2019-04-17 09:00:52','2019-04-17 09:00:52'),(912,1,9,314,'2019-04-03','2019-04-17 09:00:52','2019-04-17 09:00:52'),(913,1,9,314,'2019-04-04','2019-04-17 09:00:52','2019-04-17 09:00:52'),(914,1,9,314,'2019-04-05','2019-04-17 09:00:52','2019-04-17 09:00:52'),(915,1,9,314,'2019-04-06','2019-04-17 09:00:52','2019-04-17 09:00:52'),(916,1,9,314,'2019-04-07','2019-04-17 09:00:52','2019-04-17 09:00:52'),(917,1,8,308,'2019-04-01','2019-04-17 10:28:21','2019-04-17 10:28:21'),(918,1,8,304,'2019-04-03','2019-04-17 10:28:21','2019-04-17 10:28:21'),(919,1,8,308,'2019-04-05','2019-04-17 10:28:21','2019-04-17 10:28:21'),(920,1,8,304,'2019-04-06','2019-04-17 10:28:21','2019-04-17 10:28:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeks`
--

LOCK TABLES `weeks` WRITE;
/*!40000 ALTER TABLE `weeks` DISABLE KEYS */;
INSERT INTO `weeks` VALUES (1,'2019-04-01','2019-04-07','2019-03-30 09:49:41','2019-04-03 12:46:55','April #1');
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

-- Dump completed on 2019-04-17 16:59:13
