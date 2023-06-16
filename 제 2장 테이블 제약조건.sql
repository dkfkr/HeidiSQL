#날짜 : 2023/06/15
#이름 : 강원빈
#내용 : 제 2장 테이블 제약조건

#실습 2-1
CREATE TABLE `User2` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13),
`age` INT
);

#실습 2-2
insert into `user2` values ('A101', "김유신", '010-1234-1001', 23);
insert into `user2` values ('A102', "김춘추", '010-1234-1002', 21);
insert into `user2` values ('A103', "장보고", '010-1234-1003', 31);
insert into `user2` values ('A104', "강감찬", '010-1234-1001', 41);

#실습 2-3
CREATE TABLE `User3` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`age` INT
);

#실습 2-4
insert into `user3` values ('A101', "김유신", '010-1234-1001', 23);
insert into `user3` (`uid`, `name`, `hp`, `age` )
valuesuser3 ('A102', "김춘추", '010-1234-1002', 21);
insert into `user3` set
`uid`='A103',
`name`='장보고',
`hp`='010-1234-1003',
`age`= 31;
insert into `user3` values ('A104', "강감찬", '0userdb10-1234-1001', 41);
insert into `user3` (`uid`, `name`, `age` ) values ('A104', "강감찬", 41);
insert into `user3` (`uid`, `name`, `age` ) values ('A105', "이순신", 51);

#실습 2-5
CREATE TABLE `Parent` (
`pid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE
);

CREATE TABLE `Child` (
`cid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`pid` VARCHAR(10),
FOREIGN KEY (`pid`) REFERENCES `Parent` (`pid`)
);

#실습 2-6
insert into `parent` values ('p101', "김유신", '010-1234-1111');
insert into `parent` values ('p102', "김유신", '010-1234-2222');
insert into `parent` values ('p103', "김유신", '010-1234-3333');

insert into `child` values ('c101', "홍길남", '010-1234-2001', 'p101');
insert into `child` values ('c102', "임철수", '010-1234-2002', 'p102');
insert into `child` values ('c103', "이방원", '010-1234-2003', 'p103');
insert into `child` values ('c104', "홍길여", '010-1234-2004', 'p101');

#실습 2-7
CREATE TABLE `User4`(
`seq` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(10),
`gender`TINYINT,
`age` INT,
`addr` VARCHAR(255)
);

#실습 2-8
insert into `User4` (`name`, `gender`, `age`, `addr` ) values ("김유신",  '1', 25, "김해시");
insert into `User4` (`name`, `gender`, `age`, `addr` ) values ("김춘추",  '1', 23, "경주시");
insert into `User4` (`name`, `gender`, `age`, `addr` ) values ("장보고",  '1', 35, "완도시");
insert into `User4` (`name`, `gender`, `age`, `addr` ) values ("강감찬",  '1', 42, "서울시");
insert into `User4` (`name`, `gender`, `age`, `addr` ) values ("신사임당", '2', 47, "강릉시");
insert into `User4` (`gender`, `addr` )                values ('1', "부산시");

#실습 2-9
CREATE TABLE `User5`(
`name`   VARCHAR(10) NOT NULL,
`gender` TINYINT,
`age`    INT DEFAULT 1,
`addr`   VARCHAR(10)
);

#실습 2-10
insert into `User5` values ("김유신", 1 , 23, "김해시");
insert into `User5` (`name`, `addr`) values ("김춘추", "경주시");
insert into `user5` set `name`='장보고', `gender` = 1, `age`= 31;

#실습 2-11
ALTER TABLE `User5` ADD `hp`    VARCHAR(20);
ALTER TABLE `User5` ADD `birth` CHAR(10) DEFAULT '0000-00-00' AFTER `name`;

#실습 2-12
ALTER TABLE `User5` MODIFY `hp` CHAR(13);
ALTER TABLE `User5` MODIFY `age` TINYINT;

#실습 2-13
ALTER TABLE `User5` CHANGE COLUMN `addr` `address` VARCHAR(100);

#실습 2-14
ALTER TABLE `User5` DROP `gender`;

#실습 2-15user5
CREATE TABLE `User6` LIKE `User5`;

#실습 2-16
INSERT INTO `User6` SELECT * FROM `User5`;
