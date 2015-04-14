-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tablefootball
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `Elos`
--

DROP TABLE IF EXISTS `Elos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elos` (
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `EloDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Elo` int(11) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`,`EloDate`),
  CONSTRAINT `Elos_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elos`
--

LOCK TABLES `Elos` WRITE;
/*!40000 ALTER TABLE `Elos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Elos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matches` (
  `MatchID` int(11) NOT NULL,
  `PlayerA1` int(11) NOT NULL,
  `PlayerA2` int(11) DEFAULT NULL,
  `PlayerB1` int(11) NOT NULL,
  `PlayerB2` int(11) DEFAULT NULL,
  `MatchDate` datetime DEFAULT NULL,
  `ScoreA` int(11) DEFAULT NULL,
  `ScoreB` int(11) DEFAULT NULL,
  PRIMARY KEY (`MatchID`),
  KEY `PlayerA1` (`PlayerA1`),
  KEY `PlayerA2` (`PlayerA2`),
  KEY `PlayerB1` (`PlayerB1`),
  KEY `PlayerB2` (`PlayerB2`),
  CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`PlayerA1`) REFERENCES `Players` (`PlayerID`),
  CONSTRAINT `Matches_ibfk_2` FOREIGN KEY (`PlayerA2`) REFERENCES `Players` (`PlayerID`),
  CONSTRAINT `Matches_ibfk_3` FOREIGN KEY (`PlayerB1`) REFERENCES `Players` (`PlayerID`),
  CONSTRAINT `Matches_ibfk_4` FOREIGN KEY (`PlayerB2`) REFERENCES `Players` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Players` (
  `PlayerID` int(11) NOT NULL,
  `PlayerName` varchar(255) NOT NULL,
  `Elo` int(11) NOT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add player',7,'add_player'),(20,'Can change player',7,'change_player'),(21,'Can delete player',7,'delete_player'),(22,'Can add elo',8,'add_elo'),(23,'Can change elo',8,'change_elo'),(24,'Can delete elo',8,'delete_elo'),(25,'Can add match',9,'add_match'),(26,'Can change match',9,'change_match'),(27,'Can delete match',9,'delete_match');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$15000$81awsxgLIErE$HCSSZbshVYgcs5mL/MVYXLk6f+6PRvSnsWS17DhqXNM=','2015-03-23 13:11:00',1,'admin','','','simon.jones@hawkeyeinnovations.co.uk',1,1,'2015-02-14 16:36:32');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-02-14 16:44:45','2','Berti',1,'',7,1),(2,'2015-02-14 16:44:50','3','Brent',1,'',7,1),(3,'2015-02-14 16:44:55','4','Jack',1,'',7,1),(4,'2015-02-14 16:45:01','5','Bertrand',1,'',7,1),(5,'2015-02-14 16:45:07','6','Steve',1,'',7,1),(6,'2015-02-14 16:45:16','7','Ash',1,'',7,1),(7,'2015-02-14 16:45:27','8','Rich',1,'',7,1),(8,'2015-02-14 16:45:52','9','Rowan',1,'',7,1),(9,'2015-02-14 17:01:44','11','2015-02-14 16:52:04+00:00',1,'',9,1),(10,'2015-02-14 17:08:25','11','2015-02-14 16:52:04+00:00',2,'Changed playerRed2.',9,1),(11,'2015-02-14 17:09:50','11','2015-02-14 16:52:04+00:00',2,'No fields changed.',9,1),(12,'2015-02-15 01:05:23','3','Simon 2015-02-15 01:08:39+00:00',1,'',8,1),(13,'2015-02-15 01:05:37','4','Berti 2015-02-15 01:10:30+00:00',1,'',8,1),(14,'2015-02-15 01:05:43','5','Brent 2015-02-15 01:10:35+00:00',1,'',8,1),(15,'2015-02-15 01:05:48','6','Jack 2015-02-15 01:10:41+00:00',1,'',8,1),(16,'2015-02-15 01:05:53','7','Bertrand 2015-02-15 01:10:47+00:00',1,'',8,1),(17,'2015-02-15 01:05:59','8','Steve 2015-02-15 01:10:51+00:00',1,'',8,1),(18,'2015-02-15 01:06:05','9','Ash 2015-02-15 01:10:58+00:00',1,'',8,1),(19,'2015-02-15 01:06:11','10','Rich 2015-02-15 01:11:03+00:00',1,'',8,1),(20,'2015-02-15 01:06:16','11','Rowan 2015-02-15 01:11:09+00:00',1,'',8,1),(21,'2015-02-15 01:27:20','12','Simon 2015-02-15 01:32:11+00:00',1,'',8,1),(22,'2015-02-15 10:58:49','13','Berti 2015-02-15 11:03:39+00:00',1,'',8,1),(23,'2015-02-15 17:08:21','14','Berti 2015-02-15 17:13:13+00:00',1,'',8,1),(24,'2015-02-15 20:21:50','14','Berti 2015-02-15 17:13:13+00:00',3,'',8,1),(25,'2015-02-15 20:21:50','12','Simon 2015-02-15 01:32:11+00:00',3,'',8,1),(26,'2015-02-15 20:22:13','13','Berti 2015-02-15 11:03:39+00:00',3,'',8,1),(27,'2015-02-16 00:19:35','28','2015-02-16 00:15:13+00:00',3,'',9,1),(28,'2015-02-16 00:19:35','27','2015-02-15 23:34:37+00:00',3,'',9,1),(29,'2015-02-16 00:19:35','26','2015-02-15 23:28:34+00:00',3,'',9,1),(30,'2015-02-16 00:19:35','25','2015-02-15 23:28:34+00:00',3,'',9,1),(31,'2015-02-16 00:19:35','24','2015-02-15 23:28:34+00:00',3,'',9,1),(32,'2015-02-16 00:19:35','23','2015-02-15 23:28:34+00:00',3,'',9,1),(33,'2015-02-16 00:19:35','22','2015-02-15 23:28:34+00:00',3,'',9,1),(34,'2015-02-16 00:19:35','21','2015-02-15 22:07:26+00:00',3,'',9,1),(35,'2015-02-16 00:19:35','20','2015-02-15 22:07:11+00:00',3,'',9,1),(36,'2015-02-16 00:19:35','19','2015-02-15 22:06:57+00:00',3,'',9,1),(37,'2015-02-16 00:19:35','18','2015-02-15 22:06:41+00:00',3,'',9,1),(38,'2015-02-16 00:19:35','17','2015-02-15 22:06:31+00:00',3,'',9,1),(39,'2015-02-16 00:19:35','16','2015-02-15 22:06:10+00:00',3,'',9,1),(40,'2015-02-16 00:19:35','15','2015-02-15 22:02:24+00:00',3,'',9,1),(41,'2015-02-16 00:19:35','14','2015-02-15 22:02:00+00:00',3,'',9,1),(42,'2015-02-16 00:19:35','13','2015-02-15 21:02:28+00:00',3,'',9,1),(43,'2015-02-16 00:19:35','12','2015-02-15 21:02:17+00:00',3,'',9,1),(44,'2015-02-16 00:19:35','11','2015-02-14 16:52:04+00:00',3,'',9,1),(45,'2015-02-16 00:20:10','212','Jack 2015-02-16 00:15:13+00:00',3,'',8,1),(46,'2015-02-16 00:20:10','211','Simon 2015-02-16 00:15:13+00:00',3,'',8,1),(47,'2015-02-16 00:20:10','210','Jack 2015-02-15 23:34:37+00:00',3,'',8,1),(48,'2015-02-16 00:20:10','209','Simon 2015-02-15 23:34:37+00:00',3,'',8,1),(49,'2015-02-16 00:20:10','208','Simon 2015-02-15 23:28:34+00:00',3,'',8,1),(50,'2015-02-16 00:20:10','207','Jack 2015-02-15 23:28:34+00:00',3,'',8,1),(51,'2015-02-16 00:20:10','206','Ash 2015-02-15 23:28:34+00:00',3,'',8,1),(52,'2015-02-16 00:20:10','205','Berti 2015-02-15 23:28:34+00:00',3,'',8,1),(53,'2015-02-16 00:20:10','204','Simon 2015-02-15 23:28:34+00:00',3,'',8,1),(54,'2015-02-16 00:20:10','203','Jack 2015-02-15 23:28:34+00:00',3,'',8,1),(55,'2015-02-16 00:20:10','202','Ash 2015-02-15 23:28:34+00:00',3,'',8,1),(56,'2015-02-16 00:20:10','201','Berti 2015-02-15 23:28:34+00:00',3,'',8,1),(57,'2015-02-16 00:20:10','200','Simon 2015-02-15 23:28:34+00:00',3,'',8,1),(58,'2015-02-16 00:20:10','199','Jack 2015-02-15 23:28:34+00:00',3,'',8,1),(59,'2015-02-16 00:20:10','198','Ash 2015-02-15 23:28:34+00:00',3,'',8,1),(60,'2015-02-16 00:20:10','197','Berti 2015-02-15 23:28:34+00:00',3,'',8,1),(61,'2015-02-16 00:20:10','196','Simon 2015-02-15 23:28:34+00:00',3,'',8,1),(62,'2015-02-16 00:20:10','195','Jack 2015-02-15 23:28:34+00:00',3,'',8,1),(63,'2015-02-16 00:20:10','194','Ash 2015-02-15 23:28:34+00:00',3,'',8,1),(64,'2015-02-16 00:20:10','193','Berti 2015-02-15 23:28:34+00:00',3,'',8,1),(65,'2015-02-16 00:20:10','192','Simon 2015-02-15 23:28:34+00:00',3,'',8,1),(66,'2015-02-16 00:20:10','191','Jack 2015-02-15 23:28:34+00:00',3,'',8,1),(67,'2015-02-16 00:20:10','190','Ash 2015-02-15 23:28:34+00:00',3,'',8,1),(68,'2015-02-16 00:20:10','189','Berti 2015-02-15 23:28:34+00:00',3,'',8,1),(69,'2015-02-16 00:20:10','188','Bertrand 2015-02-15 22:07:26+00:00',3,'',8,1),(70,'2015-02-16 00:20:10','187','Rich 2015-02-15 22:07:26+00:00',3,'',8,1),(71,'2015-02-16 00:20:10','186','Simon 2015-02-15 22:07:11+00:00',3,'',8,1),(72,'2015-02-16 00:20:10','185','Rich 2015-02-15 22:07:11+00:00',3,'',8,1),(73,'2015-02-16 00:20:10','184','Bertrand 2015-02-15 22:06:57+00:00',3,'',8,1),(74,'2015-02-16 00:20:10','183','Rowan 2015-02-15 22:06:57+00:00',3,'',8,1),(75,'2015-02-16 00:20:10','182','Ash 2015-02-15 22:06:41+00:00',3,'',8,1),(76,'2015-02-16 00:20:10','181','Jack 2015-02-15 22:06:41+00:00',3,'',8,1),(77,'2015-02-16 00:20:10','180','Jack 2015-02-15 22:06:31+00:00',3,'',8,1),(78,'2015-02-16 00:20:10','179','Steve 2015-02-15 22:06:31+00:00',3,'',8,1),(79,'2015-02-16 00:20:10','178','Rich 2015-02-15 22:06:10+00:00',3,'',8,1),(80,'2015-02-16 00:20:10','177','Ash 2015-02-15 22:06:10+00:00',3,'',8,1),(81,'2015-02-16 00:20:10','176','Jack 2015-02-15 22:02:24+00:00',3,'',8,1),(82,'2015-02-16 00:20:10','175','Steve 2015-02-15 22:02:24+00:00',3,'',8,1),(83,'2015-02-16 00:20:10','174','Brent 2015-02-15 22:02:24+00:00',3,'',8,1),(84,'2015-02-16 00:20:10','173','Brent 2015-02-15 22:02:00+00:00',3,'',8,1),(85,'2015-02-16 00:20:10','172','Ash 2015-02-15 22:02:00+00:00',3,'',8,1),(86,'2015-02-16 00:20:10','171','Simon 2015-02-15 21:02:28+00:00',3,'',8,1),(87,'2015-02-16 00:20:10','170','Ash 2015-02-15 21:02:28+00:00',3,'',8,1),(88,'2015-02-16 00:20:10','169','Bertrand 2015-02-15 21:02:17+00:00',3,'',8,1),(89,'2015-02-16 00:20:10','168','Jack 2015-02-15 21:02:17+00:00',3,'',8,1),(90,'2015-02-16 00:20:10','167','Berti 2015-02-15 21:02:17+00:00',3,'',8,1),(91,'2015-02-16 00:20:10','166','Ash 2015-02-15 21:02:17+00:00',3,'',8,1),(92,'2015-02-16 00:20:10','165','Jack 2015-02-14 16:52:04+00:00',3,'',8,1),(93,'2015-02-16 00:20:10','164','Brent 2015-02-14 16:52:04+00:00',3,'',8,1),(94,'2015-02-16 00:20:10','163','Simon 2015-02-14 16:52:04+00:00',3,'',8,1),(95,'2015-02-16 00:22:48','242','Jack 2015-02-16 00:27:02+00:00',3,'',8,1),(96,'2015-02-16 00:22:48','241','Bertrand 2015-02-16 00:27:02+00:00',3,'',8,1),(97,'2015-02-16 00:22:48','240','Berti 2015-02-16 00:27:02+00:00',3,'',8,1),(98,'2015-02-16 00:22:48','239','Simon 2015-02-16 00:27:02+00:00',3,'',8,1),(99,'2015-02-16 00:22:48','238','Jack 2015-02-16 00:26:03+00:00',3,'',8,1),(100,'2015-02-16 00:22:48','237','Bertrand 2015-02-16 00:26:03+00:00',3,'',8,1),(101,'2015-02-16 00:22:48','236','Berti 2015-02-16 00:26:03+00:00',3,'',8,1),(102,'2015-02-16 00:22:48','235','Simon 2015-02-16 00:26:03+00:00',3,'',8,1),(103,'2015-02-16 00:22:59','30','2015-02-16 00:27:02+00:00',3,'',9,1),(104,'2015-02-16 00:22:59','29','2015-02-16 00:26:03+00:00',3,'',9,1),(105,'2015-02-16 12:25:00','253','Ash 2015-02-16 12:29:19+00:00',3,'',8,1),(106,'2015-02-16 12:25:00','252','Brent 2015-02-16 12:29:19+00:00',3,'',8,1),(107,'2015-02-16 12:25:05','31','2015-02-16 12:29:19+00:00',3,'',9,1),(108,'2015-02-16 12:26:02','264','Berti 2015-02-16 12:30:35+00:00',3,'',8,1),(109,'2015-02-16 12:26:02','263','Ash 2015-02-16 12:30:35+00:00',3,'',8,1),(110,'2015-02-16 12:26:07','32','2015-02-16 12:30:35+00:00',3,'',9,1),(111,'2015-02-16 13:12:42','10','Lauren',1,'',7,1),(112,'2015-02-16 13:13:21','278','Lauren 2015-02-16 10:18:09+00:00',1,'',8,1),(113,'2015-02-18 13:30:53','50','2015-02-18 13:34:44+00:00',2,'Changed playerRed2.',9,1),(114,'2015-02-18 13:38:27','52','2015-02-18 13:42:20+00:00',3,'',9,1),(115,'2015-02-20 13:18:50','11','Nick',1,'',7,1),(116,'2015-02-20 13:19:28','1579','Nick 2015-02-20 13:24:35+00:00',1,'',8,1),(117,'2015-02-24 13:31:16','12','Derek',1,'',7,1),(118,'2015-02-24 13:31:42','2770','Derek 2015-02-24 13:36:53+00:00',1,'',8,1),(119,'2015-02-24 13:32:24','2770','Derek 2015-02-16 13:36:53+00:00',2,'Changed elo_date.',8,1),(120,'2015-03-23 13:11:22','13','Sam',1,'',7,1),(121,'2015-03-23 13:11:36','14','Scott',1,'',7,1),(122,'2015-03-23 13:12:11','35089','Scott 2015-03-23 13:18:40+00:00',1,'',8,1),(123,'2015-03-23 13:12:50','35090','Sam 2015-03-23 13:19:21+00:00',1,'',8,1),(124,'2015-04-01 11:58:34','68447','Simon 2015-04-01 12:05:29+00:00',1,'',8,1),(125,'2015-04-02 12:22:58','15','Clement',1,'',7,1),(126,'2015-04-02 12:23:28','72108','Clement 2015-04-02 12:30:29+00:00',1,'',8,1),(127,'2015-04-02 12:33:39','16','Oli',1,'',7,1),(128,'2015-04-02 12:34:07','73603','Oli 2015-04-02 12:41:03+00:00',1,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'player','tf','player'),(8,'elo','tf','elo'),(9,'match','tf','match');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-02-14 15:43:44'),(2,'auth','0001_initial','2015-02-14 15:43:45'),(3,'admin','0001_initial','2015-02-14 15:43:45'),(4,'sessions','0001_initial','2015-02-14 15:43:45'),(5,'tf','0001_initial','2015-02-14 16:29:25'),(6,'tf','0002_auto_20150214_1705','2015-02-14 17:05:52'),(7,'tf','0003_auto_20150214_1707','2015-02-14 17:07:55'),(8,'tf','0004_auto_20150214_1709','2015-02-14 17:09:26'),(9,'tf','0005_match_ordered','2015-02-22 21:25:58');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8jkdk51onigdj8wl3yi6si98ovxehty5','MmVjNTk2MWY1NWJlYjU2MTFkNWQ0OTVlY2Y5NjY3YTlhYTgzMzk1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5MTRkNzI4NTAzN2Y2NjVjNTFjMmEyOGY0OTA0NDVlMDM5NDU1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-02 13:12:04'),('bncygtj8yi5djdrfscneheyfm84yxxco','MmVjNTk2MWY1NWJlYjU2MTFkNWQ0OTVlY2Y5NjY3YTlhYTgzMzk1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5MTRkNzI4NTAzN2Y2NjVjNTFjMmEyOGY0OTA0NDVlMDM5NDU1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-01 01:03:23'),('o16nxs91bsc1nu3o3cztypxjadc1z8f7','MmVjNTk2MWY1NWJlYjU2MTFkNWQ0OTVlY2Y5NjY3YTlhYTgzMzk1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5MTRkNzI4NTAzN2Y2NjVjNTFjMmEyOGY0OTA0NDVlMDM5NDU1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-02-28 16:37:14'),('qs7i8qxt3rnttm5sxppc2ja6zl308hrg','MmVjNTk2MWY1NWJlYjU2MTFkNWQ0OTVlY2Y5NjY3YTlhYTgzMzk1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5MTRkNzI4NTAzN2Y2NjVjNTFjMmEyOGY0OTA0NDVlMDM5NDU1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-04-06 13:11:00'),('spw17irlbz5g008qxbxw366g6gmp99r2','MmVjNTk2MWY1NWJlYjU2MTFkNWQ0OTVlY2Y5NjY3YTlhYTgzMzk1NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5MTRkNzI4NTAzN2Y2NjVjNTFjMmEyOGY0OTA0NDVlMDM5NDU1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-03-02 00:11:33');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_elo`
