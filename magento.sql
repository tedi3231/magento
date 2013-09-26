-- MySQL dump 10.13  Distrib 5.6.10, for osx10.7 (x86_64)
--
-- Host: localhost    Database: magento
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `admin_assert`
--

DROP TABLE IF EXISTS `admin_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert ID',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert Type',
  `assert_data` text COMMENT 'Assert Data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Assert Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_assert`
--

LOCK TABLES `admin_assert` WRITE;
/*!40000 ALTER TABLE `admin_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_ADMIN_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,0,1,1,'G',0,'Administrators'),(2,1,2,0,'U',1,'chunyan');
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_rule`
--

DROP TABLE IF EXISTS `admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert ID',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role Type',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `FK_ADMIN_RULE_ROLE_ID_ADMIN_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_rule`
--

LOCK TABLES `admin_rule` WRITE;
/*!40000 ALTER TABLE `admin_rule` DISABLE KEYS */;
INSERT INTO `admin_rule` VALUES (1,1,'all',NULL,0,'G','allow');
/*!40000 ALTER TABLE `admin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(40) DEFAULT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'chunyan','pan','tedi3231@gmail.com','admin','ec0ceba77522cf63e20faeb0f98ece92:7x','2013-09-26 14:42:31','2013-09-21 06:44:04','2013-09-26 06:42:31',19,0,1,'a:1:{s:11:\"configState\";a:25:{s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"0\";s:13:\"design_header\";s:1:\"0\";s:13:\"design_footer\";s:1:\"0\";s:16:\"design_watermark\";s:1:\"0\";s:17:\"design_pagination\";s:1:\"0\";s:12:\"design_email\";s:1:\"0\";s:11:\"cms_wysiwyg\";s:1:\"1\";s:12:\"dev_restrict\";s:1:\"1\";s:9:\"dev_debug\";s:1:\"1\";s:12:\"dev_template\";s:1:\"1\";s:20:\"dev_translate_inline\";s:1:\"1\";s:7:\"dev_log\";s:1:\"1\";s:6:\"dev_js\";s:1:\"1\";s:7:\"dev_css\";s:1:\"1\";s:7:\"web_url\";s:1:\"0\";s:7:\"web_seo\";s:1:\"0\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"1\";s:9:\"web_polls\";s:1:\"0\";s:10:\"web_cookie\";s:1:\"1\";s:11:\"web_session\";s:1:\"0\";s:24:\"web_browser_capabilities\";s:1:\"0\";}}',NULL,NULL);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification_inbox`
--

LOCK TABLES `adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `adminnotification_inbox` VALUES (1,4,'2008-07-24 21:24:40','Magento 1.1 Production Version Now Available','We are thrilled to announce the availability of the production release of Magento 1.1. Read more about the release in the Magento Blog.','http://www.magentocommerce.com/blog/comments/magento-11-is-here-1/',1,0),(2,4,'2008-08-01 21:30:16','Updated iPhone Theme is now available','Updated iPhone theme for Magento 1.1 is now available on Magento Connect and for upgrade through your Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/updated-iphone-theme-for-magento-11-is-now-available/',1,0),(3,3,'2008-08-01 21:40:27','Magento version 1.1.2 is now available','Magento version 1.1.2 is now available for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-version-112-is-now-available/',1,0),(4,3,'2008-08-13 13:51:46','Magento version 1.1.3 is now available','Magento version 1.1.3 is now available','http://www.magentocommerce.com/blog/comments/magento-version-113-is-now-available/',1,0),(5,1,'2008-09-02 17:10:31','Magento Version 1.1.4 Security Update Now Available','Magento 1.1.4 Security Update Now Available. If you are using Magento version 1.1.x, we highly recommend upgrading to this version as soon as possible.','http://www.magentocommerce.com/blog/comments/magento-version-114-security-update/',1,0),(6,3,'2008-09-15 18:09:54','Magento version 1.1.5 Now Available','Magento version 1.1.5 Now Available.\n\nThis release includes many bug fixes, a new category manager and a new skin for the default Magento theme.','http://www.magentocommerce.com/blog/comments/magento-version-115-now-available/',1,0),(7,3,'2008-09-17 16:18:35','Magento version 1.1.6 Now Available','Magento version 1.1.6 Now Available.\n\nThis version includes bug fixes for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-116-now-available/',1,0),(8,4,'2008-11-07 20:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.',NULL,1,0),(9,3,'2008-11-19 22:31:12','Magento version 1.1.7 Now Available','Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option','http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/',1,0),(10,3,'2008-11-26 18:24:50','Magento Version 1.1.8 Now Available','Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/',1,0),(11,3,'2008-12-30 04:45:59','Magento version 1.2.0 is now available for download and upgrade','We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2','http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/',1,0),(12,2,'2008-12-30 18:59:22','Magento version 1.2.0.1 now available','Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1201-available/',1,0),(13,2,'2009-01-12 17:41:49','Magento version 1.2.0.2 now available','Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/',1,0),(14,3,'2009-01-23 21:25:56','Magento version 1.2.0.3 now available','Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/',1,0),(15,3,'2009-02-02 18:57:00','Magento version 1.2.1 is now available for download and upgrade','We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/',1,0),(16,3,'2009-02-23 21:45:47','Magento version 1.2.1.1 now available','Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/',1,0),(17,3,'2009-02-26 22:39:24','CSRF Attack Prevention','We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/','http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/',1,0),(18,2,'2009-03-03 20:03:58','Magento version 1.2.1.2 now available','Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/',1,0),(19,3,'2009-03-30 22:22:40','Magento version 1.3.0 now available','Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/',1,0),(20,3,'2009-04-18 00:06:02','Magento version 1.3.1 now available','Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/',1,0),(21,3,'2009-05-19 18:31:21','Magento version 1.3.1.1 now available','Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.','http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/',1,0),(22,3,'2009-05-29 18:54:06','Magento version 1.3.2 now available','This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.','http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/',1,0),(23,3,'2009-06-01 15:32:52','Magento version 1.3.2.1 now available','Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.','http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/',1,0),(24,3,'2009-07-01 21:21:44','Magento version 1.3.2.2 now available','Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/',1,0),(25,3,'2009-07-23 02:48:54','Magento version 1.3.2.3 now available','Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/',1,0),(26,4,'2009-08-28 14:26:28','PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.','If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URLâ€˜s in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes','http://www.magentocommerce.com/wiki/paypal_payflow_changes',1,0),(27,2,'2009-09-23 16:16:49','Magento Version 1.3.2.4 Security Update','Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/',1,0),(28,4,'2009-09-25 10:57:54','Magento Preview Version 1.4.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/',1,0),(29,4,'2009-10-06 20:55:40','Magento Preview Version 1.4.0.0-alpha3 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/',1,0),(30,4,'2009-12-08 20:30:36','Magento Preview Version 1.4.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/',1,0),(31,4,'2009-12-31 06:22:12','Magento Preview Version 1.4.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/',1,0),(32,4,'2010-02-13 00:39:53','Magento CE Version 1.4.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.','http://bit.ly/c53rpK',1,0),(33,3,'2010-02-19 23:39:36','Magento CE Version 1.4.0.1 Stable is now available','Magento CE 1.4.0.1 Stable is now available for upgrade and download.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/',1,0),(34,4,'2010-04-23 16:09:03','Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure','Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.','http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/',1,0),(35,4,'2010-05-31 13:20:21','Announcing the Launch of Magento Mobile','The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with Magentoâ€™s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.','http://www.magentocommerce.com/product/mobile',1,0),(36,4,'2010-06-10 16:08:08','Magento CE Version 1.4.1.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/',1,0),(37,4,'2010-07-26 17:37:34','Magento CE Version 1.4.1.1 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-now-available/',1,0),(38,4,'2010-07-28 01:12:12','Magento CE Version 1.4.2.0-beta1 Preview Release Now Available','This release gives a preview of the new Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-beta1-now-available/',1,0),(39,4,'2010-07-28 16:15:01','Magento CE Version 1.4.1.1 Patch Available','As some users experienced issues with upgrading to CE 1.4.1.1 through PEAR channels we provided a patch for it that is available on our blog http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/',1,0),(40,4,'2010-10-11 20:13:25','Magento Mobile is now live!','Magento Mobile is now live! Signup today to have your own native iPhone mobile-shopping app in iTunes for the holiday season! Learn more at http://www.magentomobile.com/','http://www.magentomobile.com/',1,0),(41,4,'2010-11-08 18:52:06','Magento CE Version 1.4.2.0-RC1 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC1 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc1-now-available/',1,0),(42,4,'2010-12-02 17:33:00','Magento CE Version 1.4.2.0-RC2 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC2 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc2-now-available/',1,0),(43,4,'2010-12-08 19:29:55','Magento CE Version 1.4.2.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1420-stable-now-available/',1,0),(44,4,'2010-12-17 20:23:55','Magento Preview Version CE 1.5.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha1-now-available/',1,0),(45,4,'2010-12-29 20:51:08','Magento Preview Version CE 1.5.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha2-now-available/',1,0),(46,4,'2011-01-13 21:35:36','Magento Preview Version CE 1.5.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta1-now-available/',1,0),(47,4,'2011-01-21 18:19:09','Magento Preview Version CE 1.5.0.0-beta2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta2-now-available/',1,0),(48,4,'2011-01-27 18:27:57','Magento Preview Version CE 1.5.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc1-now-available/',1,0),(49,4,'2011-02-03 18:56:33','Magento Preview Version CE 1.5.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc2-now-available/',1,0),(50,4,'2011-02-08 16:43:23','Magento CE Version 1.5.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.5.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-community-professional-and-enterprise-editions-releases-now-availab/',1,0),(51,4,'2011-02-09 20:42:57','Magento CE 1.5.0.1 stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.0.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-1501-stable-now-available/',1,0),(52,4,'2011-03-18 16:15:45','Magento CE 1.5.1.0-beta1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-beta1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-beta1-now-available/',1,0),(53,4,'2011-03-31 14:43:02','Magento CE 1.5.1.0-rc1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-rc1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-rc1-now-available/',1,0),(54,4,'2011-04-26 15:21:07','Magento CE 1.5.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1510-stable-now-available/',1,0),(55,4,'2011-05-26 15:33:23','Magento Preview Version CE 1.6.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-alpha1-now-available/',1,0),(56,4,'2011-06-15 14:12:08','Magento Preview Version CE 1.6.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-beta1for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-beta1-now-available/',1,0),(57,4,'2011-06-30 15:03:58','Magento Preview Version CE 1.6.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc1-now-available/',1,0),(58,4,'2011-07-11 15:07:39','Magento Preview Version CE 1.6.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc2-now-available/',1,0),(59,4,'2011-08-19 13:58:31','Magento CE 1.6.0.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1600-stable-now-available/',1,0),(60,4,'2011-09-16 21:31:26','Magento Preview Version CE 1.6.1.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-beta1-now-available/',1,0),(61,4,'2011-09-29 11:44:10','Magento Preview Version CE 1.6.1.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-rc1-now-available/',1,0),(62,4,'2011-10-19 13:50:05','Magento CE 1.6.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1610-stable-now-available/',1,0),(63,4,'2011-12-30 14:39:35','Magento Preview Version CE 1.7.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-alpha1-now-available/',1,0),(64,4,'2012-01-11 14:24:20','Magento CE 1.6.2.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1620-stable-now-available/',1,0),(65,4,'2012-03-02 16:54:12','Magento Preview Version CE 1.7.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-beta1-now-available/',1,0),(66,4,'2012-04-23 06:02:40','Magento Community Preview Version CE 1.7.0.0-RC1 has been released!','Learn more about the exciting new features and updates in this release and how you can take it for a test drive. As this is a preview version, we need to stress that it\'s likely unstable and that we DON\'T recommend that you use it in any production environment just yet.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-rc1-now-available/',1,0),(67,4,'2012-05-11 01:46:54','Magento Community 1.7 and Magento Enterprise 1.12 now available!','Learn more about the exciting new features and updates in these releases.','http://www.magentocommerce.com/blog/comments/magento-enterprise-112-and-community-17-now-available/',1,0),(68,4,'2012-06-20 10:54:07','Magento Community Edition 1.7.0.1 now available! ','We have just released an updated version of Magento Community Edition, version 1.7.0.1. This update delivers new, minor functionality and fixes for some potential security vulnerabilities.','http://www.magentocommerce.com/blog/comments/magento-community-edition-1701-released/',1,0),(69,4,'2012-07-05 11:21:43','Important Security Update - Zend Platform Vulnerability','We have recently learned of a serious vulnerability in the Zend platform on which Magento is built. Learn more and access a patch that addresses this issue. ','http://www.magentocommerce.com/blog/comments/important-security-update-zend-platform-vulnerability/',1,0),(70,4,'2012-11-19 12:27:42','Wrap up more holiday sales with financing','Give your customers up to 6 months financing. You get paid right away with Bill Me Later, a PayPal service. It’s a great way to extend financing in time for the holidays. Learn More.','http://www.magentocommerce.com/paypal/billmelater?utm_source=CEMessaging&utm_medium=copy&utm_content=sixmonths&utm_campaign=BML',1,0),(71,4,'2012-12-07 03:22:30','Increase Your Sales With PayPal','Magento merchants using PayPal Express Checkout can help increase their sales on average 18%. It is one simple thing you can do right now to help boost your sales. Learn more.','http://www.magentocommerce.com/add-paypal?utm_source=CEModule&utm_medium=copy&utm_content=18&utm_campaign=choosepaypal',1,0),(72,4,'2013-01-15 14:02:07','Imagine 2013 Registration is Now Open!','Join 1500 merchants, partners, developers and enthusiasts from 35+ countries around the world for Magento’s premier global conference! Collaborate, learn, network and get inspired by the future of eCommerce. Tickets will sell out fast! April 8th – 10th in Las Vegas.','https://registration.imagineecommerce.com/',1,0),(73,4,'2013-02-12 09:53:42','Get More eCommerce Power with Magento Enterprise','Limited time offer: Get a free, customized evaluation of your Community Edition site from a Magento Solution Partner. This evaluation gives you a clear look at the numerous benefits you can achieve by upgrading to Enterprise Edition. ','http://www.magentocommerce.com/community-to-enterprise?utm_source=CEMM&utm_medium=copy&utm_campaign=CE2EE',1,0),(74,4,'2008-11-07 20:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.',NULL,1,0),(75,4,'2011-08-22 05:45:25','Magento Absolute theme is available for Magento Go now! ','Magento Absolute theme is available for Magento Go now! ','http://templates-master.com/magento-templates/free-absolute-magento-go-template.html',0,0),(76,4,'2011-09-06 05:27:48','New Elastic Premium template for Magento is published','New Elastic Premium template for Magento is published.','http://bit.ly/pf0ilp ',0,0),(77,3,'2011-09-12 00:37:58','Magento 1.6 compatability update','All our themes and extensions compatible with Magento 1.6 CE now!  Request your update at http://bit.ly/q51qxj ','http://bit.ly/q51qxj ',0,0),(78,4,'2011-09-19 04:52:59','Check our new Affiliate Suite extension for Magento CE','Affiliate Suite by Templates Master will help you to build new efficient sales channe. Your new affiliate partners will be able to promote your store by emailing, placing links, banners and other  media on their sites and any social networks profiles.','http://bit.ly/oKa0zd ',0,0),(79,4,'2011-10-12 06:02:30','Magento Easybanners 1.1 is now available','Easybanners provide easy and powerful tools to manage and target banners to specific users. We are proud to announce that this extension provide support for Magento widgets now. So you can place any banner or placeholder right into your cms page. We have also added option to call out placeholders directly in the phtml templates.','http://bit.ly/phgpx5',0,0),(80,4,'2011-11-04 08:49:59','Join us on Facebook and get one time 10% OFF on all our templates and extensions.','Join us on Facebook and get one time 10% OFF on all our templates and extensions.','http://on.fb.me/rYE7qW ',0,0),(81,4,'2011-11-08 08:00:10','Affiliate Suite 1.0.5  is now available','Affiliate Suite by Templates Master will help you to build new efficient sales channel and start offering affiliate programs at your store.\n\nNew features\n- Allow to copy banners\n- Autoselect default campaign on partner registration\n- Ordered products report interface added\n\nBug fixes\n- Prowidget tool hidden on frontend if disableded','http://bit.ly/saXDyk',0,0),(82,4,'2011-11-11 07:40:50','Firecheckout 1.6.1 compatability update ','Firecheckout is now fully compatible with Magento 1.6.1','http://bit.ly/sUDhHK ',0,0),(83,4,'2011-11-17 08:28:50','New Product Highlight extension for Magento is now available!','New Product Highlight extension for Magento is now available!','http://bit.ly/tGwtwZ ',0,0),(84,4,'2011-11-22 09:04:45','Magento Easy Slider is now available as standalone extension!','Magento Easy Slider is now available as standalone extension!','http://bit.ly/uu0GxJ ',0,0),(85,4,'2011-11-28 07:45:49','Cyber Monday Discount! Get 20% off for all our products - code THNK20 ','Cyber Monday Discount! Get 20% off for all our products - code THNK20 ','http://bit.ly/sBBbSa',0,0),(86,4,'2011-11-30 07:22:50','Helpmate 1.1 is now available','Helpmate 1.1 is now available\n\nFeatures:\n- 2 types of contact form. First is default and second one is like http://www.payoneer.com/contactUs.aspx \n- Attach allowed files from emails\n- Akismet integration\n\nBug fix\n- File upload bug in admin fixed','http://bit.ly/teCtnm ',0,0),(87,4,'2011-12-13 05:44:45','Magento 1.6.1 compatability update','We are glad to inform that recent themes 1.6.1 update also include recent version of Highlight and Easyslide extension.\nRequest your update at http://bit.ly/q51qxj ','http://bit.ly/sEHONg ',0,0),(88,4,'2011-12-21 08:14:11','Social Suit extension for Magento is now available!','Social Suit - New Facebook & Google social networks integration extension for Magento','http://bit.ly/ugYisg ',0,0),(89,4,'2012-01-12 05:50:11','Firecheckout 2.0 is now available.','Firecheckout 2.0  is now available with great new features:\n\n- Configurable address form fields sort order\n- Delivery date option\n- Flexible AJAX updates for checkout page\n- Improved overall performance over 30%\n- Now  available in 11 languages (English, Arabic, Chinese Simplified, Dutch, French, German, Italian, Japanese, Korean, Portuguese, Russian, Spanish, Swedish)','bit.ly/sUDhHK',0,0),(90,4,'2012-01-19 08:39:44','Magento Affiliate Suite 1.1 and Ajax Pro 1.6.6 are now available.','Magento Affiliate Suite 1.1 and Ajax Pro 1.6.6 are now available.','http://bit.ly/ycr6uq ',0,0),(91,4,'2012-01-30 07:10:21','Magento Affiliate Suite 1.1.1 is now available','Please update your Affialite suite to recent 1.1.1 version.','bit.ly/saXDyk',0,0),(92,4,'2012-02-02 07:26:01','Social Suite 1.1 with great new features is now available','- Twitter integration\n- Allow to login with social networks on checkout page\n- Firecheckout login integration support\n- Floating social panel\n- Improved localization\n','http://bit.ly/A8h4yk',0,0),(93,4,'2012-02-15 06:44:58','Lightbox Pro extension for Magento is now available!','Lightbox Pro will replace default magento image zoom with new easy-to-use and flexible Lightbox widget. ','http://bit.ly/xmm1WU',0,0),(94,4,'2012-03-12 08:11:39','Mobile Star - Android and iPhone theme for Magento is now available!','Don’t loose your chance to keep contact with your customers while they are using their phones. We have created Mobile Star Magento theme that will help you join new e-commerce revolution and build your mobile presence just in 5 minutes. Mobile Star is specially designed Magento theme that will work on iPhone, Android  and any other advanced phone. ','http://bit.ly/z5XF3M ',0,0),(95,4,'2012-03-20 05:48:13','Mobile Star template for iPhone and Android is compatible with Magento CE 1.4 —1.6 now.','Don’t loose your chance to keep contact with your customers while they are using their phones. We have created Mobile Star Magento theme that will help you join new e-commerce revolution and build your mobile presence just in 5 minutes. Mobile Star is specially designed Magento theme that will work on iPhone, Android  and any other advanced phone. ','http://bit.ly/GBPp2w',0,0),(96,4,'2012-04-11 01:44:13','Firecheckout 2.1 is now available.','Firecheckout 2.1 is now available with great new features:\n\n- Editable shopping cart on checkout page\n- Optionally show products images on checkout page\n- Improved message for the customers using emails that are already in use\n- Improved Fire Checkout page layout\n- Improved performance while saving Fire Checkout configuration','http://bit.ly/IqPRSb ',0,0),(97,4,'2012-04-27 02:36:31','Fire Checkout 2.1.1 for Magento CE 1.7 is now available','Fire Checkout 2.1.1 for Magento CE 1.7 is now available','http://bit.ly/Igy452 ',0,0),(98,4,'2012-05-04 03:11:25','Mobile Star template is now compatible with Magento CE 1.7.0 and 1.4.0','Mobile Star template is now compatible with Magento CE 1.7.0 and 1.4.0','http://bit.ly/JXXWT4',0,0),(99,4,'2012-05-10 07:16:19','Absolute and classic themes are now compatible with Magento CE 1.7.0','Absolute and classic themes are now compatible with Magento CE 1.7.0','http://bit.ly/Jk7p4F ',0,0),(100,4,'2012-05-15 06:05:03','Firecheckout is now compatible with Magento Enterprise edition.','Firecheckout is now compatible with Magento Enterprise edition.','http://bit.ly/JQqvRi ',0,0),(101,4,'2012-05-24 11:39:46','Prolabels 2.0 with unlimited labels support now available!','Prolabels 2.0 is now available with great new features:\n\n- Unlimited number of labels\n- Flexible condition rules\n- Optimized for large catalogs','http://bit.ly/MKP9ou ',0,0),(102,4,'2012-05-25 06:40:31','Helpmate with great new features and Magento CE 1.7 support is now available',' Helpmate 1.2 is now available with great new features:\n\n- Private tickets responses not visible to users.\n- Create ticket buttons on order and customer admin pages\n- Multiply select option for storeviews on kb articles page\n- Categories and Articles sort order in KB\n- Improve search and suggest algorithm of KB articles\n- Ajax Search compatibility ','http://bit.ly/LhSTwf ',0,0),(103,4,'2012-05-30 08:07:16','Magento templates are now compatible with Magento CE 1.7','We are glad to inform that all our templates were recently updated to Magento CE 1.7. Request your update at http://bit.ly/q51qxj ','http://bit.ly/KHFrQY',0,0),(104,4,'2012-06-22 06:22:54','Prolabels 2.1 is now available','Prolabels 2.1 is now available with next new features and bugfixes:\n\n- Performance update\n- Active products grid interface added for labels\n- Out of stock label text option added\n- Catalog indexes conflict fixed','http://bit.ly/LGESFz',0,0),(105,4,'2012-07-05 06:12:33','Firecheckout 2.2 is now available.','Fire Checkout 2.2 is now available with great new features:\n\n- 5 custom order fields added\n- Hide other shipping methods, if free is applicable (optional)\n- Nice looking styles on our Mobile Star theme\n- Improved positioning of the popup window and spinner on mobile devices\n- Fixed conflict with Magento\'s _canShowForUnregisteredUsers method.\n- In order to improve Fire Checkout compatibility with third party extensions \"Enable Agreements\" option was removed. Please use Magento standard config option instead. You can find it at the checkout options section.','http://bit.ly/N8Cyqi',0,0),(106,4,'2012-07-25 06:07:32','Prolabels 2.2 is now available','Prolabels 2.2 is now available with next new features\n\n- Unlimited number of system labels\n- Improved localization for system labels\n','http://bit.ly/Qj65pj',0,0),(107,4,'2012-08-01 07:26:13','Ajax Layered Navigation 1.1 is now available','Ajax Layered Navigation 1.1 is now available with next new features\n\n- Two new layered navigation styles: vertical layered navigation and drop down layered navigation\n- Limit number of filters to show\n- Improved Magento 1.7 compatibility\n- Improved price ranges algorithm\n','http://bit.ly/ODpjUN',0,0),(108,4,'2012-08-09 06:31:48','Ajax Pro 2.0  is now available','Ajax Pro 2.0  is now available with next new features\n\n- completely refactored extension logic for better performance and better compatibility\n- javascript login form added','http://bit.ly/Na3k8u',0,0),(109,4,'2012-08-17 07:17:07','Social Suite 1.2 with Pinterest integration is now available','Social Suite 1.2  is now available with next new features\n\n- Pinterest integration\n','http://bit.ly/N8Mcu0',0,0),(110,4,'2012-08-27 06:15:31','Ajax Pro 2.0.1 update is now available','Ajax Pro 2.0.1  is now available with next new features\n\n- Ajax Pro links and actions disabled for search engines spiders\n','http://bit.ly/PVixZE',0,0),(111,4,'2012-08-30 11:16:37','Helpmate 1.2.1 is now available','Helpmate 1.2.1  is now available with next new features\n\n- Captcha support for Magento 1.7\n- Frontend layout field label alignment fixed\n- File uploaded type javascript validation added\n- Order info field is now optional\n- Improved admin tickets message format\n\n','http://bit.ly/UdSddX',0,0),(112,4,'2012-09-17 01:56:48','Fire Checkout 2.3.1 is now available. Check more details on most advanced  one page checkout for Magento.','Fire Checkout 2.3.1 is now available with next new features\n\n- Added check for minimum order amount during cart update\n- Fire Checkout layout updated. Now it has more cleaner place order section.\n- Order review block added for EU countries and overall layout is now fully compatible with recent EU requirements\n- Shopping cart section improved. Product name as link and short products description cab be shown now\n\n','http://bit.ly/Prk3Bp',0,0),(113,4,'2012-09-18 06:26:11','Facebook Like Button 2.0 is now available','Facebook Like Button 2.0 is now available with next new features\n\n- Allow to place like buttons on categories pages\n- Flexible locale configuration in admin\n- Fixed problems with meta image and description information\n','http://bit.ly/QiEL5P',0,0),(114,4,'2012-09-27 06:05:58','Buy 2 products and get 5% OFF on entire order ','We are really glad to offer new discount for our clients: Buy 2 products and get 5% OFF on entire order. No coupon code needed.','http://bit.ly/OXhGd3',0,0),(115,4,'2012-10-04 01:56:32','Navigation Pro - most powerful Magento navigation solution is now available! ','','http://bit.ly/QHQC04',0,0),(116,4,'2012-10-09 05:08:56','Mobile Star Magento theme  version 1.2 is available. Now with mobile theme switcher.','','http://bit.ly/VVrZPt',0,0),(117,4,'2012-10-11 01:38:08','Navigation Pro is now compatible with Magento Community 1.4+ and Magento Enterprise 1.12+ ','','http://bit.ly/T7Qe8w',0,0),(118,4,'2012-10-15 06:54:50','Firecheckout 2.3.2 is now available ','Fire Checkout 2.3.2 is now available with next new features\n\n- Saving delivery date and additional checkout fields when PaypalExpress or similar method is used fixed.\n- Payone integration added\n','http://bit.ly/Rx95xd',0,0),(119,4,'2012-10-18 07:46:49','Easy Slider 2.0 with Nivo slider integration is now available','Easy Slider 2.0 is now available with next new features\n\n- Nivo slider integration\n- Support 18 Nivo slider effects\n- Responsive design friendly\n- Load jQuery in no-conflict mode','http://bit.ly/R2MW7e',0,0),(120,4,'2012-10-24 07:30:25','Ajax Pro user manual and  demo is now updated to recent 2.0 version','','http://bit.ly/Siqs4g ',0,0),(121,4,'2012-10-31 08:14:53','Helpmate 1.3.0 is now available','Helpmate 1.3.0  is now available with next new features\n- Allow admins to answer tickets via email gateway\n- WYSIWYG editor is now available in admin ticket interface\n- Optionally display html tags in tickets interface\n\nFixes\n- Fixed issue with error message attached to tickets for disallowed file types\n- Improved email format auto-detect feature\n','http://bit.ly/PHeEdJ',0,0),(122,4,'2012-11-02 08:21:07',' Increase click-through rates on search engines results pages with Google Rich Snippets extension for Magento','','http://bit.ly/SBLpqY',0,0),(123,4,'2012-11-08 02:59:06','Google Rich Snippet 1.1 is now available','Google Rich Snippet  1.1.0  is now available with next new features\n\n- Each snippet can be disabled or enabled now in extension configuration \n- Manufactures snippet configuration field converted to dropdown\n- Seller snippet configuration field converted to text area\n- Improved compatibility with magento 1.4\n','http://bit.ly/RGZsMi',0,0),(124,4,'2012-11-20 05:48:20','Firecheckout 2.3.3 is now available','Fire Checkout 2.3.3 is now available with next new features\n\n- Unirgy gift card integration fixed.\n- Order review with single payment method fixed.\n- Order review with billing address only fixed.\n- Buyerprotection integration added.\n','http://bit.ly/10lYxU0 ',0,0),(125,4,'2012-11-22 06:25:47','Magento Easy Catalog Images 2.0 is now available','Easy Catalog Images 2.0  is now available with next new features\n\nGeneral:\n-  Perfomance improvements. Dramatically decreased query count per block render (One query).\n-  Cache support added.\n-  Flexible grid styles added to support multicolumn mode for various site styles without modifying the styles. 2-6 columns are supported out of the box.\n-  Category thumbnail is displayed instead of category image by default.\n-  Widget support added. Widget is fully configurable with custom options. You can insert the Easy Catalog Images where you wish to. (Any cms page, block etc)\n-  EasyCatalogImages block is now shown above the category title. We did this to prevent numerous conflicts with custom themes.\nConfiguration improvements:\n-  Maximum category count to show added.\n-  Ability to set the background color for resized image. White by default.\n\nRemoved features. (Removed to improve compatibility with custom themes)\n-  \'Show categories listing\' on homepage removed. Please use the homepage editor and add Easy Catalog Images widget directly to the homepage content.\n-  Alibity to disable product listing removed. Please use the built-in Magento option on category edit page.\n-  \'Show child categories\' field removed. Please use the \'Number of subcategories to show\' field get the same result.\n\n','http://bit.ly/SX6qdg',0,0),(126,4,'2012-11-26 03:20:02','Cyber Monday Discount! Get 15% off for all our products - code CYBER15','Cyber Monday Discount! Get 15% off for all our products - code CYBER15','http://bit.ly/TdT2ld',0,0),(127,4,'2012-11-28 08:30:29','Improve your customers shopping experience with Ajax Pro 2.1 ','Ajax Pro 2.1 is now available with next new features:\n\n- Improved IE compatibility\n- Bug with limited wishlist products number fixed\n- Problem with compare list clear feature resolved\n- Problem with continue shopping button for configurable products resolved\n- Completely removed ajaxpro actions from compare popup for better user experience','http://bit.ly/10Wm13j',0,0),(128,4,'2012-11-29 09:27:32','Amend layered navigation with  Ajax Layered Navigation 1.2','Ajax Layered Navigation 1.2 is now available with next new features:\n\n- Search form added\n- Scroll effect added for better user experience\n- Fixed problem with price slider for non-valid intervals\n- Fixed problems with selected category filter\n- Improved IE compatibility\n','http://bit.ly/11jZDzU',0,0),(129,4,'2012-12-05 02:45:01','Create custom products blocks with Products Highlight 2.3 ','Products Highlight 2.3  is now available with next new features:\n\n-Hightlight page with product listing added.\n-Product type filter added\n-SEO urls support added to the homepage highlight listing.','http://bit.ly/VvIx2B',0,0),(130,4,'2012-12-06 01:31:23','Improve your store sales with Fire Checkout 2.3.4','Fire Checkout 2.3.4 is now available with next new features:\n\n- Agreements wrapper will not visible, if there are no agreements available.\n- OrderReview styles improvements.\n- IE stability fix for slowly loading sites.\n- Payment tooltip positioning fixed, when position relative is used on parent elements.\n- IE7 css and javascript fixes.\n- CheckoutFields updated:\n- Compatibility with Magento 1.5, 1.6 added.\n- Ability to enable/disable printing of checkout fields for invoices and packingslips','http://bit.ly/TE5kUj',0,0),(131,4,'2012-12-11 09:39:43',' Google Rich Snippets 1.2.1 is now available ','Google Rich Snippets 1.2.1 is now available with next new features:\n\n- Description snippet is moved from meta tag to visible tag\n- Name snippet is moved from meta tag to visible tag\n- Review snippet is moved from meta tag to visible tag\n','http://bit.ly/125EfzM',0,0),(132,4,'2012-12-18 05:05:18','Protect your store back-end from unauthorized access with two-step verification by Google Authenticator','','http://bit.ly/UOfT8z',0,0),(133,4,'2012-12-26 03:17:47','Enjoy the spirit of the season and get great savings at Templates Master. Get 20% off for all our products - code XMAS20','Enjoy the spirit of the season and get great savings at Templates Master. Get 20% off for all our products - code XMAS20','http://bit.ly/Vxx7VX',0,0),(134,4,'2013-01-04 07:37:04',' Google Rich Snippets 1.2.4 is now available ','Google Rich Snippets 1.2.4 is now available with next new features:\n\n- Added organisation snippet\n- Review snippet template modified\n\n','http://bit.ly/X66lHs',0,0),(135,4,'2013-01-10 07:57:20','Ajax Search And Autocomplete 1.3.0 is now available ','Ajax Search And Autocomplete 1.3.0  is now available with next new features:\n\n- Fixed detection of element width and height\n- Fixed loader positioning, when relative styles are not used in theme\n- Optional filtering of suggestions by category added\n\n','http://bit.ly/WEem3w',0,0),(136,4,'2013-01-24 07:40:19','Improve your checkout experience with Fire Checkout 2.3.6','Fire Checkout 2.3.6 is now available with next new features:\n\n- Paypal fixes for payflowlink, payflowadvanced and hostedpro solutions\n- Fixed missing dicount amount, when placing order as guest in Magento 1.7.0.2\n- TBT RewardsPoint partial integration\n- Improved display of long product attributes in shopping cart\n- SVMPayment integration fixed\n- Improved integration with SagepayDirect incheckout mode\n- CraftyClicks integration improvements','http://bit.ly/V9ArYB',0,0),(137,4,'2013-02-11 09:01:41','Get 14% OFF with St. Valentine\'s special offer','Valentine\'s Day is quickly approaching and we are glad to offer special discount for all our beloved customers. It\'s a great chance to get any our extensions or template with 14% discount.  Our Valentine\'s offer ends on February 15 so don\'t miss your chance to improve your store!','http://bit.ly/Y6AhmA',0,0),(138,4,'2013-02-25 00:20:54','Meet Argento - Most powerful Magento responsive theme ','Argento is more than just another template created for Magento. It was created right from the ground based on the best ecommerce stores practices and according to Magento developers guidelines. Powered with more than 15 popular Magento extensions and based on HTML5 and CSS3 it will bring your store to absolutely new level. Argento was optimized both for speed and SEO, tested in popular browsers and different mobile devices in order to increase conversion and improve shopping experience.','http://bit.ly/XVMvNk',0,0),(139,4,'2013-03-01 07:57:38','Improve your store support process with Helpmate 1.4','Finished:\n-  Separate quick answer element was added\n-  Pagination toolbar added for frontend users ticket interface\n-  Admin users can now use hidden departments in order to escalate issues to this department\n-  Helpdesk priority page design improved\n-  Grid interfaces added for related products articles interface at products admin interface\n-  FAQ drop-down can be used now to insert either link or complete KB article \n-  Related articles block on product page moved to content area\n-  Improved html template structure for compatibility with custom design\n\nFixes\n- Editor freeze after using quick answer\n- HTML tags were used when posting KB articles as quick answer form\n- Localisation improved','http://bit.ly/YEbEw0',0,0),(140,4,'2013-03-06 09:13:31','Easy Colors Swatches 1.3 with new great features is now available  ','Features:\n\n-  separate admin interface\n-  show selected image in cart block for configurable products\n-  allow to create swatches without assigned images\n-  improved javascript code\n','http://bit.ly/YcSj5l',0,0),(141,4,'2013-03-14 06:29:25','Improve your store conversion rate with Fire Checkout 2.4','Fire Checkout 2.4.0 is now available with next new features:\n\n- Css and templates moved to base folder in order to provide compatibility with non-default based themes\n- Css improvements. Form fields are now have fluid styles, to match various theme width\n- Customer comments moved to separate database field\n- Added ability to edit customer comment, delivery date and additional fields from backend interface\n- Improved configuration section for form fields sort order. Drag\'n\'drop is now supported\n- Optional Usps address verification added. Only United States addresses will be verified if enabled\n- Improved edit address links at the address review section \n- Integration with Storepickup module updated\n- AheadWorks Point extensionintegration added\n- Added support of SagePay saved tokens feature\n- Paymill integration added\n- Generel code cleanup\n- Syntax errors removed','http://bit.ly/WfgLrb',0,0),(142,4,'2013-03-25 07:13:00','Reward your customers for sharing news about your store with Social Suite 1.3 ','Social Suite 1.3  is now available with next new features:\n\n- Reward your customers for sharing news about your store\n- Asynchronous javascript load for social buttons for better page performance\n- Facebook login and google login feature updated for better user experience\n',' http://bit.ly/YauZK9',0,0),(143,4,'2013-03-29 05:34:11','Save 20% on all themes and extensions with our Easter sale!','Save 20% on all themes and extensions with our Easter sale!','http://bit.ly/172I9fh',0,0),(144,4,'2013-04-02 07:38:44','Get Mobile star template with improved Retina screen support','Get Mobile star template with improved Retina screen support','http://bit.ly/XGcgqk',0,0),(145,4,'2013-04-08 07:26:03','Improve your layered navigation with Ajax Layered Navigation 1.2.2 ','Improve your layered navigation with Ajax Layered Navigation 1.2.2 ','http://bit.ly/Zd5gxb',0,0),(146,4,'2013-04-11 07:57:51','Attract your customers attention with Prolabels 1.2.2','','http://bit.ly/12MmKaK',0,0),(147,4,'2013-04-17 02:10:46','Fire Checkout 2.4.1 is now available ','Fire Checkout 2.4.0 is now available with next new features:\n\n- MageWorx Customercredit integration\n- Css improvements for mobile and tablet devices\n- First available shipping will not selected if default one is not found\n- Fixed shipping price, when weight vs destination is used. Matrix rate compatibility added.\n- Kiala LocateAndSelect integration added\n- BillPay compatibility\n- Comptibility with Magento per-country postcode and region configuration added','http://bit.ly/YTOUyh',0,0),(148,4,'2013-04-23 07:21:53','Manage your store banners with Easy Banners 1.3.0 ','Easy Banners 1.3.0  is now available with next new features:\n\n- Ability to set image size added\n- Optional retina support added\n- Ability to use banner url for html mode added. Use the {{tm_banner_url}} variable in banner content.\n- Backend banner management interface improvements\n- Image dimensions added to html markup, when resizer is used\n','http://bit.ly/15EcDW5',0,0),(149,4,'2013-04-24 06:41:53','Argento responsive theme 1.1.2 is now available',' Argento update\n\n*    Html markup and css improvements. YSlow - 86 PageSpeed - 93\n*    Review url fixed on product page\n*    Lightboxpro config options updated to look good on mobile screens\n*    Related products styles and image size improvements for small screen devices\n*    All small images styles improved for mobile devices\n*    Improved form styles\n*    Fixed product listing on advanced search results\n*    Facebook Like Button added\n*    Scroll to top button added\n\nSoldtogether updated\n\n*    Table prefix added to query\n*    Amazon styled template will show only simple products\n*    Fixed price calculation for bundle, configurable and grouped products when using amazon template\n*    Colection queries improvements\n\nEasyslide updated\n\n*    jQuery will not be added if nivo slider is not used\n*    Default slider options added when creating new slider\n*    Enabled option removed. Please use status option for each slider instance.\n*    Load jQuery option now affects on adding jQuery library only: nivo javascript will be added if nivo slider is used.\n\nEasycatalogimg updated\n\n*    Optional retina support added\n*    Image dimensions added to html markup\n\nEasybanner updated\n\n*    Ability to set image size added\n*    Optional retina support added\n*    Ability to use banner url for html mode added. Use the {{tm_banner_url}} variable in banner content.\n*    Backend banner management interface improvements\n*    Image dimensions added to html markup, when resizer is used\n','http://bit.ly/XWJ7pO',0,0),(150,4,'2013-04-27 20:48:07','Improve your newsletter marketing  performance with Newsletter Booster','','http://bit.ly/ZLmOpn',0,0),(151,4,'2013-05-10 07:06:19','Improve your conversion rate with Fire Checkout 2.4.2','Fire Checkout 2.4.2 is now available with next new features:\n\n- Enterprise version compatibility update\n- New registration mode: Guest checkout is allowed and registration checkbox is checked by default\n- Ability to set the default checkbox state for shipping address and newsletter subscription\n- Configuration options grouped into smaller parts','http://bit.ly/Yz1eT6',0,0),(152,4,'2013-05-14 02:07:57','Ajax search security update 1.3.1','- Security update. There was no security threat but bug can be considered as potential threat. ','http://bit.ly/19mHSSF',0,0),(153,4,'2013-05-20 05:58:09','Argento 1.2 with new Pure design is now available','Argento update:\n\n*    New Pure theme added\n*    Css styles optimization\n*    Css styles improvements for small tablet devices\n*    Removed php warnings during Argento installation\n*    Fixed upsell products decoration with first/last classes\n*    AjaxSearch updated - Security bugfix\n*    Easyslide updated - Nivo slider updated\n*    Askit updated - Grammar errors fixed\n*    Easybanner updated - Title field should not be required, when using html mode\n*    Facebook Like Button updated - Fixed access to facebook like button config section when internet connection is not available\n*    Highlight updated - Added translation of the highlight page title\n*    Soldtogether updated - Fixed bug, when no product is available, but soldtogether block is called','http://bit.ly/114IWeX',0,0),(154,4,'2013-05-28 05:43:12','Improve your shopping experience with Quick Shopping 1.2.0','Quick Shopping 1.2.0  is now available with next new features:\n\n- Templates and skin resources moved to base folder\n- Better compatibility with third-party themes\n- Highlight page support added\n- Updated styles for window and button\n- Layout xml optimization\n- Better javascript handling of response text\n- Amlanding integration added\n- QuickView button will be hidden if no css and js are loaded.','http://bit.ly/10Eoz3x',0,0),(155,4,'2013-06-04 06:42:38','Fire Checkout 2.4.3 is now available ','Fire Checkout 2.4.3 is now available with next new features:\n\n- Check for minimum amount when removing item from cart fixed.\n- No more unnecessary captcha refreshes, when updating page content.\n- Fixed optional and hidden region field for Magento 1.6.2 and earlier\n- Fixed hidden postcode field\n- Fixed bug when Mage_Persitent was disabled with etc/modules file\n- Improved compatibility with third-party themes, that used height style for input fields\n- Added parsing of System is busy message from VIES validator\n- AheadWorks Newsletter module integration added\n- Integration with Irvine DeliveryDate and JapanPost added\n- Partial uSplitRates integration added. Still needs to edit app/code/local/TM/FireCheckout/Model/Quote/Address.php\n- Partial integration with Stripe payment methods added. Need to edit stripe/form/stripe.phtml','http://bit.ly/11itvv9',0,0),(156,4,'2013-06-19 07:08:43','Allow your customers to create user generated content with Askit 2.0 ','Askit 2.0  is now available with next new features:\n\n Features\n- Allow to place discussion block on cms and categories pages\n- Added page with all products discussion at your store\n- Added products question search on all products page\n- Widget for recent discussion was added\n- Added folded or unfolded default states for products discussion\n\nFixes\n- Added notifications for additional responses by other visitors.\n','http://bit.ly/11ZuXG2',0,0),(157,4,'2013-07-02 06:40:16','Improve your store navigation with Layered Navigation 2.0','Layered Navigation 2.0 is now available with next new features:\n\n- SEO links for layered navigation\n- Optional non-follow element\n- Performance update - works 80% faster!\n- Optionally show search form if there is larger then x number of attributes\n- New layered navigation styles added','http://bit.ly/17R8pfW',0,0),(158,4,'2013-07-04 06:59:59','Save 20% on all themes and extensions with our Independence day sale! ','Save 20% on all themes and extensions with our Independence day sale! ','http://bit.ly/13v8dAa',0,0),(159,4,'2013-07-08 04:34:18','Increase your store sales with Firecheckout 2.4.4','Fire Checkout 2.4.3 is now available with next new features:\n\n- One firecheckout version for Magento 1.4.2.0-1.7.0.2\n- Irvine shipping methods integration added\n- Undefined warning removed, when using one line for address field\n- Compatibility with third party themes, that using border-box style for all elements\n- Customer credit integration fixed\n- Billsafe Integration\n- Euvat extension compatibility added\n- Ability to reload order totals on taxvat change added\n- Fixed displaying of Email already in use window\n- Password will not be copied to OrderReview section\n- Fixed ugiftcert warning when applying coupon code\n- Checkoutfields will not redefine pdf print models, to prevent conflicts with \n other pdf modules. To enable checkoutfields printing, follow instructions from \n checkoutfields configuration options','http://bit.ly/1d9NOAC',0,0),(160,4,'2013-07-11 07:24:26','Increase your store speed up to 400% with Page Cache extension!','','http://bit.ly/12tDWM3',0,0),(161,4,'2013-08-05 08:54:01','Improve your products page design with Easy Tabs 2.0','Easy Tabs  2.0 is now available with next new features:\n\n- New backend interface with separate page\n- Skins and templates moved to base folder\n- Unlimited number of tabs\n- Responsive styles added','http://bit.ly/16uYnOn',0,0),(162,4,'2013-08-08 05:25:38','Magento Page Cache 1.0.2 is now available','Magento Page  Cache 1.0.2 is now available with next new features:\n\n- Session params added to cache key at required pages (listing mode, limit etc)\n- Added support of dynamic blocks in custom_layout_update xml directive\n- Fixed cache cleaning when mass delete is used\n- Added support for cache auto refresh for Quickshopping module\n\n','http://bit.ly/13IPu3j',0,0),(163,4,'2013-08-14 07:48:05','Argento 1.3 is now available with backend CSS configuration ','Argento update:\n\nArgento update\n*    Fixed displaying of decimal quantities in header cart\n*    Removed overriding of customer.xml layout\n*    Css styles was refactored. Duplicate code removed.\n*    Automatic inclusion of custom.css file from active theme skin folder\n\nBackend configuration for theme styles added\n*    Background\n*    Top navigation\n*    Buttons (ArgentoPure only)\n*    Tabs\n*    Fonts\n*    Additional custom css\n*    Ability to add additional head links (Google fonts for example)\n\nEasytabs\n*    Easy tabs 2.0 integrated\n\nAjaxSearch\n*    Fixed search form submit by clicking the search button\n\nSuggestPage\n*    ajaxpro compatibility fixed\n\nAjaxPro\n*    Fixed wishlist link for secure pages\n\nHighlight\n*    Currency code added to cache key\n*    Fixed building of product url, when category path in product url is disabled from backend\n*    Fixed filtering of the one day only available products\n\nSoldTogether\n*    Fixed filtering of products on suggestpage\n*    Fixed price formatting for amazon style template\n\nCore\n*    Notifier filter by news channel added\n*    Magento 1.4 compatibility added','http://bit.ly/16brXYz',0,0),(164,4,'2013-08-19 05:51:11','Newsletter Booster 1.2.0 with advanced newsletter features is now available','Newsletter Booster 1.2.0 is now available with next new features:\n\n- Campaigns can be set to be visible on front end so customers can subscribe to one that they are interested at\n- Subscribers can now un-subscribe and subscribe from separate segments\n- Separate newsletter tab is added to customer\'s My account page\n- Send to multiply segments option was added in admin interface\n- Guest subscribe and queue\n- Support for anonymous email gateways\n- utm_content content support \n','http://bit.ly/19tgPay',0,0),(165,4,'2013-08-27 05:16:21','Improve your Magento store admin security with Improved admin security 2.0 extension ',' Improved admin security 2.0 extension   is now available with next new features:\n\n- Admin actions logs added\n- Advanced control over admin user ip address used added\n- Admin login actions log added\n','http://bit.ly/1djLRFY',0,0),(166,4,'2013-09-02 07:21:50','Increase your revenue with Firecheckout 2.4.5 ','Fire Checkout 2.4.5 is now available with next new features:\n\n- Added support for quantity increments when using +/- buttons in shopping cart\n- AddressFields status save: Warning message removed in Magento 1.5.0.1 and earlier.\n- Validate form method created to allow to validate firecheckout form from any script\n- Success page url changed to checkout/onepage/success to provide compatibility with third party tracking extensions\n- Fixed saving guest email and phone to quote on address refresh\n- Fixed saving of last selected address for registered users\n- Fixed sending order confirmation emails for magento 1.4.2\n- Fixed updating OrderReview section in IE10\n- Fixed click on single available payment method\n- Fixed error in billing form, when Mage_Newsletter module is disabled.\n- Imporved check for Mage_Capcha module. Added check for etc/modules status.\n- Added synchronization of klarna invoice form with address form\n- Infostrates TNT shipping method support added (need to edit tnt.js to add event firing, when ajax request is completed)\n- TigPostcode extension templates updated to the latest version\n- Givechange module integration\n- Klarna part integration added\n- Partial Amasty coupons integration. Still needs to edit Amasty_Coupons_Block to change template.\n- Partial webtext giftcard integration. Still need to edit giftcard.xml and CartController.php','http://bit.ly/1fus5EF',0,0),(167,4,'2013-09-06 07:19:20','Magento Easy Lightbox extension 3.0 is now available','','http://bit.ly/17dnWDp',0,0),(168,4,'2013-09-10 05:15:35','Argento 1.3.1 is available. Now compatible with Magento Enterprise edition!','Argento update\n*    Magento Enterprise Edition compatibility\n*    Sweet tooth reward integrated into shopping cart template\n*    Main product image size increased to 370px\n*    Subtotal added to cart popup for Argento theme\n*    Fixed output of tags and other inline links, when html minifier extension is used\n*    Added additional theme fallback rules to simplify enterprise version compatibility\n*    Fixed broken print invoice page\n*    Fixed double call for EasyTabs block\n\nAjaxSearch updated\n*    Fixed filling the dummy search text after double click on input field\n*    Fixed sorting of categories in category combobox\n*    Fixed category search results\n*    Fixed automatic applying filter by category on search results page\n*    Layout and templates moved to base/default/tm folder\n\nEasyTabs updated\n*    Added missing containers to tag and review blocks\n*    Layout and templates moved to base/default/tm folder\n\nTM_Core updated\n*    Fixed error when AdminNotification module is disabled\n\nSoldtogether\n*    Updated to the newest version\n*    Fixed updating of the main product price, when soldtogether products are not found\n\nEasyCatalogImages\n*    Layout and templates moved to base/default/tm folder\n*    Fixed imagepath detection. Possible bug when media is used in domain name\n\nEasyBanner\n*    Fixed imagepath detection. Possible bug when media is used in domain name\n*    Added check for banner availability in store, when inline banner call is used\n','http://bit.ly/1b0Y0is',0,0),(169,4,'2013-09-19 05:10:33','Magento Page Cache 1.0.3 is now available!','Magento Page  Cache 1.0.3 is now available with next new features:\n\n- Compilation mode compatibility added\n- Fixed developer and inline translate modes per IP address\n- Fixed output of dynamic blocks called with inline method from cms block or page\n- Cache autorefresh support added for: TM_Askit, AW_Productquestions\n','http://bit.ly/1aNvf6g',0,0);
/*!40000 ALTER TABLE `adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_acl_attribute`
--

DROP TABLE IF EXISTS `api2_acl_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api2_acl_attribute` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `user_type` varchar(20) NOT NULL COMMENT 'Type of user',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `operation` varchar(20) NOT NULL COMMENT 'Operation',
  `allowed_attributes` text COMMENT 'Allowed attributes',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_API2_ACL_ATTRIBUTE_USER_TYPE_RESOURCE_ID_OPERATION` (`user_type`,`resource_id`,`operation`),
  KEY `IDX_API2_ACL_ATTRIBUTE_USER_TYPE` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Filter ACL Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_acl_attribute`
--

LOCK TABLES `api2_acl_attribute` WRITE;
/*!40000 ALTER TABLE `api2_acl_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `api2_acl_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_acl_role`
--

DROP TABLE IF EXISTS `api2_acl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api2_acl_role` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `role_name` varchar(255) NOT NULL COMMENT 'Name of role',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_API2_ACL_ROLE_CREATED_AT` (`created_at`),
  KEY `IDX_API2_ACL_ROLE_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_acl_role`
--

LOCK TABLES `api2_acl_role` WRITE;
/*!40000 ALTER TABLE `api2_acl_role` DISABLE KEYS */;
INSERT INTO `api2_acl_role` VALUES (1,'2013-09-21 14:43:06',NULL,'Guest'),(2,'2013-09-21 14:43:06',NULL,'Customer');
/*!40000 ALTER TABLE `api2_acl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_acl_rule`
--

DROP TABLE IF EXISTS `api2_acl_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api2_acl_rule` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `privilege` varchar(20) DEFAULT NULL COMMENT 'ACL Privilege',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_API2_ACL_RULE_ROLE_ID_RESOURCE_ID_PRIVILEGE` (`role_id`,`resource_id`,`privilege`),
  CONSTRAINT `FK_API2_ACL_RULE_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_acl_rule`
--

LOCK TABLES `api2_acl_rule` WRITE;
/*!40000 ALTER TABLE `api2_acl_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `api2_acl_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api2_acl_user`
--

DROP TABLE IF EXISTS `api2_acl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api2_acl_user` (
  `admin_id` int(10) unsigned NOT NULL COMMENT 'Admin ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  UNIQUE KEY `UNQ_API2_ACL_USER_ADMIN_ID` (`admin_id`),
  KEY `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` (`role_id`),
  CONSTRAINT `FK_API2_ACL_USER_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_API2_ACL_USER_ROLE_ID_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api2_acl_user`
--

LOCK TABLES `api2_acl_user` WRITE;
/*!40000 ALTER TABLE `api2_acl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `api2_acl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assert`
--

DROP TABLE IF EXISTS `api_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert id',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert type',
  `assert_data` text COMMENT 'Assert additional data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assert`
--

LOCK TABLES `api_assert` WRITE;
/*!40000 ALTER TABLE `api_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_role`
--

DROP TABLE IF EXISTS `api_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent role id',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role level in tree',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order to display on admin area',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User id',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_API_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_API_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_role`
--

LOCK TABLES `api_role` WRITE;
/*!40000 ALTER TABLE `api_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rule`
--

DROP TABLE IF EXISTS `api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Api rule Id',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Api role Id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Module code',
  `api_privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert id',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role type',
  `api_permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_API_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_API_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `FK_API_RULE_ROLE_ID_API_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rule`
--

LOCK TABLES `api_rule` WRITE;
/*!40000 ALTER TABLE `api_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_session`
--

DROP TABLE IF EXISTS `api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_session` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User id',
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login date',
  `sessid` varchar(40) DEFAULT NULL COMMENT 'Sessioin id',
  KEY `IDX_API_SESSION_USER_ID` (`user_id`),
  KEY `IDX_API_SESSION_SESSID` (`sessid`),
  CONSTRAINT `FK_API_SESSION_USER_ID_API_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_session`
--

LOCK TABLES `api_session` WRITE;
/*!40000 ALTER TABLE `api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_user`
--

DROP TABLE IF EXISTS `api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'Last name',
  `email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'Nickname',
  `api_key` varchar(40) DEFAULT NULL COMMENT 'Api key',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User record create date',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User record modify date',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Quantity of log ins',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Refresh ACL flag',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Account status',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_user`
--

LOCK TABLES `api_user` WRITE;
/*!40000 ALTER TABLE `api_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_log`
--

LOCK TABLES `captcha_log` WRITE;
/*!40000 ALTER TABLE `captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_CATEGORY_ID` (`category_id`),
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_PATH_CATEGORY_ID` (`path`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_idx`
--

LOCK TABLES `catalog_category_anc_categs_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_categs_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_categs_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_CATEGORY_ID` (`category_id`),
  KEY `IDX_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_PATH_CATEGORY_ID` (`path`,`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_categs_index_tmp`
--

LOCK TABLES `catalog_category_anc_categs_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_categs_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_IDX_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_idx`
--

LOCK TABLES `catalog_category_anc_products_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_anc_products_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_anc_products_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_CAT_CTGR_ANC_PRDS_IDX_TMP_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_anc_products_index_tmp`
--

LOCK TABLES `catalog_category_anc_products_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_anc_products_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity`
--

LOCK TABLES `catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity` DISABLE KEYS */;
INSERT INTO `catalog_category_entity` VALUES (1,3,0,0,'2013-09-21 06:43:16','2013-09-21 06:43:18','1',0,0,1),(2,3,3,1,'2013-09-21 06:43:16','2013-09-21 06:43:16','1/2',1,1,3),(6,3,3,2,'2013-09-21 07:04:09','2013-09-26 07:34:58','1/2/6',1,2,1),(7,3,3,6,'2013-09-21 07:05:21','2013-09-26 07:35:10','1/2/6/7',1,3,0),(8,3,3,2,'2013-09-21 07:34:37','2013-09-21 07:34:48','1/2/8',2,2,0);
/*!40000 ALTER TABLE `catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DTIME_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

LOCK TABLES `catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_datetime` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_datetime` VALUES (1,3,59,0,6,NULL),(2,3,60,0,6,NULL),(3,3,59,0,7,NULL),(4,3,60,0,7,NULL),(7,3,59,0,8,NULL),(8,3,60,0,8,NULL);
/*!40000 ALTER TABLE `catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DEC_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

LOCK TABLES `catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_decimal` VALUES (1,3,70,0,6,NULL),(2,3,70,0,7,NULL),(3,3,70,0,8,NULL);
/*!40000 ALTER TABLE `catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_int`
--

LOCK TABLES `catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_int` VALUES (1,3,67,0,1,1),(2,3,67,1,1,1),(3,3,42,0,2,1),(4,3,67,0,2,1),(5,3,42,1,2,1),(6,3,67,1,2,1),(19,3,42,0,6,1),(20,3,67,0,6,1),(21,3,50,0,6,NULL),(22,3,51,0,6,0),(23,3,68,0,6,0),(24,3,69,0,6,0),(25,3,42,0,7,1),(26,3,67,0,7,1),(27,3,50,0,7,NULL),(28,3,51,0,7,0),(29,3,68,0,7,0),(30,3,69,0,7,0),(32,3,42,0,8,1),(33,3,67,0,8,0),(34,3,50,0,8,NULL),(35,3,51,0,8,0),(36,3,68,0,8,0),(37,3,69,0,8,0);
/*!40000 ALTER TABLE `catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_TEXT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_text`
--

LOCK TABLES `catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_text` VALUES (1,3,65,0,1,NULL),(2,3,65,1,1,NULL),(3,3,65,0,2,NULL),(4,3,65,1,2,NULL),(14,3,44,0,6,NULL),(15,3,47,0,6,NULL),(16,3,48,0,6,NULL),(17,3,62,0,6,NULL),(18,3,65,0,6,NULL),(19,3,44,0,7,NULL),(20,3,47,0,7,NULL),(21,3,48,0,7,NULL),(22,3,62,0,7,NULL),(23,3,65,0,7,NULL),(29,3,44,0,8,NULL),(30,3,47,0,8,NULL),(31,3,48,0,8,NULL),(32,3,62,0,8,NULL),(33,3,65,0,8,NULL);
/*!40000 ALTER TABLE `catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_VCHR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

LOCK TABLES `catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_category_entity_varchar` VALUES (1,3,41,0,1,'Root Catalog'),(2,3,41,1,1,'Root Catalog'),(3,3,43,1,1,'root-catalog'),(4,3,41,0,2,'Default Category'),(5,3,41,1,2,'Default Category'),(6,3,49,1,2,'PRODUCTS'),(7,3,43,1,2,'default-category'),(20,3,41,0,6,'手机通讯'),(21,3,43,0,6,'ae-aeoe-e-se'),(22,3,46,0,6,NULL),(23,3,49,0,6,'PRODUCTS'),(24,3,58,0,6,'default/pagayo-theme-002'),(25,3,61,0,6,NULL),(26,3,57,1,6,'ae-aeoe-e-se.html'),(27,3,57,0,6,'ae-aeoe-e-se.html'),(28,3,41,0,7,'手机配件'),(29,3,43,0,7,'ae-aeoe-e-a'),(30,3,46,0,7,NULL),(31,3,49,0,7,'PRODUCTS'),(32,3,58,0,7,'default/pagayo-theme-002'),(33,3,61,0,7,NULL),(34,3,57,1,7,'ae-aeoe-e-se/ae-aeoe-e-a.html'),(35,3,57,0,7,'ae-aeoe-e-se/ae-aeoe-e-a.html'),(38,3,41,0,8,'最新产品'),(39,3,43,0,8,'aeoe-ae-a-a'),(40,3,46,0,8,NULL),(41,3,49,0,8,'PRODUCTS'),(42,3,58,0,8,NULL),(43,3,61,0,8,NULL),(44,3,57,1,8,'aeoe-ae-a-a.html'),(45,3,57,0,8,'aeoe-ae-a-a.html');
/*!40000 ALTER TABLE `catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_flat_store_1`
--

DROP TABLE IF EXISTS `catalog_category_flat_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_flat_store_1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'entity_id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'parent_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'path',
  `position` int(11) NOT NULL COMMENT 'position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'level',
  `children_count` int(11) NOT NULL COMMENT 'children_count',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `all_children` text COMMENT 'All Children',
  `available_sort_by` text COMMENT 'Available Product Listing Sort By',
  `children` text COMMENT 'Children',
  `custom_apply_to_products` int(11) DEFAULT NULL COMMENT 'Apply To Products',
  `custom_design` varchar(255) DEFAULT NULL COMMENT 'Custom Design',
  `custom_design_from` datetime DEFAULT NULL COMMENT 'Active From',
  `custom_design_to` datetime DEFAULT NULL COMMENT 'Active To',
  `custom_layout_update` text COMMENT 'Custom Layout Update',
  `custom_use_parent_settings` int(11) DEFAULT NULL COMMENT 'Use Parent Category Settings',
  `default_sort_by` varchar(255) DEFAULT NULL COMMENT 'Default Product Listing Sort By',
  `description` text COMMENT 'Description',
  `display_mode` varchar(255) DEFAULT NULL COMMENT 'Display Mode',
  `filter_price_range` decimal(12,4) DEFAULT NULL COMMENT 'Layered Navigation Price Step',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `include_in_menu` int(11) DEFAULT NULL COMMENT 'Include in Navigation Menu',
  `is_active` int(11) DEFAULT NULL COMMENT 'Is Active',
  `is_anchor` int(11) DEFAULT NULL COMMENT 'Is Anchor',
  `landing_page` int(11) DEFAULT NULL COMMENT 'CMS Block',
  `meta_description` text COMMENT 'Meta Description',
  `meta_keywords` text COMMENT 'Meta Keywords',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `path_in_store` text COMMENT 'Path In Store',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'Thumbnail Image',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'URL Key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'Url Path',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_PATH` (`path`),
  KEY `IDX_CATALOG_CATEGORY_FLAT_STORE_1_LEVEL` (`level`),
  CONSTRAINT `FK_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_FLAT_STORE_1_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Flat (Store 1)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_flat_store_1`
--

LOCK TABLES `catalog_category_flat_store_1` WRITE;
/*!40000 ALTER TABLE `catalog_category_flat_store_1` DISABLE KEYS */;
INSERT INTO `catalog_category_flat_store_1` VALUES (1,0,'2013-09-21 06:43:16','2013-09-21 06:43:18','1',0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'Root Catalog',NULL,NULL,NULL,NULL,NULL),(2,1,'2013-09-21 06:43:16','2013-09-21 06:43:16','1/2',1,1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'Default Category',NULL,NULL,NULL,NULL,NULL),(6,2,'2013-09-21 07:04:09','2013-09-21 07:04:09','1/2/6',1,2,1,1,NULL,NULL,NULL,0,'default/bluescale',NULL,NULL,NULL,0,NULL,NULL,'PRODUCTS',NULL,NULL,1,1,0,NULL,NULL,NULL,NULL,'手机通讯',NULL,NULL,NULL,'ae-aeoe-e-se','ae-aeoe-e-se.html'),(7,6,'2013-09-21 07:05:21','2013-09-21 07:05:26','1/2/6/7',1,3,0,1,NULL,NULL,NULL,0,'default/bluescale',NULL,NULL,NULL,0,NULL,NULL,'PRODUCTS',NULL,NULL,1,1,0,NULL,NULL,NULL,NULL,'手机配件',NULL,NULL,NULL,'ae-aeoe-e-a','ae-aeoe-e-se/ae-aeoe-e-a.html');
/*!40000 ALTER TABLE `catalog_category_flat_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product`
--

LOCK TABLES `catalog_category_product` WRITE;
/*!40000 ALTER TABLE `catalog_category_product` DISABLE KEYS */;
INSERT INTO `catalog_category_product` VALUES (6,1,1),(6,2,1),(7,4,1),(7,5,1),(7,7,1),(8,1,0),(8,2,0),(8,3,0),(8,4,1),(8,5,1),(8,7,1);
/*!40000 ALTER TABLE `catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `15D3C269665C74C2219037D534F4B0DC` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_CATALOG_CATEGORY_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_PRD_IDX_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CTGR_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index`
--

LOCK TABLES `catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index` DISABLE KEYS */;
INSERT INTO `catalog_category_product_index` VALUES (2,3,0,0,1,4),(2,1,20005,0,1,4),(2,2,20005,0,1,4),(2,4,80001,0,1,4),(2,5,80001,0,1,4),(2,7,80001,0,1,4),(6,1,1,1,1,4),(6,2,1,1,1,4),(7,4,1,1,1,4),(7,5,1,1,1,4),(7,7,1,1,1,4),(8,1,0,1,1,4),(8,2,0,1,1,4),(8,3,0,1,1,4),(8,4,1,1,1,4),(8,5,1,1,1,4),(8,7,1,1,1,4);
/*!40000 ALTER TABLE `catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_IDX_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_idx`
--

LOCK TABLES `catalog_category_product_index_enbl_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_enbl_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_enbl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_ENBL_TMP_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_enbl_tmp`
--

LOCK TABLES `catalog_category_product_index_enbl_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_enbl_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_idx`
--

DROP TABLE IF EXISTS `catalog_category_product_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_IDX_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_idx`
--

LOCK TABLES `catalog_category_product_index_idx` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

LOCK TABLES `catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_compare_item`
--

LOCK TABLES `catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `is_configurable` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Configurable',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_eav_attribute`
--

LOCK TABLES `catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `catalog_eav_attribute` VALUES (41,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(42,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(43,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(44,NULL,0,1,0,0,0,0,1,0,0,0,0,1,NULL,0,0,1,0),(45,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(47,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(51,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(52,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(53,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(54,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(57,NULL,0,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(58,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(59,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(63,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(64,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(65,'adminhtml/catalog_category_helper_sortby_available',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(66,'adminhtml/catalog_category_helper_sortby_default',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(67,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(68,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(70,'adminhtml/catalog_category_helper_pricestep',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(71,NULL,0,1,1,0,0,0,0,0,0,1,1,1,NULL,1,0,0,0),(72,NULL,0,1,1,0,1,0,1,0,0,0,0,1,NULL,1,0,1,0),(73,NULL,0,1,1,0,1,0,1,0,0,1,0,1,NULL,1,0,1,0),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,1,NULL,1,0,0,0),(75,NULL,2,1,1,1,0,0,0,0,0,1,1,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0),(76,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(77,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(78,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(79,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'virtual,downloadable',0,0,0,0),(80,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'simple,bundle',0,0,0,0),(81,NULL,1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0),(82,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(83,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(86,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(88,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(89,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(90,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(91,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(92,NULL,1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0),(93,NULL,2,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(95,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(96,NULL,2,1,1,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(97,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(99,NULL,0,0,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(100,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(101,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(105,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(107,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(109,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(110,NULL,1,0,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(111,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(112,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(113,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(114,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(115,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(116,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(117,NULL,2,1,0,0,0,0,0,0,0,0,0,0,'simple,configurable,bundle,grouped',0,0,0,0),(118,'adminhtml/catalog_product_helper_form_msrp_enabled',2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(119,'adminhtml/catalog_product_helper_form_msrp_price',2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(120,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(121,NULL,1,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0),(122,NULL,2,1,1,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,downloadable,bundle',1,0,0,0),(123,'giftmessage/adminhtml_product_helper_form_config',1,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0),(124,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(125,NULL,1,0,0,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0),(126,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(127,NULL,1,1,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(129,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0),(130,NULL,0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(131,NULL,0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(132,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0),(133,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0);
/*!40000 ALTER TABLE `catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option`
--

LOCK TABLES `catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  CONSTRAINT `FK_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_option_value`
--

LOCK TABLES `catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_price_index`
--

LOCK TABLES `catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection`
--

LOCK TABLES `catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_selection_price`
--

LOCK TABLES `catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_bundle_stock_index`
--

LOCK TABLES `catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_enabled_index`
--

DROP TABLE IF EXISTS `catalog_product_enabled_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENABLED_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Visibility Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_enabled_index`
--

LOCK TABLES `catalog_product_enabled_index` WRITE;
/*!40000 ALTER TABLE `catalog_product_enabled_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_enabled_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `FK_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity`
--

LOCK TABLES `catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity` DISABLE KEYS */;
INSERT INTO `catalog_product_entity` VALUES (1,4,4,'simple','m_samsung_n7100',0,0,'2013-09-21 07:10:47','2013-09-21 07:31:28'),(2,4,4,'simple','ip_4',0,0,'2013-09-21 07:12:23','2013-09-21 07:20:51'),(3,4,4,'simple','V2ROCK',0,0,'2013-09-21 07:33:39','2013-09-21 07:33:39'),(4,4,4,'simple','RUSB2-2A',0,0,'2013-09-21 07:36:42','2013-09-21 07:36:42'),(5,4,4,'simple','99',0,0,'2013-09-26 07:22:13','2013-09-26 07:22:13'),(7,4,4,'simple','ssss',0,0,'2013-09-26 07:33:25','2013-09-26 07:33:25');
/*!40000 ALTER TABLE `catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

LOCK TABLES `catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_datetime` VALUES (1,4,93,0,1,NULL),(2,4,94,0,1,NULL),(3,4,77,0,1,NULL),(4,4,78,0,1,NULL),(5,4,104,0,1,NULL),(6,4,105,0,1,NULL),(7,4,93,0,2,NULL),(8,4,94,0,2,NULL),(9,4,77,0,2,NULL),(10,4,78,0,2,NULL),(11,4,104,0,2,NULL),(12,4,105,0,2,NULL),(43,4,93,0,3,NULL),(44,4,94,0,3,NULL),(45,4,77,0,3,NULL),(46,4,78,0,3,NULL),(47,4,104,0,3,NULL),(48,4,105,0,3,NULL),(49,4,93,0,4,NULL),(50,4,94,0,4,NULL),(51,4,77,0,4,NULL),(52,4,78,0,4,NULL),(53,4,104,0,4,NULL),(54,4,105,0,4,NULL),(55,4,93,0,5,NULL),(56,4,94,0,5,NULL),(57,4,77,0,5,NULL),(58,4,78,0,5,NULL),(59,4,104,0,5,NULL),(60,4,105,0,5,NULL),(85,4,93,0,7,NULL),(86,4,94,0,7,NULL),(87,4,77,0,7,NULL),(88,4,78,0,7,NULL),(89,4,104,0,7,NULL),(90,4,105,0,7,NULL);
/*!40000 ALTER TABLE `catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

LOCK TABLES `catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_decimal` VALUES (1,4,80,0,1,1.0000),(2,4,75,0,1,3899.0000),(3,4,76,0,1,NULL),(4,4,120,0,1,NULL),(5,4,80,0,2,2.0000),(6,4,75,0,2,4000.0000),(7,4,76,0,2,NULL),(8,4,120,0,2,NULL),(24,4,80,0,3,2.0000),(25,4,75,0,3,23.0000),(26,4,76,0,3,NULL),(27,4,120,0,3,NULL),(28,4,80,0,4,2.0000),(29,4,75,0,4,122.0000),(30,4,76,0,4,NULL),(31,4,120,0,4,NULL),(32,4,80,0,5,90.0000),(33,4,75,0,5,7999.0000),(34,4,76,0,5,NULL),(35,4,120,0,5,NULL),(49,4,80,0,7,233.0000),(50,4,75,0,7,2333.0000),(51,4,76,0,7,NULL),(52,4,120,0,7,NULL);
/*!40000 ALTER TABLE `catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_GLR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_gallery`
--

LOCK TABLES `catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_group_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_group_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CC12C83765B562314470A24F2BDD0F36` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DF909D22C11B60B1E5E3EE64AB220ECE` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_group_price`
--

LOCK TABLES `catalog_product_entity_group_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_group_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_group_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_int`
--

LOCK TABLES `catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_int` VALUES (1,4,96,0,1,1),(2,4,102,0,1,4),(3,4,121,0,1,1),(4,4,122,0,1,2),(5,4,100,0,1,0),(6,4,96,0,2,1),(7,4,102,0,2,4),(8,4,121,0,2,1),(9,4,122,0,2,2),(10,4,100,0,2,0),(11,4,96,0,3,1),(12,4,102,0,3,4),(13,4,121,0,3,1),(14,4,122,0,3,2),(15,4,100,0,3,0),(16,4,96,0,4,1),(17,4,102,0,4,4),(18,4,121,0,4,1),(19,4,122,0,4,2),(20,4,100,0,4,0),(21,4,96,0,5,1),(22,4,102,0,5,4),(23,4,121,0,5,1),(24,4,122,0,5,2),(25,4,100,0,5,0),(31,4,96,0,7,1),(32,4,102,0,7,4),(33,4,121,0,7,1),(34,4,122,0,7,2),(35,4,100,0,7,0);
/*!40000 ALTER TABLE `catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

LOCK TABLES `catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery` VALUES (1,88,2,'/0/4/04-136-988.jpg'),(2,88,2,'/0/4/04-136-988-01.jpg'),(3,88,1,'/2/1/21-106-126.jpg'),(4,88,3,'/1/_/1.jpg'),(5,88,4,'/2/_/2.jpg'),(6,88,5,'/9/9/99.jpg'),(9,88,7,'/5/5/5555_1.jpg');
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

LOCK TABLES `catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_media_gallery_value` VALUES (1,0,'IPhone4',1,0),(2,0,NULL,2,0),(3,0,NULL,1,0),(4,0,NULL,1,0),(5,0,NULL,1,0),(6,0,NULL,1,0),(9,0,NULL,1,0);
/*!40000 ALTER TABLE `catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_text`
--

LOCK TABLES `catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_text` VALUES (1,4,72,0,1,'温馨提示：三星Note2原装包含——主机*1， 锂电池*1， 数据线*1， 耳机*1， 充电器*1， S Pen手写笔*1， 说明书*1， 保修卡*1\r\n超值套餐\r\nNote2作为“大脸型”手机代表，耗电量较大，建议一同购买原装电池作为能量补充，手机全天尽情用！'),(2,4,73,0,1,'温馨提示：三星Note2原装包含——主机*1， 锂电池*1， 数据线*1， 耳机*1， 充电器*1， S Pen手写笔*1， 说明书*1， 保修卡*1\r\n超值套餐\r\nNote2作为“大脸型”手机代表，耗电量较大，建议一同购买原装电池作为能量补充，手机全天尽情用！'),(3,4,83,0,1,NULL),(4,4,106,0,1,NULL),(5,4,72,0,2,'Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A'),(6,4,73,0,2,'Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A'),(7,4,83,0,2,NULL),(8,4,106,0,2,NULL),(19,4,72,0,3,'V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线\r\n'),(20,4,73,0,3,'V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线\r\n'),(21,4,83,0,3,NULL),(22,4,106,0,3,NULL),(23,4,72,0,4,'RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器\r\n'),(24,4,73,0,4,'RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器\r\n'),(25,4,83,0,4,NULL),(26,4,106,0,4,NULL),(27,4,72,0,5,'Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)\r\n'),(28,4,73,0,5,'Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)\r\n'),(29,4,83,0,5,NULL),(30,4,106,0,5,NULL),(43,4,72,0,7,'Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）  \r\n'),(44,4,73,0,7,'Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）  \r\n'),(45,4,83,0,7,NULL),(46,4,106,0,7,NULL);
/*!40000 ALTER TABLE `catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_6E08D719F0501DD1D8E6D4EFF2511C85` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_tier_price`
--

LOCK TABLES `catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

LOCK TABLES `catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `catalog_product_entity_varchar` VALUES (1,4,71,0,1,'Samsung 三星 N7100 GALAXY Note2 16G 3G（GSM/WCDMA）'),(2,4,97,0,1,'samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma'),(3,4,117,0,1,'CN'),(4,4,118,0,1,'2'),(5,4,119,0,1,'4'),(6,4,82,0,1,NULL),(7,4,84,0,1,NULL),(8,4,85,0,1,'/2/1/21-106-126.jpg'),(9,4,86,0,1,'/2/1/21-106-126.jpg'),(10,4,87,0,1,'/2/1/21-106-126.jpg'),(11,4,103,0,1,NULL),(12,4,107,0,1,NULL),(13,4,109,0,1,'container2'),(14,4,123,0,1,NULL),(15,4,98,1,1,'samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(16,4,98,0,1,'samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(17,4,71,0,2,'Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A'),(18,4,97,0,2,'apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a'),(19,4,117,0,2,'CN'),(20,4,118,0,2,'2'),(21,4,119,0,2,'4'),(22,4,82,0,2,NULL),(23,4,84,0,2,NULL),(24,4,85,0,2,'/0/4/04-136-988-01.jpg'),(25,4,86,0,2,'/0/4/04-136-988.jpg'),(26,4,87,0,2,'/0/4/04-136-988.jpg'),(27,4,103,0,2,NULL),(28,4,107,0,2,NULL),(29,4,109,0,2,'container2'),(30,4,123,0,2,NULL),(31,4,98,1,2,'apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(32,4,98,0,2,'apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(43,4,112,0,2,NULL),(44,4,113,0,2,'IPhone4'),(45,4,114,0,2,'IPhone4'),(61,4,112,0,1,NULL),(62,4,113,0,1,NULL),(63,4,114,0,1,NULL),(72,4,71,0,3,'V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线 '),(73,4,97,0,3,'v2rock-iphone-4-4s-ipad-2-usb'),(74,4,117,0,3,'CN'),(75,4,118,0,3,'2'),(76,4,119,0,3,'4'),(77,4,82,0,3,NULL),(78,4,84,0,3,NULL),(79,4,85,0,3,'/1/_/1.jpg'),(80,4,86,0,3,'/1/_/1.jpg'),(81,4,87,0,3,'/1/_/1.jpg'),(82,4,103,0,3,NULL),(83,4,107,0,3,NULL),(84,4,109,0,3,'container2'),(85,4,123,0,3,NULL),(86,4,112,0,3,NULL),(87,4,113,0,3,NULL),(88,4,114,0,3,NULL),(89,4,98,1,3,'v2rock-iphone-4-4s-ipad-2-usb.html'),(90,4,98,0,3,'v2rock-iphone-4-4s-ipad-2-usb.html'),(91,4,71,0,4,'RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器 '),(92,4,97,0,4,'ruien-rusb2-2a-ipad-2-iphone-ipod-usb'),(93,4,117,0,4,'CN'),(94,4,118,0,4,'2'),(95,4,119,0,4,'4'),(96,4,82,0,4,NULL),(97,4,84,0,4,NULL),(98,4,85,0,4,'/2/_/2.jpg'),(99,4,86,0,4,'/2/_/2.jpg'),(100,4,87,0,4,'/2/_/2.jpg'),(101,4,103,0,4,NULL),(102,4,107,0,4,NULL),(103,4,109,0,4,'container2'),(104,4,123,0,4,NULL),(105,4,112,0,4,NULL),(106,4,113,0,4,NULL),(107,4,114,0,4,NULL),(108,4,98,1,4,'ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html'),(109,4,98,0,4,'ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html'),(110,4,71,0,5,'Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座) '),(111,4,97,0,5,'skyworth-42e5chr-42-led'),(112,4,117,0,5,'CN'),(113,4,118,0,5,'2'),(114,4,119,0,5,'4'),(115,4,82,0,5,NULL),(116,4,84,0,5,NULL),(117,4,85,0,5,'/9/9/99.jpg'),(118,4,86,0,5,'/9/9/99.jpg'),(119,4,87,0,5,'/9/9/99.jpg'),(120,4,103,0,5,NULL),(121,4,107,0,5,NULL),(122,4,109,0,5,'container2'),(123,4,123,0,5,NULL),(124,4,112,0,5,NULL),(125,4,113,0,5,NULL),(126,4,114,0,5,NULL),(127,4,98,1,5,'skyworth-42e5chr-42-led.html'),(128,4,98,0,5,'skyworth-42e5chr-42-led.html'),(177,4,71,0,7,'Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）   '),(178,4,97,0,7,'sony-kdl-50r556a-50-3d-2013'),(179,4,117,0,7,'CN'),(180,4,118,0,7,'2'),(181,4,119,0,7,'4'),(182,4,82,0,7,NULL),(183,4,84,0,7,NULL),(184,4,85,0,7,'/5/5/5555_1.jpg'),(185,4,86,0,7,'/5/5/5555_1.jpg'),(186,4,87,0,7,'/5/5/5555_1.jpg'),(187,4,103,0,7,NULL),(188,4,107,0,7,NULL),(189,4,109,0,7,'container2'),(190,4,123,0,7,NULL),(191,4,112,0,7,NULL),(192,4,113,0,7,NULL),(193,4,114,0,7,NULL),(194,4,98,1,7,'sony-kdl-50r556a-50-3d-2013.html'),(195,4,98,0,7,'sony-kdl-50r556a-50-3d-2013.html');
/*!40000 ALTER TABLE `catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_flat_1`
--

DROP TABLE IF EXISTS `catalog_product_flat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_flat_1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'entity_id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'attribute_set_id',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'type_id',
  `cost` decimal(12,4) DEFAULT NULL COMMENT 'cost',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `enable_googlecheckout` smallint(6) DEFAULT NULL COMMENT 'enable_googlecheckout',
  `gift_message_available` smallint(6) DEFAULT NULL COMMENT 'gift_message_available',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'has_options',
  `image_label` varchar(255) DEFAULT NULL COMMENT 'image_label',
  `is_recurring` smallint(6) DEFAULT NULL COMMENT 'is_recurring',
  `links_exist` int(11) DEFAULT NULL COMMENT 'links_exist',
  `links_purchased_separately` int(11) DEFAULT NULL COMMENT 'links_purchased_separately',
  `links_title` varchar(255) DEFAULT NULL COMMENT 'links_title',
  `msrp` decimal(12,4) DEFAULT NULL COMMENT 'msrp',
  `msrp_display_actual_price_type` varchar(255) DEFAULT NULL COMMENT 'msrp_display_actual_price_type',
  `msrp_enabled` smallint(6) DEFAULT NULL COMMENT 'msrp_enabled',
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  `news_from_date` datetime DEFAULT NULL COMMENT 'news_from_date',
  `news_to_date` datetime DEFAULT NULL COMMENT 'news_to_date',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'price',
  `price_type` int(11) DEFAULT NULL COMMENT 'price_type',
  `price_view` int(11) DEFAULT NULL COMMENT 'price_view',
  `recurring_profile` text COMMENT 'recurring_profile',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'required_options',
  `shipment_type` int(11) DEFAULT NULL COMMENT 'shipment_type',
  `short_description` text COMMENT 'short_description',
  `sku` varchar(64) DEFAULT NULL COMMENT 'sku',
  `sku_type` int(11) DEFAULT NULL COMMENT 'sku_type',
  `small_image` varchar(255) DEFAULT NULL COMMENT 'small_image',
  `small_image_label` varchar(255) DEFAULT NULL COMMENT 'small_image_label',
  `special_from_date` datetime DEFAULT NULL COMMENT 'special_from_date',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'special_price',
  `special_to_date` datetime DEFAULT NULL COMMENT 'special_to_date',
  `tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'tax_class_id',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'thumbnail',
  `thumbnail_label` varchar(255) DEFAULT NULL COMMENT 'thumbnail_label',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'url_key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'url_path',
  `visibility` smallint(5) unsigned DEFAULT NULL COMMENT 'visibility',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'weight',
  `weight_type` int(11) DEFAULT NULL COMMENT 'weight_type',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_FLAT_1_TYPE_ID` (`type_id`),
  KEY `IDX_CATALOG_PRODUCT_FLAT_1_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_CATALOG_PRODUCT_FLAT_1_NAME` (`name`),
  KEY `IDX_CATALOG_PRODUCT_FLAT_1_PRICE` (`price`),
  CONSTRAINT `FK_CAT_PRD_FLAT_1_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Flat (Store 1)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_flat_1`
--

LOCK TABLES `catalog_product_flat_1` WRITE;
/*!40000 ALTER TABLE `catalog_product_flat_1` DISABLE KEYS */;
INSERT INTO `catalog_product_flat_1` VALUES (1,4,'simple',NULL,'2013-09-21 07:10:47',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'Samsung 三星 N7100 GALAXY Note2 16G 3G（GSM/WCDMA）',NULL,NULL,3899.0000,NULL,NULL,NULL,0,NULL,'温馨提示：三星Note2原装包含——主机*1， 锂电池*1， 数据线*1， 耳机*1， 充电器*1， S Pen手写笔*1， 说明书*1， 保修卡*1\r\n超值套餐\r\nNote2作为“大脸型”手机代表，耗电量较大，建议一同购买原装电池作为能量补充，手机全天尽情用！','m_samsung_n7100',NULL,'/2/1/21-106-126.jpg',NULL,NULL,NULL,NULL,2,'/2/1/21-106-126.jpg',NULL,'2013-09-21 07:31:28','samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma','samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html',4,1.0000,NULL),(2,4,'simple',NULL,'2013-09-21 07:12:23',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A',NULL,NULL,4000.0000,NULL,NULL,NULL,0,NULL,'Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A','ip_4',NULL,'/0/4/04-136-988.jpg','IPhone4',NULL,NULL,NULL,2,'/0/4/04-136-988.jpg','IPhone4','2013-09-21 07:20:51','apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a','apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html',4,2.0000,NULL),(3,4,'simple',NULL,'2013-09-21 07:33:39',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线 ',NULL,NULL,23.0000,NULL,NULL,NULL,0,NULL,'V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线\r\n','V2ROCK',NULL,'/1/_/1.jpg',NULL,NULL,NULL,NULL,2,'/1/_/1.jpg',NULL,'2013-09-21 07:33:39','v2rock-iphone-4-4s-ipad-2-usb','v2rock-iphone-4-4s-ipad-2-usb.html',4,2.0000,NULL),(4,4,'simple',NULL,'2013-09-21 07:36:42',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器 ',NULL,NULL,122.0000,NULL,NULL,NULL,0,NULL,'RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器\r\n','RUSB2-2A',NULL,'/2/_/2.jpg',NULL,NULL,NULL,NULL,2,'/2/_/2.jpg',NULL,'2013-09-21 07:36:42','ruien-rusb2-2a-ipad-2-iphone-ipod-usb','ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html',4,2.0000,NULL),(5,4,'simple',NULL,'2013-09-26 07:22:13',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座) ',NULL,NULL,7999.0000,NULL,NULL,NULL,0,NULL,'Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)\r\n','99',NULL,'/9/9/99.jpg',NULL,NULL,NULL,NULL,2,'/9/9/99.jpg',NULL,'2013-09-26 07:22:13','skyworth-42e5chr-42-led','skyworth-42e5chr-42-led.html',4,90.0000,NULL),(7,4,'simple',NULL,'2013-09-26 07:33:25',1,NULL,0,NULL,0,NULL,NULL,NULL,NULL,'4',2,'Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）   ',NULL,NULL,2333.0000,NULL,NULL,NULL,0,NULL,'Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）  \r\n','ssss',NULL,'/5/5/5555_1.jpg',NULL,NULL,NULL,NULL,2,'/5/5/5555_1.jpg',NULL,'2013-09-26 07:33:25','sony-kdl-50r556a-50-3d-2013','sony-kdl-50r556a-50-3d-2013.html',4,233.0000,NULL);
/*!40000 ALTER TABLE `catalog_product_flat_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`),
  CONSTRAINT `FK_CATALOG_PRODUCT_INDEX_EAV_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_EAV_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_EAV_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav`
--

LOCK TABLES `catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav` VALUES (1,122,1,2),(2,122,1,2),(3,122,1,2),(4,122,1,2),(5,122,1,2),(7,122,1,2);
/*!40000 ALTER TABLE `catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`),
  CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_EAV_DEC_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal`
--

LOCK TABLES `catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

LOCK TABLES `catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav_idx` VALUES (1,122,1,2),(2,122,1,2);
/*!40000 ALTER TABLE `catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

LOCK TABLES `catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` DISABLE KEYS */;
INSERT INTO `catalog_product_index_eav_tmp` VALUES (7,122,1,2);
/*!40000 ALTER TABLE `catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_group_price`
--

DROP TABLE IF EXISTS `catalog_product_index_group_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_group_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_195DF97C81B0BDD6A2EEC50F870E16D1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_group_price`
--

LOCK TABLES `catalog_product_index_group_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_group_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_group_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `IDX_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`),
  CONSTRAINT `FK_CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price`
--

LOCK TABLES `catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price` VALUES (1,0,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,1,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,2,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,3,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(2,0,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,1,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,2,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,3,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(3,0,1,2,23.0000,23.0000,23.0000,23.0000,NULL,NULL),(3,1,1,2,23.0000,23.0000,23.0000,23.0000,NULL,NULL),(3,2,1,2,23.0000,23.0000,23.0000,23.0000,NULL,NULL),(3,3,1,2,23.0000,23.0000,23.0000,23.0000,NULL,NULL),(4,0,1,2,122.0000,122.0000,122.0000,122.0000,NULL,NULL),(4,1,1,2,122.0000,122.0000,122.0000,122.0000,NULL,NULL),(4,2,1,2,122.0000,122.0000,122.0000,122.0000,NULL,NULL),(4,3,1,2,122.0000,122.0000,122.0000,122.0000,NULL,NULL),(5,0,1,2,7999.0000,7999.0000,7999.0000,7999.0000,NULL,NULL),(5,1,1,2,7999.0000,7999.0000,7999.0000,7999.0000,NULL,NULL),(5,2,1,2,7999.0000,7999.0000,7999.0000,7999.0000,NULL,NULL),(5,3,1,2,7999.0000,7999.0000,7999.0000,7999.0000,NULL,NULL),(7,0,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,1,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,2,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,3,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL);
/*!40000 ALTER TABLE `catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_idx`
--

LOCK TABLES `catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_idx`
--

LOCK TABLES `catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_final_tmp`
--

LOCK TABLES `catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_idx`
--

LOCK TABLES `catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_idx` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price_idx` VALUES (1,0,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,1,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,2,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(1,3,1,2,3899.0000,3899.0000,3899.0000,3899.0000,NULL,NULL),(2,0,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,1,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,2,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL),(2,3,1,2,4000.0000,4000.0000,4000.0000,4000.0000,NULL,NULL);
/*!40000 ALTER TABLE `catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_idx`
--

LOCK TABLES `catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_opt_tmp`
--

LOCK TABLES `catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

LOCK TABLES `catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` DISABLE KEYS */;
INSERT INTO `catalog_product_index_price_tmp` VALUES (7,0,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,1,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,2,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL),(7,3,1,2,2333.0000,2333.0000,2333.0000,2333.0000,NULL,NULL);
/*!40000 ALTER TABLE `catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_tier_price`
--

LOCK TABLES `catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `FK_CAT_PRD_IDX_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_index_website`
--

LOCK TABLES `catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `catalog_product_index_website` VALUES (1,'2013-09-26',1);
/*!40000 ALTER TABLE `catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `FK_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link`
--

LOCK TABLES `catalog_product_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `FK_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute`
--

LOCK TABLES `catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,3,'position','int'),(3,3,'qty','decimal'),(4,4,'position','int'),(5,5,'position','int');
/*!40000 ALTER TABLE `catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_decimal`
--

LOCK TABLES `catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_PRODUCT_LINK_ATTRIBUTE_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `FK_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

LOCK TABLES `catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `FK_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_attribute_varchar`
--

LOCK TABLES `catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_link_type`
--

LOCK TABLES `catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option`
--

LOCK TABLES `catalog_product_option` WRITE;
/*!40000 ALTER TABLE `catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_price`
--

LOCK TABLES `catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_title`
--

LOCK TABLES `catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_OPT_TYPE_PRICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_price`
--

LOCK TABLES `catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_OPT_TYPE_TTL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_title`
--

LOCK TABLES `catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `FK_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_option_type_value`
--

LOCK TABLES `catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `FK_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_relation`
--

LOCK TABLES `catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute`
--

LOCK TABLES `catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `IDX_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_SPR_ATTR_LBL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_label`
--

LOCK TABLES `catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) DEFAULT NULL COMMENT 'Value Index',
  `is_percent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID_VAL_IDX_WS_ID` (`product_super_attribute_id`,`value_index`,`website_id`),
  KEY `IDX_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRICING_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CDE8813117106CFAA3AD209358F66332` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_attribute_pricing`
--

LOCK TABLES `catalog_product_super_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_super_link`
--

LOCK TABLES `catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_website`
--

LOCK TABLES `catalog_product_website` WRITE;
/*!40000 ALTER TABLE `catalog_product_website` DISABLE KEYS */;
INSERT INTO `catalog_product_website` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1);
/*!40000 ALTER TABLE `catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock`
--

LOCK TABLES `cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock` VALUES (1,'Default');
/*!40000 ALTER TABLE `cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `UNQ_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `FK_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_item`
--

LOCK TABLES `cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_item` VALUES (1,1,1,100.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(2,2,1,110.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(3,3,1,122.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(4,4,1,1222.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(5,5,1,8000.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(7,7,1,2220.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0);
/*!40000 ALTER TABLE `cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CATINV_STOCK_STS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATINV_STOCK_STS_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATINV_STOCK_STS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status`
--

LOCK TABLES `cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_status` VALUES (1,1,1,100.0000,1),(2,1,1,110.0000,1),(3,1,1,122.0000,1),(4,1,1,1222.0000,1),(5,1,1,8000.0000,1),(7,1,1,2220.0000,1);
/*!40000 ALTER TABLE `cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

LOCK TABLES `cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` DISABLE KEYS */;
INSERT INTO `cataloginventory_stock_status_idx` VALUES (1,1,1,100.0000,1),(2,1,1,110.0000,1);
/*!40000 ALTER TABLE `cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cataloginventory_stock_status_tmp`
--

LOCK TABLES `cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule`
--

LOCK TABLES `catalogrule` WRITE;
/*!40000 ALTER TABLE `catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_affected_product`
--

DROP TABLE IF EXISTS `catalogrule_affected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_affected_product`
--

LOCK TABLES `catalogrule_affected_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_affected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_affected_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_customer_group`
--

LOCK TABLES `catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_group_website`
--

LOCK TABLES `catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `IDX_CATALOGRULE_PRODUCT_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_PRD_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product`
--

LOCK TABLES `catalogrule_product` WRITE;
/*!40000 ALTER TABLE `catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `UNQ_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_PRD_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATRULE_PRD_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_product_price`
--

LOCK TABLES `catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_CATALOGRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATALOGRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogrule_website`
--

LOCK TABLES `catalogrule_website` WRITE;
/*!40000 ALTER TABLE `catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_fulltext` (
  `fulltext_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`fulltext_id`),
  UNIQUE KEY `UNQ_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`),
  FULLTEXT KEY `FTI_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_fulltext`
--

LOCK TABLES `catalogsearch_fulltext` WRITE;
/*!40000 ALTER TABLE `catalogsearch_fulltext` DISABLE KEYS */;
INSERT INTO `catalogsearch_fulltext` VALUES (9,1,1,'m_samsung_n7100|Enabled|Taxable Goods|Samsung 三星 N7100 GALAXY Note2 16G 3G（GSM/WCDMA）|温馨提示：三星Note2原装包含——主机*1， 锂电池*1， 数据线*1， 耳机*1， 充电器*1， S Pen手写笔*1， 说明书*1， 保修卡*1 超值套餐 Note2作为“大脸型”手机代表，耗电量较大，建议一同购买原装电池作为能量补充，手机全天尽情用！|温馨提示：三星Note2原装包含——主机*1， 锂电池*1， 数据线*1， 耳机*1， 充电器*1， S Pen手写笔*1， 说明书*1， 保修卡*1 超值套餐 Note2作为“大脸型”手机代表，耗电量较大，建议一同购买原装电池作为能量补充，手机全天尽情用！|3899|1'),(8,2,1,'ip_4|Enabled|Taxable Goods|Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A|Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A|Apple 苹果 iphone 4（8G）3G（GSM/WCDMA）手机 黑色 MD128CH/A|4000|1'),(10,3,1,'V2ROCK|Enabled|Taxable Goods|V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线|V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线|V2ROCK 唯图诺克 iPhone 4/4S/iPad 2 USB数据线|23|1'),(11,4,1,'RUSB2-2A|Enabled|Taxable Goods|RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器|RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器|RUIEN 瑞能 RUSB2-2A iPad 2/iPhone/iPod 双USB接口 电源充电器|122|1'),(12,5,1,'99|Enabled|Taxable Goods|Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)|Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)|Skyworth 创维42E5CHR 42英寸LED液晶电视(内置底座)|7999|1'),(13,7,1,'ssss|Enabled|Taxable Goods|Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）|Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）|Sony 索尼KDL-50R556A 50英寸全高清智能3D液晶电视（2013年新款）|2333|1');
/*!40000 ALTER TABLE `catalogsearch_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_query`
--

DROP TABLE IF EXISTS `catalogsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  KEY `IDX_CATALOGSEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `IDX_CATALOGSEARCH_QUERY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CATALOGSEARCH_QUERY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_query`
--

LOCK TABLES `catalogsearch_query` WRITE;
/*!40000 ALTER TABLE `catalogsearch_query` DISABLE KEYS */;
INSERT INTO `catalogsearch_query` VALUES (1,'apple',1,1,NULL,NULL,1,1,1,0,'2013-09-26 15:22:13'),(2,'www',0,2,NULL,NULL,1,1,1,0,'2013-09-26 15:22:13'),(3,'iphone',3,2,NULL,NULL,1,1,1,0,'2013-09-26 15:22:13');
/*!40000 ALTER TABLE `catalogsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogsearch_result`
--

DROP TABLE IF EXISTS `catalogsearch_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL COMMENT 'Query ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `relevance` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Relevance',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_CATALOGSEARCH_RESULT_QUERY_ID` (`query_id`),
  KEY `IDX_CATALOGSEARCH_RESULT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CATALOGSEARCH_RESULT_QUERY_ID_CATALOGSEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CATSRCH_RESULT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogsearch_result`
--

LOCK TABLES `catalogsearch_result` WRITE;
/*!40000 ALTER TABLE `catalogsearch_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogsearch_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement`
--

LOCK TABLES `checkout_agreement` WRITE;
/*!40000 ALTER TABLE `checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_agreement_store`
--

LOCK TABLES `checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES (1,'Footer Links','footer_links','<ul>\r\n<li><a href=\"{{store direct_url=\"about-magento-demo-store\"}}\">About Us</a></li>\r\n<li><a href=\"{{store direct_url=\"customer-service\"}}\">Customer Service</a></li>\r\n<li class=\"last privacy\"><a href=\"{{store direct_url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy</a></li>\r\n</ul>','2013-09-21 06:43:09','2013-09-21 06:43:09',1),(2,'left_info_block','left_info_block','<div>{{block type=\"newsletter/subscribe\" name=\"right.newsletter.static\" template=\"newsletter/subscribe.phtml\"}}</div>','2013-09-21 07:22:49','2013-09-21 07:22:49',1),(3,'right_info_block','right_info_block','<div>{{block type=\"catalog/product_popular\"   template=\"catalog/product/popular.phtml\" category_id=\"PopularProductsCategoryID\"}}</div>','2013-09-21 07:23:13','2013-09-21 07:23:13',1),(4,'home_page_footer_block','home_page_footer_block','<div class=\"join_us_block\">\r\n<a class=\"join\" href=\"#\">Become a Fan on <strong>Facebook</strong></a>\r\n<a class=\"join\" href=\"#\">Follow Us on<strong>Twitter</strong></a>\r\n<a class=\"join\" href=\"#\">Join our <strong>Mailing List</strong></a>\r\n</div>','2013-09-21 07:23:30','2013-09-21 07:23:30',1),(5,'header_phone_block','header_phone_block','<div class=\"head_phone_block\"> <p class=\"phone\"><small>Call Us: (+1)</small> 253-243-2001</p> </div>','2013-09-21 07:23:50','2013-09-21 07:23:50',1),(6,'search_block_content','search_block_content','<p><span><strong>Get your 30% OFF!</strong>On all Order over $500</span></p> ','2013-09-21 07:24:07','2013-09-21 07:24:07',1),(7,'home_page_left_block','home_page_left_block','<div class=\"block block-popular\">\r\n  <div class=\"block-title\"><strong><span>What\'s New</span></strong></div>\r\n  <div class=\"block-content\">\r\n    <p style=\"text-align: center;\"><a href=\"#\"><img src=\"{{media url=\"bluescale/promotion.jpg\"}}\" alt=\"\" /></a></p>\r\n  </div>\r\n</div>','2013-09-21 07:24:20','2013-09-21 07:24:20',1),(8,'footer_links_2','footer_links_2','<div class=\"footer_block\">\r\n  <div class=\"links_block clearfix\">\r\n    <div class=\"clearfix\"><a class=\"title\" href=\"#\">Company Information</a>\r\n      <ul>\r\n        <li><a href=\"#\">About Us</a></li>\r\n        <li><a href=\"#\">Our Store Hours</a></li>\r\n        <li><a href=\"#\">Directions</a></li>\r\n        <li><a href=\"#\">Privacy Policy</a></li>\r\n        <li><a href=\"#\">Legal Information</a></li>\r\n      </ul>\r\n    </div>\r\n    <div><a class=\"title\" href=\"#\">Customer Service</a>\r\n      <ul>\r\n        <li><a href=\"#\">Ordering Information</a></li>\r\n        <li><a href=\"#\">Delivery & Rates</a></li>\r\n        <li><a href=\"#\">Cancellations & Returns</a></li>\r\n        <li><a href=\"#\">School & Government</a></li>\r\n        <li><a href=\"#\">Contact Us</a></li>\r\n      </ul>\r\n    </div>\r\n    <div class=\"last\"><a class=\"title\" href=\"#\">Useful Tips and Information</a>\r\n      <ul>\r\n        <li><a href=\"#\">Product Measurements</a></li>\r\n        <li><a href=\"#\">Customer Testimonials</a></li>\r\n        <li><a href=\"#\">Our Blog</a></li>\r\n        <li><a href=\"#\">Site Map</a></li>\r\n      </ul>\r\n    </div>\r\n  </div>\r\n</div>\r\n','2013-09-21 07:24:58','2013-09-21 07:24:58',1),(9,'Follow us','pt002-footer-social','<ul class=\"social-icons\">\n                	<li><a href=\"#\" title=\"facebook\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-facebook.png\"}}\" alt=\"facebook\"/></a></li>\n                	<li><a href=\"#\" title=\"twitter\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-twitter.png\"}}\" alt=\"twitter\"/></a></li>\n                	<li><a href=\"#\" title=\"googleplus\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-googleplus.png\"}}\" alt=\"googleplus\"/></a></li>\n                	<li><a href=\"#\" title=\"youtube\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-youtube.png\"}}\" alt=\"youtube\"/></a></li>\n                	<li><a href=\"#\" title=\"vimeo\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-vimeo.png\"}}\" alt=\"vimeo\"/></a></li>\n                	<li><a href=\"#\" title=\"pinterest\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-social-pinterest.png\"}}\" alt=\"pinterest\"/></a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(10,'Customer Service','pt002-footer-box1','<ul>\n                	<li><a href=\"{{store url=\"customer-service\"}}\">Customer Service</a></li>\n                	<li><a href=\"{{store url=\"sales/guest/form\"}}\">Orders and Returns</a></li>\n                	<li><a href=\"{{store url=\"customer-service\"}}\">Shipping and Delivery</a></li>\n                	<li><a href=\"{{store url=\"catalog/seo_sitemap/category\"}}\">Sitemap</a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(11,'About Us','pt002-footer-box2','<ul>\n                	<li><a href=\"{{store url=\"about-magento-demo-store\"}}\">About Us</a></li>\n                	<li><a href=\"{{store url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy</a></li>\n                	<li><a href=\"{{store url=\"contacts\"}}\">Contact Us</a></li>\n                	<li><a href=\"{{store url=\"customer-service\"}}\">Shopping Infos</a></li>	\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(12,'New Products','pt002-footer-box3','<ul>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(13,'Popular','pt002-footer-box4','<ul>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                	<li><a href=\"{{store url=\"#\"}}\">Textlink</a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(14,'My Account','pt002-footer-box5','<ul>\n                	<li><a href=\"{{store url=\"customer/account\"}}\">My Account</a></li>\n                	<li><a href=\"{{store url=\"wishlist\"}}\">My Wishlist</a></li>\n                	<li><a href=\"{{store url=\"checkout/cart\"}}\">View Cart</a></li>\n                	<li><a href=\"{{store url=\"checkout\"}}\">Checkout</a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(15,'Footer Links','pt002-footer-links','<ul class=\"links\">\n                	<li class=\"first\"><a href=\"{{store url=\"about-magento-demo-store\"}}\">About Us</a></li>\n                	<li><a href=\"{{store url=\"customer-service\"}}\">Customer Service</a></li>\n                	<li><a href=\"{{store url=\"contacts\"}}\">Contact Us</a></li>\n                	<li><a href=\"{{store url=\"catalogsearch/advanced\"}}\">Advanced Search</a></li>\n                	<li><a href=\"{{store url=\"catalogsearch/term/popular\"}}\">Search Terms</a></li>\n                	<li><a href=\"{{store url=\"catalog/seo_sitemap/category\"}}\">Sitemap</a></li>\n                	<li><a class=\"link-rss\" href=\"{{store url=\"rss\"}}\">RSS</a></li>\n                	<li><a href=\"{{store url=\"sales/guest/form\"}}\">Orders and Returns</a></li>\n                	<li class=\"last privacy\"><a href=\"{{store url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy</a></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(16,'Footer Payments','pt002-footer-payments','<ul class=\"payment-icons\">\n                	<li><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-payment-paypal.png\"}}\" alt=\"PayPal\"/></li>\n                	<li><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-payment-visa.png\"}}\" alt=\"Visa\"/></li>\n                	<li><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-payment-mastercard.png\"}}\" alt=\"MasterCard\"/></li>\n                	<li><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-payment-amex.png\"}}\" alt=\"Amercian Express\"/></li>\n                	<li><img src=\"{{media url=\"wysiwyg/pagayo/pt002/icon-payment-moneybookers.png\"}}\" alt=\"Moneybookers\"/></li>\n                </ul>','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(17,'Fast Shipping','pt002-header-usp1','and easy returns','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(18,'Secure Shopping','pt002-header-usp2','with fast checkout','2013-09-22 08:46:55','2013-09-22 08:46:55',1),(19,'Call Center','pt002-header-usp3','0123-456789','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(20,'pt002-home-box1','pt002-home-box1','<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-home-box1.jpg\"}}\"/></a>','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(21,'pt002-home-box2','pt002-home-box2','<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-home-box2.jpg\"}}\"/></a>','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(22,'pt002-home-box3','pt002-home-box3','<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-home-box3.jpg\"}}\"/></a>','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(23,'pt002-home-box4','pt002-home-box4','<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-home-box4.jpg\"}}\"/></a>','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(24,'pt002-banner-left','pt002-banner-left','<div class=\"block block-banner-left\">\n                	<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-banner-left.png\"}}\"/></a>\n                </div>','2013-09-22 08:46:56','2013-09-22 08:46:56',1),(25,'pt002-banner-right','pt002-banner-right','<div class=\"block block-banner-right\">\n                	<a href=\"{{store url=\"#\"}}\"><img src=\"{{media url=\"wysiwyg/pagayo/pt002/pt002-banner-right.png\"}}\"/></a>\n                </div>','2013-09-22 08:46:56','2013-09-22 08:46:56',1);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `IDX_CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_BLOCK_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block_store`
--

LOCK TABLES `cms_block_store` WRITE;
/*!40000 ALTER TABLE `cms_block_store` DISABLE KEYS */;
INSERT INTO `cms_block_store` VALUES (1,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `root_template` varchar(255) DEFAULT NULL COMMENT 'Page Template',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  PRIMARY KEY (`page_id`),
  KEY `IDX_CMS_PAGE_IDENTIFIER` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'404 Not Found 1','two_columns_right','Page keywords','Page description','no-route',NULL,'<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2013-09-21 06:43:09','2013-09-21 06:43:09',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','one_column',NULL,NULL,'home',NULL,'<p>{{block type=\'core/template\' template=\'pagayo/home.phtml\'}}</p>','2013-09-21 06:43:09','2013-09-26 07:18:06',1,0,'<reference name=\"content\">\r\n<block type=\"catalog/product_list\" name=\"featured\" template=\"catalog/product/list.phtml\">\r\n<action method=\"setCategoryId\"><category_id>8</category_id></action>\r\n<action method=\"setColumnCount\"><count>10</count></action>\r\n</block>\r\n</reference>','default/pagayo-theme-002','one_column','<reference name=\"content\">\r\n<block type=\"catalog/product_list\" name=\"featured\" template=\"catalog/product/list.phtml\">\r\n<action method=\"setCategoryId\"><category_id>8</category_id></action>\r\n<action method=\"setColumnCount\"><count>10</count></action>\r\n</block>\r\n</reference>',NULL,NULL),(3,'About Us','two_columns_right',NULL,NULL,'about-magento-demo-store',NULL,'<div class=\"page-title\">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class=\"col3-set\">\r\n<div class=\"col-1\"><p><a href=\"http://www.varien.com/\"><img src=\"{{skin url=\'images/media/about_us_img.jpg\'}}\" title=\"Varien\" alt=\"Varien\" /></a></p><p style=\"line-height:1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color:#888; font:1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class=\"col-2\">\r\n<p><strong style=\"color:#de036f;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class=\"col-3\">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style=\"color:#de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height:1.2em;\"><strong style=\"font:italic 2em Georgia, serif;\">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>','2013-09-21 06:43:09','2013-09-22 08:48:16',1,0,NULL,'default/pagayo-theme-002',NULL,NULL,NULL,NULL),(4,'Customer Service','three_columns',NULL,NULL,'customer-service',NULL,'<div class=\"page-title\">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class=\"disc\">\r\n<li><a href=\"#answer1\">Shipping &amp; Delivery</a></li>\r\n<li><a href=\"#answer2\">Privacy &amp; Security</a></li>\r\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\r\n<li><a href=\"#answer4\">Ordering</a></li>\r\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href=\"#answer6\">Viewing Orders</a></li>\r\n<li><a href=\"#answer7\">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer2\">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer4\">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer6\">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer7\">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>','2013-09-21 06:43:09','2013-09-21 06:43:09',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Enable Cookies','one_column',NULL,NULL,'enable-cookies',NULL,'<div class=\"std\">\r\n    <ul class=\"messages\">\r\n        <li class=\"notice-msg\">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class=\"page-title\">\r\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\r\n    <ul class=\"disc\">\r\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\r\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\r\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\r\n        <li><a href=\"#opera\">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n</div>\r\n','2013-09-21 06:43:09','2013-09-21 06:43:09',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Privacy Policy','one_column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy Policy','<p style=\"color: #ff0000; font-weight: bold; font-size: 13px\">\n    Please replace this text with you Privacy Policy.\n    Please add any additional cookies your website uses below (e.g., Google Analytics)\n</p>\n<p>\n    This privacy policy sets out how {{config path=\"general/store_information/name\"}} uses and protects any information\n    that you give {{config path=\"general/store_information/name\"}} when you use this website.\n    {{config path=\"general/store_information/name\"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path=\"general/store_information/name\"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path=\"trans_email/ident_general/email\"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path=\"general/store_information/address\"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name=\"list\"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class=\"data-table\">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CURRENCY</th>\n            <td>Your preferred currency</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>POLL</th>\n            <td>The ID of any polls you have recently voted in.</td>\n        </tr>\n        <tr>\n            <th>POLLN</th>\n            <td>Information on what polls you have voted on.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>','2013-09-21 06:43:09','2013-09-21 06:43:09',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Home Page 2','two_columns_left',NULL,NULL,'home_2',NULL,'{{block type=\'core/template\' template=\'pagayo/home.phtml\'}}\r\n','2013-09-23 15:23:23','2013-09-23 15:24:45',1,0,'<reference name=\"content\">\r\n<block type=\"catalog/product_list\" name=\"featured\" template=\"catalog/product/list.phtml\">\r\n<action method=\"setCategoryId\"><category_id>8</category_id></action>\r\n<action method=\"setColumnCount\"><count>5</count></action>\r\n</block>\r\n</reference>','default/pagayo-theme-002','two_columns_left',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `IDX_CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CMS_PAGE_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_store`
--

LOCK TABLES `cms_page_store` WRITE;
/*!40000 ALTER TABLE `cms_page_store` DISABLE KEYS */;
INSERT INTO `cms_page_store` VALUES (1,0),(4,0),(5,0),(6,0),(2,1),(3,1),(7,1);
/*!40000 ALTER TABLE `cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `IDX_CORE_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache`
--

LOCK TABLES `core_cache` WRITE;
/*!40000 ALTER TABLE `core_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_option`
--

DROP TABLE IF EXISTS `core_cache_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_option` (
  `code` varchar(32) NOT NULL COMMENT 'Code',
  `value` smallint(6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_option`
--

LOCK TABLES `core_cache_option` WRITE;
/*!40000 ALTER TABLE `core_cache_option` DISABLE KEYS */;
INSERT INTO `core_cache_option` VALUES ('block_html',1),('collections',1),('config',1),('config_api',1),('config_api2',1),('eav',1),('layout',1),('translate',1);
/*!40000 ALTER TABLE `core_cache_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cache_tag`
--

DROP TABLE IF EXISTS `core_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `IDX_CORE_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cache_tag`
--

LOCK TABLES `core_cache_tag` WRITE;
/*!40000 ALTER TABLE `core_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `UNQ_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config_data`
--

LOCK TABLES `core_config_data` WRITE;
/*!40000 ALTER TABLE `core_config_data` DISABLE KEYS */;
INSERT INTO `core_config_data` VALUES (1,'default',0,'general/region/display_all','1'),(2,'default',0,'general/region/state_required','AT,CA,CH,DE,EE,ES,FI,FR,LT,LV,RO,US'),(3,'default',0,'catalog/category/root_id','5'),(4,'default',0,'admin/dashboard/enable_charts','1'),(5,'default',0,'web/unsecure/base_url','http://localhost/magento/'),(6,'default',0,'web/secure/base_url','http://localhost/magento/'),(7,'default',0,'general/locale/code','zh_CN'),(8,'default',0,'general/locale/timezone','Asia/Shanghai'),(9,'default',0,'currency/options/base','CNY'),(10,'default',0,'currency/options/default','CNY'),(11,'default',0,'currency/options/allow','CNY'),(23,'default',0,'design/package/name','default'),(24,'default',0,'design/package/ua_regexp','a:0:{}'),(25,'default',0,'design/theme/locale',NULL),(26,'default',0,'design/theme/template','default'),(27,'default',0,'design/theme/template_ua_regexp','a:0:{}'),(28,'default',0,'design/theme/skin','pagayo-theme-002'),(29,'default',0,'design/theme/skin_ua_regexp','a:0:{}'),(30,'default',0,'design/theme/layout','pagayo-theme-002'),(31,'default',0,'design/theme/layout_ua_regexp','a:0:{}'),(32,'default',0,'design/theme/default','pagayo-theme-002'),(33,'default',0,'design/theme/default_ua_regexp','a:0:{}'),(34,'default',0,'design/head/default_title','Magento Commerce'),(35,'default',0,'design/head/title_prefix',NULL),(36,'default',0,'design/head/title_suffix',NULL),(37,'default',0,'design/head/default_description','Default Description'),(38,'default',0,'design/head/default_keywords','Magento, Varien, E-commerce'),(39,'default',0,'design/head/default_robots','INDEX,FOLLOW'),(40,'default',0,'design/head/includes',NULL),(41,'default',0,'design/head/demonotice','0'),(42,'default',0,'design/header/logo_src','images/logo.gif'),(43,'default',0,'design/header/logo_alt','Magento Commerce'),(44,'default',0,'design/header/welcome','Default welcome msg!'),(45,'default',0,'design/footer/copyright','&copy; 2012 Magento Demo Store. All Rights Reserved.'),(46,'default',0,'design/footer/absolute_footer',NULL),(47,'default',0,'design/watermark/image_size',NULL),(48,'default',0,'design/watermark/image_imageOpacity',NULL),(49,'default',0,'design/watermark/image_position','stretch'),(50,'default',0,'design/watermark/small_image_size',NULL),(51,'default',0,'design/watermark/small_image_imageOpacity',NULL),(52,'default',0,'design/watermark/small_image_position','stretch'),(53,'default',0,'design/watermark/thumbnail_size',NULL),(54,'default',0,'design/watermark/thumbnail_imageOpacity',NULL),(55,'default',0,'design/watermark/thumbnail_position','stretch'),(56,'default',0,'design/pagination/pagination_frame','5'),(57,'default',0,'design/pagination/pagination_frame_skip',NULL),(58,'default',0,'design/pagination/anchor_text_for_previous',NULL),(59,'default',0,'design/pagination/anchor_text_for_next',NULL),(60,'default',0,'design/email/logo_alt',NULL),(61,'default',0,'cms/wysiwyg/enabled','enabled'),(62,'default',0,'cms/wysiwyg/use_static_urls_in_catalog','0'),(63,'default',0,'dev/restrict/allow_ips',NULL),(64,'default',0,'dev/debug/profiler','0'),(65,'default',0,'dev/template/allow_symlink','0'),(66,'default',0,'dev/translate_inline/active','0'),(67,'default',0,'dev/translate_inline/active_admin','0'),(68,'default',0,'dev/log/active','1'),(69,'default',0,'dev/log/file','system.log'),(70,'default',0,'dev/log/exception_file','exception.log'),(71,'default',0,'dev/js/merge_files','0'),(72,'default',0,'dev/css/merge_css_files','0'),(73,'default',0,'web/url/use_store','0'),(74,'default',0,'web/url/redirect_to_base','1'),(75,'default',0,'web/seo/use_rewrites','0'),(76,'default',0,'web/unsecure/base_link_url','{{unsecure_base_url}}'),(77,'default',0,'web/unsecure/base_skin_url','{{unsecure_base_url}}skin/'),(78,'default',0,'web/unsecure/base_media_url','{{unsecure_base_url}}media/'),(79,'default',0,'web/unsecure/base_js_url','{{unsecure_base_url}}js/'),(80,'default',0,'web/secure/base_link_url','{{secure_base_url}}'),(81,'default',0,'web/secure/base_skin_url','{{secure_base_url}}skin/'),(82,'default',0,'web/secure/base_media_url','{{secure_base_url}}media/'),(83,'default',0,'web/secure/base_js_url','{{secure_base_url}}js/'),(84,'default',0,'web/secure/use_in_frontend','0'),(85,'default',0,'web/secure/use_in_adminhtml','0'),(86,'default',0,'web/secure/offloader_header','SSL_OFFLOADED'),(87,'default',0,'web/default/front','cms'),(88,'default',0,'web/default/cms_home_page','home'),(89,'default',0,'web/default/no_route','cms/index/noRoute'),(90,'default',0,'web/default/cms_no_route','no-route'),(91,'default',0,'web/default/cms_no_cookies','enable-cookies'),(92,'default',0,'web/default/show_cms_breadcrumbs','1'),(93,'default',0,'web/polls/poll_check_by_ip','0'),(94,'default',0,'web/cookie/cookie_lifetime','3600'),(95,'default',0,'web/cookie/cookie_path',NULL),(96,'default',0,'web/cookie/cookie_domain',NULL),(97,'default',0,'web/cookie/cookie_httponly','0'),(98,'default',0,'web/cookie/cookie_restriction','0'),(99,'default',0,'web/session/use_remote_addr','0'),(100,'default',0,'web/session/use_http_via','0'),(101,'default',0,'web/session/use_http_x_forwarded_for','0'),(102,'default',0,'web/session/use_http_user_agent','0'),(103,'default',0,'web/session/use_frontend_sid','1'),(104,'default',0,'web/browser_capabilities/cookies','1'),(105,'default',0,'web/browser_capabilities/javascript','1'),(106,'stores',1,'dev/debug/template_hints','0'),(107,'stores',1,'design/package/name','default');
/*!40000 ALTER TABLE `core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_email_template`
--

DROP TABLE IF EXISTS `core_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `UNQ_CORE_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `IDX_CORE_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_CORE_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_email_template`
--

LOCK TABLES `core_email_template` WRITE;
/*!40000 ALTER TABLE `core_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_flag`
--

DROP TABLE IF EXISTS `core_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `IDX_CORE_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_flag`
--

LOCK TABLES `core_flag` WRITE;
/*!40000 ALTER TABLE `core_flag` DISABLE KEYS */;
INSERT INTO `core_flag` VALUES (1,'admin_notification_survey',0,'a:1:{s:13:\"survey_viewed\";b:1;}','2013-09-21 06:44:05'),(2,'catalog_product_flat',0,'a:1:{s:8:\"is_built\";b:1;}','2013-09-21 07:21:42');
/*!40000 ALTER TABLE `core_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_link`
--

DROP TABLE IF EXISTS `core_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `area` varchar(64) DEFAULT NULL COMMENT 'Area',
  `package` varchar(64) DEFAULT NULL COMMENT 'Package',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `UNQ_CORE_LAYOUT_LINK_STORE_ID_PACKAGE_THEME_LAYOUT_UPDATE_ID` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `IDX_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_LYT_LNK_LYT_UPDATE_ID_CORE_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_link`
--

LOCK TABLES `core_layout_link` WRITE;
/*!40000 ALTER TABLE `core_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_layout_update`
--

DROP TABLE IF EXISTS `core_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`layout_update_id`),
  KEY `IDX_CORE_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_layout_update`
--

LOCK TABLES `core_layout_update` WRITE;
/*!40000 ALTER TABLE `core_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_resource`
--

LOCK TABLES `core_resource` WRITE;
/*!40000 ALTER TABLE `core_resource` DISABLE KEYS */;
INSERT INTO `core_resource` VALUES ('adminnotification_setup','1.6.0.0','1.6.0.0'),('admin_setup','1.6.1.0','1.6.1.0'),('api2_setup','1.0.0.0','1.0.0.0'),('api_setup','1.6.0.0','1.6.0.0'),('backup_setup','1.6.0.0','1.6.0.0'),('bundle_setup','1.6.0.0.1','1.6.0.0.1'),('captcha_setup','1.7.0.0.0','1.7.0.0.0'),('catalogindex_setup','1.6.0.0','1.6.0.0'),('cataloginventory_setup','1.6.0.0.2','1.6.0.0.2'),('catalogrule_setup','1.6.0.3','1.6.0.3'),('catalogsearch_setup','1.6.0.0','1.6.0.0'),('catalog_setup','1.6.0.0.14','1.6.0.0.14'),('checkout_setup','1.6.0.0','1.6.0.0'),('cms_setup','1.6.0.0.1','1.6.0.0.1'),('compiler_setup','1.6.0.0','1.6.0.0'),('contacts_setup','1.6.0.0','1.6.0.0'),('core_setup','1.6.0.2','1.6.0.2'),('cron_setup','1.6.0.0','1.6.0.0'),('customer_setup','1.6.2.0.1','1.6.2.0.1'),('dataflow_setup','1.6.0.0','1.6.0.0'),('directory_setup','1.6.0.1','1.6.0.1'),('downloadable_setup','1.6.0.0.2','1.6.0.0.2'),('eav_setup','1.6.0.0','1.6.0.0'),('giftmessage_setup','1.6.0.0','1.6.0.0'),('googlecheckout_setup','1.6.0.1','1.6.0.1'),('importexport_setup','1.6.0.2','1.6.0.2'),('index_setup','1.6.0.0','1.6.0.0'),('log_setup','1.6.0.0','1.6.0.0'),('moneybookers_setup','1.6.0.0','1.6.0.0'),('newsletter_setup','1.6.0.1','1.6.0.1'),('oauth_setup','1.0.0.0','1.0.0.0'),('paygate_setup','1.6.0.0','1.6.0.0'),('payment_setup','1.6.0.0','1.6.0.0'),('paypaluk_setup','1.6.0.0','1.6.0.0'),('paypal_setup','1.6.0.2','1.6.0.2'),('persistent_setup','1.0.0.0','1.0.0.0'),('poll_setup','1.6.0.0','1.6.0.0'),('productalert_setup','1.6.0.0','1.6.0.0'),('pt002_setup','0.1.1','0.1.1'),('rating_setup','1.6.0.0','1.6.0.0'),('reports_setup','1.6.0.0.1','1.6.0.0.1'),('review_setup','1.6.0.0','1.6.0.0'),('salesrule_setup','1.6.0.3','1.6.0.3'),('sales_setup','1.6.0.7','1.6.0.7'),('sendfriend_setup','1.6.0.0','1.6.0.0'),('shipping_setup','1.6.0.0','1.6.0.0'),('sitemap_setup','1.6.0.0','1.6.0.0'),('tag_setup','1.6.0.0','1.6.0.0'),('tax_setup','1.6.0.3','1.6.0.3'),('templatef001_setup','1.7.0.0','1.7.0.0'),('tm_core_setup','1.2.0','1.2.0'),('usa_setup','1.6.0.1','1.6.0.1'),('weee_setup','1.6.0.0','1.6.0.0'),('widget_setup','1.6.0.0','1.6.0.0'),('wishlist_setup','1.6.0.0','1.6.0.0'),('xmlconnect_setup','1.6.0.0','1.6.0.0');
/*!40000 ALTER TABLE `core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_session`
--

DROP TABLE IF EXISTS `core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_session`
--

LOCK TABLES `core_session` WRITE;
/*!40000 ALTER TABLE `core_session` DISABLE KEYS */;
INSERT INTO `core_session` VALUES ('03ec25c47c8e8c4d6734ac53853a5566',1380212921,'core|a:6:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:12:\"visitor_data\";a:16:{s:0:\"\";N;s:11:\"server_addr\";b:0;s:11:\"remote_addr\";b:0;s:11:\"http_secure\";b:0;s:9:\"http_host\";s:9:\"localhost\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";s:20:\"http_accept_language\";s:14:\"zh-CN,zh;q=0.8\";s:19:\"http_accept_charset\";s:0:\"\";s:11:\"request_uri\";s:28:\"/magento/index.php/?limit=30\";s:10:\"session_id\";s:32:\"03ec25c47c8e8c4d6734ac53853a5566\";s:12:\"http_referer\";s:35:\"http://localhost/magento/index.php/\";s:14:\"first_visit_at\";s:19:\"2013-09-26 14:50:14\";s:14:\"is_new_visitor\";b:0;s:13:\"last_visit_at\";s:19:\"2013-09-26 15:28:41\";s:10:\"visitor_id\";s:2:\"17\";s:11:\"last_url_id\";s:3:\"860\";}s:8:\"last_url\";s:60:\"http://localhost/magento/index.php/cms/index/index/?limit=30\";s:15:\"just_voted_poll\";b:0;}customer_base|a:4:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:19:\"wishlist_item_count\";i:0;}checkout|a:3:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}}catalog|a:6:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:27:\"catalog_compare_items_count\";i:0;s:22:\"last_viewed_product_id\";s:1:\"4\";s:10:\"limit_page\";s:2:\"30\";}reports|a:4:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:26:\"product_index_viewed_count\";i:1;s:28:\"product_index_compared_count\";i:0;}store_default|a:2:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}}tag|a:3:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}}'),('96c41d2d7c9844e9f1930e8c56ba0ed2',1380211150,'core|a:4:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:9:\"_form_key\";s:16:\"FqPI2lHytjWaJIHY\";s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}}adminhtml|a:6:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:6:\"locale\";s:5:\"zh_CN\";s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";O:31:\"Mage_Core_Model_Message_Success\":6:{s:8:\"\0*\0_type\";s:7:\"success\";s:8:\"\0*\0_code\";s:28:\"The category has been saved.\";s:9:\"\0*\0_class\";s:0:\"\";s:10:\"\0*\0_method\";s:0:\"\";s:14:\"\0*\0_identifier\";N;s:12:\"\0*\0_isSticky\";b:0;}}s:17:\"cmsBlockGridlimit\";s:2:\"50\";s:9:\"form_data\";b:0;}admin|a:10:{s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:1:{s:7:\"success\";a:1:{i:0;O:31:\"Mage_Core_Model_Message_Success\":6:{s:8:\"\0*\0_type\";s:7:\"success\";s:8:\"\0*\0_code\";s:20:\"You have logged out.\";s:9:\"\0*\0_class\";s:0:\"\";s:10:\"\0*\0_method\";s:0:\"\";s:14:\"\0*\0_identifier\";N;s:12:\"\0*\0_isSticky\";b:0;}}}s:20:\"\0*\0_lastAddedMessage\";r:37;}s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:23:\"sync_process_stop_watch\";b:0;s:4:\"user\";O:21:\"Mage_Admin_Model_User\":17:{s:15:\"\0*\0_eventPrefix\";s:10:\"admin_user\";s:8:\"\0*\0_role\";N;s:25:\"\0*\0_hasAvailableResources\";b:1;s:15:\"\0*\0_eventObject\";s:6:\"object\";s:16:\"\0*\0_resourceName\";s:10:\"admin/user\";s:12:\"\0*\0_resource\";N;s:26:\"\0*\0_resourceCollectionName\";s:21:\"admin/user_collection\";s:12:\"\0*\0_cacheTag\";b:0;s:19:\"\0*\0_dataSaveAllowed\";b:1;s:15:\"\0*\0_isObjectNew\";N;s:8:\"\0*\0_data\";a:15:{s:7:\"user_id\";s:1:\"1\";s:9:\"firstname\";s:7:\"chunyan\";s:8:\"lastname\";s:3:\"pan\";s:5:\"email\";s:18:\"tedi3231@gmail.com\";s:8:\"username\";s:5:\"admin\";s:8:\"password\";s:35:\"ec0ceba77522cf63e20faeb0f98ece92:7x\";s:7:\"created\";s:19:\"2013-09-26 22:42:31\";s:8:\"modified\";s:19:\"2013-09-21 14:44:04\";s:7:\"logdate\";s:19:\"2013-09-26 14:42:31\";s:6:\"lognum\";s:2:\"19\";s:15:\"reload_acl_flag\";s:1:\"0\";s:9:\"is_active\";s:1:\"1\";s:5:\"extra\";a:1:{s:11:\"configState\";a:25:{s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"0\";s:13:\"design_header\";s:1:\"0\";s:13:\"design_footer\";s:1:\"0\";s:16:\"design_watermark\";s:1:\"0\";s:17:\"design_pagination\";s:1:\"0\";s:12:\"design_email\";s:1:\"0\";s:11:\"cms_wysiwyg\";s:1:\"1\";s:12:\"dev_restrict\";s:1:\"1\";s:9:\"dev_debug\";s:1:\"1\";s:12:\"dev_template\";s:1:\"1\";s:20:\"dev_translate_inline\";s:1:\"1\";s:7:\"dev_log\";s:1:\"1\";s:6:\"dev_js\";s:1:\"1\";s:7:\"dev_css\";s:1:\"1\";s:7:\"web_url\";s:1:\"0\";s:7:\"web_seo\";s:1:\"0\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"1\";s:9:\"web_polls\";s:1:\"0\";s:10:\"web_cookie\";s:1:\"1\";s:11:\"web_session\";s:1:\"0\";s:24:\"web_browser_capabilities\";s:1:\"0\";}}s:8:\"rp_token\";N;s:19:\"rp_token_created_at\";N;}s:18:\"\0*\0_hasDataChanges\";b:0;s:12:\"\0*\0_origData\";a:15:{s:7:\"user_id\";s:1:\"1\";s:9:\"firstname\";s:7:\"chunyan\";s:8:\"lastname\";s:3:\"pan\";s:5:\"email\";s:18:\"tedi3231@gmail.com\";s:8:\"username\";s:5:\"admin\";s:8:\"password\";s:35:\"ec0ceba77522cf63e20faeb0f98ece92:7x\";s:7:\"created\";s:19:\"2013-09-26 22:42:31\";s:8:\"modified\";s:19:\"2013-09-21 14:44:04\";s:7:\"logdate\";s:19:\"2013-09-26 14:42:31\";s:6:\"lognum\";s:2:\"19\";s:15:\"reload_acl_flag\";s:1:\"0\";s:9:\"is_active\";s:1:\"1\";s:5:\"extra\";a:1:{s:11:\"configState\";a:25:{s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"0\";s:13:\"design_header\";s:1:\"0\";s:13:\"design_footer\";s:1:\"0\";s:16:\"design_watermark\";s:1:\"0\";s:17:\"design_pagination\";s:1:\"0\";s:12:\"design_email\";s:1:\"0\";s:11:\"cms_wysiwyg\";s:1:\"1\";s:12:\"dev_restrict\";s:1:\"1\";s:9:\"dev_debug\";s:1:\"1\";s:12:\"dev_template\";s:1:\"1\";s:20:\"dev_translate_inline\";s:1:\"1\";s:7:\"dev_log\";s:1:\"1\";s:6:\"dev_js\";s:1:\"1\";s:7:\"dev_css\";s:1:\"1\";s:7:\"web_url\";s:1:\"0\";s:7:\"web_seo\";s:1:\"0\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"1\";s:9:\"web_polls\";s:1:\"0\";s:10:\"web_cookie\";s:1:\"1\";s:11:\"web_session\";s:1:\"0\";s:24:\"web_browser_capabilities\";s:1:\"0\";}}s:8:\"rp_token\";N;s:19:\"rp_token_created_at\";N;}s:15:\"\0*\0_idFieldName\";s:7:\"user_id\";s:13:\"\0*\0_isDeleted\";b:0;s:16:\"\0*\0_oldFieldsMap\";a:0:{}s:17:\"\0*\0_syncFieldsMap\";a:0:{}}s:3:\"acl\";O:20:\"Mage_Admin_Model_Acl\":6:{s:16:\"\0*\0_roleRegistry\";O:34:\"Mage_Admin_Model_Acl_Role_Registry\":1:{s:9:\"\0*\0_roles\";a:2:{s:2:\"G1\";a:3:{s:8:\"instance\";O:31:\"Mage_Admin_Model_Acl_Role_Group\":1:{s:10:\"\0*\0_roleId\";s:2:\"G1\";}s:7:\"parents\";a:0:{}s:8:\"children\";a:1:{s:2:\"U1\";O:30:\"Mage_Admin_Model_Acl_Role_User\":1:{s:10:\"\0*\0_roleId\";s:2:\"U1\";}}}s:2:\"U1\";a:3:{s:8:\"instance\";r:161;s:7:\"parents\";a:1:{s:2:\"G1\";r:157;}s:8:\"children\";a:0:{}}}}s:13:\"\0*\0_resources\";a:208:{s:3:\"all\";a:3:{s:8:\"instance\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:3:\"all\";}s:6:\"parent\";N;s:8:\"children\";a:0:{}}s:5:\"admin\";a:3:{s:8:\"instance\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:5:\"admin\";}s:6:\"parent\";N;s:8:\"children\";a:13:{s:15:\"admin/dashboard\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:15:\"admin/dashboard\";}s:12:\"admin/system\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:12:\"admin/system\";}s:19:\"admin/global_search\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/global_search\";}s:9:\"admin/cms\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:9:\"admin/cms\";}s:14:\"admin/customer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:14:\"admin/customer\";}s:13:\"admin/catalog\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:13:\"admin/catalog\";}s:11:\"admin/promo\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:11:\"admin/promo\";}s:11:\"admin/sales\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:11:\"admin/sales\";}s:12:\"admin/report\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:12:\"admin/report\";}s:16:\"admin/newsletter\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:16:\"admin/newsletter\";}s:16:\"admin/page_cache\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:16:\"admin/page_cache\";}s:16:\"admin/xmlconnect\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:16:\"admin/xmlconnect\";}s:22:\"admin/templates_master\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/templates_master\";}}}s:15:\"admin/dashboard\";a:3:{s:8:\"instance\";r:179;s:6:\"parent\";r:175;s:8:\"children\";a:0:{}}s:12:\"admin/system\";a:3:{s:8:\"instance\";r:181;s:6:\"parent\";r:175;s:8:\"children\";a:16:{s:16:\"admin/system/acl\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:16:\"admin/system/acl\";}s:18:\"admin/system/store\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:18:\"admin/system/store\";}s:19:\"admin/system/design\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/system/design\";}s:19:\"admin/system/config\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/system/config\";}s:21:\"admin/system/currency\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/system/currency\";}s:27:\"admin/system/email_template\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/email_template\";}s:21:\"admin/system/variable\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/system/variable\";}s:22:\"admin/system/myaccount\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/system/myaccount\";}s:18:\"admin/system/tools\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:18:\"admin/system/tools\";}s:20:\"admin/system/convert\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:20:\"admin/system/convert\";}s:18:\"admin/system/cache\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:18:\"admin/system/cache\";}s:23:\"admin/system/extensions\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/extensions\";}s:30:\"admin/system/adminnotification\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/adminnotification\";}s:18:\"admin/system/index\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:18:\"admin/system/index\";}s:27:\"admin/system/order_statuses\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/order_statuses\";}s:16:\"admin/system/api\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:16:\"admin/system/api\";}}}s:16:\"admin/system/acl\";a:3:{s:8:\"instance\";r:213;s:6:\"parent\";r:181;s:8:\"children\";a:2:{s:22:\"admin/system/acl/roles\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/system/acl/roles\";}s:22:\"admin/system/acl/users\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/system/acl/users\";}}}s:22:\"admin/system/acl/roles\";a:3:{s:8:\"instance\";r:249;s:6:\"parent\";r:213;s:8:\"children\";a:0:{}}s:22:\"admin/system/acl/users\";a:3:{s:8:\"instance\";r:251;s:6:\"parent\";r:213;s:8:\"children\";a:0:{}}s:18:\"admin/system/store\";a:3:{s:8:\"instance\";r:215;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:19:\"admin/system/design\";a:3:{s:8:\"instance\";r:217;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:19:\"admin/system/config\";a:3:{s:8:\"instance\";r:219;s:6:\"parent\";r:181;s:8:\"children\";a:42:{s:27:\"admin/system/config/general\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/config/general\";}s:23:\"admin/system/config/web\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/web\";}s:26:\"admin/system/config/design\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/system/config/design\";}s:26:\"admin/system/config/system\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/system/config/system\";}s:28:\"admin/system/config/advanced\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/advanced\";}s:31:\"admin/system/config/trans_email\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/system/config/trans_email\";}s:23:\"admin/system/config/dev\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/dev\";}s:28:\"admin/system/config/currency\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/currency\";}s:30:\"admin/system/config/sendfriend\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/config/sendfriend\";}s:25:\"admin/system/config/admin\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/config/admin\";}s:23:\"admin/system/config/cms\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/cms\";}s:28:\"admin/system/config/customer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/customer\";}s:27:\"admin/system/config/catalog\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/config/catalog\";}s:27:\"admin/system/config/payment\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/config/payment\";}s:36:\"admin/system/config/payment_services\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:36:\"admin/system/config/payment_services\";}s:25:\"admin/system/config/sales\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/config/sales\";}s:31:\"admin/system/config/sales_email\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/system/config/sales_email\";}s:29:\"admin/system/config/sales_pdf\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/system/config/sales_pdf\";}s:36:\"admin/system/config/cataloginventory\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:36:\"admin/system/config/cataloginventory\";}s:28:\"admin/system/config/shipping\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/shipping\";}s:28:\"admin/system/config/carriers\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/carriers\";}s:25:\"admin/system/config/promo\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/config/promo\";}s:28:\"admin/system/config/checkout\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/checkout\";}s:26:\"admin/system/config/paypal\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/system/config/paypal\";}s:26:\"admin/system/config/google\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/system/config/google\";}s:27:\"admin/system/config/reports\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/config/reports\";}s:23:\"admin/system/config/tax\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/tax\";}s:28:\"admin/system/config/wishlist\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/wishlist\";}s:28:\"admin/system/config/contacts\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/system/config/contacts\";}s:27:\"admin/system/config/sitemap\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/config/sitemap\";}s:23:\"admin/system/config/rss\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/rss\";}s:23:\"admin/system/config/api\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/system/config/api\";}s:25:\"admin/system/config/oauth\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/config/oauth\";}s:30:\"admin/system/config/newsletter\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/config/newsletter\";}s:32:\"admin/system/config/downloadable\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/system/config/downloadable\";}s:30:\"admin/system/config/persistent\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/config/persistent\";}s:26:\"admin/system/config/tmcore\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/system/config/tmcore\";}s:31:\"admin/system/config/pagayostore\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/system/config/pagayostore\";}s:31:\"admin/system/config/pagayopt002\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/system/config/pagayopt002\";}s:32:\"admin/system/config/moneybookers\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/system/config/moneybookers\";}s:35:\"admin/system/config/theme_bluescale\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:35:\"admin/system/config/theme_bluescale\";}s:38:\"admin/system/config/about_webandpeople\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:38:\"admin/system/config/about_webandpeople\";}}}s:27:\"admin/system/config/general\";a:3:{s:8:\"instance\";r:273;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/web\";a:3:{s:8:\"instance\";r:275;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:26:\"admin/system/config/design\";a:3:{s:8:\"instance\";r:277;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:26:\"admin/system/config/system\";a:3:{s:8:\"instance\";r:279;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/advanced\";a:3:{s:8:\"instance\";r:281;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:31:\"admin/system/config/trans_email\";a:3:{s:8:\"instance\";r:283;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/dev\";a:3:{s:8:\"instance\";r:285;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/currency\";a:3:{s:8:\"instance\";r:287;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:30:\"admin/system/config/sendfriend\";a:3:{s:8:\"instance\";r:289;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:25:\"admin/system/config/admin\";a:3:{s:8:\"instance\";r:291;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/cms\";a:3:{s:8:\"instance\";r:293;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/customer\";a:3:{s:8:\"instance\";r:295;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:27:\"admin/system/config/catalog\";a:3:{s:8:\"instance\";r:297;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:27:\"admin/system/config/payment\";a:3:{s:8:\"instance\";r:299;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:36:\"admin/system/config/payment_services\";a:3:{s:8:\"instance\";r:301;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:25:\"admin/system/config/sales\";a:3:{s:8:\"instance\";r:303;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:31:\"admin/system/config/sales_email\";a:3:{s:8:\"instance\";r:305;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:29:\"admin/system/config/sales_pdf\";a:3:{s:8:\"instance\";r:307;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:36:\"admin/system/config/cataloginventory\";a:3:{s:8:\"instance\";r:309;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/shipping\";a:3:{s:8:\"instance\";r:311;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/carriers\";a:3:{s:8:\"instance\";r:313;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:25:\"admin/system/config/promo\";a:3:{s:8:\"instance\";r:315;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/checkout\";a:3:{s:8:\"instance\";r:317;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:26:\"admin/system/config/paypal\";a:3:{s:8:\"instance\";r:319;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:26:\"admin/system/config/google\";a:3:{s:8:\"instance\";r:321;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:27:\"admin/system/config/reports\";a:3:{s:8:\"instance\";r:323;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/tax\";a:3:{s:8:\"instance\";r:325;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/wishlist\";a:3:{s:8:\"instance\";r:327;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:28:\"admin/system/config/contacts\";a:3:{s:8:\"instance\";r:329;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:27:\"admin/system/config/sitemap\";a:3:{s:8:\"instance\";r:331;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/rss\";a:3:{s:8:\"instance\";r:333;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:23:\"admin/system/config/api\";a:3:{s:8:\"instance\";r:335;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:25:\"admin/system/config/oauth\";a:3:{s:8:\"instance\";r:337;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:30:\"admin/system/config/newsletter\";a:3:{s:8:\"instance\";r:339;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:32:\"admin/system/config/downloadable\";a:3:{s:8:\"instance\";r:341;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:30:\"admin/system/config/persistent\";a:3:{s:8:\"instance\";r:343;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:26:\"admin/system/config/tmcore\";a:3:{s:8:\"instance\";r:345;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:31:\"admin/system/config/pagayostore\";a:3:{s:8:\"instance\";r:347;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:31:\"admin/system/config/pagayopt002\";a:3:{s:8:\"instance\";r:349;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:32:\"admin/system/config/moneybookers\";a:3:{s:8:\"instance\";r:351;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:35:\"admin/system/config/theme_bluescale\";a:3:{s:8:\"instance\";r:353;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:38:\"admin/system/config/about_webandpeople\";a:3:{s:8:\"instance\";r:355;s:6:\"parent\";r:219;s:8:\"children\";a:0:{}}s:21:\"admin/system/currency\";a:3:{s:8:\"instance\";r:221;s:6:\"parent\";r:181;s:8:\"children\";a:2:{s:27:\"admin/system/currency/rates\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/currency/rates\";}s:29:\"admin/system/currency/symbols\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/system/currency/symbols\";}}}s:27:\"admin/system/currency/rates\";a:3:{s:8:\"instance\";r:529;s:6:\"parent\";r:221;s:8:\"children\";a:0:{}}s:29:\"admin/system/currency/symbols\";a:3:{s:8:\"instance\";r:531;s:6:\"parent\";r:221;s:8:\"children\";a:0:{}}s:27:\"admin/system/email_template\";a:3:{s:8:\"instance\";r:223;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:21:\"admin/system/variable\";a:3:{s:8:\"instance\";r:225;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:22:\"admin/system/myaccount\";a:3:{s:8:\"instance\";r:227;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:18:\"admin/system/tools\";a:3:{s:8:\"instance\";r:229;s:6:\"parent\";r:181;s:8:\"children\";a:2:{s:25:\"admin/system/tools/backup\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/tools/backup\";}s:27:\"admin/system/tools/compiler\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/tools/compiler\";}}}s:25:\"admin/system/tools/backup\";a:3:{s:8:\"instance\";r:557;s:6:\"parent\";r:229;s:8:\"children\";a:1:{s:34:\"admin/system/tools/backup/rollback\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:34:\"admin/system/tools/backup/rollback\";}}}s:34:\"admin/system/tools/backup/rollback\";a:3:{s:8:\"instance\";r:565;s:6:\"parent\";r:557;s:8:\"children\";a:0:{}}s:27:\"admin/system/tools/compiler\";a:3:{s:8:\"instance\";r:559;s:6:\"parent\";r:229;s:8:\"children\";a:0:{}}s:20:\"admin/system/convert\";a:3:{s:8:\"instance\";r:231;s:6:\"parent\";r:181;s:8:\"children\";a:4:{s:24:\"admin/system/convert/gui\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/system/convert/gui\";}s:29:\"admin/system/convert/profiles\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/system/convert/profiles\";}s:27:\"admin/system/convert/import\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/convert/import\";}s:27:\"admin/system/convert/export\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/convert/export\";}}}s:24:\"admin/system/convert/gui\";a:3:{s:8:\"instance\";r:579;s:6:\"parent\";r:231;s:8:\"children\";a:0:{}}s:29:\"admin/system/convert/profiles\";a:3:{s:8:\"instance\";r:581;s:6:\"parent\";r:231;s:8:\"children\";a:0:{}}s:27:\"admin/system/convert/import\";a:3:{s:8:\"instance\";r:583;s:6:\"parent\";r:231;s:8:\"children\";a:0:{}}s:27:\"admin/system/convert/export\";a:3:{s:8:\"instance\";r:585;s:6:\"parent\";r:231;s:8:\"children\";a:0:{}}s:18:\"admin/system/cache\";a:3:{s:8:\"instance\";r:233;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:23:\"admin/system/extensions\";a:3:{s:8:\"instance\";r:235;s:6:\"parent\";r:181;s:8:\"children\";a:2:{s:29:\"admin/system/extensions/local\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/system/extensions/local\";}s:30:\"admin/system/extensions/custom\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/extensions/custom\";}}}s:29:\"admin/system/extensions/local\";a:3:{s:8:\"instance\";r:611;s:6:\"parent\";r:235;s:8:\"children\";a:0:{}}s:30:\"admin/system/extensions/custom\";a:3:{s:8:\"instance\";r:613;s:6:\"parent\";r:235;s:8:\"children\";a:0:{}}s:30:\"admin/system/adminnotification\";a:3:{s:8:\"instance\";r:237;s:6:\"parent\";r:181;s:8:\"children\";a:4:{s:43:\"admin/system/adminnotification/show_toolbar\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:43:\"admin/system/adminnotification/show_toolbar\";}s:40:\"admin/system/adminnotification/show_list\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:40:\"admin/system/adminnotification/show_list\";}s:43:\"admin/system/adminnotification/mark_as_read\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:43:\"admin/system/adminnotification/mark_as_read\";}s:37:\"admin/system/adminnotification/remove\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:37:\"admin/system/adminnotification/remove\";}}}s:43:\"admin/system/adminnotification/show_toolbar\";a:3:{s:8:\"instance\";r:627;s:6:\"parent\";r:237;s:8:\"children\";a:0:{}}s:40:\"admin/system/adminnotification/show_list\";a:3:{s:8:\"instance\";r:629;s:6:\"parent\";r:237;s:8:\"children\";a:0:{}}s:43:\"admin/system/adminnotification/mark_as_read\";a:3:{s:8:\"instance\";r:631;s:6:\"parent\";r:237;s:8:\"children\";a:0:{}}s:37:\"admin/system/adminnotification/remove\";a:3:{s:8:\"instance\";r:633;s:6:\"parent\";r:237;s:8:\"children\";a:0:{}}s:18:\"admin/system/index\";a:3:{s:8:\"instance\";r:239;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:27:\"admin/system/order_statuses\";a:3:{s:8:\"instance\";r:241;s:6:\"parent\";r:181;s:8:\"children\";a:0:{}}s:16:\"admin/system/api\";a:3:{s:8:\"instance\";r:243;s:6:\"parent\";r:181;s:8:\"children\";a:7:{s:22:\"admin/system/api/users\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/system/api/users\";}s:22:\"admin/system/api/roles\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/system/api/roles\";}s:25:\"admin/system/api/consumer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/system/api/consumer\";}s:33:\"admin/system/api/authorizedTokens\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/system/api/authorizedTokens\";}s:34:\"admin/system/api/oauth_admin_token\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:34:\"admin/system/api/oauth_admin_token\";}s:27:\"admin/system/api/rest_roles\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/system/api/rest_roles\";}s:32:\"admin/system/api/rest_attributes\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/system/api/rest_attributes\";}}}s:22:\"admin/system/api/users\";a:3:{s:8:\"instance\";r:663;s:6:\"parent\";r:243;s:8:\"children\";a:0:{}}s:22:\"admin/system/api/roles\";a:3:{s:8:\"instance\";r:665;s:6:\"parent\";r:243;s:8:\"children\";a:0:{}}s:25:\"admin/system/api/consumer\";a:3:{s:8:\"instance\";r:667;s:6:\"parent\";r:243;s:8:\"children\";a:2:{s:30:\"admin/system/api/consumer/edit\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/system/api/consumer/edit\";}s:32:\"admin/system/api/consumer/delete\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/system/api/consumer/delete\";}}}s:30:\"admin/system/api/consumer/edit\";a:3:{s:8:\"instance\";r:689;s:6:\"parent\";r:667;s:8:\"children\";a:0:{}}s:32:\"admin/system/api/consumer/delete\";a:3:{s:8:\"instance\";r:691;s:6:\"parent\";r:667;s:8:\"children\";a:0:{}}s:33:\"admin/system/api/authorizedTokens\";a:3:{s:8:\"instance\";r:669;s:6:\"parent\";r:243;s:8:\"children\";a:0:{}}s:34:\"admin/system/api/oauth_admin_token\";a:3:{s:8:\"instance\";r:671;s:6:\"parent\";r:243;s:8:\"children\";a:0:{}}s:27:\"admin/system/api/rest_roles\";a:3:{s:8:\"instance\";r:673;s:6:\"parent\";r:243;s:8:\"children\";a:3:{s:31:\"admin/system/api/rest_roles/add\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/system/api/rest_roles/add\";}s:32:\"admin/system/api/rest_roles/edit\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/system/api/rest_roles/edit\";}s:34:\"admin/system/api/rest_roles/delete\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:34:\"admin/system/api/rest_roles/delete\";}}}s:31:\"admin/system/api/rest_roles/add\";a:3:{s:8:\"instance\";r:713;s:6:\"parent\";r:673;s:8:\"children\";a:0:{}}s:32:\"admin/system/api/rest_roles/edit\";a:3:{s:8:\"instance\";r:715;s:6:\"parent\";r:673;s:8:\"children\";a:0:{}}s:34:\"admin/system/api/rest_roles/delete\";a:3:{s:8:\"instance\";r:717;s:6:\"parent\";r:673;s:8:\"children\";a:0:{}}s:32:\"admin/system/api/rest_attributes\";a:3:{s:8:\"instance\";r:675;s:6:\"parent\";r:243;s:8:\"children\";a:1:{s:37:\"admin/system/api/rest_attributes/edit\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:37:\"admin/system/api/rest_attributes/edit\";}}}s:37:\"admin/system/api/rest_attributes/edit\";a:3:{s:8:\"instance\";r:735;s:6:\"parent\";r:675;s:8:\"children\";a:0:{}}s:19:\"admin/global_search\";a:3:{s:8:\"instance\";r:183;s:6:\"parent\";r:175;s:8:\"children\";a:0:{}}s:9:\"admin/cms\";a:3:{s:8:\"instance\";r:185;s:6:\"parent\";r:175;s:8:\"children\";a:5:{s:15:\"admin/cms/block\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:15:\"admin/cms/block\";}s:14:\"admin/cms/page\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:14:\"admin/cms/page\";}s:23:\"admin/cms/media_gallery\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/cms/media_gallery\";}s:14:\"admin/cms/poll\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:14:\"admin/cms/poll\";}s:25:\"admin/cms/widget_instance\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/cms/widget_instance\";}}}s:15:\"admin/cms/block\";a:3:{s:8:\"instance\";r:749;s:6:\"parent\";r:185;s:8:\"children\";a:0:{}}s:14:\"admin/cms/page\";a:3:{s:8:\"instance\";r:751;s:6:\"parent\";r:185;s:8:\"children\";a:2:{s:19:\"admin/cms/page/save\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/cms/page/save\";}s:21:\"admin/cms/page/delete\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/cms/page/delete\";}}}s:19:\"admin/cms/page/save\";a:3:{s:8:\"instance\";r:767;s:6:\"parent\";r:751;s:8:\"children\";a:0:{}}s:21:\"admin/cms/page/delete\";a:3:{s:8:\"instance\";r:769;s:6:\"parent\";r:751;s:8:\"children\";a:0:{}}s:23:\"admin/cms/media_gallery\";a:3:{s:8:\"instance\";r:753;s:6:\"parent\";r:185;s:8:\"children\";a:0:{}}s:14:\"admin/cms/poll\";a:3:{s:8:\"instance\";r:755;s:6:\"parent\";r:185;s:8:\"children\";a:0:{}}s:25:\"admin/cms/widget_instance\";a:3:{s:8:\"instance\";r:757;s:6:\"parent\";r:185;s:8:\"children\";a:0:{}}s:14:\"admin/customer\";a:3:{s:8:\"instance\";r:187;s:6:\"parent\";r:175;s:8:\"children\";a:3:{s:20:\"admin/customer/group\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:20:\"admin/customer/group\";}s:21:\"admin/customer/manage\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/customer/manage\";}s:21:\"admin/customer/online\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/customer/online\";}}}s:20:\"admin/customer/group\";a:3:{s:8:\"instance\";r:795;s:6:\"parent\";r:187;s:8:\"children\";a:0:{}}s:21:\"admin/customer/manage\";a:3:{s:8:\"instance\";r:797;s:6:\"parent\";r:187;s:8:\"children\";a:0:{}}s:21:\"admin/customer/online\";a:3:{s:8:\"instance\";r:799;s:6:\"parent\";r:187;s:8:\"children\";a:0:{}}s:13:\"admin/catalog\";a:3:{s:8:\"instance\";r:189;s:6:\"parent\";r:175;s:8:\"children\";a:9:{s:24:\"admin/catalog/attributes\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/catalog/attributes\";}s:24:\"admin/catalog/categories\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/catalog/categories\";}s:22:\"admin/catalog/products\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/catalog/products\";}s:31:\"admin/catalog/update_attributes\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/catalog/update_attributes\";}s:24:\"admin/catalog/urlrewrite\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/catalog/urlrewrite\";}s:20:\"admin/catalog/search\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:20:\"admin/catalog/search\";}s:29:\"admin/catalog/reviews_ratings\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/catalog/reviews_ratings\";}s:17:\"admin/catalog/tag\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:17:\"admin/catalog/tag\";}s:21:\"admin/catalog/sitemap\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/catalog/sitemap\";}}}s:24:\"admin/catalog/attributes\";a:3:{s:8:\"instance\";r:817;s:6:\"parent\";r:189;s:8:\"children\";a:2:{s:35:\"admin/catalog/attributes/attributes\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:35:\"admin/catalog/attributes/attributes\";}s:29:\"admin/catalog/attributes/sets\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/catalog/attributes/sets\";}}}s:35:\"admin/catalog/attributes/attributes\";a:3:{s:8:\"instance\";r:839;s:6:\"parent\";r:817;s:8:\"children\";a:0:{}}s:29:\"admin/catalog/attributes/sets\";a:3:{s:8:\"instance\";r:841;s:6:\"parent\";r:817;s:8:\"children\";a:0:{}}s:24:\"admin/catalog/categories\";a:3:{s:8:\"instance\";r:819;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:22:\"admin/catalog/products\";a:3:{s:8:\"instance\";r:821;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:31:\"admin/catalog/update_attributes\";a:3:{s:8:\"instance\";r:823;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:24:\"admin/catalog/urlrewrite\";a:3:{s:8:\"instance\";r:825;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:20:\"admin/catalog/search\";a:3:{s:8:\"instance\";r:827;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:29:\"admin/catalog/reviews_ratings\";a:3:{s:8:\"instance\";r:829;s:6:\"parent\";r:189;s:8:\"children\";a:2:{s:37:\"admin/catalog/reviews_ratings/reviews\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:37:\"admin/catalog/reviews_ratings/reviews\";}s:37:\"admin/catalog/reviews_ratings/ratings\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:37:\"admin/catalog/reviews_ratings/ratings\";}}}s:37:\"admin/catalog/reviews_ratings/reviews\";a:3:{s:8:\"instance\";r:875;s:6:\"parent\";r:829;s:8:\"children\";a:2:{s:41:\"admin/catalog/reviews_ratings/reviews/all\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:41:\"admin/catalog/reviews_ratings/reviews/all\";}s:45:\"admin/catalog/reviews_ratings/reviews/pending\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:45:\"admin/catalog/reviews_ratings/reviews/pending\";}}}s:41:\"admin/catalog/reviews_ratings/reviews/all\";a:3:{s:8:\"instance\";r:883;s:6:\"parent\";r:875;s:8:\"children\";a:0:{}}s:45:\"admin/catalog/reviews_ratings/reviews/pending\";a:3:{s:8:\"instance\";r:885;s:6:\"parent\";r:875;s:8:\"children\";a:0:{}}s:37:\"admin/catalog/reviews_ratings/ratings\";a:3:{s:8:\"instance\";r:877;s:6:\"parent\";r:829;s:8:\"children\";a:0:{}}s:17:\"admin/catalog/tag\";a:3:{s:8:\"instance\";r:831;s:6:\"parent\";r:189;s:8:\"children\";a:2:{s:21:\"admin/catalog/tag/all\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/catalog/tag/all\";}s:25:\"admin/catalog/tag/pending\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/catalog/tag/pending\";}}}s:21:\"admin/catalog/tag/all\";a:3:{s:8:\"instance\";r:903;s:6:\"parent\";r:831;s:8:\"children\";a:0:{}}s:25:\"admin/catalog/tag/pending\";a:3:{s:8:\"instance\";r:905;s:6:\"parent\";r:831;s:8:\"children\";a:0:{}}s:21:\"admin/catalog/sitemap\";a:3:{s:8:\"instance\";r:833;s:6:\"parent\";r:189;s:8:\"children\";a:0:{}}s:11:\"admin/promo\";a:3:{s:8:\"instance\";r:191;s:6:\"parent\";r:175;s:8:\"children\";a:2:{s:19:\"admin/promo/catalog\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/promo/catalog\";}s:17:\"admin/promo/quote\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:17:\"admin/promo/quote\";}}}s:19:\"admin/promo/catalog\";a:3:{s:8:\"instance\";r:923;s:6:\"parent\";r:191;s:8:\"children\";a:0:{}}s:17:\"admin/promo/quote\";a:3:{s:8:\"instance\";r:925;s:6:\"parent\";r:191;s:8:\"children\";a:0:{}}s:11:\"admin/sales\";a:3:{s:8:\"instance\";r:193;s:6:\"parent\";r:175;s:8:\"children\";a:9:{s:17:\"admin/sales/order\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:17:\"admin/sales/order\";}s:19:\"admin/sales/invoice\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/sales/invoice\";}s:20:\"admin/sales/shipment\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:20:\"admin/sales/shipment\";}s:22:\"admin/sales/creditmemo\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/sales/creditmemo\";}s:24:\"admin/sales/transactions\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/sales/transactions\";}s:29:\"admin/sales/recurring_profile\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/sales/recurring_profile\";}s:29:\"admin/sales/billing_agreement\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/sales/billing_agreement\";}s:29:\"admin/sales/checkoutagreement\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/sales/checkoutagreement\";}s:15:\"admin/sales/tax\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:15:\"admin/sales/tax\";}}}s:17:\"admin/sales/order\";a:3:{s:8:\"instance\";r:939;s:6:\"parent\";r:193;s:8:\"children\";a:1:{s:25:\"admin/sales/order/actions\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/sales/order/actions\";}}}s:25:\"admin/sales/order/actions\";a:3:{s:8:\"instance\";r:961;s:6:\"parent\";r:939;s:8:\"children\";a:15:{s:32:\"admin/sales/order/actions/create\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/sales/order/actions/create\";}s:30:\"admin/sales/order/actions/view\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/sales/order/actions/view\";}s:31:\"admin/sales/order/actions/email\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/sales/order/actions/email\";}s:33:\"admin/sales/order/actions/reorder\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/sales/order/actions/reorder\";}s:30:\"admin/sales/order/actions/edit\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/sales/order/actions/edit\";}s:32:\"admin/sales/order/actions/cancel\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/sales/order/actions/cancel\";}s:40:\"admin/sales/order/actions/review_payment\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:40:\"admin/sales/order/actions/review_payment\";}s:33:\"admin/sales/order/actions/capture\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/sales/order/actions/capture\";}s:33:\"admin/sales/order/actions/invoice\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/sales/order/actions/invoice\";}s:36:\"admin/sales/order/actions/creditmemo\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:36:\"admin/sales/order/actions/creditmemo\";}s:30:\"admin/sales/order/actions/hold\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/sales/order/actions/hold\";}s:32:\"admin/sales/order/actions/unhold\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/sales/order/actions/unhold\";}s:30:\"admin/sales/order/actions/ship\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/sales/order/actions/ship\";}s:33:\"admin/sales/order/actions/comment\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/sales/order/actions/comment\";}s:32:\"admin/sales/order/actions/emails\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/sales/order/actions/emails\";}}}s:32:\"admin/sales/order/actions/create\";a:3:{s:8:\"instance\";r:967;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:30:\"admin/sales/order/actions/view\";a:3:{s:8:\"instance\";r:969;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:31:\"admin/sales/order/actions/email\";a:3:{s:8:\"instance\";r:971;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:33:\"admin/sales/order/actions/reorder\";a:3:{s:8:\"instance\";r:973;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:30:\"admin/sales/order/actions/edit\";a:3:{s:8:\"instance\";r:975;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:32:\"admin/sales/order/actions/cancel\";a:3:{s:8:\"instance\";r:977;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:40:\"admin/sales/order/actions/review_payment\";a:3:{s:8:\"instance\";r:979;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:33:\"admin/sales/order/actions/capture\";a:3:{s:8:\"instance\";r:981;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:33:\"admin/sales/order/actions/invoice\";a:3:{s:8:\"instance\";r:983;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:36:\"admin/sales/order/actions/creditmemo\";a:3:{s:8:\"instance\";r:985;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:30:\"admin/sales/order/actions/hold\";a:3:{s:8:\"instance\";r:987;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:32:\"admin/sales/order/actions/unhold\";a:3:{s:8:\"instance\";r:989;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:30:\"admin/sales/order/actions/ship\";a:3:{s:8:\"instance\";r:991;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:33:\"admin/sales/order/actions/comment\";a:3:{s:8:\"instance\";r:993;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:32:\"admin/sales/order/actions/emails\";a:3:{s:8:\"instance\";r:995;s:6:\"parent\";r:961;s:8:\"children\";a:0:{}}s:19:\"admin/sales/invoice\";a:3:{s:8:\"instance\";r:941;s:6:\"parent\";r:193;s:8:\"children\";a:0:{}}s:20:\"admin/sales/shipment\";a:3:{s:8:\"instance\";r:943;s:6:\"parent\";r:193;s:8:\"children\";a:0:{}}s:22:\"admin/sales/creditmemo\";a:3:{s:8:\"instance\";r:945;s:6:\"parent\";r:193;s:8:\"children\";a:0:{}}s:24:\"admin/sales/transactions\";a:3:{s:8:\"instance\";r:947;s:6:\"parent\";r:193;s:8:\"children\";a:1:{s:30:\"admin/sales/transactions/fetch\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/sales/transactions/fetch\";}}}s:30:\"admin/sales/transactions/fetch\";a:3:{s:8:\"instance\";r:1073;s:6:\"parent\";r:947;s:8:\"children\";a:0:{}}s:29:\"admin/sales/recurring_profile\";a:3:{s:8:\"instance\";r:949;s:6:\"parent\";r:193;s:8:\"children\";a:0:{}}s:29:\"admin/sales/billing_agreement\";a:3:{s:8:\"instance\";r:951;s:6:\"parent\";r:193;s:8:\"children\";a:1:{s:37:\"admin/sales/billing_agreement/actions\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:37:\"admin/sales/billing_agreement/actions\";}}}s:37:\"admin/sales/billing_agreement/actions\";a:3:{s:8:\"instance\";r:1087;s:6:\"parent\";r:951;s:8:\"children\";a:3:{s:42:\"admin/sales/billing_agreement/actions/view\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:42:\"admin/sales/billing_agreement/actions/view\";}s:44:\"admin/sales/billing_agreement/actions/manage\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:44:\"admin/sales/billing_agreement/actions/manage\";}s:41:\"admin/sales/billing_agreement/actions/use\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:41:\"admin/sales/billing_agreement/actions/use\";}}}s:42:\"admin/sales/billing_agreement/actions/view\";a:3:{s:8:\"instance\";r:1093;s:6:\"parent\";r:1087;s:8:\"children\";a:0:{}}s:44:\"admin/sales/billing_agreement/actions/manage\";a:3:{s:8:\"instance\";r:1095;s:6:\"parent\";r:1087;s:8:\"children\";a:0:{}}s:41:\"admin/sales/billing_agreement/actions/use\";a:3:{s:8:\"instance\";r:1097;s:6:\"parent\";r:1087;s:8:\"children\";a:0:{}}s:29:\"admin/sales/checkoutagreement\";a:3:{s:8:\"instance\";r:953;s:6:\"parent\";r:193;s:8:\"children\";a:0:{}}s:15:\"admin/sales/tax\";a:3:{s:8:\"instance\";r:955;s:6:\"parent\";r:193;s:8:\"children\";a:5:{s:32:\"admin/sales/tax/classes_customer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:32:\"admin/sales/tax/classes_customer\";}s:31:\"admin/sales/tax/classes_product\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/sales/tax/classes_product\";}s:29:\"admin/sales/tax/import_export\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/sales/tax/import_export\";}s:21:\"admin/sales/tax/rates\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/sales/tax/rates\";}s:21:\"admin/sales/tax/rules\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/sales/tax/rules\";}}}s:32:\"admin/sales/tax/classes_customer\";a:3:{s:8:\"instance\";r:1119;s:6:\"parent\";r:955;s:8:\"children\";a:0:{}}s:31:\"admin/sales/tax/classes_product\";a:3:{s:8:\"instance\";r:1121;s:6:\"parent\";r:955;s:8:\"children\";a:0:{}}s:29:\"admin/sales/tax/import_export\";a:3:{s:8:\"instance\";r:1123;s:6:\"parent\";r:955;s:8:\"children\";a:0:{}}s:21:\"admin/sales/tax/rates\";a:3:{s:8:\"instance\";r:1125;s:6:\"parent\";r:955;s:8:\"children\";a:0:{}}s:21:\"admin/sales/tax/rules\";a:3:{s:8:\"instance\";r:1127;s:6:\"parent\";r:955;s:8:\"children\";a:0:{}}s:12:\"admin/report\";a:3:{s:8:\"instance\";r:195;s:6:\"parent\";r:175;s:8:\"children\";a:8:{s:22:\"admin/report/salesroot\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/report/salesroot\";}s:21:\"admin/report/shopcart\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/report/shopcart\";}s:21:\"admin/report/products\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:21:\"admin/report/products\";}s:22:\"admin/report/customers\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/report/customers\";}s:19:\"admin/report/review\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/report/review\";}s:17:\"admin/report/tags\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:17:\"admin/report/tags\";}s:19:\"admin/report/search\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:19:\"admin/report/search\";}s:23:\"admin/report/statistics\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/report/statistics\";}}}s:22:\"admin/report/salesroot\";a:3:{s:8:\"instance\";r:1153;s:6:\"parent\";r:195;s:8:\"children\";a:7:{s:48:\"admin/report/salesroot/paypal_settlement_reports\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:48:\"admin/report/salesroot/paypal_settlement_reports\";}s:28:\"admin/report/salesroot/sales\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/report/salesroot/sales\";}s:26:\"admin/report/salesroot/tax\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/report/salesroot/tax\";}s:31:\"admin/report/salesroot/shipping\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/salesroot/shipping\";}s:31:\"admin/report/salesroot/invoiced\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/salesroot/invoiced\";}s:31:\"admin/report/salesroot/refunded\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/salesroot/refunded\";}s:30:\"admin/report/salesroot/coupons\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/report/salesroot/coupons\";}}}s:48:\"admin/report/salesroot/paypal_settlement_reports\";a:3:{s:8:\"instance\";r:1173;s:6:\"parent\";r:1153;s:8:\"children\";a:2:{s:53:\"admin/report/salesroot/paypal_settlement_reports/view\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:53:\"admin/report/salesroot/paypal_settlement_reports/view\";}s:54:\"admin/report/salesroot/paypal_settlement_reports/fetch\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:54:\"admin/report/salesroot/paypal_settlement_reports/fetch\";}}}s:53:\"admin/report/salesroot/paypal_settlement_reports/view\";a:3:{s:8:\"instance\";r:1191;s:6:\"parent\";r:1173;s:8:\"children\";a:0:{}}s:54:\"admin/report/salesroot/paypal_settlement_reports/fetch\";a:3:{s:8:\"instance\";r:1193;s:6:\"parent\";r:1173;s:8:\"children\";a:0:{}}s:28:\"admin/report/salesroot/sales\";a:3:{s:8:\"instance\";r:1175;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:26:\"admin/report/salesroot/tax\";a:3:{s:8:\"instance\";r:1177;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:31:\"admin/report/salesroot/shipping\";a:3:{s:8:\"instance\";r:1179;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:31:\"admin/report/salesroot/invoiced\";a:3:{s:8:\"instance\";r:1181;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:31:\"admin/report/salesroot/refunded\";a:3:{s:8:\"instance\";r:1183;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:30:\"admin/report/salesroot/coupons\";a:3:{s:8:\"instance\";r:1185;s:6:\"parent\";r:1153;s:8:\"children\";a:0:{}}s:21:\"admin/report/shopcart\";a:3:{s:8:\"instance\";r:1155;s:6:\"parent\";r:195;s:8:\"children\";a:2:{s:29:\"admin/report/shopcart/product\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/report/shopcart/product\";}s:31:\"admin/report/shopcart/abandoned\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/shopcart/abandoned\";}}}s:29:\"admin/report/shopcart/product\";a:3:{s:8:\"instance\";r:1231;s:6:\"parent\";r:1155;s:8:\"children\";a:0:{}}s:31:\"admin/report/shopcart/abandoned\";a:3:{s:8:\"instance\";r:1233;s:6:\"parent\";r:1155;s:8:\"children\";a:0:{}}s:21:\"admin/report/products\";a:3:{s:8:\"instance\";r:1157;s:6:\"parent\";r:195;s:8:\"children\";a:5:{s:33:\"admin/report/products/bestsellers\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:33:\"admin/report/products/bestsellers\";}s:26:\"admin/report/products/sold\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/report/products/sold\";}s:28:\"admin/report/products/viewed\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/report/products/viewed\";}s:30:\"admin/report/products/lowstock\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:30:\"admin/report/products/lowstock\";}s:31:\"admin/report/products/downloads\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/products/downloads\";}}}s:33:\"admin/report/products/bestsellers\";a:3:{s:8:\"instance\";r:1247;s:6:\"parent\";r:1157;s:8:\"children\";a:0:{}}s:26:\"admin/report/products/sold\";a:3:{s:8:\"instance\";r:1249;s:6:\"parent\";r:1157;s:8:\"children\";a:0:{}}s:28:\"admin/report/products/viewed\";a:3:{s:8:\"instance\";r:1251;s:6:\"parent\";r:1157;s:8:\"children\";a:0:{}}s:30:\"admin/report/products/lowstock\";a:3:{s:8:\"instance\";r:1253;s:6:\"parent\";r:1157;s:8:\"children\";a:0:{}}s:31:\"admin/report/products/downloads\";a:3:{s:8:\"instance\";r:1255;s:6:\"parent\";r:1157;s:8:\"children\";a:0:{}}s:22:\"admin/report/customers\";a:3:{s:8:\"instance\";r:1159;s:6:\"parent\";r:195;s:8:\"children\";a:3:{s:31:\"admin/report/customers/accounts\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:31:\"admin/report/customers/accounts\";}s:29:\"admin/report/customers/totals\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/report/customers/totals\";}s:29:\"admin/report/customers/orders\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:29:\"admin/report/customers/orders\";}}}s:31:\"admin/report/customers/accounts\";a:3:{s:8:\"instance\";r:1281;s:6:\"parent\";r:1159;s:8:\"children\";a:0:{}}s:29:\"admin/report/customers/totals\";a:3:{s:8:\"instance\";r:1283;s:6:\"parent\";r:1159;s:8:\"children\";a:0:{}}s:29:\"admin/report/customers/orders\";a:3:{s:8:\"instance\";r:1285;s:6:\"parent\";r:1159;s:8:\"children\";a:0:{}}s:19:\"admin/report/review\";a:3:{s:8:\"instance\";r:1161;s:6:\"parent\";r:195;s:8:\"children\";a:2:{s:28:\"admin/report/review/customer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:28:\"admin/report/review/customer\";}s:27:\"admin/report/review/product\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/report/review/product\";}}}s:28:\"admin/report/review/customer\";a:3:{s:8:\"instance\";r:1303;s:6:\"parent\";r:1161;s:8:\"children\";a:0:{}}s:27:\"admin/report/review/product\";a:3:{s:8:\"instance\";r:1305;s:6:\"parent\";r:1161;s:8:\"children\";a:0:{}}s:17:\"admin/report/tags\";a:3:{s:8:\"instance\";r:1163;s:6:\"parent\";r:195;s:8:\"children\";a:3:{s:26:\"admin/report/tags/customer\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/report/tags/customer\";}s:25:\"admin/report/tags/popular\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/report/tags/popular\";}s:25:\"admin/report/tags/product\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/report/tags/product\";}}}s:26:\"admin/report/tags/customer\";a:3:{s:8:\"instance\";r:1319;s:6:\"parent\";r:1163;s:8:\"children\";a:0:{}}s:25:\"admin/report/tags/popular\";a:3:{s:8:\"instance\";r:1321;s:6:\"parent\";r:1163;s:8:\"children\";a:0:{}}s:25:\"admin/report/tags/product\";a:3:{s:8:\"instance\";r:1323;s:6:\"parent\";r:1163;s:8:\"children\";a:0:{}}s:19:\"admin/report/search\";a:3:{s:8:\"instance\";r:1165;s:6:\"parent\";r:195;s:8:\"children\";a:0:{}}s:23:\"admin/report/statistics\";a:3:{s:8:\"instance\";r:1167;s:6:\"parent\";r:195;s:8:\"children\";a:0:{}}s:16:\"admin/newsletter\";a:3:{s:8:\"instance\";r:197;s:6:\"parent\";r:175;s:8:\"children\";a:4:{s:24:\"admin/newsletter/problem\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/newsletter/problem\";}s:22:\"admin/newsletter/queue\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/newsletter/queue\";}s:27:\"admin/newsletter/subscriber\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:27:\"admin/newsletter/subscriber\";}s:25:\"admin/newsletter/template\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:25:\"admin/newsletter/template\";}}}s:24:\"admin/newsletter/problem\";a:3:{s:8:\"instance\";r:1349;s:6:\"parent\";r:197;s:8:\"children\";a:0:{}}s:22:\"admin/newsletter/queue\";a:3:{s:8:\"instance\";r:1351;s:6:\"parent\";r:197;s:8:\"children\";a:0:{}}s:27:\"admin/newsletter/subscriber\";a:3:{s:8:\"instance\";r:1353;s:6:\"parent\";r:197;s:8:\"children\";a:0:{}}s:25:\"admin/newsletter/template\";a:3:{s:8:\"instance\";r:1355;s:6:\"parent\";r:197;s:8:\"children\";a:0:{}}s:16:\"admin/page_cache\";a:3:{s:8:\"instance\";r:199;s:6:\"parent\";r:175;s:8:\"children\";a:0:{}}s:16:\"admin/xmlconnect\";a:3:{s:8:\"instance\";r:201;s:6:\"parent\";r:175;s:8:\"children\";a:4:{s:23:\"admin/xmlconnect/mobile\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:23:\"admin/xmlconnect/mobile\";}s:24:\"admin/xmlconnect/history\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:24:\"admin/xmlconnect/history\";}s:26:\"admin/xmlconnect/templates\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:26:\"admin/xmlconnect/templates\";}s:22:\"admin/xmlconnect/queue\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:22:\"admin/xmlconnect/queue\";}}}s:23:\"admin/xmlconnect/mobile\";a:3:{s:8:\"instance\";r:1381;s:6:\"parent\";r:201;s:8:\"children\";a:0:{}}s:24:\"admin/xmlconnect/history\";a:3:{s:8:\"instance\";r:1383;s:6:\"parent\";r:201;s:8:\"children\";a:0:{}}s:26:\"admin/xmlconnect/templates\";a:3:{s:8:\"instance\";r:1385;s:6:\"parent\";r:201;s:8:\"children\";a:0:{}}s:22:\"admin/xmlconnect/queue\";a:3:{s:8:\"instance\";r:1387;s:6:\"parent\";r:201;s:8:\"children\";a:0:{}}s:22:\"admin/templates_master\";a:3:{s:8:\"instance\";r:203;s:6:\"parent\";r:175;s:8:\"children\";a:1:{s:36:\"admin/templates_master/tmcore_module\";O:29:\"Mage_Admin_Model_Acl_Resource\":1:{s:14:\"\0*\0_resourceId\";s:36:\"admin/templates_master/tmcore_module\";}}}s:36:\"admin/templates_master/tmcore_module\";a:3:{s:8:\"instance\";r:1409;s:6:\"parent\";r:203;s:8:\"children\";a:0:{}}}s:17:\"\0*\0_isAllowedRole\";r:161;s:21:\"\0*\0_isAllowedResource\";r:819;s:22:\"\0*\0_isAllowedPrivilege\";N;s:9:\"\0*\0_rules\";a:2:{s:12:\"allResources\";a:2:{s:8:\"allRoles\";a:2:{s:13:\"allPrivileges\";a:2:{s:4:\"type\";s:9:\"TYPE_DENY\";s:6:\"assert\";N;}s:13:\"byPrivilegeId\";a:0:{}}s:8:\"byRoleId\";a:1:{s:2:\"G1\";a:2:{s:13:\"byPrivilegeId\";a:0:{}s:13:\"allPrivileges\";a:2:{s:4:\"type\";s:10:\"TYPE_ALLOW\";s:6:\"assert\";N;}}}}s:12:\"byResourceId\";a:1:{s:3:\"all\";a:1:{s:8:\"byRoleId\";a:1:{s:2:\"G1\";a:2:{s:13:\"byPrivilegeId\";a:0:{}s:13:\"allPrivileges\";a:2:{s:4:\"type\";s:10:\"TYPE_ALLOW\";s:6:\"assert\";N;}}}}}}}s:17:\"last_viewed_store\";N;s:13:\"active_tab_id\";s:26:\"category_info_tabs_group_4\";s:20:\"is_tree_was_expanded\";b:0;s:20:\"last_edited_category\";s:1:\"7\";}store_admin|a:2:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}}'),('ba4b29c602b5513e532b01d1624cef7e',1380213358,'core|a:6:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:15:\"just_voted_poll\";b:0;s:12:\"visitor_data\";a:16:{s:0:\"\";N;s:11:\"server_addr\";b:0;s:11:\"remote_addr\";b:0;s:11:\"http_secure\";b:0;s:9:\"http_host\";s:9:\"localhost\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";s:20:\"http_accept_language\";s:5:\"zh-cn\";s:19:\"http_accept_charset\";s:0:\"\";s:11:\"request_uri\";s:45:\"/magento/index.php/catalog/category/view/id/7\";s:10:\"session_id\";s:32:\"ba4b29c602b5513e532b01d1624cef7e\";s:12:\"http_referer\";s:52:\"http://localhost/magento/index.php/ae-aeoe-e-se.html\";s:14:\"first_visit_at\";s:19:\"2013-09-26 14:30:21\";s:14:\"is_new_visitor\";b:0;s:13:\"last_visit_at\";s:19:\"2013-09-26 15:35:58\";s:10:\"visitor_id\";s:2:\"16\";s:11:\"last_url_id\";s:3:\"886\";}s:8:\"last_url\";s:62:\"http://localhost/magento/index.php/catalog/category/view/id/7/\";}customer_base|a:8:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:19:\"wishlist_item_count\";i:0;s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:15:\"before_auth_url\";s:58:\"http://localhost/magento/index.php/customer/account/index/\";s:19:\"before_wishlist_url\";s:58:\"http://localhost/magento/index.php/customer/account/login/\";s:23:\"before_wishlist_request\";a:0:{}s:2:\"id\";N;}catalog|a:8:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:24:\"last_visited_category_id\";s:1:\"7\";s:23:\"last_viewed_category_id\";s:1:\"7\";s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:27:\"catalog_compare_items_count\";i:0;s:22:\"last_viewed_product_id\";s:1:\"2\";s:10:\"limit_page\";s:2:\"15\";}checkout|a:4:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}s:16:\"cart_was_updated\";b:1;}store_default|a:2:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}}reports|a:4:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:28:\"product_index_compared_count\";i:0;s:26:\"product_index_viewed_count\";i:1;}tag|a:3:{s:23:\"_session_validator_data\";a:4:{s:11:\"remote_addr\";s:3:\"::1\";s:8:\"http_via\";s:0:\"\";s:20:\"http_x_forwarded_for\";s:0:\"\";s:15:\"http_user_agent\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1\";}s:13:\"session_hosts\";a:1:{s:9:\"localhost\";b:1;}s:8:\"messages\";O:34:\"Mage_Core_Model_Message_Collection\":2:{s:12:\"\0*\0_messages\";a:0:{}s:20:\"\0*\0_lastAddedMessage\";N;}}');
/*!40000 ALTER TABLE `core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `UNQ_CORE_STORE_CODE` (`code`),
  KEY `IDX_CORE_STORE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CORE_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `IDX_CORE_STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `FK_CORE_STORE_GROUP_ID_CORE_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_STORE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store_group`
--

DROP TABLE IF EXISTS `core_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `IDX_CORE_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `IDX_CORE_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `FK_CORE_STORE_GROUP_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store_group`
--

LOCK TABLES `core_store_group` WRITE;
/*!40000 ALTER TABLE `core_store_group` DISABLE KEYS */;
INSERT INTO `core_store_group` VALUES (0,0,'Default',0,0),(1,1,'Main Website Store',2,1);
/*!40000 ALTER TABLE `core_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_translate`
--

DROP TABLE IF EXISTS `core_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `UNQ_CORE_TRANSLATE_STORE_ID_LOCALE_STRING` (`store_id`,`locale`,`string`),
  KEY `IDX_CORE_TRANSLATE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CORE_TRANSLATE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_translate`
--

LOCK TABLES `core_translate` WRITE;
/*!40000 ALTER TABLE `core_translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_url_rewrite`
--

DROP TABLE IF EXISTS `core_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `id_path` varchar(255) DEFAULT NULL COMMENT 'Id Path',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `is_system` smallint(5) unsigned DEFAULT '1' COMMENT 'Defines is Rewrite System',
  `options` varchar(255) DEFAULT NULL COMMENT 'Options',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deascription',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_CORE_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_CORE_URL_REWRITE_ID_PATH_IS_SYSTEM_STORE_ID` (`id_path`,`is_system`,`store_id`),
  KEY `IDX_CORE_URL_REWRITE_TARGET_PATH_STORE_ID` (`target_path`,`store_id`),
  KEY `IDX_CORE_URL_REWRITE_ID_PATH` (`id_path`),
  KEY `IDX_CORE_URL_REWRITE_STORE_ID` (`store_id`),
  KEY `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` (`category_id`),
  KEY `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` (`product_id`),
  CONSTRAINT `FK_CORE_URL_REWRITE_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_PRODUCT_ID_CATALOG_CATEGORY_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_URL_REWRITE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_url_rewrite`
--

LOCK TABLES `core_url_rewrite` WRITE;
/*!40000 ALTER TABLE `core_url_rewrite` DISABLE KEYS */;
INSERT INTO `core_url_rewrite` VALUES (1,1,'category/6','ae-aeoe-e-se.html','catalog/category/view/id/6',1,NULL,NULL,6,NULL),(2,1,'category/7','ae-aeoe-e-se/ae-aeoe-e-a.html','catalog/category/view/id/7',1,NULL,NULL,7,NULL),(4,1,'20758600_1379775924','ae-aeoe-e-a.html','ae-aeoe-e-se/ae-aeoe-e-a.html',0,'RP',NULL,7,NULL),(9,1,'product/1/6','ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html','catalog/product/view/id/1/category/6',1,NULL,NULL,6,1),(10,1,'product/1','samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html','catalog/product/view/id/1',1,NULL,NULL,NULL,1),(11,1,'product/2','apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html','catalog/product/view/id/2',1,NULL,NULL,NULL,2),(12,1,'product/2/6','ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html','catalog/product/view/id/2/category/6',1,NULL,NULL,6,2),(20,1,'product/3','v2rock-iphone-4-4s-ipad-2-usb.html','catalog/product/view/id/3',1,NULL,NULL,NULL,3),(21,1,'category/8','aeoe-ae-a-a.html','catalog/category/view/id/8',1,NULL,NULL,8,NULL),(24,1,'product/1/8','aeoe-ae-a-a/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html','catalog/product/view/id/1/category/8',1,NULL,NULL,8,1),(26,1,'product/2/8','aeoe-ae-a-a/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html','catalog/product/view/id/2/category/8',1,NULL,NULL,8,2),(28,1,'product/3/8','aeoe-ae-a-a/v2rock-iphone-4-4s-ipad-2-usb.html','catalog/product/view/id/3/category/8',1,NULL,NULL,8,3),(29,1,'product/4/7','ae-aeoe-e-se/ae-aeoe-e-a/ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html','catalog/product/view/id/4/category/7',1,NULL,NULL,7,4),(30,1,'product/4/8','aeoe-ae-a-a/ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html','catalog/product/view/id/4/category/8',1,NULL,NULL,8,4),(31,1,'product/4','ruien-rusb2-2a-ipad-2-iphone-ipod-usb.html','catalog/product/view/id/4',1,NULL,NULL,NULL,4),(32,1,'product/5/7','ae-aeoe-e-se/ae-aeoe-e-a/skyworth-42e5chr-42-led.html','catalog/product/view/id/5/category/7',1,NULL,NULL,7,5),(33,1,'product/5/8','aeoe-ae-a-a/skyworth-42e5chr-42-led.html','catalog/product/view/id/5/category/8',1,NULL,NULL,8,5),(34,1,'product/5','skyworth-42e5chr-42-led.html','catalog/product/view/id/5',1,NULL,NULL,NULL,5),(38,1,'product/7/7','ae-aeoe-e-se/ae-aeoe-e-a/sony-kdl-50r556a-50-3d-2013.html','catalog/product/view/id/7/category/7',1,NULL,NULL,7,7),(39,1,'product/7/8','aeoe-ae-a-a/sony-kdl-50r556a-50-3d-2013.html','catalog/product/view/id/7/category/8',1,NULL,NULL,8,7),(40,1,'product/7','sony-kdl-50r556a-50-3d-2013.html','catalog/product/view/id/7',1,NULL,NULL,NULL,7);
/*!40000 ALTER TABLE `core_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable`
--

DROP TABLE IF EXISTS `core_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable`
--

LOCK TABLES `core_variable` WRITE;
/*!40000 ALTER TABLE `core_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_variable_value`
--

DROP TABLE IF EXISTS `core_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `IDX_CORE_VARIABLE_VALUE_VARIABLE_ID` (`variable_id`),
  KEY `IDX_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID_CORE_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_variable_value`
--

LOCK TABLES `core_variable_value` WRITE;
/*!40000 ALTER TABLE `core_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_website`
--

DROP TABLE IF EXISTS `core_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `UNQ_CORE_WEBSITE_CODE` (`code`),
  KEY `IDX_CORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `IDX_CORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_website`
--

LOCK TABLES `core_website` WRITE;
/*!40000 ALTER TABLE `core_website` DISABLE KEYS */;
INSERT INTO `core_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `core_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated`
--

DROP TABLE IF EXISTS `coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_COUPON_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated`
--

LOCK TABLES `coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated_order`
--

DROP TABLE IF EXISTS `coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_COUPON_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated_order`
--

LOCK TABLES `coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_COUPON_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `IDX_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_COUPON_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_aggregated_updated`
--

LOCK TABLES `coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `IDX_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `IDX_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_schedule`
--

LOCK TABLES `cron_schedule` WRITE;
/*!40000 ALTER TABLE `cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity`
--

LOCK TABLES `customer_address_entity` WRITE;
/*!40000 ALTER TABLE `customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_datetime`
--

LOCK TABLES `customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_decimal`
--

LOCK TABLES `customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_int`
--

LOCK TABLES `customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_text`
--

LOCK TABLES `customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `FK_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute`
--

LOCK TABLES `customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL),(2,0,NULL,0,NULL,1,0,NULL),(3,1,NULL,0,NULL,1,20,NULL),(4,0,NULL,0,NULL,0,30,NULL),(5,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(6,0,NULL,0,NULL,0,50,NULL),(7,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(8,0,NULL,0,NULL,0,70,NULL),(9,1,NULL,0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,80,NULL),(10,1,NULL,0,NULL,1,25,NULL),(11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,90,NULL),(12,0,NULL,0,NULL,1,0,NULL),(13,0,NULL,0,NULL,1,0,NULL),(14,0,NULL,0,NULL,1,0,NULL),(15,0,NULL,0,'a:1:{s:15:\"max_text_length\";i:255;}',0,100,NULL),(16,0,NULL,0,NULL,1,0,NULL),(17,0,NULL,0,NULL,0,0,NULL),(18,0,NULL,0,'a:0:{}',0,110,NULL),(19,0,NULL,0,NULL,0,10,NULL),(20,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,20,NULL),(21,0,NULL,0,NULL,0,30,NULL),(22,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(23,0,NULL,0,NULL,0,50,NULL),(24,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(25,1,NULL,2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,70,NULL),(26,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,80,NULL),(27,1,NULL,0,NULL,1,90,NULL),(28,1,NULL,0,NULL,1,100,NULL),(29,1,NULL,0,NULL,1,100,NULL),(30,1,NULL,0,'a:0:{}',1,110,'customer/attribute_data_postcode'),(31,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,120,NULL),(32,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,130,NULL),(33,0,NULL,0,NULL,1,0,NULL),(34,0,NULL,0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',1,0,NULL),(35,1,NULL,0,NULL,1,28,NULL),(36,1,NULL,0,NULL,1,140,NULL),(37,0,NULL,0,NULL,1,0,NULL),(38,0,NULL,0,NULL,1,0,NULL),(39,0,NULL,0,NULL,1,0,NULL),(40,0,NULL,0,NULL,1,0,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_EAV_ATTR_WS_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_eav_attribute_website`
--

LOCK TABLES `customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(2,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(4,1,NULL,NULL,NULL,NULL),(5,1,NULL,NULL,NULL,NULL),(6,1,NULL,NULL,NULL,NULL),(7,1,NULL,NULL,NULL,NULL),(8,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(12,1,NULL,NULL,NULL,NULL),(13,1,NULL,NULL,NULL,NULL),(14,1,NULL,NULL,NULL,NULL),(15,1,NULL,NULL,NULL,NULL),(16,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(22,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(26,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `IDX_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `IDX_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_CUSTOMER_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity`
--

LOCK TABLES `customer_entity` WRITE;
/*!40000 ALTER TABLE `customer_entity` DISABLE KEYS */;
INSERT INTO `customer_entity` VALUES (1,1,0,1,'tedi3231@gmail.com',1,NULL,1,'2013-09-24 05:56:58','2013-09-24 05:56:58',1,0);
/*!40000 ALTER TABLE `customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_datetime`
--

LOCK TABLES `customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_decimal`
--

LOCK TABLES `customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_int`
--

LOCK TABLES `customer_entity_int` WRITE;
/*!40000 ALTER TABLE `customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_CSTR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_text`
--

LOCK TABLES `customer_entity_text` WRITE;
/*!40000 ALTER TABLE `customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_entity_varchar`
--

LOCK TABLES `customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_entity_varchar` DISABLE KEYS */;
INSERT INTO `customer_entity_varchar` VALUES (1,1,5,1,'chunyan'),(2,1,7,1,'pan'),(3,1,12,1,'28f45b958913255562e1856c4bdf6c66:ev'),(5,1,3,1,'Default Store View');
/*!40000 ALTER TABLE `customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_form_attribute`
--

LOCK TABLES `customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `customer_form_attribute` DISABLE KEYS */;
INSERT INTO `customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('checkout_register',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('checkout_register',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('checkout_register',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('checkout_register',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('checkout_register',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('checkout_register',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('checkout_register',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',15),('adminhtml_customer',15),('checkout_register',15),('customer_account_create',15),('customer_account_edit',15),('adminhtml_customer',17),('checkout_register',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_checkout',18),('adminhtml_customer',18),('checkout_register',18),('customer_account_create',18),('customer_account_edit',18),('adminhtml_customer_address',19),('customer_address_edit',19),('customer_register_address',19),('adminhtml_customer_address',20),('customer_address_edit',20),('customer_register_address',20),('adminhtml_customer_address',21),('customer_address_edit',21),('customer_register_address',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch`
--

DROP TABLE IF EXISTS `dataflow_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `adapter` varchar(128) DEFAULT NULL COMMENT 'Adapter',
  `params` text COMMENT 'Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`batch_id`),
  KEY `IDX_DATAFLOW_BATCH_PROFILE_ID` (`profile_id`),
  KEY `IDX_DATAFLOW_BATCH_STORE_ID` (`store_id`),
  KEY `IDX_DATAFLOW_BATCH_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_DATAFLOW_BATCH_PROFILE_ID_DATAFLOW_PROFILE_PROFILE_ID` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_DATAFLOW_BATCH_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch`
--

LOCK TABLES `dataflow_batch` WRITE;
/*!40000 ALTER TABLE `dataflow_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_export`
--

DROP TABLE IF EXISTS `dataflow_batch_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Export Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_export_id`),
  KEY `IDX_DATAFLOW_BATCH_EXPORT_BATCH_ID` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_EXPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_export`
--

LOCK TABLES `dataflow_batch_export` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_batch_import`
--

DROP TABLE IF EXISTS `dataflow_batch_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Import Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_import_id`),
  KEY `IDX_DATAFLOW_BATCH_IMPORT_BATCH_ID` (`batch_id`),
  CONSTRAINT `FK_DATAFLOW_BATCH_IMPORT_BATCH_ID_DATAFLOW_BATCH_BATCH_ID` FOREIGN KEY (`batch_id`) REFERENCES `dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Import';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_batch_import`
--

LOCK TABLES `dataflow_batch_import` WRITE;
/*!40000 ALTER TABLE `dataflow_batch_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_batch_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_import_data`
--

DROP TABLE IF EXISTS `dataflow_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `serial_number` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial Number',
  `value` text COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`import_id`),
  KEY `IDX_DATAFLOW_IMPORT_DATA_SESSION_ID` (`session_id`),
  CONSTRAINT `FK_DATAFLOW_IMPORT_DATA_SESSION_ID_DATAFLOW_SESSION_SESSION_ID` FOREIGN KEY (`session_id`) REFERENCES `dataflow_session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_import_data`
--

LOCK TABLES `dataflow_import_data` WRITE;
/*!40000 ALTER TABLE `dataflow_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile`
--

DROP TABLE IF EXISTS `dataflow_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `actions_xml` text COMMENT 'Actions Xml',
  `gui_data` text COMMENT 'Gui Data',
  `direction` varchar(6) DEFAULT NULL COMMENT 'Direction',
  `entity_type` varchar(64) DEFAULT NULL COMMENT 'Entity Type',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `data_transfer` varchar(11) DEFAULT NULL COMMENT 'Data Transfer',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile`
--

LOCK TABLES `dataflow_profile` WRITE;
/*!40000 ALTER TABLE `dataflow_profile` DISABLE KEYS */;
INSERT INTO `dataflow_profile` VALUES (1,'Export All Products','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(2,'Export Product Stocks','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(3,'Import All Products','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(4,'Import Product Stocks','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(5,'Export Customers','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"customer/convert_adapter_customer\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','customer',0,'file'),(6,'Import Customers','2013-09-21 06:43:09','2013-09-21 06:43:09','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','customer',0,'interactive');
/*!40000 ALTER TABLE `dataflow_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_profile_history`
--

DROP TABLE IF EXISTS `dataflow_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `action_code` varchar(64) DEFAULT NULL COMMENT 'Action Code',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `performed_at` timestamp NULL DEFAULT NULL COMMENT 'Performed At',
  PRIMARY KEY (`history_id`),
  KEY `IDX_DATAFLOW_PROFILE_HISTORY_PROFILE_ID` (`profile_id`),
  CONSTRAINT `FK_AEA06B0C500063D3CE6EA671AE776645` FOREIGN KEY (`profile_id`) REFERENCES `dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_profile_history`
--

LOCK TABLES `dataflow_profile_history` WRITE;
/*!40000 ALTER TABLE `dataflow_profile_history` DISABLE KEYS */;
INSERT INTO `dataflow_profile_history` VALUES (1,1,'create',0,'2013-09-21 06:43:09'),(2,2,'create',0,'2013-09-21 06:43:09'),(3,3,'create',0,'2013-09-21 06:43:09'),(4,4,'create',0,'2013-09-21 06:43:09'),(5,5,'create',0,'2013-09-21 06:43:09'),(6,6,'create',0,'2013-09-21 06:43:09');
/*!40000 ALTER TABLE `dataflow_profile_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataflow_session`
--

DROP TABLE IF EXISTS `dataflow_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Session Id',
  `user_id` int(11) NOT NULL COMMENT 'User Id',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Created Date',
  `file` varchar(255) DEFAULT NULL COMMENT 'File',
  `type` varchar(32) DEFAULT NULL COMMENT 'Type',
  `direction` varchar(32) DEFAULT NULL COMMENT 'Direction',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Comment',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataflow_session`
--

LOCK TABLES `dataflow_session` WRITE;
/*!40000 ALTER TABLE `dataflow_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataflow_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `IDX_DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_DESIGN_CHANGE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_change`
--

LOCK TABLES `design_change` WRITE;
/*!40000 ALTER TABLE `design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country`
--

LOCK TABLES `directory_country` WRITE;
/*!40000 ALTER TABLE `directory_country` DISABLE KEYS */;
INSERT INTO `directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PR','PR','PRI'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `UNQ_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_format`
--

LOCK TABLES `directory_country_format` WRITE;
/*!40000 ALTER TABLE `directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region`
--

LOCK TABLES `directory_country_region` WRITE;
/*!40000 ALTER TABLE `directory_country_region` DISABLE KEYS */;
INSERT INTO `directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AF','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AC','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AM','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Voralberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis');
/*!40000 ALTER TABLE `directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `FK_D7CFDEB379F775328EB6F62695E2B3E1` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_country_region_name`
--

LOCK TABLES `directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `directory_country_region_name` DISABLE KEYS */;
INSERT INTO `directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Voralberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis');
/*!40000 ALTER TABLE `directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `IDX_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory_currency_rate`
--

LOCK TABLES `directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `directory_currency_rate` DISABLE KEYS */;
INSERT INTO `directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link`
--

LOCK TABLES `downloadable_link` WRITE;
/*!40000 ALTER TABLE `downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_price`
--

LOCK TABLES `downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_DL_LNK_PURCHASED_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `FK_46CC8E252307CE62F00A8F1887512A39` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_B219BF25756700DEE44550B21220ECCE` FOREIGN KEY (`order_item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased_item`
--

LOCK TABLES `downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_LINK_TITLE_LINK_ID` (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_title`
--

LOCK TABLES `downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample`
--

LOCK TABLES `downloadable_sample` WRITE;
/*!40000 ALTER TABLE `downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID` (`sample_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_sample_title`
--

LOCK TABLES `downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `IDX_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute`
--

LOCK TABLES `eav_attribute` WRITE;
/*!40000 ALTER TABLE `eav_attribute` DISABLE KEYS */;
INSERT INTO `eav_attribute` VALUES (1,1,'website_id',NULL,'customer/customer_attribute_backend_website','static',NULL,NULL,'select','Associate to Website',NULL,'customer/customer_attribute_source_website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'customer/customer_attribute_backend_store','static',NULL,NULL,'select','Create In',NULL,'customer/customer_attribute_source_store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'varchar',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'varchar',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'varchar',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'varchar',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'varchar',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'varchar',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'customer/customer_attribute_source_group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,'eav/entity_attribute_frontend_datetime','date','Date Of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'customer/customer_attribute_backend_password','varchar',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'default_billing',NULL,'customer/customer_attribute_backend_billing','int',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(14,1,'default_shipping',NULL,'customer/customer_attribute_backend_shipping','int',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(15,1,'taxvat',NULL,NULL,'varchar',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(16,1,'confirmation',NULL,NULL,'varchar',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(17,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(18,1,'gender',NULL,NULL,'int',NULL,NULL,'select','Gender',NULL,'eav/entity_attribute_source_table',0,0,NULL,0,NULL),(19,2,'prefix',NULL,NULL,'varchar',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(20,2,'firstname',NULL,NULL,'varchar',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(21,2,'middlename',NULL,NULL,'varchar',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(22,2,'lastname',NULL,NULL,'varchar',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(23,2,'suffix',NULL,NULL,'varchar',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(24,2,'company',NULL,NULL,'varchar',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(25,2,'street',NULL,'customer/entity_address_attribute_backend_street','text',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(26,2,'city',NULL,NULL,'varchar',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(27,2,'country_id',NULL,NULL,'varchar',NULL,NULL,'select','Country',NULL,'customer/entity_address_attribute_source_country',1,0,NULL,0,NULL),(28,2,'region',NULL,'customer/entity_address_attribute_backend_region','varchar',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(29,2,'region_id',NULL,NULL,'int',NULL,NULL,'hidden','State/Province',NULL,'customer/entity_address_attribute_source_region',0,0,NULL,0,NULL),(30,2,'postcode',NULL,NULL,'varchar',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,1,0,NULL,0,NULL),(31,2,'telephone',NULL,NULL,'varchar',NULL,NULL,'text','Telephone',NULL,NULL,1,0,NULL,0,NULL),(32,2,'fax',NULL,NULL,'varchar',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(33,1,'rp_token',NULL,NULL,'varchar',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(34,1,'rp_token_created_at',NULL,NULL,'datetime',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(35,1,'disable_auto_group_change',NULL,'customer/attribute_backend_data_boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'varchar',NULL,NULL,'text','VAT number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'int',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'varchar',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'varchar',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'int',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(42,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'eav/entity_attribute_source_boolean',1,0,NULL,0,NULL),(43,3,'url_key',NULL,'catalog/category_attribute_backend_urlkey','varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(44,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(45,3,'image',NULL,'catalog/category_attribute_backend_image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(46,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(47,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(48,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(49,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'catalog/category_attribute_source_mode',0,0,NULL,0,NULL),(50,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'catalog/category_attribute_source_page',0,0,NULL,0,NULL),(51,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(52,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(53,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(54,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(55,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(56,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(57,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'core/design_source_design',0,0,NULL,0,NULL),(59,3,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(61,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'catalog/category_attribute_source_layout',0,0,NULL,0,NULL),(62,3,'custom_layout_update',NULL,'catalog/attribute_backend_customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(63,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(64,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(65,3,'available_sort_by',NULL,'catalog/category_attribute_backend_sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'catalog/category_attribute_source_sortby',1,0,NULL,0,NULL),(66,3,'default_sort_by',NULL,'catalog/category_attribute_backend_sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'catalog/category_attribute_source_sortby',1,0,NULL,0,NULL),(67,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'eav/entity_attribute_source_boolean',1,0,'1',0,NULL),(68,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(69,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(70,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(71,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(72,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,1,0,NULL,0,NULL),(73,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,1,0,NULL,0,NULL),(74,4,'sku',NULL,'catalog/product_attribute_backend_sku','static',NULL,NULL,'text','SKU',NULL,NULL,1,0,NULL,1,NULL),(75,4,'price',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(76,4,'special_price',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(77,4,'special_from_date',NULL,'catalog/product_attribute_backend_startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(78,4,'special_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(79,4,'cost',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(80,4,'weight',NULL,NULL,'decimal',NULL,NULL,'weight','Weight',NULL,NULL,1,0,NULL,0,NULL),(81,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(82,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(83,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(84,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars'),(85,4,'image',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Base Image',NULL,NULL,0,0,NULL,0,NULL),(86,4,'small_image',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Small Image',NULL,NULL,0,0,NULL,0,NULL),(87,4,'thumbnail',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(88,4,'media_gallery',NULL,'catalog/product_attribute_backend_media','varchar',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(89,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(90,4,'group_price',NULL,'catalog/product_attribute_backend_groupprice','decimal',NULL,NULL,'text','Group Price',NULL,NULL,0,0,NULL,0,NULL),(91,4,'tier_price',NULL,'catalog/product_attribute_backend_tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(92,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(93,4,'news_from_date',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(94,4,'news_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(96,4,'status',NULL,NULL,'int',NULL,NULL,'select','Status',NULL,'catalog/product_status',1,0,NULL,0,NULL),(97,4,'url_key',NULL,'catalog/product_attribute_backend_urlkey','varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(98,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(99,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(100,4,'is_recurring',NULL,NULL,'int',NULL,NULL,'select','Enable Recurring Profile',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,'Products with recurring profile participate in catalog as nominal items.'),(101,4,'recurring_profile',NULL,'catalog/product_attribute_backend_recurring','text',NULL,NULL,'text','Recurring Payment Profile',NULL,NULL,0,0,NULL,0,NULL),(102,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'catalog/product_visibility',1,0,'4',0,NULL),(103,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'core/design_source_design',0,0,NULL,0,NULL),(104,4,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(105,4,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(106,4,'custom_layout_update',NULL,'catalog/attribute_backend_customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(107,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'catalog/product_attribute_source_layout',0,0,NULL,0,NULL),(108,4,'category_ids',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'catalog/entity_product_attribute_design_options_container',0,0,'container2',0,NULL),(110,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(111,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(112,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(113,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(114,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(115,4,'created_at',NULL,'eav/entity_attribute_backend_time_created','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(116,4,'updated_at',NULL,'eav/entity_attribute_backend_time_updated','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(117,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'catalog/product_attribute_source_countryofmanufacture',0,0,NULL,0,NULL),(118,4,'msrp_enabled',NULL,'catalog/product_attribute_backend_msrp','varchar',NULL,NULL,'select','Apply MAP',NULL,'catalog/product_attribute_source_msrp_type_enabled',0,0,'2',0,NULL),(119,4,'msrp_display_actual_price_type',NULL,'catalog/product_attribute_backend_boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'catalog/product_attribute_source_msrp_type_price',0,0,'4',0,NULL),(120,4,'msrp',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(121,4,'enable_googlecheckout',NULL,NULL,'int',NULL,NULL,'select','Is Product Available for Purchase with Google Checkout',NULL,'eav/entity_attribute_source_boolean',0,0,'1',0,NULL),(122,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'tax/class_source_product',1,0,NULL,0,NULL),(123,4,'gift_message_available',NULL,'catalog/product_attribute_backend_boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(124,4,'price_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(125,4,'sku_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(126,4,'weight_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(127,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'bundle/product_attribute_source_price_view',1,0,NULL,0,NULL),(128,4,'shipment_type',NULL,NULL,'int',NULL,NULL,NULL,'Shipment',NULL,NULL,1,0,NULL,0,NULL),(129,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(130,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(131,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(132,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),(133,3,'thumbnail',NULL,'catalog/category_attribute_backend_image','varchar',NULL,NULL,'image','Thumbnail Image',NULL,NULL,0,0,NULL,0,NULL);
/*!40000 ALTER TABLE `eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `IDX_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_group`
--

LOCK TABLES `eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `eav_attribute_group` DISABLE KEYS */;
INSERT INTO `eav_attribute_group` VALUES (1,1,'General',1,1),(2,2,'General',1,1),(3,3,'General',10,1),(4,3,'General Information',2,0),(5,3,'Display Settings',20,0),(6,3,'Custom Design',30,0),(7,4,'General',1,1),(8,4,'Prices',2,0),(9,4,'Meta Information',3,0),(10,4,'Images',4,0),(11,4,'Recurring Profile',5,0),(12,4,'Design',6,0),(13,5,'General',1,1),(14,6,'General',1,1),(15,7,'General',1,1),(16,8,'General',1,1),(17,4,'Gift Options',7,0);
/*!40000 ALTER TABLE `eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_label`
--

LOCK TABLES `eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option`
--

LOCK TABLES `eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option` DISABLE KEYS */;
INSERT INTO `eav_attribute_option` VALUES (1,18,0),(2,18,1);
/*!40000 ALTER TABLE `eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_option_value`
--

LOCK TABLES `eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female');
/*!40000 ALTER TABLE `eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `IDX_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_set`
--

LOCK TABLES `eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `eav_attribute_set` DISABLE KEYS */;
INSERT INTO `eav_attribute_set` VALUES (1,1,'Default',1),(2,2,'Default',1),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity`
--

LOCK TABLES `eav_entity` WRITE;
/*!40000 ALTER TABLE `eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_attribute`
--

LOCK TABLES `eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,0),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,0),(13,1,1,1,13,0),(14,1,1,1,14,0),(15,1,1,1,15,100),(16,1,1,1,16,0),(17,1,1,1,17,86),(18,1,1,1,18,110),(19,2,2,2,19,10),(20,2,2,2,20,20),(21,2,2,2,21,30),(22,2,2,2,22,40),(23,2,2,2,23,50),(24,2,2,2,24,60),(25,2,2,2,25,70),(26,2,2,2,26,80),(27,2,2,2,27,90),(28,2,2,2,28,100),(29,2,2,2,29,100),(30,2,2,2,30,110),(31,2,2,2,31,120),(32,2,2,2,32,130),(33,1,1,1,33,111),(34,1,1,1,34,112),(35,1,1,1,35,28),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,3,3,4,41,1),(42,3,3,4,42,2),(43,3,3,4,43,3),(44,3,3,4,44,4),(45,3,3,4,45,5),(46,3,3,4,46,6),(47,3,3,4,47,7),(48,3,3,4,48,8),(49,3,3,5,49,10),(50,3,3,5,50,20),(51,3,3,5,51,30),(52,3,3,4,52,12),(53,3,3,4,53,13),(54,3,3,4,54,14),(55,3,3,4,55,15),(56,3,3,4,56,16),(57,3,3,4,57,17),(58,3,3,6,58,10),(59,3,3,6,59,30),(60,3,3,6,60,40),(61,3,3,6,61,50),(62,3,3,6,62,60),(63,3,3,4,63,24),(64,3,3,4,64,25),(65,3,3,5,65,40),(66,3,3,5,66,50),(67,3,3,4,67,10),(68,3,3,6,68,5),(69,3,3,6,69,6),(70,3,3,5,70,51),(71,4,4,7,71,1),(72,4,4,7,72,2),(73,4,4,7,73,3),(74,4,4,7,74,4),(75,4,4,8,75,1),(76,4,4,8,76,3),(77,4,4,8,77,4),(78,4,4,8,78,5),(79,4,4,8,79,6),(80,4,4,7,80,5),(81,4,4,9,82,1),(82,4,4,9,83,2),(83,4,4,9,84,3),(84,4,4,10,85,1),(85,4,4,10,86,2),(86,4,4,10,87,3),(87,4,4,10,88,4),(88,4,4,7,89,6),(89,4,4,8,90,2),(90,4,4,8,91,7),(91,4,4,7,93,7),(92,4,4,7,94,8),(93,4,4,10,95,5),(94,4,4,7,96,9),(95,4,4,7,97,10),(96,4,4,7,98,11),(97,4,4,8,99,8),(98,4,4,11,100,1),(99,4,4,11,101,2),(100,4,4,7,102,12),(101,4,4,12,103,1),(102,4,4,12,104,2),(103,4,4,12,105,3),(104,4,4,12,106,4),(105,4,4,12,107,5),(106,4,4,7,108,13),(107,4,4,12,109,6),(108,4,4,7,110,14),(109,4,4,7,111,15),(110,4,4,7,112,16),(111,4,4,7,113,17),(112,4,4,7,114,18),(113,4,4,7,115,19),(114,4,4,7,116,20),(115,4,4,7,117,21),(116,4,4,8,118,9),(117,4,4,8,119,10),(118,4,4,8,120,11),(119,4,4,8,121,12),(120,4,4,8,122,13),(121,4,4,17,123,1),(122,4,4,7,124,22),(123,4,4,7,125,23),(124,4,4,7,126,24),(125,4,4,8,127,14),(126,4,4,7,128,25),(127,4,4,7,129,26),(128,4,4,7,130,27),(129,4,4,7,131,28),(130,4,4,7,132,29),(131,3,3,4,133,4);
/*!40000 ALTER TABLE `eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_datetime`
--

LOCK TABLES `eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_decimal`
--

LOCK TABLES `eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_INT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_int`
--

LOCK TABLES `eav_entity_int` WRITE;
/*!40000 ALTER TABLE `eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `IDX_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EAV_ENTITY_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_store`
--

LOCK TABLES `eav_entity_store` WRITE;
/*!40000 ALTER TABLE `eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_text`
--

LOCK TABLES `eav_entity_text` WRITE;
/*!40000 ALTER TABLE `eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_type`
--

LOCK TABLES `eav_entity_type` WRITE;
/*!40000 ALTER TABLE `eav_entity_type` DISABLE KEYS */;
INSERT INTO `eav_entity_type` VALUES (1,'customer','customer/customer','customer/attribute','customer/entity',NULL,NULL,1,'default',1,'eav/entity_increment_numeric',0,8,'0','customer/eav_attribute','customer/attribute_collection'),(2,'customer_address','customer/address','customer/attribute','customer/address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer/eav_attribute','customer/address_attribute_collection'),(3,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog/eav_attribute','catalog/category_attribute_collection'),(4,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog/eav_attribute','catalog/product_attribute_collection'),(5,'order','sales/order',NULL,'sales/order',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(6,'invoice','sales/order_invoice',NULL,'sales/invoice',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(7,'creditmemo','sales/order_creditmemo',NULL,'sales/creditmemo',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(8,'shipment','sales/order_shipment',NULL,'sales/shipment',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_entity_varchar`
--

LOCK TABLES `eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `IDX_EAV_FORM_ELEMENT_TYPE_ID` (`type_id`),
  KEY `IDX_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_element`
--

LOCK TABLES `eav_form_element` WRITE;
/*!40000 ALTER TABLE `eav_form_element` DISABLE KEYS */;
INSERT INTO `eav_form_element` VALUES (1,1,NULL,20,0),(2,1,NULL,22,1),(3,1,NULL,24,2),(4,1,NULL,9,3),(5,1,NULL,25,4),(6,1,NULL,26,5),(7,1,NULL,28,6),(8,1,NULL,30,7),(9,1,NULL,27,8),(10,1,NULL,31,9),(11,1,NULL,32,10),(12,2,NULL,20,0),(13,2,NULL,22,1),(14,2,NULL,24,2),(15,2,NULL,9,3),(16,2,NULL,25,4),(17,2,NULL,26,5),(18,2,NULL,28,6),(19,2,NULL,30,7),(20,2,NULL,27,8),(21,2,NULL,31,9),(22,2,NULL,32,10),(23,3,NULL,20,0),(24,3,NULL,22,1),(25,3,NULL,24,2),(26,3,NULL,25,3),(27,3,NULL,26,4),(28,3,NULL,28,5),(29,3,NULL,30,6),(30,3,NULL,27,7),(31,3,NULL,31,8),(32,3,NULL,32,9),(33,4,NULL,20,0),(34,4,NULL,22,1),(35,4,NULL,24,2),(36,4,NULL,25,3),(37,4,NULL,26,4),(38,4,NULL,28,5),(39,4,NULL,30,6),(40,4,NULL,27,7),(41,4,NULL,31,8),(42,4,NULL,32,9),(43,5,1,5,0),(44,5,1,7,1),(45,5,1,9,2),(46,5,2,24,0),(47,5,2,31,1),(48,5,2,25,2),(49,5,2,26,3),(50,5,2,28,4),(51,5,2,30,5),(52,5,2,27,6);
/*!40000 ALTER TABLE `eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  KEY `IDX_EAV_FORM_FIELDSET_TYPE_ID` (`type_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset`
--

LOCK TABLES `eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset` VALUES (1,5,'general',1),(2,5,'address',2);
/*!40000 ALTER TABLE `eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_EAV_FORM_FIELDSET_LABEL_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_fieldset_label`
--

LOCK TABLES `eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `eav_form_fieldset_label` DISABLE KEYS */;
INSERT INTO `eav_form_fieldset_label` VALUES (1,0,'Personal Information'),(2,0,'Address Information');
/*!40000 ALTER TABLE `eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `IDX_EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type`
--

LOCK TABLES `eav_form_type` WRITE;
/*!40000 ALTER TABLE `eav_form_type` DISABLE KEYS */;
INSERT INTO `eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0),(5,'checkout_multishipping_register','checkout_multishipping_register',1,'',0);
/*!40000 ALTER TABLE `eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_form_type_entity`
--

LOCK TABLES `eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `eav_form_type_entity` VALUES (1,1),(2,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_message`
--

LOCK TABLES `gift_message` WRITE;
/*!40000 ALTER TABLE `gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `googlecheckout_notification`
--

DROP TABLE IF EXISTS `googlecheckout_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `googlecheckout_notification` (
  `serial_number` varchar(64) NOT NULL COMMENT 'Serial Number',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Checkout Notification Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `googlecheckout_notification`
--

LOCK TABLES `googlecheckout_notification` WRITE;
/*!40000 ALTER TABLE `googlecheckout_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `googlecheckout_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importexport_importdata`
--

LOCK TABLES `importexport_importdata` WRITE;
/*!40000 ALTER TABLE `importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_event`
--

DROP TABLE IF EXISTS `index_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `entity` varchar(64) NOT NULL COMMENT 'Entity',
  `entity_pk` bigint(20) DEFAULT NULL COMMENT 'Entity Primary Key',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `old_data` mediumtext COMMENT 'Old Data',
  `new_data` mediumtext COMMENT 'New Data',
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `UNQ_INDEX_EVENT_TYPE_ENTITY_ENTITY_PK` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Index Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_event`
--

LOCK TABLES `index_event` WRITE;
/*!40000 ALTER TABLE `index_event` DISABLE KEYS */;
INSERT INTO `index_event` VALUES (1,'save','catalog_category',1,'2013-09-21 06:43:16',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(2,'save','catalog_category',2,'2013-09-21 06:43:16',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(3,'save','catalog_category',3,'2013-09-21 06:43:18',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(4,'save','catalog_category',4,'2013-09-21 06:43:18',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(5,'save','catalog_category',5,'2013-09-21 06:43:19',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(6,'save','catalog_category',6,'2013-09-21 07:04:10',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(7,'save','catalog_category',7,'2013-09-21 07:05:21',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(8,'save','cataloginventory_stock_item',1,'2013-09-21 07:10:48',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(9,'save','catalog_product',1,'2013-09-21 07:10:48',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(10,'catalog_reindex_price','catalog_product',1,'2013-09-21 07:10:48',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(11,'save','cataloginventory_stock_item',2,'2013-09-21 07:12:24',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(12,'save','catalog_product',2,'2013-09-21 07:12:24',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(13,'catalog_reindex_price','catalog_product',2,'2013-09-21 07:12:24',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(14,'save','cataloginventory_stock_item',3,'2013-09-21 07:33:40',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(15,'save','catalog_product',3,'2013-09-21 07:33:40',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(16,'catalog_reindex_price','catalog_product',3,'2013-09-21 07:33:40',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(17,'save','catalog_category',8,'2013-09-21 07:34:37',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(18,'save','cataloginventory_stock_item',4,'2013-09-21 07:36:42',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(19,'save','catalog_product',4,'2013-09-21 07:36:43',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(20,'catalog_reindex_price','catalog_product',4,'2013-09-21 07:36:43',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(21,'save','cataloginventory_stock_item',5,'2013-09-26 07:22:13',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(22,'save','catalog_product',5,'2013-09-26 07:22:14',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(23,'catalog_reindex_price','catalog_product',5,'2013-09-26 07:22:14',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(24,'save','cataloginventory_stock_item',6,'2013-09-26 07:29:46',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(25,'save','catalog_product',6,'2013-09-26 07:29:47',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(26,'catalog_reindex_price','catalog_product',6,'2013-09-26 07:29:58',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(27,'delete','catalog_product',6,'2013-09-26 07:32:25',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(28,'save','cataloginventory_stock_item',7,'2013-09-26 07:33:25',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(29,'save','catalog_product',7,'2013-09-26 07:33:26',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:33:\"catalog_product_flat_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(30,'catalog_reindex_price','catalog_product',7,'2013-09-26 07:33:26',NULL,'a:6:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:33:\"catalog_product_flat_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}');
/*!40000 ALTER TABLE `index_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process`
--

DROP TABLE IF EXISTS `index_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Process Id',
  `indexer_code` varchar(32) NOT NULL COMMENT 'Indexer Code',
  `status` varchar(15) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT 'Ended At',
  `mode` varchar(9) NOT NULL DEFAULT 'real_time' COMMENT 'Mode',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `UNQ_INDEX_PROCESS_INDEXER_CODE` (`indexer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Index Process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process`
--

LOCK TABLES `index_process` WRITE;
/*!40000 ALTER TABLE `index_process` DISABLE KEYS */;
INSERT INTO `index_process` VALUES (1,'catalog_product_attribute','pending','2013-09-26 07:33:25','2013-09-26 07:33:25','real_time'),(2,'catalog_product_price','pending','2013-09-26 07:33:26','2013-09-26 07:33:26','real_time'),(3,'catalog_url','pending','2013-09-26 07:35:10','2013-09-26 07:35:10','real_time'),(4,'catalog_product_flat','pending','2013-09-26 07:33:25','2013-09-26 07:33:26','real_time'),(5,'catalog_category_flat','pending','2013-09-21 07:21:42','2013-09-21 07:21:42','real_time'),(6,'catalog_category_product','pending','2013-09-26 07:35:10','2013-09-26 07:35:10','real_time'),(7,'catalogsearch_fulltext','pending','2013-09-26 07:35:10','2013-09-26 07:35:10','real_time'),(8,'cataloginventory_stock','pending','2013-09-26 07:33:25','2013-09-26 07:33:25','real_time'),(9,'tag_summary','pending','2013-09-26 07:33:26','2013-09-26 07:33:26','real_time');
/*!40000 ALTER TABLE `index_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_process_event`
--

DROP TABLE IF EXISTS `index_process_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_process_event` (
  `process_id` int(10) unsigned NOT NULL COMMENT 'Process Id',
  `event_id` bigint(20) unsigned NOT NULL COMMENT 'Event Id',
  `status` varchar(7) NOT NULL DEFAULT 'new' COMMENT 'Status',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `IDX_INDEX_PROCESS_EVENT_EVENT_ID` (`event_id`),
  CONSTRAINT `FK_INDEX_PROCESS_EVENT_EVENT_ID_INDEX_EVENT_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INDEX_PROCESS_EVENT_PROCESS_ID_INDEX_PROCESS_PROCESS_ID` FOREIGN KEY (`process_id`) REFERENCES `index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_process_event`
--

LOCK TABLES `index_process_event` WRITE;
/*!40000 ALTER TABLE `index_process_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_process_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_customer`
--

DROP TABLE IF EXISTS `log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Log Customers Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_customer`
--

LOCK TABLES `log_customer` WRITE;
/*!40000 ALTER TABLE `log_customer` DISABLE KEYS */;
INSERT INTO `log_customer` VALUES (1,9,1,'2013-09-24 05:56:59',NULL,1);
/*!40000 ALTER TABLE `log_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_quote`
--

DROP TABLE IF EXISTS `log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time',
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_quote`
--

LOCK TABLES `log_quote` WRITE;
/*!40000 ALTER TABLE `log_quote` DISABLE KEYS */;
INSERT INTO `log_quote` VALUES (1,9,'2013-09-24 05:56:59',NULL);
/*!40000 ALTER TABLE `log_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary`
--

DROP TABLE IF EXISTS `log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Summary ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary`
--

LOCK TABLES `log_summary` WRITE;
/*!40000 ALTER TABLE `log_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_summary_type`
--

DROP TABLE IF EXISTS `log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT 'Type Code',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_summary_type`
--

LOCK TABLES `log_summary_type` WRITE;
/*!40000 ALTER TABLE `log_summary_type` DISABLE KEYS */;
INSERT INTO `log_summary_type` VALUES (1,'hour',1,'HOUR'),(2,'day',1,'DAY');
/*!40000 ALTER TABLE `log_summary_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url`
--

DROP TABLE IF EXISTS `log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'URL ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Visit Time',
  PRIMARY KEY (`url_id`),
  KEY `IDX_LOG_URL_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url`
--

LOCK TABLES `log_url` WRITE;
/*!40000 ALTER TABLE `log_url` DISABLE KEYS */;
INSERT INTO `log_url` VALUES (1,1,'2013-09-21 06:44:40'),(2,1,'2013-09-21 06:45:42'),(3,1,'2013-09-21 06:45:43'),(4,1,'2013-09-21 06:45:47'),(5,1,'2013-09-21 06:45:48'),(6,1,'2013-09-21 06:45:49'),(7,1,'2013-09-21 06:45:49'),(8,1,'2013-09-21 06:45:50'),(9,1,'2013-09-21 06:45:50'),(10,1,'2013-09-21 06:45:50'),(11,1,'2013-09-21 06:45:51'),(12,1,'2013-09-21 06:45:52'),(13,1,'2013-09-21 06:45:52'),(14,1,'2013-09-21 06:45:53'),(15,1,'2013-09-21 06:46:04'),(16,1,'2013-09-21 06:46:25'),(17,1,'2013-09-21 06:46:28'),(18,1,'2013-09-21 06:46:32'),(19,1,'2013-09-21 06:46:34'),(20,1,'2013-09-21 06:46:35'),(21,1,'2013-09-21 06:46:36'),(22,1,'2013-09-21 06:46:36'),(23,1,'2013-09-21 06:46:37'),(24,1,'2013-09-21 06:46:40'),(25,1,'2013-09-21 06:46:42'),(26,1,'2013-09-21 06:46:57'),(27,1,'2013-09-21 06:47:02'),(28,1,'2013-09-21 06:47:03'),(29,1,'2013-09-21 06:47:18'),(30,1,'2013-09-21 06:55:06'),(31,1,'2013-09-21 06:55:12'),(32,1,'2013-09-21 07:01:00'),(33,1,'2013-09-21 07:01:05'),(34,1,'2013-09-21 07:02:20'),(35,1,'2013-09-21 07:04:14'),(36,1,'2013-09-21 07:04:17'),(37,1,'2013-09-21 07:04:25'),(38,1,'2013-09-21 07:04:29'),(39,1,'2013-09-21 07:04:32'),(40,1,'2013-09-21 07:05:30'),(41,1,'2013-09-21 07:05:33'),(42,1,'2013-09-21 07:05:36'),(43,1,'2013-09-21 07:07:57'),(44,1,'2013-09-21 07:07:59'),(45,1,'2013-09-21 07:08:02'),(46,1,'2013-09-21 07:10:50'),(47,1,'2013-09-21 07:10:52'),(48,1,'2013-09-21 07:10:54'),(49,1,'2013-09-21 07:11:03'),(50,1,'2013-09-21 07:11:06'),(51,1,'2013-09-21 07:11:10'),(52,1,'2013-09-21 07:12:27'),(53,1,'2013-09-21 07:12:44'),(54,1,'2013-09-21 07:19:22'),(55,1,'2013-09-21 07:19:24'),(56,1,'2013-09-21 07:19:28'),(57,1,'2013-09-21 07:19:31'),(58,1,'2013-09-21 07:20:00'),(59,1,'2013-09-21 07:20:07'),(60,1,'2013-09-21 07:20:17'),(61,1,'2013-09-21 07:20:53'),(62,1,'2013-09-21 07:20:54'),(63,1,'2013-09-21 07:20:57'),(64,1,'2013-09-21 07:20:59'),(65,1,'2013-09-21 07:21:04'),(66,1,'2013-09-21 07:21:08'),(67,1,'2013-09-21 07:25:41'),(68,1,'2013-09-21 07:25:47'),(69,1,'2013-09-21 07:25:49'),(70,1,'2013-09-21 07:26:53'),(71,1,'2013-09-21 07:27:44'),(72,1,'2013-09-21 07:27:54'),(73,1,'2013-09-21 07:28:00'),(74,1,'2013-09-21 07:28:02'),(75,1,'2013-09-21 07:28:02'),(76,1,'2013-09-21 07:28:03'),(77,1,'2013-09-21 07:28:06'),(78,1,'2013-09-21 07:28:15'),(79,1,'2013-09-21 07:28:17'),(80,1,'2013-09-21 07:28:20'),(81,1,'2013-09-21 07:29:13'),(82,1,'2013-09-21 07:31:33'),(83,1,'2013-09-21 07:33:42'),(84,1,'2013-09-21 07:35:13'),(85,1,'2013-09-21 07:36:45'),(86,1,'2013-09-21 07:36:49'),(87,1,'2013-09-21 07:37:24'),(88,1,'2013-09-21 07:37:29'),(89,1,'2013-09-21 07:37:31'),(90,1,'2013-09-21 07:37:35'),(91,1,'2013-09-21 07:37:38'),(92,1,'2013-09-21 07:37:41'),(93,1,'2013-09-21 07:40:09'),(94,1,'2013-09-21 07:40:18'),(95,1,'2013-09-21 07:42:40'),(96,2,'2013-09-21 07:42:58'),(97,1,'2013-09-21 07:43:48'),(98,3,'2013-09-21 07:45:01'),(99,1,'2013-09-21 07:47:36'),(100,1,'2013-09-21 07:47:38'),(101,4,'2013-09-22 06:49:31'),(102,5,'2013-09-22 07:16:50'),(103,6,'2013-09-22 08:18:07'),(104,6,'2013-09-22 08:33:06'),(105,6,'2013-09-22 08:33:06'),(106,6,'2013-09-22 08:33:06'),(107,6,'2013-09-22 08:33:06'),(108,6,'2013-09-22 08:33:12'),(109,6,'2013-09-22 08:33:13'),(110,6,'2013-09-22 08:33:13'),(111,6,'2013-09-22 08:33:13'),(112,6,'2013-09-22 08:33:18'),(113,6,'2013-09-22 08:33:27'),(114,6,'2013-09-22 08:33:30'),(115,6,'2013-09-22 08:36:43'),(116,6,'2013-09-22 08:36:54'),(117,6,'2013-09-22 08:36:56'),(118,6,'2013-09-22 08:37:08'),(119,6,'2013-09-22 08:37:42'),(120,6,'2013-09-22 08:37:47'),(121,6,'2013-09-22 08:37:47'),(122,6,'2013-09-22 08:37:51'),(123,6,'2013-09-22 08:37:57'),(124,6,'2013-09-22 08:37:59'),(125,6,'2013-09-22 08:38:28'),(126,6,'2013-09-22 08:38:49'),(127,6,'2013-09-22 08:48:20'),(128,6,'2013-09-22 08:48:51'),(129,6,'2013-09-22 08:48:53'),(130,6,'2013-09-22 08:48:54'),(131,6,'2013-09-22 08:48:54'),(132,6,'2013-09-22 08:48:54'),(133,6,'2013-09-22 08:48:54'),(134,6,'2013-09-22 08:49:00'),(135,6,'2013-09-22 08:49:03'),(136,6,'2013-09-22 08:49:05'),(137,6,'2013-09-22 08:49:07'),(138,6,'2013-09-22 08:49:10'),(139,6,'2013-09-22 08:49:22'),(140,6,'2013-09-22 08:49:47'),(141,6,'2013-09-22 08:50:00'),(142,7,'2013-09-23 14:40:07'),(143,7,'2013-09-23 14:44:52'),(144,7,'2013-09-23 14:44:59'),(145,7,'2013-09-23 14:45:30'),(146,7,'2013-09-23 14:45:30'),(147,7,'2013-09-23 14:45:30'),(148,7,'2013-09-23 14:45:30'),(149,7,'2013-09-23 14:45:30'),(150,7,'2013-09-23 14:46:01'),(151,7,'2013-09-23 14:46:03'),(152,7,'2013-09-23 14:46:06'),(153,7,'2013-09-23 14:46:08'),(154,8,'2013-09-23 15:27:20'),(155,8,'2013-09-23 15:27:20'),(156,8,'2013-09-23 15:27:21'),(157,8,'2013-09-23 15:27:21'),(158,8,'2013-09-23 15:27:21'),(159,8,'2013-09-23 15:27:32'),(160,8,'2013-09-23 15:27:34'),(161,8,'2013-09-23 15:27:34'),(162,8,'2013-09-23 15:27:34'),(163,8,'2013-09-23 15:27:34'),(164,8,'2013-09-23 15:27:36'),(165,8,'2013-09-23 15:27:38'),(166,8,'2013-09-23 15:27:39'),(167,8,'2013-09-23 15:27:39'),(168,8,'2013-09-23 15:27:39'),(169,8,'2013-09-23 15:29:28'),(170,8,'2013-09-23 15:29:37'),(171,8,'2013-09-23 15:30:03'),(172,8,'2013-09-23 15:30:06'),(173,9,'2013-09-24 05:54:57'),(174,9,'2013-09-24 05:55:05'),(175,9,'2013-09-24 05:55:09'),(176,9,'2013-09-24 05:55:10'),(177,9,'2013-09-24 05:55:17'),(178,9,'2013-09-24 05:55:18'),(179,9,'2013-09-24 05:55:20'),(180,9,'2013-09-24 05:55:43'),(181,9,'2013-09-24 05:55:45'),(182,9,'2013-09-24 05:55:48'),(183,9,'2013-09-24 05:55:51'),(184,9,'2013-09-24 05:55:52'),(185,9,'2013-09-24 05:56:02'),(186,9,'2013-09-24 05:56:07'),(187,9,'2013-09-24 05:56:19'),(188,9,'2013-09-24 05:56:19'),(189,9,'2013-09-24 05:56:26'),(190,9,'2013-09-24 05:56:27'),(191,9,'2013-09-24 05:56:34'),(192,9,'2013-09-24 05:56:34'),(193,9,'2013-09-24 05:56:39'),(194,9,'2013-09-24 05:56:42'),(195,9,'2013-09-24 05:56:43'),(196,9,'2013-09-24 05:56:59'),(197,9,'2013-09-24 05:56:59'),(198,9,'2013-09-24 05:57:04'),(199,9,'2013-09-24 05:57:06'),(200,9,'2013-09-24 05:57:22'),(201,9,'2013-09-24 05:57:28'),(202,9,'2013-09-24 05:57:31'),(203,9,'2013-09-24 05:57:32'),(204,9,'2013-09-24 05:57:33'),(205,9,'2013-09-24 05:57:35'),(206,9,'2013-09-24 05:57:36'),(207,9,'2013-09-24 05:57:38'),(208,9,'2013-09-24 05:57:41'),(209,9,'2013-09-24 05:57:42'),(210,9,'2013-09-24 05:57:43'),(211,9,'2013-09-24 05:57:44'),(212,9,'2013-09-24 05:57:46'),(213,9,'2013-09-24 05:57:46'),(214,9,'2013-09-24 05:57:48'),(215,9,'2013-09-24 05:57:51'),(216,9,'2013-09-24 05:57:54'),(217,9,'2013-09-24 05:57:58'),(218,10,'2013-09-24 07:31:54'),(219,10,'2013-09-24 07:31:57'),(220,10,'2013-09-24 07:32:33'),(221,10,'2013-09-24 07:33:16'),(222,10,'2013-09-24 07:33:16'),(223,10,'2013-09-24 07:33:17'),(224,10,'2013-09-24 07:33:17'),(225,10,'2013-09-24 07:33:17'),(226,10,'2013-09-24 07:33:55'),(227,10,'2013-09-24 07:33:55'),(228,10,'2013-09-24 07:33:56'),(229,10,'2013-09-24 07:33:56'),(230,10,'2013-09-24 07:33:56'),(231,10,'2013-09-24 07:34:24'),(232,10,'2013-09-24 07:34:25'),(233,10,'2013-09-24 07:34:25'),(234,10,'2013-09-24 07:34:26'),(235,10,'2013-09-24 07:34:26'),(236,10,'2013-09-24 07:34:26'),(237,10,'2013-09-24 07:34:26'),(238,10,'2013-09-24 07:34:26'),(239,10,'2013-09-24 07:34:26'),(240,10,'2013-09-24 07:34:29'),(241,10,'2013-09-24 07:34:29'),(242,10,'2013-09-24 07:34:30'),(243,10,'2013-09-24 07:34:30'),(244,10,'2013-09-24 07:34:35'),(245,10,'2013-09-24 07:34:41'),(246,10,'2013-09-24 07:34:43'),(247,10,'2013-09-24 07:34:44'),(248,10,'2013-09-24 07:34:45'),(249,10,'2013-09-24 07:34:45'),(250,10,'2013-09-24 07:34:45'),(251,10,'2013-09-24 07:34:45'),(252,10,'2013-09-24 07:34:45'),(253,10,'2013-09-24 07:34:50'),(254,10,'2013-09-24 07:36:12'),(255,10,'2013-09-24 07:36:14'),(256,10,'2013-09-24 07:36:14'),(257,10,'2013-09-24 07:36:15'),(258,10,'2013-09-24 07:36:15'),(259,10,'2013-09-24 07:36:16'),(260,10,'2013-09-24 07:36:17'),(261,10,'2013-09-24 07:36:18'),(262,10,'2013-09-24 07:36:18'),(263,10,'2013-09-24 07:37:14'),(264,10,'2013-09-24 07:37:15'),(265,10,'2013-09-24 07:37:15'),(266,10,'2013-09-24 07:37:16'),(267,10,'2013-09-24 07:37:16'),(268,10,'2013-09-24 07:37:16'),(269,10,'2013-09-24 07:37:16'),(270,10,'2013-09-24 07:37:16'),(271,10,'2013-09-24 07:37:16'),(272,10,'2013-09-24 07:37:22'),(273,10,'2013-09-24 07:37:23'),(274,10,'2013-09-24 07:37:23'),(275,10,'2013-09-24 07:37:24'),(276,10,'2013-09-24 07:37:24'),(277,10,'2013-09-24 07:37:24'),(278,10,'2013-09-24 07:37:24'),(279,10,'2013-09-24 07:37:25'),(280,10,'2013-09-24 07:37:25'),(281,10,'2013-09-24 07:37:49'),(282,10,'2013-09-24 07:37:50'),(283,10,'2013-09-24 07:37:50'),(284,10,'2013-09-24 07:37:51'),(285,10,'2013-09-24 07:37:51'),(286,10,'2013-09-24 07:37:51'),(287,10,'2013-09-24 07:37:51'),(288,10,'2013-09-24 07:37:52'),(289,10,'2013-09-24 07:37:52'),(290,10,'2013-09-24 07:39:42'),(291,10,'2013-09-24 07:39:43'),(292,10,'2013-09-24 07:39:44'),(293,10,'2013-09-24 07:39:44'),(294,10,'2013-09-24 07:39:44'),(295,11,'2013-09-24 14:29:17'),(296,11,'2013-09-24 14:29:17'),(297,11,'2013-09-24 14:29:18'),(298,11,'2013-09-24 14:29:18'),(299,11,'2013-09-24 14:29:18'),(300,11,'2013-09-24 14:29:18'),(301,11,'2013-09-24 14:29:20'),(302,11,'2013-09-24 14:29:20'),(303,11,'2013-09-24 14:29:20'),(304,11,'2013-09-24 14:29:20'),(305,11,'2013-09-24 14:29:20'),(306,11,'2013-09-24 14:29:20'),(307,11,'2013-09-24 14:29:21'),(308,11,'2013-09-24 14:29:21'),(309,11,'2013-09-24 14:29:21'),(310,11,'2013-09-24 14:29:21'),(311,11,'2013-09-24 14:29:21'),(312,11,'2013-09-24 14:29:21'),(313,11,'2013-09-24 14:29:22'),(314,11,'2013-09-24 14:29:22'),(315,11,'2013-09-24 14:29:22'),(316,11,'2013-09-24 14:29:44'),(317,11,'2013-09-24 14:29:45'),(318,11,'2013-09-24 14:29:45'),(319,11,'2013-09-24 14:29:45'),(320,11,'2013-09-24 14:29:45'),(321,11,'2013-09-24 14:29:45'),(322,11,'2013-09-24 14:29:45'),(323,11,'2013-09-24 14:29:46'),(324,11,'2013-09-24 14:29:47'),(325,11,'2013-09-24 14:29:47'),(326,11,'2013-09-24 14:31:28'),(327,11,'2013-09-24 14:31:29'),(328,11,'2013-09-24 14:31:29'),(329,11,'2013-09-24 14:31:29'),(330,11,'2013-09-24 14:31:30'),(331,11,'2013-09-24 14:31:30'),(332,11,'2013-09-24 14:31:31'),(333,11,'2013-09-24 14:31:31'),(334,11,'2013-09-24 14:31:31'),(335,11,'2013-09-24 14:31:31'),(336,11,'2013-09-24 14:31:31'),(337,11,'2013-09-24 14:31:31'),(338,11,'2013-09-24 14:31:32'),(339,11,'2013-09-24 14:31:32'),(340,11,'2013-09-24 14:31:32'),(341,11,'2013-09-24 14:31:32'),(342,11,'2013-09-24 14:31:32'),(343,11,'2013-09-24 14:31:32'),(344,11,'2013-09-24 14:31:33'),(345,11,'2013-09-24 14:31:33'),(346,11,'2013-09-24 14:31:33'),(347,11,'2013-09-24 14:37:25'),(348,11,'2013-09-24 14:37:26'),(349,11,'2013-09-24 14:37:27'),(350,11,'2013-09-24 14:37:27'),(351,11,'2013-09-24 14:37:27'),(352,11,'2013-09-24 14:37:27'),(353,11,'2013-09-24 14:37:28'),(354,11,'2013-09-24 14:37:28'),(355,11,'2013-09-24 14:37:28'),(356,11,'2013-09-24 14:37:28'),(357,11,'2013-09-24 14:37:28'),(358,11,'2013-09-24 14:37:28'),(359,11,'2013-09-24 14:37:30'),(360,11,'2013-09-24 14:37:30'),(361,11,'2013-09-24 14:37:30'),(362,11,'2013-09-24 14:37:30'),(363,11,'2013-09-24 14:37:30'),(364,11,'2013-09-24 14:37:30'),(365,11,'2013-09-24 14:37:30'),(366,11,'2013-09-24 14:37:30'),(367,11,'2013-09-24 14:37:31'),(368,11,'2013-09-24 14:37:32'),(369,11,'2013-09-24 14:37:32'),(370,11,'2013-09-24 14:37:32'),(371,11,'2013-09-24 14:37:32'),(372,11,'2013-09-24 14:37:32'),(373,11,'2013-09-24 14:37:32'),(374,11,'2013-09-24 14:37:33'),(375,11,'2013-09-24 14:37:33'),(376,11,'2013-09-24 14:37:33'),(377,11,'2013-09-24 14:37:33'),(378,11,'2013-09-24 14:37:33'),(379,11,'2013-09-24 14:37:33'),(380,11,'2013-09-24 14:37:35'),(381,11,'2013-09-24 14:37:35'),(382,11,'2013-09-24 14:37:35'),(383,11,'2013-09-24 14:37:35'),(384,11,'2013-09-24 14:37:35'),(385,11,'2013-09-24 14:37:35'),(386,11,'2013-09-24 14:37:36'),(387,11,'2013-09-24 14:37:36'),(388,11,'2013-09-24 14:37:36'),(389,11,'2013-09-24 14:37:36'),(390,11,'2013-09-24 14:37:36'),(391,11,'2013-09-24 14:37:36'),(392,11,'2013-09-24 14:37:37'),(393,11,'2013-09-24 14:37:37'),(394,11,'2013-09-24 14:37:49'),(395,11,'2013-09-24 14:37:50'),(396,11,'2013-09-24 14:37:51'),(397,11,'2013-09-24 14:37:55'),(398,11,'2013-09-24 14:37:59'),(399,12,'2013-09-24 18:42:03'),(400,12,'2013-09-24 18:42:04'),(401,12,'2013-09-24 18:42:04'),(402,12,'2013-09-24 18:42:04'),(403,12,'2013-09-24 18:42:04'),(404,12,'2013-09-24 18:42:05'),(405,12,'2013-09-24 18:42:05'),(406,12,'2013-09-24 18:42:05'),(407,12,'2013-09-24 18:42:05'),(408,12,'2013-09-24 18:42:05'),(409,12,'2013-09-24 18:42:05'),(410,12,'2013-09-24 18:42:06'),(411,12,'2013-09-24 18:42:06'),(412,12,'2013-09-24 18:42:06'),(413,12,'2013-09-24 18:42:06'),(414,12,'2013-09-24 18:42:06'),(415,12,'2013-09-24 18:42:06'),(416,12,'2013-09-24 18:42:07'),(417,12,'2013-09-24 18:42:07'),(418,12,'2013-09-24 18:42:07'),(419,13,'2013-09-25 05:50:38'),(420,13,'2013-09-25 05:50:39'),(421,13,'2013-09-25 05:50:39'),(422,13,'2013-09-25 05:50:39'),(423,13,'2013-09-25 05:50:39'),(424,13,'2013-09-25 05:50:41'),(425,13,'2013-09-25 05:50:41'),(426,13,'2013-09-25 05:50:41'),(427,13,'2013-09-25 05:50:41'),(428,13,'2013-09-25 05:50:41'),(429,13,'2013-09-25 05:50:41'),(430,13,'2013-09-25 05:50:42'),(431,13,'2013-09-25 05:50:42'),(432,13,'2013-09-25 05:50:42'),(433,13,'2013-09-25 05:50:42'),(434,13,'2013-09-25 05:50:42'),(435,13,'2013-09-25 05:50:42'),(436,13,'2013-09-25 05:50:42'),(437,13,'2013-09-25 05:50:42'),(438,13,'2013-09-25 05:50:43'),(439,13,'2013-09-25 06:03:05'),(440,13,'2013-09-25 06:03:06'),(441,13,'2013-09-25 06:03:06'),(442,13,'2013-09-25 06:03:06'),(443,13,'2013-09-25 06:03:06'),(444,13,'2013-09-25 06:03:07'),(445,13,'2013-09-25 06:03:07'),(446,13,'2013-09-25 06:03:07'),(447,13,'2013-09-25 06:03:07'),(448,13,'2013-09-25 06:03:07'),(449,13,'2013-09-25 06:03:07'),(450,13,'2013-09-25 06:03:08'),(451,13,'2013-09-25 06:03:08'),(452,13,'2013-09-25 06:03:08'),(453,13,'2013-09-25 06:03:08'),(454,13,'2013-09-25 06:03:08'),(455,13,'2013-09-25 06:03:08'),(456,13,'2013-09-25 06:03:09'),(457,13,'2013-09-25 06:03:09'),(458,13,'2013-09-25 06:03:09'),(459,13,'2013-09-25 06:27:02'),(460,14,'2013-09-25 07:41:07'),(461,14,'2013-09-25 07:41:16'),(462,14,'2013-09-25 07:41:17'),(463,14,'2013-09-25 07:41:17'),(464,14,'2013-09-25 07:41:17'),(465,14,'2013-09-25 07:41:17'),(466,14,'2013-09-25 07:41:17'),(467,14,'2013-09-25 07:41:18'),(468,14,'2013-09-25 07:41:33'),(469,14,'2013-09-25 07:41:34'),(470,14,'2013-09-25 07:41:37'),(471,14,'2013-09-25 07:41:38'),(472,14,'2013-09-25 07:42:07'),(473,14,'2013-09-25 07:42:08'),(474,14,'2013-09-25 07:42:08'),(475,14,'2013-09-25 07:42:08'),(476,14,'2013-09-25 07:42:08'),(477,14,'2013-09-25 07:42:08'),(478,14,'2013-09-25 07:42:09'),(479,14,'2013-09-25 07:42:19'),(480,14,'2013-09-25 07:42:21'),(481,14,'2013-09-25 07:42:21'),(482,14,'2013-09-25 07:42:26'),(483,14,'2013-09-25 07:42:26'),(484,14,'2013-09-25 07:42:26'),(485,14,'2013-09-25 07:42:26'),(486,14,'2013-09-25 07:42:26'),(487,14,'2013-09-25 07:42:27'),(488,14,'2013-09-25 07:42:28'),(489,14,'2013-09-25 07:42:29'),(490,14,'2013-09-25 07:42:30'),(491,14,'2013-09-25 07:42:32'),(492,14,'2013-09-25 07:42:32'),(493,14,'2013-09-25 07:45:37'),(494,14,'2013-09-25 07:45:38'),(495,14,'2013-09-25 07:45:38'),(496,14,'2013-09-25 07:45:38'),(497,14,'2013-09-25 07:45:38'),(498,14,'2013-09-25 07:45:38'),(499,14,'2013-09-25 07:45:44'),(500,14,'2013-09-25 07:45:44'),(501,14,'2013-09-25 07:45:46'),(502,14,'2013-09-25 07:45:46'),(503,14,'2013-09-25 07:45:47'),(504,14,'2013-09-25 07:45:48'),(505,14,'2013-09-25 07:45:49'),(506,14,'2013-09-25 07:46:02'),(507,14,'2013-09-25 07:46:02'),(508,14,'2013-09-25 07:46:03'),(509,14,'2013-09-25 07:46:16'),(510,14,'2013-09-25 07:46:16'),(511,14,'2013-09-25 07:46:17'),(512,14,'2013-09-25 07:46:20'),(513,14,'2013-09-25 07:46:21'),(514,14,'2013-09-25 07:46:39'),(515,14,'2013-09-25 07:46:39'),(516,14,'2013-09-25 07:47:10'),(517,14,'2013-09-25 07:47:12'),(518,14,'2013-09-25 07:47:12'),(519,14,'2013-09-25 07:47:18'),(520,14,'2013-09-25 07:47:52'),(521,14,'2013-09-25 07:47:52'),(522,15,'2013-09-26 05:03:13'),(523,15,'2013-09-26 05:03:15'),(524,15,'2013-09-26 05:03:15'),(525,15,'2013-09-26 05:03:15'),(526,15,'2013-09-26 05:03:15'),(527,15,'2013-09-26 05:03:15'),(528,15,'2013-09-26 05:03:16'),(529,15,'2013-09-26 05:03:16'),(530,15,'2013-09-26 05:03:16'),(531,15,'2013-09-26 05:03:16'),(532,15,'2013-09-26 05:03:16'),(533,15,'2013-09-26 05:03:16'),(534,15,'2013-09-26 05:03:17'),(535,15,'2013-09-26 05:03:17'),(536,15,'2013-09-26 05:03:17'),(537,15,'2013-09-26 05:03:17'),(538,15,'2013-09-26 05:03:17'),(539,15,'2013-09-26 05:03:17'),(540,15,'2013-09-26 05:03:18'),(541,15,'2013-09-26 05:03:19'),(542,15,'2013-09-26 05:04:15'),(543,15,'2013-09-26 05:04:16'),(544,15,'2013-09-26 05:04:19'),(545,15,'2013-09-26 05:04:20'),(546,15,'2013-09-26 05:04:49'),(547,15,'2013-09-26 05:04:50'),(548,15,'2013-09-26 05:04:50'),(549,15,'2013-09-26 05:04:50'),(550,15,'2013-09-26 05:04:50'),(551,15,'2013-09-26 05:04:50'),(552,15,'2013-09-26 05:04:51'),(553,15,'2013-09-26 05:05:16'),(554,15,'2013-09-26 05:05:16'),(555,15,'2013-09-26 05:05:17'),(556,15,'2013-09-26 05:05:17'),(557,15,'2013-09-26 05:05:17'),(558,15,'2013-09-26 05:05:17'),(559,15,'2013-09-26 05:05:17'),(560,15,'2013-09-26 05:05:19'),(561,15,'2013-09-26 05:05:19'),(562,15,'2013-09-26 05:05:19'),(563,15,'2013-09-26 05:05:19'),(564,15,'2013-09-26 05:05:19'),(565,15,'2013-09-26 05:05:19'),(566,15,'2013-09-26 05:05:20'),(567,15,'2013-09-26 05:05:20'),(568,15,'2013-09-26 05:05:20'),(569,15,'2013-09-26 05:05:20'),(570,15,'2013-09-26 05:05:20'),(571,15,'2013-09-26 05:05:21'),(572,15,'2013-09-26 05:05:21'),(573,15,'2013-09-26 05:05:21'),(574,15,'2013-09-26 05:05:21'),(575,15,'2013-09-26 05:05:21'),(576,15,'2013-09-26 05:05:21'),(577,15,'2013-09-26 05:05:22'),(578,15,'2013-09-26 05:05:22'),(579,15,'2013-09-26 05:05:23'),(580,15,'2013-09-26 05:05:23'),(581,15,'2013-09-26 05:05:47'),(582,15,'2013-09-26 05:05:48'),(583,15,'2013-09-26 05:05:48'),(584,15,'2013-09-26 05:05:48'),(585,15,'2013-09-26 05:05:48'),(586,15,'2013-09-26 05:05:48'),(587,15,'2013-09-26 05:05:48'),(588,15,'2013-09-26 05:06:10'),(589,15,'2013-09-26 05:07:05'),(590,15,'2013-09-26 05:08:52'),(591,15,'2013-09-26 05:10:06'),(592,15,'2013-09-26 05:10:16'),(593,16,'2013-09-26 06:30:22'),(594,16,'2013-09-26 06:37:01'),(595,16,'2013-09-26 06:37:06'),(596,16,'2013-09-26 06:37:07'),(597,16,'2013-09-26 06:37:07'),(598,16,'2013-09-26 06:37:07'),(599,16,'2013-09-26 06:37:07'),(600,16,'2013-09-26 06:37:28'),(601,16,'2013-09-26 06:37:33'),(602,16,'2013-09-26 06:38:04'),(603,16,'2013-09-26 06:38:05'),(604,16,'2013-09-26 06:38:05'),(605,16,'2013-09-26 06:38:05'),(606,16,'2013-09-26 06:38:05'),(607,16,'2013-09-26 06:38:43'),(608,16,'2013-09-26 06:38:44'),(609,16,'2013-09-26 06:38:44'),(610,16,'2013-09-26 06:38:44'),(611,16,'2013-09-26 06:38:44'),(612,16,'2013-09-26 06:39:36'),(613,16,'2013-09-26 06:39:37'),(614,16,'2013-09-26 06:39:37'),(615,16,'2013-09-26 06:39:37'),(616,16,'2013-09-26 06:39:37'),(617,16,'2013-09-26 06:39:47'),(618,16,'2013-09-26 06:39:51'),(619,16,'2013-09-26 06:40:23'),(620,16,'2013-09-26 06:40:24'),(621,16,'2013-09-26 06:40:24'),(622,16,'2013-09-26 06:40:24'),(623,16,'2013-09-26 06:40:24'),(624,16,'2013-09-26 06:40:45'),(625,16,'2013-09-26 06:40:46'),(626,16,'2013-09-26 06:40:46'),(627,16,'2013-09-26 06:40:46'),(628,16,'2013-09-26 06:40:46'),(629,16,'2013-09-26 06:40:54'),(630,16,'2013-09-26 06:40:56'),(631,16,'2013-09-26 06:40:58'),(632,16,'2013-09-26 06:40:58'),(633,16,'2013-09-26 06:40:59'),(634,16,'2013-09-26 06:40:59'),(635,16,'2013-09-26 06:41:01'),(636,16,'2013-09-26 06:41:03'),(637,16,'2013-09-26 06:41:06'),(638,16,'2013-09-26 06:41:08'),(639,16,'2013-09-26 06:41:09'),(640,16,'2013-09-26 06:41:09'),(641,16,'2013-09-26 06:41:09'),(642,16,'2013-09-26 06:41:09'),(643,16,'2013-09-26 06:42:36'),(644,16,'2013-09-26 06:42:36'),(645,16,'2013-09-26 06:42:36'),(646,16,'2013-09-26 06:42:36'),(647,16,'2013-09-26 06:42:36'),(648,16,'2013-09-26 06:42:40'),(649,16,'2013-09-26 06:42:40'),(650,16,'2013-09-26 06:42:40'),(651,16,'2013-09-26 06:42:40'),(652,16,'2013-09-26 06:42:40'),(653,16,'2013-09-26 06:48:17'),(654,16,'2013-09-26 06:48:17'),(655,16,'2013-09-26 06:48:17'),(656,16,'2013-09-26 06:48:17'),(657,16,'2013-09-26 06:48:17'),(658,16,'2013-09-26 06:48:27'),(659,16,'2013-09-26 06:48:29'),(660,16,'2013-09-26 06:48:36'),(661,16,'2013-09-26 06:48:53'),(662,16,'2013-09-26 06:49:25'),(663,16,'2013-09-26 06:49:27'),(664,16,'2013-09-26 06:49:27'),(665,16,'2013-09-26 06:49:27'),(666,16,'2013-09-26 06:49:27'),(667,16,'2013-09-26 06:49:27'),(668,16,'2013-09-26 06:49:33'),(669,16,'2013-09-26 06:49:33'),(670,16,'2013-09-26 06:49:33'),(671,16,'2013-09-26 06:49:33'),(672,16,'2013-09-26 06:49:33'),(673,17,'2013-09-26 06:50:14'),(674,17,'2013-09-26 06:50:14'),(675,17,'2013-09-26 06:50:15'),(676,17,'2013-09-26 06:50:15'),(677,17,'2013-09-26 06:50:15'),(678,17,'2013-09-26 06:50:17'),(679,17,'2013-09-26 06:50:17'),(680,17,'2013-09-26 06:50:17'),(681,17,'2013-09-26 06:50:17'),(682,17,'2013-09-26 06:50:17'),(683,17,'2013-09-26 06:53:05'),(684,17,'2013-09-26 06:53:06'),(685,17,'2013-09-26 06:53:06'),(686,17,'2013-09-26 06:53:06'),(687,17,'2013-09-26 06:53:06'),(688,17,'2013-09-26 06:54:50'),(689,17,'2013-09-26 06:54:50'),(690,17,'2013-09-26 06:54:51'),(691,17,'2013-09-26 06:54:51'),(692,17,'2013-09-26 06:54:51'),(693,17,'2013-09-26 06:55:01'),(694,17,'2013-09-26 06:55:02'),(695,17,'2013-09-26 06:55:02'),(696,17,'2013-09-26 06:55:02'),(697,17,'2013-09-26 06:55:02'),(698,17,'2013-09-26 06:56:07'),(699,17,'2013-09-26 06:56:07'),(700,17,'2013-09-26 06:56:08'),(701,17,'2013-09-26 06:56:08'),(702,17,'2013-09-26 06:56:08'),(703,17,'2013-09-26 06:56:30'),(704,17,'2013-09-26 06:56:31'),(705,17,'2013-09-26 06:56:31'),(706,17,'2013-09-26 06:56:31'),(707,17,'2013-09-26 06:56:31'),(708,17,'2013-09-26 06:56:41'),(709,17,'2013-09-26 06:56:42'),(710,17,'2013-09-26 06:56:42'),(711,17,'2013-09-26 06:56:42'),(712,17,'2013-09-26 06:56:42'),(713,16,'2013-09-26 06:58:46'),(714,16,'2013-09-26 06:58:47'),(715,16,'2013-09-26 06:58:47'),(716,16,'2013-09-26 06:58:47'),(717,16,'2013-09-26 06:58:47'),(718,16,'2013-09-26 06:59:00'),(719,16,'2013-09-26 06:59:06'),(720,16,'2013-09-26 07:00:04'),(721,16,'2013-09-26 07:00:04'),(722,16,'2013-09-26 07:00:04'),(723,16,'2013-09-26 07:00:04'),(724,16,'2013-09-26 07:00:04'),(725,17,'2013-09-26 07:00:36'),(726,17,'2013-09-26 07:00:36'),(727,17,'2013-09-26 07:00:36'),(728,17,'2013-09-26 07:00:36'),(729,17,'2013-09-26 07:00:36'),(730,17,'2013-09-26 07:01:53'),(731,17,'2013-09-26 07:01:57'),(732,17,'2013-09-26 07:01:58'),(733,17,'2013-09-26 07:01:58'),(734,17,'2013-09-26 07:01:58'),(735,17,'2013-09-26 07:01:58'),(736,17,'2013-09-26 07:04:01'),(737,17,'2013-09-26 07:04:01'),(738,17,'2013-09-26 07:04:02'),(739,17,'2013-09-26 07:04:02'),(740,17,'2013-09-26 07:04:02'),(741,17,'2013-09-26 07:04:22'),(742,17,'2013-09-26 07:04:22'),(743,17,'2013-09-26 07:04:23'),(744,17,'2013-09-26 07:04:23'),(745,17,'2013-09-26 07:04:23'),(746,17,'2013-09-26 07:05:40'),(747,17,'2013-09-26 07:05:40'),(748,17,'2013-09-26 07:05:41'),(749,17,'2013-09-26 07:05:41'),(750,17,'2013-09-26 07:05:41'),(751,17,'2013-09-26 07:05:54'),(752,17,'2013-09-26 07:05:55'),(753,17,'2013-09-26 07:05:55'),(754,17,'2013-09-26 07:05:55'),(755,17,'2013-09-26 07:05:55'),(756,17,'2013-09-26 07:06:07'),(757,17,'2013-09-26 07:06:08'),(758,17,'2013-09-26 07:06:08'),(759,17,'2013-09-26 07:06:08'),(760,17,'2013-09-26 07:06:08'),(761,17,'2013-09-26 07:06:20'),(762,17,'2013-09-26 07:06:20'),(763,17,'2013-09-26 07:06:21'),(764,17,'2013-09-26 07:06:21'),(765,17,'2013-09-26 07:06:21'),(766,17,'2013-09-26 07:06:35'),(767,17,'2013-09-26 07:06:35'),(768,17,'2013-09-26 07:06:36'),(769,17,'2013-09-26 07:06:36'),(770,17,'2013-09-26 07:06:36'),(771,17,'2013-09-26 07:06:44'),(772,17,'2013-09-26 07:06:44'),(773,17,'2013-09-26 07:06:45'),(774,17,'2013-09-26 07:06:45'),(775,17,'2013-09-26 07:06:45'),(776,17,'2013-09-26 07:06:55'),(777,17,'2013-09-26 07:06:56'),(778,17,'2013-09-26 07:06:56'),(779,17,'2013-09-26 07:06:56'),(780,17,'2013-09-26 07:06:56'),(781,17,'2013-09-26 07:07:04'),(782,17,'2013-09-26 07:07:04'),(783,17,'2013-09-26 07:07:05'),(784,17,'2013-09-26 07:07:05'),(785,17,'2013-09-26 07:07:05'),(786,17,'2013-09-26 07:09:07'),(787,17,'2013-09-26 07:09:08'),(788,17,'2013-09-26 07:09:08'),(789,17,'2013-09-26 07:09:08'),(790,17,'2013-09-26 07:09:08'),(791,17,'2013-09-26 07:09:24'),(792,17,'2013-09-26 07:09:24'),(793,17,'2013-09-26 07:09:25'),(794,17,'2013-09-26 07:09:25'),(795,17,'2013-09-26 07:09:25'),(796,16,'2013-09-26 07:09:47'),(797,16,'2013-09-26 07:09:47'),(798,16,'2013-09-26 07:09:47'),(799,16,'2013-09-26 07:09:47'),(800,16,'2013-09-26 07:09:47'),(801,16,'2013-09-26 07:10:21'),(802,16,'2013-09-26 07:10:21'),(803,16,'2013-09-26 07:10:21'),(804,16,'2013-09-26 07:10:21'),(805,16,'2013-09-26 07:10:21'),(806,16,'2013-09-26 07:10:46'),(807,16,'2013-09-26 07:10:46'),(808,16,'2013-09-26 07:10:46'),(809,16,'2013-09-26 07:10:46'),(810,16,'2013-09-26 07:10:46'),(811,16,'2013-09-26 07:10:55'),(812,16,'2013-09-26 07:10:56'),(813,16,'2013-09-26 07:10:56'),(814,16,'2013-09-26 07:10:56'),(815,16,'2013-09-26 07:10:56'),(816,16,'2013-09-26 07:11:13'),(817,16,'2013-09-26 07:11:13'),(818,16,'2013-09-26 07:11:13'),(819,16,'2013-09-26 07:11:13'),(820,16,'2013-09-26 07:11:14'),(821,16,'2013-09-26 07:13:01'),(822,16,'2013-09-26 07:13:02'),(823,16,'2013-09-26 07:13:02'),(824,16,'2013-09-26 07:13:02'),(825,16,'2013-09-26 07:13:02'),(826,16,'2013-09-26 07:13:08'),(827,16,'2013-09-26 07:13:08'),(828,16,'2013-09-26 07:13:08'),(829,16,'2013-09-26 07:13:08'),(830,16,'2013-09-26 07:13:08'),(831,16,'2013-09-26 07:13:15'),(832,16,'2013-09-26 07:13:16'),(833,16,'2013-09-26 07:13:16'),(834,16,'2013-09-26 07:13:16'),(835,16,'2013-09-26 07:13:16'),(836,16,'2013-09-26 07:14:53'),(837,16,'2013-09-26 07:14:53'),(838,16,'2013-09-26 07:14:53'),(839,16,'2013-09-26 07:14:53'),(840,16,'2013-09-26 07:14:53'),(841,16,'2013-09-26 07:15:32'),(842,16,'2013-09-26 07:15:33'),(843,16,'2013-09-26 07:15:33'),(844,16,'2013-09-26 07:15:33'),(845,16,'2013-09-26 07:15:33'),(846,16,'2013-09-26 07:16:44'),(847,16,'2013-09-26 07:16:44'),(848,16,'2013-09-26 07:16:44'),(849,16,'2013-09-26 07:16:44'),(850,16,'2013-09-26 07:16:44'),(851,16,'2013-09-26 07:17:19'),(852,16,'2013-09-26 07:18:10'),(853,16,'2013-09-26 07:18:46'),(854,16,'2013-09-26 07:18:52'),(855,16,'2013-09-26 07:19:38'),(856,16,'2013-09-26 07:19:44'),(857,16,'2013-09-26 07:22:22'),(858,17,'2013-09-26 07:23:03'),(859,17,'2013-09-26 07:24:59'),(860,17,'2013-09-26 07:28:41'),(861,16,'2013-09-26 07:29:15'),(862,16,'2013-09-26 07:30:05'),(863,16,'2013-09-26 07:31:22'),(864,16,'2013-09-26 07:31:27'),(865,16,'2013-09-26 07:32:08'),(866,16,'2013-09-26 07:33:29'),(867,16,'2013-09-26 07:33:49'),(868,16,'2013-09-26 07:33:54'),(869,16,'2013-09-26 07:34:01'),(870,16,'2013-09-26 07:34:13'),(871,16,'2013-09-26 07:34:15'),(872,16,'2013-09-26 07:35:15'),(873,16,'2013-09-26 07:35:26'),(874,16,'2013-09-26 07:35:29'),(875,16,'2013-09-26 07:35:33'),(876,16,'2013-09-26 07:35:40'),(877,16,'2013-09-26 07:35:46'),(878,16,'2013-09-26 07:35:48'),(879,16,'2013-09-26 07:35:49'),(880,16,'2013-09-26 07:35:49'),(881,16,'2013-09-26 07:35:49'),(882,16,'2013-09-26 07:35:50'),(883,16,'2013-09-26 07:35:50'),(884,16,'2013-09-26 07:35:51'),(885,16,'2013-09-26 07:35:54'),(886,16,'2013-09-26 07:35:58');
/*!40000 ALTER TABLE `log_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_url_info`
--

DROP TABLE IF EXISTS `log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'URL ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=887 DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_url_info`
--

LOCK TABLES `log_url_info` WRITE;
/*!40000 ALTER TABLE `log_url_info` DISABLE KEYS */;
INSERT INTO `log_url_info` VALUES (1,'http://localhost/magento/',NULL),(2,'http://localhost/magento/',NULL),(3,'http://localhost/magento/skin/frontend/base/default/images/media/footer_callout.png','http://localhost/magento/'),(4,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/'),(5,'http://localhost/magento/skin/frontend/base/default/images/media/footer_callout.png','http://localhost/magento/index.php/customer/account/login/'),(6,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(7,'http://localhost/magento/skin/frontend/base/default/images/media/footer_callout.png','http://localhost/magento/index.php/customer/account/login/'),(8,'http://localhost/magento/index.php/checkout/','http://localhost/magento/index.php/customer/account/login/'),(9,'http://localhost/magento/index.php/checkout/onepage/','http://localhost/magento/index.php/customer/account/login/'),(10,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/customer/account/login/'),(11,'http://localhost/magento/skin/frontend/base/default/images/media/footer_callout.png','http://localhost/magento/index.php/checkout/cart/'),(12,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/checkout/cart/'),(13,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/checkout/cart/'),(14,'http://localhost/magento/skin/frontend/base/default/images/media/footer_callout.png','http://localhost/magento/index.php/customer/account/login/'),(15,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/checkout/cart/'),(16,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(17,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(18,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(19,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(20,'http://localhost/magento/index.php/checkout/','http://localhost/magento/index.php/customer/account/login/'),(21,'http://localhost/magento/index.php/checkout/onepage/','http://localhost/magento/index.php/customer/account/login/'),(22,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/customer/account/login/'),(23,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/checkout/cart/'),(24,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(25,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(26,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(27,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(28,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(29,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(30,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(31,'http://localhost/magento/index.php/','http://localhost/magento/index.php/'),(32,'http://localhost/magento/index.php/','http://localhost/magento/index.php/'),(33,'http://localhost/magento/index.php/','http://localhost/magento/index.php/'),(34,'http://localhost/magento/index.php/','http://localhost/magento/index.php/'),(35,'http://localhost/magento/index.php/','http://localhost/magento/index.php/'),(36,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(37,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(38,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(39,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(40,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(41,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(42,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/checkout/cart/'),(43,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/checkout/cart/'),(44,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(45,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(46,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(47,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(48,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(49,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(50,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(51,'http://localhost/magento/index.php/catalog/category/view/id/6?dir=asc&order=name','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(52,'http://localhost/magento/index.php/catalog/category/view/id/6?dir=asc&order=name','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(53,'http://localhost/magento/index.php/catalog/category/view/id/6?dir=asc&order=name','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(54,'http://localhost/magento/',NULL),(55,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/'),(56,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/'),(57,'http://localhost/magento/index.php/catalog/product/view/id/2/category/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(58,'http://localhost/magento/index.php/catalog/product/view/id/2/category/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(59,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(60,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(61,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(62,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(63,'http://localhost/magento/index.php/catalog/product/view/id/2/category/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(64,'http://localhost/magento/index.php/catalog/product/gallery/id/2/image/2/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(65,'http://localhost/magento/index.php/catalog/product/gallery/image/1/id/2/','http://localhost/magento/index.php/catalog/product/gallery/id/2/image/2/'),(66,'http://localhost/magento/index.php/catalog/product/gallery/id/2/image/2/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(67,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(68,'http://localhost/magento/index.php/catalog/product/view/id/2','http://localhost/magento/index.php/'),(69,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(70,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(71,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(72,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(73,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(74,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(75,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(76,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(77,'http://localhost/magento/index.php/customer/account/create/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(78,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(79,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(80,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(81,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(82,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(83,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(84,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(85,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(86,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(87,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(88,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(89,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(90,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(91,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(92,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(93,'http://localhost/magento/index.php/catalogsearch/result/?q=apple','http://localhost/magento/index.php/'),(94,'http://localhost/magento/index.php/','http://localhost/magento/index.php/catalogsearch/result/?q=apple'),(95,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(96,'http://localhost/magento/index.php/customer/account/login/',NULL),(97,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(98,'http://localhost/magento/index.php',NULL),(99,'http://localhost/magento/index.php/','http://localhost/magento/index.php/customer/account/login/'),(100,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(101,'http://localhost/magento/index.php/',NULL),(102,'http://localhost/magento/',NULL),(103,'http://localhost/magento/index.php/',NULL),(104,'http://localhost/magento/',NULL),(105,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/'),(106,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/'),(107,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/'),(108,'http://localhost/magento/',NULL),(109,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/'),(110,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/'),(111,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/'),(112,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/'),(113,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(114,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/'),(115,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(116,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(117,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(118,'http://localhost/magento/index.php/catalog/category/view/id/6?mode=list','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(119,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html?mode=list'),(120,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/checkout/cart/'),(121,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(122,'http://localhost/magento/index.php/about-magento-demo-store','http://localhost/magento/index.php/'),(123,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/about-magento-demo-store'),(124,'http://localhost/magento/index.php/about-magento-demo-store','http://localhost/magento/index.php/'),(125,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(126,'http://localhost/magento/index.php/about-magento-demo-store','http://localhost/magento/index.php/'),(127,'http://localhost/magento/index.php/about-magento-demo-store','http://localhost/magento/index.php/'),(128,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/about-magento-demo-store'),(129,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(130,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(131,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(132,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(133,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(134,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(135,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(136,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(137,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(138,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(139,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(140,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(141,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(142,'http://localhost/magento/index.php/',NULL),(143,'http://localhost/magento/index.php/',NULL),(144,'http://localhost/magento/index.php/',NULL),(145,'http://localhost/magento/index.php/',NULL),(146,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(147,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(148,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(149,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(150,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(151,'http://localhost/magento/index.php/',NULL),(152,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(153,'http://localhost/magento/index.php/',NULL),(154,'http://localhost/magento/index.php',NULL),(155,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(156,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(157,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(158,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(159,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php'),(160,'http://localhost/magento/index.php',NULL),(161,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(162,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(163,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(164,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php'),(165,'http://localhost/magento/index.php',NULL),(166,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(167,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(168,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(169,'http://localhost/magento/index.php',NULL),(170,'http://localhost/magento/index.php/','http://localhost/magento/index.php'),(171,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(172,'http://localhost/magento/index.php/','http://localhost/magento/index.php'),(173,'http://localhost/magento/index.php',NULL),(174,'http://localhost/magento/index.php/','http://localhost/magento/index.php'),(175,'http://localhost/magento/index.php/catalogsearch/ajax/suggest/?q=www','http://localhost/magento/index.php/'),(176,'http://localhost/magento/index.php/catalogsearch/result/?q=www','http://localhost/magento/index.php/'),(177,'http://localhost/magento/index.php/catalogsearch/ajax/suggest/?q=ip','http://localhost/magento/index.php/catalogsearch/result/?q=www'),(178,'http://localhost/magento/index.php/catalogsearch/ajax/suggest/?q=iphone','http://localhost/magento/index.php/catalogsearch/result/?q=www'),(179,'http://localhost/magento/index.php/catalogsearch/result/?q=iphone','http://localhost/magento/index.php/catalogsearch/result/?q=www'),(180,'http://localhost/magento/index.php/catalogsearch/result/?q=www','http://localhost/magento/index.php/'),(181,'http://localhost/magento/index.php/','http://localhost/magento/index.php'),(182,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(183,'http://localhost/magento/index.php/','http://localhost/magento/index.php'),(184,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(185,'http://localhost/magento/index.php/customer/account/create/','http://localhost/magento/index.php/customer/account/login/'),(186,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/create/'),(187,'http://localhost/magento/index.php/customer/account/loginPost/','http://localhost/magento/index.php/customer/account/login/'),(188,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(189,'http://localhost/magento/index.php/customer/account/loginPost/','http://localhost/magento/index.php/customer/account/login/'),(190,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(191,'http://localhost/magento/index.php/customer/account/loginPost/','http://localhost/magento/index.php/customer/account/login/'),(192,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(193,'http://localhost/magento/index.php/customer/account/forgotpassword/','http://localhost/magento/index.php/customer/account/login/'),(194,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(195,'http://localhost/magento/index.php/customer/account/create/','http://localhost/magento/index.php/customer/account/login/'),(196,'http://localhost/magento/index.php/customer/account/createpost/','http://localhost/magento/index.php/customer/account/create/'),(197,'http://localhost/magento/index.php/customer/account/index/','http://localhost/magento/index.php/customer/account/create/'),(198,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/index/'),(199,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(200,'http://localhost/magento/index.php/customer/account/','http://localhost/magento/index.php/'),(201,'http://localhost/magento/index.php/sales/order/history/','http://localhost/magento/index.php/customer/account/'),(202,'http://localhost/magento/index.php/customer/account/edit/','http://localhost/magento/index.php/sales/order/history/'),(203,'http://localhost/magento/index.php/customer/account/','http://localhost/magento/index.php/customer/account/edit/'),(204,'http://localhost/magento/index.php/oauth/customer_token/','http://localhost/magento/index.php/customer/account/'),(205,'http://localhost/magento/index.php/newsletter/manage/','http://localhost/magento/index.php/oauth/customer_token/'),(206,'http://localhost/magento/index.php/downloadable/customer/products/','http://localhost/magento/index.php/newsletter/manage/'),(207,'http://localhost/magento/index.php/newsletter/manage/','http://localhost/magento/index.php/oauth/customer_token/'),(208,'http://localhost/magento/index.php/oauth/customer_token/','http://localhost/magento/index.php/customer/account/'),(209,'http://localhost/magento/index.php/customer/account/','http://localhost/magento/index.php/customer/account/edit/'),(210,'http://localhost/magento/index.php/customer/account/edit/','http://localhost/magento/index.php/sales/order/history/'),(211,'http://localhost/magento/index.php/sales/order/history/','http://localhost/magento/index.php/customer/account/'),(212,'http://localhost/magento/index.php/customer/account/','http://localhost/magento/index.php/'),(213,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(214,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(215,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(216,'http://localhost/magento/index.php/wishlist/','http://localhost/magento/index.php/'),(217,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(218,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(219,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(220,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(221,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(222,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(223,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(224,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(225,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(226,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(227,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(228,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(229,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(230,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(231,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(232,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/'),(233,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(234,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(235,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(236,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(237,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(238,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(239,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(240,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(241,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/customer/account/login/'),(242,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(243,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/customer/account/login/'),(244,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(245,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(246,'http://localhost/magento/index.php/catalog/product/view/id/1/category/6','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(247,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(248,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(249,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(250,'http://localhost/magento/skin/frontend/base/default/images/slider_btn_zoom_in.gif','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(251,'http://localhost/magento/skin/frontend/base/default/images/media/col_right_callout.jpg','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(252,'http://localhost/magento/skin/frontend/base/default/images/slider_btn_zoom_out.gif','http://localhost/magento/index.php/ae-aeoe-e-se/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(253,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(254,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(255,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(256,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/checkout/cart/'),(257,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(258,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/checkout/cart/'),(259,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(260,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/checkout/cart/'),(261,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(262,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/checkout/cart/'),(263,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(264,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/'),(265,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(266,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(267,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(268,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(269,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(270,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(271,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(272,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(273,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(274,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/'),(275,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(276,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(277,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(278,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(279,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(280,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(281,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(282,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/index.php/'),(283,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(284,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(285,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(286,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(287,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(288,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(289,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(290,'http://localhost/magento/skin/frontend/base/default/css/styles.css',NULL),(291,'http://localhost/magento/skin/frontend/base/default/css/styles.css','http://localhost/magento/skin/frontend/base/default/css/styles.css'),(292,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/skin/frontend/base/default/css/styles.css'),(293,'http://localhost/magento/skin/frontend/base/default/images/media/col_right_callout.jpg','http://localhost/magento/skin/frontend/base/default/css/styles.css'),(294,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/skin/frontend/base/default/css/styles.css'),(295,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(296,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(297,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(298,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(299,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(300,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(301,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(302,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(303,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(304,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(305,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(306,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(307,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(308,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(309,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(310,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(311,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(312,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(313,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(314,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(315,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(316,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(317,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(318,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_login-box.gif','http://localhost/magento/index.php/customer/account/login/'),(319,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/customer/account/login/'),(320,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_buttons-set1.gif','http://localhost/magento/index.php/customer/account/login/'),(321,'http://localhost/magento/skin/frontend/linlin/default/images/i_page2.gif','http://localhost/magento/index.php/customer/account/login/'),(322,'http://localhost/magento/skin/frontend/linlin/default/images/i_page1.gif','http://localhost/magento/index.php/customer/account/login/'),(323,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(324,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(325,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(326,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(327,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(328,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(329,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(330,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(331,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(332,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(333,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(334,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(335,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(336,'http://localhost/magento/skin/frontend/base/default/images/logo.gif','http://localhost/magento/index.php/'),(337,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(338,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(339,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(340,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(341,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(342,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(343,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(344,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(345,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(346,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(347,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(348,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(349,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(350,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(351,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(352,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(353,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(354,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(355,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(356,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(357,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(358,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(359,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(360,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(361,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(362,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(363,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(364,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(365,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(366,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(367,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(368,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(369,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/checkout/cart/'),(370,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/checkout/cart/'),(371,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/checkout/cart/'),(372,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/checkout/cart/'),(373,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/checkout/cart/'),(374,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/checkout/cart/'),(375,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/checkout/cart/'),(376,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/checkout/cart/'),(377,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/checkout/cart/'),(378,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/checkout/cart/'),(379,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(380,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(381,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(382,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(383,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(384,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(385,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(386,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(387,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(388,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(389,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(390,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(391,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(392,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(393,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(394,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(395,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(396,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(397,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(398,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(399,'http://localhost/magento/index.php/',NULL),(400,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(401,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(402,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(403,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(404,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(405,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(406,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(407,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(408,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(409,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(410,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(411,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(412,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(413,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(414,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(415,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(416,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(417,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(418,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(419,'http://localhost/magento/index.php/',NULL),(420,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(421,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(422,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(423,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(424,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(425,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(426,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(427,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(428,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(429,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(430,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(431,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(432,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(433,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(434,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(435,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(436,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(437,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(438,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(439,'http://localhost/magento/index.php',NULL),(440,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(441,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(442,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(443,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(444,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php'),(445,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php'),(446,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php'),(447,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php'),(448,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php'),(449,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php'),(450,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php'),(451,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php'),(452,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php'),(453,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(454,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php'),(455,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php'),(456,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php'),(457,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php'),(458,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php'),(459,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php'),(460,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php'),(461,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(462,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(463,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(464,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(465,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(466,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(467,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(468,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(469,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(470,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(471,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(472,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(473,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(474,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(475,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(476,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(477,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(478,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(479,'http://localhost/magento/skin/frontend/linlin/default/images/validation_advice_bg.gif','http://localhost/magento/index.php/'),(480,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(481,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(482,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(483,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(484,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(485,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(486,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(487,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(488,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(489,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(490,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(491,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(492,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(493,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(494,'http://localhost/magento/skin/frontend/linlin/default/images/i_page2.gif','http://localhost/magento/index.php/customer/account/login/'),(495,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_buttons-set1.gif','http://localhost/magento/index.php/customer/account/login/'),(496,'http://localhost/magento/skin/frontend/linlin/default/images/i_page1.gif','http://localhost/magento/index.php/customer/account/login/'),(497,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_login-box.gif','http://localhost/magento/index.php/customer/account/login/'),(498,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(499,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(500,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(501,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(502,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(503,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(504,'http://localhost/magento/index.php/','http://localhost/magento/index.php/checkout/cart/'),(505,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(506,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(507,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(508,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(509,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(510,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(511,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(512,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(513,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(514,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(515,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(516,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(517,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(518,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(519,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(520,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(521,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/customer/account/login/'),(522,'http://localhost/magento/index.php',NULL),(523,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(524,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(525,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(526,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(527,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(528,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php'),(529,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php'),(530,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php'),(531,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php'),(532,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php'),(533,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php'),(534,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php'),(535,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php'),(536,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php'),(537,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php'),(538,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php'),(539,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php'),(540,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php'),(541,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php'),(542,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php'),(543,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/checkout/cart/'),(544,'http://localhost/magento/index.php',NULL),(545,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(546,'http://localhost/magento/index.php',NULL),(547,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(548,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(549,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(550,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(551,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(552,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php'),(553,'http://localhost/magento/index.php/',NULL),(554,'http://localhost/magento/index.php',NULL),(555,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(556,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(557,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(558,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(559,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php/'),(560,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(561,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(562,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(563,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(564,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(565,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body.gif','http://localhost/magento/index.php/'),(566,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow.png','http://localhost/magento/index.php/'),(567,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_form-search.gif','http://localhost/magento/index.php/'),(568,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_body2.gif','http://localhost/magento/index.php/'),(569,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_header.jpg','http://localhost/magento/index.php/'),(570,'http://localhost/magento/skin/frontend/linlin/default/images/btn_search.gif','http://localhost/magento/index.php/'),(571,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(572,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe1.gif','http://localhost/magento/index.php/'),(573,'http://localhost/magento/skin/frontend/linlin/default/images/i_block-subscribe.gif','http://localhost/magento/index.php/'),(574,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_block-title.gif','http://localhost/magento/index.php/'),(575,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_main2.gif','http://localhost/magento/index.php/'),(576,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_button.gif','http://localhost/magento/index.php/'),(577,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_shadow-bottom.png','http://localhost/magento/index.php/'),(578,'http://localhost/magento/skin/frontend/linlin/default/images/bkg_pipe2.gif','http://localhost/magento/index.php/'),(579,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php'),(580,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php/'),(581,'http://localhost/magento/index.php',NULL),(582,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(583,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(584,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(585,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(586,'http://localhost/magento/skin/frontend/base/default/images/media/col_left_callout.jpg','http://localhost/magento/index.php'),(587,'http://localhost/magento/skin/frontend/base/default/css/print.css','http://localhost/magento/index.php'),(588,'http://localhost/magento/index.php',NULL),(589,'http://localhost/magento/index.php',NULL),(590,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php'),(591,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(592,'http://localhost/magento/index.php/catalog/product/view/id/1/category/8','http://localhost/magento/index.php/'),(593,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/aeoe-ae-a-a/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(594,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/aeoe-ae-a-a/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html'),(595,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(596,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(597,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(598,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(599,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(600,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/'),(601,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(602,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(603,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(604,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(605,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(606,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(607,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(608,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(609,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(610,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(611,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(612,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(613,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(614,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(615,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(616,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(617,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/'),(618,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(619,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(620,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(621,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(622,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(623,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(624,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(625,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(626,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(627,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(628,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(629,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(630,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(631,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/customer/account/login/'),(632,'http://localhost/magento/index.php/checkout/','http://localhost/magento/index.php/checkout/cart/'),(633,'http://localhost/magento/index.php/checkout/onepage/','http://localhost/magento/index.php/checkout/cart/'),(634,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/checkout/cart/'),(635,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/checkout/cart/'),(636,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(637,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(638,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(639,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(640,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(641,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(642,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(643,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(644,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(645,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(646,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(647,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(648,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(649,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(650,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(651,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(652,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(653,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(654,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(655,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(656,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(657,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(658,'http://localhost/magento/index.php/catalogsearch/ajax/suggest/?q=ipone','http://localhost/magento/index.php/'),(659,'http://localhost/magento/index.php/catalogsearch/result/?q=iPhone','http://localhost/magento/index.php/'),(660,'http://localhost/magento/index.php/catalog/product/view/id/2','http://localhost/magento/index.php/catalogsearch/result/?q=iPhone'),(661,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(662,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/apple-iphone-4-8g-3g-gsm-wcdma-md128ch-a.html'),(663,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(664,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(665,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(666,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(667,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(668,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(669,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(670,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(671,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(672,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(673,'http://localhost/magento/index.php/',NULL),(674,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(675,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(676,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(677,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(678,'http://localhost/magento/index.php/',NULL),(679,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(680,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(681,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(682,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(683,'http://localhost/magento/index.php/',NULL),(684,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(685,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(686,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(687,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(688,'http://localhost/magento/index.php/',NULL),(689,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(690,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(691,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(692,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(693,'http://localhost/magento/index.php/',NULL),(694,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(695,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(696,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(697,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(698,'http://localhost/magento/index.php/',NULL),(699,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(700,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(701,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(702,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(703,'http://localhost/magento/index.php/',NULL),(704,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(705,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(706,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(707,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(708,'http://localhost/magento/index.php/',NULL),(709,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(710,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(711,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(712,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(713,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(714,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(715,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(716,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(717,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(718,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/'),(719,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(720,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(721,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(722,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(723,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(724,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(725,'http://localhost/magento/index.php/',NULL),(726,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(727,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(728,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(729,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(730,'http://localhost/magento/index.php/catalog/product/view/id/4/category/8','http://localhost/magento/index.php/'),(731,'http://localhost/magento/index.php/',NULL),(732,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(733,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(734,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(735,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(736,'http://localhost/magento/index.php/',NULL),(737,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(738,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(739,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(740,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(741,'http://localhost/magento/index.php/',NULL),(742,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(743,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(744,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(745,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(746,'http://localhost/magento/index.php/',NULL),(747,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(748,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(749,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(750,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(751,'http://localhost/magento/index.php/',NULL),(752,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(753,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(754,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(755,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(756,'http://localhost/magento/index.php/',NULL),(757,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(758,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(759,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(760,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(761,'http://localhost/magento/index.php/',NULL),(762,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(763,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(764,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(765,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(766,'http://localhost/magento/index.php/',NULL),(767,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(768,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(769,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(770,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(771,'http://localhost/magento/index.php/',NULL),(772,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(773,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(774,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(775,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(776,'http://localhost/magento/index.php/',NULL),(777,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(778,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(779,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(780,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(781,'http://localhost/magento/index.php/',NULL),(782,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(783,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(784,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(785,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(786,'http://localhost/magento/index.php/',NULL),(787,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(788,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(789,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(790,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(791,'http://localhost/magento/index.php/?limit=30','http://localhost/magento/index.php/'),(792,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/?limit=30'),(793,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/?limit=30'),(794,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/?limit=30'),(795,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/?limit=30'),(796,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(797,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(798,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(799,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(800,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(801,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(802,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(803,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(804,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(805,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(806,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(807,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(808,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(809,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(810,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(811,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(812,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(813,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(814,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(815,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(816,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(817,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(818,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(819,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(820,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(821,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(822,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/'),(823,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/'),(824,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/'),(825,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/'),(826,'http://localhost/magento/index.php/?mode=list','http://localhost/magento/index.php/'),(827,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/?mode=list'),(828,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/?mode=list'),(829,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/?mode=list'),(830,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/?mode=list'),(831,'http://localhost/magento/index.php/?mode=grid','http://localhost/magento/index.php/?mode=list'),(832,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php/?mode=grid'),(833,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php/?mode=grid'),(834,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php/?mode=grid'),(835,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php/?mode=grid'),(836,'http://localhost/magento/index.php',NULL),(837,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(838,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(839,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(840,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(841,'http://localhost/magento/index.php',NULL),(842,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(843,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(844,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(845,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(846,'http://localhost/magento/index.php',NULL),(847,'http://localhost/magento/skin/frontend/base/default/js/slider.js','http://localhost/magento/index.php'),(848,'http://localhost/magento/skin/frontend/base/default/js/cycle-fade-effect.js','http://localhost/magento/index.php'),(849,'http://localhost/magento/skin/frontend/base/default/css/slider.css','http://localhost/magento/index.php'),(850,'http://localhost/magento/skin/frontend/base/default/js/jquery-1.5.2.min.js','http://localhost/magento/index.php'),(851,'http://localhost/magento/index.php',NULL),(852,'http://localhost/magento/index.php',NULL),(853,'http://localhost/magento/index.php/?limit=30','http://localhost/magento/index.php'),(854,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(855,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/?limit=15'),(856,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(857,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(858,'http://localhost/magento/index.php/?limit=30','http://localhost/magento/index.php/'),(859,'http://localhost/magento/index.php/?limit=30','http://localhost/magento/index.php/'),(860,'http://localhost/magento/index.php/?limit=30','http://localhost/magento/index.php/'),(861,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(862,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(863,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(864,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(865,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(866,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=30'),(867,'http://localhost/magento/index.php/?limit=9','http://localhost/magento/index.php/?limit=15'),(868,'http://localhost/magento/index.php/?limit=15','http://localhost/magento/index.php/?limit=9'),(869,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/?limit=15'),(870,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(871,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(872,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(873,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(874,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(875,'http://localhost/magento/index.php/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(876,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/'),(877,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/ae-aeoe-e-se/ae-aeoe-e-a.html'),(878,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/ae-aeoe-e-se.html'),(879,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/customer/account/login/'),(880,'http://localhost/magento/index.php/checkout/','http://localhost/magento/index.php/checkout/cart/'),(881,'http://localhost/magento/index.php/checkout/onepage/','http://localhost/magento/index.php/checkout/cart/'),(882,'http://localhost/magento/index.php/checkout/cart/','http://localhost/magento/index.php/checkout/cart/'),(883,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/checkout/cart/'),(884,'http://localhost/magento/index.php/customer/account/login/','http://localhost/magento/index.php/customer/account/login/'),(885,'http://localhost/magento/index.php/catalog/category/view/id/6','http://localhost/magento/index.php/customer/account/login/'),(886,'http://localhost/magento/index.php/catalog/category/view/id/7','http://localhost/magento/index.php/ae-aeoe-e-se.html');
/*!40000 ALTER TABLE `log_url_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor`
--

DROP TABLE IF EXISTS `log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Last URL ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor`
--

LOCK TABLES `log_visitor` WRITE;
/*!40000 ALTER TABLE `log_visitor` DISABLE KEYS */;
INSERT INTO `log_visitor` VALUES (1,'8784a980b69a0d3d21c8025bcc057eef','2013-09-21 06:44:40','2013-09-21 07:47:38',100,1),(2,'b168715d2eb546ada22216f6753018cd','2013-09-21 07:42:57','2013-09-21 07:42:58',96,1),(3,'e10c5237eb15967fb74f3d9f07d84acb','2013-09-21 07:45:00','2013-09-21 07:45:01',98,1),(4,'397b71ca9279d06de95a4836496f63cf','2013-09-22 06:49:29','2013-09-22 06:49:31',101,1),(5,'7a7abed91bda4c29fe5f50cbafa00da8','2013-09-22 07:16:49','2013-09-22 07:16:50',102,1),(6,'c3db7458a2064b85907acf42fad322a9','2013-09-22 08:18:06','2013-09-22 08:50:00',141,1),(7,'f28542afcc8e8ebd66fe8acd65d1039e','2013-09-23 14:40:05','2013-09-23 14:46:08',153,1),(8,'eb1cb6b4f72319b893a9e685df1c42d0','2013-09-23 15:27:19','2013-09-23 15:30:06',172,1),(9,'71b348891b3c1ae9c6533cddae95fca0','2013-09-24 05:54:55','2013-09-24 05:57:58',217,1),(10,'aa3f997e577d92e9f7f3d691baa62baa','2013-09-24 07:31:53','2013-09-24 07:39:44',294,1),(11,'c89273192af68f929d25a7c50e0fc7c7','2013-09-24 14:29:16','2013-09-24 14:37:59',398,1),(12,'be13421b5e43971ae6e5331ab76b81e1','2013-09-24 18:42:02','2013-09-24 18:42:07',418,1),(13,'8cb4935a79f8e2cdc1e0e08e8eeaedeb','2013-09-25 05:50:38','2013-09-25 06:27:02',459,1),(14,'a8c053fbecd8363ddfad052beec6baa0','2013-09-25 07:41:06','2013-09-25 07:47:52',521,1),(15,'62e40306d605842fa97925d2572ea613','2013-09-26 05:03:12','2013-09-26 05:10:16',592,1),(16,'ba4b29c602b5513e532b01d1624cef7e','2013-09-26 06:30:21','2013-09-26 07:35:58',886,1),(17,'03ec25c47c8e8c4d6734ac53853a5566','2013-09-26 06:50:14','2013-09-26 07:28:41',860,1);
/*!40000 ALTER TABLE `log_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_info`
--

DROP TABLE IF EXISTS `log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` bigint(20) DEFAULT NULL COMMENT 'Server Address',
  `remote_addr` bigint(20) DEFAULT NULL COMMENT 'Remote Address',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_info`
--

LOCK TABLES `log_visitor_info` WRITE;
/*!40000 ALTER TABLE `log_visitor_info` DISABLE KEYS */;
INSERT INTO `log_visitor_info` VALUES (1,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(2,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0),(3,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0),(4,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(5,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',2130706433,2130706433),(6,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',2130706433,2130706433),(7,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(8,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',2130706433,2130706433),(9,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0),(10,'http://localhost/magento/index.php/ae-aeoe-e-se.html','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0),(11,'http://localhost/magento/index.php/checkout/cart/','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0),(12,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(13,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(14,'http://localhost/magento/index.php','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(15,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(16,'http://localhost/magento/index.php/aeoe-ae-a-a/samsung-n7100-galaxy-note2-16g-3g-gsm-wcdma.html','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1',NULL,'zh-cn',0,0),(17,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36',NULL,'zh-CN,zh;q=0.8',0,0);
/*!40000 ALTER TABLE `log_visitor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_visitor_online`
--

DROP TABLE IF EXISTS `log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` bigint(20) NOT NULL COMMENT 'Remote Address',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL',
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_visitor_online`
--

LOCK TABLES `log_visitor_online` WRITE;
/*!40000 ALTER TABLE `log_visitor_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_visitor_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `FK_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_problem`
--

LOCK TABLES `newsletter_problem` WRITE;
/*!40000 ALTER TABLE `newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `FK_NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue`
--

LOCK TABLES `newsletter_queue` WRITE;
/*!40000 ALTER TABLE `newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID` (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_link`
--

LOCK TABLES `newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `IDX_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_queue_store_link`
--

LOCK TABLES `newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscriber`
--

LOCK TABLES `newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_text_preprocessed` text COMMENT 'Template Text Preprocessed',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `IDX_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `IDX_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_template`
--

LOCK TABLES `newsletter_template` WRITE;
/*!40000 ALTER TABLE `newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `IDX_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `IDX_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  UNIQUE KEY `UNQ_OAUTH_NONCE_NONCE` (`nonce`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='oauth_nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `IDX_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token`
--

LOCK TABLES `oauth_token` WRITE;
/*!40000 ALTER TABLE `oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_cert`
--

DROP TABLE IF EXISTS `paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `IDX_PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_PAYPAL_CERT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_cert`
--

LOCK TABLES `paypal_cert` WRITE;
/*!40000 ALTER TABLE `paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_transaction`
--

DROP TABLE IF EXISTS `paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_transaction`
--

LOCK TABLES `paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report`
--

DROP TABLE IF EXISTS `paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `UNQ_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report`
--

LOCK TABLES `paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT '' COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  PRIMARY KEY (`row_id`),
  KEY `IDX_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_settlement_report_row`
--

LOCK TABLES `paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_session`
--

DROP TABLE IF EXISTS `persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_PERSISTENT_SESSION_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_session`
--

LOCK TABLES `persistent_session` WRITE;
/*!40000 ALTER TABLE `persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Poll Id',
  `poll_title` varchar(255) DEFAULT NULL COMMENT 'Poll title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date posted',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `closed` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is closed',
  `answers_display` smallint(6) DEFAULT NULL COMMENT 'Answers display',
  PRIMARY KEY (`poll_id`),
  KEY `IDX_POLL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Poll';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` VALUES (1,'What is your favorite color',7,0,'2013-09-21 14:43:16',NULL,1,0,NULL);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answer`
--

DROP TABLE IF EXISTS `poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Answer Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `answer_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Answers display',
  PRIMARY KEY (`answer_id`),
  KEY `IDX_POLL_ANSWER_POLL_ID` (`poll_id`),
  CONSTRAINT `FK_POLL_ANSWER_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Poll Answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answer`
--

LOCK TABLES `poll_answer` WRITE;
/*!40000 ALTER TABLE `poll_answer` DISABLE KEYS */;
INSERT INTO `poll_answer` VALUES (1,1,'Green',4,0),(2,1,'Red',1,0),(3,1,'Black',0,0),(4,1,'Magenta',2,0);
/*!40000 ALTER TABLE `poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_store`
--

DROP TABLE IF EXISTS `poll_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `IDX_POLL_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_POLL_STORE_POLL_ID_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_POLL_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_store`
--

LOCK TABLES `poll_store` WRITE;
/*!40000 ALTER TABLE `poll_store` DISABLE KEYS */;
INSERT INTO `poll_store` VALUES (1,1);
/*!40000 ALTER TABLE `poll_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_vote`
--

DROP TABLE IF EXISTS `poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll answer id',
  `ip_address` bigint(20) DEFAULT NULL COMMENT 'Poll answer id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer id',
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_POLL_VOTE_POLL_ANSWER_ID` (`poll_answer_id`),
  CONSTRAINT `FK_POLL_VOTE_POLL_ANSWER_ID_POLL_ANSWER_ANSWER_ID` FOREIGN KEY (`poll_answer_id`) REFERENCES `poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Vote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_vote`
--

LOCK TABLES `poll_vote` WRITE;
/*!40000 ALTER TABLE `poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_price`
--

LOCK TABLES `product_alert_price` WRITE;
/*!40000 ALTER TABLE `product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_alert_stock`
--

LOCK TABLES `product_alert_stock` WRITE;
/*!40000 ALTER TABLE `product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Frontend',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `UNQ_RATING_RATING_CODE` (`rating_code`),
  KEY `IDX_RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,'Quality',0),(2,1,'Value',0),(3,1,'Price',0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_entity`
--

LOCK TABLES `rating_entity` WRITE;
/*!40000 ALTER TABLE `rating_entity` DISABLE KEYS */;
INSERT INTO `rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on frontend',
  PRIMARY KEY (`option_id`),
  KEY `IDX_RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `FK_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option`
--

LOCK TABLES `rating_option` WRITE;
/*!40000 ALTER TABLE `rating_option` DISABLE KEYS */;
INSERT INTO `rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote`
--

LOCK TABLES `rating_option_vote` WRITE;
/*!40000 ALTER TABLE `rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_option_vote_aggregated`
--

LOCK TABLES `rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_RATING_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_store`
--

LOCK TABLES `rating_store` WRITE;
/*!40000 ALTER TABLE `rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RATING_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_title`
--

LOCK TABLES `rating_title` WRITE;
/*!40000 ALTER TABLE `rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_compared_product_index`
--

LOCK TABLES `report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `IDX_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `IDX_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `IDX_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `IDX_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `IDX_REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_EVENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event`
--

LOCK TABLES `report_event` WRITE;
/*!40000 ALTER TABLE `report_event` DISABLE KEYS */;
INSERT INTO `report_event` VALUES (1,'2013-09-21 07:19:30',1,2,1,1,1),(2,'2013-09-21 07:19:59',1,2,1,1,1),(3,'2013-09-21 07:20:56',1,2,1,1,1),(4,'2013-09-21 07:25:46',1,2,1,1,1),(5,'2013-09-24 07:34:43',1,1,10,1,1),(6,'2013-09-26 05:10:16',1,1,15,1,1),(7,'2013-09-26 06:48:36',1,2,16,1,1),(8,'2013-09-26 07:01:52',1,4,17,1,1);
/*!40000 ALTER TABLE `report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_event_types`
--

LOCK TABLES `report_event_types` WRITE;
/*!40000 ALTER TABLE `report_event_types` DISABLE KEYS */;
INSERT INTO `report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_daily`
--

LOCK TABLES `report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_monthly`
--

LOCK TABLES `report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_aggregated_yearly`
--

LOCK TABLES `report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_viewed_product_index`
--

LOCK TABLES `report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `report_viewed_product_index` DISABLE KEYS */;
INSERT INTO `report_viewed_product_index` VALUES (1,1,NULL,2,1,'2013-09-21 07:25:46'),(2,10,NULL,1,1,'2013-09-24 07:34:43'),(3,15,NULL,1,1,'2013-09-26 05:10:16'),(4,16,NULL,2,1,'2013-09-26 06:48:36'),(5,17,NULL,4,1,'2013-09-26 07:01:52');
/*!40000 ALTER TABLE `report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `IDX_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `IDX_REVIEW_STATUS_ID` (`status_id`),
  KEY `IDX_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `FK_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `IDX_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `IDX_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `IDX_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_DETAIL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_detail`
--

LOCK TABLES `review_detail` WRITE;
/*!40000 ALTER TABLE `review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity`
--

LOCK TABLES `review_entity` WRITE;
/*!40000 ALTER TABLE `review_entity` DISABLE KEYS */;
INSERT INTO `review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_entity_summary`
--

LOCK TABLES `review_entity_summary` WRITE;
/*!40000 ALTER TABLE `review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_status`
--

LOCK TABLES `review_status` WRITE;
/*!40000 ALTER TABLE `review_status` DISABLE KEYS */;
INSERT INTO `review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `IDX_REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REVIEW_STORE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_store`
--

LOCK TABLES `review_store` WRITE;
/*!40000 ALTER TABLE `review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_daily`
--

LOCK TABLES `sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement`
--

DROP TABLE IF EXISTS `sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_BILLING_AGREEMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement`
--

LOCK TABLES `sales_billing_agreement` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `IDX_SALES_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_AGRT_ID_SALES_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_BILLING_AGRT_ORDER_ORDER_ID_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_billing_agreement_order`
--

LOCK TABLES `sales_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `sales_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_STATE` (`state`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo`
--

LOCK TABLES `sales_flat_creditmemo` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_B0FCB0B5467075BE63D474F2CD5F7804` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_comment`
--

LOCK TABLES `sales_flat_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_STATE` (`state`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_78C711B225167A11CC077B03D1C8E1CC` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_CREDITMEMO_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_grid`
--

LOCK TABLES `sales_flat_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_306DAC836C699F0B5E13BE486557AC8A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_creditmemo_item`
--

LOCK TABLES `sales_flat_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice`
--

DROP TABLE IF EXISTS `sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_INVOICE_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_INVOICE_STATE` (`state`),
  KEY `IDX_SALES_FLAT_INVOICE_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice`
--

LOCK TABLES `sales_flat_invoice` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_5C4B36BBE5231A76AB8018B281ED50BC` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_comment`
--

LOCK TABLES `sales_flat_invoice_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_STATE` (`state`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_ENTT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_INVOICE_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_grid`
--

LOCK TABLES `sales_flat_invoice_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_INVOICE_ITEM_PARENT_ID_SALES_FLAT_INVOICE_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_invoice_item`
--

LOCK TABLES `sales_flat_invoice_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order`
--

DROP TABLE IF EXISTS `sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_ORDER_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS` (`status`),
  KEY `IDX_SALES_FLAT_ORDER_STATE` (`state`),
  KEY `IDX_SALES_FLAT_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_ORDER_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_FLAT_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_SALES_FLAT_ORDER_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_FLAT_ORDER_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order`
--

LOCK TABLES `sales_flat_order` WRITE;
/*!40000 ALTER TABLE `sales_flat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_address`
--

DROP TABLE IF EXISTS `sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ADDRESS_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_address`
--

LOCK TABLES `sales_flat_order_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_grid`
--

DROP TABLE IF EXISTS `sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_STATUS` (`status`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_FLAT_ORDER_GRID_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_ENTITY_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_grid`
--

LOCK TABLES `sales_flat_order_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_item`
--

DROP TABLE IF EXISTS `sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_FLAT_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_ORDER_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_item`
--

LOCK TABLES `sales_flat_order_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_payment`
--

DROP TABLE IF EXISTS `sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `paybox_request_number` varchar(255) DEFAULT NULL COMMENT 'Paybox Request Number',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_SALES_FLAT_ORDER_PAYMENT_PARENT_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_payment`
--

LOCK TABLES `sales_flat_order_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_FLAT_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_CE7C71E74CB74DDACED337CEE6753D5E` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_order_status_history`
--

LOCK TABLES `sales_flat_order_status_history` WRITE;
/*!40000 ALTER TABLE `sales_flat_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote`
--

DROP TABLE IF EXISTS `sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `IDX_SALES_FLAT_QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote`
--

LOCK TABLES `sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote` DISABLE KEYS */;
INSERT INTO `sales_flat_quote` VALUES (1,1,'2013-09-24 05:56:59','2013-09-24 05:56:59',NULL,1,0,0,0,0.0000,0,1.0000,1.0000,'CNY','CNY','CNY',0.0000,0.0000,NULL,1,3,1,'tedi3231@gmail.com',NULL,'chunyan',NULL,'pan',NULL,NULL,NULL,1,0,'::1',NULL,NULL,NULL,NULL,'CNY',1.0000,1.0000,NULL,NULL,0.0000,0.0000,0.0000,0.0000,1,0,NULL,NULL,0);
/*!40000 ALTER TABLE `sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address`
--

DROP TABLE IF EXISTS `sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address`
--

LOCK TABLES `sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address` DISABLE KEYS */;
INSERT INTO `sales_flat_quote_address` VALUES (1,1,'2013-09-24 05:56:59','2013-09-24 05:56:59',1,0,NULL,'billing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,'a:0:{}',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'2013-09-24 05:56:59','2013-09-24 05:56:59',1,0,NULL,'shipping',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,'a:0:{}',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  CONSTRAINT `FK_2EF8E28181D666D94D4E30DC2B0F80BF` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_A345FC758F20C314169CE27DCE53477F` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_B521389746C00700D1B2B76EBBE53854` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_address_item`
--

LOCK TABLES `sales_flat_quote_address_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item`
--

DROP TABLE IF EXISTS `sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_B201DEB5DE51B791AF5C5BF87053C5A7` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_QUOTE_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item`
--

LOCK TABLES `sales_flat_quote_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `IDX_SALES_FLAT_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_5F20E478CA64B6891EA8A9D6C2735739` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_item_option`
--

LOCK TABLES `sales_flat_quote_item_option` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `IDX_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `FK_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID_SALES_FLAT_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_payment`
--

LOCK TABLES `sales_flat_quote_payment` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `IDX_SALES_FLAT_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `FK_B1F177EFB73D3EDF5322BA64AC48D150` FOREIGN KEY (`address_id`) REFERENCES `sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_quote_shipping_rate`
--

LOCK TABLES `sales_flat_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment`
--

DROP TABLE IF EXISTS `sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_FLAT_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment`
--

LOCK TABLES `sales_flat_shipment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_C2D69CC1FB03D2B2B794B0439F6650CF` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_comment`
--

LOCK TABLES `sales_flat_shipment_comment` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_FLAT_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_FLAT_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_ENTT_ID_SALES_FLAT_SHIPMENT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_FLAT_SHIPMENT_GRID_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_grid`
--

LOCK TABLES `sales_flat_shipment_grid` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_3AECE5007D18F159231B87E8306FC02A` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_item`
--

LOCK TABLES `sales_flat_shipment_item` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_FLAT_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_BCD2FA28717D29F37E10A153E6F2F841` FOREIGN KEY (`parent_id`) REFERENCES `sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_flat_shipment_track`
--

LOCK TABLES `sales_flat_shipment_track` WRITE;
/*!40000 ALTER TABLE `sales_flat_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_flat_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated`
--

LOCK TABLES `sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_invoiced_aggregated_order`
--

LOCK TABLES `sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_created`
--

LOCK TABLES `sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_aggregated_updated`
--

LOCK TABLES `sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status`
--

LOCK TABLES `sales_order_status` WRITE;
/*!40000 ALTER TABLE `sales_order_status` DISABLE KEYS */;
INSERT INTO `sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `IDX_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_label`
--

LOCK TABLES `sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `FK_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_status_state`
--

LOCK TABLES `sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `sales_order_status_state` DISABLE KEYS */;
INSERT INTO `sales_order_status_state` VALUES ('canceled','canceled',1),('closed','closed',1),('complete','complete',1),('fraud','payment_review',0),('holded','holded',1),('payment_review','payment_review',1),('pending','new',1),('pending_payment','pending_payment',1),('processing','processing',1);
/*!40000 ALTER TABLE `sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Hidden',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax`
--

LOCK TABLES `sales_order_tax` WRITE;
/*!40000 ALTER TABLE `sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_tax_item`
--

DROP TABLE IF EXISTS `sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `UNQ_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `IDX_SALES_ORDER_TAX_ITEM_TAX_ID` (`tax_id`),
  KEY `IDX_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_FLAT_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_tax_item`
--

LOCK TABLES `sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DA51A10B2405B64A4DAEF77A64F0DAAD` FOREIGN KEY (`payment_id`) REFERENCES `sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_FLAT_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_payment_transaction`
--

LOCK TABLES `sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile`
--

DROP TABLE IF EXISTS `sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `state` varchar(20) NOT NULL COMMENT 'State',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `reference_id` varchar(32) DEFAULT NULL COMMENT 'Reference Id',
  `subscriber_name` varchar(150) DEFAULT NULL COMMENT 'Subscriber Name',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Datetime',
  `internal_reference_id` varchar(42) NOT NULL COMMENT 'Internal Reference Id',
  `schedule_description` varchar(255) NOT NULL COMMENT 'Schedule Description',
  `suspension_threshold` smallint(5) unsigned DEFAULT NULL COMMENT 'Suspension Threshold',
  `bill_failed_later` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Bill Failed Later',
  `period_unit` varchar(20) NOT NULL COMMENT 'Period Unit',
  `period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Frequency',
  `period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Max Cycles',
  `billing_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Billing Amount',
  `trial_period_unit` varchar(20) DEFAULT NULL COMMENT 'Trial Period Unit',
  `trial_period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Frequency',
  `trial_period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Max Cycles',
  `trial_billing_amount` text COMMENT 'Trial Billing Amount',
  `currency_code` varchar(3) NOT NULL COMMENT 'Currency Code',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `init_amount` decimal(12,4) DEFAULT NULL COMMENT 'Init Amount',
  `init_may_fail` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Init May Fail',
  `order_info` text NOT NULL COMMENT 'Order Info',
  `order_item_info` text NOT NULL COMMENT 'Order Item Info',
  `billing_address_info` text NOT NULL COMMENT 'Billing Address Info',
  `shipping_address_info` text COMMENT 'Shipping Address Info',
  `profile_vendor_info` text COMMENT 'Profile Vendor Info',
  `additional_info` text COMMENT 'Additional Info',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_INTERNAL_REFERENCE_ID` (`internal_reference_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_RECURRING_PROFILE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_SALES_RECURRING_PROFILE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile`
--

LOCK TABLES `sales_recurring_profile` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_SALES_RECURRING_PROFILE_ORDER_PROFILE_ID_ORDER_ID` (`profile_id`,`order_id`),
  KEY `IDX_SALES_RECURRING_PROFILE_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `FK_7FF85741C66DCD37A4FBE3E3255A5A01` FOREIGN KEY (`order_id`) REFERENCES `sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_B8A7A5397B67455786E55461748C59F4` FOREIGN KEY (`profile_id`) REFERENCES `sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_recurring_profile_order`
--

LOCK TABLES `sales_recurring_profile_order` WRITE;
/*!40000 ALTER TABLE `sales_recurring_profile_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_recurring_profile_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated`
--

LOCK TABLES `sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refunded_aggregated_order`
--

LOCK TABLES `sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated`
--

LOCK TABLES `sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_shipping_aggregated_order`
--

LOCK TABLES `sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL COMMENT 'Discount Step',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Coupon',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule`
--

LOCK TABLES `salesrule` WRITE;
/*!40000 ALTER TABLE `salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `IDX_SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon`
--

LOCK TABLES `salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `IDX_SALESRULE_COUPON_USAGE_COUPON_ID` (`coupon_id`),
  KEY `IDX_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_coupon_usage`
--

LOCK TABLES `salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer`
--

LOCK TABLES `salesrule_customer` WRITE;
/*!40000 ALTER TABLE `salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_customer_group`
--

DROP TABLE IF EXISTS `salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_SALESRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_customer_group`
--

LOCK TABLES `salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `UNQ_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `IDX_SALESRULE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_SALESRULE_LABEL_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_LABEL_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_label`
--

LOCK TABLES `salesrule_label` WRITE;
/*!40000 ALTER TABLE `salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_SALESRULE_PRD_ATTR_WS_ID_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_product_attribute`
--

LOCK TABLES `salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesrule_website`
--

DROP TABLE IF EXISTS `salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_SALESRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SALESRULE_WEBSITE_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesrule_website`
--

LOCK TABLES `salesrule_website` WRITE;
/*!40000 ALTER TABLE `salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_SENDFRIEND_LOG_IP` (`ip`),
  KEY `IDX_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendfriend_log`
--

LOCK TABLES `sendfriend_log` WRITE;
/*!40000 ALTER TABLE `sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_tablerate`
--

LOCK TABLES `shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `IDX_SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `FK_SITEMAP_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap`
--

LOCK TABLES `sitemap` WRITE;
/*!40000 ALTER TABLE `sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `first_customer_id` int(10) unsigned DEFAULT NULL COMMENT 'First Customer Id',
  `first_store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'First Store Id',
  PRIMARY KEY (`tag_id`),
  KEY `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`first_customer_id`),
  KEY `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` (`first_store_id`),
  CONSTRAINT `FK_TAG_FIRST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`first_customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_TAG_FIRST_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`first_store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_properties`
--

DROP TABLE IF EXISTS `tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_properties` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_TAG_PROPERTIES_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAG_PROPERTIES_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_PROPERTIES_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Properties';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_properties`
--

LOCK TABLES `tag_properties` WRITE;
/*!40000 ALTER TABLE `tag_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_relation`
--

DROP TABLE IF EXISTS `tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_relation` (
  `tag_relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Relation Id',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Store Id',
  `active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`tag_relation_id`),
  UNIQUE KEY `UNQ_TAG_RELATION_TAG_ID_CUSTOMER_ID_PRODUCT_ID_STORE_ID` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_TAG_RELATION_PRODUCT_ID` (`product_id`),
  KEY `IDX_TAG_RELATION_TAG_ID` (`tag_id`),
  KEY `IDX_TAG_RELATION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_TAG_RELATION_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAG_RELATION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_RELATION_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_relation`
--

LOCK TABLES `tag_relation` WRITE;
/*!40000 ALTER TABLE `tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `customers` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customers',
  `products` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Products',
  `uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Uses',
  `historical_uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Historical Uses',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_TAG_SUMMARY_STORE_ID` (`store_id`),
  KEY `IDX_TAG_SUMMARY_TAG_ID` (`tag_id`),
  CONSTRAINT `FK_TAG_SUMMARY_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAG_SUMMARY_TAG_ID_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Summary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `IDX_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `IDX_TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation`
--

LOCK TABLES `tax_calculation` WRITE;
/*!40000 ALTER TABLE `tax_calculation` DISABLE KEYS */;
INSERT INTO `tax_calculation` VALUES (1,1,1,3,2),(2,2,1,3,2);
/*!40000 ALTER TABLE `tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate`
--

LOCK TABLES `tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rate_title`
--

LOCK TABLES `tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALC_RULE_PRIORITY_POSITION_TAX_CALC_RULE_ID` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_calculation_rule`
--

LOCK TABLES `tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `tax_calculation_rule` DISABLE KEYS */;
INSERT INTO `tax_calculation_rule` VALUES (1,'Retail Customer-Taxable Goods-Rate 1',1,1);
/*!40000 ALTER TABLE `tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Shipping','PRODUCT');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `FCA5E2C02689EB2641B30580D7AACF12` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_created`
--

LOCK TABLES `tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DB0AF14011199AA6CD31D5078B90AA8D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_order_aggregated_updated`
--

LOCK TABLES `tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tm_core_module`
--

DROP TABLE IF EXISTS `tm_core_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_core_module` (
  `code` varchar(50) NOT NULL COMMENT 'Code',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data_version',
  `identity_key` text,
  `store_ids` varchar(64) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tm_core_module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_core_module`
--

LOCK TABLES `tm_core_module` WRITE;
/*!40000 ALTER TABLE `tm_core_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `tm_core_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_discount`
--

DROP TABLE IF EXISTS `weee_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  KEY `IDX_WEEE_DISCOUNT_WEBSITE_ID` (`website_id`),
  KEY `IDX_WEEE_DISCOUNT_ENTITY_ID` (`entity_id`),
  KEY `IDX_WEEE_DISCOUNT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_WEEE_DISCOUNT_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_DISCOUNT_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_DISCOUNT_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Discount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_discount`
--

LOCK TABLES `weee_discount` WRITE;
/*!40000 ALTER TABLE `weee_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`value_id`),
  KEY `IDX_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `IDX_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `IDX_WEEE_TAX_COUNTRY` (`country`),
  KEY `IDX_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WEEE_TAX_WEBSITE_ID_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weee_tax`
--

LOCK TABLES `weee_tax` WRITE;
/*!40000 ALTER TABLE `weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `IDX_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--

LOCK TABLES `widget` WRITE;
/*!40000 ALTER TABLE `widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `package_theme` varchar(255) DEFAULT NULL COMMENT 'Package Theme',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance`
--

LOCK TABLES `widget_instance` WRITE;
/*!40000 ALTER TABLE `widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Block Reference',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page`
--

LOCK TABLES `widget_instance_page` WRITE;
/*!40000 ALTER TABLE `widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `UNQ_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_0A5D06DCEC6A6845F50E5FAAC5A1C96D` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_LYT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget_instance_page_layout`
--

LOCK TABLES `widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_WISHLIST_SHARED` (`shared`),
  CONSTRAINT `FK_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1,0,'447a1f45cc6779b22db956626d6dc1d0','2013-09-24 05:57:54');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `IDX_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item`
--

LOCK TABLES `wishlist_item` WRITE;
/*!40000 ALTER TABLE `wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_item_option`
--

LOCK TABLES `wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlconnect_application`
--

DROP TABLE IF EXISTS `xmlconnect_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_application` (
  `application_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Application Id',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code',
  `type` varchar(32) NOT NULL COMMENT 'Device Type',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `active_from` date DEFAULT NULL COMMENT 'Active From',
  `active_to` date DEFAULT NULL COMMENT 'Active To',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  `browsing_mode` smallint(5) unsigned DEFAULT '0' COMMENT 'Browsing Mode',
  PRIMARY KEY (`application_id`),
  UNIQUE KEY `UNQ_XMLCONNECT_APPLICATION_CODE` (`code`),
  KEY `FK_XMLCONNECT_APPLICATION_STORE_ID_CORE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_XMLCONNECT_APPLICATION_STORE_ID_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `core_store` (`store_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlconnect_application`
--

LOCK TABLES `xmlconnect_application` WRITE;
/*!40000 ALTER TABLE `xmlconnect_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlconnect_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlconnect_config_data`
--

DROP TABLE IF EXISTS `xmlconnect_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_config_data` (
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  `category` varchar(60) NOT NULL DEFAULT 'default' COMMENT 'Category',
  `path` varchar(250) NOT NULL COMMENT 'Path',
  `value` text NOT NULL COMMENT 'Value',
  UNIQUE KEY `UNQ_XMLCONNECT_CONFIG_DATA_APPLICATION_ID_CATEGORY_PATH` (`application_id`,`category`,`path`),
  CONSTRAINT `FK_31EE36D814216200D7C0723145AC510E` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Configuration Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlconnect_config_data`
--

LOCK TABLES `xmlconnect_config_data` WRITE;
/*!40000 ALTER TABLE `xmlconnect_config_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlconnect_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlconnect_history`
--

DROP TABLE IF EXISTS `xmlconnect_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `params` blob COMMENT 'Params',
  `title` varchar(200) NOT NULL COMMENT 'Title',
  `activation_key` varchar(255) NOT NULL COMMENT 'Activation Key',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code',
  PRIMARY KEY (`history_id`),
  KEY `FK_8F08B9513373BC19F49EE3EF8340E270` (`application_id`),
  CONSTRAINT `FK_8F08B9513373BC19F49EE3EF8340E270` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlconnect_history`
--

LOCK TABLES `xmlconnect_history` WRITE;
/*!40000 ALTER TABLE `xmlconnect_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlconnect_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlconnect_notification_template`
--

DROP TABLE IF EXISTS `xmlconnect_notification_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_notification_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `name` varchar(255) NOT NULL COMMENT 'Template Name',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) NOT NULL COMMENT 'Message Title',
  `content` text NOT NULL COMMENT 'Message Content',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `application_id` smallint(5) unsigned NOT NULL COMMENT 'Application Id',
  PRIMARY KEY (`template_id`),
  KEY `FK_F9927C7518A907CF5C350942FD296DC3` (`application_id`),
  CONSTRAINT `FK_F9927C7518A907CF5C350942FD296DC3` FOREIGN KEY (`application_id`) REFERENCES `xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlconnect_notification_template`
--

LOCK TABLES `xmlconnect_notification_template` WRITE;
/*!40000 ALTER TABLE `xmlconnect_notification_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlconnect_notification_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xmlconnect_queue`
--

DROP TABLE IF EXISTS `xmlconnect_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmlconnect_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `exec_time` timestamp NULL DEFAULT NULL COMMENT 'Scheduled Execution Time',
  `template_id` int(10) unsigned NOT NULL COMMENT 'Template Id',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) DEFAULT '' COMMENT 'Message Title',
  `content` text COMMENT 'Message Content',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  `type` varchar(12) NOT NULL COMMENT 'Type of Notification',
  PRIMARY KEY (`queue_id`),
  KEY `FK_2019AEC5FC55A516965583447CA26B14` (`template_id`),
  CONSTRAINT `FK_2019AEC5FC55A516965583447CA26B14` FOREIGN KEY (`template_id`) REFERENCES `xmlconnect_notification_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xmlconnect_queue`
--

LOCK TABLES `xmlconnect_queue` WRITE;
/*!40000 ALTER TABLE `xmlconnect_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xmlconnect_queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-27  0:10:16
