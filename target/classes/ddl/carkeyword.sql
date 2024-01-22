CREATE TABLE `tb_carkeyword` (
  `carInfo_idx` int(11) NOT NULL,
  `keyword_idx` int(11) NOT NULL,
  PRIMARY KEY (`carInfo_idx`,`keyword_idx`),
  KEY `keyword_idx` (`keyword_idx`),
  CONSTRAINT `tb_carkeyword_ibfk_1` FOREIGN KEY (`carInfo_idx`) REFERENCES `tb_carinfo` (`carInfo_idx`),
  CONSTRAINT `tb_carkeyword_ibfk_2` FOREIGN KEY (`keyword_idx`) REFERENCES `tb_keyword` (`keyword_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
