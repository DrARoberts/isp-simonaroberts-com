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
-- Table structure for table `lists__addresses`
--

DROP TABLE IF EXISTS `lists__addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__addresses` (
  `id` int(32) unsigned NOT NULL,
  `types` varchar(255) NOT NULL DEFAULT '',
  `unit` varchar(10) NOT NULL DEFAULT '',
  `building` varchar(10) NOT NULL DEFAULT '',
  `street` varchar(64) NOT NULL DEFAULT '',
  `suburb` varchar(64) NOT NULL DEFAULT '',
  `state` varchar(64) NOT NULL DEFAULT '',
  `country` varchar(64) NOT NULL DEFAULT '',
  `country_iso2` varchar(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `council` varchar(255) NOT NULL DEFAULT '',
  `google-placesid` varchar(255) NOT NULL DEFAULT '',
  `longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_ne_longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_nw_latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_sw_longitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `view_sw_latitude` float(29,11) NOT NULL DEFAULT '0.00000000000',
  `formatted` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`id`,`types`,`unit`,`suburb`,`building`,`state`,`postcode`,`street`,`longitude`,`latitude`) USING BTREE KEY_BLOCK_SIZE=16
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `lists__companies`
--

DROP TABLE IF EXISTS `lists__companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__companies` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `terms-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `privacy-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `contact-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `blog-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `twitter-users` varchar(255) NOT NULL DEFAULT '0',
  `countries` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `tla` varchar(15) NOT NULL DEFAULT '',
  `headoffice-addressid` int(32) unsigned NOT NULL DEFAULT '0',
  `mail-addressid` int(32) unsigned NOT NULL DEFAULT '0',
  `rbn` varchar(30) NOT NULL DEFAULT '',
  `rbntype` varchar(64) NOT NULL DEFAULT '',
  `rbn-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `switch-phoneid` int(128) unsigned NOT NULL DEFAULT '0',
  `switch-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `accounts-phoneid` int(128) unsigned NOT NULL DEFAULT '0',
  `accounts-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `resources-phoneid` int(128) unsigned NOT NULL DEFAULT '0',
  `resources-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `legal-phoneid` int(128) unsigned NOT NULL DEFAULT '0',
  `legal-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `feedback-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `complaints-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `feed-products-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `feed-prices-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `feed-tickets-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `feed-errors-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `feed-waiting-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `recovery-emailid` int(128) unsigned NOT NULL DEFAULT '0',
  `recovery-urlid` int(64) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`name`,`tla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__data`
--

DROP TABLE IF EXISTS `lists__data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__data` (
  `id` int(250) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL DEFAULT '',
  `value` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__departments`
--

DROP TABLE IF EXISTS `lists__departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__departments` (
  `id` int(24) NOT NULL AUTO_INCREMENT,
  `unixname` varchar(45) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`unixname`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__emails`
--

DROP TABLE IF EXISTS `lists__emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__emails` (
  `id` int(128) unsigned NOT NULL AUTO_INCREMENT,
  `dataid` int(128) unsigned NOT NULL DEFAULT '0',
  `nameid` int(128) unsigned NOT NULL DEFAULT '0',
  `email` varchar(196) NOT NULL DEFAULT '',
  `emails` int(4) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `verified` int(12) unsigned NOT NULL DEFAULT '0',
  `emailed` int(12) unsigned NOT NULL DEFAULT '0',
  `ndned` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`email`,`nameid`,`emails`,`created`,`verified`,`emailed`,`ndned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__fields`
--

DROP TABLE IF EXISTS `lists__fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__fields` (
  `id` int(24) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('address','data','email','name','phone','url','hours') NOT NULL DEFAULT 'data',
  `unixname` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `weight` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__hours`
--

DROP TABLE IF EXISTS `lists__hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__hours` (
  `id` int(24) unsigned NOT NULL AUTO_INCREMENT,
  `24hours` enum('Yes','No') NOT NULL DEFAULT 'No',
  `open` varchar(5) NOT NULL DEFAULT '09:00',
  `close` varchar(5) NOT NULL DEFAULT '17:30',
  `closed-weekend` enum('Yes','No') NOT NULL DEFAULT 'No',
  `closed-holidays` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__keywords`
--

DROP TABLE IF EXISTS `lists__keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__keywords` (
  `id` varchar(128) NOT NULL DEFAULT '',
  `keyword` varchar(45) DEFAULT '',
  `occurances` int(8) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__keywords_companies`
--

DROP TABLE IF EXISTS `lists__keywords_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__keywords_companies` (
  `companyid` int(64) unsigned NOT NULL,
  `keywordid` int(128) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lists__keywords_urls`
--

DROP TABLE IF EXISTS `lists__keywords_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__keywords_urls` (
  `keywordid` int(128) unsigned NOT NULL,
  `urlid` int(64) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `lists__names`
--

DROP TABLE IF EXISTS `lists__names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__names` (
  `id` int(128) unsigned NOT NULL AUTO_INCREMENT,
  `superfix-id` varchar(32) NOT NULL DEFAULT '',
  `prefix-id` varchar(32) NOT NULL DEFAULT '',
  `suffix-id` varchar(32) NOT NULL DEFAULT '',
  `first` varchar(45) NOT NULL DEFAULT '',
  `second` varchar(45) NOT NULL DEFAULT '',
  `third` varchar(45) NOT NULL DEFAULT '',
  `last` varchar(45) NOT NULL DEFAULT '',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`superfix-id`,`prefix-id`,`suffix-id`,`first`,`second`,`last`,`third`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `lists__phonenumbers`
--

DROP TABLE IF EXISTS `lists__phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__phonenumbers` (
  `id` int(128) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(8) NOT NULL DEFAULT '',
  `area` varchar(10) NOT NULL DEFAULT '',
  `number` varchar(15) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `created` int(12) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`country`,`area`,`number`,`extension`)
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

--
-- Table structure for table `lists__urls`
--

DROP TABLE IF EXISTS `lists__urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lists__urls` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `icon-url` varchar(250) NOT NULL DEFAULT '',
  `icon-mimetype` varchar(45) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` tinytext,
  `twitter-image` varchar(250) NOT NULL DEFAULT '',
  `twitter-title` varchar(128) NOT NULL DEFAULT '',
  `twitter-description` varchar(250) NOT NULL DEFAULT '',
  `twitter-site` varchar(128) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `site-name` varchar(128) NOT NULL DEFAULT '',
  `site-title` varchar(128) NOT NULL DEFAULT '',
  `site-description` varchar(250) NOT NULL DEFAULT '',
  `site-url` varchar(128) NOT NULL DEFAULT '',
  `rating` varchar(128) NOT NULL DEFAULT '',
  `author` varchar(128) NOT NULL DEFAULT '',
  `copyright` varchar(128) NOT NULL DEFAULT '',
  `generator` varchar(128) NOT NULL DEFAULT '',
  `content-type` varchar(128) NOT NULL DEFAULT '',
  `created` int(12) unsigned zerofill NOT NULL DEFAULT '000000000000',
  `updated` int(12) unsigned zerofill NOT NULL DEFAULT '000000000000',
  `polling` int(12) unsigned zerofill NOT NULL DEFAULT '000000000000',
  PRIMARY KEY (`id`)
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

-- Dump completed on 2019-07-21 11:31:32
