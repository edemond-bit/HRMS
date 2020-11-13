-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hrms
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `access_control_list`
--

DROP TABLE IF EXISTS `access_control_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_control_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `access_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_control_list`
--

LOCK TABLES `access_control_list` WRITE;
/*!40000 ALTER TABLE `access_control_list` DISABLE KEYS */;
INSERT INTO `access_control_list` VALUES (1001,'System','Active',0,'2020-09-19 18:09:15',NULL,NULL,0),(1002,'HR-Admin','Active',0,'2020-09-19 18:09:15',NULL,NULL,0),(1003,'Employee','Active',1002,'2020-09-19 21:28:32',NULL,'2020-09-19 21:58:32',0);
/*!40000 ALTER TABLE `access_control_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ifsc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_info`
--

LOCK TABLES `bank_info` WRITE;
/*!40000 ALTER TABLE `bank_info` DISABLE KEYS */;
INSERT INTO `bank_info` VALUES (1,'SBI','SBIN000043','Cossipore, Dunlop, Kolkata 7000108',1002,'2020-09-19 12:00:42',1002,'2020-09-19 12:20:34',0),(2,'AXIS','AXIS000564','SaltLake, Rajarhat. Kolkata-7000156',1002,'2020-09-19 12:08:19',NULL,'2020-09-19 12:38:19',0),(3,'ICICI','ICICI002304','Chinsurah, RathTala, Hooghly, West Bengal',1002,'2020-09-19 12:08:19',1002,'2020-09-19 12:20:34',0),(4,'Bandhan','BDN09982','Kaliagarh, Jirat, Balagarh, Hooghly-712501',1002,'2020-09-19 12:08:19',NULL,'2020-09-19 12:38:19',0),(5,'SBI','SBIN000234','Chandannagar, Hooghly, West Bengal',1002,'2020-09-19 12:13:02',1002,'2020-09-19 12:20:34',0);
/*!40000 ALTER TABLE `bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK` (`created_by`) USING BTREE,
  CONSTRAINT `CREATED_BY_FK_copy` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'AAA','aaaaaaaaaa',1002,'2020-10-22 20:38:39',NULL,'2020-10-22 21:08:39',0),(2,'BBB','bbbbbbbb',1002,'2020-10-22 20:38:39',NULL,'2020-10-22 21:08:39',0),(3,'SSS','sssss',1002,'2020-10-22 20:39:56',NULL,'2020-10-22 21:09:56',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_attendance`
--

DROP TABLE IF EXISTS `emp_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_attendance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int unsigned NOT NULL,
  `attendance_day` int unsigned NOT NULL,
  `attendance_year` int unsigned NOT NULL,
  `attendance_month` int unsigned NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `logout_date` datetime DEFAULT NULL,
  `working_minutes` int unsigned DEFAULT NULL,
  `shift_id` int unsigned NOT NULL DEFAULT '0',
  `login_attendance` enum('Normal','Late','Absent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attendance_status` enum('FD:Pending','HD:Pending','Full-Day','Half-Day','Absent','OT','Leave','Off-Day') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMP_FK2` (`emp_id`),
  CONSTRAINT `emp_attendance_FK` FOREIGN KEY (`emp_id`) REFERENCES `emp_profile` (`profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_attendance`
--

LOCK TABLES `emp_attendance` WRITE;
/*!40000 ALTER TABLE `emp_attendance` DISABLE KEYS */;
INSERT INTO `emp_attendance` VALUES (1,1,1,2020,11,'2020-11-01 17:30:00','2020-11-01 17:30:22',0,8,'Absent','Absent'),(2,1,1,2020,11,'2020-11-01 19:24:22','2020-11-01 19:24:50',0,8,'Late','Full-Day'),(3,1,1,2020,11,'2020-11-01 19:59:58','2020-11-01 20:00:27',0,8,'Normal','Half-Day'),(5,1,2,2020,11,'2020-11-02 10:50:52','2020-11-02 10:50:55',0,3,'Late','OT'),(6,1,2,2020,11,'2020-11-02 10:50:58','2020-11-02 10:51:00',0,3,'Late','OT'),(36,1,6,2020,11,'2020-11-06 20:18:17','2020-11-06 20:18:29',0,8,'Normal','OT'),(37,1,6,2020,11,'2020-11-06 20:18:32','2020-11-06 20:18:41',0,8,'Normal','Full-Day'),(39,1,10,2020,11,'2020-11-10 12:39:13','2020-11-10 12:39:16',0,3,'Late','Full-Day'),(40,32,13,2020,11,'2020-11-13 11:03:44','2020-11-13 11:03:47',0,3,'Normal','Full-Day');
/*!40000 ALTER TABLE `emp_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_designation`
--

DROP TABLE IF EXISTS `emp_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_designation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `emp_type_id` int unsigned NOT NULL,
  `shift_type_id` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `EMP_TYPE_FK` (`emp_type_id`),
  KEY `SHIFT_TYPE_FK2` (`shift_type_id`),
  KEY `CREATED_BY_FK5` (`created_by`),
  CONSTRAINT `CREATED_BY_FK5` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `EMP_TYPE_FK` FOREIGN KEY (`emp_type_id`) REFERENCES `emp_types` (`id`),
  CONSTRAINT `SHIFT_TYPE_FK2` FOREIGN KEY (`shift_type_id`) REFERENCES `shift_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_designation`
--

