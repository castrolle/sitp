-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2013 at 10:36 AM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a7024518_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_route` int(11) NOT NULL,
  `plate` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` VALUES(1, 1, 'FGH-456', '123');
INSERT INTO `bus` VALUES(2, 2, 'WYG-612', '326');

-- --------------------------------------------------------

--
-- Table structure for table `bus_driver`
--

CREATE TABLE `bus_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bus` int(11) NOT NULL,
  `id_driver` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_bus` (`id_bus`),
  UNIQUE KEY `id_driver` (`id_driver`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bus_driver`
--

INSERT INTO `bus_driver` VALUES(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `check_point`
--

CREATE TABLE `check_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `id_route` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `check_point`
--

INSERT INTO `check_point` VALUES(1, 4.5996231, -74.0696473, 'punto de control principal', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` VALUES(1, 'Miguel', 'Ortiz');

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `value` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` VALUES(1, 'CHECK_POINT_RANGE', '0.000002', 'Margen de error para determinar un punto especifico');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bus` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` VALUES(1, 1, 211, 2121, '2013-05-10', '13:50');
INSERT INTO `position` VALUES(81, 1, 2222, 111, '2013-05-20', '16:13:23');
INSERT INTO `position` VALUES(82, 1, 4.5996231, -74.0696473, '2013-05-20', '17:23:57');
INSERT INTO `position` VALUES(83, 1, 4.5991026, -74.0692818, '2013-05-20', '17:24:29');
INSERT INTO `position` VALUES(84, 1, 4.5985821, -74.0689165, '2013-05-20', '17:24:52');
INSERT INTO `position` VALUES(85, 1, 4.5991026, -74.0692818, '2013-05-20', '17:25:12');
INSERT INTO `position` VALUES(86, 1, 4.5996231, -74.0696473, '2013-05-20', '17:25:32');
INSERT INTO `position` VALUES(87, 1, 4.6012611, -74.0709899, '2013-05-20', '17:25:58');
INSERT INTO `position` VALUES(88, 1, 4.6017876, -74.0726409, '2013-05-20', '17:26:34');
INSERT INTO `position` VALUES(89, 1, 4.600676, -74.0729494, '2013-05-20', '17:27:12');
INSERT INTO `position` VALUES(90, 1, 4.6005047, -74.0731606, '2013-05-20', '17:28:33');
INSERT INTO `position` VALUES(91, 1, 4.6016744, -74.0737048, '2013-05-20', '17:28:56');
INSERT INTO `position` VALUES(92, 1, 4.6016162, -74.0728522, '2013-05-20', '17:29:35');
INSERT INTO `position` VALUES(93, 1, 4.6003333, -74.0733719, '2013-05-20', '17:29:53');
INSERT INTO `position` VALUES(94, 1, 4.6199842, -74.0712034, '2013-05-20', '17:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `view_circuit`
--

CREATE OR REPLACE VIEW `a7024518_bus`.`view_circuit` AS select distinct `b`.`number` AS `bus`,`b`.`id_route` AS `ruta`,`d`.`name` AS `nombre`,`d`.`family_name` AS `apellido`,`p`.`latitude` AS `latitud`,`p`.`longitude` AS `longitud`,`p`.`date` AS `fecha`,substr(`p`.`hour`,1,2) AS `hora` from ((((`a7024518_bus`.`bus` `b` join `a7024518_bus`.`bus_driver` `bd` on((`b`.`id` = `bd`.`id_bus`))) join `a7024518_bus`.`driver` `d` on((`d`.`id` = `bd`.`id_driver`))) join `a7024518_bus`.`position` `p` on((`p`.`id_bus` = `b`.`id`))) join `a7024518_bus`.`check_point` `cp` on((`cp`.`id_route` = `b`.`id_route`))) where (`p`.`latitude` between (`cp`.`latitude` - (select `a7024518_bus`.`parameter`.`value` from `a7024518_bus`.`parameter` where (`a7024518_bus`.`parameter`.`name` = 'CHECK_POINT_RANGE'))) and (`cp`.`latitude` + (select `a7024518_bus`.`parameter`.`value` from `a7024518_bus`.`parameter` where (`a7024518_bus`.`parameter`.`name` = 'CHECK_POINT_RANGE'))));

--
-- Dumping data for table `view_circuit`
--

INSERT INTO `view_circuit` VALUES('123', 1, 'Miguel', 'Ortiz', 4.5996231, -74.0696473, '2013-05-20', '17');
