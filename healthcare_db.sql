-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled','no_show') NOT NULL DEFAULT 'scheduled',
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointment_patient` (`patient_id`),
  KEY `fk_appointment_doctor` (`doctor_id`),
  CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`employee_id`),
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,'2026-03-10 09:00:00','Endocrinology Checkup','completed'),(2,2,2,'2026-04-10 10:30:00','Dermatology Checkup','scheduled'),(3,3,3,'2026-02-15 11:00:00','Gastroscopy','completed'),(4,4,4,'2026-04-12 14:00:00','Hormone Therapy','scheduled'),(5,5,5,'2026-03-01 09:30:00','Cardiology Checkup','completed'),(6,6,6,'2026-04-18 13:00:00','Dermatology Checkup','scheduled'),(7,7,7,'2026-02-20 12:00:00','Gastroscopy','completed'),(8,8,8,'2026-04-20 10:00:00','Dermatology Checkup','scheduled'),(9,9,1,'2026-03-05 11:30:00','Cardiology Checkup','completed'),(10,10,2,'2026-04-22 09:00:00','Hormone Therapy','scheduled'),(11,11,3,'2026-03-08 14:00:00','Ophthalmology Checkup','completed'),(12,12,4,'2026-04-25 15:00:00','Cardiology Checkup','scheduled'),(13,13,5,'2026-03-12 10:00:00','Neurology Checkup','completed'),(14,14,6,'2026-02-28 09:00:00','Gastroscopy','completed'),(15,15,7,'2026-03-15 11:00:00','Dental Cleaning','completed'),(16,16,8,'2026-04-28 12:00:00','Ophthalmology Checkup','scheduled'),(17,17,1,'2026-04-05 09:30:00','Dermatology Checkup','scheduled'),(18,18,2,'2026-03-18 13:00:00','Endocrinology Checkup','completed'),(19,19,3,'2026-04-02 10:00:00','Neurology Checkup','scheduled'),(20,20,4,'2026-03-20 14:30:00','Lung Therapy','completed'),(21,21,5,'2026-04-30 11:00:00','Ophthalmology Checkup','scheduled');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Pulmonology'),(2,'Dentistry'),(3,'Cardiology'),(4,'Neurology'),(5,'Dermatology'),(6,'Gastroenterology'),(7,'Ophthalmology'),(8,'Endocrinology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_doctor_department` (`department_id`),
  CONSTRAINT `fk_doctor_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Juan',1),(2,'Maria',2),(3,'Alejandro',3),(4,'Andrea',4),(5,'Vicente',5),(6,'Nicole',6),(7,'Daniel',7),(8,'Arturo',8);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `fk_patient_doctor` (`doctor_id`),
  CONSTRAINT `fk_patient_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Sophie','Traugott','1959-07-26',65,'female','Belgium',8),(2,'Luca','Drescher','2004-01-20',21,'male','Spanish',6),(3,'Kerstin','Friedman','1978-08-05',46,'female','German',7),(4,'Steffen','Trommler','1983-04-12',42,'male','German',3),(5,'Lena','Piasecka','1990-03-15',35,'female','Polish',3),(6,'Albert','Schneider','1995-07-22',30,'male','Spanish',5),(7,'Laura','Becker','1988-11-30',36,'female','German',6),(8,'Felix','Wagner','2001-05-08',24,'male','German',5),(9,'Anna','Müller','1975-09-18',50,'female','German',3),(10,'Tobias','Fischer','1969-12-05',56,'male','German',7),(11,'Sophie','Weber','2000-02-14',25,'female','German',8),(12,'Maximilian','Meyer','1985-06-27',40,'male','German',3),(13,'Julia','Schmidt','1992-10-03',33,'female','German',4),(14,'Niklas','Braun','1980-04-19',45,'male','German',7),(15,'Elena','Koch','1998-08-11',27,'female','German',2),(16,'David','Bellingham','1973-01-25',52,'male','English',7),(17,'Lea','Wolf','2003-07-07',22,'female','German',6),(18,'Philipp','Zimmermann','1967-03-30',58,'male','German',8),(19,'Hannah','Krause','1996-12-20',29,'female','German',4),(20,'Lukas','Hartmann','1987-09-09',38,'male','German',1),(21,'Sara','Lange','1993-05-16',32,'female','German',8);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatments` (
  `treatment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `treatment_name` varchar(100) NOT NULL,
  `status` enum('recovered','in_treatment','not_recovered') NOT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `fk_treatment_patient` (`patient_id`),
  CONSTRAINT `fk_treatment_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (49,1,'Endocrinology Checkup','in_treatment'),(50,2,'Dermatology Checkup','in_treatment'),(51,3,'Gastroscopy','recovered'),(52,4,'Hormone Therapy','in_treatment'),(53,5,'Cardiology Checkup','recovered'),(54,6,'Dermatology Checkup','not_recovered'),(55,7,'Gastroscopy','in_treatment'),(56,8,'Dermatology Checkup','recovered'),(57,9,'Cardiology Checkup','in_treatment'),(58,10,'Hormone Therapy','not_recovered'),(59,11,'Ophthalmology Checkup','recovered'),(60,12,'Cardiology Checkup','in_treatment'),(61,13,'Neurology Checkup','recovered'),(62,14,'Gastroscopy','in_treatment'),(63,15,'Dental Cleaning','recovered'),(64,16,'Ophthalmology Checkup','not_recovered'),(65,17,'Dermatology Checkup','in_treatment'),(66,18,'Endocrinology Checkup','recovered'),(67,19,'Neurology Checkup','in_treatment'),(68,20,'Lung Therapy','recovered'),(69,21,'Ophthalmology Checkup','in_treatment');
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'healthcare_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 21:19:22