LOCK TABLES `emp_designation` WRITE;
/*!40000 ALTER TABLE `emp_designation` DISABLE KEYS */;
INSERT INTO `emp_designation` VALUES (1,'Permanent RMO',1,4,1002,'2020-09-01 12:43:23',NULL,'2020-09-18 18:06:29',0),(2,'Permanent Fixed',1,1,1002,'2020-09-01 12:43:23',NULL,'2020-09-18 17:49:35',0),(3,'Permanent Flexible',1,2,1002,'2020-09-01 12:43:23',NULL,'2020-09-18 18:04:27',0),(4,'Permanent General',1,3,1002,'2020-09-01 12:43:23',NULL,'2020-10-27 17:58:49',4),(5,'Casual Fixed',2,1,1002,'2020-09-01 12:43:23',NULL,'2020-09-18 18:02:49',0),(6,'Casual Flexible',2,2,1002,'2020-09-01 12:43:23',NULL,NULL,0),(7,'Casual General',2,38,1002,'2020-09-01 12:43:23',1002,'2020-09-20 22:52:32',0);
/*!40000 ALTER TABLE `emp_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_leave`
--

DROP TABLE IF EXISTS `emp_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_leave` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int unsigned NOT NULL,
  `leave_class_id` int unsigned NOT NULL,
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_status` enum('Pending','Denied','Accepted','Withdraw') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prev_leave_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EMP_FK` (`emp_id`),
  KEY `LEAVE_CLASS_FK` (`leave_class_id`),
  KEY `CREATED_BY_FK11` (`created_by`),
  CONSTRAINT `CREATED_BY_FK11` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `LEAVE_CLASS_FK` FOREIGN KEY (`leave_class_id`) REFERENCES `leave_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_leave`
--

LOCK TABLES `emp_leave` WRITE;
/*!40000 ALTER TABLE `emp_leave` DISABLE KEYS */;
INSERT INTO `emp_leave` VALUES (7,1,2,'hgfgfgh5676','2020-11-03','2020-11-05','Accepted','Accepted',1002,'2020-11-10 10:01:01',1002,'2020-11-10 10:01:11'),(8,32,2,'fgdfdgf56465','2020-11-10','2020-11-11','Accepted','Accepted',1003,'2020-11-13 11:10:59',1003,'2020-11-13 11:34:24');
/*!40000 ALTER TABLE `emp_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_payroll`
--

DROP TABLE IF EXISTS `emp_payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_payroll` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `issue_date` datetime NOT NULL,
  `year` int unsigned NOT NULL,
  `month` int unsigned NOT NULL,
  `emp_id` int unsigned NOT NULL,
  `attendance_count` int unsigned NOT NULL,
  `leave_count` int unsigned NOT NULL,
  `off_day_count` int unsigned NOT NULL,
  `ot_count` int unsigned NOT NULL,
  `absent_count` int unsigned NOT NULL,
  `days_worked` int unsigned DEFAULT '0',
  `basic` double unsigned DEFAULT NULL,
  `hra` double unsigned DEFAULT NULL,
  `conveyance` double unsigned DEFAULT NULL,
  `ot_encashment` double DEFAULT '0',
  `leave_encashment` double DEFAULT '0',
  `tot_earning` double DEFAULT '0',
  `ptax_deduction` double unsigned DEFAULT NULL,
  `esi_deduction` double unsigned DEFAULT NULL,
  `pf_deduction` double unsigned DEFAULT NULL,
  `tds_deduction` double unsigned DEFAULT NULL,
  `medicine_due` double unsigned DEFAULT NULL,
  `food_charge` double unsigned DEFAULT NULL,
  `loan_due_deduction` double unsigned DEFAULT NULL,
  `other_deduction` double unsigned DEFAULT NULL,
  `tot_deduction` double DEFAULT '0',
  `net_amount_payable` double unsigned DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EMP_FK8` (`emp_id`),
  CONSTRAINT `emp_payroll_FK` FOREIGN KEY (`emp_id`) REFERENCES `emp_profile` (`profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_payroll`
--

LOCK TABLES `emp_payroll` WRITE;
/*!40000 ALTER TABLE `emp_payroll` DISABLE KEYS */;
INSERT INTO `emp_payroll` VALUES (132,'2020-11-13 13:28:25',2020,11,1,3,3,1,1,1,7,5633.33,1126.67,878.8,1000,10000,18638.8,1040,1300,780,260,0,0,5000,0,8380,10258.8,1002,'2020-11-13 13:28:26',NULL,'2020-11-13 13:58:26'),(133,'2020-11-13 13:28:25',2020,11,32,1,2,0,0,0,3,0,0,0,0,10000,10000,0,0,0,0,0,0,0,0,0,10000,1002,'2020-11-13 13:28:26',NULL,'2020-11-13 13:58:26');
/*!40000 ALTER TABLE `emp_payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_payroll_info`
--

DROP TABLE IF EXISTS `emp_payroll_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_payroll_info` (
  `id` int unsigned NOT NULL,
  `ctc` double unsigned DEFAULT '0',
  `hike_amt` double unsigned DEFAULT '0',
  `indiv_hike_amt` double unsigned DEFAULT '0',
  `loan_taken_amt` double unsigned DEFAULT '0',
  `loan_deducted_amt` double unsigned DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EMP_FK7` (`id`),
  KEY `CREATED_BY_FK7` (`created_by`),
  CONSTRAINT `CREATED_BY_FK7` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `EMP_FK7` FOREIGN KEY (`id`) REFERENCES `emp_profile` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_payroll_info`
--

LOCK TABLES `emp_payroll_info` WRITE;
/*!40000 ALTER TABLE `emp_payroll_info` DISABLE KEYS */;
INSERT INTO `emp_payroll_info` VALUES (1,50000,1000,1000,25000,5000,1002,'2020-10-22 16:18:03',1002,'2020-11-09 20:42:23'),(30,0,0,0,0,0,1002,'2020-10-28 20:23:11',NULL,'2020-10-28 20:53:11'),(32,0,0,0,0,0,1002,'2020-11-13 09:43:59',NULL,'2020-11-13 10:13:59');
/*!40000 ALTER TABLE `emp_payroll_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_profile`
--

DROP TABLE IF EXISTS `emp_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_profile` (
  `profile_id` int unsigned NOT NULL AUTO_INCREMENT,
  `access_level_id` int unsigned DEFAULT NULL,
  `emp_display_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int unsigned DEFAULT NULL,
  `designation_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` enum('','Male','Female','Transgender') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_verified` enum('','no','yes') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified` enum('','no','yes') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification_id` int unsigned DEFAULT NULL,
  `qualification_other` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification_docs` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `panNumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan_copy` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `voterId` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `voter_copy` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `aadharNumber` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `aadhar_copy` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `marital_status` enum('','Single','Married','Divorced') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_current` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `address_permanent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `gurdian_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gurdian_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `join_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `profile_image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `bank_info_id` int unsigned DEFAULT '0',
  `bank_account_no` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancel_cheque` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `pf_account_no` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` enum('Active','In-Active') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `emp_display_id` (`emp_display_id`),
  UNIQUE KEY `email` (`email`),
  KEY `DESIGNATION_FK` (`designation_id`),
  KEY `ACCESS_LEVEL_ID_FK` (`access_level_id`),
  KEY `CREATED_BY_FK3` (`created_by`),
  KEY `QUALIFICATION_ID_FK` (`qualification_id`),
  KEY `emp_profile_FK` (`department_id`),
  CONSTRAINT `ACCESS_LEVEL_ID_FK` FOREIGN KEY (`access_level_id`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `CREATED_BY_FK3` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `DESIGNATION_FK` FOREIGN KEY (`designation_id`) REFERENCES `emp_designation` (`id`),
  CONSTRAINT `emp_profile_FK` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `QUALIFICATION_ID_FK` FOREIGN KEY (`qualification_id`) REFERENCES `emp_qualification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_profile`
--

LOCK TABLES `emp_profile` WRITE;
/*!40000 ALTER TABLE `emp_profile` DISABLE KEYS */;
INSERT INTO `emp_profile` VALUES (1,1002,'EP20201001',2,4,'Stupid Moron','1982-04-30','Male','8972009638','yes','stupid6moron9@gmail.com','yes',1,'BCPL','DocsUpload\\EP20201001\\qualification_docs\\','AOPPM3583B','DocsUpload\\EP20201001\\pan_copy\\','','DocsUpload\\EP20201001\\voter_copy\\','','DocsUpload\\EP20201001\\aadhar_copy\\','Single','rtrtecxv cx4354  vcvcxv','rtrtecxv cx4354  vcvcxv','','','','','rtrtecxv cx4354  vcvcxv','2020-09-02 21:09:00',NULL,'2020-10-16 01:55:00',NULL,'DocsUpload\\EP20201001\\profile_image\\',4,'67665645345345','DocsUpload\\EP20201001\\cancel_cheque\\','96756',1001,'2020-09-02 11:00:02',1002,'2020-10-27 13:32:44','Active'),(30,1003,'EP20201003',3,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1002,'2020-10-28 20:23:11',NULL,'2020-10-28 20:53:11','Active'),(32,1003,'EP20201004',2,4,'Naroj Kumar','1980-10-22','Male','456345543','yes','subir@gmail.com','yes',3,'',NULL,'',NULL,'',NULL,'',NULL,'Married',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-11-11 09:43:00',NULL,'2020-11-12 09:43:00','2020-11-12 20:45:00',NULL,0,NULL,NULL,NULL,1002,'2020-11-13 09:43:59',1002,'2020-11-13 09:45:47','Active');
/*!40000 ALTER TABLE `emp_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_qualification`
--

DROP TABLE IF EXISTS `emp_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_qualification` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK15` (`created_by`),
  CONSTRAINT `CREATED_BY_FK15` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_qualification`
--

LOCK TABLES `emp_qualification` WRITE;
/*!40000 ALTER TABLE `emp_qualification` DISABLE KEYS */;
INSERT INTO `emp_qualification` VALUES (1,'MBBS','Medical',1002,'2020-09-02 02:24:00',NULL,NULL,0),(3,'BHMS','Medical',1002,'2020-09-18 19:50:42',NULL,'2020-09-18 20:20:42',0),(4,'Nurshing','Medical',1002,'2020-09-18 19:51:30',1002,'2020-09-18 19:53:55',0);
/*!40000 ALTER TABLE `emp_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_types`
--

DROP TABLE IF EXISTS `emp_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK2` (`created_by`),
  CONSTRAINT `CREATED_BY_FK2` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_types`
--

LOCK TABLES `emp_types` WRITE;
/*!40000 ALTER TABLE `emp_types` DISABLE KEYS */;
INSERT INTO `emp_types` VALUES (1,'Permanent',1002,'2020-09-01 13:07:16',NULL,'2020-09-18 13:57:15',4),(2,'Casual',1002,'2020-09-01 13:07:16',1002,'2020-09-18 13:56:50',3);
/*!40000 ALTER TABLE `emp_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleaveallotment`
--

DROP TABLE IF EXISTS `empleaveallotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleaveallotment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation_id` int unsigned DEFAULT NULL,
  `CL` int unsigned DEFAULT '0',
  `SL` int unsigned DEFAULT '0',
  `EL` int unsigned DEFAULT '0',
  `PL` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `empleaveallotment_FK` FOREIGN KEY (`id`) REFERENCES `emp_profile` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleaveallotment`
--

LOCK TABLES `empleaveallotment` WRITE;
/*!40000 ALTER TABLE `empleaveallotment` DISABLE KEYS */;
INSERT INTO `empleaveallotment` VALUES (1,4,9,15,10,10),(30,4,12,15,10,10),(32,4,10,15,10,10);
/*!40000 ALTER TABLE `empleaveallotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_schedule`
--

DROP TABLE IF EXISTS `leave_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_schedule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation_id` int unsigned DEFAULT NULL,
  `leave_type_id` int unsigned NOT NULL,
  `day_count` int unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `LEAVE_TYPE_FK2` (`leave_type_id`),
  KEY `CREATED_BY_FK10` (`created_by`),
  CONSTRAINT `CREATED_BY_FK10` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `LEAVE_TYPE_FK2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_schedule`
--

LOCK TABLES `leave_schedule` WRITE;
/*!40000 ALTER TABLE `leave_schedule` DISABLE KEYS */;
INSERT INTO `leave_schedule` VALUES (2,4,1,12,1002,'2020-09-01 13:17:16',1002,'2020-11-13 10:51:06',0),(3,4,2,15,1002,'2020-09-01 13:17:16',1002,'2020-11-13 10:50:45',0),(4,4,3,10,1002,'2020-09-01 13:17:16',1002,'2020-10-27 17:28:49',0),(13,4,5,10,1002,'2020-10-27 17:27:37',1002,'2020-10-27 17:28:49',0);
/*!40000 ALTER TABLE `leave_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CF` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK9` (`created_by`),
  CONSTRAINT `CREATED_BY_FK9` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` VALUES (1,'CL','No',1002,'2020-09-01 13:21:20',1002,'2020-10-27 19:16:11',1),(2,'SL','No',1002,'2020-09-01 13:21:20',1002,'2020-10-27 19:16:11',1),(3,'EL','Yes',1002,'2020-09-01 13:21:20',1002,'2020-10-27 19:46:45',1),(5,'PL','No',1002,'2020-09-18 22:49:23',1002,'2020-10-27 19:21:36',1);
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('mondaldebabrata.m@gmail.com','$2y$10$3FTRmtvB2UsdGlnZTvIcmehMyHiJbh4GWcQxh.NdggixBmluaAoZ2','2020-09-02 00:00:33'),('stupid6moron9@gmail.com','$2y$10$.13zGVOVFL87DbT4uMOQQeCrp8rHDKi37RghBNWi.JWoE.7BX2R8a','2020-10-23 09:59:06');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_deduct_info`
--

DROP TABLE IF EXISTS `payroll_deduct_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_deduct_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prof_tax` float unsigned NOT NULL,
  `esi` float unsigned NOT NULL,
  `pf` float unsigned NOT NULL,
  `tds` float unsigned NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK8` (`created_by`),
  CONSTRAINT `CREATED_BY_FK8` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_deduct_info`
--

LOCK TABLES `payroll_deduct_info` WRITE;
/*!40000 ALTER TABLE `payroll_deduct_info` DISABLE KEYS */;
INSERT INTO `payroll_deduct_info` VALUES (1,'Permanent General',2,2.5,1.5,0.5,1002,'2020-09-01 23:10:00',1002,'2020-11-09 19:07:18',0),(2,'Permanent Flexible',2.06,2.38,1.66,0.63,1002,'2020-09-19 08:52:40',1002,'2020-11-09 19:07:18',0),(4,'Permanent Fixed',1.75,1.89,1.76,0.76,1002,'2020-11-09 19:07:58',NULL,'2020-11-09 19:37:58',0);
/*!40000 ALTER TABLE `payroll_deduct_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_payable_info`
--

DROP TABLE IF EXISTS `payroll_payable_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_payable_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `basic` double DEFAULT '0',
  `hra` double DEFAULT '0',
  `conveyance` double DEFAULT '0',
  `ot` double DEFAULT '0',
  `leave_encashment` double DEFAULT '0',
  `allowance` double DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK6` (`created_by`),
  CONSTRAINT `CREATED_BY_FK6` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_payable_info`
--

LOCK TABLES `payroll_payable_info` WRITE;
/*!40000 ALTER TABLE `payroll_payable_info` DISABLE KEYS */;
INSERT INTO `payroll_payable_info` VALUES (4,'Permanent General',50,10,7.8,1000,1000,1000,1002,'2020-10-21 21:06:14',1002,'2020-11-09 12:31:13',0),(5,'Casual Flexible',25,15.5,8.19,1000.7,1000,555,1002,'2020-10-21 21:07:12',1002,'2020-11-09 12:32:58',0);
/*!40000 ALTER TABLE `payroll_payable_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `type_id` int unsigned NOT NULL,
  `half_day_dur_minutes` int unsigned NOT NULL,
  `delay_time_minutes` int unsigned NOT NULL,
  `login_punch_dur_mins` int unsigned NOT NULL DEFAULT '30',
  `logout_punch_dur_mins` int unsigned NOT NULL DEFAULT '120',
  `ot_dur_mins` int unsigned NOT NULL DEFAULT '120',
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SHIFT_TYPE_FK` (`type_id`),
  KEY `CREATED_BY_FK4` (`created_by`),
  CONSTRAINT `CREATED_BY_FK4` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `SHIFT_TYPE_FK` FOREIGN KEY (`type_id`) REFERENCES `shift_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Half Flexible','08:00:00','14:00:00',2,120,60,30,120,120,1002,'2020-09-01 13:24:45',1002,'2020-09-18 11:42:50',0),(2,'Full Fixed','08:00:00','20:00:00',1,240,120,30,120,120,1002,'2020-09-01 13:24:45',1002,'2020-09-18 11:43:39',0),(3,'TBD','09:00:00','18:00:00',3,180,90,30,120,120,1002,'2020-09-01 13:24:45',NULL,NULL,0),(4,'TBD','09:00:00','21:00:00',3,240,120,30,120,120,1002,'2020-09-01 13:24:45',NULL,NULL,0),(5,'TBD','14:00:00','20:00:00',2,120,60,30,120,120,1002,'2020-09-01 13:24:45',NULL,NULL,0),(6,'TBD','20:00:00','08:00:00',1,240,120,30,120,120,1002,'2020-09-01 13:24:45',NULL,NULL,0),(7,'TBD','20:00:00','08:00:00',2,240,120,30,120,120,1002,'2020-09-01 13:24:45',NULL,NULL,0),(8,'TBD','17:30:00','11:30:00',3,240,120,30,120,120,1002,'2020-09-01 13:24:45',1002,'2020-11-01 17:29:50',0),(9,'Full RMO','11:30:00','23:30:00',38,240,120,30,120,120,1002,'2020-09-01 13:24:45',1002,'2020-09-17 21:28:02',0);
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_types`
--

DROP TABLE IF EXISTS `shift_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int unsigned DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `in_use` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CREATED_BY_FK` (`created_by`),
  CONSTRAINT `CREATED_BY_FK` FOREIGN KEY (`created_by`) REFERENCES `access_control_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_types`
--

LOCK TABLES `shift_types` WRITE;
/*!40000 ALTER TABLE `shift_types` DISABLE KEYS */;
INSERT INTO `shift_types` VALUES (1,'Fixed',1002,'2020-09-01 13:26:02',1002,'2020-09-18 12:49:47',0),(2,'Flexible',1002,'2020-09-01 13:26:02',NULL,'2020-09-18 12:50:12',1),(3,'General',1002,'2020-09-01 13:26:02',NULL,'2020-11-01 11:59:50',4),(4,'RMO',1002,'2020-09-01 13:26:02',1002,'2020-09-18 06:13:39',1),(38,'QQQ Q',1002,'2020-09-15 11:51:23',1002,'2020-09-20 17:22:32',2);
/*!40000 ALTER TABLE `shift_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `profile_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int unsigned DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `ACCESS_LEVEL_FK5` (`admin`),
  CONSTRAINT `ACCESS_LEVEL_FK5` FOREIGN KEY (`admin`) REFERENCES `access_control_list` (`id`),
  CONSTRAINT `users_FK` FOREIGN KEY (`profile_id`) REFERENCES `emp_profile` (`profile_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stupid Moron','stupid6moron9@gmail.com','$2y$10$vZtFYojHQVBQc2Sm9KbdcuZtyrqNmGt1amWk66QcBw0F63SPFELna',1002,NULL),(32,'Sudipa Nandy','subir@gmail.com','$2y$10$1pdV4Q3fv958iInAxzHq0upMhSLuG0psOmIUN5qAYp6sfa8YryKlu',1003,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hrms'
--
/*!50003 DROP FUNCTION IF EXISTS `shift_identification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tdeprojects`@`localhost` FUNCTION `shift_identification`(`empId` INT(10) UNSIGNED, `loginDt` DATETIME) RETURNS int unsigned
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Debabrata Mondal (Software Architect)'
BEGIN
DECLARE out_shift_id INT(10) UNSIGNED;

DECLARE c_shift_id INT(10) UNSIGNED;
DECLARE c_start_time TIME;

DECLARE start_datetime DATETIME;
DECLARE timediff_minutes FLOAT(10) UNSIGNED;
DECLARE timediff_minutes_min FLOAT(10) UNSIGNED;

DECLARE done INT DEFAULT FALSE;
DECLARE cur CURSOR FOR 
SELECT 
  id, 
  start_time
FROM 
  shift
WHERE 
  type_id = (SELECT 
  shift_type_id 
from 
  emp_designation 
where 
  id = (select 
  designation_id
 from 
  emp_profile
where
  profile_id = empId));

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
SET timediff_minutes_min = 1500;
SET out_shift_id = NULL;

OPEN cur;
read_loop : LOOP FETCH cur INTO 
	c_shift_id, 
	c_start_time;

	IF done THEN
      LEAVE read_loop;
    END IF;
	
	IF TIMEDIFF(TIME(loginDt), c_start_time) < 0 THEN
		SET start_datetime = CAST(
			CONCAT(ADDDATE(DATE(loginDt), -1), 
			  ' ', 
			  c_start_time
			) AS DATETIME
		);
	ELSE
		SET 
		  start_datetime = CAST(
			CONCAT(DATE(loginDt), ' ', c_start_time) AS DATETIME
		  );
	END IF;

	SET timediff_minutes = ROUND(TIME_TO_SEC(ABS(TIMEDIFF(loginDt, start_datetime)))/60,2);
	IF timediff_minutes < timediff_minutes_min THEN
		SET timediff_minutes_min = timediff_minutes;
		SET out_shift_id = c_shift_id;
	END IF;
END LOOP read_loop;
CLOSE cur;

RETURN(out_shift_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `shift_validation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tdeprojects`@`localhost` FUNCTION `shift_validation`(`in_shift_id` INT(10) UNSIGNED, `loginDt` DATETIME) RETURNS int unsigned
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Debabrata Mondal (Software Architect)'
BEGIN
DECLARE out_shift_id INT(10) UNSIGNED;

DECLARE c_start_time TIME;
DECLARE c_halfday_time INT(5) UNSIGNED;
DECLARE c_halfday_hrs INT(5) UNSIGNED;
DECLARE c_halfday_mins INT(5) UNSIGNED;
DECLARE c_delay_minutes INT(5) UNSIGNED;
DECLARE c_punch_minutes INT(5) UNSIGNED;
DECLARE c_punch_hrs INT(5) UNSIGNED;
DECLARE c_punch_mins INT(5) UNSIGNED;

DECLARE start_datetime DATETIME;
DECLARE half_day_dur_start TIME;
DECLARE punch_duration TIME;

SET out_shift_id = NULL;

SELECT 
	start_time,
	half_day_dur_minutes, 
	delay_time_minutes, 
	login_punch_dur_mins  
INTO
	c_start_time, 
	c_halfday_time, 
	c_delay_minutes, 
	c_punch_minutes
FROM 
	shift
WHERE
	id = in_shift_id;

SET c_punch_hrs = c_punch_minutes DIV 60;
SET c_punch_mins = MOD(c_punch_minutes,60);
SET punch_duration = CAST(CONCAT('-',c_punch_hrs,':',c_punch_mins,':0.000000') AS TIME);

SET c_halfday_hrs = (c_halfday_time+c_delay_minutes) DIV 60;
SET c_halfday_mins = MOD((c_halfday_time+c_delay_minutes),60);
SET half_day_dur_start = CAST(CONCAT(c_halfday_hrs,':',c_halfday_mins,':0.000000') AS TIME);

IF TIMEDIFF(TIME(loginDt), c_start_time) < 0 THEN
	SET start_datetime = CAST(
		CONCAT(ADDDATE(DATE(loginDt), -1), 
		  ' ', 
		  c_start_time
		) AS DATETIME
	);
ELSE
	SET 
	  start_datetime = CAST(
		CONCAT(DATE(loginDt), ' ', c_start_time) AS DATETIME
	  );
END IF;

IF loginDt >= ADDTIME(start_datetime, punch_duration) 
	AND loginDt < ADDTIME(start_datetime, half_day_dur_start) THEN
	SET out_shift_id = in_shift_id;
END IF;	
RETURN(out_shift_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance_sheet_auto_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tdeprojects`@`localhost` PROCEDURE `attendance_sheet_auto_logout`(OUT `c_status` BOOLEAN)
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Debabrata Mondal (Software Architect)'
BEGIN
DECLARE c_attendance_id INT(10) UNSIGNED;
DECLARE c_emp_id INT(10) UNSIGNED;
DECLARE c_login_date DATETIME; 
DECLARE c_logout_date DATETIME;
DECLARE c_shift_id INT(10) UNSIGNED;
DECLARE c_working_minutes INT(5) UNSIGNED;  

DECLARE c_login_attendance ENUM('Normal', 'Late', 'Absent', 'NA');
DECLARE c_attendance_status ENUM('FD:Pending', 'HD:Pending', 'OT:Pending', 'Full Day', 'Half Day', 'OT', 'Absent', 'Leave', 'Off Day', 'NA');

DECLARE c_start_time TIME;
DECLARE c_end_time TIME;
DECLARE c_halfday_time INT(5) UNSIGNED;
DECLARE c_delay_minutes INT(5) UNSIGNED;
DECLARE c_punch_minutes INT(5) UNSIGNED;

DECLARE current_datetime DATETIME;
DECLARE end_datetime DATETIME;
DECLARE timediff_minutes FLOAT(10) UNSIGNED;

DECLARE done INT DEFAULT FALSE;
DECLARE cur CURSOR FOR 
SELECT 
  attendance_id, 
  emp_id,
  login_date, 
  logout_date,
  working_minutes,
  shift_id,
  login_attendance,
  attendance_status
FROM 
  emp_attendance
WHERE 
  working_minutes IS NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SET c_status = FALSE;

OPEN cur;
read_loop : LOOP FETCH cur INTO c_attendance_id, 
	c_emp_id,
	c_login_date, 
	c_logout_date,
	c_working_minutes,
	c_shift_id,  
	c_login_attendance,
	c_attendance_status;

	IF done THEN
	  LEAVE read_loop;
	END IF;

	SELECT c_attendance_id;
	
	SELECT 
	  start_time,
	  end_time,
	  half_day_dur_minutes,
	  delay_time_minutes,
	  logout_punch_dur_mins
	INTO
	  c_start_time,
	  c_end_time,
	  c_halfday_time,
	  c_delay_minutes,
	  c_punch_minutes
	FROM 
	  shift 
	WHERE
	  id = c_shift_id;
	
	IF TIMEDIFF(c_end_time, TIME(c_login_date)) < 0 THEN 
		SET 
		  end_datetime = CAST(
			CONCAT(
			  ADDDATE(DATE(c_login_date), 1), 
			  ' ', 
			  c_end_time
			) AS DATETIME
		  );
	ELSE 
		SET 
		  end_datetime = CAST(
			CONCAT(DATE(c_login_date), ' ', c_end_time) AS DATETIME
		  );
	END IF;
	
	SET current_datetime = NOW();
	SET timediff_minutes = ROUND(TIME_TO_SEC(
		ABS(TIMEDIFF(current_datetime, end_datetime)
		))/60,2);
	
	IF timediff_minutes > c_punch_minutes THEN
		SET c_login_attendance = "Absent";
		SET c_attendance_status = "Absent";
	END IF;
		
	SET c_logout_date = current_datetime;
	SET c_working_minutes = 0;
	SET c_status = TRUE;
		
	SELECT c_login_date,
		c_logout_date,
		c_working_minutes,
		c_login_attendance,
		c_attendance_status,
		c_status;
		
	START TRANSACTION;
	UPDATE 
		emp_attendance 
	SET 
		logout_date=c_logout_date, 
		working_minutes = c_working_minutes, 
		login_attendance=c_login_attendance, 
		attendance_status=c_attendance_status 
	WHERE 
		attendance_id = c_attendance_id;
	COMMIT;
END LOOP read_loop;
CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance_sheet_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tdeprojects`@`localhost` PROCEDURE `attendance_sheet_login`(IN `empId` INT(10) UNSIGNED, IN `loginDt` DATETIME, OUT `c_status` BOOLEAN, OUT `status_msg` VARCHAR(100) CHARSET utf8)
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Debabrata Mondal (Software Architect)'
begin
-- DECLARE c_status BOOLEAN;
-- DECLARE status_msg VARCHAR(100);

-- DECLARE loginDt DATETIME;

DECLARE record_count_before INT(10) UNSIGNED;
DECLARE record_count_after INT(10) UNSIGNED;

DECLARE login_attendance ENUM('Normal', 'Late', 'Absent', 'NA');
DECLARE attendance_status ENUM('FD:Pending', 'HD:Pending', 'OT:Pending', 'Full Day', 'Half Day', 'OT', 'Absent', 'Leave', 'Off Day', 'NA');

DECLARE selected_shift_id INT(10) UNSIGNED;

DECLARE c_start_time TIME;
DECLARE c_end_time TIME;
DECLARE c_halfday_minutes INT(5) UNSIGNED;
DECLARE c_delay_minutes INT(5) UNSIGNED;
DECLARE c_punch_minutes INT(5) UNSIGNED;
DECLARE c_punch_hrs INT(5) UNSIGNED;
DECLARE c_punch_mins INT(5) UNSIGNED;
DECLARE c_ot_dur_mins INT(5) UNSIGNED;
DECLARE c_emp_rec_count INT(5) UNSIGNED;

DECLARE start_datetime DATETIME;
DECLARE end_datetime DATETIME;
DECLARE timediff_minutes FLOAT(10) UNSIGNED;
DECLARE punch_duration TIME;

SET selected_shift_id = shift_identification(empId, loginDt);
SELECT selected_shift_id;
IF selected_shift_id THEN
	SET selected_shift_id = shift_validation(selected_shift_id,loginDt);
	SELECT selected_shift_id;
END IF;

IF selected_shift_id THEN
	SELECT 
		start_time, 
		end_time, 
		half_day_dur_minutes, 
		delay_time_minutes, 
		login_punch_dur_mins,
		ot_dur_mins  
	INTO
		c_start_time, 
		c_end_time, 
		c_halfday_minutes, 
		c_delay_minutes, 
		c_punch_minutes,
		c_ot_dur_mins
	FROM 
		shift
	WHERE
		id = selected_shift_id;
	
	SET login_attendance = 'NA';
	SET attendance_status = 'NA';
	
	SET c_punch_hrs = c_punch_minutes DIV 60;
	SET c_punch_mins = MOD(c_punch_minutes,60);
	SET punch_duration = CAST(CONCAT('-',c_punch_hrs,':',c_punch_mins,':0.000000') AS TIME);
	SELECT c_punch_minutes,c_punch_hrs,c_punch_mins,punch_duration;
	
	IF TIMEDIFF(TIME(loginDt), c_start_time) < 0 THEN
		SET start_datetime = CAST(
			CONCAT(ADDDATE(DATE(loginDt), -1), 
			  ' ', 
			  c_start_time
			) AS DATETIME
		);
	ELSE
		SET 
		  start_datetime = CAST(
			CONCAT(DATE(loginDt), ' ', c_start_time) AS DATETIME
		  );
	END IF;
	
	IF TIMEDIFF(c_end_time, TIME(loginDt)) < 0 THEN		
		SET 
		  end_datetime = CAST(
			CONCAT(
			  ADDDATE(DATE(loginDt), 1), 
			  ' ', 
			  c_end_time
			) AS DATETIME
		  );
	ELSE 
		SET 
		  end_datetime = CAST(
			CONCAT(DATE(loginDt), ' ', c_end_time) AS DATETIME
		  );
	END IF;

	SELECT loginDt, start_datetime, ADDTIME(start_datetime, punch_duration), end_datetime;
	IF loginDt >= ADDTIME(start_datetime, punch_duration) 
	AND loginDt < end_datetime THEN
		SET timediff_minutes = ROUND(TIME_TO_SEC(
			ABS(TIMEDIFF(loginDt, start_datetime)
			))/60,2);
				
		IF DATEDIFF(DATE(start_datetime),DATE(end_datetime)) = 0 THEN
			SET c_emp_rec_count = 0;
			SELECT
			  COUNT(*)
			INTO
			  c_emp_rec_count
			FROM 
			  emp_attendance
			WHERE
			  emp_id = empId 
			  AND shift_id != selected_shift_id
			  AND working_minutes > 0
			  AND attendance_status = 'Full Day'
			  AND DATEDIFF(DATE(start_datetime),DATE(login_date)) = 0 
			  AND DATEDIFF(DATE(start_datetime),DATE(logout_date)) = 0 
			  AND DATEDIFF(loginDt,logout_date) >= 0
			  AND ABS(ROUND(TIME_TO_SEC(
				TIMEDIFF(loginDt,logout_date))/60,0)) <= c_ot_dur_mins;
				
			IF c_emp_rec_count > 0 THEN
				IF timediff_minutes <= c_punch_minutes THEN
					SET login_attendance = 'Normal';
				ELSE
					SET login_attendance = 'Late';
				END IF;
				SET attendance_status = 'OT:Pending';
			END IF;
		END IF;
		
		IF attendance_status != 'OT:Pending' THEN
			IF timediff_minutes <= c_punch_minutes THEN 
				SET 
				  login_attendance = 'Normal';
				SET 
				  attendance_status = 'FD:Pending';
			ELSE
			  IF timediff_minutes < (c_halfday_minutes - c_punch_minutes) THEN
				SET 
				  login_attendance = 'Late';
				SET 
				  attendance_status = 'FD:Pending';
			  ELSE
				IF timediff_minutes >= (c_halfday_minutes - c_punch_minutes)
				AND timediff_minutes < (c_halfday_minutes + c_delay_minutes) THEN 
				SET 
					attendance_status = 'HD:Pending';
					IF ABS(timediff_minutes - c_halfday_minutes) <= c_punch_minutes THEN 
					SET 
						login_attendance = 'Normal';
					ELSE 
					SET 
						login_attendance = 'Late';
					END IF;
				ELSE
				SET 
				  login_attendance = 'Absent';
				SET 
				  attendance_status = 'Absent';
				END IF;
			  END IF;
			END IF;
		END IF;
		SELECT COUNT(*) INTO record_count_before FROM emp_attendance;
		START TRANSACTION;
		INSERT INTO emp_attendance(`emp_id`, `attendance_day`, `attendance_year`, `attendance_month`, `login_date`, `shift_id`, `login_attendance`, `attendance_status`) 
		VALUES(empId,
		DAY(start_datetime),
		YEAR(start_datetime),
		MONTH(start_datetime),
		loginDt,	
		selected_shift_id,
		login_attendance,
		attendance_status);
		COMMIT;
		SELECT COUNT(*) INTO record_count_after FROM emp_attendance;
		IF(record_count_after - record_count_before = 1) THEN
			SET c_status = TRUE;
			SET status_msg = "New login entry done successfully";
		ELSE
			SET c_status = FALSE;
			SET status_msg = "New login entry failed!";
		END IF;
	ELSE
		SET c_status = FALSE;
		SET status_msg = "Can't insert as login time is not within the shift timing!";
	END IF;	
ELSE
	SET c_status = FALSE;
	SET status_msg = "Can't insert as no matching shift found!";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance_sheet_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`tdeprojects`@`localhost` PROCEDURE `attendance_sheet_logout`(IN `empId` INT(10) UNSIGNED, IN `logoutDt` DATETIME, OUT `c_status` BOOLEAN, OUT `status_msg` VARCHAR(100) CHARSET utf8)
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Debabrata Mondal (Software Architect)'
BEGIN
DECLARE c_attendance_id INT(10) UNSIGNED;
DECLARE c_emp_id INT(10) UNSIGNED;
DECLARE c_login_date DATETIME; 
DECLARE c_logout_date DATETIME;
DECLARE c_shift_id INT(10) UNSIGNED;
DECLARE c_working_minutes INT(5) UNSIGNED;  

DECLARE c_login_attendance ENUM('Normal', 'Late', 'Absent', 'NA');
DECLARE c_attendance_status ENUM('FD:Pending', 'HD:Pending', 'OT:Pending', 'Full Day', 'Half Day', 'OT', 'Absent', 'Leave', 'Off Day', 'NA');

DECLARE c_start_time TIME;
DECLARE c_end_time TIME;
DECLARE c_halfday_time INT(5) UNSIGNED;
DECLARE c_halfday_hrs INT(5) UNSIGNED;
DECLARE c_halfday_mins INT(5) UNSIGNED;
DECLARE c_delay_minutes INT(5) UNSIGNED;
DECLARE c_punch_minutes INT(5) UNSIGNED;
DECLARE c_punch_hrs INT(5) UNSIGNED;
DECLARE c_punch_mins INT(5) UNSIGNED;

DECLARE start_datetime DATETIME;
DECLARE end_datetime DATETIME;
DECLARE half_day_dur_start TIME;
DECLARE half_day_dur_end TIME;
DECLARE punch_duration TIME;

DECLARE done INT DEFAULT FALSE;
DECLARE cur CURSOR FOR 
SELECT 
  id, 
  emp_id,
  login_date, 
  logout_date,
  working_minutes,
  shift_id,
  login_attendance,
  attendance_status
FROM 
  emp_attendance
WHERE 
  emp_id = empId AND logoutDt > login_date AND working_minutes IS NULL;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SET c_status = FALSE;
SET status_msg = "Logout Failure";

OPEN cur;
read_loop : LOOP FETCH cur INTO c_attendance_id, 
	c_emp_id,
	c_login_date, 
	c_logout_date,
	c_working_minutes,
	c_shift_id,  
	c_login_attendance,
	c_attendance_status;

	IF done THEN
	  LEAVE read_loop;
	END IF;

	SELECT c_attendance_id;
	
	SELECT 
	  start_time,
	  end_time,
	  half_day_dur_minutes,
	  delay_time_minutes,
	  logout_punch_dur_mins
	INTO
	  c_start_time,
	  c_end_time,
	  c_halfday_time,
	  c_delay_minutes,
	  c_punch_minutes
	FROM 
	  shift 
	WHERE
	  id = c_shift_id;

	SET c_halfday_hrs = (c_halfday_time+c_delay_minutes) DIV 60;
	SET c_halfday_mins = MOD((c_halfday_time+c_delay_minutes),60);
	SET half_day_dur_start = CAST(CONCAT('-',c_halfday_hrs,':',c_halfday_mins,':0.000000') AS TIME);
	
	SET c_halfday_hrs = c_halfday_time DIV 60;
	SET c_halfday_mins = MOD(c_halfday_time,60);
	SET half_day_dur_end = CAST(CONCAT('-',c_halfday_hrs,':',c_halfday_mins,':0.000000') AS TIME);  
	
	SET c_punch_hrs = c_punch_minutes DIV 60;
	SET c_punch_mins = MOD(c_punch_minutes,60);
	SET punch_duration = CAST(CONCAT(c_punch_hrs,':',c_punch_mins,':0.000000') AS TIME);
	
	SELECT half_day_dur_start,half_day_dur_end,punch_duration;
	
	IF TIMEDIFF(TIME(c_login_date), c_start_time) < 0 THEN
		SET start_datetime = CAST(
			CONCAT(ADDDATE(DATE(c_login_date), -1), 
			  ' ', 
			  c_start_time
			) AS DATETIME
		);
	ELSE
		SET 
		  start_datetime = CAST(
			CONCAT(DATE(c_login_date), ' ', c_start_time) AS DATETIME
		  );
	END IF;
	
	IF TIMEDIFF(c_end_time, TIME(c_login_date)) < 0 THEN 
		SET 
		  end_datetime = CAST(
			CONCAT(
			  ADDDATE(DATE(c_login_date), 1), 
			  ' ', 
			  c_end_time
			) AS DATETIME
		  );
	ELSE 
		SET 
		  end_datetime = CAST(
			CONCAT(DATE(c_login_date), ' ', c_end_time) AS DATETIME
		  );
	END IF;
	
	SELECT start_datetime, end_datetime, logoutDt, ADDTIME(end_datetime, half_day_dur_start);
	
	IF logoutDt >= start_datetime AND logoutDt < ADDTIME(end_datetime, punch_duration) 
	THEN
		IF logoutDt >= start_datetime AND logoutDt < ADDTIME(end_datetime, half_day_dur_start) 
		THEN
			SET c_login_attendance = "Absent";
			SET c_attendance_status = "Absent";
			SET c_working_minutes = 0;
			SET c_logout_date = logoutDt;
		ELSE
			IF logoutDt >= ADDTIME(end_datetime, half_day_dur_start) 
			AND logoutDt < ADDTIME(end_datetime, half_day_dur_end) THEN
				IF c_attendance_status = "FD:Pending" THEN
					SET c_attendance_status = "Half Day";
				ELSE
					IF c_attendance_status = "HD:Pending" THEN
						SET c_login_attendance = "Absent";
						SET c_attendance_status = "Absent";
					ELSE
						IF c_attendance_status = "OT:Pending" THEN
							SET c_attendance_status = "Half Day";
						END IF;
					END IF;
				END IF;
			ELSE
				IF logoutDt >= ADDTIME(end_datetime, half_day_dur_end) 
				AND logoutDt < end_datetime THEN
					IF c_attendance_status = "FD:Pending" THEN
						SET c_attendance_status = "Full Day";
					ELSE
						IF c_attendance_status = "HD:Pending" THEN
							SET c_login_attendance = "Absent";
							SET c_attendance_status = "Absent";
						ELSE
							IF c_attendance_status = "OT:Pending" THEN
								SET c_attendance_status = "OT";
							END IF;
						END IF;
					END IF;
				ELSE
					IF logoutDt >= end_datetime 
					AND logoutDt < ADDTIME(end_datetime, punch_duration) THEN
						IF c_attendance_status = "FD:Pending" THEN
							SET c_attendance_status = "Full Day";
						ELSE
							IF  c_attendance_status = "HD:Pending" THEN
								SET c_attendance_status = "Half Day";
							ELSE
								IF c_attendance_status = "OT:Pending" THEN
									SET c_attendance_status = "OT";
								END IF;	
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
			SET c_logout_date = logoutDt;
			SET c_working_minutes = ROUND(TIME_TO_SEC(TIMEDIFF(c_logout_date,c_login_date))/60,0);
		END IF;
		
		SET c_status = TRUE;
		SET status_msg = "Logout Successful";
		
		SELECT c_login_date,
			c_logout_date,
			c_working_minutes,
			c_login_attendance,
			c_attendance_status,
			c_status,
			status_msg;
		
		START TRANSACTION;
		UPDATE 
			emp_attendance 
		SET 
			logout_date=c_logout_date, 
			working_minutes = c_working_minutes, 
			login_attendance=c_login_attendance, 
			attendance_status=c_attendance_status 
		WHERE 
			id = c_attendance_id;
		COMMIT;
	END IF;
END LOOP read_loop;
CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-13 15:59:46