--

DROP TABLE IF EXISTS `tf_elo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_elo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elo_date` datetime NOT NULL,
  `elo` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tf_elo_afe72417` (`player_id`),
  CONSTRAINT `tf_elo_player_id_267430268694c760_fk_tf_player_id` FOREIGN KEY (`player_id`) REFERENCES `tf_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115086 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_elo`
--

LOCK TABLES `tf_elo` WRITE;
/*!40000 ALTER TABLE `tf_elo` DISABLE KEYS */;
INSERT INTO `tf_elo` VALUES (114148,'2015-02-15 00:00:00',1000,1),(114149,'2015-02-15 00:00:00',1000,2),(114150,'2015-02-15 00:00:00',1000,3),(114151,'2015-02-15 00:00:00',1000,4),(114152,'2015-02-15 00:00:00',1000,5),(114153,'2015-02-15 00:00:00',1000,6),(114154,'2015-02-15 00:00:00',1000,7),(114155,'2015-02-15 00:00:00',1000,8),(114156,'2015-02-15 00:00:00',1000,9),(114157,'2015-02-15 00:00:00',1000,10),(114158,'2015-02-15 00:00:00',1000,11),(114159,'2015-02-15 00:00:00',1000,12),(114160,'2015-02-15 00:00:00',1000,13),(114161,'2015-02-15 00:00:00',1000,14),(114162,'2015-02-15 00:00:00',1000,15),(114163,'2015-02-15 00:00:00',1000,16),(114164,'2015-02-16 13:15:39',988,1),(114165,'2015-02-16 13:15:39',988,3),(114166,'2015-02-16 13:15:39',1012,4),(114167,'2015-02-16 13:15:39',1012,6),(114168,'2015-02-16 13:18:42',1012,2),(114169,'2015-02-16 13:18:42',1012,5),(114170,'2015-02-16 13:18:42',988,9),(114171,'2015-02-16 13:18:42',988,10),(114172,'2015-02-16 13:22:18',976,1),(114173,'2015-02-16 13:22:18',1000,6),(114174,'2015-02-16 13:22:18',1012,7),(114175,'2015-02-16 13:22:18',1024,2),(114176,'2015-02-16 13:23:22',1000,5),(114177,'2015-02-16 13:23:22',976,10),(114178,'2015-02-16 13:23:22',1000,9),(114179,'2015-02-16 13:23:22',1024,4),(114180,'2015-02-16 13:27:39',1036,2),(114181,'2015-02-16 13:27:39',1012,6),(114182,'2015-02-16 13:27:39',1000,7),(114183,'2015-02-16 13:27:39',976,3),(114184,'2015-02-16 13:31:14',1012,9),(114185,'2015-02-16 13:31:14',1012,5),(114186,'2015-02-16 13:31:14',1012,4),(114187,'2015-02-16 13:31:14',964,10),(114188,'2015-02-16 13:36:56',1024,2),(114189,'2015-02-16 13:36:56',964,3),(114190,'2015-02-16 13:36:56',1024,6),(114191,'2015-02-16 13:36:56',1024,4),(114192,'2015-02-17 13:17:16',1013,6),(114193,'2015-02-17 13:17:16',953,10),(114194,'2015-02-17 13:17:16',1011,7),(114195,'2015-02-17 13:17:16',1035,4),(114196,'2015-02-17 13:24:18',976,3),(114197,'2015-02-17 13:24:18',1023,7),(114198,'2015-02-17 13:24:18',941,10),(114199,'2015-02-17 13:24:18',1023,4),(114200,'2015-02-17 13:30:22',1024,6),(114201,'2015-02-17 13:30:22',1034,4),(114202,'2015-02-17 13:30:22',1013,2),(114203,'2015-02-17 13:30:22',965,1),(114204,'2015-02-17 13:34:50',1001,2),(114205,'2015-02-17 13:34:50',1011,7),(114206,'2015-02-17 13:34:50',1046,4),(114207,'2015-02-17 13:34:50',988,3),(114208,'2015-02-17 13:39:39',999,7),(114209,'2015-02-17 13:39:39',953,1),(114210,'2015-02-17 13:39:39',1036,6),(114211,'2015-02-17 13:39:39',953,10),(114212,'2015-02-17 13:40:40',1034,4),(114213,'2015-02-17 13:40:40',976,3),(114214,'2015-02-17 13:40:40',1048,6),(114215,'2015-02-17 13:40:40',1013,2),(114216,'2015-02-18 13:17:03',1036,6),(114217,'2015-02-18 13:17:03',941,10),(114218,'2015-02-18 13:17:03',1011,7),(114219,'2015-02-18 13:17:03',1024,9),(114220,'2015-02-18 13:21:58',966,3),(114221,'2015-02-18 13:21:58',943,1),(114222,'2015-02-18 13:21:58',1044,4),(114223,'2015-02-18 13:21:58',1022,5),(114224,'2015-02-18 13:25:51',1032,4),(114225,'2015-02-18 13:25:51',999,7),(114226,'2015-02-18 13:25:51',1048,6),(114227,'2015-02-18 13:25:51',1036,9),(114228,'2015-02-18 13:27:09',1020,4),(114229,'2015-02-18 13:27:09',929,10),(114230,'2015-02-18 13:27:09',978,3),(114231,'2015-02-18 13:27:09',1034,5),(114232,'2015-02-18 13:34:44',932,1),(114233,'2015-02-18 13:34:44',1037,6),(114234,'2015-02-18 13:34:44',1047,9),(114235,'2015-02-18 13:34:44',1010,7),(114236,'2015-02-18 13:37:53',1048,6),(114237,'2015-02-18 13:37:53',1045,5),(114238,'2015-02-18 13:37:53',967,3),(114239,'2015-02-18 13:37:53',1009,4),(114240,'2015-02-18 13:43:42',923,1),(114241,'2015-02-18 13:43:42',1018,4),(114242,'2015-02-20 13:17:24',998,7),(114243,'2015-02-20 13:17:24',955,3),(114244,'2015-02-20 13:17:24',1057,5),(114245,'2015-02-20 13:17:24',935,1),(114246,'2015-02-20 13:22:52',987,7),(114247,'2015-02-20 13:22:52',924,1),(114248,'2015-02-20 13:22:52',966,3),(114249,'2015-02-20 13:22:52',1068,5),(114250,'2015-02-20 13:30:30',990,11),(114251,'2015-02-20 13:30:30',956,3),(114252,'2015-02-20 13:30:30',997,7),(114253,'2015-02-20 13:30:30',1078,5),(114254,'2015-02-20 13:36:19',975,11),(114255,'2015-02-20 13:36:19',1063,5),(114256,'2015-02-20 13:36:19',939,1),(114257,'2015-02-20 13:36:19',1012,7),(114258,'2015-02-20 13:41:06',1075,5),(114259,'2015-02-20 13:41:06',951,1),(114260,'2015-02-20 13:41:06',963,11),(114261,'2015-02-20 13:41:06',1000,7),(114262,'2015-02-23 13:29:44',1031,4),(114263,'2015-02-23 13:29:44',969,3),(114264,'2015-02-23 13:29:44',1062,5),(114265,'2015-02-23 13:29:44',938,1),(114266,'2015-02-23 13:36:43',1040,4),(114267,'2015-02-23 13:36:43',1071,5),(114268,'2015-02-23 13:36:43',960,3),(114269,'2015-02-23 13:36:43',929,1),(114270,'2015-02-23 13:41:24',989,7),(114271,'2015-02-23 13:41:24',949,3),(114272,'2015-02-23 13:41:24',1082,5),(114273,'2015-02-23 13:41:24',940,1),(114274,'2015-02-23 13:46:25',1092,5),(114275,'2015-02-23 13:46:25',959,3),(114276,'2015-02-23 13:46:25',979,7),(114277,'2015-02-23 13:46:25',930,1),(114278,'2015-02-24 13:23:48',1078,5),(114279,'2015-02-24 13:23:48',965,7),(114280,'2015-02-24 13:23:48',1027,2),(114281,'2015-02-24 13:23:48',944,1),(114282,'2015-02-24 13:25:19',955,7),(114283,'2015-02-24 13:25:19',1030,4),(114284,'2015-02-24 13:25:19',1088,5),(114285,'2015-02-24 13:25:19',1037,2),(114286,'2015-02-24 13:35:02',1075,5),(114287,'2015-02-24 13:35:02',931,1),(114288,'2015-02-24 13:35:02',968,7),(114289,'2015-02-24 13:35:02',1050,2),(114290,'2015-02-24 13:37:58',972,3),(114291,'2015-02-24 13:37:58',1013,8),(114292,'2015-02-24 13:37:58',1017,4),(114293,'2015-02-24 13:37:58',987,12),(114294,'2015-02-24 13:43:12',1027,4),(114295,'2015-02-24 13:43:12',1060,2),(114296,'2015-02-24 13:43:12',977,12),(114297,'2015-02-24 13:43:12',958,7),(114298,'2015-02-24 13:47:30',982,3),(114299,'2015-02-24 13:47:30',1070,2),(114300,'2015-02-24 13:47:30',967,12),(114301,'2015-02-24 13:47:30',921,1),(114302,'2015-02-24 13:49:42',947,7),(114303,'2015-02-24 13:49:42',1016,4),(114304,'2015-02-24 13:49:42',1086,5),(114305,'2015-02-24 13:49:42',978,12),(114306,'2015-02-25 13:40:51',935,7),(114307,'2015-02-25 13:40:51',1058,2),(114308,'2015-02-25 13:40:51',994,3),(114309,'2015-02-25 13:40:51',1025,8),(114310,'2015-02-25 13:44:52',947,7),(114311,'2015-02-25 13:44:52',1070,2),(114312,'2015-02-25 13:44:52',982,3),(114313,'2015-02-25 13:44:52',1013,8),(114314,'2015-02-26 13:22:26',1099,5),(114315,'2015-02-26 13:22:26',934,1),(114316,'2015-02-26 13:22:26',1003,4),(114317,'2015-02-26 13:22:26',1057,2),(114318,'2015-02-26 13:29:30',937,7),(114319,'2015-02-26 13:29:30',993,4),(114320,'2015-02-26 13:29:30',1109,5),(114321,'2015-02-26 13:29:30',973,11),(114322,'2015-02-26 13:36:09',924,7),(114323,'2015-02-26 13:36:09',1096,5),(114324,'2015-02-26 13:36:09',986,11),(114325,'2015-02-26 13:36:09',1006,4),(114326,'2015-02-27 13:34:03',1083,5),(114327,'2015-02-27 13:34:03',911,7),(114328,'2015-02-27 13:34:03',1019,4),(114329,'2015-02-27 13:34:03',995,3),(114330,'2015-02-27 13:36:35',1068,5),(114331,'2015-02-27 13:36:35',980,3),(114332,'2015-02-27 13:36:35',926,7),(114333,'2015-02-27 13:36:35',1034,4),(114334,'2015-02-27 13:36:35',1054,5),(114335,'2015-02-27 13:36:35',966,3),(114336,'2015-02-27 13:36:35',940,7),(114337,'2015-02-27 13:36:35',1048,4),(114338,'2015-02-27 13:39:55',931,7),(114339,'2015-02-27 13:39:55',957,3),(114340,'2015-02-27 13:39:55',1063,5),(114341,'2015-02-27 13:39:55',1057,4),(114342,'2015-02-27 13:46:20',1051,5),(114343,'2015-02-27 13:46:20',1069,4),(114344,'2015-02-27 13:49:22',968,3),(114345,'2015-02-27 13:49:22',920,7),(114346,'2015-03-02 13:24:09',910,7),(114347,'2015-03-02 13:24:09',958,3),(114348,'2015-03-02 13:24:09',944,1),(114349,'2015-03-02 13:24:09',1067,2),(114350,'2015-03-02 13:28:55',947,3),(114351,'2015-03-02 13:28:55',933,1),(114352,'2015-03-02 13:28:55',1078,2),(114353,'2015-03-02 13:28:55',921,7),(114354,'2015-03-02 13:32:27',912,7),(114355,'2015-03-02 13:32:27',924,1),(114356,'2015-03-02 13:32:27',956,3),(114357,'2015-03-02 13:32:27',1087,2),(114358,'2015-03-03 13:24:07',1059,5),(114359,'2015-03-03 13:24:07',1077,4),(114360,'2015-03-03 13:24:07',948,3),(114361,'2015-03-03 13:24:07',916,1),(114362,'2015-03-03 13:30:53',1064,4),(114363,'2015-03-03 13:30:53',935,3),(114364,'2015-03-03 13:30:53',925,7),(114365,'2015-03-03 13:30:53',1072,5),(114366,'2015-03-03 13:37:34',1050,4),(114367,'2015-03-03 13:37:34',902,1),(114368,'2015-03-03 13:37:34',939,7),(114369,'2015-03-03 13:37:34',949,3),(114370,'2015-03-03 13:42:51',925,7),(114371,'2015-03-03 13:42:51',1036,4),(114372,'2015-03-03 13:42:51',963,3),(114373,'2015-03-03 13:42:51',916,1),(114374,'2015-03-03 13:48:29',912,7),(114375,'2015-03-03 13:48:29',1023,4),(114376,'2015-03-03 13:48:29',976,3),(114377,'2015-03-03 13:48:29',929,1),(114378,'2015-03-04 13:38:42',940,1),(114379,'2015-03-04 13:38:42',1098,2),(114380,'2015-03-04 13:38:42',1061,5),(114381,'2015-03-04 13:38:42',901,7),(114382,'2015-03-04 13:41:23',890,7),(114383,'2015-03-04 13:41:23',1087,2),(114384,'2015-03-04 13:41:23',1072,5),(114385,'2015-03-04 13:41:23',987,3),(114386,'2015-03-04 13:50:25',1074,2),(114387,'2015-03-04 13:50:25',974,3),(114388,'2015-03-04 13:50:25',1085,5),(114389,'2015-03-04 13:50:25',953,1),(114390,'2015-03-05 13:27:22',1072,5),(114391,'2015-03-05 13:27:22',1035,6),(114392,'2015-03-05 13:27:22',1087,2),(114393,'2015-03-05 13:27:22',987,3),(114394,'2015-03-05 13:37:17',966,1),(114395,'2015-03-05 13:37:17',1048,6),(114396,'2015-03-05 13:37:17',974,3),(114397,'2015-03-05 13:37:17',1059,5),(114398,'2015-03-05 13:40:17',1096,2),(114399,'2015-03-05 13:40:17',1057,6),(114400,'2015-03-05 13:40:17',965,3),(114401,'2015-03-05 13:40:17',957,1),(114402,'2015-03-05 13:47:52',1047,6),(114403,'2015-03-05 13:47:52',947,1),(114404,'2015-03-05 13:47:52',1069,5),(114405,'2015-03-05 13:47:52',1106,2),(114406,'2015-03-05 13:52:16',952,3),(114407,'2015-03-05 13:52:16',1093,2),(114408,'2015-03-05 13:52:16',1082,5),(114409,'2015-03-05 13:52:16',960,1),(114410,'2015-03-06 13:13:33',1055,6),(114411,'2015-03-06 13:13:33',1031,4),(114412,'2015-03-06 13:13:33',882,7),(114413,'2015-03-06 13:13:33',944,3),(114414,'2015-03-06 13:15:43',1103,2),(114415,'2015-03-06 13:15:43',1065,6),(114416,'2015-03-06 13:15:43',1072,5),(114417,'2015-03-06 13:15:43',950,1),(114418,'2015-03-06 13:21:21',933,3),(114419,'2015-03-06 13:21:21',1092,2),(114420,'2015-03-06 13:21:21',1083,5),(114421,'2015-03-06 13:21:21',1042,4),(114422,'2015-03-06 13:27:20',1029,4),(114423,'2015-03-06 13:27:20',937,1),(114424,'2015-03-06 13:27:20',895,7),(114425,'2015-03-06 13:27:20',1078,6),(114426,'2015-03-06 13:33:06',924,1),(114427,'2015-03-06 13:33:06',1079,2),(114428,'2015-03-06 13:33:06',946,3),(114429,'2015-03-06 13:33:06',1042,4),(114430,'2015-03-06 13:37:15',1094,5),(114431,'2015-03-06 13:37:15',1089,6),(114432,'2015-03-06 13:37:15',1031,4),(114433,'2015-03-06 13:37:15',1068,2),(114434,'2015-03-09 13:43:21',1105,5),(114435,'2015-03-09 13:43:21',935,1),(114436,'2015-03-09 13:43:21',884,7),(114437,'2015-03-09 13:43:21',1057,2),(114438,'2015-03-09 13:47:32',1113,5),(114439,'2015-03-09 13:47:32',943,1),(114440,'2015-03-09 13:47:32',876,7),(114441,'2015-03-09 13:47:32',938,3),(114442,'2015-03-09 13:52:56',952,3),(114443,'2015-03-09 13:52:56',957,1),(114444,'2015-03-09 13:52:56',862,7),(114445,'2015-03-09 13:52:56',1099,5),(114446,'2015-03-09 13:58:24',1107,5),(114447,'2015-03-09 13:58:24',960,3),(114448,'2015-03-09 13:58:24',854,7),(114449,'2015-03-09 13:58:24',949,1),(114450,'2015-03-09 14:03:44',948,3),(114451,'2015-03-09 14:03:44',937,1),(114452,'2015-03-09 14:03:44',866,7),(114453,'2015-03-09 14:03:44',1043,4),(114454,'2015-03-09 14:10:25',1093,5),(114455,'2015-03-09 14:10:25',923,1),(114456,'2015-03-09 14:10:25',880,7),(114457,'2015-03-09 14:10:25',1057,4),(114458,'2015-03-10 13:12:25',938,3),(114459,'2015-03-10 13:12:25',1047,2),(114460,'2015-03-10 13:12:25',1067,4),(114461,'2015-03-10 13:12:25',1099,6),(114462,'2015-03-10 13:21:11',911,1),(114463,'2015-03-10 13:21:11',1055,4),(114464,'2015-03-10 13:21:11',1105,5),(114465,'2015-03-10 13:21:11',892,7),(114466,'2015-03-10 13:25:14',1056,2),(114467,'2015-03-10 13:25:14',1108,6),(114468,'2015-03-10 13:25:14',1046,4),(114469,'2015-03-10 13:25:14',929,3),(114470,'2015-03-10 13:29:08',880,7),(114471,'2015-03-10 13:29:08',1096,6),(114472,'2015-03-10 13:29:08',1117,5),(114473,'2015-03-10 13:29:08',923,1),(114474,'2015-03-10 13:30:09',1127,5),(114475,'2015-03-10 13:30:09',1106,6),(114476,'2015-03-10 13:30:09',1036,4),(114477,'2015-03-10 13:30:09',1046,2),(114478,'2015-03-10 13:42:40',915,3),(114479,'2015-03-10 13:42:40',1092,6),(114480,'2015-03-10 13:42:40',894,7),(114481,'2015-03-10 13:42:40',1050,4),(114482,'2015-03-11 13:42:29',1117,5),(114483,'2015-03-11 13:42:29',913,1),(114484,'2015-03-11 13:42:29',1060,4),(114485,'2015-03-11 13:42:29',1102,6),(114486,'2015-03-11 13:48:45',928,3),(114487,'2015-03-11 13:48:45',1073,4),(114488,'2015-03-11 13:48:45',1104,5),(114489,'2015-03-11 13:48:45',900,1),(114490,'2015-03-11 13:50:36',1092,5),(114491,'2015-03-11 13:50:36',1034,2),(114492,'2015-03-11 13:50:36',1085,4),(114493,'2015-03-11 13:50:36',1114,6),(114494,'2015-03-11 13:58:54',904,7),(114495,'2015-03-11 13:58:54',1044,2),(114496,'2015-03-11 13:58:54',918,3),(114497,'2015-03-11 13:58:54',890,1),(114498,'2015-03-11 14:04:21',1032,2),(114499,'2015-03-11 14:04:21',1102,6),(114500,'2015-03-11 14:04:21',1097,4),(114501,'2015-03-11 14:04:21',1104,5),(114502,'2015-03-11 14:08:23',895,7),(114503,'2015-03-11 14:08:23',909,3),(114504,'2015-03-11 14:08:23',899,1),(114505,'2015-03-11 14:08:23',1111,6),(114506,'2015-03-12 13:30:58',1087,5),(114507,'2015-03-12 13:30:58',1094,6),(114508,'2015-03-12 13:30:58',1049,2),(114509,'2015-03-12 13:30:58',916,1),(114510,'2015-03-12 13:32:23',1059,2),(114511,'2015-03-12 13:32:23',1107,4),(114512,'2015-03-12 13:32:23',899,3),(114513,'2015-03-12 13:32:23',1084,6),(114514,'2015-03-12 13:42:26',1091,4),(114515,'2015-03-12 13:42:26',1071,5),(114516,'2015-03-12 13:42:26',1075,2),(114517,'2015-03-12 13:42:26',932,1),(114518,'2015-03-12 13:44:11',1106,4),(114519,'2015-03-12 13:44:11',914,3),(114520,'2015-03-12 13:44:11',1060,2),(114521,'2015-03-12 13:44:11',1069,6),(114522,'2015-03-12 13:46:15',1096,4),(114523,'2015-03-12 13:46:15',904,3),(114524,'2015-03-12 13:46:15',1081,5),(114525,'2015-03-12 13:46:15',1079,6),(114526,'2015-03-12 13:58:35',1090,5),(114527,'2015-03-12 13:58:35',1088,6),(114528,'2015-03-12 13:58:35',1087,4),(114529,'2015-03-12 13:58:35',895,3),(114530,'2015-03-13 13:38:17',908,3),(114531,'2015-03-13 13:38:17',1073,2),(114532,'2015-03-13 13:38:17',1077,5),(114533,'2015-03-13 13:38:17',919,1),(114534,'2015-03-13 13:45:55',883,7),(114535,'2015-03-13 13:45:55',1061,2),(114536,'2015-03-13 13:45:55',1089,5),(114537,'2015-03-13 13:45:55',931,1),(114538,'2015-03-13 13:46:43',896,7),(114539,'2015-03-13 13:46:43',1074,2),(114540,'2015-03-13 13:46:43',895,3),(114541,'2015-03-13 13:46:43',1076,5),(114542,'2015-03-13 13:51:28',887,7),(114543,'2015-03-13 13:51:28',1065,2),(114544,'2015-03-13 13:51:28',1096,4),(114545,'2015-03-13 13:51:28',1085,5),(114546,'2015-03-16 13:32:37',886,3),(114547,'2015-03-16 13:32:37',922,1),(114548,'2015-03-16 13:32:37',896,7),(114549,'2015-03-16 13:32:37',1097,6),(114550,'2015-03-16 13:37:05',888,7),(114551,'2015-03-16 13:37:05',878,3),(114552,'2015-03-16 13:37:05',930,1),(114553,'2015-03-16 13:37:05',1105,6),(114554,'2015-03-16 13:38:05',1107,4),(114555,'2015-03-16 13:38:05',1096,5),(114556,'2015-03-16 13:38:05',1036,9),(114557,'2015-03-16 13:38:05',1094,6),(114558,'2015-03-16 13:46:22',863,3),(114559,'2015-03-16 13:46:22',1092,4),(114560,'2015-03-16 13:46:22',945,1),(114561,'2015-03-16 13:46:22',903,7),(114562,'2015-03-16 13:47:45',1107,5),(114563,'2015-03-16 13:47:45',1105,6),(114564,'2015-03-16 13:47:45',1081,4),(114565,'2015-03-16 13:47:45',1025,9),(114566,'2015-03-16 13:52:21',1035,9),(114567,'2015-03-16 13:52:21',1115,6),(114568,'2015-03-16 13:52:21',893,7),(114569,'2015-03-16 13:52:21',1071,4),(114570,'2015-03-17 13:29:58',883,7),(114571,'2015-03-17 13:29:58',935,1),(114572,'2015-03-17 13:29:58',873,3),(114573,'2015-03-17 13:29:58',1125,6),(114574,'2015-03-17 13:33:05',1021,9),(114575,'2015-03-17 13:33:05',1093,5),(114576,'2015-03-17 13:33:05',897,7),(114577,'2015-03-17 13:33:05',1139,6),(114578,'2015-03-17 13:40:27',946,1),(114579,'2015-03-17 13:40:27',1104,5),(114580,'2015-03-17 13:40:27',862,3),(114581,'2015-03-17 13:40:27',1060,4),(114582,'2015-03-17 13:43:26',910,7),(114583,'2015-03-17 13:43:26',1034,9),(114584,'2015-03-17 13:43:26',849,3),(114585,'2015-03-17 13:43:26',1126,6),(114586,'2015-03-17 13:46:01',1092,5),(114587,'2015-03-17 13:46:01',1048,4),(114588,'2015-03-17 13:46:01',1046,9),(114589,'2015-03-17 13:46:01',1138,6),(114590,'2015-03-17 13:53:14',836,3),(114591,'2015-03-17 13:53:14',1033,9),(114592,'2015-03-17 13:53:14',923,7),(114593,'2015-03-17 13:53:14',959,1),(114594,'2015-03-17 13:56:55',1105,5),(114595,'2015-03-17 13:56:55',1046,9),(114596,'2015-03-17 13:56:55',1035,4),(114597,'2015-03-17 13:56:55',1125,6),(114598,'2015-03-18 13:42:40',1092,5),(114599,'2015-03-18 13:42:40',910,7),(114600,'2015-03-18 13:42:40',849,3),(114601,'2015-03-18 13:42:40',1138,6),(114602,'2015-03-18 13:45:46',941,10),(114603,'2015-03-18 13:45:46',1058,9),(114604,'2015-03-18 13:45:46',1001,8),(114605,'2015-03-18 13:45:46',947,1),(114606,'2015-03-18 13:47:47',1083,5),(114607,'2015-03-18 13:47:47',840,3),(114608,'2015-03-18 13:47:47',1010,8),(114609,'2015-03-18 13:47:47',1147,6),(114610,'2015-03-18 14:00:59',959,1),(114611,'2015-03-18 14:00:59',1047,4),(114612,'2015-03-18 14:00:59',898,7),(114613,'2015-03-18 14:00:59',1046,9),(114614,'2015-03-18 14:01:46',1089,5),(114615,'2015-03-18 14:01:46',1053,4),(114616,'2015-03-18 14:01:46',834,3),(114617,'2015-03-18 14:01:46',935,10),(114618,'2015-03-18 14:11:29',947,10),(114619,'2015-03-18 14:11:29',1065,4),(114620,'2015-03-18 14:11:29',886,7),(114621,'2015-03-18 14:11:29',1077,5),(114622,'2015-03-19 13:27:12',1037,9),(114623,'2015-03-19 13:27:12',825,3),(114624,'2015-03-19 13:27:12',968,1),(114625,'2015-03-19 13:27:12',1086,5),(114626,'2015-03-19 13:28:32',937,10),(114627,'2015-03-19 13:28:32',1055,4),(114628,'2015-03-19 13:28:32',1096,5),(114629,'2015-03-19 13:28:32',1047,9),(114630,'2015-03-19 13:32:42',922,10),(114631,'2015-03-19 13:32:42',1040,4),(114632,'2015-03-19 13:32:42',840,3),(114633,'2015-03-19 13:32:42',983,1),(114634,'2015-03-19 13:45:41',1028,4),(114635,'2015-03-19 13:45:41',1035,9),(114636,'2015-03-19 13:45:41',1108,5),(114637,'2015-03-19 13:45:41',995,1),(114638,'2015-03-19 13:55:28',829,3),(114639,'2015-03-19 13:55:28',1024,9),(114640,'2015-03-19 13:55:28',933,10),(114641,'2015-03-19 13:55:28',1039,4),(114642,'2015-03-19 18:25:14',1095,5),(114643,'2015-03-19 18:25:14',1052,2),(114644,'2015-03-19 18:25:14',1008,1),(114645,'2015-03-19 18:25:14',1160,6),(114646,'2015-03-19 18:27:04',1062,2),(114647,'2015-03-19 18:27:04',1105,5),(114648,'2015-03-19 18:27:04',876,7),(114649,'2015-03-19 18:27:04',1150,6),(114650,'2015-03-19 18:29:28',1158,6),(114651,'2015-03-19 18:29:28',1070,2),(114652,'2015-03-19 18:29:28',868,7),(114653,'2015-03-19 18:29:28',1097,5),(114654,'2015-03-20 12:00:53',882,7),(114655,'2015-03-20 12:00:53',1014,14),(114656,'2015-03-20 12:00:53',1010,9),(114657,'2015-03-20 12:00:53',919,10),(114658,'2015-03-20 12:05:45',998,14),(114659,'2015-03-20 12:05:45',994,9),(114660,'2015-03-20 12:05:45',898,7),(114661,'2015-03-20 12:05:45',935,10),(114662,'2015-03-20 13:55:06',986,9),(114663,'2015-03-20 13:55:06',821,3),(114664,'2015-03-20 13:55:06',943,10),(114665,'2015-03-20 13:55:06',1105,5),(114666,'2015-03-20 14:00:22',1112,5),(114667,'2015-03-20 14:00:22',950,10),(114668,'2015-03-20 14:00:22',891,7),(114669,'2015-03-20 14:00:22',814,3),(114670,'2015-03-20 14:04:24',905,7),(114671,'2015-03-20 14:04:24',1084,2),(114672,'2015-03-20 14:04:24',1098,5),(114673,'2015-03-20 14:04:24',936,10),(114674,'2015-03-23 13:17:06',1083,5),(114675,'2015-03-23 13:17:06',995,8),(114676,'2015-03-23 13:17:06',920,7),(114677,'2015-03-23 13:17:06',1054,4),(114678,'2015-03-23 13:20:53',908,7),(114679,'2015-03-23 13:20:53',986,14),(114680,'2015-03-23 13:20:53',826,3),(114681,'2015-03-23 13:20:53',1095,5),(114682,'2015-03-23 13:21:26',1041,4),(114683,'2015-03-23 13:21:26',987,13),(114684,'2015-03-23 13:21:26',839,3),(114685,'2015-03-23 13:21:26',1171,6),(114686,'2015-03-23 13:24:03',1110,5),(114687,'2015-03-23 13:24:03',923,7),(114688,'2015-03-23 13:24:03',980,8),(114689,'2015-03-23 13:24:03',1156,6),(114690,'2015-03-23 13:28:50',855,3),(114691,'2015-03-23 13:28:50',996,8),(114692,'2015-03-23 13:28:50',971,13),(114693,'2015-03-23 13:28:50',1025,4),(114694,'2015-03-23 13:40:25',1116,5),(114695,'2015-03-23 13:40:25',1162,6),(114696,'2015-03-23 13:40:25',917,7),(114697,'2015-03-23 13:40:25',965,13),(114698,'2015-03-23 13:43:05',979,8),(114699,'2015-03-23 13:43:05',1145,6),(114700,'2015-03-23 13:43:05',872,3),(114701,'2015-03-23 13:43:05',1042,4),(114702,'2015-03-23 13:47:30',1099,5),(114703,'2015-03-23 13:47:30',1128,6),(114704,'2015-03-23 13:47:30',934,7),(114705,'2015-03-23 13:47:30',1059,4),(114706,'2015-03-24 13:37:42',946,10),(114707,'2015-03-24 13:37:42',1069,4),(114708,'2015-03-24 13:37:42',924,7),(114709,'2015-03-24 13:37:42',955,13),(114710,'2015-03-24 13:42:20',935,10),(114711,'2015-03-24 13:42:20',1058,4),(114712,'2015-03-24 13:42:20',966,13),(114713,'2015-03-24 13:42:20',1139,6),(114714,'2015-03-24 13:47:11',914,7),(114715,'2015-03-24 13:47:11',1048,4),(114716,'2015-03-24 13:47:11',1149,6),(114717,'2015-03-24 13:47:11',945,10),(114718,'2015-03-24 13:52:37',955,13),(114719,'2015-03-24 13:52:37',1037,4),(114720,'2015-03-24 13:52:37',1160,6),(114721,'2015-03-24 13:52:37',925,7),(114722,'2015-03-24 13:55:59',946,13),(114723,'2015-03-24 13:55:59',936,10),(114724,'2015-03-24 13:55:59',934,7),(114725,'2015-03-24 13:55:59',1169,6),(114726,'2015-03-24 14:03:05',936,13),(114727,'2015-03-24 14:03:05',1027,4),(114728,'2015-03-24 14:03:05',944,7),(114729,'2015-03-24 14:03:05',1179,6),(114730,'2015-03-24 14:06:48',946,13),(114731,'2015-03-24 14:06:48',1189,6),(114732,'2015-03-24 14:06:48',934,7),(114733,'2015-03-24 14:06:48',1017,4),(114734,'2015-03-24 14:10:04',931,13),(114735,'2015-03-24 14:10:04',1174,6),(114736,'2015-03-24 14:10:04',949,7),(114737,'2015-03-24 14:10:04',1032,4),(114738,'2015-03-24 14:17:06',941,13),(114739,'2015-03-24 14:17:06',1184,6),(114740,'2015-03-24 14:17:06',939,7),(114741,'2015-03-24 14:17:06',1022,4),(114742,'2015-03-25 13:30:37',1088,5),(114743,'2015-03-25 13:30:37',1011,4),(114744,'2015-03-25 13:30:37',1019,1),(114745,'2015-03-25 13:30:37',1195,6),(114746,'2015-03-25 13:31:58',1201,6),(114747,'2015-03-25 13:31:58',1094,5),(114748,'2015-03-25 13:31:58',933,7),(114749,'2015-03-25 13:31:58',935,13),(114750,'2015-03-25 13:36:39',1105,5),(114751,'2015-03-25 13:36:39',946,13),(114752,'2015-03-25 13:36:39',922,7),(114753,'2015-03-25 13:36:39',1000,4),(114754,'2015-03-25 13:41:32',1096,5),(114755,'2015-03-25 13:41:32',937,13),(114756,'2015-03-25 13:41:32',1210,6),(114757,'2015-03-25 13:41:32',1009,4),(114758,'2015-03-25 13:50:38',913,7),(114759,'2015-03-25 13:50:38',1000,4),(114760,'2015-03-25 13:50:38',1105,5),(114761,'2015-03-25 13:50:38',1028,1),(114762,'2015-03-25 13:55:16',990,4),(114763,'2015-03-25 13:55:16',1018,1),(114764,'2015-03-25 13:55:16',947,13),(114765,'2015-03-25 13:55:16',1220,6),(114766,'2015-03-25 13:56:45',1118,5),(114767,'2015-03-25 13:56:45',1003,4),(114768,'2015-03-25 13:56:45',934,13),(114769,'2015-03-25 13:56:45',1207,6),(114770,'2015-03-25 14:01:13',918,13),(114771,'2015-03-25 14:01:13',1191,6),(114772,'2015-03-25 14:01:13',929,7),(114773,'2015-03-25 14:01:13',1019,4),(114774,'2015-03-26 13:23:08',920,7),(114775,'2015-03-26 13:23:08',1109,5),(114776,'2015-03-26 13:23:08',1200,6),(114777,'2015-03-26 13:23:08',1028,4),(114778,'2015-03-26 13:33:28',1120,5),(114779,'2015-03-26 13:33:28',883,3),(114780,'2015-03-26 13:33:28',1017,4),(114781,'2015-03-26 13:33:28',907,13),(114782,'2015-03-26 13:41:30',927,7),(114783,'2015-03-26 13:41:30',1207,6),(114784,'2015-03-26 13:41:30',876,3),(114785,'2015-03-26 13:41:30',900,13),(114786,'2015-03-26 13:43:16',921,7),(114787,'2015-03-26 13:43:16',1011,4),(114788,'2015-03-26 13:43:16',1126,5),(114789,'2015-03-26 13:43:16',1213,6),(114790,'2015-03-26 13:45:30',885,3),(114791,'2015-03-26 13:45:30',1222,6),(114792,'2015-03-26 13:45:30',891,13),(114793,'2015-03-26 13:45:30',1002,4),(114794,'2015-03-26 13:56:36',1110,5),(114795,'2015-03-26 13:56:36',875,13),(114796,'2015-03-26 13:56:36',937,7),(114797,'2015-03-26 13:56:36',901,3),(114798,'2015-03-26 14:04:03',1122,5),(114799,'2015-03-26 14:04:03',1014,4),(114800,'2015-03-26 14:04:03',863,13),(114801,'2015-03-26 14:04:03',1210,6),(114802,'2015-03-27 13:30:29',855,13),(114803,'2015-03-27 13:30:29',1010,1),(114804,'2015-03-27 13:30:29',909,3),(114805,'2015-03-27 13:30:29',1218,6),(114806,'2015-03-27 13:32:50',1131,5),(114807,'2015-03-27 13:32:50',995,14),(114808,'2015-03-27 13:32:50',928,7),(114809,'2015-03-27 13:32:50',1005,4),(114810,'2015-03-27 13:40:38',993,1),(114811,'2015-03-27 13:40:38',1201,6),(114812,'2015-03-27 13:40:38',1022,4),(114813,'2015-03-27 13:40:38',926,3),(114814,'2015-03-27 13:44:23',1143,5),(114815,'2015-03-27 13:44:23',940,7),(114816,'2015-03-27 13:44:23',1189,6),(114817,'2015-03-27 13:44:23',843,13),(114818,'2015-03-27 13:56:20',913,3),(114819,'2015-03-27 13:56:20',980,1),(114820,'2015-03-27 13:56:20',856,13),(114821,'2015-03-27 13:56:20',1035,4),(114822,'2015-03-27 14:04:38',1133,5),(114823,'2015-03-27 14:04:38',970,1),(114824,'2015-03-27 14:04:38',1045,4),(114825,'2015-03-27 14:04:38',1199,6),(114826,'2015-03-30 13:22:10',1124,5),(114827,'2015-03-30 13:22:10',927,10),(114828,'2015-03-30 13:22:10',1208,6),(114829,'2015-03-30 13:22:10',1054,4),(114830,'2015-03-30 13:27:29',1111,5),(114831,'2015-03-30 13:27:29',843,13),(114832,'2015-03-30 13:27:29',992,8),(114833,'2015-03-30 13:27:29',953,7),(114834,'2015-03-30 13:37:26',1121,5),(114835,'2015-03-30 13:37:26',1002,8),(114836,'2015-03-30 13:37:26',943,7),(114837,'2015-03-30 13:37:26',1044,4),(114838,'2015-03-30 13:42:22',1036,4),(114839,'2015-03-30 13:42:22',835,13),(114840,'2015-03-30 13:42:22',951,7),(114841,'2015-03-30 13:42:22',1216,6),(114842,'2015-03-30 13:50:20',964,7),(114843,'2015-03-30 13:50:20',1049,4),(114844,'2015-03-30 13:50:20',822,13),(114845,'2015-03-30 13:50:20',1203,6),(114846,'2015-03-30 13:54:20',952,7),(114847,'2015-03-30 13:54:20',1037,4),(114848,'2015-03-30 13:54:20',834,13),(114849,'2015-03-30 13:54:20',1215,6),(114850,'2015-03-30 14:03:20',965,7),(114851,'2015-03-30 14:03:20',1050,4),(114852,'2015-03-30 14:03:20',821,13),(114853,'2015-03-30 14:03:20',1202,6),(114854,'2015-03-31 13:33:23',1136,5),(114855,'2015-03-31 13:33:23',980,7),(114856,'2015-03-31 13:33:23',1035,4),(114857,'2015-03-31 13:33:23',1187,6),(114858,'2015-03-31 13:37:25',937,10),(114859,'2015-03-31 13:37:25',1197,6),(114860,'2015-03-31 13:37:25',992,8),(114861,'2015-03-31 13:37:25',976,9),(114862,'2015-03-31 13:41:23',1144,5),(114863,'2015-03-31 13:41:23',1043,4),(114864,'2015-03-31 13:41:23',972,7),(114865,'2015-03-31 13:41:23',968,9),(114866,'2015-03-31 13:46:33',1055,4),(114867,'2015-03-31 13:46:33',1004,8),(114868,'2015-03-31 13:46:33',809,13),(114869,'2015-03-31 13:46:33',1185,6),(114870,'2015-04-01 13:35:18',982,7),(114871,'2015-04-01 13:35:18',1195,6),(114872,'2015-04-01 13:35:18',903,3),(114873,'2015-04-01 13:35:18',1134,5),(114874,'2015-04-01 13:36:33',928,10),(114875,'2015-04-01 13:36:33',995,8),(114876,'2015-04-01 13:36:33',977,9),(114877,'2015-04-01 13:36:33',1143,5),(114878,'2015-04-01 13:41:05',968,9),(114879,'2015-04-01 13:41:05',986,8),(114880,'2015-04-01 13:41:05',991,7),(114881,'2015-04-01 13:41:05',1204,6),(114882,'2015-04-01 13:46:50',1152,5),(114883,'2015-04-01 13:46:50',937,10),(114884,'2015-04-01 13:46:50',894,3),(114885,'2015-04-01 13:46:50',977,8),(114886,'2015-04-01 14:05:57',903,3),(114887,'2015-04-01 14:05:57',1064,4),(114888,'2015-04-01 14:05:57',982,7),(114889,'2015-04-01 14:05:57',800,13),(114890,'2015-04-02 13:35:53',795,13),(114891,'2015-04-02 13:35:53',898,3),(114892,'2015-04-02 13:35:53',973,9),(114893,'2015-04-02 13:35:53',1209,6),(114894,'2015-04-02 13:37:53',1072,4),(114895,'2015-04-02 13:37:53',1160,5),(114896,'2015-04-02 13:37:53',974,7),(114897,'2015-04-02 13:37:53',969,8),(114898,'2015-04-02 13:41:18',1167,5),(114899,'2015-04-02 13:41:18',1216,6),(114900,'2015-04-02 13:41:18',1065,4),(114901,'2015-04-02 13:41:18',962,8),(114902,'2015-04-02 13:46:20',1009,16),(114903,'2015-04-02 13:46:20',1004,14),(114904,'2015-04-02 13:46:20',991,15),(114905,'2015-04-02 13:46:20',786,13),(114906,'2015-04-02 13:46:50',1003,16),(114907,'2015-04-02 13:46:50',998,14),(114908,'2015-04-02 13:46:50',1173,5),(114909,'2015-04-02 13:46:50',1222,6),(114910,'2015-04-02 13:55:06',1053,4),(114911,'2015-04-02 13:55:06',774,13),(114912,'2015-04-02 13:55:06',910,3),(114913,'2015-04-02 13:55:06',985,9),(114914,'2015-04-07 13:28:45',980,7),(114915,'2015-04-07 13:28:45',1228,6),(114916,'2015-04-07 13:28:45',768,13),(114917,'2015-04-07 13:28:45',1047,4),(114918,'2015-04-07 13:32:56',1001,15),(114919,'2015-04-07 13:32:56',995,9),(114920,'2015-04-07 13:32:56',900,3),(114921,'2015-04-07 13:32:56',927,10),(114922,'2015-04-07 13:36:04',785,13),(114923,'2015-04-07 13:36:04',1064,4),(114924,'2015-04-07 13:36:04',1211,6),(114925,'2015-04-07 13:36:04',910,10),(114926,'2015-04-07 13:41:28',1011,15),(114927,'2015-04-07 13:41:28',1005,9),(114928,'2015-04-07 13:41:28',970,7),(114929,'2015-04-07 13:41:28',890,3),(114930,'2015-04-07 13:42:36',996,9),(114931,'2015-04-07 13:42:36',1075,2),(114932,'2015-04-07 13:42:36',1073,4),(114933,'2015-04-07 13:42:36',1220,6),(114934,'2015-04-07 13:47:44',876,3),(114935,'2015-04-07 13:47:44',997,15),(114936,'2015-04-07 13:47:44',799,13),(114937,'2015-04-07 13:47:44',984,7),(114938,'2015-04-07 13:53:10',1062,4),(114939,'2015-04-07 13:53:10',973,7),(114940,'2015-04-07 13:53:10',1231,6),(114941,'2015-04-07 13:53:10',921,10),(114942,'2015-04-07 13:56:26',1003,15),(114943,'2015-04-07 13:56:26',1081,2),(114944,'2015-04-07 13:56:26',793,13),(114945,'2015-04-07 13:56:26',915,10),(114946,'2015-04-08 13:29:18',1070,4),(114947,'2015-04-08 13:29:18',923,10),(114948,'2015-04-08 13:29:18',785,13),(114949,'2015-04-08 13:29:18',965,7),(114950,'2015-04-08 13:37:38',1186,5),(114951,'2015-04-08 13:37:38',1016,15),(114952,'2015-04-08 13:37:38',983,9),(114953,'2015-04-08 13:37:38',1218,6),(114954,'2015-04-08 13:42:08',885,3),(114955,'2015-04-08 13:42:08',1079,4),(114956,'2015-04-08 13:42:08',776,13),(114957,'2015-04-08 13:42:08',956,7),(114958,'2015-04-08 13:44:28',1085,4),(114959,'2015-04-08 13:44:28',1224,6),(114960,'2015-04-08 13:44:28',917,10),(114961,'2015-04-08 13:44:28',992,14),(114962,'2015-04-08 13:49:55',1167,5),(114963,'2015-04-08 13:49:55',937,7),(114964,'2015-04-08 13:49:55',904,3),(114965,'2015-04-08 13:49:55',795,13),(114966,'2015-04-08 13:52:29',1156,5),(114967,'2015-04-08 13:52:29',1074,4),(114968,'2015-04-08 13:52:29',1092,2),(114969,'2015-04-08 13:52:29',1235,6),(114970,'2015-04-08 13:57:00',1032,15),(114971,'2015-04-08 13:57:00',811,13),(114972,'2015-04-08 13:57:00',1076,2),(114973,'2015-04-08 13:57:00',921,7),(114974,'2015-04-09 13:40:45',909,10),(114975,'2015-04-09 13:40:45',803,13),(114976,'2015-04-09 13:40:45',929,7),(114977,'2015-04-09 13:40:45',1084,2),(114978,'2015-04-09 13:47:11',1147,5),(114979,'2015-04-09 13:47:11',953,8),(114980,'2015-04-09 13:47:11',1093,2),(114981,'2015-04-09 13:47:11',1244,6),(114982,'2015-04-09 13:52:20',889,3),(114983,'2015-04-09 13:52:20',968,9),(114984,'2015-04-09 13:52:20',944,7),(114985,'2015-04-09 13:52:20',818,13),(114986,'2015-04-09 13:56:38',898,10),(114987,'2015-04-09 13:56:38',1233,6),(114988,'2015-04-09 13:56:38',1158,5),(114989,'2015-04-09 13:56:38',1104,2),(114990,'2015-04-09 14:00:50',989,16),(114991,'2015-04-09 14:00:50',978,14),(114992,'2015-04-09 14:00:50',903,3),(114993,'2015-04-09 14:00:50',982,9),(114994,'2015-04-09 14:05:59',1098,2),(114995,'2015-04-09 14:05:59',892,10),(114996,'2015-04-09 14:05:59',1164,5),(114997,'2015-04-09 14:05:59',1239,6),(114998,'2015-04-10 13:28:00',916,3),(114999,'2015-04-10 13:28:00',1087,4),(115000,'2015-04-10 13:28:00',1151,5),(115001,'2015-04-10 13:28:00',879,10),(115002,'2015-04-10 13:29:42',975,16),(115003,'2015-04-10 13:29:42',1225,6),(115004,'2015-04-10 13:29:42',1165,5),(115005,'2015-04-10 13:29:42',996,9),(115006,'2015-04-10 13:36:37',888,10),(115007,'2015-04-10 13:36:37',1234,6),(115008,'2015-04-10 13:36:37',907,3),(115009,'2015-04-10 13:36:37',987,9),(115010,'2015-04-10 13:38:29',1156,5),(115011,'2015-04-10 13:38:29',966,16),(115012,'2015-04-10 13:38:29',1096,4),(115013,'2015-04-10 13:38:29',1243,6),(115014,'2015-04-10 13:43:40',873,10),(115015,'2015-04-10 13:43:40',1141,5),(115016,'2015-04-10 13:43:40',922,3),(115017,'2015-04-10 13:43:40',981,16),(115018,'2015-04-10 13:46:10',1151,5),(115019,'2015-04-10 13:46:10',1106,4),(115020,'2015-04-10 13:46:10',863,10),(115021,'2015-04-10 13:46:10',1233,6),(115022,'2015-04-10 13:48:51',1112,4),(115023,'2015-04-10 13:48:51',1239,6),(115024,'2015-04-10 13:48:51',972,14),(115025,'2015-04-10 13:48:51',975,16),(115026,'2015-04-10 13:52:10',968,16),(115027,'2015-04-10 13:52:10',965,14),(115028,'2015-04-10 13:52:10',1119,4),(115029,'2015-04-10 13:52:10',1158,5),(115030,'2015-04-13 13:33:09',1140,5),(115031,'2015-04-13 13:33:09',1014,15),(115032,'2015-04-13 13:33:09',986,16),(115033,'2015-04-13 13:33:09',836,13),(115034,'2015-04-13 13:37:25',909,3),(115035,'2015-04-13 13:37:25',1226,6),(115036,'2015-04-13 13:37:25',957,7),(115037,'2015-04-13 13:37:25',1153,5),(115038,'2015-04-13 13:41:03',983,9),(115039,'2015-04-13 13:41:03',832,13),(115040,'2015-04-13 13:41:03',1123,4),(115041,'2015-04-13 13:41:03',1230,6),(115042,'2015-04-13 13:45:26',971,7),(115043,'2015-04-13 13:45:26',846,13),(115044,'2015-04-13 13:45:26',895,3),(115045,'2015-04-13 13:45:26',972,16),(115046,'2015-04-13 13:49:15',1003,15),(115047,'2015-04-13 13:49:15',1219,6),(115048,'2015-04-13 13:49:15',1134,4),(115049,'2015-04-13 13:49:15',1164,5),(115050,'2015-04-13 13:51:57',981,7),(115051,'2015-04-13 13:51:57',993,9),(115052,'2015-04-13 13:51:57',962,16),(115053,'2015-04-13 13:51:57',836,13),(115054,'2015-04-13 13:57:27',1174,5),(115055,'2015-04-13 13:57:27',972,16),(115056,'2015-04-13 13:57:27',885,3),(115057,'2015-04-13 13:57:27',1124,4),(115058,'2015-04-13 14:02:25',976,7),(115059,'2015-04-13 14:02:25',831,13),(115060,'2015-04-13 14:02:25',1179,5),(115061,'2015-04-13 14:02:25',1129,4),(115062,'2015-04-14 13:42:56',825,13),(115063,'2015-04-14 13:42:56',879,3),(115064,'2015-04-14 13:42:56',982,7),(115065,'2015-04-14 13:42:56',1135,4),(115066,'2015-04-14 13:47:36',964,16),(115067,'2015-04-14 13:47:36',817,13),(115068,'2015-04-14 13:47:36',887,3),(115069,'2015-04-14 13:47:36',1143,4),(115070,'2015-04-14 13:52:24',957,16),(115071,'2015-04-14 13:52:24',810,13),(115072,'2015-04-14 13:52:24',989,7),(115073,'2015-04-14 13:52:24',1105,2),(115074,'2015-04-14 13:59:11',799,13),(115075,'2015-04-14 13:59:11',1132,4),(115076,'2015-04-14 13:59:11',898,3),(115077,'2015-04-14 13:59:11',1116,2),(115078,'2015-04-14 14:02:44',998,7),(115079,'2015-04-14 14:02:44',1141,4),(115080,'2015-04-14 14:02:44',948,16),(115081,'2015-04-14 14:02:44',956,14),(115082,'2015-04-14 14:07:32',982,7),(115083,'2015-04-14 14:07:32',1163,5),(115084,'2015-04-14 14:07:32',1157,4),(115085,'2015-04-14 14:07:32',815,13);
/*!40000 ALTER TABLE `tf_elo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_match`
--

DROP TABLE IF EXISTS `tf_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_date` datetime NOT NULL,
  `scoreRed` int(11) NOT NULL,
  `scoreBlue` int(11) NOT NULL,
  `playerBlue1_id` int(11),
  `playerBlue2_id` int(11),
  `playerRed1_id` int(11),
  `playerRed2_id` int(11),
  `ordered` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tf_match_447437a7` (`playerBlue1_id`),
  KEY `tf_match_deb0dcec` (`playerBlue2_id`),
  KEY `tf_match_7a7b6039` (`playerRed1_id`),
  KEY `tf_match_3f4d21bc` (`playerRed2_id`),
  CONSTRAINT `tf_match_playerBlue1_id_595ac7ce84a5acc7_fk_tf_player_id` FOREIGN KEY (`playerBlue1_id`) REFERENCES `tf_player` (`id`),
  CONSTRAINT `tf_match_playerBlue2_id_5c8809240f9cb64e_fk_tf_player_id` FOREIGN KEY (`playerBlue2_id`) REFERENCES `tf_player` (`id`),
  CONSTRAINT `tf_match_playerRed1_id_1ab7dab3cf37cdcf_fk_tf_player_id` FOREIGN KEY (`playerRed1_id`) REFERENCES `tf_player` (`id`),
  CONSTRAINT `tf_match_playerRed2_id_261da1db5ae15e6e_fk_tf_player_id` FOREIGN KEY (`playerRed2_id`) REFERENCES `tf_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_match`
