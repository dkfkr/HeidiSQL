#날짜 : 2023/06/23
#이름 : 강원빈
#내용 : 연습문제 04

#실습 4-1
CREATE DATABASE `BookStore`;
CREATE USER `admin4`@`%` IDENTIFIED BY `1234`;
GRANT ALL PRIVILEGES ON `bookStore`.* `admin4`@`%`;
FLUSH PRIVILEGES;

#실습 4-2
CREATE TABLE Customer (
custId INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR (10)  NOT NULL,
address VARCHAR (20) NULL, 
phone VARCHAR (13)   NULL 
);
DROP TABLE Customer
CREATE TABLE `Book`(
bookId    INT           NOT NULL PRIMARY KEY,
bookName  VARCHAR (20)  NOT NULL, 
publisher VARCHAR (20)  NOT NULL, 
price     INT           NULL 
);

CREATE TABLE `ORDER` (
orderId   INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
custId     INT     NOT NULL, 
bookId    INT     NOT NULL,
salePrice INT     NOT NULL, 
orderDate DATE    NOT NULL 
);

#실습 4-3
INSERT INTO customer VALUES("1", "박지성" , "영국맨체스티"    , "000-5000-0001"); 
INSERT INTO customer VALUES("2", "김연아 ", "대한민국 서울"   , "000-6000-0001"); 
INSERT INTO customer VALUES("3", "장미란 ", "대한민국 강원도" , "000-7000-0001"); 
INSERT INTO customer VALUES("4", "추신수 ", "미국 클리블런드" , "000-8000-0001"); 
INSERT INTO customer VALUES("5", "박세리 ", "대한민국 대전"   , NULL); 


INSERT INTO book VALUES("1" , "축구의 역사"      , "굿스포츠"  , "7000 "); 
INSERT INTO book VALUES("2" , "축구아는 여자"    , "나무수"    , "13000"); 
INSERT INTO book VALUES("3" , "축구의 이해 "     , "대한미디어", "22000"); 
INSERT INTO book VALUES("4" , "골프 바이블 "     , "대한미디어", "35000");
INSERT INTO book VALUES("5" , "피겨 교본"        , "굿스포츠"  , "8000"); 
INSERT INTO book VALUES("6" , "역도 단계별기술"  , "굿스포츠"  , "6000"); 
INSERT INTO book VALUES("7" , "야구의 추억"      , "이상미디어", "20000"); 
INSERT INTO book VALUES("8" , "야구를 부탁해"    , "이상미디어", "13000");
INSERT INTO book VALUES("9" , "올림픽 이야기"    , "삼성당"    , "7500"); 
INSERT INTO book VALUES("10", "Olympic Champions", "Pearson"   , "13000"); 

INSERT INTO `ORDER` VALUES("1" , "1", "1" , "6000" ,"2014-07-01"); 
INSERT INTO `order` VALUES("2" , "1", "3" , "21000","2014-07-03");
INSERT INTO `ORDER` VALUES("3" , "2", "5" , "8000" ,"2014-07-03");
INSERT INTO `order` VALUES("4" , "3", "6" , "6000" ,"2014-07-04");
INSERT INTO `ORDER` VALUES("5" , "4", "7" , "20000","2014-07-05");
INSERT INTO `order` VALUES("6" , "1", "2" , "12000","2014-07-07");
INSERT INTO `ORDER` VALUES("7" , "4", "5" , "13000","2014-07-07");
INSERT INTO `ORDER` VALUES("8" , "3", "10", "12000","2014-07-08");
INSERT INTO `order` VALUES("9" , "2", "10", "7000" ,"2014-07-09");
INSERT INTO `ORDER` VALUES("10", "3", "8" , "13000","2014-07-10");

#실습 4-4
SELECT * FROM customer;

#실습 4-5
SELECT bookName, price FROM book; 

#실습 4-6
SELECT price, bookname FROM book; 

#실습 4-7
SELECT bookId, bookName, publisher, price FROM book; 

#실습 4-8
SELECT publisher FROM book; 

#실습 4-9
SELECT DISTINCT publisher FROM book; 

#실습 4-10
SELECT * FROM book WHERE price >= 20000;

#실습 4-11
SELECT * FROM book WHERE price < 20000;

#실습 4-12
SELECT * FROM book WHERE price >= 10000 AND price <= 20000;

#실습 4-13
SELECT bookid, bookname, price FROM book WHERE price >= 15000 AND price <= 30000;

#실습 4-14
SELECT * FROM book WHERE bookid BETWEEN 2 AND 5;

#실습 4-15
SELECT * FROM book WHERE bookid %2 =0;

