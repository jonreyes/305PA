-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: dating_site
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `owner` char(11) NOT NULL,
  `creditcard` char(16) NOT NULL,
  `acctnum` char(30) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`owner`,`creditcard`,`acctnum`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('555-55-5555','349454276731232','23456','2012-09-07 00:00:00'),('555-55-5555','5186330464994532','12345','2013-10-07 00:00:00'),('666-66-6666','5192383525185287','34567','2013-09-23 00:00:00'),('777-77-7777','5144751168293870','45678','2014-05-28 00:00:00'),('888-88-8888','5167593514262698','56789','2014-04-22 00:00:00'),('999-99-9999','4482704287348312','67891','2011-10-07 00:00:00');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dates` (
  `profile1` char(20) NOT NULL,
  `profile2` char(20) NOT NULL,
  `customrep` char(11) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `bookingfee` int(11) DEFAULT NULL,
  `comments` text,
  `user1rating` int(11) DEFAULT NULL,
  `user2rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile1`,`profile2`,`datetime`),
  KEY `profile2` (`profile2`),
  KEY `customrep` (`customrep`),
  CONSTRAINT `dates_ibfk_1` FOREIGN KEY (`profile1`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `dates_ibfk_2` FOREIGN KEY (`profile2`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `dates_ibfk_3` FOREIGN KEY (`customrep`) REFERENCES `employees` (`ssn`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES ('Brenna_Berlin','DesiraeBerg','333-33-3333','2014-10-06 12:21:06','The Mall',36,'Comments Here',2,3),('Fletcher2013','VazquezFromAlajuela','333-33-3333','2014-10-06 04:30:52','Ruvos Restaurant',43,'Comments Here',3,1),('Isabelle2013','DesiraeBerg','222-22-2222','2014-10-04 21:39:42','Port Jeff Cinema',65,'Comments Here',4,5),('Isabelle2014','VazquezFromAlajuela','222-22-2222','2014-10-06 21:49:30','The Mall',91,'Comments Here',3,3),('VazquezFromAlajuela','Brenna_Berlin','444-44-4444','2014-10-06 05:34:04','Turkish Restaurant',69,'Comments Here',4,4);
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `ssn` char(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `hourlyrate` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `person` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('111-11-1111','Manager','2014-10-04',250),('222-22-2222','CustRep','2014-10-04',150),('333-33-3333','CustRep','2014-10-04',100),('444-44-4444','CustRep','2014-10-04',50);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `liker` char(20) NOT NULL,
  `likee` char(20) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`liker`,`likee`,`datetime`),
  KEY `likee` (`likee`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`liker`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`likee`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('VazquezFromAlajuela','Brenna_Berlin','2014-10-06 21:13:02'),('Brenna_Berlin','DesiraeBerg','2014-10-05 05:05:08'),('Brenna_Berlin','DesiraeBerg','2014-10-05 11:02:05'),('Isabelle2013','DesiraeBerg','2014-10-06 23:06:12'),('Isabelle2014','DesiraeBerg','2014-10-07 21:04:09'),('Fletcher2013','VazquezFromAlajuela','2014-10-06 03:46:48'),('Isabelle2013','VazquezFromAlajuela','2014-10-08 09:15:49'),('Isabelle2014','VazquezFromAlajuela','2014-10-06 05:28:39');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ssn` char(11) NOT NULL,
  `password` char(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('111-11-1111','111@11','Veronica','Alvarado','45 Rockefeller Plaza','New York','New York',10111,'Fusce@velitPellentesque.net','(612) 506-2244'),('222-22-2222','222@22','Bo','Osborne','45 Rockefeller Plaza','New York','New York',10111,'mattis.Integer.eu@elit.org','(592) 765-8277'),('333-33-3333','333@33','Hashim','Ross','350 5th Ave','New York','New York',10118,'vulputate@Curae.co.uk','(276) 634-6949'),('444-44-4444','444@44','Shaine','Terrell','350 5th Ave','New York','New York',10118,'tincidunt.nibh@risus.com','(600) 803-9508'),('555-55-5555','555@55','Isabelle','Odonnell','Schomburg Apartments, 350 Circle Road ','Stony Brook','New York',11790,'magna.tellus.faucibus@amet.edu','(934) 241-3862'),('666-66-6666','666@66','Fletcher','Trujillo',' 700 Health Sciences Dr','Stony Brook','New York',11790,'elementum.dui.quis@utlacus.net','(990) 760-1480'),('777-77-7777','777@77','Malachi','Vazquez','700 Health Sciences Dr','Stony Brook','New York',11790,'tellus.lorem.eu@atlacus.org','(226) 193-8257'),('888-88-8888','888@88','Brenna','Cross','Schomburg Apartments, 350 Circle Road','Stony Brook','New York',11790,'sed.turpis@vehiculaaliquet.com','(968) 409-7641'),('999-99-9999','999@99','Desirae','Berg',' 116th St & Broadway','New York','New York',10027,'vitae@magnased.com','(237) 321-3189');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` char(20) NOT NULL,
  `ssn` char(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `datingagerangestart` int(11) DEFAULT NULL,
  `datingagerangeend` int(11) DEFAULT NULL,
  `datinggeorange` int(11) DEFAULT NULL,
  `sex` char(6) DEFAULT NULL,
  `hobbies` varchar(1000) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `haircolor` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `lastmodified` datetime NOT NULL,
  PRIMARY KEY (`profileid`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `users` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES ('Brenna_Berlin','888-88-8888',18,19,21,8,'Female','Dance, Acting ',6.00,180.00,'Blonde','2014-10-04 20:20:55','2014-10-07 12:21:58'),('DesiraeBerg','999-99-9999',20,17,25,5,'Male','Water Sports, Football',5.60,200.00,'Red','2014-10-04 19:13:18','2014-10-04 15:54:48'),('Fletcher2013','666-66-6666',25,20,28,18,'Female','Reading, Basketball',5.60,150.00,'Brown','2014-10-04 19:21:37','2014-10-07 01:25:55'),('Fletcher_Trujillo','666-66-6666',23,19,30,8,'Female','Shopping, Volleyball',5.60,150.00,'Brown','2014-10-04 18:26:49','2014-10-05 00:42:03'),('Isabelle2013','555-55-5555',22,20,22,29,'Female','Shopping, Dance, Mountain Claiming',5.70,120.00,'Black','2014-10-04 00:37:12','2014-10-04 17:08:38'),('Isabelle2014','555-55-5555',22,20,25,5,'Female','Shopping, Cooking',5.70,110.00,'Black','2014-10-04 22:43:25','2014-10-09 11:51:19'),('VazquezFromAlajuela','777-77-7777',26,20,28,15,'Male','Hunting, Running',5.70,170.00,'Black','2014-10-04 17:13:30','2014-10-07 04:16:43');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `profilea` char(20) NOT NULL,
  `profileb` char(20) NOT NULL,
  `profilec` char(20) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`profilea`,`profileb`,`profilec`,`datetime`),
  KEY `profileb` (`profileb`),
  KEY `profilec` (`profilec`),
  CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`profilea`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `referrals_ibfk_2` FOREIGN KEY (`profileb`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `referrals_ibfk_3` FOREIGN KEY (`profilec`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
INSERT INTO `referrals` VALUES ('Isabelle2014','Fletcher2013','VazquezFromAlajuela','2014-10-07 09:56:08'),('DesiraeBerg','VazquezFromAlajuela','Fletcher_Trujillo','2014-10-04 13:59:20');
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervision`
--

DROP TABLE IF EXISTS `supervision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervision` (
  `customrep` char(11) NOT NULL,
  `profile1` char(20) NOT NULL,
  `profile2` char(20) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`customrep`,`profile1`,`profile2`,`datetime`),
  KEY `profile1` (`profile1`),
  KEY `profile2` (`profile2`),
  CONSTRAINT `supervision_ibfk_1` FOREIGN KEY (`profile1`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `supervision_ibfk_2` FOREIGN KEY (`profile2`) REFERENCES `profiles` (`profileid`) ON DELETE CASCADE,
  CONSTRAINT `supervision_ibfk_3` FOREIGN KEY (`customrep`) REFERENCES `employees` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervision`
--

LOCK TABLES `supervision` WRITE;
/*!40000 ALTER TABLE `supervision` DISABLE KEYS */;
INSERT INTO `supervision` VALUES ('222-22-2222','Fletcher2013','DesiraeBerg','2014-10-05 15:07:44'),('333-33-3333','Fletcher_Trujillo','VazquezFromAlajuela','2014-10-09 20:59:22');
/*!40000 ALTER TABLE `supervision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ssn` char(11) NOT NULL,
  `ppp` enum('Super-User','Good-User','User-User') DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `lastactive` datetime DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `person` (`ssn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('555-55-5555','Super-User',3,'2014-10-07 05:53:13'),('666-66-6666','Good-User',3,'2014-10-05 05:27:28'),('777-77-7777','Good-User',4,'2014-10-08 22:37:07'),('888-88-8888','User-User',3,'2014-10-04 09:10:12'),('999-99-9999','User-User',2,'2014-10-05 18:28:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-25  4:36:02