--

LOCK TABLES `tf_match` WRITE;
/*!40000 ALTER TABLE `tf_match` DISABLE KEYS */;
INSERT INTO `tf_match` VALUES (33,'2015-02-16 13:15:39',0,5,4,6,1,3,0),(34,'2015-02-16 13:18:42',5,4,9,10,2,5,0),(35,'2015-02-16 13:22:18',3,5,7,2,1,6,0),(36,'2015-02-16 13:23:22',0,5,9,4,5,10,0),(37,'2015-02-16 13:27:39',5,1,7,3,2,6,0),(38,'2015-02-16 13:31:14',5,4,4,10,9,5,0),(39,'2015-02-16 13:36:56',4,5,6,4,2,3,0),(40,'2015-02-17 13:17:16',1,5,7,4,6,10,0),(41,'2015-02-17 13:24:18',5,4,10,4,3,7,0),(42,'2015-02-17 13:30:22',5,3,2,1,6,4,0),(43,'2015-02-17 13:34:50',4,5,4,3,2,7,0),(44,'2015-02-17 13:39:39',1,5,6,10,7,1,0),(45,'2015-02-17 13:40:40',1,5,6,2,4,3,0),(46,'2015-02-18 13:17:03',4,5,7,9,6,10,0),(47,'2015-02-18 13:21:58',1,5,4,5,3,1,0),(48,'2015-02-18 13:25:51',4,5,6,9,4,7,0),(49,'2015-02-18 13:27:09',3,5,3,5,4,10,0),(50,'2015-02-18 13:34:44',1,5,9,7,1,6,0),(51,'2015-02-18 13:37:53',5,0,3,4,6,5,0),(53,'2015-02-18 13:43:42',0,5,4,NULL,1,NULL,0),(54,'2015-02-20 13:17:24',0,5,5,1,7,3,0),(55,'2015-02-20 13:22:52',2,5,3,5,7,1,0),(56,'2015-02-20 13:30:30',3,5,7,5,11,3,0),(57,'2015-02-20 13:36:19',3,5,1,7,11,5,0),(58,'2015-02-20 13:41:06',5,1,11,7,5,1,0),(59,'2015-02-23 13:29:44',5,2,5,1,4,3,0),(60,'2015-02-23 13:36:43',5,4,3,1,4,5,0),(61,'2015-02-23 13:41:24',2,5,5,1,7,3,1),(62,'2015-02-23 13:46:25',5,2,7,1,5,3,0),(63,'2015-02-24 13:23:48',1,5,2,1,5,7,1),(64,'2015-02-24 13:25:19',3,5,5,2,7,4,1),(65,'2015-02-24 13:35:02',4,5,7,2,5,1,1),(66,'2015-02-24 13:37:58',5,3,4,12,3,8,1),(67,'2015-02-24 13:43:12',5,0,12,7,4,2,1),(68,'2015-02-24 13:47:30',5,2,12,1,3,2,0),(69,'2015-02-24 13:49:42',3,5,5,12,7,4,1),(70,'2015-02-25 13:40:51',1,5,3,8,7,2,0),(71,'2015-02-25 13:44:52',5,4,3,8,7,2,1),(72,'2015-02-26 13:22:26',5,4,4,2,5,1,1),(74,'2015-02-26 13:29:30',3,5,5,11,7,4,1),(75,'2015-02-26 13:36:09',4,5,11,4,7,5,0),(76,'2015-02-27 13:34:03',2,5,4,3,5,7,0),(77,'2015-02-27 13:36:35',1,5,7,4,5,3,1),(78,'2015-02-27 13:36:35',1,5,7,4,5,3,1),(79,'2015-02-27 13:39:55',1,5,5,4,7,3,1),(80,'2015-02-27 13:46:20',2,5,4,NULL,5,NULL,1),(81,'2015-02-27 13:49:22',5,3,7,NULL,3,NULL,1),(82,'2015-03-02 13:24:09',3,5,1,2,7,3,1),(83,'2015-03-02 13:28:55',1,5,2,7,3,1,1),(84,'2015-03-02 13:32:27',4,5,3,2,7,1,1),(85,'2015-03-03 13:24:07',5,0,3,1,5,4,1),(86,'2015-03-03 13:30:53',3,5,7,5,4,3,1),(87,'2015-03-03 13:37:34',4,5,7,3,4,1,1),(89,'2015-03-03 13:42:51',1,5,3,1,7,4,1),(90,'2015-03-03 13:48:29',4,5,3,1,7,4,1),(91,'2015-03-04 13:38:42',5,0,5,7,1,2,0),(92,'2015-03-04 13:41:23',3,5,5,3,7,2,0),(93,'2015-03-04 13:50:25',3,5,5,1,2,3,1),(94,'2015-03-05 13:27:22',2,5,2,3,5,6,0),(95,'2015-03-05 13:37:17',5,3,3,5,1,6,1),(96,'2015-03-05 13:40:17',5,1,3,1,2,6,0),(97,'2015-03-05 13:47:52',1,5,5,2,6,1,1),(98,'2015-03-05 13:52:16',2,5,5,1,3,2,1),(99,'2015-03-06 13:13:33',5,1,7,3,6,4,1),(100,'2015-03-06 13:15:43',5,0,5,1,2,6,1),(101,'2015-03-06 13:21:21',3,5,5,4,3,2,1),(102,'2015-03-06 13:27:20',3,5,7,6,4,1,1),(103,'2015-03-06 13:33:06',4,5,3,4,1,2,0),(104,'2015-03-06 13:37:15',5,2,4,2,5,6,1),(105,'2015-03-09 13:43:21',5,1,7,2,5,1,1),(106,'2015-03-09 13:47:32',5,0,7,3,5,1,1),(107,'2015-03-09 13:52:56',5,2,7,5,3,1,1),(108,'2015-03-09 13:58:24',5,3,7,1,5,3,1),(109,'2015-03-09 14:03:44',4,5,7,4,3,1,1),(110,'2015-03-09 14:10:25',2,5,7,4,5,1,1),(111,'2015-03-10 13:12:25',3,5,4,6,3,2,1),(112,'2015-03-10 13:21:11',1,5,5,7,1,4,0),(113,'2015-03-10 13:25:14',5,3,4,3,2,6,1),(114,'2015-03-10 13:29:08',2,5,5,1,7,6,1),(115,'2015-03-10 13:30:09',5,4,4,2,5,6,1),(116,'2015-03-10 13:42:40',4,5,7,4,3,6,0),(117,'2015-03-11 13:42:29',3,5,4,6,5,1,1),(118,'2015-03-11 13:48:45',5,3,5,1,3,4,1),(119,'2015-03-11 13:50:36',1,5,4,6,5,2,1),(120,'2015-03-11 13:58:54',5,3,3,1,7,2,1),(121,'2015-03-11 14:04:21',3,5,4,5,2,6,1),(122,'2015-03-11 14:08:23',2,5,1,6,7,3,1),(123,'2015-03-12 13:30:58',4,5,2,1,5,6,1),(124,'2015-03-12 13:32:23',5,1,3,6,2,4,1),(125,'2015-03-12 13:42:26',3,5,2,1,4,5,0),(126,'2015-03-12 13:44:11',5,4,2,6,4,3,1),(127,'2015-03-12 13:46:15',3,5,5,6,4,3,1),(128,'2015-03-12 13:58:35',5,3,4,3,5,6,0),(129,'2015-03-13 13:38:17',5,1,5,1,3,2,1),(130,'2015-03-13 13:45:55',4,5,5,1,7,2,1),(131,'2015-03-13 13:46:43',5,4,3,5,7,2,1),(132,'2015-03-13 13:51:28',1,5,4,5,7,2,1),(133,'2015-03-16 13:32:37',1,5,7,6,3,1,1),(134,'2015-03-16 13:37:05',2,5,1,6,7,3,1),(135,'2015-03-16 13:38:05',5,4,9,6,4,5,1),(136,'2015-03-16 13:46:22',4,5,1,7,3,4,1),(137,'2015-03-16 13:47:45',5,1,4,9,5,6,1),(138,'2015-03-16 13:52:21',5,4,7,4,9,6,1),(139,'2015-03-17 13:29:58',1,5,3,6,7,1,1),(140,'2015-03-17 13:33:05',1,5,7,6,9,5,1),(141,'2015-03-17 13:40:27',5,4,3,4,1,5,0),(142,'2015-03-17 13:43:26',5,4,3,6,7,9,1),(143,'2015-03-17 13:46:01',2,5,9,6,5,4,0),(144,'2015-03-17 13:53:14',2,5,7,1,3,9,0),(145,'2015-03-17 13:56:55',5,4,4,6,5,9,1),(146,'2015-03-18 13:42:40',3,5,3,6,5,7,1),(147,'2015-03-18 13:45:46',5,0,8,1,10,9,1),(148,'2015-03-18 13:47:47',3,5,8,6,5,3,1),(149,'2015-03-18 14:00:59',5,4,7,9,1,4,1),(150,'2015-03-18 14:01:46',5,3,3,10,5,4,1),(151,'2015-03-18 14:11:29',5,2,7,5,10,4,1),(152,'2015-03-19 13:27:12',1,5,1,5,9,3,1),(153,'2015-03-19 13:28:32',0,5,5,9,10,4,0),(154,'2015-03-19 13:32:42',4,5,3,1,10,4,1),(155,'2015-03-19 13:45:41',4,5,5,1,4,9,0),(156,'2015-03-19 13:55:28',2,5,10,4,3,9,1),(157,'2015-03-19 18:25:14',2,5,1,6,5,2,1),(158,'2015-03-19 18:27:04',5,0,7,6,2,5,1),(159,'2015-03-19 18:29:28',5,2,7,5,6,2,0),(160,'2015-03-20 13:55:06',3,5,10,5,9,3,0),(161,'2015-03-20 14:00:22',5,3,7,3,5,10,1),(162,'2015-03-20 14:04:24',5,3,5,10,7,2,1),(163,'2015-03-23 13:17:06',2,5,7,4,5,8,1),(164,'2015-03-23 13:20:53',4,5,3,5,7,14,0),(165,'2015-03-23 13:21:26',1,5,3,6,4,13,1),(166,'2015-03-23 13:24:03',5,4,8,6,5,7,1),(167,'2015-03-23 13:28:50',5,1,13,4,3,8,0),(169,'2015-03-23 13:40:25',5,1,7,13,5,6,1),(170,'2015-03-23 13:43:05',4,5,3,4,8,6,1),(171,'2015-03-23 13:47:30',4,5,7,4,5,6,1),(172,'2015-03-20 12:00:53',5,3,9,10,7,14,1),(173,'2015-03-20 12:05:45',3,5,7,10,14,9,1),(174,'2015-03-24 13:37:42',5,1,7,13,10,4,1),(175,'2015-03-24 13:42:20',3,5,13,6,10,4,1),(176,'2015-03-24 13:47:11',2,5,6,10,7,4,1),(177,'2015-03-24 13:52:37',3,5,6,7,13,4,0),(178,'2015-03-24 13:55:59',4,5,7,6,13,10,1),(179,'2015-03-24 14:03:05',2,5,7,6,13,4,1),(180,'2015-03-24 14:06:48',5,3,7,4,13,6,1),(181,'2015-03-24 14:10:04',1,5,7,4,13,6,1),(183,'2015-03-24 14:17:06',5,2,7,4,13,6,1),(184,'2015-03-25 13:30:37',4,5,1,6,5,4,0),(185,'2015-03-25 13:31:58',5,1,7,13,6,5,1),(186,'2015-03-25 13:36:39',5,0,7,4,5,13,1),(187,'2015-03-25 13:41:32',2,5,6,4,5,13,0),(188,'2015-03-25 13:50:38',2,5,5,1,7,4,1),(189,'2015-03-25 13:55:16',2,5,13,6,4,1,1),(190,'2015-03-25 13:56:45',5,1,13,6,5,4,1),(191,'2015-03-25 14:01:13',4,5,7,4,13,6,1),(192,'2015-03-26 13:23:08',2,5,6,4,7,5,1),(193,'2015-03-26 13:33:28',5,4,4,13,5,3,0),(194,'2015-03-26 13:41:30',5,3,3,13,7,6,1),(195,'2015-03-26 13:43:16',2,5,5,6,7,4,1),(196,'2015-03-26 13:45:30',5,2,13,4,3,6,1),(197,'2015-03-26 13:56:36',4,5,7,3,5,13,1),(198,'2015-03-26 14:04:03',5,4,13,6,5,4,1),(199,'2015-03-27 13:30:29',3,5,3,6,13,1,1),(200,'2015-03-27 13:32:50',5,1,7,4,5,14,1),(201,'2015-03-27 13:40:38',4,5,4,3,1,6,1),(202,'2015-03-27 13:44:23',5,3,6,13,5,7,0),(203,'2015-03-27 13:56:20',3,5,13,4,3,1,1),(204,'2015-03-27 14:04:38',4,5,4,6,5,1,0),(205,'2015-03-30 13:22:10',1,5,6,4,5,10,1),(206,'2015-03-30 13:27:29',3,5,8,7,5,13,0),(207,'2015-03-30 13:37:26',5,3,7,4,5,8,0),(208,'2015-03-30 13:42:22',2,5,7,6,4,13,1),(209,'2015-03-30 13:50:20',5,3,13,6,7,4,0),(210,'2015-03-30 13:54:20',3,5,13,6,7,4,1),(211,'2015-03-30 14:03:20',5,4,13,6,7,4,1),(212,'2015-03-31 13:33:23',5,4,4,6,5,7,1),(213,'2015-03-31 13:37:25',5,3,8,9,10,6,1),(214,'2015-03-31 13:41:23',5,4,7,9,5,4,1),(215,'2015-03-31 13:46:33',5,3,13,6,4,8,1),(216,'2015-04-01 13:35:18',5,0,3,5,7,6,0),(217,'2015-04-01 13:36:33',1,5,9,5,10,8,1),(218,'2015-04-01 13:41:05',1,5,7,6,9,8,1),(219,'2015-04-01 13:46:50',5,4,3,8,5,10,1),(220,'2015-04-01 14:05:57',5,1,7,13,3,4,1),(221,'2015-04-02 13:35:53',1,5,9,6,13,3,0),(222,'2015-04-02 13:37:53',5,4,7,8,4,5,1),(223,'2015-04-02 13:41:18',5,3,4,8,5,6,1),(224,'2015-04-02 13:46:20',5,4,15,13,16,14,1),(225,'2015-04-02 13:46:50',0,5,5,6,16,14,1),(226,'2015-04-02 13:55:06',1,5,3,9,4,13,1),(227,'2015-04-07 13:28:45',5,2,13,4,7,6,0),(228,'2015-04-07 13:32:56',5,1,3,10,15,9,1),(229,'2015-04-07 13:36:04',5,4,6,10,13,4,1),(230,'2015-04-07 13:41:28',5,2,7,3,15,9,1),(231,'2015-04-07 13:42:36',3,5,4,6,9,2,1),(232,'2015-04-07 13:47:44',0,5,13,7,3,15,1),(233,'2015-04-07 13:53:10',4,5,6,10,4,7,1),(234,'2015-04-07 13:56:26',5,4,13,10,15,2,1),(235,'2015-04-08 13:29:18',5,4,13,7,4,10,0),(236,'2015-04-08 13:37:38',5,3,9,6,5,15,1),(237,'2015-04-08 13:42:08',5,1,13,7,3,4,1),(238,'2015-04-08 13:44:28',5,2,10,14,4,6,0),(239,'2015-04-08 13:49:55',2,5,3,13,5,7,1),(240,'2015-04-08 13:52:29',3,5,2,6,5,4,0),(241,'2015-04-08 13:57:00',5,3,2,7,15,13,1),(242,'2015-04-09 13:40:45',4,5,7,2,10,13,1),(243,'2015-04-09 13:47:11',1,5,2,6,5,8,1),(244,'2015-04-09 13:52:20',1,5,7,13,3,9,1),(245,'2015-04-09 13:56:38',4,5,5,2,10,6,1),(246,'2015-04-09 14:00:50',3,5,3,9,16,14,1),(247,'2015-04-09 14:05:59',2,5,5,6,2,10,1),(248,'2015-04-10 13:28:00',5,1,5,10,3,4,0),(249,'2015-04-10 13:29:42',0,5,5,9,16,6,1),(251,'2015-04-10 13:36:37',5,2,3,9,10,6,0),(252,'2015-04-10 13:38:29',1,5,4,6,5,16,1),(253,'2015-04-10 13:43:40',3,5,3,16,10,5,1),(254,'2015-04-10 13:46:10',5,1,10,6,5,4,1),(255,'2015-04-10 13:48:51',5,3,14,16,4,6,1),(256,'2015-04-10 13:52:10',3,5,4,5,16,14,1),(257,'2015-04-13 13:33:09',2,5,16,13,5,15,0),(258,'2015-04-13 13:37:25',4,5,7,5,3,6,1),(259,'2015-04-13 13:41:03',3,5,4,6,9,13,1),(260,'2015-04-13 13:45:26',5,1,3,16,7,13,0),(261,'2015-04-13 13:49:15',2,5,4,5,15,6,1),(262,'2015-04-13 13:51:57',5,1,16,13,7,9,1),(263,'2015-04-13 13:57:27',5,4,3,4,5,16,1),(264,'2015-04-13 14:02:25',2,5,5,4,7,13,1),(265,'2015-04-14 13:42:56',4,5,7,4,13,3,1),(266,'2015-04-14 13:47:36',3,5,3,4,16,13,1),(267,'2015-04-14 13:52:24',3,5,7,2,16,13,1),(268,'2015-04-14 13:59:11',0,5,3,2,13,4,0),(269,'2015-04-14 14:02:44',5,2,16,14,7,4,1),(270,'2015-04-14 14:07:32',2,5,4,13,7,5,0);
/*!40000 ALTER TABLE `tf_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_player`
--

DROP TABLE IF EXISTS `tf_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_player`
--

LOCK TABLES `tf_player` WRITE;
/*!40000 ALTER TABLE `tf_player` DISABLE KEYS */;
INSERT INTO `tf_player` VALUES (1,'Simon',0),(2,'Berti',0),(3,'Brent',0),(4,'Jack',0),(5,'Bertrand',0),(6,'Steve',0),(7,'Ash',0),(8,'Rich',0),(9,'Rowan',0),(10,'Lauren',0),(11,'Nick',0),(12,'Derek',0),(13,'Sam',0),(14,'Scott',0),(15,'Clement',0),(16,'Oli',0);
/*!40000 ALTER TABLE `tf_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-14 21:43:24
