-- MySQL dump 10.13  Distrib 5.7.24, for osx10.14 (x86_64)
--
-- Host: localhost    Database: tnk
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
-- Current Database: `tnk`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tnk` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tnk`;

--
-- Table structure for table `customer_meal`
--

DROP TABLE IF EXISTS `customer_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meal` (
  `customer_id` int(10) unsigned NOT NULL,
  `meal_id` int(10) unsigned NOT NULL,
  `meal_category_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`customer_id`,`meal_id`,`meal_category_id`),
  KEY `customer_meal_customer_id_index` (`customer_id`),
  KEY `customer_meal_meal_id_index` (`meal_id`),
  KEY `customer_meal_meal_category_id_index` (`meal_category_id`),
  CONSTRAINT `customer_meal_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customer_meal_meal_category_id_foreign` FOREIGN KEY (`meal_category_id`) REFERENCES `meal_categories` (`id`) ON DELETE CASCADE,
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
  `worktype` tinyint(4) NOT NULL,
  `weightchange` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `customers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(14,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(23,4,'id','text','Id',1,0,0,0,0,0,'{}',1),(24,4,'name','text','Name',1,1,1,1,1,1,'{}',2),(25,4,'protein','text','Protein',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',3),(26,4,'fat','text','Fat',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',4),(27,4,'carbohydrates','text','Carbohydrates',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',5),(28,4,'calories','text','Calories',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',6),(29,4,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(30,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(31,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(32,5,'name','text','Name',1,1,1,1,1,1,'{}',2),(33,5,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(34,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(35,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(36,6,'name','text','Name',1,1,1,1,1,1,'{}',3),(37,6,'kitchen_id','select_dropdown','Kitchen Id',1,1,1,1,1,1,'{}',2),(38,6,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(39,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(40,6,'meal_belongsto_kitchen_relationship','relationship','kitchen',0,1,1,1,1,1,'{\"model\":\"App\\\\Kitchen\",\"table\":\"kitchens\",\"type\":\"belongsTo\",\"column\":\"kitchen_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meal\",\"pivot\":\"0\",\"taggable\":\"0\"}',6),(41,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(42,7,'startdate','date','Start date',1,1,1,1,1,1,'{}',2),(43,7,'enddate','date','End date',1,1,1,1,1,1,'{}',3),(44,7,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(45,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(46,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(47,8,'name','text','Name',1,1,1,1,1,1,'{}',2),(48,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(49,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4),(50,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(51,10,'fullname','text','Fullname',1,1,1,1,1,1,'{}',3),(52,10,'title','text','Title',1,1,1,1,1,1,'{}',4),(53,10,'age','text','Age',1,1,1,1,1,1,'{}',5),(54,10,'birthdate','date','Birthdate',1,1,1,1,1,1,'{}',6),(55,10,'gender','select_dropdown','Gender',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"0\":\"Female\",\"1\":\"Male\"}}',7),(56,10,'height','text','Height',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',8),(57,10,'weight','text','Weight',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',9),(58,10,'waist_measurements','text','Waist Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',10),(59,10,'hip_measurements','text','Hip Measurements',1,1,1,1,1,1,'{\"validation\":{\"rule\":\"required|numeric\"}}',11),(60,10,'blood_type','text','Blood Type',1,1,1,1,1,1,'{}',12),(61,10,'address','text_area','Address',1,1,1,1,1,1,'{}',13),(62,10,'mobile','text','Mobile',1,1,1,1,1,1,'{}',14),(63,10,'telephone','text','Telephone',1,1,1,1,1,1,'{}',15),(64,10,'email','text','Email',1,1,1,1,1,1,'{}',16),(65,10,'medical_history','text_area','Medical History',1,1,1,1,1,1,'{}',17),(66,10,'present_medication','text_area','Present Medication',1,1,1,1,1,1,'{}',18),(67,10,'exercise_frequency','select_dropdown','Exercise Frequency',1,1,1,1,1,1,'{\"default\":\"1\",\"options\":{\"1\":\"Little\",\"2\":\"Moderate\",\"3\":\"Frequent\"}}',19),(68,10,'alchohol','select_dropdown','Alchohol',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',20),(69,10,'smoke','select_dropdown','Smoke',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',21),(70,10,'pregnancy','select_dropdown','Pregnancy',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',22),(71,10,'breastfeeding','select_dropdown','Breastfeeding',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',23),(72,10,'vaccinations','select_dropdown','Vaccinations',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"No\",\"1\":\"Yes\"}}',24),(73,10,'worktype','text','Worktype',1,1,1,1,1,1,'{}',25),(74,10,'weightchange','select_dropdown','Weightchange',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"Need to Lose Weight\",\"1\":\"Need to Gain Weight\",\"2\":\"Bulking\"}}',26),(75,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',27),(76,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',28),(77,10,'plan_id','text','Plan Id',1,1,1,1,1,1,'{}',2),(78,10,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"0\",\"options\":{\"0\":\"deactived\",\"1\":\"Actived\"}}',29),(79,10,'customer_belongsto_plan_relationship','relationship','Plan',0,1,1,1,1,1,'{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"belongsTo\",\"column\":\"plan_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customer_meal\",\"pivot\":\"0\",\"taggable\":\"0\"}',30),(80,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(81,11,'name','text','Name',1,1,1,1,1,1,'{}',2),(82,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',3),(83,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(4,'ingredients','ingredients','Ingredient','Ingredients',NULL,'App\\Ingredient',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:14:49','2019-01-09 09:14:49'),(5,'kitchens','kitchens','Kitchen','Kitchens',NULL,'App\\Kitchen',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:16:46','2019-01-09 09:16:46'),(6,'meals','meals','Meal','Meals',NULL,'App\\Meal',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:17:08','2019-01-09 09:18:33'),(7,'weeks','weeks','Week','Weeks',NULL,'App\\Week',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:19:29','2019-01-09 09:19:29'),(8,'plans','plans','Plan','Plans',NULL,'App\\Plan',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:19:41','2019-01-09 09:19:41'),(9,'meal_category','meal-category','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:19:57','2019-01-09 09:19:57'),(10,'customers','customers','Customer','Customers',NULL,'App\\Customer',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 09:34:55','2019-01-10 02:22:22'),(11,'meal_categories','meal-categories','Meal Category','Meal Categories',NULL,'App\\MealCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2019-01-09 10:11:33','2019-01-09 10:11:33');
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
/*!40000 ALTER TABLE `ingredient_meal` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Cucumber',10,20,30,40,'2019-01-09 10:12:46','2019-01-09 10:12:46'),(2,'Tomato',5,10,15,20,'2019-01-09 10:13:00','2019-01-09 10:13:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchens`
--

LOCK TABLES `kitchens` WRITE;
/*!40000 ALTER TABLE `kitchens` DISABLE KEYS */;
INSERT INTO `kitchens` VALUES (1,'Vegetables','2019-01-09 10:13:18','2019-01-09 10:13:18'),(2,'Juices','2019-01-09 10:13:27','2019-01-09 10:13:27'),(3,'Meat','2019-01-09 10:13:36','2019-01-09 10:13:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_categories`
--

LOCK TABLES `meal_categories` WRITE;
/*!40000 ALTER TABLE `meal_categories` DISABLE KEYS */;
INSERT INTO `meal_categories` VALUES (1,'Vegan','2019-01-09 10:12:20','2019-01-09 10:12:20');
/*!40000 ALTER TABLE `meal_categories` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `meals_kitchen_id_foreign` (`kitchen_id`),
  CONSTRAINT `meals_kitchen_id_foreign` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'Salade',1,'2019-01-09 10:13:47','2019-01-09 10:13:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2019-01-09 07:31:35','2019-01-09 07:31:35','voyager.dashboard',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2019-01-09 07:31:35','2019-01-09 07:31:35','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2019-01-09 07:31:35','2019-01-09 07:31:35','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,11,'2019-01-09 07:31:35','2019-01-09 09:45:10',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2019-01-09 07:31:35','2019-01-09 09:44:57','voyager.menus.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,2,'2019-01-09 07:31:35','2019-01-09 09:44:57','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,5,3,'2019-01-09 07:31:35','2019-01-09 09:45:10','voyager.settings.index',NULL),(12,1,'Ingredients','','_self','voyager-params','#000000',NULL,5,'2019-01-09 09:14:50','2019-01-09 09:45:10','voyager.ingredients.index','null'),(13,1,'Kitchens','','_self','voyager-lab','#000000',NULL,6,'2019-01-09 09:16:46','2019-01-09 09:45:10','voyager.kitchens.index','null'),(14,1,'Meals','','_self','voyager-pizza','#000000',NULL,10,'2019-01-09 09:17:08','2019-01-09 10:12:01','voyager.meals.index','null'),(15,1,'Weeks','','_self','voyager-calendar','#000000',NULL,8,'2019-01-09 09:19:29','2019-01-09 09:45:24','voyager.weeks.index','null'),(16,1,'Plans','','_self','voyager-file-text','#000000',NULL,7,'2019-01-09 09:19:41','2019-01-09 09:45:22','voyager.plans.index','null'),(18,1,'Customers','','_self','voyager-people','#000000',NULL,4,'2019-01-09 09:34:55','2019-01-09 09:44:59','voyager.customers.index','null'),(19,1,'Meal Categories','','_self','voyager-trees','#000000',NULL,9,'2019-01-09 10:11:33','2019-01-09 10:12:08','voyager.meal-categories.index','null');
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
INSERT INTO `menus` VALUES (1,'admin','2019-01-09 07:31:35','2019-01-09 07:31:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(45,'2019_01_09_110215_create_customers_table',2),(46,'2019_01_09_110254_create_plans_table',2),(47,'2019_01_09_110402_add_plan_id_to_customers_table',2),(48,'2019_01_09_110546_add_status_to_customers_table',2),(49,'2019_01_09_110716_create_kitchens_table',2),(50,'2019_01_09_110824_create_ingredients_table',2),(51,'2019_01_09_110916_create_meal_categories_table',2),(52,'2019_01_09_111048_create_meals_table',2),(55,'2019_01_09_111130_create_weeks_table',3),(56,'2019_01_09_111326_create_customer_meal_pivot_table',4),(57,'2019_01_09_112036_create_ingredient_meal_pivot_table',4);
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
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(2,'browse_bread',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(3,'browse_database',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(4,'browse_media',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(5,'browse_compass',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(6,'browse_menus','menus','2019-01-09 07:31:35','2019-01-09 07:31:35'),(7,'read_menus','menus','2019-01-09 07:31:35','2019-01-09 07:31:35'),(8,'edit_menus','menus','2019-01-09 07:31:35','2019-01-09 07:31:35'),(9,'add_menus','menus','2019-01-09 07:31:35','2019-01-09 07:31:35'),(10,'delete_menus','menus','2019-01-09 07:31:35','2019-01-09 07:31:35'),(11,'browse_roles','roles','2019-01-09 07:31:35','2019-01-09 07:31:35'),(12,'read_roles','roles','2019-01-09 07:31:35','2019-01-09 07:31:35'),(13,'edit_roles','roles','2019-01-09 07:31:35','2019-01-09 07:31:35'),(14,'add_roles','roles','2019-01-09 07:31:35','2019-01-09 07:31:35'),(15,'delete_roles','roles','2019-01-09 07:31:35','2019-01-09 07:31:35'),(16,'browse_users','users','2019-01-09 07:31:35','2019-01-09 07:31:35'),(17,'read_users','users','2019-01-09 07:31:35','2019-01-09 07:31:35'),(18,'edit_users','users','2019-01-09 07:31:35','2019-01-09 07:31:35'),(19,'add_users','users','2019-01-09 07:31:35','2019-01-09 07:31:35'),(20,'delete_users','users','2019-01-09 07:31:35','2019-01-09 07:31:35'),(21,'browse_settings','settings','2019-01-09 07:31:35','2019-01-09 07:31:35'),(22,'read_settings','settings','2019-01-09 07:31:35','2019-01-09 07:31:35'),(23,'edit_settings','settings','2019-01-09 07:31:35','2019-01-09 07:31:35'),(24,'add_settings','settings','2019-01-09 07:31:35','2019-01-09 07:31:35'),(25,'delete_settings','settings','2019-01-09 07:31:35','2019-01-09 07:31:35'),(26,'browse_hooks',NULL,'2019-01-09 07:31:35','2019-01-09 07:31:35'),(27,'browse_ingredients','ingredients','2019-01-09 09:14:50','2019-01-09 09:14:50'),(28,'read_ingredients','ingredients','2019-01-09 09:14:50','2019-01-09 09:14:50'),(29,'edit_ingredients','ingredients','2019-01-09 09:14:50','2019-01-09 09:14:50'),(30,'add_ingredients','ingredients','2019-01-09 09:14:50','2019-01-09 09:14:50'),(31,'delete_ingredients','ingredients','2019-01-09 09:14:50','2019-01-09 09:14:50'),(32,'browse_kitchens','kitchens','2019-01-09 09:16:46','2019-01-09 09:16:46'),(33,'read_kitchens','kitchens','2019-01-09 09:16:46','2019-01-09 09:16:46'),(34,'edit_kitchens','kitchens','2019-01-09 09:16:46','2019-01-09 09:16:46'),(35,'add_kitchens','kitchens','2019-01-09 09:16:46','2019-01-09 09:16:46'),(36,'delete_kitchens','kitchens','2019-01-09 09:16:46','2019-01-09 09:16:46'),(37,'browse_meals','meals','2019-01-09 09:17:08','2019-01-09 09:17:08'),(38,'read_meals','meals','2019-01-09 09:17:08','2019-01-09 09:17:08'),(39,'edit_meals','meals','2019-01-09 09:17:08','2019-01-09 09:17:08'),(40,'add_meals','meals','2019-01-09 09:17:08','2019-01-09 09:17:08'),(41,'delete_meals','meals','2019-01-09 09:17:08','2019-01-09 09:17:08'),(42,'browse_weeks','weeks','2019-01-09 09:19:29','2019-01-09 09:19:29'),(43,'read_weeks','weeks','2019-01-09 09:19:29','2019-01-09 09:19:29'),(44,'edit_weeks','weeks','2019-01-09 09:19:29','2019-01-09 09:19:29'),(45,'add_weeks','weeks','2019-01-09 09:19:29','2019-01-09 09:19:29'),(46,'delete_weeks','weeks','2019-01-09 09:19:29','2019-01-09 09:19:29'),(47,'browse_plans','plans','2019-01-09 09:19:41','2019-01-09 09:19:41'),(48,'read_plans','plans','2019-01-09 09:19:41','2019-01-09 09:19:41'),(49,'edit_plans','plans','2019-01-09 09:19:41','2019-01-09 09:19:41'),(50,'add_plans','plans','2019-01-09 09:19:41','2019-01-09 09:19:41'),(51,'delete_plans','plans','2019-01-09 09:19:41','2019-01-09 09:19:41'),(52,'browse_meal_category','meal_category','2019-01-09 09:19:57','2019-01-09 09:19:57'),(53,'read_meal_category','meal_category','2019-01-09 09:19:57','2019-01-09 09:19:57'),(54,'edit_meal_category','meal_category','2019-01-09 09:19:57','2019-01-09 09:19:57'),(55,'add_meal_category','meal_category','2019-01-09 09:19:57','2019-01-09 09:19:57'),(56,'delete_meal_category','meal_category','2019-01-09 09:19:57','2019-01-09 09:19:57'),(57,'browse_customers','customers','2019-01-09 09:34:55','2019-01-09 09:34:55'),(58,'read_customers','customers','2019-01-09 09:34:55','2019-01-09 09:34:55'),(59,'edit_customers','customers','2019-01-09 09:34:55','2019-01-09 09:34:55'),(60,'add_customers','customers','2019-01-09 09:34:55','2019-01-09 09:34:55'),(61,'delete_customers','customers','2019-01-09 09:34:55','2019-01-09 09:34:55'),(62,'browse_meal_categories','meal_categories','2019-01-09 10:11:33','2019-01-09 10:11:33'),(63,'read_meal_categories','meal_categories','2019-01-09 10:11:33','2019-01-09 10:11:33'),(64,'edit_meal_categories','meal_categories','2019-01-09 10:11:33','2019-01-09 10:11:33'),(65,'add_meal_categories','meal_categories','2019-01-09 10:11:33','2019-01-09 10:11:33'),(66,'delete_meal_categories','meal_categories','2019-01-09 10:11:33','2019-01-09 10:11:33');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Vegan','2019-01-10 02:35:21','2019-01-10 02:35:21');
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
INSERT INTO `roles` VALUES (1,'admin','Administrator','2019-01-09 07:31:35','2019-01-09 07:31:35'),(2,'user','Normal User','2019-01-09 07:31:35','2019-01-09 07:31:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','The Natural Kitchen','','text',1,'Site'),(2,'site.description','Site Description',NULL,'','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/January2019/wXF9BMg0p5BvSQM0D5DX.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','TNK Dashboard','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to TNK Dashboard','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
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
INSERT INTO `users` VALUES (1,1,'Hazem','admin@tnk.test','users/default.png',NULL,'$2y$10$yMmCShyz84K8DDkxqeqYKe4EJVMI.3q9KwK/.UiV6dhKxz.N3x60K','4mwfJNv9Szvjimtkn5knXIarHGIn47KaK7Gzoqw4rEtYhVjxMtaOhGPmucZo',NULL,'2019-01-09 07:33:58','2019-01-09 07:33:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeks`
--

LOCK TABLES `weeks` WRITE;
/*!40000 ALTER TABLE `weeks` DISABLE KEYS */;
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

-- Dump completed on 2019-01-10  8:57:53
