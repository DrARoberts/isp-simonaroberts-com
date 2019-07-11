-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: isp-simonaroberts-com
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `lists__claimableservices`
--

DROP TABLE IF EXISTS `lists__claimableservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__claimableservices` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('bucky','claimed') NOT NULL DEFAULT 'bucky',
  `key-host` varchar(128) NOT NULL DEFAULT '',
  `key-isp` varchar(128) NOT NULL DEFAULT '',
  `key-carrier` varchar(128) NOT NULL DEFAULT '',
  `key-registrar` varchar(128) NOT NULL DEFAULT '',
  `claimed-id` bigint(32) unsigned DEFAULT '0',
  `hostnames` tinytext,
  `name` varchar(128) NOT NULL DEFAULT '',
  `nameurl` varchar(250) NOT NULL DEFAULT '',
  `nameemail` varchar(196) NOT NULL DEFAULT '',
  `nametwitterurl` varchar(250) NOT NULL DEFAULT '',
  `companyemails` tinytext,
  `companyname` varchar(128) NOT NULL DEFAULT '',
  `companyurl` varchar(250) NOT NULL DEFAULT '',
  `companyrbn` varchar(64) NOT NULL DEFAULT '',
  `companyrbntype` varchar(13) NOT NULL DEFAULT '',
  `companytype` varchar(64) NOT NULL DEFAULT '',
  `companytwitterurls` tinytext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emailed` int(12) unsigned NOT NULL DEFAULT '0',
  `tweeted` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  `finished` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8 COMMENT='Table for Storage and Reporting on NTP Services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__emailprefixes`
--

DROP TABLE IF EXISTS `lists__emailprefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__emailprefixes` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(40) NOT NULL DEFAULT '',
  `occrences` int(12) unsigned NOT NULL DEFAULT '0',
  `weight` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__lists`
--

DROP TABLE IF EXISTS `lists__lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__lists` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `modal` enum('host','isp','carrier','registrar','') DEFAULT '',
  `primary` enum('Yes','No') DEFAULT 'No',
  `ssl` enum('Yes','No') DEFAULT 'No',
  `hostname` varchar(128) NOT NULL DEFAULT 'simonaroberts.com',
  `title` varchar(128) NOT NULL DEFAULT '',
  `auth-uri` varchar(128) NOT NULL DEFAULT '/v1/%s/%s/auth.api',
  `callback-uri` varchar(128) NOT NULL DEFAULT '/v1/%s/%s/%s/callback.api',
  `tweets-average-hour` double(22,12) unsigned NOT NULL DEFAULT '0.000000000000',
  `tweets-hour` int(11) unsigned NOT NULL DEFAULT '0',
  `tweets-total` int(11) unsigned NOT NULL DEFAULT '0',
  `pulled` int(11) unsigned NOT NULL DEFAULT '0',
  `pushed` int(11) unsigned NOT NULL DEFAULT '0',
  `tweeted` int(11) unsigned NOT NULL DEFAULT '0',
  `created` int(11) unsigned NOT NULL DEFAULT '0',
  `twitter-user` varchar(64) NOT NULL DEFAULT 'SimonXaies',
  `consumer-api-key` varchar(64) NOT NULL DEFAULT '',
  `consumer-api-secret-key` varchar(64) NOT NULL DEFAULT '',
  `access-token-key` varchar(64) NOT NULL DEFAULT '',
  `access-token-secret-key` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`primary`,`modal`,`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__names_prefixes`
--

DROP TABLE IF EXISTS `lists__names_prefixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__names_prefixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`id`,`short`,`long`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__names_suffixes`
--

DROP TABLE IF EXISTS `lists__names_suffixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__names_suffixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`id`,`short`,`long`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__names_superfixes`
--

DROP TABLE IF EXISTS `lists__names_superfixes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__names_superfixes` (
  `id` varchar(32) NOT NULL,
  `short` varchar(10) NOT NULL,
  `long` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`id`,`short`,`long`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__services`
--

DROP TABLE IF EXISTS `lists__services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__services` (
  `id` mediumint(250) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL DEFAULT '',
  `key-host` varchar(128) NOT NULL DEFAULT '',
  `key-isp` varchar(128) NOT NULL DEFAULT '',
  `key-carrier` varchar(128) NOT NULL DEFAULT '',
  `key-registrar` varchar(128) NOT NULL DEFAULT '',
  `modal` enum('new','updated','monitoring','historical','delete','other') DEFAULT 'new',
  `icon` longblob,
  `icon-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `logo` longblob,
  `logo-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `banner` longblob,
  `banner-mimetype` varchar(64) NOT NULL DEFAULT 'image/png',
  `created` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` int(11) unsigned NOT NULL DEFAULT '0',
  `historical` int(11) unsigned NOT NULL DEFAULT '0',
  `monitored` int(11) unsigned NOT NULL DEFAULT '0',
  `updated` int(11) unsigned NOT NULL DEFAULT '0',
  `ported` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`key-isp`,`modal`,`created`,`key`,`key-host`,`key-carrier`,`key-registrar`,`deleted`,`historical`,`monitored`,`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-12  3:28:28
