#날짜 : 2023/06/22
#이름 : 강원빈
#내용 : 연습문제 03

#실습 3-1
CREATE DATABASE College;
CREATE USER `admin3`@`%` IDENTIFIED BY '1234'
GRANT ALL PRIVILEGES ON College.* TO `admin3`@`%`;
FLUSH PRIVILEGES;

#실습 3-2
CREATE TABLE Student(
`stdNo`      CHAR(8)      NOT NULL PRIMARY KEY,
`stdName`    VARCHAR(20)  NOT NULL,
`stdHp`      CHAR(13)     NOT NULL UNIQUE KEY,
`stdYear`    INT          NOT NULL,
`stdAddress` VARCHAR(100) NULL
);

CREATE TABLE Lecture(
`lecNo`     INT         NOT NULL PRIMARY KEY,
`lecName`   VARCHAR(20) NOT NULL,
`lecCredit` INT         NOT NULL,
`lecTimer`  INT         NOT NULL,
`lecClass`  VARCHAR(10) NULL
);

CREATE TABLE Register(
`regStdNo`       CHAR(8) NOT NULL,
`regLecNo`    	  INT     NOT NULL,
`regMidScore`	  INT     NULL,
`regFinalScore` INT     NULL, 
`regTotalScore`  INT     NULL,
`regGrade`       CHAR(1) NULL
);

#실습 3-3
INSERT INTO student (`stdNo`,`stdName`,`stdHp`,`stdYear`) VALUES ("20201016", "김유신", "010-1234-1001", 3);
INSERT INTO student VALUES ("20201126", "김춘추", "010-1234-1002", 3, "경상남도 경주시");
INSERT INTO student VALUES ("20210216", "장보고", "010-1234-1003", 2, "전라남도 완도시");
INSERT INTO student VALUES ("20210326", "강감찬", "010-1234-1004", 2, "서울시 영등포구");
INSERT INTO student VALUES ("20220416", "이순신", "010-1234-1005", 1, "부산시 부산진구");
INSERT INTO student VALUES ("20220521", "송상현", "010-1234-1006", 1, "부산시 동래구");

INSERT INTO lecture VALUES ("159", "인지행동심리학",    3, 40, "본304");
INSERT INTO lecture VALUES ("167", "운영체제론 ",       3, 25, "본B05");
INSERT INTO lecture VALUES ("234", "중급 영문법",       3, 20, "본201");
INSERT INTO lecture VALUES ("239", "세법개론",          3, 40, "본204")edr3;
INSERT INTO lecture VALUES ("248", "빅데이터 개론",     3, 20, "본B01");
INSERT INTO lecture VALUES ("253", "컴퓨팅사고와 코딩", 2, 10, "본B02");
INSERT INTO lecture VALUES ("349", "사회복지 마케팅",   2, 50, "본301");

INSERT INTO register (regcollegeStdNo,regLecNo) VALUES ("20201126", 234);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20201026", 248);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20201016", 253);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20201126", 239);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20210216", 349);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20210326", 349);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20201016", 167);
INSERT INTO register (regStdNo,regLecNo) VALUES ("20220416", 349);

#실습 3-4
SELECT * FROM lecture;

#실습 3-5
SELECT * FROM student;

#실습 3-6
SELECT * FROM register;

#실습 3-7
SELECT * FROM student WHERE stdYear = 3;

#실습 3-8
SELECT * FROM Lecture WHERE lecCredit = 2;