#실습 4-16
SELECT * FROM customer WHERE `name` LIKE "박%";

#실습 4-17
SELECT * FROM customer WHERE address LIKE "대한민국%";

#실습 4-18
SELECT * FROM customer WHERE phone IS NOT NULL;

#실습 4-19
SELECT * FROM book WHERE publisher = "굿스포츠" OR publisher = "대한미디어";

#실습 4-20
SELECT publisher FROM book WHERE bookname = "축구의 역사";

#실습 4-21
SELECT publisher FROM book WHERE bookname LIKE "축구%";

#실습 4-22
SELECT * FROM book WHERE bookname LIKE "_구%";

#실습 4-23
SELECT * FROM book WHERE bookname LIKE "축구%" AND price >= 20000;

#실습 4-24
SELECT * FROM book order by bookname; 

#실습 4-25
SELECT * FROM book order by price;

#실습 4-26
SELECT *
FROM book
ORDER BY price DESC,
 CASE WHEN price = price 
 THEN bookid END ASC;

#실습 4-27
SELECT *
FROM book
ORDER BY price DESC
LIMIT 3;

#실습 4-28
SELECT *
FROM book
ORDER BY price ASC 
LIMIT 3;

#실습 4-29
SELECT 
 SUM(saleprice) AS 총판매액
FROM `order` WHERE saleprice; 

#실습 4-30
SELECT 
 SUM(saleprice) AS 총판매액,
 AVG(saleprice) AS 평균값,
 MAX(saleprice) AS 최고값,
 MIN(saleprice) AS 최저값
FROM `order`;

#실습 4-31
SELECT 
COUNT(orderId) AS 판매건수
FROM `order`; 

#실습 4-32
UPDATE book
SET bookname = REPLACE(bookname, '야구', '농구')
WHERE bookname LIKE '%야구%';

SELECT *
FROM book;

#실습 4-33
SELECT 
a.custId,
COUNT(b.orderId) AS 수량
FROM customer AS a
JOIN `order` AS b 
ON a.custId = b.custId
JOIN book AS c
ON b.bookId = c.bookId
WHERE c.price >= 8000 
GROUP BY a.custId
HAVING COUNT(b.orderId) >= 2;

#실습 4-34
SELECT * 
FROM customer AS a
JOIN `order` AS b
ON a.custId = b.cusId;

SELECT * FROM customer AS a
JOIN `order` AS b USING(`custId`);

SELECT * 
FROM customer  a, `order` b
WHERE a.custId = b.custId;

#실습 4-35
SELECT * 
FROM customer AS a
JOIN `order` AS b
ON a.custId = b.custId
order BY phone;

#실습 4-36
SELECT 
a.name,
b.salePrice 
FROM customer AS a
JOIN `order` AS b
ON a.custId = b.custId;

#실습 4-37
SELECT 
a.name,
b.salePrice,
SUM(b.salePrice) 
FROM customer AS a
JOIN `order` AS b
ON a.custId = b.custId
GROUP BY a.name, b.salePrice
order BY `name`;

#실습 4-38
SELECT 
`name`,
`bookName`
FROM customer AS a
JOIN `order` AS b
ON a.custId = b.custId
JOIN book AS c ON b.bookId = c.bookId;


#실습 4-39
SELECT
c.name AS customer_name,
b.bookName AS book_name
FROM
Customer AS c
JOIN
`ORDER` AS o ON c.custId = o.custId
JOIN
Book AS b ON o.bookId = b.bookId
WHERE
b.price = 20000;

#실습 4-40
SELECT
a.name AS customer_name,
b.salePrice
FROM
Customer AS a
LEFT JOIN
`ORDER` AS b ON a.custId = b.custId

#실습 4-41
SELECT 
bookname
FROM book
WHERE price
order BY price DESC
LIMIT 1;

#실습 4-42
SELECT
`NAME`
FROM customer AS a
LEFT JOIN `order` AS b
ON a.custId = b.custId
WHERE b.cusId IS NULL

#실습 4-43
INSERT INTO book (bookid, bookname, publisher) VALUE ("11" ,"스포츠의학", "한솔의학서적");

#실습 4-44
UPDATE customer SET address = "대한민국 부산" WHERE custid = 5;

#실습 4-45
DELETE FROM customer WHERE custid = 5;

#실습 4-46
SELECT 
SUM(`salePrice`) AS `총 판매액`
FROM customer as a
JOIN `order` AS b 
ON a.custId = b.custId
WHERE `name` = '김연아';

SELECT 
SUM(saleprice) AS `총 매출`
FROM `order`
WHERE custid = ( SELECT custid FROM customer WHERE NAME = '김연아'):erd2erd2