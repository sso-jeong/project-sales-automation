-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sfa
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `approval_tbl`
--

DROP TABLE IF EXISTS `approval_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_tbl` (
  `aprnum` int NOT NULL,
  `aprform` char(1) NOT NULL,
  `aprcategory` char(1) NOT NULL,
  `aprsinggubun` char(1) NOT NULL,
  `aprtitle` varchar(20) NOT NULL,
  `contents` text,
  `aprdate` date NOT NULL,
  `attdatnum` varchar(30) DEFAULT NULL,
  `attdatexfile` varchar(10) DEFAULT NULL,
  `empid` varchar(10) NOT NULL,
  `deptid` char(3) NOT NULL,
  `grade` char(3) NOT NULL,
  `empnm` varchar(14) NOT NULL,
  `reason` varchar(20) DEFAULT NULL,
  `reasonchk` char(1) DEFAULT NULL,
  `stadate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `fileregdate` date DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`aprnum`),
  KEY `empid` (`empid`),
  KEY `attdatnum` (`attdatnum`),
  CONSTRAINT `approval_tbl_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `emp_tbl` (`empid`),
  CONSTRAINT `approval_tbl_ibfk_2` FOREIGN KEY (`attdatnum`) REFERENCES `attach_tbl` (`attdatnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_tbl`
--

LOCK TABLES `approval_tbl` WRITE;
/*!40000 ALTER TABLE `approval_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attach_tbl`
--

DROP TABLE IF EXISTS `attach_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attach_tbl` (
  `attdatnum` varchar(30) NOT NULL,
  `attnm` varchar(100) DEFAULT NULL,
  `attsize` varchar(30) DEFAULT NULL,
  `attorinm` varchar(300) DEFAULT NULL,
  `attdate` datetime DEFAULT NULL,
  PRIMARY KEY (`attdatnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attach_tbl`
--

LOCK TABLES `attach_tbl` WRITE;
/*!40000 ALTER TABLE `attach_tbl` DISABLE KEYS */;
INSERT INTO `attach_tbl` VALUES ('test','','','','2020-10-08 00:00:00');
/*!40000 ALTER TABLE `attach_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buseo_tbl`
--

DROP TABLE IF EXISTS `buseo_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buseo_tbl` (
  `buseo_id` varchar(5) NOT NULL,
  `buseo_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buseo_tbl`
--

LOCK TABLES `buseo_tbl` WRITE;
/*!40000 ALTER TABLE `buseo_tbl` DISABLE KEYS */;
INSERT INTO `buseo_tbl` VALUES ('100','인사총무부'),('200','영업부');
/*!40000 ALTER TABLE `buseo_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comcode`
--

DROP TABLE IF EXISTS `comcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comcode` (
  `grpcd` char(2) DEFAULT NULL,
  `grpnm` varchar(30) DEFAULT NULL,
  `divcd` char(2) DEFAULT NULL,
  `divnm` varchar(30) DEFAULT NULL,
  `typecd` char(2) DEFAULT NULL,
  `typenm` varchar(30) DEFAULT NULL,
  `dttypecd` char(2) DEFAULT NULL,
  `dttypenm` varchar(30) DEFAULT NULL,
  `stktypecd` char(2) DEFAULT NULL,
  `stktypenm` varchar(30) DEFAULT NULL,
  `gendercd` char(2) DEFAULT NULL,
  `gendernm` varchar(30) DEFAULT NULL,
  `chacd` char(2) DEFAULT NULL,
  `chanm` varchar(30) DEFAULT NULL,
  `milicd` char(2) DEFAULT NULL,
  `milinm` varchar(30) DEFAULT NULL,
  `impcd` char(2) DEFAULT NULL,
  `impnm` varchar(30) DEFAULT NULL,
  `patrcd` char(2) DEFAULT NULL,
  `patrnm` varchar(30) DEFAULT NULL,
  `relicd` char(30) DEFAULT NULL,
  `relinm` varchar(30) DEFAULT NULL,
  `marcd` char(2) DEFAULT NULL,
  `marnm` varchar(30) DEFAULT NULL,
  `dlcd` char(2) DEFAULT NULL,
  `dlnm` varchar(30) DEFAULT NULL,
  `hucd` char(2) DEFAULT NULL,
  `hunm` varchar(30) DEFAULT NULL,
  `paycd` char(2) DEFAULT NULL,
  `paynm` varchar(30) DEFAULT NULL,
  `cacd` char(2) DEFAULT NULL,
  `canm` varchar(30) DEFAULT NULL,
  `datgrpcd` char(2) DEFAULT NULL,
  `datgrpnm` varchar(30) DEFAULT NULL,
  `aprformcd` char(2) DEFAULT NULL,
  `aprformnm` varchar(30) DEFAULT NULL,
  `aprcacd` char(2) DEFAULT NULL,
  `aprcanm` varchar(30) DEFAULT NULL,
  `aprsingcd` char(2) DEFAULT NULL,
  `aprsingnm` varchar(30) DEFAULT NULL,
  `reasoncd` char(2) DEFAULT NULL,
  `reasonnm` varchar(30) DEFAULT NULL,
  `birttypenm` varchar(20) DEFAULT NULL,
  `birttypecd` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comcode`
--

LOCK TABLES `comcode` WRITE;
/*!40000 ALTER TABLE `comcode` DISABLE KEYS */;
INSERT INTO `comcode` VALUES ('A','고무','A','제품','A','제조업','A','제조','A','생산입고','A','남자','A','공개채용','A','병역무관','A','대상','A','대상','A','무교','A','미혼','A','내근','A','급여','A','월급직','A','공지사항','A','일반공지','A','업무','A','일반','A','결재진행중','A','사용중','양력','A'),('B','플라스틱','B','상품','B','운수업','B','도금','B','반품입고','B','여자','B','수시채용','B','병역필','B','비대상','B','비대상','B','불교','B','기혼','B','외근','B','상여','B','일반직','B','일반글','B','영업공지','B','연차','B','긴급','B','결재완료','B','완료','음력','B'),('C','기계','C','반제품','C','광업','C','기타','C','판매출고','C','미정','C','특별채용','C','병역미필','C',NULL,'C',NULL,'C','기독교','C',NULL,'C','휴가','C','특별상여','C','시간직','C',NULL,'C','인사공지','C','수주','C',NULL,'C',NULL,'C',NULL,NULL,'C'),('D','금속','D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D','천주교','D',NULL,'D','오전반차','D','연월차','D',NULL,'D',NULL,'D',NULL,'D','판매','D',NULL,'D',NULL,'D',NULL,NULL,'D'),('E','비금속','E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E','기타','E',NULL,'E','오후반차','E','그외','E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,NULL,'E'),('F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,NULL,'F'),('G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,NULL,'G'),('H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,NULL,'H'),('I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,NULL,'I');
/*!40000 ALTER TABLE `comcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_tbl`
--

DROP TABLE IF EXISTS `company_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_tbl` (
  `comcd` varchar(10) NOT NULL,
  `comnm` varchar(50) NOT NULL,
  `reprenm` varchar(10) NOT NULL,
  `type` varchar(2) NOT NULL,
  `dttype` varchar(2) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `tel` varchar(13) NOT NULL,
  `fax` varchar(13) DEFAULT NULL,
  `homepg` varchar(50) DEFAULT NULL,
  `customer` varchar(10) DEFAULT NULL,
  `custtel` varchar(13) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`comcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_tbl`
--

LOCK TABLES `company_tbl` WRITE;
/*!40000 ALTER TABLE `company_tbl` DISABLE KEYS */;
INSERT INTO `company_tbl` VALUES ('CA001','(주)부산철강',' 오규석','A','A','부산광역시 강서구 송정길 29 (우)46753','051-325-1131','051-325-1132','http://www.busansteel.co.kr','김기문','010-1234-5678','담당자 추가',NULL,'관리자','2020-11-17 16:19:47');
/*!40000 ALTER TABLE `company_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dl_tbl`
--

DROP TABLE IF EXISTS `dl_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dl_tbl` (
  `dlnum` int NOT NULL,
  `empid` varchar(10) NOT NULL,
  `dlgubun` char(1) NOT NULL,
  `dldate` date NOT NULL,
  `ontime` time DEFAULT NULL,
  `offtime` time DEFAULT NULL,
  `extime` time DEFAULT (_euckr'00:00'),
  `tottime` time DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`dlnum`),
  KEY `empid` (`empid`),
  CONSTRAINT `dl_tbl_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `emp_tbl` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dl_tbl`
--

LOCK TABLES `dl_tbl` WRITE;
/*!40000 ALTER TABLE `dl_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `dl_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_tbl`
--

DROP TABLE IF EXISTS `emp_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_tbl` (
  `empid` varchar(10) NOT NULL,
  `deptid` char(3) NOT NULL,
  `grade` char(3) NOT NULL,
  `empauth` char(1) NOT NULL DEFAULT 'N',
  `empnm` varchar(14) NOT NULL,
  `emppwd` varchar(14) NOT NULL,
  `gender` char(1) DEFAULT 'C',
  `birth` char(10) DEFAULT '1900-00-00',
  `birthtype` char(1) DEFAULT 'A',
  `regnum` varchar(14) DEFAULT '000000-0000000',
  `empaddr` varchar(50) DEFAULT NULL,
  `emphp` varchar(12) DEFAULT '01000000000',
  `empcp` varchar(12) DEFAULT '07000000000',
  `email` varchar(25) NOT NULL,
  `accountnum` varchar(20) DEFAULT NULL,
  `hope` varchar(10) DEFAULT NULL,
  `licence` varchar(20) DEFAULT NULL,
  `hobby` varchar(20) DEFAULT NULL,
  `forte` varchar(20) DEFAULT NULL,
  `chagubun` char(1) DEFAULT NULL,
  `miligubun` char(1) DEFAULT NULL,
  `impediment` char(1) DEFAULT NULL,
  `patriotism` char(1) DEFAULT NULL,
  `religion` char(1) DEFAULT NULL,
  `marrygubun` char(1) DEFAULT NULL,
  `linguistic` varchar(20) DEFAULT NULL,
  `reward` varchar(20) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `attdatnum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`empid`),
  KEY `attdatnum` (`attdatnum`),
  CONSTRAINT `emp_tbl_ibfk_1` FOREIGN KEY (`attdatnum`) REFERENCES `attach_tbl` (`attdatnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_tbl`
--

LOCK TABLES `emp_tbl` WRITE;
/*!40000 ALTER TABLE `emp_tbl` DISABLE KEYS */;
INSERT INTO `emp_tbl` VALUES ('2020100001','100','1','Y','서민환','1','A','19900301','A','900301-1000000','부산광역시 기장군 정관면 산단1로 66-89 (영진산업)','01012345678','01012345678','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-01',1,'admin','2020-11-13 00:00:00','test'),('2020100002','100','2','Y','김두형','1','A','19890303','A','890303-1000000','부산광역시 기장군 정관면 산단1로 66-89 (영진산업)','01012345679','01012345679','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-02',1,'admin','2020-11-13 00:00:00','test'),('2020100003','100','3','Y','서정근','1','A','19880304','A','880304-1000000','부산광역시 강서구 녹산산업북로313번길 62 (송정동)','01012345680','01012345680','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-03',1,'admin','2020-11-13 00:00:00','test'),('2020100004','100','4','Y','신영현','1','A','19870305','A','870305-1000000','부산광역시 금정구 삼어로 223 (금사동, 진보금속공업(주))','01012345681','01012345681','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-04',1,'admin','2020-11-13 00:00:00','test'),('2020100005','100','5','Y','이주희','1','A','19860306','A','860306-1000000','부산광역시 사상구 학감대로192번길 69 (학장동)','01012345682','01012345682','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-05',1,'admin','2020-11-13 00:00:00','test'),('2020100006','100','6','Y','김성대','1','A','19850307','A','850307-1000000','부산광역시 사하구 다산로105번길 61 (다대동)','01012345683','01012345683','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-06',1,'admin','2020-11-13 00:00:00','test'),('2020100007','100','1','Y','김선주','1','A','19840308','A','840308-1000000','부산광역시 강서구 범방2로 48 (범방동)','01012345684','01012345684','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-07',1,'admin','2020-11-13 00:00:00','test'),('2020100008','100','2','Y','최유정','1','A','19830309','A','830309-1000000','부산광역시 사상구 학감대로192번길 79 (학장동)','01012345685','01012345685','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-08',1,'admin','2020-11-13 00:00:00','test'),('2020100009','100','3','Y','정숙정','1','A','19820310','A','820310-1000000','부산광역시 기장군 정관면 산단3로 55','01012345686','01012345686','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-09',1,'admin','2020-11-13 00:00:00','test'),('2020100010','100','4','Y','최경민','1','B','19810311','A','810311-2000000','부산광역시 사상구 학감대로252번길 62 (주례동, 태영정밀)','01012345687','01012345687','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-10',1,'admin','2020-11-13 00:00:00','test'),('2020100011','100','1','Y','김희연','1','A','19870704','A','870704-1000000','부산광역시 사상구 사상로478번길 22 (모라동)','01012345702','01012345702','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-25',1,'admin','2020-11-13 00:00:00','test'),('2020100012','100','2','Y','이윤혜','1','A','19860705','A','860705-1000000','부산광역시 사상구 낙동대로1348번길 55 (삼락동)','01012345703','01012345703','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-26',1,'admin','2020-11-13 00:00:00','test'),('2020100013','100','3','Y','송하권','1','A','19850706','A','850706-1000000','부산광역시 기장군 정관읍 산단5로 76-45','01012345704','01012345704','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-27',1,'admin','2020-11-13 00:00:00','test'),('2020100014','100','4','Y','김계옥','1','A','19840707','A','840707-1000000','부산광역시 사상구 가야대로 7 (감전동, 정선엔지니어링)','01012345705','01012345705','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-28',1,'admin','2020-11-13 00:00:00','test'),('2020100015','100','5','Y','김봉환','1','A','19830708','A','830708-1000000','부산광역시 강서구 녹산산업중로 36 (송정동)','01012345706','01012345706','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-29',1,'admin','2020-11-13 00:00:00','test'),('2020100016','100','6','Y','김서현','1','A','19820709','A','820709-1000000','부산광역시 부산진구 성지로137번길 92, 지하1층 (초읍동)','01012345707','01012345707','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-30',1,'admin','2020-11-13 00:00:00','test'),('2020100017','100','1','Y','신은혜','1','A','19810710','A','810710-1000000','부산광역시 사하구 장림번영로103번길 25 (장림동)','01012345708','01012345708','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-01',1,'admin','2020-11-13 00:00:00','test'),('2020100018','100','2','Y','손승윤','1','A','19800711','A','800711-1000000','부산광역시 강서구 가달1로 77 (생곡동)','01012345709','01012345709','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-02',1,'admin','2020-11-13 00:00:00','test'),('2020100019','100','3','Y','임종걸','1','A','19790712','A','790712-1000000','부산광역시 강서구 대저중앙로348번길 24-8 (대저1동)','01012345710','01012345710','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-03',1,'admin','2020-11-13 00:00:00','test'),('2020100020','100','4','Y','차승연','1','A','19780713','A','780713-1000000','부산광역시 영도구 해양로 33-10 (청학동)','01012345711','01012345711','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-04',1,'admin','2020-11-13 00:00:00','test'),('2020100021','100','5','Y','이황우','1','A','19770714','A','770714-1000000','부산광역시 영도구 남항남로31번길 12 (남항동3가)','01012345712','01012345712','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-05',1,'admin','2020-11-13 00:00:00','test'),('2020100022','100','6','Y','김광홍','1','A','19760715','A','760715-1000000','부산광역시 사상구 가야대로11번길 7-7 (감전동)','01012345713','01012345713','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-06',1,'admin','2020-11-13 00:00:00','test'),('2020100023','100','1','Y','김영린','1','A','19750716','A','760316-2000000','부산광역시 사상구 학감대로222번길 34 (감전동)','01012345714','01012345714','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-07',1,'admin','2020-11-13 00:00:00','test'),('2020100024','100','2','Y','김주영','1','A','19740717','A','740717-1000000','부산광역시 강서구 대저중앙로 314-4 (대저1동)','01012345715','01012345715','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-08',1,'admin','2020-11-13 00:00:00','test'),('2020100025','100','3','Y','이명규','1','A','19730718','A','730718-1000000','부산광역시 강서구 낙동북로125번길 92-1 (강동동)','01012345716','01012345716','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-09',1,'admin','2020-11-13 00:00:00','test'),('2020100026','100','4','Y','이정덕','1','B','19720719','A','720719-2000000','부산광역시 사상구 낙동대로1412번길 80 (삼락동)','01012345717','01012345717','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-10',1,'admin','2020-11-13 00:00:00','test'),('2020100027','100','5','Y','하동구','1','B','19710720','A','710720-2000000','부산광역시 사상구 모덕로 48, 2층 (삼락동)','01012345718','01012345718','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-11',1,'admin','2020-11-13 00:00:00','test'),('2020200001','200','5','Y','이승영','1','B','19800312','A','800312-2000000','부산광역시 중구 복병산길6번길 15-1 (대청동1가)','01012345688','01012345688','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-11',1,'admin','2020-11-13 00:00:00','test'),('2020200002','200','6','Y','이창민','1','B','19790313','A','790313-2000000','부산광역시 사상구 새벽시장로 92-10 (감전동)','01012345689','01012345689','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-12',1,'admin','2020-11-13 00:00:00','test'),('2020200003','200','1','Y','김태임','1','B','19780314','A','780314-2000000','부산광역시 강서구 녹산산단261로87번길 19 (송정동)','01012345690','01012345690','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-13',1,'admin','2020-11-13 00:00:00','test'),('2020200004','200','2','Y','권예슬','1','B','19770315','A','770315-2000000','부산광역시 기장군 기장읍 차성로436번길 8,  대영상가 B 201','01012345691','01012345691','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-14',1,'admin','2020-11-13 00:00:00','test'),('2020200005','200','3','Y','김희태','1','B','19760316','A','760316-2000000','부산광역시 강서구 녹산산단261로 78 (송정동)','01012345692','01012345692','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-15',1,'admin','2020-11-13 00:00:00','test'),('2020200006','200','4','Y','이소정','1','B','19750317','A','750317-2000000','부산광역시 강서구 대저중앙로348번길 15-2 (대저1동)','01012345693','01012345693','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-16',1,'admin','2020-11-13 00:00:00','test'),('2020200007','200','5','Y','노문환','1','B','19740318','A','740318-2000000','부산광역시 사하구 구평로 19-1 (구평동)','01012345694','01012345694','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-17',1,'admin','2020-11-13 00:00:00','test'),('2020200008','200','6','Y','김순희','1','B','19730319','A','730319-2000000','부산광역시 영도구 해양로176번길 14 (청학동)','01012345695','01012345695','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-18',1,'admin','2020-11-13 00:00:00','test'),('2020200009','200','1','Y','안경진','1','A','19720320','A','720320-1000000','부산광역시 기장군 정관읍 산단4로 8-27 (우창화학(주))','01012345696','01012345696','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-19',1,'admin','2020-11-13 00:00:00','test'),('2020200010','200','2','Y','김학기','1','A','19710321','A','710321-1000000','부산광역시 강서구 녹산산단261로59번길 20 (송정동)','01012345697','01012345697','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-20',1,'admin','2020-11-13 00:00:00','test'),('2020200011','200','3','Y','남현수','1','A','19700322','A','700322-1000000','부산광역시 강서구 녹산산단382로60번길 32 (송정동)','01012345698','01012345698','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-21',1,'admin','2020-11-13 00:00:00','test'),('2020200012','200','4','Y','권세남','1','A','19900701','A','900701-1000000','부산광역시 강서구 대저중앙로 360-1 (대저1동)','01012345699','01012345699','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-22',1,'admin','2020-11-13 00:00:00','test'),('2020200013','200','5','Y','손우락','1','A','19890702','A','890702-1000000','부산광역시 사상구 학장로135번길 85 (학장동)','01012345700','01012345700','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-23',1,'admin','2020-11-13 00:00:00','test'),('2020200014','200','6','Y','윤준영','1','A','19880703','A','880703-1000000','부산광역시 강서구 가달1로 53 (생곡동)','01012345701','01012345701','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-24',1,'admin','2020-11-13 00:00:00','test'),('2020200015','200','6','Y','신상원','1','B','19700721','A','700721-2000000','부산광역시 사하구 장림번영로84번길 34 (장림동)','01012345719','01012345719','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-12',1,'admin','2020-11-13 00:00:00','test'),('2020200016','200','1','Y','박윤용','1','B','19690722','A','690722-2000000','부산광역시 강서구 가리새1로25번길 24 (생곡동)','01012345720','01012345720','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-13',1,'admin','2020-11-13 00:00:00','test'),('2020200017','200','1','Y','유신','1','B','19680723','A','680723-2000000','부산광역시 강서구 녹산산단261로74번길 20 (송정동)','01012345721','01012345721','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-14',1,'admin','2020-11-13 00:00:00','test'),('2020200018','200','2','Y','백봉욱','1','B','19670724','A','670724-2000000','부산광역시 사하구 하신중앙로27번길 17, 에이스밀 3층 301 (장림동)','01012345722','01012345722','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-15',1,'admin','2020-11-13 00:00:00','test'),('2020200019','200','3','Y','김영휘','1','B','19660725','A','660725-2000000','부산광역시 사하구 장평로83번길 28 (장림동)','01012345723','01012345723','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-16',1,'admin','2020-11-13 00:00:00','test'),('2020200020','200','4','Y','김은실','1','B','19650726','A','650726-2000000','부산광역시 강서구 생곡산단2로11번길 38 (생곡동)','01012345724','01012345724','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-17',1,'admin','2020-11-13 00:00:00','test'),('2020200021','200','5','Y','정진영','1','B','19640727','A','640727-2000000','부산광역시 강서구 신호산단3로88번길 54 (신호동)','01012345725','01012345725','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-18',1,'admin','2020-11-13 00:00:00','test'),('2020200022','200','6','Y','권영창','1','B','19630728','A','630728-2000000','부산광역시 영도구 해양로123번길 23 (청학동)','01012345726','01012345726','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-19',1,'admin','2020-11-13 00:00:00','test'),('admin','100','777','Y','관리자','admin','','','','','','','','admin@sfa.com','','','','','','','','','','','','','','2020-10-08',0,'','2020-10-08 00:00:00','test');
/*!40000 ALTER TABLE `emp_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_tbl`
--

DROP TABLE IF EXISTS `grade_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_tbl` (
  `grade_id` varchar(2) NOT NULL,
  `grade_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_tbl`
--

LOCK TABLES `grade_tbl` WRITE;
/*!40000 ALTER TABLE `grade_tbl` DISABLE KEYS */;
INSERT INTO `grade_tbl` VALUES ('6','부장'),('5','팀장'),('4','과장'),('3','대리'),('2','주임'),('1','사원');
/*!40000 ALTER TABLE `grade_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hu_tbl`
--

DROP TABLE IF EXISTS `hu_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hu_tbl` (
  `hunum` int NOT NULL,
  `hugubun` char(1) NOT NULL DEFAULT (_euckr'a'),
  `paygubun` char(1) NOT NULL DEFAULT (_euckr'a'),
  `paynm` varchar(10) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `hustdate` date NOT NULL,
  `huenddate` date NOT NULL,
  `payya` int DEFAULT NULL,
  `payhu` int DEFAULT NULL,
  `payyeon` int DEFAULT NULL,
  `paygi` int DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `totpay` int DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`hunum`),
  KEY `empid` (`empid`),
  CONSTRAINT `hu_tbl_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `emp_tbl` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hu_tbl`
--

LOCK TABLES `hu_tbl` WRITE;
/*!40000 ALTER TABLE `hu_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `hu_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_tbl`
--

DROP TABLE IF EXISTS `item_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_tbl` (
  `itemcd` varchar(10) NOT NULL,
  `itemnm` varchar(50) NOT NULL,
  `itemdiv` varchar(2) NOT NULL,
  `itemgrp` varchar(2) NOT NULL,
  `price` int DEFAULT '0',
  `std` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `attdatnum` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`itemcd`),
  KEY `attdatnum` (`attdatnum`),
  CONSTRAINT `item_tbl_ibfk_1` FOREIGN KEY (`attdatnum`) REFERENCES `attach_tbl` (`attdatnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_tbl`
--

LOCK TABLES `item_tbl` WRITE;
/*!40000 ALTER TABLE `item_tbl` DISABLE KEYS */;
INSERT INTO `item_tbl` VALUES ('AA20201101','1','A','A',1,'1','1',NULL,'관리자','2020-11-17 14:03:03',NULL),('AA20201201','타이어','A','A',50000,'10파이','',NULL,'관리자','2020-12-07 21:46:05',NULL),('AD20201201','은','A','D',100000,'1kg','',NULL,'관리자','2020-12-07 22:07:46',NULL),('BE20201101','다이아몬드','B','E',1000,'1C','1C',NULL,'관리자','2020-11-18 18:55:24',NULL),('CC20201201','반도체','C','C',10000,'','',NULL,'관리자','2020-12-10 20:50:12',NULL),('CD20201201','구리','C','D',100,'1CU','1CU',NULL,'관리자','2020-12-02 21:07:49',NULL),('CD20201202','철','C','D',100000,'1kg','',NULL,'관리자','2020-12-07 22:06:34',NULL);
/*!40000 ALTER TABLE `item_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_auth`
--

DROP TABLE IF EXISTS `notice_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_auth` (
  `grpnum` varchar(10) NOT NULL,
  `grpnm` varchar(30) NOT NULL,
  `grpman` char(10) NOT NULL,
  `readauth` int DEFAULT '0',
  `writeauth` int DEFAULT '0',
  `commauth` int DEFAULT '0',
  `downauth` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_auth`
--

LOCK TABLES `notice_auth` WRITE;
/*!40000 ALTER TABLE `notice_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_tbl`
--

DROP TABLE IF EXISTS `notice_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_tbl` (
  `datnum` varchar(10) NOT NULL,
  `category` char(2) NOT NULL,
  `datgrp` char(2) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sctchk` char(1) NOT NULL,
  `contents` text,
  `person` varchar(10) NOT NULL,
  `attdatnum` varchar(30) DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`datnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_tbl`
--

LOCK TABLES `notice_tbl` WRITE;
/*!40000 ALTER TABLE `notice_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tbl`
--

DROP TABLE IF EXISTS `order_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tbl` (
  `ordnum` varchar(11) NOT NULL,
  `orddt` varchar(10) NOT NULL,
  `dlvdt` varchar(10) DEFAULT NULL,
  `itemcd` varchar(10) NOT NULL,
  `comcd` varchar(10) NOT NULL,
  `projectnm` varchar(30) DEFAULT NULL,
  `ordperson` varchar(10) DEFAULT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ordnum`),
  KEY `itemcd` (`itemcd`),
  CONSTRAINT `order_tbl_ibfk_1` FOREIGN KEY (`itemcd`) REFERENCES `item_tbl` (`itemcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tbl`
--

LOCK TABLES `order_tbl` WRITE;
/*!40000 ALTER TABLE `order_tbl` DISABLE KEYS */;
INSERT INTO `order_tbl` VALUES ('20201119001','2020-11-19','2020-11-20','AA20201101','CA001','프로젝트2','관리자',5,5000,'테스트3',NULL,NULL,'2020-11-19 19:07:04'),('20201202001','2020-12-02','2020-12-31','CD20201201','ca001','','관리자',500,50000,'',NULL,NULL,'2020-12-02 21:09:08'),('20201202002','2020-12-02','2020-12-27','BE20201101','ca001','','관리자',1000,1000000,'주의요망',NULL,NULL,'2020-12-02 21:09:34'),('20201207001','2020-12-07','','AD20201201','CA001','','관리자',10,1000000,'',NULL,NULL,'2020-12-07 22:40:34');
/*!40000 ALTER TABLE `order_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_tbl`
--

DROP TABLE IF EXISTS `sale_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_tbl` (
  `salenum` varchar(11) NOT NULL,
  `saledt` varchar(10) NOT NULL,
  `ordnum` varchar(11) NOT NULL,
  `itemcd` varchar(10) NOT NULL,
  `comcd` varchar(10) NOT NULL,
  `projectnm` varchar(30) DEFAULT NULL,
  `saleperson` varchar(10) DEFAULT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`salenum`),
  KEY `ordnum` (`ordnum`),
  CONSTRAINT `sale_tbl_ibfk_1` FOREIGN KEY (`ordnum`) REFERENCES `order_tbl` (`ordnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_tbl`
--

LOCK TABLES `sale_tbl` WRITE;
/*!40000 ALTER TABLE `sale_tbl` DISABLE KEYS */;
INSERT INTO `sale_tbl` VALUES ('20201202001','2020-12-02','20201119001','AA20201101','CA001','','관리자',0,0,'',NULL,NULL,'2020-12-02 13:08:49'),('20201207001','2020-12-07','20201207001','AD20201201','CA001','','관리자',10,1000000,'',NULL,NULL,'2020-12-07 22:41:08');
/*!40000 ALTER TABLE `sale_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_tbl`
--

DROP TABLE IF EXISTS `stock_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_tbl` (
  `itemcd` varchar(20) NOT NULL,
  `itemnm` varchar(20) DEFAULT NULL,
  `std` varchar(50) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `attdatnum` varchar(100) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`itemcd`),
  KEY `attdatnum` (`attdatnum`),
  CONSTRAINT `stock_tbl_ibfk_1` FOREIGN KEY (`itemcd`) REFERENCES `item_tbl` (`itemcd`),
  CONSTRAINT `stock_tbl_ibfk_2` FOREIGN KEY (`attdatnum`) REFERENCES `attach_tbl` (`attdatnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_tbl`
--

LOCK TABLES `stock_tbl` WRITE;
/*!40000 ALTER TABLE `stock_tbl` DISABLE KEYS */;
INSERT INTO `stock_tbl` VALUES ('AD20201201','은','1kg',0,NULL,NULL),('CC20201201','반도체','',0,NULL,'2020-12-10 20:50:12');
/*!40000 ALTER TABLE `stock_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockinfo_tbl`
--

DROP TABLE IF EXISTS `stockinfo_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockinfo_tbl` (
  `itemcd` varchar(20) NOT NULL,
  `seq` int NOT NULL,
  `type` char(2) NOT NULL,
  `indt` datetime DEFAULT NULL,
  `outdt` datetime DEFAULT NULL,
  `inqty` int DEFAULT '0',
  `outqty` int DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`itemcd`,`seq`),
  CONSTRAINT `stockinfo_tbl_ibfk_1` FOREIGN KEY (`itemcd`) REFERENCES `stock_tbl` (`itemcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockinfo_tbl`
--

LOCK TABLES `stockinfo_tbl` WRITE;
/*!40000 ALTER TABLE `stockinfo_tbl` DISABLE KEYS */;
INSERT INTO `stockinfo_tbl` VALUES ('AD20201201',1,'C',NULL,'2020-12-07 00:00:00',0,10,NULL,NULL,'2020-12-07 22:41:08'),('CC20201201',0,'D',NULL,NULL,0,0,NULL,NULL,'2020-12-10 20:50:12');
/*!40000 ALTER TABLE `stockinfo_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_tbl`
--

DROP TABLE IF EXISTS `todo_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todo_tbl` (
  `todonum` int NOT NULL AUTO_INCREMENT,
  `todo` varchar(100) DEFAULT NULL,
  `empid` varchar(10) NOT NULL,
  `todoyn` varchar(1) DEFAULT NULL,
  `strdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`todonum`),
  KEY `empid` (`empid`),
  CONSTRAINT `todo_tbl_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `emp_tbl` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_tbl`
--

LOCK TABLES `todo_tbl` WRITE;
/*!40000 ALTER TABLE `todo_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-11 22:02:12
