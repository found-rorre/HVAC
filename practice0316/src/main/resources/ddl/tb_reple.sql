CREATE TABLE practice.`tb_reple` (
  `reidx` INT(11) NOT NULL AUTO_INCREMENT,
  `idx` INT(11) NOT NULL,
  `answer` ENUM('미확인', '처리중', '답변완료') DEFAULT '미확인',
  `adminid` VARCHAR(20) DEFAULT NULL,
  `adminname` VARCHAR(20) DEFAULT NULL,
  `reple` VARCHAR(1000) DEFAULT NULL,
  `regdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedate` DATE DEFAULT NULL,
  PRIMARY KEY (`reidx`),
  FOREIGN KEY (`idx`) REFERENCES `tb_question`(`idx`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
