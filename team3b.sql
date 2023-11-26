CREATE DATABASE  IF NOT EXISTS `drugstoredb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `drugstoredb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: drugstoredb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contract_pharmacy_pharmacompany`
--

DROP TABLE IF EXISTS `contract_pharmacy_pharmacompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_pharmacy_pharmacompany` (
  `contractId` int unsigned NOT NULL AUTO_INCREMENT,
  `pharmacy_id` int unsigned NOT NULL,
  `pharmaCompany_id` int unsigned NOT NULL,
  `supervisor_firstName` varchar(45) NOT NULL,
  `supervisor_lastName` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `contract_text` text,
  PRIMARY KEY (`contractId`),
  KEY `fk_contract_pharmacy_pharmaCompany_pharmacy1_idx` (`pharmacy_id`),
  KEY `fk_contract_pharmacy_pharmaCompany_pharmaCompany1_idx` (`pharmaCompany_id`),
  CONSTRAINT `fk_contract_pharmacy_pharmaCompany_pharmaCompany1` FOREIGN KEY (`pharmaCompany_id`) REFERENCES `pharmacompany` (`id`),
  CONSTRAINT `fk_contract_pharmacy_pharmaCompany_pharmacy1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`),
  CONSTRAINT `contract_pharmacy_pharmacompany_chk_1` CHECK ((`start_date` < `end_date`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_pharmacy_pharmacompany`
--

