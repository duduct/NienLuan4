-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2014 at 11:52 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nhatro`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `COMMENTID` int(11) NOT NULL AUTO_INCREMENT,
  `NHATROID` int(11) NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `COMMENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DATECOMMENT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`COMMENTID`),
  KEY `FK_CT_COMMENT_NGUOIDUNG` (`USERNAME`),
  KEY `FK_CT_COMMENT_NHATRO` (`NHATROID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`COMMENTID`, `NHATROID`, `USERNAME`, `COMMENT`, `DATECOMMENT`) VALUES
(41, 8, 'duduct', 'rất tốt', '2014-09-13 13:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `hinh`
--

CREATE TABLE IF NOT EXISTS `hinh` (
  `HINHID` int(11) NOT NULL AUTO_INCREMENT,
  `NHATROID` int(11) NOT NULL,
  `DUONGDAN` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`HINHID`),
  KEY `FK_DS_HINH` (`NHATROID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `hinh`
--

INSERT INTO `hinh` (`HINHID`, `NHATROID`, `DUONGDAN`) VALUES
(24, 8, 'hinh8-0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loai`
--

CREATE TABLE IF NOT EXISTS `loai` (
  `LOAIID` int(11) NOT NULL AUTO_INCREMENT,
  `TENLOAI` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LOAIID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `loai`
--

INSERT INTO `loai` (`LOAIID`, `TENLOAI`) VALUES
(1, 'Nhà trọ độc lập'),
(2, 'Nhà riêng'),
(3, 'Khu nhà trọ'),
(4, 'Ở cùng chủ nhà');

-- --------------------------------------------------------

--
-- Table structure for table `loaiphong`
--

CREATE TABLE IF NOT EXISTS `loaiphong` (
  `LOAIPHONGID` int(11) NOT NULL AUTO_INCREMENT,
  `NHATROID` int(11) NOT NULL,
  `DIENTICH` int(11) NOT NULL,
  `SONGUOI` int(11) NOT NULL,
  `GIA` float(8,2) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `MOTALOAIPHONG` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOAIPHONGID`),
  KEY `FK_CT_LOAIPHONG` (`NHATROID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `loaiphong`
--

INSERT INTO `loaiphong` (`LOAIPHONGID`, `NHATROID`, `DIENTICH`, `SONGUOI`, `GIA`, `SOLUONG`, `MOTALOAIPHONG`) VALUES
(2, 9, 3, 1, 100005.00, 9, NULL),
(3, 9, 5, 3, 300000.00, 5, NULL),
(4, 10, 2, 3, 600005.00, 8, NULL),
(5, 11, 2, 2, 100005.00, 5, NULL),
(6, 12, 3, 3, 100005.00, 6, NULL),
(7, 13, 2, 2, 100005.00, 6, NULL),
(9, 35, 2, 2, 100000.00, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nhatro`
--

CREATE TABLE IF NOT EXISTS `nhatro` (
  `NHATROID` int(11) NOT NULL AUTO_INCREMENT,
  `LOAIID` int(11) NOT NULL,
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TOADOID` int(11) NOT NULL,
  `SDT` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `DIACHI` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `MOTANHATRO` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAYDANG` datetime DEFAULT NULL,
  `NGAYYEUCAU` datetime DEFAULT NULL,
  PRIMARY KEY (`NHATROID`),
  KEY `FK_CT_LOAI` (`LOAIID`),
  KEY `FK_CT_TOADO` (`TOADOID`),
  KEY `FK_DS_NHATRODADANG` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=130 ;

--
-- Dumping data for table `nhatro`
--

INSERT INTO `nhatro` (`NHATROID`, `LOAIID`, `USERNAME`, `TOADOID`, `SDT`, `DIACHI`, `EMAIL`, `TRANGTHAI`, `MOTANHATRO`, `NGAYDANG`, `NGAYYEUCAU`) VALUES
(1, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, NULL, NULL, NULL),
(7, 1, 'admin', 9, '3432', '79/5 Cách m?ng tháng 8', NULL, 0, NULL, NULL, NULL),
(8, 1, 'admin', 10, '07103123456', 'Hẻm 51', 'nhatro8@gmail.com', 0, 'Phòng nhìn ra bến Ninh Kiều', NULL, NULL),
(9, 2, 'admin', 11, '423', '379, 30 tháng 4', NULL, 0, NULL, NULL, NULL),
(10, 2, 'admin', 12, '341', '105 30 tháng 4', NULL, 0, NULL, NULL, NULL),
(11, 1, 'admin', 13, '34', '79/5 CÃ¡ch máº¡ng thÃ¡ng 8', NULL, 0, NULL, NULL, NULL),
(12, 1, 'admin', 14, '324', '79/5 CÃ¡ch máº¡ng thÃ¡ng 8', NULL, 0, NULL, NULL, NULL),
(13, 1, 'admin', 15, 'asfs', '412', NULL, 0, NULL, NULL, NULL),
(26, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(27, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(28, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(29, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(30, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(31, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(32, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(33, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(34, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', NULL, 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(35, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(36, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(37, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(38, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(40, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(41, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(42, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(43, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(44, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(45, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(47, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(48, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(49, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(51, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(52, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(53, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(54, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(55, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(56, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(57, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(58, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(59, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(60, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(61, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(62, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(63, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(64, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(65, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(66, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(67, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(68, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(69, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(70, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(71, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(72, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(73, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(74, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(75, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(76, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(77, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(78, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(79, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(80, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(81, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(82, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(83, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(84, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(85, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(86, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(87, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(88, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(89, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(90, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(91, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(92, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(93, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(94, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(95, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(96, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(97, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(98, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(99, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(100, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(101, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(102, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(103, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(104, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(105, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(106, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(107, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(108, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(109, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(110, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(111, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(112, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(113, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(114, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(115, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(116, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(117, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(118, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(119, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(120, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(121, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(122, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(123, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(124, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(125, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(126, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(127, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(128, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL),
(129, 2, 'admin', 3, '01208', 'Số 1, Lý Tự Trọng', '', 0, 'Phòng nhìn ra bến Ninh Kiều 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `persistentlogin`
--

CREATE TABLE IF NOT EXISTS `persistentlogin` (
  `SERIES` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `USERNAMETEMP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TOKEN` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SERIES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thich`
--

CREATE TABLE IF NOT EXISTS `thich` (
  `THICHID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DATETHICH` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NHATROID` int(11) NOT NULL,
  PRIMARY KEY (`THICHID`),
  KEY `FK_CT_LIKE_NGUOIDUNG` (`USERNAME`),
  KEY `FK_CT_LIKE_NHATRO` (`NHATROID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

--
-- Dumping data for table `thich`
--

INSERT INTO `thich` (`THICHID`, `USERNAME`, `DATETHICH`, `NHATROID`) VALUES
(2, 'duduct', '2014-09-13 04:05:38', 9),
(39, 'superallan', '2014-09-13 09:32:02', 8),
(44, 'duduct', '2014-09-13 16:34:14', 8);

-- --------------------------------------------------------

--
-- Table structure for table `toado`
--

CREATE TABLE IF NOT EXISTS `toado` (
  `TOADOID` int(11) NOT NULL AUTO_INCREMENT,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  PRIMARY KEY (`TOADOID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `toado`
--

INSERT INTO `toado` (`TOADOID`, `X`, `Y`) VALUES
(3, 10.0341, 105.78),
(9, 10.0502, 105.775),
(10, 10.031, 105.763),
(11, 10.0226, 105.772),
(12, 10.0225, 105.772),
(13, 10.0502, 105.775),
(14, 10.0502, 105.775),
(15, 10.0322, 105.809);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERNAME`, `PASSWORD`, `EMAIL`, `ENABLED`) VALUES
('admin', 'admin', NULL, 1),
('duduct', '12345', NULL, 1),
('superallan', '12345', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE IF NOT EXISTS `userrole` (
  `USERROLEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USERROLEID`),
  KEY `FK_CT_ROLE` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`USERROLEID`, `USERNAME`, `ROLE`) VALUES
(1, 'duduct', 'ROLE_USER'),
(2, 'admin', 'ROLE_ADMIN'),
(3, 'superallan', 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_CT_COMMENT_NGUOIDUNG` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`),
  ADD CONSTRAINT `FK_CT_COMMENT_NHATRO` FOREIGN KEY (`NHATROID`) REFERENCES `nhatro` (`NHATROID`);

--
-- Constraints for table `hinh`
--
ALTER TABLE `hinh`
  ADD CONSTRAINT `FK_DS_HINH` FOREIGN KEY (`NHATROID`) REFERENCES `nhatro` (`NHATROID`);

--
-- Constraints for table `loaiphong`
--
ALTER TABLE `loaiphong`
  ADD CONSTRAINT `FK_CT_LOAIPHONG` FOREIGN KEY (`NHATROID`) REFERENCES `nhatro` (`NHATROID`);

--
-- Constraints for table `nhatro`
--
ALTER TABLE `nhatro`
  ADD CONSTRAINT `FK_CT_LOAI` FOREIGN KEY (`LOAIID`) REFERENCES `loai` (`LOAIID`),
  ADD CONSTRAINT `FK_CT_TOADO` FOREIGN KEY (`TOADOID`) REFERENCES `toado` (`TOADOID`),
  ADD CONSTRAINT `FK_DS_NHATRODADANG` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

--
-- Constraints for table `thich`
--
ALTER TABLE `thich`
  ADD CONSTRAINT `FK_CT_LIKE_NGUOIDUNG` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`),
  ADD CONSTRAINT `FK_CT_LIKE_NHATRO` FOREIGN KEY (`NHATROID`) REFERENCES `nhatro` (`NHATROID`);

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FK_CT_ROLE` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
