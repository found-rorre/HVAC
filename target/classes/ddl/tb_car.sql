CREATE TABLE `tb_car` (
  `car_idx` INT(11) NOT NULL AUTO_INCREMENT COMMENT '차량 식별자',
  `carInfo_idx` INT(11) NOT NULL COMMENT '차량정보',
  `carNumber` VARCHAR(100) NOT NULL COMMENT '차량번호',
  `year` VARCHAR(100) NOT NULL COMMENT '연식',
  `status` VARCHAR(100) NOT NULL DEFAULT '''입고''' COMMENT '대기, 출고, 정비',
  `dayCost` INT(11) NOT NULL,
  PRIMARY KEY (`car_idx`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8