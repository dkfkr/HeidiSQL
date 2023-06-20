#날짜 : 2023/06/20
#이름 : 강원빈
#내용 : 연습문제

#실습 1-1
CREATE DATABASE `Shop`;
CREATE USER `admin1`@`%` IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON shop.* TO  `admin1`@`%`;
FLUSH PRIVILEGES;

#실습 1-2
CREATE TABLE `Customer` (
pk VARCHAR(10) NOT NULL PRIMARY KEY, 
name VARCHAR(10) NOT NULL,
hp VARCHAR(13) UNIQUE KEY, 
addr VARCHAR(100),
rdate DATE NOT NULL
);

CREATE TABLE `Product` (
prodno INT  NOT NULL PRIMARY KEY,
prodname VARCHAR(10) NOT NULL,
stock INT  NOT NULL DEFAULT 0,
price INT, 
company VARCHAR(20) NOT NULL
);

CREATE TABLE `Order` (
orderno INT NOT NULL PRIMARY KEY,
orderid VARCHAR(10) NOT NULL,
oederproduct INT NOT NULL,
oedercount INT NOT NULL DEFAULT 1,
oederdate DATETIME NOT NULL
);

#실습 1-3
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c101','김유신', '010-1234-1001' ,'김해시 봉황동', '2022-01-01');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c102','김춘추', '010-1234-1002' ,'경주시 보문로', '2022-01-02');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c103','장보고', '010-1234-1003' ,'완도군 청산면', '2022-01-03');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c104','강감찬', '010-1234-1004' ,'서울시 마포구', '2022-01-04');  
INSERT INTO Customer (pk , name , rdate) VALUES ('c105','이성계', '2022-01-05');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c106','정철'  , '010-1234-1006' ,'경기도 용인시', '2022-01-06');  
INSERT INTO Customer (pk , name , rdate) VALUES ('c107','허준'  , '2022-01-07');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c108','이순신', '010-1234-1008' ,'서울시 영등포구', '2022-01-08');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c109','송상현', '010-1234-1009' ,'부산시 동래구', '2022-01-09');  
INSERT INTO Customer (pk , name , hp, addr, rdate) VALUES ('c110','정약용', '010-1234-1010' ,'경기도 광주시', '2022-01-10');  

INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('1','새우깡', '5000' ,'1500', '농심');  
INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('2','초코파이', '2500' ,'2500', '오리온');
INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('3','포카칩', '3600' ,'1700', '오리온');
INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('4','양파링', '1250' ,'1800', '농심');
INSERT INTO Product (prodno, prodname, stock, company)  VALUES ('5','죠리퐁', '2200' , '크라운');
INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('6','마카렛트', '3500' ,'3500', '롯데');
INSERT INTO Product (prodno, prodname, stock, price, company)  VALUES ('7','뿌셔뿌셔', '1650' ,'1200', '오뚜기');

INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('1',  'c102', '3', '2', '2022-07-01 13:15:10');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('2',  'c101', '4', '1', '2022-07-01 14:16:11');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('3',  'c108', '1', '1', '2022-07-01 17:23:18');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('4',  'c109', '6', '5', '2022-07-02 10:46:36');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('5',  'c102', '2', '1', '2022-07-03 09:15:37');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('6',  'c101', '7', '3', '2022-07-03 12:35:12');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('7',  'c110', '1', '2', '2022-07-03 16:55:36');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('8',  'c104', '2', '4', '2022-07-04 14:23:23');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('9',  'c102', '1', '3', '2022-07-04 21:54:34');
INSERT INTO `Order` (orderno, orderid, oederproduct, oedercount, oederdate) VALUES ('10', 'c107', '6', '1', '2022-07-05 14:21:03');

#실습 1-4
SELECT * FROM customer; 

#실습 1-5
SELECT pk , name , hp FROM customer;

#실습 1-6
SELECT * FROM product; 

#실습 1-7
SELECT company FROM product;

#실습 1-8
SELECT DISTINCT company FROM product;

#실습 1-9
SELECT  prodname, price  FROM product;

#실습 1-10
SELECT  prodname, price + 500 FROM product;

#실습 1-11
SELECT  prodname, stock, price FROM product WHERE company = '오리온'; 

#실습 1-12
SELECT  oederproduct, oedercount, oederdate FROM `order` WHERE orderid = 'c102'; 

#실습 1-13
SELECT  oederproduct, oedercount, oederdate FROM `order` WHERE orderid = 'c102'AND oedercount >= '2';

#실습 1-14
SELECT * FROM product WHERE price >= 1000 AND price <= 2000; 

#실습 1-15
SELECT pk , name , hp, addr FROM customer WHERE NAME LIKE '김%';

#실습 1-16
SELECT pk , name , hp, addr FROM customer WHERE name = 2;

#실습 1-17
SELECT * FROM customer WHERE 'hp' = NULL;

#실습 1-18
SELECT * FROM customer WHERE 'addr' = NOT NULL;

#실습 1-19
SELECT * FROM customer ORDER BY rdate DESC;

#실습 1-20
SELECT * FROM `order` WHERE oedercount >= 3 ORDER BY orderno DESC; 

#실습 1-21
SELECT AVG(price) FROM product; 

#실습 1-22
SELECT SUM(stock) AS '재고량 합계' FROM product WHERE company = '농심'; 

#실습 1-23
SELECT COUNT(name) AS '고객수' FROM customer;

#실습 1-24
SELECT COUNT(company) AS '제조업체 수' FROM product;

#실습 1-25
SELECT oederproduct AS '주문 상품번호', SUM(oedercount) AS '총주문 수량' FROM `order` GROUP BY oederproduct;


#실습 1-26
SELECT company AS '제조업체', 
COUNT(*) AS '제품수', 
MAX(price) AS '최고가' 
FROM product 
GROUP BY company;

#실습 1-27
SELECT company AS '제조업체', 
COUNT(*) AS '제품수', 
MAX(price) AS '최고가' 
FROM product 
GROUP BY company 
HAVING `제품수` >= 2;

#실습 1-28
SELECT  oederproduct, orderid,
SUM(oedercount) AS `총 주문 수량` 
FROM `order`
GROUP BY oederproduct, orderid 
HAVING SUM(oedercount) > 0;

#실습 1-29
SELECT  a.orderid, b.prodname 
FROM `order`AS a 
JOIN product AS b 
ON a.oederproduct = b.prodno 
WHERE a.orderid = 'c102';

#실습 1-30
SELECT a.orderid, b.`name`, c.prodname, a.oederdate
FROM `Order` AS a
JOIN `Customer` AS b ON a.orderid = b.pk
JOIN `Product` AS c ON a.oederproduct = c.prodno
WHERE SUBSTR(`oederdate`, 1, 10) = '2022-07-03';
