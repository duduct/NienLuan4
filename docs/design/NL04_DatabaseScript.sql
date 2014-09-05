-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2014 at 11:12 AM
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
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `COMMENT` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`COMMENTID`),
  KEY `FK_CT_COMMENT_NGUOIDUNG` (`USERNAME`),
  KEY `FK_CT_COMMENT_NHATRO` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diachi`
--

CREATE TABLE IF NOT EXISTS `diachi` (
  `DIACHIID` int(11) NOT NULL AUTO_INCREMENT,
  `DUONGID` int(11) DEFAULT NULL,
  `DIACHI` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DIACHIID`),
  KEY `FK_CT_DUONG` (`DUONGID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `diachi`
--

INSERT INTO `diachi` (`DIACHIID`, `DUONGID`, `DIACHI`) VALUES
(1, 7, 'Số 1');

-- --------------------------------------------------------

--
-- Table structure for table `duong`
--

CREATE TABLE IF NOT EXISTS `duong` (
  `DUONGID` int(11) NOT NULL AUTO_INCREMENT,
  `TENDUONG` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`DUONGID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `duong`
--

INSERT INTO `duong` (`DUONGID`, `TENDUONG`) VALUES
(1, 'Cách mạng tháng 8'),
(2, 'Đại lộ Hòa Bình'),
(3, '30 tháng 4'),
(4, '3 tháng 2'),
(5, 'Mậu Thân'),
(6, 'Nguyễn Văn Cừ'),
(7, 'Lý Tự Trọng');

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
  `GIA` float(8,2) NOT NULL,
  `SOLUONG` int(11) NOT NULL,
  `MOTALOAIPHONG` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOAIPHONGID`),
  KEY `FK_CT_LOAIPHONG` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nhatro`
--

CREATE TABLE IF NOT EXISTS `nhatro` (
  `NHATROID` int(11) NOT NULL AUTO_INCREMENT,
  `LOAIID` int(11) NOT NULL,
  `USERNAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DIACHIID` int(11) NOT NULL,
  `TOADOID` int(11) NOT NULL,
  `SDT` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `MOTANHATRO` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NGAYDANG` datetime DEFAULT NULL,
  `NGAYYEUCAU` datetime DEFAULT NULL,
  PRIMARY KEY (`NHATROID`),
  KEY `FK_CT_DIACHI` (`DIACHIID`),
  KEY `FK_CT_LOAI` (`LOAIID`),
  KEY `FK_CT_TOADO` (`TOADOID`),
  KEY `FK_DS_NHATRODADANG` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nhatro`
--

INSERT INTO `nhatro` (`NHATROID`, `LOAIID`, `USERNAME`, `DIACHIID`, `TOADOID`, `SDT`, `EMAIL`, `TRANGTHAI`, `MOTANHATRO`, `NGAYDANG`, `NGAYYEUCAU`) VALUES
(1, 1, 'duduct', 1, 1, '01222345786', NULL, 1, NULL, '2014-08-31 00:00:00', '2014-08-31 00:00:00');

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
  `NHATROID` int(11) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `X` float NOT NULL,
  `Y` float NOT NULL,
  PRIMARY KEY (`TOADOID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `toado`
--

INSERT INTO `toado` (`TOADOID`, `X`, `Y`) VALUES
(1, 10.0341, 105.756);

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
('duduct', '123456', 'luongducduy.cantho@gmail.com', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`USERROLEID`, `USERNAME`, `ROLE`) VALUES
(1, 'admin', 'ROLE_ADMIN'),
(2, 'duduct', 'ROLE_ADMIN');

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
-- Constraints for table `diachi`
--
ALTER TABLE `diachi`
  ADD CONSTRAINT `FK_CT_DUONG` FOREIGN KEY (`DUONGID`) REFERENCES `duong` (`DUONGID`);

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
  ADD CONSTRAINT `FK_CT_DIACHI` FOREIGN KEY (`DIACHIID`) REFERENCES `diachi` (`DIACHIID`),
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
