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
-- Table structure for table `approve_tbl`
--

DROP TABLE IF EXISTS `approve_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approve_tbl` (
  `docnum` varchar(11) NOT NULL,
  `dttype` char(1) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `content` text NOT NULL,
  `docst` char(1) DEFAULT NULL,
  `apprst` int DEFAULT '0',
  `regdate` datetime DEFAULT NULL,
  `docdate` date NOT NULL,
  `chk1` char(2) DEFAULT 'N',
  `chk2` char(2) DEFAULT 'N',
  `chk3` char(2) DEFAULT 'N',
  `empnm2` char(10) DEFAULT NULL,
  `empnm3` char(10) DEFAULT NULL,
  PRIMARY KEY (`docnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approve_tbl`
--

LOCK TABLES `approve_tbl` WRITE;
/*!40000 ALTER TABLE `approve_tbl` DISABLE KEYS */;
INSERT INTO `approve_tbl` VALUES ('20210120001','A','1월 20일 업무일지','2020100001','<p>1월 20일 업무일지</p>\r\n','Y',1,'2021-01-20 10:30:57','2021-01-20','on','on','on','이주희','김성대'),('20210120002','B','1월 29일 연차신청합니다','2020100001','<p>개인적인 사유로 인해 1월 29일 연차신청합니다.</p>\r\n','N',1,'2021-01-20 10:57:53','2021-01-29','on','on','on','이주희','김성대'),('20210120003','A','18일 업무일지','2020100007','<p>18일 업무일지</p>\r\n','N',0,'2021-01-20 14:39:24','2021-01-18','on',NULL,NULL,'이주희','김성대'),('20210120004','A','19일 업무일지','2020100007','<p>19일 업무일지</p>\r\n','N',0,'2021-01-20 14:39:37','2021-01-19','on',NULL,NULL,'이주희','김성대'),('20210120005','A','20일 업무일지','2020100007','<p>20일 업무일지</p>\r\n','N',0,'2021-01-20 14:39:47','2021-01-20','on',NULL,NULL,'이주희','김성대');
/*!40000 ALTER TABLE `approve_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_any`
--

DROP TABLE IF EXISTS `article_any`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_any` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileUrl` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_any`
--

LOCK TABLES `article_any` WRITE;
/*!40000 ALTER TABLE `article_any` DISABLE KEYS */;
INSERT INTO `article_any` VALUES (40,'Y','1월 공식일정','관리자','<p>1월 공식일정</p>\r\n','2021-01-07 15:38:04',3,'N6z9iLgYq0UxYVPFpveisj8gLuQLNWa8.jpg','glass.jpg','c://upload//',1,0,0),(41,'N','신년 신입소개','관리자','<p>신년 신입소개</p>\r\n','2021-01-07 15:39:48',3,'MIXPRXtirRni9SZoUdI5tL6NaYXxGfVx.sql','201213.sql','c://upload//',2,0,0),(42,'N','신년  OT 첨부물','관리자','<p>신년 &nbsp;OT 첨부물</p>\r\n','2021-01-07 15:41:34',7,'rgWSjaL0BTb9jvd1x1JMoyy9V4Tf3lLs.xlsx','OT 비용.xlsx','c://upload//',3,0,0),(43,'Y','2월 공식일정','관리자','<p>2월 공식일정</p>\r\n','2021-01-07 15:44:42',2,NULL,NULL,NULL,4,0,0),(44,'Y','3월 공식일정','관리자','<p>3월 공식일정</p>\r\n','2021-01-07 15:44:59',47,NULL,NULL,NULL,5,0,0),(47,'N','[답글] 신년  OT 첨부물','이승영','<p>신년 &nbsp;OT 첨부물</p>\r\n\r\n<p>ㅡㅡ&gt;14</p>\r\n','2021-01-12 14:47:10',2,NULL,NULL,NULL,3,1,1),(48,'N','[답글] [답글] 신년  OT 첨부물','이승영','<p>신년 &nbsp;OT 첨부물</p>\r\n\r\n<p>ㅡㅡ&gt;14</p>\r\n\r\n<p>ㅡㅡ&gt;14</p>\r\n','2021-01-12 14:52:23',0,NULL,NULL,NULL,3,2,2);
/*!40000 ALTER TABLE `article_any` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_human`
--

DROP TABLE IF EXISTS `article_human`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_human` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileUrl` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_human`
--

LOCK TABLES `article_human` WRITE;
/*!40000 ALTER TABLE `article_human` DISABLE KEYS */;
INSERT INTO `article_human` VALUES (1,'Y','1월 급여 목록','서민환','<p>1월 급여 목록</p>\r\n','2021-01-08 11:24:05',0,'VElyQGPBmZGpUCW9SBikn2ozg81GjA3H.xlsx','OT 비용.xlsx','c://upload//',1,0,0),(2,'Y','신년 인사 이동 목록','서민환','<p>신년 인사 이동 목록</p>\r\n','2021-01-08 11:26:58',1,NULL,NULL,NULL,2,0,0),(3,'Y','1월 인사부 일정','서민환','<p>1월 인사부 일정</p>\r\n','2021-01-08 11:27:26',0,NULL,NULL,NULL,3,0,0),(4,'Y','2월 인사부 일정','서민환','<p>2월 인사부 일정</p>\r\n','2021-01-08 11:27:53',6,NULL,NULL,NULL,4,0,0);
/*!40000 ALTER TABLE `article_human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_sale`
--

DROP TABLE IF EXISTS `article_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_sale` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `division` char(1) DEFAULT NULL,
  `subject` varchar(300) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` text,
  `regdate` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  `fileName` varchar(300) DEFAULT NULL,
  `fileOriName` varchar(300) DEFAULT NULL,
  `fileUrl` varchar(500) DEFAULT NULL,
  `ref` int DEFAULT NULL,
  `re_step` int DEFAULT NULL,
  `re_level` int DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_sale`
--

LOCK TABLES `article_sale` WRITE;
/*!40000 ALTER TABLE `article_sale` DISABLE KEYS */;
INSERT INTO `article_sale` VALUES (1,'N','1월 영업부 프로젝트 소개서','이승영','<p>1월 영업부 프로젝트 소개서</p>\r\n','2021-01-07 15:49:53',0,NULL,NULL,NULL,1,0,0),(2,'Y','수주서 양식','이승영','<p>수주서 양식</p>\r\n','2021-01-07 15:50:38',0,'LrEDRS8q3vNuDgxKfL63niF9I7fJArXL.jpg','car.jpg','c://upload//',2,0,0),(3,'N','품목 추가 목록','이승영','<p>품목 추가 목록</p>\r\n','2021-01-07 15:50:57',0,NULL,NULL,NULL,3,0,0),(4,'N','생산 입고 목록','이승영','<p>생산 입고 목록</p>\r\n','2021-01-07 15:51:42',1,NULL,NULL,NULL,4,0,0),(5,'Y','1월 영업부 일정','이승영','<p>1월 영업부 일정</p>\r\n','2021-01-07 15:52:03',4,'A3Sq5FDckOSY9bi48nWpRjEJR9sRlitJ.xlsx','OT 비용.xlsx','F:\\project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\saleforce\\WEB-INF\\images/upload/board/',5,0,0);
/*!40000 ALTER TABLE `article_sale` ENABLE KEYS */;
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
-- Table structure for table `boardauth_tbl`
--

DROP TABLE IF EXISTS `boardauth_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardauth_tbl` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `boardGrp` varchar(20) NOT NULL,
  `boardCode` varchar(20) NOT NULL,
  `boardMaker` varchar(20) NOT NULL,
  `boardTitle` varchar(255) NOT NULL,
  `boardRead` varchar(3) NOT NULL,
  `boardWrite` varchar(3) NOT NULL,
  `boardReply` varchar(3) NOT NULL,
  `boardDownload` varchar(3) NOT NULL,
  `boardRegdate` date DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardauth_tbl`
--

LOCK TABLES `boardauth_tbl` WRITE;
/*!40000 ALTER TABLE `boardauth_tbl` DISABLE KEYS */;
INSERT INTO `boardauth_tbl` VALUES (5,'300','any','관리자','전체 게시판','300','300','300','200','2020-12-17'),(11,'200','sale','관리자','영업부 게시판','200','200','200','200','2021-01-06'),(12,'100','human','관리자','인사부 게시판','100','100','100','100','2021-01-06');
/*!40000 ALTER TABLE `boardauth_tbl` ENABLE KEYS */;
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
INSERT INTO `buseo_tbl` VALUES ('100','인사총무부'),('200','영업부'),('300','전체');
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
  `birttypecd` varchar(2) DEFAULT NULL,
  `ntgrpcd` char(3) DEFAULT NULL,
  `ntgrpnm` varchar(30) DEFAULT NULL,
  `authcd` char(3) DEFAULT NULL,
  `authnm` char(30) DEFAULT NULL,
  `allowcd` char(3) DEFAULT NULL,
  `allownm` varchar(30) DEFAULT NULL,
  `doccd` char(2) DEFAULT NULL,
  `docnm` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comcode`
--

LOCK TABLES `comcode` WRITE;
/*!40000 ALTER TABLE `comcode` DISABLE KEYS */;
INSERT INTO `comcode` VALUES ('A','고무','A','제품','A','제조업','A','제조','A','생산입고','A','남자','A','공개채용','A','병역무관','A','대상','A','대상','A','무교','A','미혼','A','내근','A','급여','A','월급직','A','공지사항','A','일반공지','A','업무','A','일반','A','결재진행중','A','사용중','양력','A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('B','플라스틱','B','상품','B','운수업','B','도금','B','반품입고','B','여자','B','수시채용','B','병역필','B','비대상','B','비대상','B','불교','B','기혼','B','외근','B','상여','B','일반직','B','일반글','B','영업공지','B','연차','B','긴급','B','결재완료','B','완료','음력','B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('C','기계','C','반제품','C','광업','C','기타','C','판매출고','C','미정','C','특별채용','C','병역미필','C',NULL,'C',NULL,'C','기독교','C',NULL,'C','휴가','C','특별상여','C','시간직','C',NULL,'C','인사공지','C','수주','C',NULL,'C',NULL,'C',NULL,NULL,'C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('D','금속','D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D',NULL,'D','천주교','D',NULL,'D','오전반차','D','연월차','D',NULL,'D',NULL,'D',NULL,'D','판매','D',NULL,'D',NULL,'D',NULL,NULL,'D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('E','비금속','E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E','기타','E',NULL,'E','오후반차','E','그외','E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,'E',NULL,NULL,'E',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,'F',NULL,NULL,'F',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,'G',NULL,NULL,'G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,'H',NULL,NULL,'H',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,'I',NULL,NULL,'I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'300','전체공지',NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'200','영업부',NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100','인사부',NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'200','영업',NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100','인사',NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'300','전체',NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','야근수당',NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','휴가수당',NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C','연차수당',NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D','기타수당',NULL,NULL),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A','업무일지'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B','연차처리');
/*!40000 ALTER TABLE `comcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_any`
--

DROP TABLE IF EXISTS `comment_any`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_any` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `pwd` char(2) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_any`
--

LOCK TABLES `comment_any` WRITE;
/*!40000 ALTER TABLE `comment_any` DISABLE KEYS */;
INSERT INTO `comment_any` VALUES (6,27,'1234','관리자','2020-12-19 16:44:38',NULL),(7,27,'asda','관리자','2020-12-19 17:01:54',NULL),(8,27,'ㅁㄴㅇㅁㄴㅇ','관리자','2020-12-19 17:53:01',NULL),(9,27,'ㅁㄴㅇㄴㅁㅇ','관리자','2020-12-19 17:53:03',NULL),(10,27,'ㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ','관리자','2020-12-19 17:53:07',NULL),(11,27,'12346','관리자','2020-12-19 18:43:47',NULL),(12,27,'등록','영업관리자','2020-12-19 19:03:32',NULL),(13,44,'14','관리자','2021-01-12 14:00:29',NULL),(14,44,'15','관리자','2021-01-12 14:03:08',NULL),(15,44,'15','관리자','2021-01-12 14:03:29','on'),(16,44,'14','이승영','2021-01-12 14:04:28',NULL),(17,44,'비밀 댓글 테스트','이승영','2021-01-12 14:23:50','on'),(18,44,'14','영업관리자','2021-01-12 14:25:35',NULL),(19,44,'댓글 테스트','서민환','2021-01-12 14:34:07','on');
/*!40000 ALTER TABLE `comment_any` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_human`
--

DROP TABLE IF EXISTS `comment_human`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_human` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `pwd` char(2) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_human`
--

LOCK TABLES `comment_human` WRITE;
/*!40000 ALTER TABLE `comment_human` DISABLE KEYS */;
INSERT INTO `comment_human` VALUES (2,4,'비밀 댓글입니다~~','서민환',NULL,'2021-01-13 14:23:53'),(3,4,'비밋대글입니당','서민환','on','2021-01-20 14:46:42'),(4,4,'테스트입니다,.','이주희',NULL,'2021-01-20 14:49:45');
/*!40000 ALTER TABLE `comment_human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_sale`
--

DROP TABLE IF EXISTS `comment_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_sale` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `comment` text,
  `who` varchar(20) DEFAULT NULL,
  `pwd` char(2) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_sale`
--

LOCK TABLES `comment_sale` WRITE;
/*!40000 ALTER TABLE `comment_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_sale` ENABLE KEYS */;
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
INSERT INTO `company_tbl` VALUES ('AA001','(유)프라이그파이스트','김춘애','A','A','부산광역시 강서구 녹산산단27로 19 (송정동)','051-831-6985','051-980-7140','www.yangju.go.kr','김은정','051-714-7140',NULL,NULL,'관리자','2020-11-10 00:00:00'),('AA002','(유)피피지코리아','이강덕','A','A','부산광역시 남구 신선로356번길 21 (용당동)','051-624-8221','051-244-2878','pre.yangju.go.kr','염수미','051-241-6151',NULL,NULL,'관리자','2020-11-11 00:00:00'),('AA003','(재)부산경제진흥원','노선순','A','A','부산광역시 강서구 녹산산단382로14번길 55 (송정동, 부산광역시 신발산업진흥센타)','051-600-1700','051-242-2011','yjcc.yangju.go.kr','송채현','051-242-2009',NULL,NULL,'관리자','2020-11-12 00:00:00'),('AA004','(재)부산테크노파크','박승완','A','A','부산광역시 기장군 일광면 횡계길 7 (해양생물산업육성센터)','051-720-8926','051-244-2828','yjv1365.or.kr','박용주','051-254-8693',NULL,NULL,'관리자','2020-11-13 00:00:00'),('AA005','일광공업사','백경만','A','A','부산광역시 사상구 장인로37번길 13-9 (감전동, 태광전기)','051-323-8866','051-263-4077','www.libyj.go.kr','도귀영','051-263-4076',NULL,NULL,'관리자','2020-11-14 00:00:00'),('AA006','(주) 대중미래산업','여전화','A','A','부산광역시 부산진구 신천대로71번길 57, 1층일부(1108) (범천동)','051-646-0680','051-263-8810','ebook.yangju.go.kr','박규현','051-244-2142',NULL,NULL,'관리자','2020-11-15 00:00:00'),('AA007','(주) 라인자동화','이양석','A','A','부산광역시 강서구 공항로533번가길 54 (대저2동)','051-316-3707','050-4099-1322','rtms.yangju.go.kr','안귀영','051-911-1400',NULL,NULL,'관리자','2020-11-16 00:00:00'),('AA008','(주) 미보기아 2공장','이준상','A','A','부산광역시 사상구 낙동대로1404번길 69 (삼락동)','051-710-9110',NULL,'eais.yangju.go.kr','안동현','051-246-9110',NULL,NULL,'관리자','2020-11-17 00:00:00'),('AA009','(주) 생','위성태','A','A','부산광역시 강서구 녹산산업중로 285 (송정동)','051-304-3531','051-265-8164','http://www.koica.go.kr/nepal_kr/index.do','김혜임','051-257-7096',NULL,NULL,'관리자','2020-11-18 00:00:00'),('AA010','(주) 송림드리움','박태정','A','A','부산광역시 연제구 과정로287번길 52 (연산동) (총 2 필지)','051-862-8170','051-256-5998','http://www.koica.go.kr/tls_kr/index.do','김상만','051-522-7773',NULL,NULL,'관리자','2020-11-19 00:00:00'),('AA011','(주) 알알코퍼레이션','김승연','A','A','부산광역시 부산진구 신천대로62번길 38, 8층 (부전동)','1577-5615',NULL,'http://www.koica.go.kr/lao_kr/index.do','이근수','051-245-8801',NULL,NULL,'관리자','2020-11-20 00:00:00'),('AA012','(주) 엘비나','송성철','A','A','부산광역시 부산진구 동평로397번길 33,  3층 일부 (양정동)','051-522-5057','051-250-5576','http://www.koica.go.kr/mng_kr/index.do','서정구','051-710-8818',NULL,NULL,'관리자','2020-11-21 00:00:00'),('AA013','(주) 엠에스디앤티','양희관','A','A','부산광역시 부산진구 복지로8번길 18 (개금동)','051-900-6513','051-919-9224','http://www.koica.go.kr/mmr_kr/index.do','구선오','051-246-7402',NULL,NULL,'관리자','2020-11-22 00:00:00'),('AA014','(주) 예맥통상','김학선','A','A','부산광역시 사하구 비봉로 56 (신평동)','051-207-9393','051-256-9427','http://www.koica.go.kr/bgd_kr/index.do','최윤호','051-261-9795',NULL,NULL,'관리자','2020-11-23 00:00:00'),('AA015','(주) 우신상사','정현철','A','A','부산광역시 부산진구 거제대로 86, 1층 (양정동, 셀렉스빌딩)','051-524-8145',NULL,'http://www.koica.go.kr/vnm_kr/index.do','손양호','051-243-1225',NULL,NULL,'관리자','2020-11-24 00:00:00'),('AA016','(주) 제이케이이엔지','강경일','A','A','부산광역시 강서구 녹산산단262로50번길 7 (송정동)','051-831-7186',NULL,'http://www.koica.go.kr/lka_kr/index.do','김창환','051-231-7020',NULL,NULL,'관리자','2020-11-25 00:00:00'),('AB001','(주) 젠','지점만','A','B','부산광역시 강서구 낙동남로511번길 43 (녹산동)','051-442-1235','051-254-7676','http://www.koica.go.kr/afg_kr/index.do','추우순','051-756-3382',NULL,NULL,'관리자','2020-11-26 00:00:00'),('AB002','(주) 티아','송진홍','A','B','부산광역시 강서구 화전산단5로84번길 22 (화전동)','051-941-2097','051-261-3355','http://www.koica.go.kr/idn_kr/index.do','박진열','051-254-7234',NULL,NULL,'관리자','2020-11-27 00:00:00'),('AB003','(주) 한솔아이스컴패니','김재윤','A','B','부산광역시 부산진구 동성로49번길 13, 1층 (전포동)','051-907-9235','051-242-9228','http://www.koica.go.kr/khm_kr/index.do','김주원','051-256-5960',NULL,NULL,'관리자','2020-11-28 00:00:00'),('AB004','(주)ABB코리아','손지형','A','B','부산광역시 금정구 개좌로 274 (회동동)','051-933-0500',NULL,'http://www.koica.go.kr/pak_kr/index.do','안연태','051-243-2111',NULL,NULL,'관리자','2020-11-29 00:00:00'),('AB005','(주)ALF','이연주','A','B','부산광역시 사상구 새벽로 37 (학장동, (주)ALF)','051-311-4682','051-257-2774','http://www.koica.go.kr/fji_kr/index.do','강이명','051-265-4905',NULL,NULL,'관리자','2020-11-30 00:00:00'),('AB006','(주)BHE','이재현','A','B','부산광역시 강서구 미음산단5로41번길 21, 해양융복합동(본관동) 302호 (미음동)','051-941-1504',NULL,'http://www.koica.go.kr/phl_kr/index.do','박현영','051-246-1710',NULL,NULL,'관리자','2020-12-01 00:00:00'),('AB007','(주)BM','장부기','A','B','부산광역시 영도구 태종로 727,  한국해양대학교 창업보육센터508 (동삼동)','070-4066-1310','051-242-0110','http://www.koica.go.kr/gha_kr/index.do','최찬용','051-256-2233',NULL,NULL,'관리자','2020-12-02 00:00:00'),('AB008','(주)D.P.M','김영습','A','B','부산광역시 사상구 농산물시장로 18 (엄궁동)','051-301-0031','051-254-2373','http://www.koica.go.kr/nga_kr/index.do','진성용','051-231-1077',NULL,NULL,'관리자','2020-12-03 00:00:00'),('AB009','(주)DH전장','마영민','A','B','부산광역시 금정구 공단동로41번길 10,  보림팩토피아 407호~411호 (금사동)','051-521-1120','051-250-5576','http://www.koica.go.kr/rwa_kr/index.do','정율성','051-253-2501',NULL,NULL,'관리자','2020-12-04 00:00:00'),('AB010','(주)HN푸드','유한나','A','B','부산광역시 사하구 하신중앙로27번길 15 (장림동)','051-263-7249','051-253-8007','http://www.koica.go.kr/moz_kr/index.do','오중훈','051-231-5515',NULL,NULL,'관리자','2020-12-05 00:00:00'),('AC001','(주)IEN한창','박주웅','A','C','부산광역시 기장군 장안읍 반룡리 835-1 번지','051-831-3470',NULL,'http://www.koica.go.kr/mar_kr/index.do','김세진','051-242-8804',NULL,NULL,'관리자','2020-12-06 00:00:00'),('AC002','신일테크','이선용','A','C','부산광역시 사상구 강변대로456번길 38 (엄궁동, 신일테크)','051-324-5039','051-266-6077','http://www.koica.go.kr/sen_kr/index.do','차혜빈','051-248-4561',NULL,NULL,'관리자','2020-12-07 00:00:00'),('AC003','신일화학','김효준','A','C','부산광역시 강서구 녹산산단261로39번길 2 (송정동)','051-831-4048','051-256-2776','http://www.koica.go.kr/dza_kr/index.do','신영석','051-256-3334',NULL,NULL,'관리자','2020-12-08 00:00:00'),('BA001','신진TECH','양선철','B','A','부산광역시 사상구 낙동대로1348번길 18 (삼락동)','051-305-7450','051-244-1225','http://www.koica.go.kr/tza_kr/index.do','정용택','051-248-7621',NULL,NULL,'관리자','2020-12-16 00:00:00'),('BA002','신진금속','김영일','B','A','부산광역시 강서구 낙동북로126번길 20-1 (강동동)','051-973-2161','051-231-7021','http://www.koica.go.kr/tun_kr/index.do','박수정','051-250-9900',NULL,NULL,'관리자','2020-12-17 00:00:00'),('BA003','신진볼트공업사','김대환','B','A','부산광역시 사하구 하신번영로127번길 26 (신평동)','051-207-7474','051-756-3395','http://www.koica.go.kr/gtm_kr/index.do','신승택','051-643-5545',NULL,NULL,'관리자','2020-12-18 00:00:00'),('BC001','신정산업사','김광곤','B','C','부산광역시 사하구 다대로300번길 15 (장림동)','051-291-1747','051-255-7302','http://www.koica.go.kr/egy_kr/index.do','박득준','051-261-6161',NULL,NULL,'관리자','2020-12-09 00:00:00'),('BC002','신정애드','김홍곤','B','C','부산광역시 부산진구 신천대로 74-1 (부전동)','051-803-0377','051-231-7909','http://www.koica.go.kr/eth_kr/index.do','박계영','051-244-6161',NULL,NULL,'관리자','2020-12-10 00:00:00'),('BC003','신정테크','강동현','B','C','부산광역시 영도구 대평로20번길 13 (대평동1가)','051-415-4429',NULL,'http://www.koica.go.kr/uga_kr/index.do','정종현','051-205-0066',NULL,NULL,'관리자','2020-12-11 00:00:00'),('BC004','신지사','이강덕','B','C','부산광역시 중구 자갈치로 80 (남포동4가)','051-245-1254',NULL,'http://www.koica.go.kr/cmr_kr/index.do','박채희','051-247-5971',NULL,NULL,'관리자','2020-12-12 00:00:00'),('BC005','신지테크윈 주식회사(S.G.Techwin)','손수익','B','C','부산광역시 강서구 평강로171번길 30-13 (대저1동)','051-714-2330','051-980-5345','http://www.koica.go.kr/ken_kr/index.do','박승수','051-245-9558',NULL,NULL,'관리자','2020-12-13 00:00:00'),('BC006','신지통상','전갑수','B','C','부산광역시 강서구 녹산산단231로 47 (송정동)','051-831-1300','051-246-5010','http://www.koica.go.kr/cod_kr/index.do','배청명','051-242-1741',NULL,NULL,'관리자','2020-12-14 00:00:00'),('BC007','신진DMB','박태정','B','C','부산광역시 강서구 식만로 41-9 (죽림동)','051-973-2763','051-262-9792','http://www.koica.go.kr/civ_kr/index.do','박범주','051-255-0086',NULL,NULL,'관리자','2020-12-15 00:00:00'),('CA001','신진볼트공업사','서승길','C','A','부산광역시 강서구 화전산단6로66번길 27 (화전동)','051-207-7474','051-241-5906','http://www.koica.go.kr/dom_kr/index.do','박태성','051-244-9457',NULL,NULL,'관리자','2020-12-19 00:00:00'),('CA002','신진산업','홍금자','C','A','부산광역시 강서구 낙동북로108번길 35 (강동동)','051-123-4567','051-256-5963','http://www.koica.go.kr/bol_kr/index.do','김봉수','051-256-1621',NULL,NULL,'관리자','2020-12-20 00:00:00'),('CA003','신진상사','김광남','C','A','부산광역시 강서구 식만로 13-44 (죽림동)','051-972-2215','051-248-2111','http://www.koica.go.kr/ecu_kr/index.do','김민경','051-248-9912',NULL,NULL,'관리자','2020-12-21 00:00:00'),('CA004','신진섬유','윤영남','C','A','부산광역시 사하구 신산로 130 (신평동)','051-205-5605',NULL,'http://www.koica.go.kr/slv_kr/index.do','이종욱','051-263-2199',NULL,NULL,'관리자','2020-12-22 00:00:00'),('CA005','신진에스엠    ','김교철','C','A','부산광역시 기장군 장안읍 장안산단1로 12-15','051-727-7311','051-253-1709','http://www.koica.go.kr/col_kr/index.do','김순영','051-256-5467',NULL,NULL,'관리자','2020-12-23 00:00:00'),('CA006','신진유압기계','김복만','C','A','부산광역시 강서구 경전철로39번길 12 (대저2동)','051-315-0945','051-256-4141','http://www.koica.go.kr/pry_kr/index.do','나종빈','051-255-1811',NULL,NULL,'관리자','2020-12-24 00:00:00'),('CA007','신진전착','곽은희','C','A','부산광역시 사하구 다산로225번길 38 (장림동)','051-264-2947',NULL,'http://www.koica.go.kr/per_kr/index.do','김용화','070-4912-3103',NULL,NULL,'관리자','2020-12-25 00:00:00'),('CA008','신진종합코팅','허재호','C','A','부산광역시 사상구 낙동대로1420번길 41,  부산인쇄타운 415호 (삼락동)','051-302-9979','051-253-2505','http://www.koica.go.kr/aze_kr/index.do','최윤정','070-7717-3213',NULL,NULL,'관리자','2020-12-26 00:00:00'),('CA009','신진터빈엔지니어링','김범규','C','A','부산광역시 영도구 대평남로 47,  18-4번지 (대평동2가)','051-414-7174','051-231-5517','http://www.koica.go.kr/uzb_kr/index.do','이명욱','051-243-1701',NULL,NULL,'관리자','2020-12-27 00:00:00'),('CA010','신진포장','선옥규','C','A','부산광역시 강서구 설만신평길 4 (대저2동)','051-317-1518',NULL,'http://www.koica.go.kr/kgz_kr/index.do','김성옥','051-257-2406',NULL,NULL,'관리자','2020-12-28 00:00:00'),('CA011','신진푸드','김상렬','C','A','부산광역시 사하구 다대로605번길 9,  2층 (다대동)','051-264-4412','051-248-4562','http://www.koica.go.kr/jor_kr/index.do','배종관','051-250-7000',NULL,NULL,'관리자','2020-12-29 00:00:00');
/*!40000 ALTER TABLE `company_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyinfo` (
  `comname` varchar(100) DEFAULT NULL,
  `comsubname` varchar(100) DEFAULT NULL,
  `comauth` int DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
INSERT INTO `companyinfo` VALUES ('SALE FORCE','AUTOMATION',2);
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dl_tbl`
--

DROP TABLE IF EXISTS `dl_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dl_tbl` (
  `dlnum` varchar(20) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `dlgubun` char(1) NOT NULL,
  `dldate` varchar(20) DEFAULT NULL,
  `ontime` time DEFAULT NULL,
  `offtime` time DEFAULT NULL,
  `extime` time DEFAULT NULL,
  `tottime` time DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `defstr` time DEFAULT '09:00:00',
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
INSERT INTO `dl_tbl` VALUES ('201224100001','2020100001','A','2020-12-24','18:25:05','18:25:27',NULL,'00:00:22','2020100001','2020-12-24 18:25:05','09:00:00'),('210107100001','2020100001','A','2021-01-07','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210108100001','2020100001','A','2021-01-08','11:35:57','14:16:06',NULL,'02:40:09','2020100001','2021-01-08 11:35:57','09:00:00'),('210109100001','2020100001','A','2021-01-09','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210110100001','2020100001','A','2021-01-10','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210111100001','2020100001','A','2021-01-11','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210112100001','2020100001','A','2021-01-12','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210112100004','2020100004','A','2021-01-12','15:54:46','15:54:47',NULL,'06:54:47','2020100004','2021-01-12 15:54:46','09:00:00'),('210113100001','2020100001','A','2021-01-13','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210113200001','2020200001','A','2021-01-13','11:54:34','11:54:41',NULL,'00:00:07','2020200001','2021-01-13 11:54:34','09:00:00'),('210114100001','2020100001','A','2021-01-14','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210115100001','2020100001','A','2021-01-15','08:50:00','18:00:00',NULL,'08:00:00','2020100001','2021-01-08 15:09:14','09:00:00'),('210118100001','2020100001','A','2021-01-18','10:20:51',NULL,NULL,NULL,'2020100001','2021-01-18 10:20:51','09:00:00'),('210120100006','2020100006','A','2021-01-20','11:00:29','14:50:19',NULL,'03:49:50','2020100006','2021-01-20 11:00:29','09:00:00');
/*!40000 ALTER TABLE `dl_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlinfo_tbl`
--

DROP TABLE IF EXISTS `dlinfo_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dlinfo_tbl` (
  `dlnum` varchar(20) NOT NULL,
  `seq` varchar(20) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `dlgubun` char(1) NOT NULL,
  `strtime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `tottime` time DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`dlnum`,`seq`),
  KEY `empid` (`empid`),
  CONSTRAINT `dlinfo_tbl_ibfk_1` FOREIGN KEY (`dlnum`) REFERENCES `dl_tbl` (`dlnum`),
  CONSTRAINT `dlinfo_tbl_ibfk_2` FOREIGN KEY (`empid`) REFERENCES `emp_tbl` (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlinfo_tbl`
--

LOCK TABLES `dlinfo_tbl` WRITE;
/*!40000 ALTER TABLE `dlinfo_tbl` DISABLE KEYS */;
INSERT INTO `dlinfo_tbl` VALUES ('201224100001','1','2020100001','A','18:25:05','18:25:11','00:00:06',NULL,'2020100001','2020-12-24 18:25:05'),('201224100001','2','2020100001','B','18:25:11','18:25:25','00:00:14',NULL,'2020100001','2020-12-24 18:25:11'),('201224100001','3','2020100001','A','18:25:26','18:25:28',NULL,NULL,'2020100001','2020-12-24 18:25:26'),('210107100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210108100001','1','2020100001','A','11:35:57','14:16:08','02:40:11',NULL,'2020100001','2021-01-08 11:35:57'),('210109100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210110100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210111100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210112100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210112100004','1','2020100004','A','15:54:46','15:54:48','00:00:02',NULL,'2020100004','2021-01-12 15:54:46'),('210113100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210113200001','1','2020200001','A','11:54:34','11:54:41','00:00:07',NULL,'2020200001','2021-01-13 11:54:34'),('210114100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210115100001','1','2020100001','A','08:50:00','18:00:00','08:00:00',NULL,'2020100001','2021-01-08 15:09:14'),('210118100001','1','2020100001','A','10:20:51',NULL,NULL,NULL,'2020100001','2021-01-18 10:20:51'),('210120100006','1','2020100006','A','11:00:29','14:50:20','03:49:51',NULL,'2020100006','2021-01-20 11:00:29');
/*!40000 ALTER TABLE `dlinfo_tbl` ENABLE KEYS */;
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
  `photoName` varchar(150) DEFAULT NULL,
  `empPhoto` varchar(300) DEFAULT NULL,
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
INSERT INTO `emp_tbl` VALUES ('2020100001','100','1','Y','서민환','1','A','19900301','A','900301-1000000','부산광역시 기장군 정관면 산단1로 66-89 (영진산업)','01012345678','01012345678','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-01',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100002','100','2','Y','김두형','1','A','19890303','A','890303-1000000','부산광역시 기장군 정관면 산단1로 66-89 (영진산업)','01012345679','01012345679','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-02',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100003','100','3','Y','서정근','1','A','19880304','A','880304-1000000','부산광역시 강서구 녹산산업북로313번길 62 (송정동)','01012345680','01012345680','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-03',1,'2020100003','2020-11-13 00:00:00','test','propeller.jpg','cfb4879d-79a0-4c9e-9477-96a539303870_propeller.jpg'),('2020100004','100','4','Y','신영현','1','A','19870305','A','870305-1000000','부산광역시 금정구 삼어로 223 (금사동, 진보금속공업(주))','01012345681','01012345681','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-04',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100005','100','5','Y','이주희','1','A','19860306','A','860306-1000000','부산광역시 사상구 학감대로192번길 69 (학장동)','01012345682','01012345682','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-05',1,'2020100005','2020-11-13 00:00:00','test','wheel.jpg','e2acbc8c-144a-4c6b-9926-71fb518cdbed_wheel.jpg'),('2020100006','100','6','Y','김성대','1','A','19850307','A','850307-1000000','부산광역시 사하구 다산로105번길 61 (다대동)','01012345683','01012345683','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-06',1,'2020100006','2020-11-13 00:00:00','test','hair.jpg','1b7f20a1-593c-4056-92b0-446d39c1cfa0_hair.jpg'),('2020100007','100','1','Y','김선주','1','A','19840308','A','840308-1000000','부산광역시 강서구 범방2로 48 (범방동)','01012345684','01012345684','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-07',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100008','100','2','Y','최유정','1','A','19830309','A','830309-1000000','부산광역시 사상구 학감대로192번길 79 (학장동)','01012345685','01012345685','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-08',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100009','100','3','Y','정숙정','1','A','19820310','A','820310-1000000','부산광역시 기장군 정관면 산단3로 55','01012345686','01012345686','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-09',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100010','100','4','Y','최경민','1','B','19810311','A','810311-2000000','부산광역시 사상구 학감대로252번길 62 (주례동, 태영정밀)','01012345687','01012345687','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-10',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100011','100','1','Y','김희연','1','A','19870704','A','870704-1000000','부산광역시 사상구 사상로478번길 22 (모라동)','01012345702','01012345702','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-25',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100012','100','2','Y','이윤혜','1','A','19860705','A','860705-1000000','부산광역시 사상구 낙동대로1348번길 55 (삼락동)','01012345703','01012345703','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-26',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100013','100','3','Y','송하권','1','A','19850706','A','850706-1000000','부산광역시 기장군 정관읍 산단5로 76-45','01012345704','01012345704','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-27',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100014','100','4','Y','김계옥','1','A','19840707','A','840707-1000000','부산광역시 사상구 가야대로 7 (감전동, 정선엔지니어링)','01012345705','01012345705','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-28',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100015','100','5','Y','김봉환','1','A','19830708','A','830708-1000000','부산광역시 강서구 녹산산업중로 36 (송정동)','01012345706','01012345706','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-29',1,'2020100015','2020-11-13 00:00:00','test','ring.jpg','4e5df714-76f3-4800-8cf1-80bca8b9eca3_ring.jpg'),('2020100016','100','6','Y','김서현','1','A','19820709','A','820709-1000000','부산광역시 부산진구 성지로137번길 92, 지하1층 (초읍동)','01012345707','01012345707','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-30',1,'2020100016','2020-11-13 00:00:00','test','glass.jpg','d8c32d0a-63f5-460c-bc77-93c2d579a1f6_glass.jpg'),('2020100017','100','1','Y','신은혜','1','A','19810710','A','810710-1000000','부산광역시 사하구 장림번영로103번길 25 (장림동)','01012345708','01012345708','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-01',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100018','100','2','Y','손승윤','1','A','19800711','A','800711-1000000','부산광역시 강서구 가달1로 77 (생곡동)','01012345709','01012345709','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-02',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100019','100','3','Y','임종걸','1','A','19790712','A','790712-1000000','부산광역시 강서구 대저중앙로348번길 24-8 (대저1동)','01012345710','01012345710','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-03',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100020','100','4','Y','차승연','1','A','19780713','A','780713-1000000','부산광역시 영도구 해양로 33-10 (청학동)','01012345711','01012345711','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-04',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100021','100','5','Y','이황우','1','A','19770714','A','770714-1000000','부산광역시 영도구 남항남로31번길 12 (남항동3가)','01012345712','01012345712','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-05',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100022','100','6','Y','김광홍','1','A','19760715','A','760715-1000000','부산광역시 사상구 가야대로11번길 7-7 (감전동)','01012345713','01012345713','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-06',1,'2020100022','2020-11-13 00:00:00','test','silver.jpg','f2fcb875-3c50-483d-8095-051bf817b5c4_silver.jpg'),('2020100023','100','1','Y','김영린','1','A','19750716','A','760316-2000000','부산광역시 사상구 학감대로222번길 34 (감전동)','01012345714','01012345714','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-07',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100024','100','2','Y','김주영','1','A','19740717','A','740717-1000000','부산광역시 강서구 대저중앙로 314-4 (대저1동)','01012345715','01012345715','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-08',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100025','100','3','Y','이명규','1','A','19730718','A','730718-1000000','부산광역시 강서구 낙동북로125번길 92-1 (강동동)','01012345716','01012345716','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-09',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100026','100','4','Y','이정덕','1','B','19720719','A','720719-2000000','부산광역시 사상구 낙동대로1412번길 80 (삼락동)','01012345717','01012345717','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-10',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020100027','100','5','Y','하동구','1','B','19710720','A','710720-2000000','부산광역시 사상구 모덕로 48, 2층 (삼락동)','01012345718','01012345718','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-11',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200001','200','6','Y','이승영','1','A','19800312','A','800312-2000000','부산광역시 중구 복병산길6번길 15-1 (대청동1가)','01012345688','01012345688','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-11',1,'2020200001','2020-11-13 00:00:00','test',NULL,NULL),('2020200002','200','6','Y','이창민','1','B','19790313','A','790313-2000000','부산광역시 사상구 새벽시장로 92-10 (감전동)','01012345689','01012345689','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-12',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200003','200','1','Y','김태임','1','B','19780314','A','780314-2000000','부산광역시 강서구 녹산산단261로87번길 19 (송정동)','01012345690','01012345690','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-13',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200004','200','2','Y','권예슬','1','B','19770315','A','770315-2000000','부산광역시 기장군 기장읍 차성로436번길 8,  대영상가 B 201','01012345691','01012345691','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-14',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200005','200','3','Y','김희태','1','A','19760316','A','760316-2000000','부산광역시 강서구 녹산산단261로 78 (송정동)','01012345692','01012345692','a@sfa.com','12345678','테스트','-','-','-','A','A','A','A','A','A','-','-','2020-09-15',1,'2020200005','2020-11-13 00:00:00','test',NULL,NULL),('2020200006','200','4','Y','이소정','1','B','19750317','A','750317-2000000','부산광역시 강서구 대저중앙로348번길 15-2 (대저1동)','01012345693','01012345693','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-16',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200007','200','5','Y','노문환','1','B','19740318','A','740318-2000000','부산광역시 사하구 구평로 19-1 (구평동)','01012345694','01012345694','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-17',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200008','200','6','Y','김순희','1','B','19730319','A','730319-2000000','부산광역시 영도구 해양로176번길 14 (청학동)','01012345695','01012345695','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-18',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200009','200','1','Y','안경진','1','A','19720320','A','720320-1000000','부산광역시 기장군 정관읍 산단4로 8-27 (우창화학(주))','01012345696','01012345696','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-19',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200010','200','2','Y','김학기','1','A','19710321','A','710321-1000000','부산광역시 강서구 녹산산단261로59번길 20 (송정동)','01012345697','01012345697','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-20',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200011','200','3','Y','남현수','1','A','19700322','A','700322-1000000','부산광역시 강서구 녹산산단382로60번길 32 (송정동)','01012345698','01012345698','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-21',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200012','200','4','Y','권세남','1','A','19900701','A','900701-1000000','부산광역시 강서구 대저중앙로 360-1 (대저1동)','01012345699','01012345699','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-22',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200013','200','5','Y','손우락','1','A','19890702','A','890702-1000000','부산광역시 사상구 학장로135번길 85 (학장동)','01012345700','01012345700','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-23',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200014','200','6','Y','윤준영','1','A','19880703','A','880703-1000000','부산광역시 강서구 가달1로 53 (생곡동)','01012345701','01012345701','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-09-24',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200015','200','6','Y','신상원','1','B','19700721','A','700721-2000000','부산광역시 사하구 장림번영로84번길 34 (장림동)','01012345719','01012345719','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-12',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200016','200','1','Y','박윤용','1','B','19690722','A','690722-2000000','부산광역시 강서구 가리새1로25번길 24 (생곡동)','01012345720','01012345720','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-13',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200017','200','1','Y','유신','1','B','19680723','A','680723-2000000','부산광역시 강서구 녹산산단261로74번길 20 (송정동)','01012345721','01012345721','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-14',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200018','200','2','Y','백봉욱','1','B','19670724','A','670724-2000000','부산광역시 사하구 하신중앙로27번길 17, 에이스밀 3층 301 (장림동)','01012345722','01012345722','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-15',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200019','200','3','Y','김영휘','1','B','19660725','A','660725-2000000','부산광역시 사하구 장평로83번길 28 (장림동)','01012345723','01012345723','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-16',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200020','200','4','Y','김은실','1','B','19650726','A','650726-2000000','부산광역시 강서구 생곡산단2로11번길 38 (생곡동)','01012345724','01012345724','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-17',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200021','200','5','Y','정진영','1','B','19640727','A','640727-2000000','부산광역시 강서구 신호산단3로88번길 54 (신호동)','01012345725','01012345725','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-18',1,'admin','2020-11-13 00:00:00','test',NULL,NULL),('2020200022','200','6','Y','권영창','1','B','19630728','A','630728-2000000','부산광역시 영도구 해양로123번길 23 (청학동)','01012345726','01012345726','a@sfa.com','12345678','-','-','-','-','A','A','A','A','A','A','-','-','2020-10-19',1,'2020200022','2020-11-13 00:00:00','test','wheel.jpg','0a451b2d-4ba2-4858-a5f3-b0b97bd63999_wheel.jpg'),('admin','300','777','Y','관리자','admin','','','','','','','','admin@sfa.com','','','','','','','','','','','','','','2020-10-08',0,'','2020-10-08 00:00:00','test',NULL,NULL),('human','100','777','Y','인사관리자','100','C','1900-00-00','A','000000-0000000',NULL,'01000000000','07000000000','human@sfa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('sale','200','777','Y','영업관리자','200','C','1900-00-00','A','000000-0000000',NULL,'01000000000','07000000000','sale@sfa.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `emp_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_tbl`
--

DROP TABLE IF EXISTS `grade_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_tbl` (
  `grade_id` varchar(3) NOT NULL,
  `grade_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_tbl`
--

LOCK TABLES `grade_tbl` WRITE;
/*!40000 ALTER TABLE `grade_tbl` DISABLE KEYS */;
INSERT INTO `grade_tbl` VALUES ('6','부장'),('5','팀장'),('4','과장'),('3','대리'),('2','주임'),('1','사원'),('777','관리자');
/*!40000 ALTER TABLE `grade_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hu_tbl`
--

DROP TABLE IF EXISTS `hu_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hu_tbl` (
  `hunum` varchar(12) NOT NULL,
  `hugubun` char(1) NOT NULL DEFAULT '',
  `paygubun` char(1) NOT NULL DEFAULT '',
  `paynm` varchar(10) NOT NULL,
  `empid` varchar(10) NOT NULL,
  `hustdate` date NOT NULL,
  `huenddate` date NOT NULL,
  `paystdate` date DEFAULT NULL,
  `totpay` int DEFAULT NULL,
  `seq` int DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `payenddate` date DEFAULT NULL,
  `payday` date DEFAULT NULL,
  `fund` int DEFAULT NULL,
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
INSERT INTO `hu_tbl` VALUES ('AA2101100001','A','A','2101wage','2020100001','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'서민환','2021-01-08 00:00:00','2021-01-31','2021-02-10',2330000),('AA2101100003','A','A','2101wage','2020100003','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'서정근','2021-01-08 00:00:00','2021-01-31','2021-02-10',3580000),('AA2101100004','A','A','2101wage','2020100004','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'신영현','2021-01-08 00:00:00','2021-01-31','2021-02-10',4420000),('AA2101100006','A','A','2101wage','2020100006','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'김성대','2021-01-08 00:00:00','2021-01-31','2021-02-10',6330000),('AA2101100007','A','A','2101wage','2020100007','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'김선주','2021-01-08 00:00:00','2021-01-31','2021-02-10',2330000),('AA2101100008','A','A','2101wage','2020100008','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'최유정','2021-01-08 00:00:00','2021-01-31','2021-02-10',2830000),('AA2101100010','A','A','2101wage','2020100010','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'최경민','2021-01-08 00:00:00','2021-01-31','2021-02-10',4420000),('AA2101100011','A','A','2101wage','2020100011','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'김희연','2021-01-08 00:00:00','2021-01-31','2021-02-10',2330000),('AA2101100012','A','A','2101wage','2020100012','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'이윤혜','2021-01-08 00:00:00','2021-01-31','2021-02-10',2830000),('AA2101100013','A','A','2101wage','2020100013','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'송하권','2021-01-08 00:00:00','2021-01-31','2021-02-10',3580000),('AA2101100015','A','A','2101wage','2020100015','2021-01-01','2021-01-31','2021-01-01',NULL,NULL,'서민환','2021-01-08 00:00:00','2021-01-31','2021-02-10',5250000);
/*!40000 ALTER TABLE `hu_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huinfo_tbl`
--

DROP TABLE IF EXISTS `huinfo_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huinfo_tbl` (
  `hunum` varchar(12) NOT NULL,
  `seq` int DEFAULT NULL,
  `dldate` date DEFAULT NULL,
  `empid` varchar(12) DEFAULT NULL,
  `allowcd` char(2) DEFAULT NULL,
  `allowpay` int DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  KEY `hunum` (`hunum`),
  CONSTRAINT `huinfo_tbl_ibfk_1` FOREIGN KEY (`hunum`) REFERENCES `hu_tbl` (`hunum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huinfo_tbl`
--

LOCK TABLES `huinfo_tbl` WRITE;
/*!40000 ALTER TABLE `huinfo_tbl` DISABLE KEYS */;
INSERT INTO `huinfo_tbl` VALUES ('AA2101100015',0,NULL,'2020100015','A',0,NULL,'서민환','2021-01-08 13:52:36'),('AA2101100015',0,NULL,'2020100015','B',0,NULL,'서민환','2021-01-08 13:52:36'),('AA2101100015',2,'2021-01-18','2020100015','D',50000,'프로젝트 수당','서민환','2021-01-08 14:08:28'),('AA2101100001',0,NULL,'2020100001','A',0,NULL,'서민환','2021-01-08 14:51:13'),('AA2101100001',0,NULL,'2020100001','B',0,NULL,'서민환','2021-01-08 14:51:13'),('AA2101100003',0,NULL,'2020100003','A',0,NULL,'서정근','2021-01-08 14:51:13'),('AA2101100003',0,NULL,'2020100003','B',0,NULL,'서정근','2021-01-08 14:51:13'),('AA2101100004',0,NULL,'2020100004','A',0,NULL,'신영현','2021-01-08 14:51:13'),('AA2101100004',0,NULL,'2020100004','B',0,NULL,'신영현','2021-01-08 14:51:13'),('AA2101100006',0,NULL,'2020100006','A',0,NULL,'김성대','2021-01-08 14:51:13'),('AA2101100006',0,NULL,'2020100006','B',0,NULL,'김성대','2021-01-08 14:51:13'),('AA2101100007',0,NULL,'2020100007','A',0,NULL,'김선주','2021-01-08 14:51:13'),('AA2101100007',0,NULL,'2020100007','B',0,NULL,'김선주','2021-01-08 14:51:13'),('AA2101100008',0,NULL,'2020100008','A',0,NULL,'최유정','2021-01-08 14:51:13'),('AA2101100010',0,NULL,'2020100010','A',0,NULL,'최경민','2021-01-08 14:51:13'),('AA2101100010',0,NULL,'2020100010','B',0,NULL,'최경민','2021-01-08 14:51:13'),('AA2101100011',0,NULL,'2020100011','A',0,NULL,'김희연','2021-01-08 14:51:13'),('AA2101100011',0,NULL,'2020100011','B',0,NULL,'김희연','2021-01-08 14:51:13'),('AA2101100012',0,NULL,'2020100012','A',0,NULL,'이윤혜','2021-01-08 14:51:13'),('AA2101100012',0,NULL,'2020100012','B',0,NULL,'이윤혜','2021-01-08 14:51:13'),('AA2101100013',0,NULL,'2020100013','A',0,NULL,'송하권','2021-01-08 14:51:13'),('AA2101100013',0,NULL,'2020100013','B',0,NULL,'송하권','2021-01-08 14:52:00'),('AA2101100008',0,NULL,'2020100008','B',0,NULL,'최유정','2021-01-08 14:53:07'),('AA2101100015',3,'2021-01-19','2020100015','C',80000,'','이주희','2021-01-14 16:52:45'),('AA2101100013',1,'2021-01-14','2020100013','A',2,'','이주희','2021-01-14 16:52:58'),('AA2101100012',1,'2021-01-19','2020100012','B',100000,'','이주희','2021-01-14 16:53:16'),('AA2101100001',0,NULL,'2020100001','C',0,NULL,'2020100001','2021-01-14 17:16:18'),('AA2101100001',0,NULL,'2020100001','D',0,NULL,'2020100001','2021-01-14 17:16:18'),('AA2101100003',0,NULL,'2020100003','C',0,NULL,'2020100003','2021-01-14 17:16:18'),('AA2101100003',0,NULL,'2020100003','D',0,NULL,'2020100003','2021-01-14 17:16:18'),('AA2101100004',0,NULL,'2020100004','C',0,NULL,'2020100004','2021-01-14 17:16:18'),('AA2101100004',0,NULL,'2020100004','D',0,NULL,'2020100004','2021-01-14 17:16:18'),('AA2101100006',0,NULL,'2020100006','C',0,NULL,'2020100006','2021-01-14 17:16:19'),('AA2101100006',0,NULL,'2020100006','D',0,NULL,'2020100006','2021-01-14 17:16:19'),('AA2101100007',0,NULL,'2020100007','C',0,NULL,'2020100007','2021-01-14 17:16:19'),('AA2101100007',0,NULL,'2020100007','D',0,NULL,'2020100007','2021-01-14 17:16:19'),('AA2101100008',0,NULL,'2020100008','C',0,NULL,'2020100008','2021-01-14 17:16:19'),('AA2101100008',0,NULL,'2020100008','D',0,NULL,'2020100008','2021-01-14 17:16:19'),('AA2101100010',0,NULL,'2020100010','C',0,NULL,'2020100010','2021-01-14 17:16:19'),('AA2101100010',0,NULL,'2020100010','D',0,NULL,'2020100010','2021-01-14 17:16:19'),('AA2101100011',0,NULL,'2020100011','C',0,NULL,'2020100011','2021-01-14 17:16:19'),('AA2101100011',0,NULL,'2020100011','D',0,NULL,'2020100011','2021-01-14 17:16:19'),('AA2101100012',0,NULL,'2020100012','C',0,NULL,'2020100012','2021-01-14 17:16:19'),('AA2101100012',0,NULL,'2020100012','D',0,NULL,'2020100012','2021-01-14 17:16:19'),('AA2101100013',0,NULL,'2020100013','C',0,NULL,'2020100013','2021-01-14 17:16:19'),('AA2101100013',0,NULL,'2020100013','D',0,NULL,'2020100013','2021-01-14 17:16:20');
/*!40000 ALTER TABLE `huinfo_tbl` ENABLE KEYS */;
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
  `itemPhoto` varchar(300) DEFAULT NULL,
  `photoName` varchar(150) DEFAULT NULL,
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
INSERT INTO `item_tbl` VALUES ('AA20210101','다이아몬드','A','A',400000,'1C','1C',NULL,'관리자','2021-01-05 14:21:37',NULL,'9a111a89-bb6e-42b9-91c2-20af796a0b35_diamond.jpg','diamond.jpg'),('AB20210101','프로펠러','A','B',200000,'비행기용','비행기용',NULL,'관리자','2021-01-05 14:24:13',NULL,'dbb9fa3a-b457-484f-a390-8ea234f7bd18_propeller.jpg','propeller.jpg'),('BA20210101','타이어(대)','B','A',60000,'대형','대형',NULL,'관리자','2021-01-05 14:16:51',NULL,'85264123-245e-4bdc-b64b-b788e8b5cb93_car.jpg','car.jpg'),('BA20210102','타이어(소)','B','A',30000,'소형','소형',NULL,'관리자','2021-01-05 14:28:57',NULL,'cd12942a-1ef2-4485-8ea4-0692c65b6032_wheel.jpg','wheel.jpg'),('BC20210101','시계','B','C',215000,'기계식','기계식',NULL,'관리자','2021-01-05 14:28:36',NULL,'588dd740-2bd7-45cb-81c2-1bb897376fc0_watch.jpg','watch.jpg'),('BD20210101','반지','B','D',200000,'','',NULL,'관리자','2021-01-05 14:28:06',NULL,'7dda8bfd-6a13-4f11-b7e6-a496e32fa07b_ring.jpg','ring.jpg'),('BE20210101','강화유리','B','E',100000,'1장','1장',NULL,'관리자','2021-01-05 14:27:06',NULL,'3d6e02fe-4f2f-4d5e-b7bc-39c42ad64904_glass.jpg','glass.jpg'),('CC20210101','드릴','C','C',40000,'','',NULL,'관리자','2021-01-05 14:23:24',NULL,'8c6620ef-bf4f-497c-a6d6-ea2afcbb2ee8_drill.jpg','drill.jpg'),('CD20210101','금','C','D',160000,'1돈','1돈',NULL,'관리자','2021-01-05 14:23:47',NULL,'41520add-f141-4c71-9868-3ec265032cb8_gold.jpg','gold.jpg'),('CD20210102','은','A','A',70000,'1돈','1돈',NULL,'관리자','2021-01-05 14:27:39',NULL,'b7c862ae-456d-48de-a689-22392c74b870_silver.jpg','silver.jpg');
/*!40000 ALTER TABLE `item_tbl` ENABLE KEYS */;
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
  `saleyn` char(1) NOT NULL DEFAULT 'N',
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
INSERT INTO `order_tbl` VALUES ('20210106001','2021-01-06','2021-01-13','CD20210102','BA002','','관리자',5,350000,'완료',NULL,NULL,'2021-01-06 09:53:58','Y'),('20210106002','2021-01-07','2021-01-14','CD20210101','BA002','gold','관리자',5,800000,'',NULL,NULL,'2021-01-06 10:02:05','Y'),('20210106003','2021-01-11','','CC20210101','CA003','','관리자',5,200000,'',NULL,NULL,'2021-01-06 12:25:02','Y'),('20210106004','2021-01-12','','BE20210101','AC003','','관리자',10,1000000,'',NULL,NULL,'2021-01-06 12:26:28','Y'),('20210106005','2021-01-06','','BD20210101','AB008','','관리자',5,1000000,'',NULL,NULL,'2021-01-06 14:09:42','Y'),('20210106006','2021-01-08','','BC20210101','AA012','','관리자',1,215000,'',NULL,NULL,'2021-01-06 14:16:36','Y'),('20210106007','2021-01-19','','BA20210102','AC003','','관리자',30,900000,'30개만 주문',NULL,NULL,'2021-01-06 14:18:16','Y'),('20210106008','2021-01-11','','BA20210101','AC003','','관리자',1,60000,'',NULL,NULL,'2021-01-06 14:20:12','Y'),('20210106009','2021-01-12','','AB20210101','AA005','','관리자',1,200000,'',NULL,NULL,'2021-01-06 14:20:41','Y'),('20210106010','2021-01-06','','AA20210101','CA006','','관리자',8,3200000,'',NULL,NULL,'2021-01-06 14:51:28','Y');
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
INSERT INTO `sale_tbl` VALUES ('20210106001','2021-01-18','20210106001','CD20210102','BA002','','관리자',5,350000,'',NULL,NULL,'2021-01-06 12:22:34'),('20210106002','2021-01-19','20210106002','CD20210101','BA002','','관리자',5,800000,'',NULL,NULL,'2021-01-06 12:22:46'),('20210106003','2021-01-19','20210106003','CC20210101','CA003','','관리자',5,200000,'',NULL,NULL,'2021-01-06 15:25:41'),('20210106004','2021-01-06','20210106004','BE20210101','AC003','','관리자',10,1000000,'',NULL,NULL,'2021-01-06 16:36:18'),('20210106005','2021-01-06','20210106005','BD20210101','AB008','','관리자',5,1000000,'',NULL,NULL,'2021-01-06 16:36:24'),('20210106006','2021-01-06','20210106006','BC20210101','AA012','','관리자',1,215000,'',NULL,NULL,'2021-01-06 16:36:30'),('20210106007','2021-01-06','20210106007','BA20210102','AC003','','관리자',30,900000,'',NULL,NULL,'2021-01-06 16:36:35'),('20210106008','2021-01-06','20210106010','AA20210101','CA006','','관리자',8,3200000,'',NULL,NULL,'2021-01-06 16:36:41'),('20210106009','2021-01-06','20210106009','AB20210101','AA005','','관리자',1,200000,'',NULL,NULL,'2021-01-06 16:36:47'),('20210106010','2021-01-06','20210106008','BA20210101','AC003','','관리자',1,60000,'',NULL,NULL,'2021-01-06 16:36:55');
/*!40000 ALTER TABLE `sale_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tbl`
--

DROP TABLE IF EXISTS `schedule_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tbl` (
  `cal_id` int NOT NULL AUTO_INCREMENT,
  `startDate` char(12) DEFAULT NULL,
  `endDate` char(12) DEFAULT NULL,
  `calContent` varchar(255) DEFAULT NULL,
  `empid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tbl`
--

LOCK TABLES `schedule_tbl` WRITE;
/*!40000 ALTER TABLE `schedule_tbl` DISABLE KEYS */;
INSERT INTO `schedule_tbl` VALUES (32,'2020-12-24','2020-12-25','일정추가 테스트','admin'),(34,'2020-12-28','2020-12-31','일정 수정 테스트','2020100001'),(36,'2020-12-06','2020-12-12','2주 테스트','2020100001'),(37,'2021-01-04','2021-01-08','1주차 일정(수주 프로그램 개발)','admin'),(38,'2021-01-07','2021-01-09','1주차 일정','2020200001'),(39,'2021-01-11','2021-01-12','11일 일정','2020100001'),(40,'2021-01-13','2021-01-13','일정등록','2020200001');
/*!40000 ALTER TABLE `schedule_tbl` ENABLE KEYS */;
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
  `itemPhoto` varchar(300) DEFAULT NULL,
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
INSERT INTO `stock_tbl` VALUES ('AA20210101','다이아몬드','1C',0,NULL,'2021-01-05 14:21:37','9a111a89-bb6e-42b9-91c2-20af796a0b35_diamond.jpg'),('AB20210101','프로펠러','비행기용',0,NULL,'2021-01-05 14:24:13','dbb9fa3a-b457-484f-a390-8ea234f7bd18_propeller.jpg'),('BA20210101','타이어(대)','대형',0,NULL,'2021-01-05 14:16:51','85264123-245e-4bdc-b64b-b788e8b5cb93_car.jpg'),('BA20210102','타이어(소)','소형',0,NULL,'2021-01-05 14:28:57','cd12942a-1ef2-4485-8ea4-0692c65b6032_wheel.jpg'),('BC20210101','시계','기계식',0,NULL,'2021-01-05 14:28:36','588dd740-2bd7-45cb-81c2-1bb897376fc0_watch.jpg'),('BD20210101','반지','',0,NULL,'2021-01-05 14:28:06','7dda8bfd-6a13-4f11-b7e6-a496e32fa07b_ring.jpg'),('BE20210101','강화유리','1장',0,NULL,'2021-01-05 14:27:06','3d6e02fe-4f2f-4d5e-b7bc-39c42ad64904_glass.jpg'),('CC20210101','드릴','',0,NULL,'2021-01-05 14:23:24','8c6620ef-bf4f-497c-a6d6-ea2afcbb2ee8_drill.jpg'),('CD20210101','금','1돈',0,NULL,'2021-01-05 14:23:47','41520add-f141-4c71-9868-3ec265032cb8_gold.jpg'),('CD20210102','은','1돈',0,NULL,'2021-01-05 14:27:39','b7c862ae-456d-48de-a689-22392c74b870_silver.jpg');
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
  `indt` varchar(10) DEFAULT NULL,
  `outdt` varchar(10) DEFAULT NULL,
  `inqty` int DEFAULT '0',
  `outqty` int DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL,
  `insert_person` varchar(10) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `ordnum` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`itemcd`,`seq`),
  CONSTRAINT `stockinfo_tbl_ibfk_1` FOREIGN KEY (`itemcd`) REFERENCES `stock_tbl` (`itemcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockinfo_tbl`
--

LOCK TABLES `stockinfo_tbl` WRITE;
/*!40000 ALTER TABLE `stockinfo_tbl` DISABLE KEYS */;
INSERT INTO `stockinfo_tbl` VALUES ('AA20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:21:37',NULL),('AA20210101',1,'A','2021-01-11',NULL,0,0,'다음주 입고 예정','관리자','2021-01-06 09:46:05',NULL),('AA20210101',2,'A','2021-01-11',NULL,10,0,'다음주 입고예정','관리자','2021-01-06 09:46:21',NULL),('AA20210101',3,'C',NULL,'2021-01-06',0,8,NULL,NULL,'2021-01-06 16:36:41','20210106010'),('AB20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:24:13',NULL),('AB20210101',1,'A','2021-01-08',NULL,5,0,'아시아나항공 보낼예정','관리자','2021-01-06 09:47:35',NULL),('AB20210101',2,'C',NULL,'2021-01-06',0,1,NULL,NULL,'2021-01-06 16:36:47','20210106009'),('BA20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:16:51',NULL),('BA20210101',1,'A','',NULL,10,0,'한국타이어로 보낼 예정','관리자','2021-01-06 09:45:42',NULL),('BA20210101',2,'C',NULL,'2021-01-06',0,1,NULL,NULL,'2021-01-06 16:36:55','20210106008'),('BA20210102',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:28:57',NULL),('BA20210102',1,'A','2021-01-05',NULL,14,0,'5개 판매예정','관리자','2021-01-05 16:09:35',NULL),('BA20210102',2,'C',NULL,'2021-01-06',0,30,NULL,NULL,'2021-01-06 16:36:35','20210106007'),('BA20210102',3,'A','2021-01-05',NULL,17,0,'','관리자','2021-01-06 16:37:39',NULL),('BC20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:28:36',NULL),('BC20210101',2,'A','2021-01-08',NULL,3,0,'','관리자','2021-01-06 16:32:59',NULL),('BC20210101',3,'C',NULL,'2021-01-06',0,1,NULL,NULL,'2021-01-06 16:36:30','20210106006'),('BD20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:28:06',NULL),('BD20210101',1,'A','2021-01-22',NULL,7,0,'','관리자','2021-01-06 09:49:22',NULL),('BD20210101',2,'C',NULL,'2021-01-06',0,5,NULL,NULL,'2021-01-06 16:36:24','20210106005'),('BE20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:27:06',NULL),('BE20210101',1,'A','2021-01-25',NULL,12,0,'','관리자','2021-01-06 09:48:57',NULL),('BE20210101',2,'C',NULL,'2021-01-06',0,10,NULL,NULL,'2021-01-06 16:36:18','20210106004'),('CC20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:23:24',NULL),('CC20210101',1,'A','2021-01-13',NULL,50,0,'','관리자','2021-01-06 09:46:46',NULL),('CC20210101',2,'C',NULL,'2021-01-19',0,5,NULL,NULL,'2021-01-06 15:25:41','20210106003'),('CD20210101',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:23:47',NULL),('CD20210101',1,'A','2021-01-15',NULL,10,0,'단위 : 돈','관리자','2021-01-06 09:47:06',NULL),('CD20210101',2,'C',NULL,'2021-01-19',0,5,NULL,NULL,'2021-01-06 12:22:46','20210106002'),('CD20210102',0,'D',NULL,NULL,0,0,NULL,NULL,'2021-01-05 14:27:39',NULL),('CD20210102',1,'A','2021-01-29',NULL,100,0,'','관리자','2021-01-06 09:49:10',NULL),('CD20210102',2,'C',NULL,'2021-01-18',0,5,NULL,NULL,'2021-01-06 12:22:34','20210106001');
/*!40000 ALTER TABLE `stockinfo_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-20 15:04:19
