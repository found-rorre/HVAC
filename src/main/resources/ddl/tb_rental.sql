CREATE TABLE `tb_rental` (
  `rental_idx` int(11) NOT NULL AUTO_INCREMENT COMMENT 'rental_idx',
  `car_idx` int(11) DEFAULT NULL COMMENT 'car_idx',
  `id` varchar(11) DEFAULT NULL COMMENT 'member_id',
  `rentalDate` date DEFAULT NULL COMMENT '빌린 날짜',
  `dueDate` date DEFAULT NULL COMMENT '반납 날짜',
  `cost` int(11) DEFAULT NULL COMMENT '렌탈 요금',
  PRIMARY KEY (`rental_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