LOCK TABLES `contract_pharmacy_pharmacompany` WRITE;
/*!40000 ALTER TABLE `contract_pharmacy_pharmacompany` DISABLE KEYS */;
INSERT INTO `contract_pharmacy_pharmacompany` VALUES (1,1,1,'Will','Smith','2023-02-28','2023-03-02','We will sell drugs to you.'),(2,1,2,'Will','Smith','2023-04-01','2023-04-05','We will sell drugs to you.'),(3,2,2,'Chris','Rock','2022-09-06','2022-10-01','We will sell drugs to you.');
/*!40000 ALTER TABLE `contract_pharmacy_pharmacompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ssn` varchar(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `practice_since` year NOT NULL,
  `specialty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `doctor_chk_1` CHECK ((char_length(`ssn`) <= 11))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'123459725','Dockter Number1','Dr.',2012,'Family Medicine'),(2,'123459852','Dockter Number2','Dr.',2011,'Pediatrics'),(3,'123454387','Dockter Number3','Dr.',2016,'Orthpedics'),(4,'123459764','Dockter Number4','Dr.',2018,'Dermatology'),(5,'123455905','Dockter Number5','Dr.',2009,'Cardiology'),(6,'123452686','Dockter Number6','Dr.',2009,'Gynecology'),(7,'123455858','Dockter Number7','Dr.',2017,'Gastroenterology'),(8,'123455746','Dockter Number8','Dr.',2011,'Psychiatry'),(9,'123453838','Dockter Number9','Dr.',2004,'Oncology'),(10,'123450138','Dockter Number10','Dr.',2016,'Internal Medicine');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `drug_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tradeName` varchar(45) DEFAULT NULL,
  `formula` varchar(45) NOT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `tradeName_UNIQUE` (`tradeName`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'Tylenol with Codeine','acetaminophen and codeine'),(2,'Proair Proventil','albuterol aerosol'),(3,'Accuneb','albuterol HFA'),(4,'Fosamax','alendronate'),(5,'Zyloprim','allopurinol'),(6,'Xanax','alprazolam'),(7,'Elavil','amitriptyline'),(8,'Augmentin','amoxicillin and clavulanate K+'),(9,'Amoxil','amoxicillin'),(10,'Adderall XR','amphetamine and dextroamphetamine XR'),(11,'Tenormin','atenolol'),(12,'Lipitor','atorvastatin'),(13,'Zithromax','azithromycin'),(14,'Lotrel','benazepril and amlodipine'),(15,'Soma','carisoprodol'),(16,'Coreg','carvedilol'),(17,'Omnicef','cefdinir'),(18,'Celebrex','celecoxib'),(19,'Keflex','cephalexin'),(20,'Cipro','ciprofloxacin'),(21,'Celexa','citalopram'),(22,'Klonopin','clonazepam'),(23,'Catapres','clonidine HCl'),(24,'Plavix','clopidogrel'),(25,'Premarin','conjugated estrogens'),(26,'Flexeril','cyclobenzaprine'),(27,'Valium','diazepam'),(28,'Voltaren','diclofenac sodium'),(29,'Yaz','drospirenone and ethinyl estradiol'),(30,'Cymbalta','Duloxetine'),(31,'Vibramycin','doxycycline hyclate'),(32,'Vasotec','enalapril'),(33,'Lexapro','escitalopram'),(34,'Nexium','esomeprazole'),(35,'Zetia','ezetimibe'),(36,'Tricor','fenofibrate'),(37,'Allegra','fexofenadine'),(38,'Diflucan','fluconozole'),(39,'Prozac','fluoxetine HCl'),(40,'Advair','fluticasone and salmeterol inhaler'),(41,'Flonase','fluticasone nasal spray'),(42,'Folic Acid','folic acid'),(43,'Lasix','furosemide'),(44,'Neurontin','gabapentin'),(45,'Amaryl','glimepiride'),(46,'Diabeta','glyburide'),(47,'Glucotrol','glipizide'),(48,'Microzide','hydrochlorothiazide'),(49,'Lortab','hydrocodone and acetaminophen'),(50,'Motrin','ibuprophen'),(51,'Lantus','insulin glargine'),(52,'Imdur','isosorbide mononitrate'),(53,'Prevacid','lansoprazole'),(54,'Levaquin','levofloxacin'),(55,'Levoxl','levothyroxine sodium'),(56,'Zestoretic','lisinopril and hydrochlorothiazide'),(57,'Prinivil','lisinopril'),(58,'Ativan','lorazepam'),(59,'Cozaar','losartan'),(60,'Mevacor','lovastatin'),(61,'Mobic','meloxicam'),(62,'Glucophage','metformin HCl'),(63,'Medrol','methylprednisone'),(64,'Toprol','metoprolol succinate XL'),(65,'Lopressor','metoprolol tartrate'),(66,'Nasonex','mometasone'),(67,'Singulair','montelukast'),(68,'Naprosyn','naproxen'),(69,'Prilosec','omeprazole'),(70,'Percocet','oxycodone and acetaminophen'),(71,'Protonix','pantoprazole'),(72,'Paxil','paroxetine'),(73,'Actos','pioglitazone'),(74,'Klor-Con','potassium Chloride'),(75,'Pravachol','pravastatin'),(76,'Deltasone','prednisone'),(77,'Lyrica','pregabalin'),(78,'Phenergan','promethazine'),(79,'Seroquel','quetiapine'),(80,'Zantac','ranitidine'),(81,'Crestor','rosuvastatin'),(82,'Zoloft','sertraline HCl'),(83,'Viagra','sildenafil HCl'),(84,'Vytorin','simvastatin and ezetimibe'),(85,'Zocor','simvastatin'),(86,'Aldactone','spironolactone'),(87,'Bactrim DS','sulfamethoxazole and trimethoprim DS'),(88,'Flomax','tamsulosin'),(89,'Restoril','temezepam'),(90,'Topamax','topiramate'),(91,'Ultram','tramadol'),(92,'Aristocort','triamcinolone Ace topical'),(93,'Desyrel','trazodone HCl'),(94,'Dyazide','triamterene and hydrochlorothiazide'),(95,'Valtrex','valaciclovir'),(96,'Diovan','valsartan'),(97,'Effexor XR','venlafaxine XR'),(98,'Calan SR','verapamil SR'),(99,'Ambien','zolpidem');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `doctor_id` int unsigned NOT NULL,
  `ssn` varchar(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_doctor1_idx` (`doctor_id`),
  CONSTRAINT `fk_patient_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `patient_chk_1` CHECK ((char_length(`ssn`) <= 11)),
  CONSTRAINT `patient_chk_2` CHECK ((char_length(`state`) <= 2)),
  CONSTRAINT `patient_chk_3` CHECK ((char_length(`zip_code`) <= 10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,1,'111223333','Johnny','Walker','1969-05-09','123 Main St','San Diego','CA','92128'),(2,1,'111223333','Johnny','Walker','1969-05-09','123 Main St','San Diego','CA','92128'),(3,3,'222334444','Captain','Morgan','1993-08-22','456 Sunset Blvd','Los Angeles','CA','92006'),(4,2,'333445555','Jim','Bean','1995-03-15','789 Palm Ave','LongBeach','CA','93456'),(5,1,'444556666','Jack','Daniels','1994-11-22','147 Tulip Blvd','Chula Vista','CA','96541');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacompany`
--

DROP TABLE IF EXISTS `pharmacompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacompany` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phoneNum` varchar(14) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pharmacompany_chk_1` CHECK ((char_length(`phoneNum`) <= 14))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacompany`
--

LOCK TABLES `pharmacompany` WRITE;
/*!40000 ALTER TABLE `pharmacompany` DISABLE KEYS */;
INSERT INTO `pharmacompany` VALUES (1,'12223334444','Big Pharma'),(2,'13334445555','Small Pharma');
/*!40000 ALTER TABLE `pharmacompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacompany_makes_drug`
--

DROP TABLE IF EXISTS `pharmacompany_makes_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacompany_makes_drug` (
  `pharmaCompany_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  PRIMARY KEY (`pharmaCompany_id`,`drug_id`),
  KEY `fk_pharmaCompany_makes_drug_pharmaCompany1_idx` (`pharmaCompany_id`),
  KEY `fk_pharmaCompany_makes_drug_drug1_idx` (`drug_id`),
  CONSTRAINT `fk_pharmaCompany_makes_drug_drug1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_pharmaCompany_makes_drug_pharmaCompany1` FOREIGN KEY (`pharmaCompany_id`) REFERENCES `pharmacompany` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacompany_makes_drug`
--

LOCK TABLES `pharmacompany_makes_drug` WRITE;
/*!40000 ALTER TABLE `pharmacompany_makes_drug` DISABLE KEYS */;
INSERT INTO `pharmacompany_makes_drug` VALUES (1,1),(1,2),(1,4),(2,3),(2,5);
/*!40000 ALTER TABLE `pharmacompany_makes_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phoneNum` varchar(14) NOT NULL,
  `name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` char(2) NOT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pharmacy_chk_1` CHECK ((char_length(`phoneNum`) <= 14)),
  CONSTRAINT `pharmacy_chk_2` CHECK ((char_length(`state`) <= 2)),
  CONSTRAINT `pharmacy_chk_3` CHECK ((char_length(`zip_code`) <= 10))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'14445556666','CVS','741 Rodeo Dr','Los Angeles','CA','98521'),(2,'15556667777','CVS','987 Something St','San Diego','CA','92101');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_fills_prescription`
--

DROP TABLE IF EXISTS `pharmacy_fills_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_fills_prescription` (
  `rxNumber` int unsigned NOT NULL,
  `pharmacy_id` int unsigned NOT NULL,
  `pharmaCompany_id` int unsigned NOT NULL,
  `date` date NOT NULL,
  `is_generic_name` tinyint NOT NULL,
  PRIMARY KEY (`rxNumber`,`pharmacy_id`),
  KEY `fk_pharmacy_fills_prescription_prescription1_idx` (`rxNumber`),
  KEY `fk_pharmacy_fills_prescription_pharmacy1_idx` (`pharmacy_id`),
  KEY `fk_pharmacy_fills_prescription_pharmaCompany1_idx` (`pharmaCompany_id`),
  CONSTRAINT `fk_pharmacy_fills_prescription_pharmaCompany1` FOREIGN KEY (`pharmaCompany_id`) REFERENCES `pharmacompany` (`id`),
  CONSTRAINT `fk_pharmacy_fills_prescription_pharmacy1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`),
  CONSTRAINT `fk_pharmacy_fills_prescription_prescription1` FOREIGN KEY (`rxNumber`) REFERENCES `prescription` (`rxNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_fills_prescription`
--

LOCK TABLES `pharmacy_fills_prescription` WRITE;
/*!40000 ALTER TABLE `pharmacy_fills_prescription` DISABLE KEYS */;
INSERT INTO `pharmacy_fills_prescription` VALUES (159753987,1,1,'2023-05-07',1),(741852963,1,1,'2022-02-06',1),(753951852,2,1,'2023-04-20',1),(789147258,1,2,'2023-05-01',1),(852456369,1,1,'2023-05-06',1);
/*!40000 ALTER TABLE `pharmacy_fills_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_has_drug`
--

DROP TABLE IF EXISTS `pharmacy_has_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_has_drug` (
  `pharmacy_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `drugPrice` decimal(6,2) unsigned NOT NULL,
  PRIMARY KEY (`pharmacy_id`,`drug_id`),
  KEY `fk_pharmacy_has_drug_drug1_idx` (`drug_id`),
  KEY `fk_pharmacy_has_drug_pharmacy1_idx` (`pharmacy_id`),
  CONSTRAINT `fk_pharmacy_has_drug_drug1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_pharmacy_has_drug_pharmacy1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_has_drug`
--

LOCK TABLES `pharmacy_has_drug` WRITE;
/*!40000 ALTER TABLE `pharmacy_has_drug` DISABLE KEYS */;
INSERT INTO `pharmacy_has_drug` VALUES (1,1,24.99),(1,3,10.99),(2,2,6.99);
/*!40000 ALTER TABLE `pharmacy_has_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `rxNumber` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `doctor_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`rxNumber`),
  KEY `fk_prescription_doctor1_idx` (`doctor_id`),
  KEY `fk_prescription_patient1_idx` (`patient_id`),
  KEY `fk_prescription_drug1_idx` (`drug_id`),
  CONSTRAINT `fk_prescription_doctor1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `fk_prescription_drug1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `fk_prescription_patient1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=852456370 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (159753987,1,1,1,2,'2023-05-11'),(741852963,1,1,1,2,'2023-03-13'),(753951852,2,3,2,1,'2023-04-16'),(789147258,3,2,3,3,'2023-01-31'),(852456369,3,2,1,2,'2023-05-01');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30 19:46:03
