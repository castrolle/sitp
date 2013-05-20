
CREATE TABLE IF NOT EXISTS `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_route` int(11) NOT NULL,
  `plate` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


INSERT INTO `bus` (`id`, `id_route`, `plate`, `number`) VALUES
('1', '1', 'FGH-456', '123');



CREATE TABLE IF NOT EXISTS `bus_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bus` int(11) NOT NULL,
  `id_driver` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_bus` (`id_bus`),
  UNIQUE KEY `id_driver` (`id_driver`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

INSERT INTO `bus_driver` (`id`, `id_bus`, `id_driver`) VALUES
(1, 1, 1);


CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


INSERT INTO `driver` (`id`, `name`, `family_name`) VALUES
(1, 'Miguel', 'Ortiz');



CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bus` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `hour` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

INSERT INTO `a7024518_bus`.`position` (`id`, `id_bus`, `latitude`, `longitude`, `date`, `hour`) VALUES ('1', '1', '211', '2121', '2013-05-10', '13:50');

