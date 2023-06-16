#날짜 : 2023/06/15
#이름 : 강원빈
#내용 : 제 3장 데이터베이스 관리testdb

#실습 3-1
CREATE DATABASE `TestDB`;
CREATE USER 'tester'@'%' IDENTIFIED BY '1234';
grant all privileges on testdb.* To `tester`@`%`;
flush privileges;

#실습 3-2
alter user 'tester'@'%' identified by '12345';
drop user `tester`@`%`;
flush privileges;