-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- 생성 시간: 21-03-26 06:11
-- 서버 버전: 10.4.13-MariaDB
-- PHP 버전: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `sht`
--
CREATE DATABASE IF NOT EXISTS `sht` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sht`;

-- --------------------------------------------------------

--
-- 테이블 구조 `authorrole`
--

DROP TABLE IF EXISTS `authorrole`;
CREATE TABLE IF NOT EXISTS `authorrole` (
  `AUTHORROLE_ID` decimal(20,0) NOT NULL,
  `ROLE_PTTRN` varchar(255) NOT NULL,
  `AUTHOR_CODE` varchar(255) NOT NULL,
  `AUTHORROLE_DC` varchar(255) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  PRIMARY KEY (`AUTHORROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `authorrole`
--

INSERT INTO `authorrole` (`AUTHORROLE_ID`, `ROLE_PTTRN`, `AUTHOR_CODE`, `AUTHORROLE_DC`, `SORT_ORDR`, `USE_AT`) VALUES
('1', '/.*.*.*', 'ROLE_ANONYMOUS', '전체허용', '1', 'Y'),
('2', '/cop/com/.*.do.*', 'ROLE_ANONYMOUS', '전체허용', '2', 'Y'),
('3', '/cop/bbs/*Master*.do', 'ROLE_USER', '사용자만허용게시판', '3', 'Y'),
('4', '/uat/uia/.*.do.*', 'ROLE_USER', '사용자만허용', '4', 'Y'),
('5', '/uss/umt/mber/.*.do.*', 'ROLE_USER', '사용자만허용', '5', 'Y'),
('6', '/uat/uia/actionLogin.do', 'ROLE_ANONYMOUS', '전체허용', '6', 'Y'),
('7', '/uat/uia/egovLoginUsr.do', 'ROLE_ANONYMOUS', '전체허용', '7', 'Y'),
('8', '/tiles/login.do', 'ROLE_ANONYMOUS', '전체허용', '8', 'Y'),
('9', '/login_action.do', 'ROLE_ANONYMOUS', '전체허용', '9', 'Y'),
('10', '/cop/bbs/*Master*.do', 'ROLE_USER', '사용자만허용', '10', 'Y'),
('11', '/admin/.*.*.*', 'ROLE_ADMIN', '관리자만전체허용', '11', 'Y'),
('12', '/tiles/board/insert_board_form.*BBSMSTR_AAAAAAAAAAAA', 'ROLE_ADMIN', '관리자만전체허용', '12', 'Y');

-- --------------------------------------------------------

--
-- 테이블 구조 `comtecopseq`
--

