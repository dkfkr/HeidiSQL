#날짜 : 2023/06/15
#이름 : 강원빈
#내용 : 제 4장 SQL 고급

#실습 4-1
testdbCREATE TABLE `Member` (
  uid VARCHAR(10) PRIMARY KEY,
  name VARCHAR(10) NOT NULL,
  hp VARCHAR(13) UNIQUE NOT NULL,
  pos VARCHAR(10) NOT NULL DEFAULT '사원',
  dep INT,
  rdate DATETIME NOT NULL
);

CREATE TABLE `Department` (
  depNo INT PRIMARY KEY,
  name VARCHAR(10) NOT NULL,
  tel VARCHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
  seq INT PRIMARY KEY AUTO_INCREMENT,
  uid VARCHAR(10) NOT NULL,
  year INT NOT NULL,
  month INT NOT NULL,
  sale INT NOT NULL
);

#실습 4-2

INSERT INTO `Department` VALUES (101, '양압1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '양압2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '양압3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '양압4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '양압5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '양업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용', '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원', '010-1234-1006', '차장', 103, NOW());

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2018', 1, '98100');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2018', 1, '136000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2018', 1, '80100');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2018', 1, '78000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2018', 1, '93000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2018', 2, '23500');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2018', 2, '126000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2018', 2, '18500');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2018', 2, '19000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2018', 2, '53000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2019', 1, '24000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2019', 1, '109000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2019', 1, '101000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2019', 1, '53500');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', '2019', 1, '24000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2019', 2, '160000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2019', 2, '101000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2019', 2, '43000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2019', 2, '24000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2019', 2, '109000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2020', 1, '201000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2020', 1, '63000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2020', 1, '74000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2020', 1, '122000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', '2020', 1, '111000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2020', 2, '120000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2020', 2, '93000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2020', 2, '84000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2020', 2, '180000');
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', '2020', 2, '76000');

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김_ _';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4


#실습 4-5

#실습 4-6

#실습 4-7

#실습 4-8

#실습 4-9

#실습 4-10

#실습 4-11

#실습 4-12

#실습 4-13

#실습 4-14

#실습 4-15

#실습 4-16
