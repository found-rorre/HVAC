CREATE TABLE `tb_user` (
  `idx` INT(11) NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `position` VARCHAR(20) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `phone` VARCHAR(11) DEFAULT NULL,
  `email` VARCHAR(40) NOT NULL,
  `gender` VARCHAR(10) DEFAULT NULL,
  `last_login` DATETIME DEFAULT NULL, -- 최근 로그인
  `regdate` DATE DEFAULT NULL, 		  -- 등록일
  `updatedate` DATE DEFAULT NULL, 	  -- 수정일  안쓸수있음
  PRIMARY KEY (`idx`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