DROP TABLE IF EXISTS `comtecopseq`;
CREATE TABLE IF NOT EXISTS `comtecopseq` (
  `TABLE_NAME` varchar(20) NOT NULL,
  `NEXT_ID` decimal(30,0) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`),
  UNIQUE KEY `COMTECOPSEQ_PK` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `comvnusermaster`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `comvnusermaster`;
CREATE TABLE IF NOT EXISTS `comvnusermaster` (
`ESNTL_ID` char(20)
,`USER_ID` varchar(20)
,`PASSWORD` varchar(200)
,`USER_NM` varchar(60)
,`USER_ZIP` varchar(6)
,`USER_ADRES` varchar(100)
,`USER_EMAIL` varchar(50)
,`GROUP_ID` varchar(20)
,`USER_SE` varchar(3)
,`ORGNZT_ID` varchar(20)
);

-- --------------------------------------------------------

--
-- 테이블 구조 `ids`
--

DROP TABLE IF EXISTS `ids`;
CREATE TABLE IF NOT EXISTS `ids` (
  `TABLE_NAME` varchar(20) NOT NULL,
  `NEXT_ID` decimal(30,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `ids`
--

INSERT INTO `ids` (`TABLE_NAME`, `NEXT_ID`) VALUES
('BBS_ID', '1'),
('FILE_ID', '11'),
('SAMPLE', '1'),
('SCHDUL_ID', '1'),
('TMPLAT_ID', '1');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettccmmnclcode`
--

DROP TABLE IF EXISTS `lettccmmnclcode`;
CREATE TABLE IF NOT EXISTS `lettccmmnclcode` (
  `CL_CODE` char(3) NOT NULL,
  `CL_CODE_NM` varchar(60) DEFAULT NULL,
  `CL_CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettccmmnclcode`
--

INSERT INTO `lettccmmnclcode` (`CL_CODE`, `CL_CODE_NM`, `CL_CODE_DC`, `USE_AT`, `FRST_REGIST_PNTTM`, `FRST_REGISTER_ID`, `LAST_UPDT_PNTTM`, `LAST_UPDUSR_ID`) VALUES
('LET', '전자정부 프레임워크 경량환경 템플릿', '전자정부 프레임워크 경량환경 템플릿', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettccmmncode`
--

DROP TABLE IF EXISTS `lettccmmncode`;
CREATE TABLE IF NOT EXISTS `lettccmmncode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE_ID_NM` varchar(60) DEFAULT NULL,
  `CODE_ID_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `CL_CODE` char(3) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  KEY `R_179` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettccmmncode`
--

INSERT INTO `lettccmmncode` (`CODE_ID`, `CODE_ID_NM`, `CODE_ID_DC`, `USE_AT`, `CL_CODE`, `FRST_REGIST_PNTTM`, `FRST_REGISTER_ID`, `LAST_UPDT_PNTTM`, `LAST_UPDUSR_ID`) VALUES
('COM001', '등록구분', '게시판, 커뮤니티, 동호회 등록구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM003', '업무구분', '업무구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM004', '게시판유형', '게시판유형구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM005', '템플릿유형', '템플릿유형구분코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM009', '게시판속성', '게시판 속성', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM019', '일정중요도', '일정중요도 낮음/보통/높음 상태구분', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM030', '일정구분', '일정구분 코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM031', '반복구분', '일정 반복구분 코드', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM998', '성별', '성별 구분 남/여', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM999', '회원상태', '회원로그인가능상태 활성/비활성', 'Y', 'LET', '2011-08-02 21:01:59', 'SYSTEM', '2021-02-02 21:01:59', 'SYSTEM');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettccmmndetailcode`
--

DROP TABLE IF EXISTS `lettccmmndetailcode`;
CREATE TABLE IF NOT EXISTS `lettccmmndetailcode` (
  `CODE_ID` varchar(6) NOT NULL,
  `CODE` varchar(15) NOT NULL,
  `CODE_NM` varchar(60) DEFAULT NULL,
  `CODE_DC` varchar(200) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettccmmndetailcode`
--

INSERT INTO `lettccmmndetailcode` (`CODE_ID`, `CODE`, `CODE_NM`, `CODE_DC`, `USE_AT`, `FRST_REGIST_PNTTM`, `FRST_REGISTER_ID`, `LAST_UPDT_PNTTM`, `LAST_UPDUSR_ID`) VALUES
('COM001', 'REGC01', '단일 게시판 이용등록', '단일 게시판 이용등록', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM001', 'REGC07', '게시판사용자등록', '게시판사용자등록', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM003', 'BBS', '게시판', '게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM004', 'BBST01', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM004', 'BBST02', '익명게시판', '익명게시판', 'N', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM004', 'BBST03', '공지게시판', '공지게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM005', 'TMPT01', '게시판템플릿', '게시판템플릿', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM009', 'BBSA01', '유효게시판', '유효게시판', 'N', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM009', 'BBSA02', '갤러리', '갤러리', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM009', 'BBSA03', '일반게시판', '일반게시판', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM019', 'A', '높음', '높음', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM019', 'B', '보통', '보통', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM019', 'C', '낮음', '낮음', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM030', '1', '회의', '회의', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM030', '2', '세미나', '세미나', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM030', '3', '강의', '강의', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM030', '4', '교육', '교육', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM030', '5', '기타', '기타', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM031', '1', '당일', '당일', 'Y', '2011-08-02 21:01:59', 'SYSTEM', '2011-08-02 21:01:59', 'SYSTEM'),
('COM031', '2', '반복', '반복', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM031', '3', '연속', '연속', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM031', '4', '요일반복', '요일반복', 'Y', '2011-08-02 21:02:00', 'SYSTEM', '2011-08-02 21:02:00', 'SYSTEM'),
('COM999', 'P', '활성', '로그인가능', 'Y', '2021-02-02 21:01:59', 'SYSTEM', '2021-02-02 21:01:59', 'SYSTEM'),
('COM999', 'S', '비활성', '로그인불가', 'Y', '2021-02-02 21:01:59', 'SYSTEM', '2021-02-02 21:01:59', 'SYSTEM');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnauthorgroupinfo`
--

DROP TABLE IF EXISTS `lettnauthorgroupinfo`;
CREATE TABLE IF NOT EXISTS `lettnauthorgroupinfo` (
  `GROUP_ID` char(20) NOT NULL DEFAULT '',
  `GROUP_NM` varchar(60) NOT NULL,
  `GROUP_CREAT_DE` char(20) NOT NULL,
  `GROUP_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnauthorgroupinfo`
--

INSERT INTO `lettnauthorgroupinfo` (`GROUP_ID`, `GROUP_NM`, `GROUP_CREAT_DE`, `GROUP_DC`) VALUES
('GROUP_00000000000000', 'ROLE_ADMIN', '2011-08-02 21:01:59', '관리자그룹'),
('GROUP_00000000000001', 'ROLE_USER', '2021-02-02 21:01:59', '사용자그룹'),
('GROUP_00000000000002', 'ROLE_ANONYMOUS', '2021-02-02 21:01:59', '비회원 그룹');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnbbs`
--

DROP TABLE IF EXISTS `lettnbbs`;
CREATE TABLE IF NOT EXISTS `lettnbbs` (
  `NTT_ID` decimal(20,0) NOT NULL,
  `BBS_ID` char(20) NOT NULL,
  `NTT_NO` decimal(20,0) DEFAULT NULL,
  `NTT_SJ` varchar(2000) DEFAULT NULL,
  `NTT_CN` mediumtext DEFAULT NULL,
  `ANSWER_AT` char(1) DEFAULT NULL,
  `PARNTSCTT_NO` decimal(10,0) DEFAULT NULL,
  `ANSWER_LC` int(11) DEFAULT NULL,
  `SORT_ORDR` decimal(8,0) DEFAULT NULL,
  `RDCNT` decimal(10,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `NTCE_BGNDE` char(20) DEFAULT NULL,
  `NTCE_ENDDE` char(20) DEFAULT NULL,
  `NTCR_ID` varchar(20) DEFAULT NULL,
  `NTCR_NM` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`NTT_ID`,`BBS_ID`),
  KEY `LETTNBBS_ibfk_1` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnbbs`
--

INSERT INTO `lettnbbs` (`NTT_ID`, `BBS_ID`, `NTT_NO`, `NTT_SJ`, `NTT_CN`, `ANSWER_AT`, `PARNTSCTT_NO`, `ANSWER_LC`, `SORT_ORDR`, `RDCNT`, `USE_AT`, `NTCE_BGNDE`, `NTCE_ENDDE`, `NTCR_ID`, `NTCR_NM`, `PASSWORD`, `ATCH_FILE_ID`, `FRST_REGIST_PNTTM`, `FRST_REGISTER_ID`, `LAST_UPDT_PNTTM`, `LAST_UPDUSR_ID`) VALUES
('1', 'BBSMSTR_AAAAAAAAAAAA', '1', '홈페이지 샘플공지1', '홈페이지 샘플공지1', 'N', '0', 0, '1', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('2', 'BBSMSTR_AAAAAAAAAAAA', '1', '홈페이지 샘플공지2', '홈페이지 샘플공지2', 'N', '0', 0, '2', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('3', 'BBSMSTR_AAAAAAAAAAAA', '1', '홈페이지 샘플공지3', '홈페이지 샘플공지3', 'N', '0', 0, '3', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('4', 'BBSMSTR_AAAAAAAAAAAA', '1', '홈페이지 샘플공지4', '홈페이지 샘플공지4', 'N', '0', 0, '4', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('5', 'BBSMSTR_AAAAAAAAAAAA', '1', '홈페이지 샘플공지5', '홈페이지 샘플공지5', 'N', '0', 0, '5', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('6', 'BBSMSTR_BBBBBBBBBBBB', '1', '홈페이지 샘플게시1', '홈페이지 샘플게시1', 'N', '0', 0, '6', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('7', 'BBSMSTR_BBBBBBBBBBBB', '1', '홈페이지 샘플게시2', '홈페이지 샘플게시2', 'N', '0', 0, '7', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('8', 'BBSMSTR_BBBBBBBBBBBB', '1', '홈페이지 샘플게시3', '홈페이지 샘플게시3', 'N', '0', 0, '8', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('9', 'BBSMSTR_BBBBBBBBBBBB', '1', '홈페이지 샘플게시4', '홈페이지 샘플게시4', 'N', '0', 0, '9', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', NULL, NULL),
('10', 'BBSMSTR_BBBBBBBBBBBB', '1', '홈페이지 샘플게시5', '홈페이지 샘플게시5', 'N', '0', 0, '10', '1', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:28:18', 'USRCNFRM_00000000000', '2021-02-09 16:54:20', 'USRCNFRM_00000000000'),
('11', 'BBSMSTR_BBBBBBBBBBBB', '2', 'RE: 홈페이지 샘플게시5', '답글 테스트', 'Y', '10', 1, '10', '0', 'Y', '10000101', '99991231', '', '', '', NULL, '2021-02-09 16:54:45', 'USRCNFRM_00000000000', NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnbbsmaster`
--

DROP TABLE IF EXISTS `lettnbbsmaster`;
CREATE TABLE IF NOT EXISTS `lettnbbsmaster` (
  `BBS_ID` char(20) NOT NULL,
  `BBS_NM` varchar(255) NOT NULL,
  `BBS_INTRCN` varchar(2400) DEFAULT NULL,
  `BBS_TY_CODE` char(6) NOT NULL,
  `BBS_ATTRB_CODE` char(6) NOT NULL,
  `REPLY_POSBL_AT` char(1) DEFAULT NULL,
  `FILE_ATCH_POSBL_AT` char(1) NOT NULL,
  `ATCH_POSBL_FILE_NUMBER` decimal(2,0) NOT NULL,
  `ATCH_POSBL_FILE_SIZE` decimal(8,0) DEFAULT NULL,
  `USE_AT` char(1) NOT NULL,
  `TMPLAT_ID` char(20) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `FRST_REGIST_PNTTM` datetime NOT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnbbsmaster`
--

INSERT INTO `lettnbbsmaster` (`BBS_ID`, `BBS_NM`, `BBS_INTRCN`, `BBS_TY_CODE`, `BBS_ATTRB_CODE`, `REPLY_POSBL_AT`, `FILE_ATCH_POSBL_AT`, `ATCH_POSBL_FILE_NUMBER`, `ATCH_POSBL_FILE_SIZE`, `USE_AT`, `TMPLAT_ID`, `FRST_REGISTER_ID`, `FRST_REGIST_PNTTM`, `LAST_UPDUSR_ID`, `LAST_UPDT_PNTTM`) VALUES
('BBSMSTR_AAAAAAAAAAAA', '공지사항', '공지사항게시판', 'BBST03', 'BBSA03', 'Y', 'Y', '2', '5242880', 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00'),
('BBSMSTR_BBBBBBBBBBBB', '갤러리', '갤러리게시판', 'BBST01', 'BBSA02', 'Y', 'Y', '2', '5242880', 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00'),
('BBSMSTR_CCCCCCCCCCCC', '자료실', '자료실게시판', 'BBST01', 'BBSA03', 'Y', 'Y', '2', '5242880', 'Y', 'TMPLAT_BOARD_DEFAULT', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnbbsmasteroptn`
--

DROP TABLE IF EXISTS `lettnbbsmasteroptn`;
CREATE TABLE IF NOT EXISTS `lettnbbsmasteroptn` (
  `BBS_ID` char(20) NOT NULL DEFAULT '',
  `ANSWER_AT` char(1) NOT NULL DEFAULT '',
  `STSFDG_AT` char(1) NOT NULL DEFAULT '',
  `FRST_REGIST_PNTTM` datetime NOT NULL DEFAULT current_timestamp(),
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL DEFAULT '',
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnbbsuse`
--

DROP TABLE IF EXISTS `lettnbbsuse`;
CREATE TABLE IF NOT EXISTS `lettnbbsuse` (
  `BBS_ID` char(20) NOT NULL,
  `TRGET_ID` char(20) NOT NULL DEFAULT '',
  `USE_AT` char(1) NOT NULL,
  `REGIST_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) NOT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`TRGET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnbbsuse`
--

INSERT INTO `lettnbbsuse` (`BBS_ID`, `TRGET_ID`, `USE_AT`, `REGIST_SE_CODE`, `FRST_REGIST_PNTTM`, `FRST_REGISTER_ID`, `LAST_UPDT_PNTTM`, `LAST_UPDUSR_ID`) VALUES
('BBSMSTR_AAAAAAAAAAAA', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-09-05 18:15:31', ''),
('BBSMSTR_BBBBBBBBBBBB', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000'),
('BBSMSTR_CCCCCCCCCCCC', 'SYSTEM_DEFAULT_BOARD', 'Y', 'REGC01', '2011-08-31 12:00:00', 'USRCNFRM_00000000000', '2011-08-31 12:00:00', 'USRCNFRM_00000000000');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnemplyrinfo`
--

DROP TABLE IF EXISTS `lettnemplyrinfo`;
CREATE TABLE IF NOT EXISTS `lettnemplyrinfo` (
  `EMPLYR_ID` varchar(20) NOT NULL,
  `ORGNZT_ID` char(20) DEFAULT NULL,
  `USER_NM` varchar(60) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `EMPL_NO` varchar(20) DEFAULT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `BRTHDY` char(20) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `HOUSE_ADRES` varchar(100) DEFAULT NULL,
  `PASSWORD_HINT` varchar(100) NOT NULL,
  `PASSWORD_CNSR` varchar(100) NOT NULL,
  `HOUSE_END_TELNO` varchar(4) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `OFFM_TELNO` varchar(20) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `OFCPS_NM` varchar(60) DEFAULT NULL,
  `HOUSE_MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `PSTINST_CODE` char(8) DEFAULT NULL,
  `EMPLYR_STTUS_CODE` varchar(15) NOT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  `CRTFC_DN_VALUE` varchar(20) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`),
  KEY `LETTNEMPLYRINFO_ibfk_2` (`GROUP_ID`),
  KEY `LETTNEMPLYRINFO_ibfk_1` (`ORGNZT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnemplyrinfo`
--

INSERT INTO `lettnemplyrinfo` (`EMPLYR_ID`, `ORGNZT_ID`, `USER_NM`, `PASSWORD`, `EMPL_NO`, `IHIDNUM`, `SEXDSTN_CODE`, `BRTHDY`, `FXNUM`, `HOUSE_ADRES`, `PASSWORD_HINT`, `PASSWORD_CNSR`, `HOUSE_END_TELNO`, `AREA_NO`, `DETAIL_ADRES`, `ZIP`, `OFFM_TELNO`, `MBTLNUM`, `EMAIL_ADRES`, `OFCPS_NM`, `HOUSE_MIDDLE_TELNO`, `GROUP_ID`, `PSTINST_CODE`, `EMPLYR_STTUS_CODE`, `ESNTL_ID`, `CRTFC_DN_VALUE`, `SBSCRB_DE`) VALUES
('admin', 'ORGNZT_0000000000000', '관리자', 'JfQ7FIatlaE5jj7rPYO8QBABX8yb7bNbQy4AKY1QIfc=', '', '', 'F', '', '', '관리자 주소', '', '', '', '', '', '', '', '', '', '', '', 'GROUP_00000000000000', '00000000', 'P', 'USRCNFRM_00000000000', '', '2011-08-02 21:01:59'),
('user_1', 'ORGNZT_0000000000000', '사용자_1', 'TUvyTbsWWm4P/XnXxSv+VNCyJCoj4C55fz9TUUUT2VM=', NULL, NULL, 'F', NULL, NULL, '집주소', '사는동네는?', '쌍용동', NULL, NULL, NULL, NULL, NULL, NULL, 'abc@abc.com', NULL, NULL, 'GROUP_00000000000000', NULL, 'P', 'USRCNFRM_1', NULL, '2021-02-16 14:31:59');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnentrprsmber`
--

DROP TABLE IF EXISTS `lettnentrprsmber`;
CREATE TABLE IF NOT EXISTS `lettnentrprsmber` (
  `ENTRPRS_MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `ENTRPRS_SE_CODE` char(15) DEFAULT NULL,
  `BIZRNO` varchar(10) DEFAULT NULL,
  `JURIRNO` varchar(13) DEFAULT NULL,
  `CMPNY_NM` varchar(60) NOT NULL,
  `CXFC` varchar(50) DEFAULT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `ADRES` varchar(100) DEFAULT NULL,
  `ENTRPRS_MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `FXNUM` varchar(20) DEFAULT NULL,
  `INDUTY_CODE` char(15) DEFAULT NULL,
  `APPLCNT_NM` varchar(50) NOT NULL,
  `APPLCNT_IHIDNUM` varchar(200) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `ENTRPRS_MBER_STTUS` varchar(15) DEFAULT NULL,
  `ENTRPRS_MBER_PASSWORD` varchar(200) NOT NULL,
  `ENTRPRS_MBER_PASSWORD_HINT` varchar(100) NOT NULL,
  `ENTRPRS_MBER_PASSWORD_CNSR` varchar(100) NOT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `ENTRPRS_END_TELNO` varchar(4) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `APPLCNT_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`ENTRPRS_MBER_ID`),
  KEY `LETTNENTRPRSMBER_ibfk_1` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnfile`
--

DROP TABLE IF EXISTS `lettnfile`;
CREATE TABLE IF NOT EXISTS `lettnfile` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `CREAT_DT` datetime NOT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnfiledetail`
--

DROP TABLE IF EXISTS `lettnfiledetail`;
CREATE TABLE IF NOT EXISTS `lettnfiledetail` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FILE_STRE_COURS` varchar(2000) NOT NULL,
  `STRE_FILE_NM` varchar(255) NOT NULL,
  `ORIGNL_FILE_NM` varchar(255) DEFAULT NULL,
  `FILE_EXTSN` varchar(20) NOT NULL,
  `FILE_CN` mediumtext DEFAULT NULL,
  `FILE_SIZE` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettngnrlmber`
--

DROP TABLE IF EXISTS `lettngnrlmber`;
CREATE TABLE IF NOT EXISTS `lettngnrlmber` (
  `MBER_ID` varchar(20) NOT NULL DEFAULT '',
  `PASSWORD` varchar(200) NOT NULL,
  `PASSWORD_HINT` varchar(100) NOT NULL,
  `PASSWORD_CNSR` varchar(100) NOT NULL,
  `IHIDNUM` varchar(200) DEFAULT NULL,
  `MBER_NM` varchar(50) NOT NULL,
  `ZIP` varchar(6) DEFAULT NULL,
  `ADRES` varchar(100) DEFAULT NULL,
  `AREA_NO` varchar(4) DEFAULT NULL,
  `MBER_STTUS` varchar(15) DEFAULT NULL,
  `DETAIL_ADRES` varchar(100) DEFAULT NULL,
  `END_TELNO` varchar(4) DEFAULT NULL,
  `MBTLNUM` varchar(20) DEFAULT NULL,
  `GROUP_ID` char(20) DEFAULT NULL,
  `MBER_FXNUM` varchar(20) DEFAULT NULL,
  `MBER_EMAIL_ADRES` varchar(50) DEFAULT NULL,
  `MIDDLE_TELNO` varchar(4) DEFAULT NULL,
  `SBSCRB_DE` datetime DEFAULT NULL,
  `SEXDSTN_CODE` char(1) DEFAULT NULL,
  `ESNTL_ID` char(20) NOT NULL,
  PRIMARY KEY (`MBER_ID`),
  KEY `LETTNGNRLMBER_ibfk_1` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnorgnztinfo`
--

DROP TABLE IF EXISTS `lettnorgnztinfo`;
CREATE TABLE IF NOT EXISTS `lettnorgnztinfo` (
  `ORGNZT_ID` char(20) NOT NULL DEFAULT '',
  `ORGNZT_NM` varchar(20) NOT NULL,
  `ORGNZT_DC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ORGNZT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettnorgnztinfo`
--

INSERT INTO `lettnorgnztinfo` (`ORGNZT_ID`, `ORGNZT_NM`, `ORGNZT_DC`) VALUES
('ORGNZT_0000000000000', '기본조직', '기본조직');

-- --------------------------------------------------------

--
-- 테이블 구조 `lettnschdulinfo`
--

DROP TABLE IF EXISTS `lettnschdulinfo`;
CREATE TABLE IF NOT EXISTS `lettnschdulinfo` (
  `SCHDUL_ID` char(20) NOT NULL,
  `SCHDUL_SE` char(1) DEFAULT NULL,
  `SCHDUL_DEPT_ID` varchar(20) DEFAULT NULL,
  `SCHDUL_KND_CODE` varchar(20) DEFAULT NULL,
  `SCHDUL_BEGINDE` datetime DEFAULT NULL,
  `SCHDUL_ENDDE` datetime DEFAULT NULL,
  `SCHDUL_NM` varchar(255) DEFAULT NULL,
  `SCHDUL_CN` varchar(2500) DEFAULT NULL,
  `SCHDUL_PLACE` varchar(255) DEFAULT NULL,
  `SCHDUL_IPCR_CODE` char(1) DEFAULT NULL,
  `SCHDUL_CHARGER_ID` varchar(20) DEFAULT NULL,
  `ATCH_FILE_ID` char(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `REPTIT_SE_CODE` char(3) DEFAULT NULL,
  PRIMARY KEY (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `lettntmplatinfo`
--

DROP TABLE IF EXISTS `lettntmplatinfo`;
CREATE TABLE IF NOT EXISTS `lettntmplatinfo` (
  `TMPLAT_ID` char(20) NOT NULL DEFAULT '',
  `TMPLAT_NM` varchar(255) DEFAULT NULL,
  `TMPLAT_COURS` varchar(2000) DEFAULT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  `TMPLAT_SE_CODE` char(6) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `lettntmplatinfo`
--

INSERT INTO `lettntmplatinfo` (`TMPLAT_ID`, `TMPLAT_NM`, `TMPLAT_COURS`, `USE_AT`, `TMPLAT_SE_CODE`, `FRST_REGISTER_ID`, `FRST_REGIST_PNTTM`, `LAST_UPDUSR_ID`, `LAST_UPDT_PNTTM`) VALUES
('TMPLAT_BOARD_DEFAULT', '게시판 기본템플릿', '/css/egovframework/cop/bbs/egovbbsTemplate.css', 'Y', 'TMPT01', 'USRCNFRM_00000000000', '2011-08-02 21:01:59', 'USRCNFRM_00000000000', '2011-08-08 16:12:57');

-- --------------------------------------------------------

--
-- 뷰 구조 `comvnusermaster`
--
DROP TABLE IF EXISTS `comvnusermaster`;

DROP VIEW IF EXISTS `comvnusermaster`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comvnusermaster`  AS  select `lettngnrlmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettngnrlmber`.`MBER_ID` AS `USER_ID`,`lettngnrlmber`.`PASSWORD` AS `PASSWORD`,`lettngnrlmber`.`MBER_NM` AS `USER_NM`,`lettngnrlmber`.`ZIP` AS `USER_ZIP`,`lettngnrlmber`.`ADRES` AS `USER_ADRES`,`lettngnrlmber`.`MBER_EMAIL_ADRES` AS `USER_EMAIL`,' ' AS `GROUP_ID`,'GNR' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettngnrlmber` union all select `lettnemplyrinfo`.`ESNTL_ID` AS `ESNTL_ID`,`lettnemplyrinfo`.`EMPLYR_ID` AS `EMPLYR_ID`,`lettnemplyrinfo`.`PASSWORD` AS `PASSWORD`,`lettnemplyrinfo`.`USER_NM` AS `USER_NM`,`lettnemplyrinfo`.`ZIP` AS `ZIP`,`lettnemplyrinfo`.`HOUSE_ADRES` AS `HOUSE_ADRES`,`lettnemplyrinfo`.`EMAIL_ADRES` AS `EMAIL_ADRES`,`lettnemplyrinfo`.`GROUP_ID` AS `GROUP_ID`,'USR' AS `USER_SE`,`lettnemplyrinfo`.`ORGNZT_ID` AS `ORGNZT_ID` from `lettnemplyrinfo` union all select `lettnentrprsmber`.`ESNTL_ID` AS `ESNTL_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_ID` AS `ENTRPRS_MBER_ID`,`lettnentrprsmber`.`ENTRPRS_MBER_PASSWORD` AS `ENTRPRS_MBER_PASSWORD`,`lettnentrprsmber`.`CMPNY_NM` AS `CMPNY_NM`,`lettnentrprsmber`.`ZIP` AS `ZIP`,`lettnentrprsmber`.`ADRES` AS `ADRES`,`lettnentrprsmber`.`APPLCNT_EMAIL_ADRES` AS `APPLCNT_EMAIL_ADRES`,' ' AS `Name_exp_28`,'ENT' AS `USER_SE`,' ' AS `ORGNZT_ID` from `lettnentrprsmber` ;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `lettccmmncode`
--
ALTER TABLE `lettccmmncode`
  ADD CONSTRAINT `LETTCCMMNCODE_ibfk_1` FOREIGN KEY (`CL_CODE`) REFERENCES `lettccmmnclcode` (`CL_CODE`);

--
-- 테이블의 제약사항 `lettccmmndetailcode`
--
ALTER TABLE `lettccmmndetailcode`
  ADD CONSTRAINT `LETTCCMMNDETAILCODE_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `lettccmmncode` (`CODE_ID`);

--
-- 테이블의 제약사항 `lettnbbs`
--
ALTER TABLE `lettnbbs`
  ADD CONSTRAINT `LETTNBBS_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`);

--
-- 테이블의 제약사항 `lettnbbsuse`
--
ALTER TABLE `lettnbbsuse`
  ADD CONSTRAINT `LETTNBBSUSE_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `lettnbbsmaster` (`BBS_ID`);

--
-- 테이블의 제약사항 `lettnemplyrinfo`
--
ALTER TABLE `lettnemplyrinfo`
  ADD CONSTRAINT `LETTNEMPLYRINFO_ibfk_1` FOREIGN KEY (`ORGNZT_ID`) REFERENCES `lettnorgnztinfo` (`ORGNZT_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `LETTNEMPLYRINFO_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `lettnentrprsmber`
--
ALTER TABLE `lettnentrprsmber`
  ADD CONSTRAINT `LETTNENTRPRSMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `lettnfiledetail`
--
ALTER TABLE `lettnfiledetail`
  ADD CONSTRAINT `LETTNFILEDETAIL_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `lettnfile` (`ATCH_FILE_ID`);

--
-- 테이블의 제약사항 `lettngnrlmber`
--
ALTER TABLE `lettngnrlmber`
  ADD CONSTRAINT `LETTNGNRLMBER_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `lettnauthorgroupinfo` (`GROUP_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
