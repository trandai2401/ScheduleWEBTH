-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: scheduleweb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `congviec`
--

DROP TABLE IF EXISTS `congviec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congviec` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tieude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noidung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay` date NOT NULL,
  `giobatdau` time NOT NULL,
  `gioketthuc` time NOT NULL,
  `id_user` bigint unsigned NOT NULL,
  `id_danhmuc` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `congviec_id_user_foreign` (`id_user`),
  KEY `congviec_id_danhmuc_foreign` (`id_danhmuc`),
  CONSTRAINT `congviec_id_danhmuc_foreign` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id`),
  CONSTRAINT `congviec_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congviec`
--

LOCK TABLES `congviec` WRITE;
/*!40000 ALTER TABLE `congviec` DISABLE KEYS */;
INSERT INTO `congviec` VALUES (1,'Học môn Triết','Học tuần sau thi','2021-01-02','06:00:00','06:00:00',1,2,NULL,NULL),(2,'qweqwe','<p>qwerqwerqwer</p>','2021-12-01','02:00:00','03:00:00',1,1,'2021-12-24 22:24:33','2021-12-24 22:24:33'),(3,'haizzzz','<p>qwerqwerqwer</p>','2021-12-08','03:00:00','04:00:00',1,1,'2021-12-25 00:01:29','2021-12-25 00:01:29'),(4,'qwerqwer','<p>qwerqwerqer</p>','2021-12-23','14:00:00','15:00:00',1,1,'2021-12-25 00:03:25','2021-12-25 00:03:25'),(5,'qweqwe','<p>qweqwe</p>','2021-12-15','04:00:00','05:00:00',1,1,'2021-12-25 00:04:51','2021-12-25 00:04:51'),(6,'qweqwe','<p>eqweqwe</p>','2021-12-22','03:00:00','04:00:00',1,1,'2021-12-25 00:06:02','2021-12-25 00:06:02'),(7,'qwerqwer','<p>qewrqwer</p>','2021-12-21','01:00:00','02:00:00',1,1,'2021-12-25 00:07:20','2021-12-25 00:07:20'),(8,'qwerqwer','<p>qewrqwer</p>','2021-12-21','01:00:00','11:00:00',1,1,'2021-12-25 00:07:27','2021-12-25 00:07:27'),(9,'qweqwer','<p>qweqwe</p>','2021-12-20','11:00:00','12:00:00',1,1,'2021-12-25 00:08:25','2021-12-25 00:08:25'),(12,'Hoaf dieen','<p>Thuw dien</p>','2021-12-20','08:00:00','09:00:00',1,1,'2021-12-25 00:36:57','2021-12-25 00:36:57'),(13,'Hoaf dieen','<p>Thuw dien</p>','2021-12-14','06:00:00','07:00:00',1,1,'2021-12-25 00:37:15','2021-12-25 00:37:15'),(14,'Đi chơi với Hòa','<p>Haizzzzz</p>','2021-12-23','02:00:00','14:00:00',1,1,'2021-12-25 00:50:31','2021-12-25 00:50:31'),(15,'qweqwe','<p>qwerqwer</p>','2021-12-02','04:00:00','05:00:00',1,1,'2021-12-25 01:31:54','2021-12-25 01:31:54'),(16,'Hoaf dien rat nhieu','<p>qweqweqwe</p>','2021-12-25','08:00:00','09:00:00',2,2,'2021-12-25 02:07:31','2021-12-25 02:07:31'),(17,'Chửi Hòa','<p>Phải chữi thật nhiều</p>','2021-12-16','04:00:00','05:00:00',1,1,'2021-12-25 03:10:53','2021-12-25 03:10:53'),(18,'Chửi Hòa Thật nhiều','<p>phải <strong>chửi cho nên người</strong></p>','2021-12-29','06:00:00','15:00:00',1,1,'2021-12-25 03:14:54','2021-12-25 03:14:54'),(20,'Thời gian dành cho Hòa','<blockquote><p><strong>Công việc cần làm&nbsp;</strong><br>Đánh vào mông Hòa</p></blockquote>','2021-12-24','03:00:00','09:00:00',1,1,'2021-12-25 06:16:09','2021-12-25 06:16:09'),(21,'test','<p>qưeqwe</p>','2021-12-13','02:00:00','03:00:00',1,1,'2021-12-25 06:17:43','2021-12-25 06:17:43'),(25,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','09:00:00','10:00:00',2,2,'2021-12-25 08:06:01','2021-12-25 08:06:01'),(26,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','09:00:00','10:00:00',2,2,'2021-12-25 08:06:05','2021-12-25 08:06:05'),(27,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','11:00:00','12:00:00',2,2,'2021-12-25 08:06:10','2021-12-25 08:06:10'),(28,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','16:00:00','17:00:00',2,2,'2021-12-25 08:06:15','2021-12-25 08:06:15'),(29,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','01:00:00','02:00:00',2,2,'2021-12-25 08:06:32','2021-12-25 08:06:32'),(30,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-20','16:00:00','17:00:00',2,2,'2021-12-25 08:06:37','2021-12-25 08:06:37'),(31,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-20','17:00:00','18:00:00',2,2,'2021-12-25 08:06:39','2021-12-25 08:06:39'),(32,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-20','19:00:00','20:00:00',2,2,'2021-12-25 08:06:42','2021-12-25 08:06:42'),(33,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-21','19:00:00','20:00:00',2,2,'2021-12-25 08:06:44','2021-12-25 08:06:44'),(34,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-23','17:00:00','18:00:00',2,2,'2021-12-25 08:06:53','2021-12-25 08:06:53'),(35,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','17:00:00','18:00:00',2,2,'2021-12-25 08:06:55','2021-12-25 08:06:55'),(36,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-22','23:00:00','24:00:00',2,2,'2021-12-25 08:06:57','2021-12-25 08:06:57'),(37,'Học yêu ĐẠi nhiều hơn','<p>Phải biết quí trọng ảnh</p>','2021-12-24','19:00:00','20:00:00',2,2,'2021-12-25 08:06:59','2021-12-25 08:06:59'),(38,'qwerqwerqwer','<p>qwerqwer</p>','2021-12-22','03:00:00','04:00:00',1,1,'2021-12-28 22:20:04','2021-12-28 22:20:04'),(39,'rqwer','<p>ưertwert</p>','2021-12-20','03:00:00','04:00:00',1,1,'2021-12-28 23:11:16','2021-12-28 23:11:16'),(40,'rqwerưert','<p>ưertwertưertwert</p>','2021-12-20','05:00:00','06:00:00',1,1,'2021-12-28 23:11:32','2021-12-28 23:11:32'),(41,'rqwerưert','<p>ưertwertưertwert</p>','2021-12-27','03:00:00','04:00:00',1,1,'2021-12-28 23:11:51','2021-12-28 23:11:51'),(42,'rqwerưert','<p>ưertwertưertwert</p>','2021-12-29','03:00:00','04:00:00',1,1,'2021-12-28 23:12:45','2021-12-28 23:12:45'),(43,'erqrqwerqwer','<p>qwerqwerqwer</p>','2021-12-27','07:00:00','08:00:00',2,2,'2021-12-29 00:51:48','2021-12-29 00:51:48'),(44,'erqrqqwerqwerwerqwer','<p>qwerqwerqwer</p>','2021-12-28','05:00:00','13:00:00',2,2,'2021-12-29 00:51:58','2021-12-29 00:51:58'),(45,'qwerqwer','<p>qwerqwer</p>','2021-12-30','03:00:00','04:00:00',1,1,'2021-12-29 00:56:38','2021-12-29 00:56:38'),(46,'qwerqwer','<p>qwerqwer</p>','2021-12-31','03:00:00','01:00:00',1,1,'2021-12-29 00:56:57','2021-12-29 00:56:57'),(47,'qwerqwer','<p>qwrerqwer</p>','2021-12-31','05:00:00','06:00:00',1,1,'2021-12-29 00:58:21','2021-12-29 00:58:21');
/*!40000 ALTER TABLE `congviec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tieude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` VALUES (1,'Việc nhà','#34d2eb',NULL,NULL),(2,'Học tập','#2ed172',NULL,NULL);
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_resets_table',1),(9,'2019_08_19_000000_create_failed_jobs_table',1),(10,'2019_12_14_000001_create_personal_access_tokens_table',1),(11,'2021_12_24_135300_danhmuc',1),(12,'2021_12_24_135646_congviec',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taget` text COLLATE utf8mb4_unicode_ci,
  `linkanhavata` text COLLATE utf8mb4_unicode_ci,
  `sodienthoai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Trần Đại','trandai@gmail',NULL,'$2y$10$ZJIq9OZP4kVxWU46X4LUT.0O0vjb4EQE2u8//DBvDvR26BNL6Vr4G','Chinh phục cô vợ Thu Hòa','http://localhost/ScheduleWEBTH/public/image/avata1.jpg',NULL,NULL,'2021-12-24 08:05:04','2021-12-24 08:05:04'),(2,'Tăng Thị Thu Hòa','thuhoa0103@gmail.com',NULL,'$2y$10$K.4CUB1pzrs1QmZfYB7rvesmhsa25QpSWGSt/x00A3jw3JOseG.oa',NULL,NULL,NULL,NULL,'2021-12-24 08:06:25','2021-12-24 08:06:25'),(4,'DDaij','trandai2401@gmail',NULL,'$2y$10$d.zEVv7x6BUHhVqJioTggO5LX36IevuQqnK2VJNJPItfecyXOesT6',NULL,NULL,NULL,NULL,'2021-12-24 08:11:39','2021-12-24 08:11:39'),(5,'Tăng Hòa','tanghoa2401@gmail.com',NULL,'$2y$10$dWyjWoMy3me.qWSr1vPTiOqr46MfsGq6zhuDOB7qL6ebaMQkW2D9m',NULL,NULL,NULL,NULL,'2021-12-24 08:12:51','2021-12-24 08:12:51');
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

-- Dump completed on 2021-12-29 20:10:20
