-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2014 at 05:34 PM
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
  `USERNAME` varchar(100) NOT NULL,
  `COMMENT` varchar(200) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`COMMENTID`),
  KEY `FK_CT_COMMENT_NGUOIDUNG` (`USERNAME`),
  KEY `FK_CT_COMMENT_NHATRO` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `diachi`
--

CREATE TABLE IF NOT EXISTS `diachi` (
  `DIACHIID` int(11) NOT NULL AUTO_INCREMENT,
  `DUONGID` int(11) DEFAULT NULL,
  `KHACID` int(11) DEFAULT NULL,
  `QUANID` int(11) NOT NULL,
  `PHUONGID` int(11) NOT NULL,
  PRIMARY KEY (`DIACHIID`),
  KEY `FK_CT_DUONG` (`DUONGID`),
  KEY `FK_CT_KHAC` (`KHACID`),
  KEY `FK_CT_PHUONG` (`PHUONGID`),
  KEY `FK_CT_QUAN` (`QUANID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `duong`
--

CREATE TABLE IF NOT EXISTS `duong` (
  `DUONGID` int(11) NOT NULL AUTO_INCREMENT,
  `TENDUONG` varchar(100) NOT NULL,
  PRIMARY KEY (`DUONGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hinh`
--

CREATE TABLE IF NOT EXISTS `hinh` (
  `HINHID` int(11) NOT NULL AUTO_INCREMENT,
  `NHATROID` int(11) NOT NULL,
  `DUONGDAN` varchar(200) NOT NULL,
  PRIMARY KEY (`HINHID`),
  KEY `FK_DS_HINH` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `khac`
--

CREATE TABLE IF NOT EXISTS `khac` (
  `KHACID` int(11) NOT NULL AUTO_INCREMENT,
  `NOIDUG` varchar(100) NOT NULL,
  PRIMARY KEY (`KHACID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loai`
--

CREATE TABLE IF NOT EXISTS `loai` (
  `LOAIID` int(11) NOT NULL AUTO_INCREMENT,
  `TENLOAI` varchar(20) NOT NULL,
  PRIMARY KEY (`LOAIID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `MOTALOAIPHONG` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LOAIPHONGID`),
  KEY `FK_CT_LOAIPHONG` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nhatro`
--

CREATE TABLE IF NOT EXISTS `nhatro` (
  `NHATROID` int(11) NOT NULL AUTO_INCREMENT,
  `TOADOID` int(11) NOT NULL,
  `DIACHIID` int(11) NOT NULL,
  `LOAIID` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `SDT` varchar(12) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TRANGTHAI` int(11) NOT NULL,
  `MOTANHATRO` varchar(200) DEFAULT NULL,
  `NGAYDANG` datetime NOT NULL,
  `NGAYYEUCAU` datetime DEFAULT NULL,
  PRIMARY KEY (`NHATROID`),
  KEY `FK_CT_DIACHI` (`DIACHIID`),
  KEY `FK_CT_LOAI` (`LOAIID`),
  KEY `FK_CT_TOADO` (`TOADOID`),
  KEY `FK_DS_NHATRODADANG` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `persistentlogin`
--

CREATE TABLE IF NOT EXISTS `persistentlogin` (
  `SERIES` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAMETEMP` varchar(200) NOT NULL,
  `TOKEN` varchar(64) NOT NULL,
  `LAST_USED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SERIES`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phuong`
--

CREATE TABLE IF NOT EXISTS `phuong` (
  `PHUONGID` int(11) NOT NULL AUTO_INCREMENT,
  `TENPHUONG` varchar(100) NOT NULL,
  PRIMARY KEY (`PHUONGID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quan`
--

CREATE TABLE IF NOT EXISTS `quan` (
  `QUANID` int(11) NOT NULL AUTO_INCREMENT,
  `TENQUAN` varchar(100) NOT NULL,
  PRIMARY KEY (`QUANID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `thich`
--

CREATE TABLE IF NOT EXISTS `thich` (
  `THICHID` int(11) NOT NULL AUTO_INCREMENT,
  `NHATROID` int(11) NOT NULL,
  `USERNAME` varchar(100) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`THICHID`),
  KEY `FK_CT_LIKE_NGUOIDUNG` (`USERNAME`),
  KEY `FK_CT_LIKE_NHATRO` (`NHATROID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `toado`
--

CREATE TABLE IF NOT EXISTS `toado` (
  `TOADOID` int(11) NOT NULL AUTO_INCREMENT,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  PRIMARY KEY (`TOADOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USERNAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE IF NOT EXISTS `userrole` (
  `USERROLEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(100) NOT NULL,
  `ROLE` varchar(45) NOT NULL,
  PRIMARY KEY (`USERROLEID`),
  KEY `FK_CT_ROLE` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  ADD CONSTRAINT `FK_CT_QUAN` FOREIGN KEY (`QUANID`) REFERENCES `quan` (`QUANID`),
  ADD CONSTRAINT `FK_CT_DUONG` FOREIGN KEY (`DUONGID`) REFERENCES `duong` (`DUONGID`),
  ADD CONSTRAINT `FK_CT_KHAC` FOREIGN KEY (`KHACID`) REFERENCES `khac` (`KHACID`),
  ADD CONSTRAINT `FK_CT_PHUONG` FOREIGN KEY (`PHUONGID`) REFERENCES `phuong` (`PHUONGID`);

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
  ADD CONSTRAINT `FK_CT_LIKE_NHATRO` FOREIGN KEY (`NHATROID`) REFERENCES `nhatro` (`NHATROID`),
  ADD CONSTRAINT `FK_CT_LIKE_NGUOIDUNG` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FK_CT_ROLE` FOREIGN KEY (`USERNAME`) REFERENCES `user` (`USERNAME`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
