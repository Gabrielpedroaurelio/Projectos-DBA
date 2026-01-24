-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fullschool
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `id_course` int NOT NULL,
  `id_user` int NOT NULL,
  `values_avaliacao` int NOT NULL,
  `commentary` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_avaliacao`),
  KEY `id_user` (`id_user`),
  KEY `id_course` (`id_course`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id_books` int NOT NULL AUTO_INCREMENT,
  `title_book` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `editora_book` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `autor_book` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `path_book` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` int NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_books`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bought_book`
--

DROP TABLE IF EXISTS `bought_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bought_book` (
  `id_bought_book` bigint NOT NULL AUTO_INCREMENT,
  `id_books` int NOT NULL,
  `id_user` int NOT NULL,
  `date_bought` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bought_book`),
  KEY `id_user` (`id_user`),
  KEY `id_books` (`id_books`),
  CONSTRAINT `bought_book_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `bought_book_ibfk_2` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_books`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bought_course`
--

DROP TABLE IF EXISTS `bought_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bought_course` (
  `id_bought_course` int NOT NULL AUTO_INCREMENT,
  `id_course` int NOT NULL,
  `id_user` int NOT NULL,
  `pay_way` int NOT NULL,
  PRIMARY KEY (`id_bought_course`),
  KEY `id_user` (`id_user`),
  KEY `id_course` (`id_course`),
  CONSTRAINT `bought_course_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `bought_course_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `title_content` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img_content` text COLLATE utf8mb4_general_ci,
  `id_course` int NOT NULL,
  `video_path` text COLLATE utf8mb4_general_ci,
  `order_content` int DEFAULT '1',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_content`),
  KEY `id_course` (`id_course`),
  CONSTRAINT `content_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id_course` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `information` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` int NOT NULL,
  `workload_curso` int NOT NULL,
  `price_course` decimal(10,2) NOT NULL,
  `id_category` int NOT NULL,
  `status_couse` enum('Activo','Inativo') COLLATE utf8mb4_general_ci DEFAULT 'Activo',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_course`),
  KEY `id_user` (`id_user`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `table_historico` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tuple` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action_historico` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_before` text COLLATE utf8mb4_general_ci,
  `data_after` text COLLATE utf8mb4_general_ci,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_history`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_login`
--

DROP TABLE IF EXISTS `history_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_login` (
  `id_history_login` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `login_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `logout_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_history_login`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `history_login_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id_notification` bigint NOT NULL AUTO_INCREMENT,
  `id_course` int NOT NULL,
  `content_notification` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_notification`),
  KEY `id_course` (`id_course`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_level`
--

DROP TABLE IF EXISTS `permission_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_level` (
  `id_permission_level` int NOT NULL AUTO_INCREMENT,
  `permission_level_description` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_permission_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission_level_user`
--

DROP TABLE IF EXISTS `permission_level_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_level_user` (
  `id_permission_level_user` bigint NOT NULL AUTO_INCREMENT,
  `id_permission_level` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_permission_level_user`),
  KEY `id_permission_level` (`id_permission_level`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `permission_level_user_ibfk_1` FOREIGN KEY (`id_permission_level`) REFERENCES `permission_level` (`id_permission_level`),
  CONSTRAINT `permission_level_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email_user` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `descrition_user` text COLLATE utf8mb4_general_ci NOT NULL,
  `password_user` text COLLATE utf8mb4_general_ci,
  `phone_number_user` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_user` text COLLATE utf8mb4_general_ci,
  `type_user` enum('Estudante','Administrador','Professor') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_course` (
  `id_user_course` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_course` int NOT NULL,
  `progress_course` int NOT NULL DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_course`),
  KEY `id_user` (`id_user`),
  KEY `id_course` (`id_course`),
  CONSTRAINT `user_course_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `user_course_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_books`
--

DROP TABLE IF EXISTS `vw_books`;
/*!50001 DROP VIEW IF EXISTS `vw_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_books` AS SELECT 
 1 AS `title_book`,
 1 AS `editora_book`,
 1 AS `autor_book`,
 1 AS `path_book`,
 1 AS `name_user`,
 1 AS `create_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_history_login`
--

DROP TABLE IF EXISTS `vw_history_login`;
/*!50001 DROP VIEW IF EXISTS `vw_history_login`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_history_login` AS SELECT 
 1 AS `usuario`,
 1 AS `entrada`,
 1 AS `saida`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_books`
--

/*!50001 DROP VIEW IF EXISTS `vw_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_books` AS select `books`.`title_book` AS `title_book`,`books`.`editora_book` AS `editora_book`,`books`.`autor_book` AS `autor_book`,`books`.`path_book` AS `path_book`,concat(`user`.`name_user`,' ',`user`.`last_name_user`) AS `name_user`,`books`.`create_at` AS `create_at` from (`books` join `user` on((`user`.`id_user` = `books`.`id_user`))) order by `books`.`title_book` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_history_login`
--

/*!50001 DROP VIEW IF EXISTS `vw_history_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Gabriel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_history_login` AS select concat(`user`.`name_user`,' ',`user`.`last_name_user`) AS `usuario`,`history_login`.`login_date` AS `entrada`,`history_login`.`logout_date` AS `saida` from (`history_login` join `user` on((`user`.`id_user` = `history_login`.`id_user`))) order by `history_login`.`id_history_login` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-24  2:15:31
