#날짜 : 2023/06/15
#이름 : 강원빈
#내용 : 제 4장 SQL 고급

#실습 4-1
CREATE TABLE `직원 테이블` (
  uid VARCHAR(10) PRIMARY KEY,
  name VARCHAR(10) NOT NULL,
  hp VARCHAR(13) UNIQUE NOT NULL,
  pos VARCHAR(10) NOT NULL DEFAULT '사원',
  dep INT,
  rdate DATETIME NOT NULL
);

CREATE TABLE `부서 테이블` (
  depNo INT PRIMARY KEY,
  name VARCHAR(10) NOT NULL,
  tel VARCHAR(12) NOT NULL
);

CREATE TABLE `매출 테이블` (
  seq INT PRIMARY KEY AUTO_INCREMENT,
  uid VARCHAR(10) NOT NULL,
  year INT NOT NULL,
  month INT NOT NULL,
  sale INT NOT NULL
);

#실습 4-2

insert into `부서 테이블` values(101,"양압1부","051-512-1001");
insert into `부서 테이블` values(102,"양압2부","051-512-1002");
insert into `부서 테이블` values(103,"양압3부","051-512-1003");
insert into `부서 테이블` values(104,"양압4부","051-512-1004");
insert into `부서 테이블` values(105,"양압5부","051-512-1005");
insert into `부서 테이블` values(106,"양업지원부","051-512-1006");
insert into `부서 테이블` values(107,"인사부","051-512-1007");

insert INTO `직원 테이블` value ('a101', '박혁거세', '010-1234-1001', '부장', 101, now());
insert INTO `직원 테이블` value ('a102',  '김유신',  '010-1234-1002', '차장', 101, now());
insert INTO `직원 테이블` value ('a103',  '김춘추',  '010-1234-1003', '사원', 101, now());
insert INTO `직원 테이블` value ('a104',  '장보고',  '010-1234-1004', '대리', 102, now());
insert INTO `직원 테이블` value ('a105',  '강감찬',  '010-1234-1005', '과장', 102, now());
insert INTO `직원 테이블` value ('a106',  '이성계',  '010-1234-1006', '차장', 103, now());
insert INTO `직원 테이블` value ('a107',   '정철',  '010-1234-1006', '차장', 103, now());
insert INTO `직원 테이블` value ('a108',  '이순신',  '010-1234-1006', '차장', 103, now());
insert INTO `직원 테이블` value ('a109',   '허균',  '010-1234-1006', '차장', 103, now());
insert INTO `직원 테이블` value ('a110',  '정약용',  '010-1234-1006', '차장', 103, now());
insert INTO `직원 테이블` value ('a111',  '박지원',  '010-1234-1006', '차장', 103, NOW());

insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a101', '2018', 1,  '98100');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2018', 1,  '136000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a103', '2018', 1,  '80100');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a104', '2018', 1,  '78000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a105', '2018', 1,  '93000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a101', '2018', 2,  '23500');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2018', 2,  '126000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a103', '2018', 2,  '18500');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a105', '2018', 2,  '19000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a106', '2018', 2,  '53000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a101', '2019', 1,  '24000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2019', 1,  '109000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a103', '2019', 1,  '101000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a104', '2019', 1,  '53500');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a107', '2019', 1,  '24000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2019', 2,  '160000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a103', '2019', 2,  '101000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a104', '2019', 2,  '43000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a105', '2019', 2,  '24000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a106', '2019', 2,  '109000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2020', 1,  '201000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a104', '2020', 1,  '63000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a105', '2020', 1,  '74000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a106', '2020', 1,  '122000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a107', '2020', 1,  '111000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a102', '2020', 2,  '120000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a103', '2020', 2,  '93000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a104', '2020', 2,  '84000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a105', '2020', 2,  '180000');
insert into `매출 테이블` (`uid`,`year`,`month`,`sale`)values ('a108', '2020', 2,  '76000');

#실습 4-3
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `pos`='차장' AND ;
SELECT * FROM `직원 테이블` WHERE `pos`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';
SELECT * FROM `직원 테이블` WHERE `name`='김유신';

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
