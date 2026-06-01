-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: bansos_desa
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `bansos`
--

DROP TABLE IF EXISTS `bansos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bansos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nama_prov` varchar(100) NOT NULL,
  `nama_kab` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `tanggungan` int NOT NULL,
  `jumlah_anak` int NOT NULL,
  `penghasilan_per_bulan` decimal(12,2) NOT NULL,
  `status_kelayakan` enum('Layak','Tidak Layak') NOT NULL,
  `alasan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bansos`
--

LOCK TABLES `bansos` WRITE;
/*!40000 ALTER TABLE `bansos` DISABLE KEYS */;
INSERT INTO `bansos` VALUES (1,'ABIDIN','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',4,3,375000.00,'Layak','Data KNN'),(2,'JUBAEDAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',5,2,225000.00,'Layak','Data KNN'),(3,'ELMINAWATI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',1,0,375000.00,'Layak','Data KNN'),(4,'BAIQ EKA ANGGRAINI','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',2,1,600000.00,'Layak','Data KNN'),(5,'RUMIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',1,0,375000.00,'Layak','Data KNN'),(6,'NIKMAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',2,0,725000.00,'Tidak Layak','Data KNN'),(7,'SUWARDI','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',5,0,600000.00,'Layak','Data KNN'),(8,'NARIMIN','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',4,1,875000.00,'Layak','Data KNN'),(9,'HAIRUNI','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',5,4,450000.00,'Layak','Data KNN'),(10,'JUMAKYAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',5,2,1425000.00,'Layak','Data KNN'),(11,'SAKNAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',1,0,600000.00,'Tidak Layak','Data KNN'),(12,'RETIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',4,2,600000.00,'Layak','Data KNN'),(13,'BAIQ MARTINI','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',4,3,975000.00,'Layak','Data KNN'),(14,'SAHRAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',3,0,600000.00,'Layak','Data KNN'),(15,'NURUL AINI','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',2,1,500000.00,'Layak','Data KNN'),(16,'MAESARAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',5,4,225000.00,'Layak','Data KNN'),(17,'LUKMAN SURYADI','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',2,1,725000.00,'Layak','Data KNN'),(18,'KARTINI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',3,0,600000.00,'Layak','Data KNN'),(19,'RIANA','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',6,3,225000.00,'Layak','Data KNN'),(20,'MISRAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',3,0,375000.00,'Layak','Data KNN'),(21,'ENDANG FITRIANI','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',4,1,375000.00,'Layak','Data KNN'),(22,'MANIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',3,0,225000.00,'Layak','Data KNN'),(23,'ANISAH','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',5,4,725000.00,'Layak','Data KNN'),(24,'FARIDAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',3,1,375000.00,'Layak','Data KNN'),(25,'MURIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',4,2,375000.00,'Layak','Data KNN'),(26,'SAHDAN','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',4,3,975000.00,'Layak','Data KNN'),(27,'SENIWATI','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',1,0,375000.00,'Layak','Data KNN'),(28,'AWANAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',6,2,225000.00,'Layak','Data KNN'),(29,'FITRIANINGSIH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',3,2,725000.00,'Layak','Data KNN'),(30,'RANI MAHARANI','NUSA TENGGARA BARAT','KOTA MATARAM','PNS',3,1,1100000.00,'Tidak Layak','Data KNN'),(31,'DENI RAMEDAN','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',1,0,600000.00,'Layak','Data KNN'),(32,'SITI JUMA INAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',5,2,750000.00,'Layak','Data KNN'),(33,'ERNAWATI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',5,2,600000.00,'Layak','Data KNN'),(34,'SARISAH','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',1,0,950000.00,'Tidak Layak','Data KNN'),(35,'SAINAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',3,2,225000.00,'Layak','Data KNN'),(36,'HARTUTI','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',1,0,1200000.00,'Tidak Layak','Data KNN'),(37,'BAIQ HERAWATI','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',3,1,225000.00,'Layak','Data KNN'),(38,'MUNISAH','NUSA TENGGARA BARAT','KOTA MATARAM','PNS',5,3,1200000.00,'Layak','Data KNN'),(39,'MURNAH','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',1,0,600000.00,'Tidak Layak','Data KNN'),(40,'SALMIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',2,1,375000.00,'Layak','Data KNN'),(41,'SAKILAWATI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',1,0,875000.00,'Tidak Layak','Data KNN'),(42,'SALATIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',4,0,825000.00,'Layak','Data KNN'),(43,'MULIANI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',1,0,600000.00,'Layak','Data KNN'),(44,'ISTIHARAH','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',1,0,600000.00,'Tidak Layak','Data KNN'),(45,'MARTIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',4,2,225000.00,'Layak','Data KNN'),(46,'SITI HAJAR','NUSA TENGGARA BARAT','KOTA MATARAM','Pegawai Tetap',3,1,1100000.00,'Tidak Layak','Data KNN'),(47,'HUDRIAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',3,1,225000.00,'Layak','Data KNN'),(48,'MAHNIM','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',6,0,375000.00,'Layak','Data KNN'),(49,'LALU RUSLAN','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',5,1,375000.00,'Layak','Data KNN'),(50,'SRI HANDAYANI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',5,1,600000.00,'Layak','Data KNN'),(51,'SAKNAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',6,1,375000.00,'Layak','Data KNN'),(52,'SURIANI','NUSA TENGGARA BARAT','KOTA MATARAM','PNS',5,1,1325000.00,'Layak','Data KNN'),(53,'SAPURAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',3,0,600000.00,'Layak','Data KNN'),(54,'MUNAWARAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',2,1,500000.00,'Layak','Data KNN'),(55,'SUMIATI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',3,1,600000.00,'Layak','Data KNN'),(56,'SARAKYAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',3,1,1100000.00,'Layak','Data KNN'),(57,'MUHIR','NUSA TENGGARA BARAT','KOTA MATARAM','Petani Kecil',2,1,600000.00,'Layak','Data KNN'),(58,'MASIAH','NUSA TENGGARA BARAT','KOTA MATARAM','PNS',1,0,1200000.00,'Tidak Layak','Data KNN'),(59,'NYAMAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pegawai Tetap',1,0,1200000.00,'Tidak Layak','Data KNN'),(60,'MISLAH','NUSA TENGGARA BARAT','KOTA MATARAM','Pedagang',1,0,1325000.00,'Tidak Layak','Data KNN'),(61,'NURHAYATI','NUSA TENGGARA BARAT','KOTA MATARAM','Pengangguran',1,0,225000.00,'Layak','Data KNN'),(62,'SAKMAH','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',2,0,600000.00,'Layak','Data KNN'),(63,'AHMAD SAHRI','NUSA TENGGARA BARAT','KOTA MATARAM','Buruh Harian',5,3,600000.00,'Layak','Data KNN');
/*!40000 ALTER TABLE `bansos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rule_id` int NOT NULL,
  `variable_name` varchar(50) NOT NULL,
  `operator` varchar(10) NOT NULL,
  `target_value` varchar(255) NOT NULL,
  `logical_operator` varchar(10) DEFAULT 'AND',
  PRIMARY KEY (`id`),
  KEY `rule_id` (`rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (1,1,'pekerjaan','IN','PNS,TNI,POLRI,BUMN','AND'),(2,2,'dtks','=','Tidak','AND'),(3,6,'tmp_status','=','SANGAT MISKIN','AND'),(4,6,'sekolah','=','Ya','AND'),(5,7,'tmp_status','=','MISKIN','AND'),(6,8,'pekerjaan','=','Tidak Kerja','AND'),(7,8,'desil','IN','5,6','AND'),(8,9,'desil','IN','7,8,9,10','AND'),(9,10,'tmp_status','=','SANGAT MISKIN','AND'),(10,10,'pekerjaan','=','Tidak Kerja','AND');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasil_prediksi`
--

DROP TABLE IF EXISTS `hasil_prediksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasil_prediksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `tanggungan` int NOT NULL,
  `jumlah_anak` int NOT NULL,
  `penghasilan_per_bulan` decimal(12,2) NOT NULL,
  `hasil_prediksi` enum('Layak','Tidak Layak') NOT NULL,
  `nilai_k` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_prediksi`
--

LOCK TABLES `hasil_prediksi` WRITE;
/*!40000 ALTER TABLE `hasil_prediksi` DISABLE KEYS */;
INSERT INTO `hasil_prediksi` VALUES (1,'nadya','Petani Kecil',5,4,600.00,'Layak',7,'2026-05-25 14:10:36'),(2,'alda ','PNS',3,1,20000000.00,'Tidak Layak',5,'2026-05-25 14:11:57'),(3,'alda ','PNS',3,1,20000000.00,'Tidak Layak',5,'2026-05-25 14:14:13');
/*!40000 ALTER TABLE `hasil_prediksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `id` int NOT NULL,
  `rule_name` varchar(100) NOT NULL,
  `priority_order` int NOT NULL,
  `conclusion_variable` varchar(50) NOT NULL,
  `conclusion_value` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (1,'Aturan Profesi Mapan',1,'rekomendasi','TIDAK LAYAK','Penerima adalah PNS, TNI, POLRI, atau BUMN yang tidak berhak menerima bantuan.'),(2,'Aturan DTKS',1,'rekomendasi','TIDAK LAYAK','Nama tidak terdaftar dalam database DTKS Kemensos.'),(6,'PKH Pendidikan',3,'rekomendasi','LAYAK TERIMA PKH PENDIDIKAN','Keluarga sangat miskin dan memiliki anak sekolah.'),(7,'Bantuan Sembako (BPNT)',3,'rekomendasi','LAYAK TERIMA BPNT','Keluarga klasifikasi Miskin berhak menerima bantuan pangan.'),(8,'BLT Dana Desa',3,'rekomendasi','LAYAK TERIMA BLT DANA DESA','Warga tidak bekerja namun tidak masuk dalam bantuan PKH/BPNT.'),(9,'Aturan Ekonomi Mampu',1,'rekomendasi','TIDAK LAYAK','Ekonomi di atas Desil 7 dianggap sudah mampu.'),(10,'PKH Lansia',3,'rekomendasi','LAYAK TERIMA PKH LANSIA','Keluarga sangat miskin dengan tanggungan lansia.');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 22:51:03 
