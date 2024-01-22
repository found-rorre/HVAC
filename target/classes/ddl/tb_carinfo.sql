CREATE TABLE `tb_carinfo` (
  `carInfo_idx` int(11) NOT NULL AUTO_INCREMENT,
  `maker` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `series` varchar(100) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `transmission` varchar(100) NOT NULL,
  `fuel` varchar(100) NOT NULL,
  `fuelRatio` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `seatCount` int(11) NOT NULL,
  PRIMARY KEY (`carInfo_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8