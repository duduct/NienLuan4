-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2014 at 11:47 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`COMMENTID`, `NHATROID`, `USERNAME`, `COMMENT`, `DATECOMMENT`) VALUES
(1, 5, 'admin', 'Nhà trọ vừa mới đăng :)', '2014-11-10 10:31:01'),
(2, 5, 'duduct', 'Nhà trọ này rất tốt', '2014-11-10 10:31:48'),
(3, 5, 'duduct', 'Ở đây hơi vắng', '2014-11-10 10:32:02'),
(4, 3, 'duduct', 'Dơ', '2014-11-10 10:32:49'),
(5, 5, 'hohuunhan', 'Mọi người nên ở nhà trọ này. Bà chủ rất tốt', '2014-11-10 10:33:00'),
(6, 8, 'nhatminh2947', 'ngon', '2014-11-07 07:32:00'),
(8, 3, 'admin', 'Xa Đại học Cần Thơ', '2014-11-10 10:44:51'),
(9, 8, 'dong', 'Nhà trọ hơi trũng. Mưa dễ ngập', '2014-11-10 10:45:21');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `loaiphong`
--

INSERT INTO `loaiphong` (`LOAIPHONGID`, `NHATROID`, `DIENTICH`, `SONGUOI`, `GIA`, `SOLUONG`, `MOTALOAIPHONG`) VALUES
(3, 3, 5, 1, 500000, 1, NULL),
(5, 5, 5, 3, 1000000, 1, NULL),
(6, 8, 10, 7, 400000, 7, NULL),
(7, 8, 7, 5, 300000, 5, NULL),
(8, 9, 10, 7, 700000, 5, NULL),
(9, 10, 10, 6, 400000, 6, NULL),
(14, 14, 9, 6, 400000, 5, NULL),
(15, 14, 9, 6, 500000, 6, NULL),
(16, 14, 10, 5, 400000, 6, NULL),
(25, 22, 22, 10, 600000, 8, NULL),
(26, 23, 22, 6, 800000, 7, NULL),
(27, 24, 18, 6, 700000, 9, NULL),
(28, 25, 50, 8, 700000, 9, NULL),
(29, 26, 20, 7, 600000, 7, NULL),
(30, 27, 5, 1, 400000, 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `nhatro`
--

INSERT INTO `nhatro` (`NHATROID`, `LOAIID`, `USERNAME`, `TOADOID`, `SDT`, `DIACHI`, `EMAIL`, `TRANGTHAI`, `MOTANHATRO`, `NGAYDANG`, `NGAYYEUCAU`) VALUES
(3, 1, 'duduct', 3, '0120156235', '79/5 Cách mạng tháng 8', NULL, 1, NULL, NULL, '2014-10-24 19:54:02'),
(5, 4, 'duduct', 5, '0710147546', 'Hẻm 142', NULL, 1, NULL, NULL, '2014-11-10 19:54:02'),
(6, 1, 'duduct', 6, '01692910741', 'hẻm 124', NULL, 1, NULL, NULL, '2014-11-04 15:31:26'),
(7, 4, 'admin', 35, '01692910741', 'hẻm 51', NULL, 1, NULL, NULL, '2014-11-10 15:34:34'),
(8, 1, 'dong', 10, '0902448558', 'hẻm 2 mậu thân', NULL, 1, NULL, NULL, '2014-11-07 14:17:21'),
(9, 2, 'dong', 17, '0908889665', 'hẻm 5 mậu thân', NULL, 1, NULL, NULL, '2014-11-07 14:18:12'),
(10, 1, 'dong', 14, '099879822', '51/16 đường 3 tháng 2', NULL, 1, NULL, NULL, '2014-11-07 14:20:13'),
(14, 1, 'duduct', 20, '0908765456', '12 đường nguyễn văn linh', NULL, 0, NULL, NULL, '2014-11-10 14:28:35'),
(22, 3, 'dong', 28, '0982764678', '19 Trần Ngọc Quế ', NULL, 1, NULL, NULL, '2014-11-07 15:17:36'),
(23, 3, 'dong', 29, '0967543234', '123/1 Lý Tự Trọng', NULL, 1, NULL, NULL, '2014-11-07 15:18:54'),
(24, 2, 'dong', 30, '0986786253', '14/ 11 Mậu Thân', NULL, 1, NULL, NULL, '2014-11-07 15:20:31'),
(25, 2, 'dong', 31, '01228445887', '11/ 43 đường ba tháng hai', NULL, 0, NULL, NULL, '2014-11-07 15:22:28'),
(26, 2, 'dong', 32, '012222567432', '123 Hòa bình', NULL, 0, NULL, NULL, '2014-11-10 15:23:23'),
(27, 2, 'duduct', 34, '07103123456', 'Hẻm 51', NULL, 0, NULL, NULL, '2014-11-11 14:38:36');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `thich`
--

INSERT INTO `thich` (`THICHID`, `USERNAME`, `DATETHICH`, `NHATROID`) VALUES
(2, 'admin', '2014-11-03 08:48:01', 5),
(5, 'hohuunhan', '2014-11-07 07:18:55', 5),
(11, 'boymatrom', '2014-11-07 07:20:00', 8),
(13, 'boymatrom', '2014-11-07 07:20:03', 3),
(16, 'boymatrom', '2014-11-07 07:20:17', 5),
(17, 'boymatrom', '2014-11-07 07:21:18', 10),
(18, 'duduct', '2014-11-07 07:30:27', 10),
(19, 'duduct', '2014-11-07 07:30:30', 5),
(20, 'nhatminh2947', '2014-11-07 07:31:43', 8),
(21, 'nhatminh2947', '2014-11-07 07:31:46', 10),
(22, 'nhatminh2947', '2014-11-07 07:31:48', 3),
(23, 'admin', '2014-11-07 08:33:47', 24),
(24, 'duduct', '2014-11-08 07:36:09', 3),
(25, 'admin', '2014-11-10 10:35:03', 3),
(27, 'admin', '2014-11-10 10:35:08', 22),
(29, 'dong', '2014-11-10 10:45:23', 8),
(30, 'dong', '2014-11-10 10:45:24', 3),
(31, 'dong', '2014-11-10 10:45:30', 9);

-- --------------------------------------------------------

--
-- Table structure for table `toado`
--

CREATE TABLE IF NOT EXISTS `toado` (
  `TOADOID` int(11) NOT NULL AUTO_INCREMENT,
  `X` float(10,6) NOT NULL,
  `Y` float(10,6) NOT NULL,
  PRIMARY KEY (`TOADOID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `toado`
--

INSERT INTO `toado` (`TOADOID`, `X`, `Y`) VALUES
(3, 10.050153, 105.775238),
(5, 10.031675, 105.775925),
(6, 10.017473, 105.763306),
(7, 10.030994, 105.762505),
(8, 10.028316, 105.772247),
(9, 10.039709, 105.769104),
(10, 10.028316, 105.772247),
(11, 10.020360, 105.763771),
(12, 10.033957, 105.779922),
(14, 10.020360, 105.763771),
(16, 10.045162, 105.746857),
(17, 10.039709, 105.769104),
(19, 10.027975, 105.755470),
(20, 10.027975, 105.755470),
(28, 10.024922, 105.768211),
(29, 10.036736, 105.777557),
(30, 10.039179, 105.769402),
(31, 10.022000, 105.767471),
(32, 10.032129, 105.782791),
(33, 10.030994, 105.762505),
(34, 10.024825, 105.767319),
(35, 10.031409, 105.762665);

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
('admin', 'admin', 'nhatrocantho@gmail.com', 1),
('boymatrom', 'boymattrom', 'boymat@gmail.com', 1),
('dong', '12345', 'dong@gmail.com', 1),
('duduct', '12345', 'duduct@gmail.com', 1),
('hohuunhan', 'hohuunhan', 'nhan111321@gmail.com', 1),
('nhatminh2947', '29031993', 'nhatminh2947@gmail.com', 1),
('superallan', '12345', 'superallan@gmail.com', 1),
('taikhoan1', '12345', 'mail1@gmail.com', 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`USERROLEID`, `USERNAME`, `ROLE`) VALUES
(1, 'duduct', 'ROLE_USER'),
(2, 'admin', 'ROLE_ADMIN'),
(3, 'superallan', 'ROLE_USER'),
(4, 'dong', 'ROLE_USER'),
(6, 'taikhoan1', 'ROLE_USER'),
(7, 'taikhoan2', 'ROLE_USER'),
(9, 'nhatminh2947', 'ROLE_USER'),
(10, 'hohuunhan', 'ROLE_USER'),
(11, 'boymatrom', 'ROLE_USER');

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
