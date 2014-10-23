-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2014 at 09:42 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `GIA` int(11) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `MOTALOAIPHONG` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOAIPHONGID`),
  KEY `FK_CT_LOAIPHONG` (`NHATROID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `loaiphong`
--

INSERT INTO `loaiphong` (`LOAIPHONGID`, `NHATROID`, `DIENTICH`, `SONGUOI`, `GIA`, `SOLUONG`, `MOTALOAIPHONG`) VALUES
(1, 1, 5, 1, 0, 1, NULL),
(2, 2, 5, 1, 0, 1, NULL),
(3, 3, 5, 1, 0, 1, NULL),
(4, 4, 5, 1, 0, 1, NULL),
(5, 5, 5, 3, 0, 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nhatro`
--

INSERT INTO `nhatro` (`NHATROID`, `LOAIID`, `USERNAME`, `TOADOID`, `SDT`, `DIACHI`, `EMAIL`, `TRANGTHAI`, `MOTANHATRO`, `NGAYDANG`, `NGAYYEUCAU`) VALUES
(1, 1, 'duduct', 1, '123123123', 'Số 1, Lý Tự Trọng', NULL, 1, NULL, NULL, NULL),
(2, 2, 'duduct', 2, '321321321', 'Hẻm 51', NULL, 1, NULL, NULL, NULL),
(3, 1, 'duduct', 3, '434343', '79/5 Cách mạng tháng 8', NULL, 0, NULL, NULL, NULL),
(4, 1, 'duduct', 4, '43243243', '34, Nguyễn Văn Cừ', NULL, 1, NULL, NULL, NULL),
(5, 4, 'duduct', 5, '321234', 'Hẻm 142', NULL, 0, NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `toado`
--

CREATE TABLE IF NOT EXISTS `toado` (
  `TOADOID` int(11) NOT NULL AUTO_INCREMENT,
  `X` float(10,6) NOT NULL,
  `Y` float(10,6) NOT NULL,
  PRIMARY KEY (`TOADOID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `toado`
--

INSERT INTO `toado` (`TOADOID`, `X`, `Y`) VALUES
(1, 10.033957, 105.779922),
(2, 10.030994, 105.762505),
(3, 10.050153, 105.775238),
(4, 10.051167, 105.772957),
(5, 10.031675, 105.775925);

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
('dong', '12345', NULL, 1),
('duduct', '12345', NULL, 1),
('superallan', '12345', NULL, 1),
('taikhoan1', '123456', 'mail1@gmail.com', 1),
('taikhoan2', '12345', 'taikhoan2@gmail.com', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`USERROLEID`, `USERNAME`, `ROLE`) VALUES
(1, 'duduct', 'ROLE_USER'),
(2, 'admin', 'ROLE_ADMIN'),
(3, 'superallan', 'ROLE_USER'),
(4, 'dong', 'ROLE_USER'),
(5, 'admin', 'ROLE_USER'),
(6, 'taikhoan1', 'ROLE_USER'),
(7, 'taikhoan2', 'ROLE_USER');

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
