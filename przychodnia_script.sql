CREATE DATABASE  IF NOT EXISTS `przychodnia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `przychodnia`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: przychodnia
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `lekarze`
--

DROP TABLE IF EXISTS `lekarze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lekarze` (
  `id_l` int NOT NULL AUTO_INCREMENT,
  `Nr_PWZ` int DEFAULT NULL,
  `specjalizacja` varchar(30) DEFAULT NULL,
  `imie` varchar(25) DEFAULT NULL,
  `nazwisko` varchar(25) DEFAULT NULL,
  `pesel` int NOT NULL,
  `Nr_sali` int DEFAULT NULL,
  `Nr_telefonu` int DEFAULT NULL,
  PRIMARY KEY (`id_l`),
  KEY `ind_nr_sali` (`Nr_sali`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logi`
--

DROP TABLE IF EXISTS `logi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logi` (
  `id_l` int unsigned NOT NULL AUTO_INCREMENT,
  `operacja` varchar(30) DEFAULT NULL,
  `czas` datetime DEFAULT NULL,
  PRIMARY KEY (`id_l`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miejsce_zamieszkania`
--

DROP TABLE IF EXISTS `miejsce_zamieszkania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miejsce_zamieszkania` (
  `id_pacjenta` int DEFAULT NULL,
  `ulica` varchar(20) DEFAULT NULL,
  `nr_domu` varchar(10) DEFAULT NULL,
  `nr_mieszkania` int DEFAULT NULL,
  `miejscowosc` varchar(20) NOT NULL,
  PRIMARY KEY (`miejscowosc`),
  KEY `id_pacjenta` (`id_pacjenta`),
  CONSTRAINT `miejsce_zamieszkania_ibfk_1` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjenci` (`id_pacjenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacjenci` (
  `id_pacjenta` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `pesel` int DEFAULT NULL,
  `telefon` int DEFAULT NULL,
  PRIMARY KEY (`id_pacjenta`),
  KEY `ind_pesel_pacjenta` (`pesel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pacjenci_AFTER_INSERT` AFTER INSERT ON `pacjenci` FOR EACH ROW BEGIN
UPDATE pacjenci
SET pacjenci.imie = CONCAT(UPPER(LEFT(pacjenci.imie, 1)), SUBSTRING(pacjenci.imie, 2));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `id_p` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(25) DEFAULT NULL,
  `stanowisko` varchar(15) DEFAULT NULL,
  `nazwisko` varchar(25) DEFAULT NULL,
  `pesel` int NOT NULL,
  PRIMARY KEY (`id_p`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recepty`
--

DROP TABLE IF EXISTS `recepty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepty` (
  `Dane_pacjenta` int DEFAULT NULL,
  `Kod_erecepty` int NOT NULL,
  `Data_wystawienia` date DEFAULT NULL,
  `Nazwa_leku` varchar(35) DEFAULT NULL,
  `Dawka` int DEFAULT NULL,
  `Ilosc` int NOT NULL,
  `id_l` int DEFAULT NULL,
  PRIMARY KEY (`Kod_erecepty`),
  KEY `Dane_pacjenta` (`Dane_pacjenta`),
  KEY `id_l` (`id_l`),
  KEY `ind_erecepta` (`Kod_erecepty`),
  CONSTRAINT `recepty_ibfk_1` FOREIGN KEY (`Dane_pacjenta`) REFERENCES `pacjenci` (`id_pacjenta`),
  CONSTRAINT `recepty_ibfk_2` FOREIGN KEY (`id_l`) REFERENCES `lekarze` (`id_l`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wizyty`
--

DROP TABLE IF EXISTS `wizyty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wizyty` (
  `id_w` int NOT NULL AUTO_INCREMENT,
  `id_p` int DEFAULT NULL,
  `data_w` datetime DEFAULT NULL,
  `id_lekarza` int DEFAULT NULL,
  PRIMARY KEY (`id_w`),
  KEY `id_p` (`id_p`),
  KEY `id_lekarza` (`id_lekarza`),
  CONSTRAINT `wizyty_ibfk_1` FOREIGN KEY (`id_p`) REFERENCES `pacjenci` (`id_pacjenta`),
  CONSTRAINT `wizyty_ibfk_2` FOREIGN KEY (`id_lekarza`) REFERENCES `lekarze` (`id_l`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `logi_wizyt_AFTER_INSERT` AFTER INSERT ON `wizyty` FOR EACH ROW BEGIN
insert into logi(operacja, czas)

VALUES ('Zapisanie wizyty', now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'przychodnia'
--

--
-- Dumping routines for database 'przychodnia'
--
/*!50003 DROP PROCEDURE IF EXISTS `DodajWizyte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DodajWizyte`(IN `konkretna_data` datetime, IN `Nazwisko_pacjenta` varchar(30), IN `nr_telefonu_pacjenta` INT(10), IN `Pesel_pacjenta` INT(11), IN `Nazwisko_lekarza` VARCHAR(25), IN `specjalizacja` VARCHAR(30))
BEGIN
DECLARE istnieje INT;
DECLARE wolna_data INT;
DECLARE id_zapisanego_pacjenta INT;
DECLARE id_lekarza INT;
SELECT EXISTS(SELECT * from pacjenci WHERE pacjenci.pesel=Pesel_pacjenta) into istnieje;
IF istnieje !=0
THEN
	SELECT EXISTS(SELECT * from wizyty WHERE wizyty.data_w=konkretna_data) into wolna_data;
	IF wolna_data !=0
    THEN
    SIGNAL SQLSTATE '45000'
	set MESSAGE_TEXT ="Ta data jest juz zajeta";
    ELSE
    SELECT pacjenci.id_pacjenta FROM pacjenci WHERE pacjenci.pesel=Pesel_pacjenta INTO id_zapisanego_pacjenta;
    SELECT lekarze.id_l FROM lekarze WHERE lekarze.nazwisko=Nazwisko_Lekarza INTO id_lekarza;
    INSERT INTO wizyty(wizyty.id_p, wizyty.data_w, wizyty.id_lekarza) VALUES(id_zapisanego_pacjenta, konkretna_data, id_lekarza);
    END IF;
ELSE
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT ="Taki pacjent nie istnieje w bazie danych";
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Dodaj_Pacjenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dodaj_Pacjenta`(IN `_imie` VARCHAR(30), IN `_nazwisko` VARCHAR(30), IN `_Pesel` INT(11), IN `nr_telefonu` INT(10), IN `_ulica` VARCHAR(20), IN `nr_domu` VARCHAR(10), IN `nr_mieszkania` INT(5), IN `miejscowosc` VARCHAR(20))
BEGIN
DECLARE _id INT;
DECLARE powtorzenie INT;
SELECT EXISTS(SELECT * from pacjenci WHERE pacjenci.pesel=_Pesel) into powtorzenie;
IF powtorzenie !=0
THEN
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT =
"Taki pacjent juz istnieje";
ELSE
INSERT INTO pacjenci(imie, nazwisko, pesel, telefon) VALUES (_imie, _nazwisko, _Pesel, nr_telefonu);
SET _id = LAST_INSERT_ID();
INSERT INTO miejsce_zamieszkania(ulica, nr_domu, miejscowosc) VALUES (_ulica, nr_domu, miejscowosc);
IF nr_mieszkania = 0
THEN
	 INSERT INTO miejsce_zamieszkania(nr_mieszkania) VALUES (nr_mieszkania);
END IF;
END IF;
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

-- Dump completed on 2022-06-09 21:41:01