#실습 3-9
UPDATE register SET `regMidScore` = 36, `regFinalScore`= 42 WHERE `regStdNo`='20201126' AND `regLecNo`=234;
UPDATE Register SET `regMidScore` = 24, `regFinalScore`= 62 WHERE `regStdNo`='20201016' AND `regLecNo`=248;
UPDATE Register SET `regMidScore` = 28, `regFinalScore`= 40 WHERE `regStdNo`='20201016' AND `regLecNo`=253;
UPDATE Register SET `regMidScore` = 37, `regFinalScore`= 57 WHERE `regStdNo`='20201126' AND `regLecNo`=239;
UPDATE Register SET `regMidScore` = 28, `regFinalScore`= 68 WHERE `regStdNo`='20210216' AND `regLecNo`=349;
UPDATE Register SET `regMidScore` = 16, `regFinalScore`= 65 WHERE `regStdNo`='20210326' AND `regLecNo`=349;
UPDATE Register SET `regMidScore` = 18, `regFinalScore`= 38 WHERE `regStdNo`='20201016' AND `regLecNo`=167;
UPDATE Register SET `regMidScore` = 25, `regFinalScore`= 58 WHERE `regStdNo`='20220416' AND `regLecNo`=349;

#실습 3-10
UPDATE Register
SET
`regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
             if(`regTotalScore` >= 80, 'B',
             if(`regTotalScore` >= 70, 'C',
             if(`regTotalScore` >= 60, 'D', 'F'))));

#실습 3-11
SELECT * FROM register 
ORDER BY regTotalScore DESC;

#실습 3-12
SELECT * FROM register
WHERE regLecNo = 349 
ORDER BY regTotalScore DESC;

#실습 3-13
SELECT * FROM lecture 
WHERE lecTimer >= 30;

#실습 3-14
SELECT lecName lecClass 
FROM lecture;

#실습 3-15
SELECT stdNo,stdName 
FROM student;

#실습 3-16
SELECT * FROM student 
WHERE stdAddress = "NULL";

#실습 3-17
SELECT * FROM student 
WHERE stdAddress 
LIKE "부산시%";

#실습 3-18
SELECT * FROM student AS a 
JOIN register AS b 
ON a.stdNo = b.regStdNo;

#실습 3-19
SELECT 
stdNo,
stdName,
regLecNo,
regMidScore,
regFnialScore,
regTotalScore,
regGrade
FROM student AS a, 
register AS b 
WHERE a.stdNo = b.regStdNo;

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo WHERE `regLecNo`=349;

#실습 3-21
SELECT
`stdNo`,
`stdName`,
COUNT(`stdNo`) AS `수강신청 건수`,
SUM(`regTotalScore`) AS `종합점수`,
SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
GROUP BY `stdNo`;

#실습 3-22
SELECT * FROM `Register` AS a
JOIN `Lecture` AS b
ON a.regLecNo = b.lecNo

#실습 3-23
SELECT 
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
FROM register AS a
JOIN lecture AS b
ON a.regLecNo = b.lecNo;

#실습 3-24
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.regLecNo = b.lecNo
WHERE `lecName`='사회복지 마케팅';

#실습 3-25
SELECT
`regStdNo`,
`lecName`
FROM `Register` AS a JOIN `Lecture` AS b 
ON a.regLecNo = b.lecNo
WHERE `regGrade`='A';

#실습 3-26
SELECT * FROM student AS a
JOIN register AS b
ON a.stdNo = b.regStdNo
JOIN lecture AS c 
ON b.regLecNo = c.lecNo

#실습 3-27
SELECT
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
JOIN register AS b
ON a.stdNo = b.regStdNo
JOIN lecture  AS c
ON b.regLecNo = c.lecNo
WHERE regGrade = "F";

#실습 3-28
SELECT
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
JOIN register AS b
ON a.stdNo = b.regStdNo
JOIN lecture  AS c
ON b.regLecNo = c.lecNo
WHERE regGrade = "F";
 
#실습 3-29
SELECT
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN register AS b
ON a.stdNo = b.regStdNo
JOIN lecture  AS c
ON b.regLecNo = c.lecNo
WHERE `regTotalScore` >=60
GROUP BY `stdNo`;

#실습 3-30
SELECT
`stdNo`,
`stdName`,
GROUP_CONCAT(`lecName`) AS `신청과목`,
GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN register AS b
ON a.stdNo = b.regStdNo
JOIN lecture  AS c
ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;