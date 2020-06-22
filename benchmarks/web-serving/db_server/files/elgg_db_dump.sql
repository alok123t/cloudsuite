-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: ELGG_DB
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `elgg_access_collection_membership`
--

DROP TABLE IF EXISTS `elgg_access_collection_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_access_collection_membership` (
  `user_guid` int(20) unsigned NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`user_guid`,`access_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_access_collection_membership`
--

LOCK TABLES `elgg_access_collection_membership` WRITE;
/*!40000 ALTER TABLE `elgg_access_collection_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_access_collection_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_access_collections`
--

DROP TABLE IF EXISTS `elgg_access_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_access_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `owner_guid` int(20) unsigned NOT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_guid` (`owner_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_access_collections`
--

LOCK TABLES `elgg_access_collections` WRITE;
/*!40000 ALTER TABLE `elgg_access_collections` DISABLE KEYS */;
INSERT INTO `elgg_access_collections` VALUES (3,'friends',49,'friends');
/*!40000 ALTER TABLE `elgg_access_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_annotations`
--

DROP TABLE IF EXISTS `elgg_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `value` longtext NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` int(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name` (`name`(50)),
  KEY `value` (`value`(50)),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_annotations`
--

LOCK TABLES `elgg_annotations` WRITE;
/*!40000 ALTER TABLE `elgg_annotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_api_users`
--

DROP TABLE IF EXISTS `elgg_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) NOT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_api_users`
--

LOCK TABLES `elgg_api_users` WRITE;
/*!40000 ALTER TABLE `elgg_api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_config`
--

DROP TABLE IF EXISTS `elgg_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_config` (
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_config`
--

LOCK TABLES `elgg_config` WRITE;
/*!40000 ALTER TABLE `elgg_config` DISABLE KEYS */;
INSERT INTO `elgg_config` VALUES ('admin_registered','i:1;'),('allow_registration','b:0;'),('allow_user_default_access','s:0:\"\";'),('default_access','s:1:\"2\";'),('default_limit','i:10;'),('installed','i:1592622931;'),('language','s:2:\"en\";'),('lastcache','i:1592622932;'),('processed_upgrades','a:0:{}'),('require_admin_validation','b:0;'),('security_email_require_confirmation','b:1;'),('security_email_require_password','b:1;'),('security_notify_admins','b:1;'),('security_notify_user_password','b:1;'),('security_protect_upgrade','b:1;'),('simplecache_enabled','i:1;'),('simplecache_lastupdate','i:1592622932;'),('simplecache_minify_css','b:1;'),('simplecache_minify_js','b:1;'),('system_cache_enabled','i:1;'),('version','i:2017041200;'),('walled_garden','b:0;'),('__site_secret__','s:32:\"zX5S1Z1BMx648klFHIscPE_4pKREcExb\";');
/*!40000 ALTER TABLE `elgg_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_entities`
--

DROP TABLE IF EXISTS `elgg_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_entities` (
  `guid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` varchar(252) CHARACTER SET utf8 NOT NULL,
  `owner_guid` int(20) unsigned NOT NULL,
  `container_guid` int(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `last_action` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`guid`),
  KEY `type` (`type`),
  KEY `owner_guid` (`owner_guid`),
  KEY `container_guid` (`container_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `time_updated` (`time_updated`),
  KEY `subtype` (`subtype`),
  KEY `type_subtype` (`type`,`subtype`(50)),
  KEY `type_subtype_owner` (`type`,`subtype`(50),`owner_guid`),
  KEY `type_subtype_container` (`type`,`subtype`(50),`container_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_entities`
--

LOCK TABLES `elgg_entities` WRITE;
/*!40000 ALTER TABLE `elgg_entities` DISABLE KEYS */;
INSERT INTO `elgg_entities` VALUES (1,'site','site',0,0,2,1592622931,1592622931,1592622931,'yes'),(2,'object','plugin',1,1,2,1592622931,1592622931,1592622931,'yes'),(3,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(4,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(5,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(6,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(7,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(8,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(9,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(10,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(11,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(12,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(13,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(14,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(15,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(16,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(17,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(18,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(19,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(20,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(21,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(22,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(23,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(24,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(25,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(26,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(27,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(28,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(29,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(30,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(31,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(32,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(33,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(34,'object','plugin',1,1,2,1592622932,1592622932,1592622932,'yes'),(35,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(36,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(37,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(38,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(39,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(40,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(41,'object','elgg_upgrade',1,1,0,1592622932,1592622932,1592622932,'yes'),(42,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(43,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(44,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(45,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(46,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(47,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(48,'object','elgg_upgrade',1,1,0,1592622933,1592622933,1592622933,'yes'),(49,'user','user',0,0,2,1592622977,1592622977,1592624589,'yes'),(50,'object','widget',49,49,2,1592622977,1592622977,1592622977,'yes'),(51,'object','widget',49,49,2,1592622977,1592622977,1592622977,'yes'),(52,'object','widget',49,49,2,1592622977,1592622977,1592622977,'yes'),(53,'object','widget',49,49,2,1592622977,1592622977,1592622977,'yes'),(54,'object','widget',49,49,2,1592622977,1592622977,1592622977,'yes'),(55,'object','admin_notice',0,0,0,1592622977,1592622977,1592622977,'yes');
/*!40000 ALTER TABLE `elgg_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_entity_relationships`
--

DROP TABLE IF EXISTS `elgg_entity_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_entity_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid_one` int(20) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` int(20) unsigned NOT NULL,
  `time_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_one` (`guid_one`,`relationship`,`guid_two`),
  KEY `relationship` (`relationship`),
  KEY `guid_two` (`guid_two`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_entity_relationships`
--

LOCK TABLES `elgg_entity_relationships` WRITE;
/*!40000 ALTER TABLE `elgg_entity_relationships` DISABLE KEYS */;
INSERT INTO `elgg_entity_relationships` VALUES (1,2,'active_plugin',1,1592622932),(2,3,'active_plugin',1,1592622932),(3,4,'active_plugin',1,1592622932),(4,5,'active_plugin',1,1592622932),(5,10,'active_plugin',1,1592622932),(6,11,'active_plugin',1,1592622932),(7,13,'active_plugin',1,1592622932),(8,14,'active_plugin',1,1592622932),(9,15,'active_plugin',1,1592622932),(10,16,'active_plugin',1,1592622932),(11,17,'active_plugin',1,1592622932),(12,18,'active_plugin',1,1592622932),(13,19,'active_plugin',1,1592622932),(14,21,'active_plugin',1,1592622932),(15,22,'active_plugin',1,1592622932),(16,23,'active_plugin',1,1592622932),(17,24,'active_plugin',1,1592622932),(18,25,'active_plugin',1,1592622932),(19,26,'active_plugin',1,1592622932),(20,27,'active_plugin',1,1592622932),(21,28,'active_plugin',1,1592622932),(22,30,'active_plugin',1,1592622932),(23,32,'active_plugin',1,1592622932),(24,33,'active_plugin',1,1592622932);
/*!40000 ALTER TABLE `elgg_entity_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_hmac_cache`
--

DROP TABLE IF EXISTS `elgg_hmac_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_hmac_cache` (
  `hmac` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ts` int(11) NOT NULL,
  PRIMARY KEY (`hmac`),
  KEY `ts` (`ts`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_hmac_cache`
--

LOCK TABLES `elgg_hmac_cache` WRITE;
/*!40000 ALTER TABLE `elgg_hmac_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_hmac_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_metadata`
--

DROP TABLE IF EXISTS `elgg_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `value` longtext NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` int(11) DEFAULT NULL,
  `access_id` int(11) DEFAULT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name` (`name`(50)),
  KEY `value` (`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_metadata`
--

LOCK TABLES `elgg_metadata` WRITE;
/*!40000 ALTER TABLE `elgg_metadata` DISABLE KEYS */;
INSERT INTO `elgg_metadata` VALUES (1,1,'name','My New Community','text',NULL,NULL,1592622931,'yes'),(2,1,'email','','text',NULL,NULL,1592622931,'yes'),(3,2,'title','activity','text',NULL,NULL,1592622932,'yes'),(4,3,'title','blog','text',NULL,NULL,1592622932,'yes'),(5,4,'title','bookmarks','text',NULL,NULL,1592622932,'yes'),(6,5,'title','ckeditor','text',NULL,NULL,1592622932,'yes'),(7,6,'title','custom_index','text',NULL,NULL,1592622932,'yes'),(8,7,'title','dashboard','text',NULL,NULL,1592622932,'yes'),(9,8,'title','developers','text',NULL,NULL,1592622932,'yes'),(10,9,'title','diagnostics','text',NULL,NULL,1592622932,'yes'),(11,10,'title','discussions','text',NULL,NULL,1592622932,'yes'),(12,11,'title','embed','text',NULL,NULL,1592622932,'yes'),(13,12,'title','externalpages','text',NULL,NULL,1592622932,'yes'),(14,13,'title','file','text',NULL,NULL,1592622932,'yes'),(15,14,'title','friends','text',NULL,NULL,1592622932,'yes'),(16,15,'title','friends_collections','text',NULL,NULL,1592622932,'yes'),(17,16,'title','garbagecollector','text',NULL,NULL,1592622932,'yes'),(18,17,'title','groups','text',NULL,NULL,1592622932,'yes'),(19,18,'title','invitefriends','text',NULL,NULL,1592622932,'yes'),(20,19,'title','likes','text',NULL,NULL,1592622932,'yes'),(21,20,'title','login_as','text',NULL,NULL,1592622932,'yes'),(22,21,'title','members','text',NULL,NULL,1592622932,'yes'),(23,22,'title','messageboard','text',NULL,NULL,1592622932,'yes'),(24,23,'title','messages','text',NULL,NULL,1592622932,'yes'),(25,24,'title','notifications','text',NULL,NULL,1592622932,'yes'),(26,25,'title','pages','text',NULL,NULL,1592622932,'yes'),(27,26,'title','profile','text',NULL,NULL,1592622932,'yes'),(28,27,'title','reportedcontent','text',NULL,NULL,1592622932,'yes'),(29,28,'title','search','text',NULL,NULL,1592622932,'yes'),(30,29,'title','site_notifications','text',NULL,NULL,1592622932,'yes'),(31,30,'title','system_log','text',NULL,NULL,1592622932,'yes'),(32,31,'title','tagcloud','text',NULL,NULL,1592622932,'yes'),(33,32,'title','thewire','text',NULL,NULL,1592622932,'yes'),(34,33,'title','uservalidationbyemail','text',NULL,NULL,1592622932,'yes'),(35,34,'title','web_services','text',NULL,NULL,1592622932,'yes'),(36,49,'banned','no','text',NULL,NULL,1592622977,'yes'),(37,49,'admin','yes','text',NULL,NULL,1592622977,'yes'),(38,49,'language','en','text',NULL,NULL,1592622977,'yes'),(39,49,'prev_last_action','1592624576','integer',NULL,NULL,1592622977,'yes'),(40,49,'last_login','1592622977','integer',NULL,NULL,1592622977,'yes'),(41,49,'prev_last_login','0','integer',NULL,NULL,1592622977,'yes'),(42,49,'username','root','text',NULL,NULL,1592622977,'yes'),(43,49,'email','alok123thatikunta@gmail.com','text',NULL,NULL,1592622977,'yes'),(44,49,'name','elgg','text',NULL,NULL,1592622977,'yes'),(45,49,'password_hash','$2y$10$9C5gmtsSCB7xBaYJvJSvOeqXe8wNfI79a/UryqkpBBFrHCbHRrsFC','text',NULL,NULL,1592622977,'yes'),(46,49,'notification:method:email','1','integer',NULL,NULL,1592622977,'yes'),(47,49,'validated','1','integer',NULL,NULL,1592622977,'yes'),(48,49,'validated_method','admin_user','text',NULL,NULL,1592622977,'yes'),(49,55,'admin_notice_id','fresh_install','text',NULL,NULL,1592622977,'yes'),(50,55,'description','Welcome to your Elgg site! For more options, see the <a href=\"http://34.72.232.130:8080/admin/site_settings\">settings pages</a>.','text',NULL,NULL,1592622977,'yes');
/*!40000 ALTER TABLE `elgg_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_migrations`
--

DROP TABLE IF EXISTS `elgg_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_migrations` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_migrations`
--

LOCK TABLES `elgg_migrations` WRITE;
/*!40000 ALTER TABLE `elgg_migrations` DISABLE KEYS */;
INSERT INTO `elgg_migrations` VALUES (20170728010000,'RemoveSiteGuid','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728020000,'MigrateDatalistsToConfig','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728030000,'DenormalizeMetastrings','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728040000,'ChangeTableEngine','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728050000,'ExpandTextColumnsToLongtext','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728060000,'RemoveLegacyPasswordHashes','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728072548,'CreateAccessCollectionsTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728073540,'CreateAccessCollectionMembershipTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728073706,'CreateAnnotationsTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074504,'CreateApiUsersTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074600,'CreateEntitiesTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074645,'CreateEntityRelationshipsTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074729,'CreateEntitySubtypesTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074757,'CreateGeoCacheTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074828,'CreateGroupsEntityTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074857,'CreateHmacCacheTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074925,'CreateMetadataTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728074959,'CreateObjectsEntityTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075027,'CreatePrivateSettingsTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075056,'CreateQueueTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075129,'CreateRiverTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075155,'CreateSitesEntityTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075232,'CreateSystemLogTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075306,'CreateUsersApiSessionsTable','2020-06-20 03:15:14','2020-06-20 03:15:14',0),(20170728075337,'CreateUsersEntityTable','2020-06-20 03:15:14','2020-06-20 03:15:15',0),(20170728075418,'CreateUsersRememberMeCookiesTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20170728075454,'CreateUsersSessionsTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20170728075716,'CreateConfigTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20170808084728,'DropGeocodeCache','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171006111953,'DropSitesEntityTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171006131622,'DropGroupsEntityTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171009115032,'DropObjectsEntityTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171010095648,'DropUsersEntityTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171016113827,'UpdateMetadataColumns','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171021111005,'AddSubtypeIndexToRiverTable','2020-06-20 03:15:15','2020-06-20 03:15:15',0),(20171021111059,'DenormalizeEntitySubtypes','2020-06-20 03:15:15','2020-06-20 03:15:16',0),(20171021111132,'AlignSubtypeColumns','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20171106100916,'AddAclSubtype','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20180109135052,'DropTypeSubtypeFromRiverTable','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20180609152817,'CreateSiteSecret','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20181107091651,'AddEntitiesSubtypeIndex','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20190125082345,'EntitiesAddTypeSubtypeIndex','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20190606111641,'EntitiesAddTypeSubtypeContainerAndOwnerIndexes','2020-06-20 03:15:16','2020-06-20 03:15:16',0),(20191015125417,'SetRiverEnabledToYes','2020-06-20 03:15:16','2020-06-20 03:15:16',0);
/*!40000 ALTER TABLE `elgg_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_private_settings`
--

DROP TABLE IF EXISTS `elgg_private_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_private_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_guid` (`entity_guid`,`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_private_settings`
--

LOCK TABLES `elgg_private_settings` WRITE;
/*!40000 ALTER TABLE `elgg_private_settings` DISABLE KEYS */;
INSERT INTO `elgg_private_settings` VALUES (1,2,'elgg:internal:priority','2'),(2,3,'elgg:internal:priority','3'),(3,4,'elgg:internal:priority','4'),(4,5,'elgg:internal:priority','5'),(5,6,'elgg:internal:priority','6'),(6,7,'elgg:internal:priority','7'),(7,8,'elgg:internal:priority','8'),(8,9,'elgg:internal:priority','9'),(9,10,'elgg:internal:priority','10'),(10,11,'elgg:internal:priority','11'),(11,12,'elgg:internal:priority','12'),(12,13,'elgg:internal:priority','13'),(13,14,'elgg:internal:priority','14'),(14,15,'elgg:internal:priority','15'),(15,16,'elgg:internal:priority','16'),(16,17,'elgg:internal:priority','17'),(17,18,'elgg:internal:priority','18'),(18,19,'elgg:internal:priority','19'),(19,20,'elgg:internal:priority','20'),(20,21,'elgg:internal:priority','21'),(21,22,'elgg:internal:priority','22'),(22,23,'elgg:internal:priority','23'),(23,24,'elgg:internal:priority','24'),(24,25,'elgg:internal:priority','25'),(25,26,'elgg:internal:priority','26'),(26,27,'elgg:internal:priority','27'),(27,28,'elgg:internal:priority','28'),(28,29,'elgg:internal:priority','29'),(29,30,'elgg:internal:priority','30'),(30,31,'elgg:internal:priority','31'),(31,32,'elgg:internal:priority','32'),(32,33,'elgg:internal:priority','33'),(33,34,'elgg:internal:priority','34'),(34,35,'id','core:2018041801'),(35,35,'class','Elgg\\Upgrades\\DeleteOldPlugins'),(36,35,'title','core:upgrade:2018041801:title'),(37,35,'description','core:upgrade:2018041801:description'),(38,35,'offset','0'),(39,35,'is_completed','1'),(40,36,'id','core:2018041800'),(41,36,'class','Elgg\\Upgrades\\ActivateNewPlugins'),(42,36,'title','core:upgrade:2018041800:title'),(43,36,'description','core:upgrade:2018041800:description'),(44,36,'offset','0'),(45,36,'is_completed','1'),(46,37,'id','core:2017080900'),(47,37,'class','Elgg\\Upgrades\\AlterDatabaseToMultiByteCharset'),(48,37,'title','core:upgrade:2017080900:title'),(49,37,'description','core:upgrade:2017080900:description'),(50,37,'offset','0'),(51,37,'is_completed','1'),(52,38,'id','core:2017080950'),(53,38,'class','Elgg\\Upgrades\\SetSecurityConfigDefaults'),(54,38,'title','core:upgrade:2017080950:title'),(55,38,'description','core:upgrade:2017080950:description'),(56,38,'offset','0'),(57,38,'is_completed','1'),(58,39,'id','core:2017121200'),(59,39,'class','Elgg\\Upgrades\\MigrateFriendsACL'),(60,39,'title','core:upgrade:2017121200:title'),(61,39,'description','core:upgrade:2017121200:description'),(62,39,'offset','0'),(63,39,'is_completed','1'),(64,40,'id','core:2018061401'),(65,40,'class','Elgg\\Upgrades\\MigrateCronLog'),(66,40,'title','core:upgrade:2018061401:title'),(67,40,'description','core:upgrade:2018061401:description'),(68,40,'offset','0'),(69,40,'is_completed','1'),(70,41,'id','core:2019071901'),(71,41,'class','Elgg\\Upgrades\\SecurityEmailChangeConfirmation'),(72,41,'title','core:upgrade:2019071901:title'),(73,41,'description','core:upgrade:2019071901:description'),(74,41,'offset','0'),(75,41,'is_completed','1'),(76,42,'id','discussions:2017112800'),(77,42,'class','\\Elgg\\Discussions\\Upgrades\\MigrateDiscussionReply'),(78,42,'title','discussions:upgrade:2017112800:title'),(79,42,'description','discussions:upgrade:2017112800:description'),(80,42,'offset','0'),(81,42,'is_completed','1'),(82,43,'id','discussions:2017112801'),(83,43,'class','\\Elgg\\Discussions\\Upgrades\\MigrateDiscussionReplyRiver'),(84,43,'title','discussions:upgrade:2017112801:title'),(85,43,'description','discussions:upgrade:2017112801:description'),(86,43,'offset','0'),(87,43,'is_completed','1'),(88,44,'id','groups:2016101900'),(89,44,'class','Elgg\\Groups\\Upgrades\\GroupIconTransfer'),(90,44,'title','groups:upgrade:2016101900:title'),(91,44,'description','groups:upgrade:2016101900:description'),(92,44,'offset','0'),(93,44,'is_completed','1'),(94,45,'id','likes:2017120700'),(95,45,'class','\\Elgg\\Likes\\Upgrades\\PublicLikesAnnotations'),(96,45,'title','likes:upgrade:2017120700:title'),(97,45,'description','likes:upgrade:2017120700:description'),(98,45,'offset','0'),(99,45,'is_completed','1'),(100,46,'id','pages:2017110700'),(101,46,'class','\\Elgg\\Pages\\Upgrades\\MigratePageTop'),(102,46,'title','pages:upgrade:2017110700:title'),(103,46,'description','pages:upgrade:2017110700:description'),(104,46,'offset','0'),(105,46,'is_completed','1'),(106,47,'id','profile:2017040700'),(107,47,'class','ElggPlugin\\Profile\\AnnotationMigration'),(108,47,'title','profile:upgrade:2017040700:title'),(109,47,'description','profile:upgrade:2017040700:description'),(110,47,'offset','0'),(111,47,'is_completed','1'),(112,48,'id','uservalidationbyemail:2019090600'),(113,48,'class','Elgg\\UserValidationByEmail\\Upgrades\\TrackValidationStatus'),(114,48,'title','uservalidationbyemail:upgrade:2019090600:title'),(115,48,'description','uservalidationbyemail:upgrade:2019090600:description'),(116,48,'offset','0'),(117,48,'is_completed','1'),(118,35,'start_time','1592622933'),(119,35,'completed_time','1592622933'),(120,36,'start_time','1592622933'),(121,36,'completed_time','1592622933'),(122,37,'start_time','1592622933'),(123,37,'completed_time','1592622933'),(124,38,'start_time','1592622933'),(125,38,'completed_time','1592622933'),(126,39,'start_time','1592622933'),(127,39,'completed_time','1592622933'),(128,40,'start_time','1592622933'),(129,40,'completed_time','1592622933'),(130,41,'start_time','1592622933'),(131,41,'completed_time','1592622933'),(132,42,'start_time','1592622933'),(133,42,'completed_time','1592622933'),(134,43,'start_time','1592622933'),(135,43,'completed_time','1592622933'),(136,44,'start_time','1592622933'),(137,44,'completed_time','1592622933'),(138,45,'start_time','1592622933'),(139,45,'completed_time','1592622933'),(140,46,'start_time','1592622933'),(141,46,'completed_time','1592622933'),(142,47,'start_time','1592622933'),(143,47,'completed_time','1592622933'),(144,48,'start_time','1592622933'),(145,48,'completed_time','1592622933'),(146,50,'handler','control_panel'),(147,50,'context','admin'),(148,50,'column','1'),(149,50,'order','0'),(150,51,'handler','admin_welcome'),(151,51,'context','admin'),(152,51,'order','10'),(153,51,'column','1'),(154,52,'handler','online_users'),(155,52,'context','admin'),(156,52,'column','2'),(157,52,'order','0'),(158,53,'handler','new_users'),(159,53,'context','admin'),(160,53,'order','10'),(161,53,'column','2'),(162,54,'handler','content_stats'),(163,54,'context','admin'),(164,54,'order','20'),(165,54,'column','2');
/*!40000 ALTER TABLE `elgg_private_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_queue`
--

DROP TABLE IF EXISTS `elgg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `data` mediumblob NOT NULL,
  `timestamp` int(11) NOT NULL,
  `worker` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `retrieve` (`timestamp`,`worker`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_queue`
--

LOCK TABLES `elgg_queue` WRITE;
/*!40000 ALTER TABLE `elgg_queue` DISABLE KEYS */;
INSERT INTO `elgg_queue` VALUES (1,'notifications',_binary 'C:48:\"Elgg\\Notifications\\SubscriptionNotificationEvent\":134:{O:8:\"stdClass\":4:{s:6:\"action\";s:10:\"make_admin\";s:9:\"object_id\";i:49;s:11:\"object_type\";s:4:\"user\";s:14:\"object_subtype\";s:4:\"user\";}}',1592622977,NULL);
/*!40000 ALTER TABLE `elgg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_river`
--

DROP TABLE IF EXISTS `elgg_river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_river` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` varchar(32) NOT NULL,
  `view` text NOT NULL,
  `subject_guid` int(20) unsigned NOT NULL,
  `object_guid` int(20) unsigned NOT NULL,
  `target_guid` int(20) unsigned NOT NULL,
  `annotation_id` int(11) NOT NULL,
  `posted` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `action_type` (`action_type`),
  KEY `subject_guid` (`subject_guid`),
  KEY `object_guid` (`object_guid`),
  KEY `target_guid` (`target_guid`),
  KEY `annotation_id` (`annotation_id`),
  KEY `posted` (`posted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_river`
--

LOCK TABLES `elgg_river` WRITE;
/*!40000 ALTER TABLE `elgg_river` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_system_log`
--

DROP TABLE IF EXISTS `elgg_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_class` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_subtype` varchar(252) CHARACTER SET utf8 NOT NULL,
  `event` varchar(50) NOT NULL,
  `performed_by_guid` int(20) unsigned NOT NULL,
  `owner_guid` int(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `time_created` int(11) NOT NULL,
  `ip_address` varchar(46) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_class` (`object_class`),
  KEY `object_type` (`object_type`),
  KEY `object_subtype` (`object_subtype`),
  KEY `event` (`event`),
  KEY `performed_by_guid` (`performed_by_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `river_key` (`object_type`,`object_subtype`,`event`(25))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_system_log`
--

LOCK TABLES `elgg_system_log` WRITE;
/*!40000 ALTER TABLE `elgg_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_apisessions`
--

DROP TABLE IF EXISTS `elgg_users_apisessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_apisessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` int(20) unsigned NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_guid` (`user_guid`),
  KEY `token` (`token`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_apisessions`
--

LOCK TABLES `elgg_users_apisessions` WRITE;
/*!40000 ALTER TABLE `elgg_users_apisessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_users_apisessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_remember_me_cookies`
--

DROP TABLE IF EXISTS `elgg_users_remember_me_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_remember_me_cookies` (
  `code` varchar(32) NOT NULL,
  `guid` int(20) unsigned NOT NULL,
  `timestamp` int(11) unsigned NOT NULL,
  PRIMARY KEY (`code`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_remember_me_cookies`
--

LOCK TABLES `elgg_users_remember_me_cookies` WRITE;
/*!40000 ALTER TABLE `elgg_users_remember_me_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `elgg_users_remember_me_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elgg_users_sessions`
--

DROP TABLE IF EXISTS `elgg_users_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elgg_users_sessions` (
  `session` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ts` int(11) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob,
  PRIMARY KEY (`session`),
  KEY `ts` (`ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elgg_users_sessions`
--

LOCK TABLES `elgg_users_sessions` WRITE;
/*!40000 ALTER TABLE `elgg_users_sessions` DISABLE KEYS */;
INSERT INTO `elgg_users_sessions` VALUES ('1e2ikr81vh8rvl5kk5udegvld9',1592622977,_binary '_sf2_attributes|a:2:{s:14:\"__elgg_session\";s:22:\"klT5rArslxxMixI0w9s1tU\";s:4:\"guid\";i:49;}_symfony_flashes|a:0:{}_sf2_meta|a:3:{s:1:\"u\";i:1592622977;s:1:\"c\";i:1592622977;s:1:\"l\";s:1:\"0\";}'),('2ovgpflufs0r5neds8hajmnvah',1592629709,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"eFZOdJ1WgxCUGJ9rVctZ75\";}_sf2_meta|a:3:{s:1:\"u\";i:1592629709;s:1:\"c\";i:1592629709;s:1:\"l\";s:1:\"0\";}'),('45qe5ubdi95udlm3v0nbn0c8jj',1592644393,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"MUcxu_lnLxoPDwMI1r8AiJ\";}_sf2_meta|a:3:{s:1:\"u\";i:1592644393;s:1:\"c\";i:1592644393;s:1:\"l\";s:1:\"0\";}'),('4uhuq2tvm5phf2slifdutni51f',1592623356,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"FtKvfM5hbK9jPw_OuohNvL\";}_sf2_meta|a:3:{s:1:\"u\";i:1592623356;s:1:\"c\";i:1592623356;s:1:\"l\";s:1:\"0\";}'),('5cfn7ec4frddg6d27ivbdudvth',1592638069,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"wSCrcOVxsy9syPHCQEEXU7\";}_sf2_meta|a:3:{s:1:\"u\";i:1592638069;s:1:\"c\";i:1592638069;s:1:\"l\";s:1:\"0\";}'),('5lo0sp21660fbq4s1filp5b82g',1592625198,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"F0f3Kmc5q8nKsud2KxkoQL\";}_sf2_meta|a:3:{s:1:\"u\";i:1592625198;s:1:\"c\";i:1592625198;s:1:\"l\";s:1:\"0\";}'),('5r3hql8kagkbi5pj1372hbaefv',1592651914,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"Ar16uraYdqNFNO1j0BZQ7j\";}_sf2_meta|a:3:{s:1:\"u\";i:1592651914;s:1:\"c\";i:1592651914;s:1:\"l\";s:1:\"0\";}'),('6ua247n33l6ovdrrf7b9v7sq2g',1592627778,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"dLHM_M3CPjnMg36Dh3dcd_\";}_sf2_meta|a:3:{s:1:\"u\";i:1592627778;s:1:\"c\";i:1592627778;s:1:\"l\";s:1:\"0\";}'),('7d66lhsrlj4iaqebg9dnuvaoa1',1592623358,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"i3EFMN6GmWcw5M38H0bNe_\";}_sf2_meta|a:3:{s:1:\"u\";i:1592623358;s:1:\"c\";i:1592623358;s:1:\"l\";s:1:\"0\";}'),('908l5vg3suv7oit0m2cis0s7p6',1592623196,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"uYGFeQ8mfFAwgAMCWDi0ff\";}_sf2_meta|a:3:{s:1:\"u\";i:1592623196;s:1:\"c\";i:1592623196;s:1:\"l\";s:1:\"0\";}'),('9lg2j8rgb2buijlplqk9r69med',1592638069,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"uej17llSTSOTGiYC5JERAS\";}_sf2_meta|a:3:{s:1:\"u\";i:1592638069;s:1:\"c\";i:1592638069;s:1:\"l\";s:1:\"0\";}'),('9n1q2dlq2vcohpivjkue79nnsi',1592629718,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"Ck4WIJoM65-WjIbllE1ehH\";}_sf2_meta|a:3:{s:1:\"u\";i:1592629717;s:1:\"c\";i:1592629717;s:1:\"l\";s:1:\"0\";}'),('gt9boikqc4suqr7lhv7ubqip7b',1592640402,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"OL1Md022rC5TFxE-gGLziW\";}_sf2_meta|a:3:{s:1:\"u\";i:1592640402;s:1:\"c\";i:1592640402;s:1:\"l\";s:1:\"0\";}'),('kbmfnelpkpi65j504mcqb1ep38',1592627107,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"093QEVc8wkIKJTbWhQHaux\";}_sf2_meta|a:3:{s:1:\"u\";i:1592627107;s:1:\"c\";i:1592627107;s:1:\"l\";s:1:\"0\";}'),('mjnbti5er3qsq1mb810e4150ma',1592631166,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"1ghbihDQ60nzvz-LKlaS5m\";}_sf2_meta|a:3:{s:1:\"u\";i:1592631166;s:1:\"c\";i:1592631166;s:1:\"l\";s:1:\"0\";}'),('n11a200fv28d5dm1sc3gnnqf1b',1592629713,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"NyKOZitrjzuAzcfTDsB1g0\";}_sf2_meta|a:3:{s:1:\"u\";i:1592629713;s:1:\"c\";i:1592629713;s:1:\"l\";s:1:\"0\";}'),('ptdb7effr0g7v5i76222nsb9rm',1592624589,_binary '_sf2_attributes|a:3:{s:14:\"__elgg_session\";s:22:\"klT5rArslxxMixI0w9s1tU\";s:4:\"guid\";i:49;s:10:\"_elgg_msgs\";a:0:{}}_sf2_meta|a:3:{s:1:\"u\";i:1592624589;s:1:\"c\";i:1592622977;s:1:\"l\";s:1:\"0\";}'),('qp52dldmri5lohev88kkurh9q2',1592625450,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"J-_OQwNAGbwsdgAxLh0B2J\";}_sf2_meta|a:3:{s:1:\"u\";i:1592625450;s:1:\"c\";i:1592625450;s:1:\"l\";s:1:\"0\";}'),('qtcq9m8d32vvii3c2q72ormv7t',1592640089,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"B-hsRNnqWzw6qFXRzvukd2\";}_sf2_meta|a:3:{s:1:\"u\";i:1592640089;s:1:\"c\";i:1592640089;s:1:\"l\";s:1:\"0\";}'),('r1mlu8bvbq6n7jl7a1gribcd73',1592649474,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"ZIqIzjloJwkFseBwJxCjBo\";}_sf2_meta|a:3:{s:1:\"u\";i:1592649474;s:1:\"c\";i:1592649474;s:1:\"l\";s:1:\"0\";}'),('t1p7grptiotgh7op29uhk019h1',1592652131,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"aR2LV0_LAV4mgmhDdxrPVn\";}_sf2_meta|a:3:{s:1:\"u\";i:1592652131;s:1:\"c\";i:1592652131;s:1:\"l\";s:1:\"0\";}'),('u7niia7orboulqjs7prcreim41',1592651110,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"js-9ZOnk82BHjAR4zMaHd-\";}_sf2_meta|a:3:{s:1:\"u\";i:1592651110;s:1:\"c\";i:1592651110;s:1:\"l\";s:1:\"0\";}'),('unvvjpdknb3dhmh5f23h3fpsji',1592629711,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"EWF2l7Fd7zSfYBnI6YGCdL\";}_sf2_meta|a:3:{s:1:\"u\";i:1592629711;s:1:\"c\";i:1592629711;s:1:\"l\";s:1:\"0\";}'),('v77ahi1g7l1uknsp737kcbsjfr',1592636551,_binary '_sf2_attributes|a:1:{s:14:\"__elgg_session\";s:22:\"Lx99kjSwuCiZKHgGC7sEoD\";}_sf2_meta|a:3:{s:1:\"u\";i:1592636551;s:1:\"c\";i:1592636551;s:1:\"l\";s:1:\"0\";}');
/*!40000 ALTER TABLE `elgg_users_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 14:51:41
