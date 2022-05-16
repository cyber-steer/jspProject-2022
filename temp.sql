SELECT * FROM mysql.user;
SHOW GRANTS FOR jsp@localhost;

USE android;
customercustomerCREATE TABLE customer(
	id INT,
	NAME VARCHAR(30),
	telno VARCHAR(30),
	email VARCHAR(30)
);
CREATE TABLE member(
	id VARCHAR(20),
	pw VARCHAR(20)
);
SELECT * FROM customer;
DESC customer;
SELECT * FROM member;
DELETE FROM customer WHERE NAME="jsp";

CREATE DATABASE androiddb;
GRANT ALL PRIVILEGES ON androiddb.* TO android@localhost IDENTIFIED BY '1111' WITH GRANT OPTION;
androiddbflush PRIVILEGES;

INSERT INTO customer VALUES(1,'홍길동', '01012345678', 'e@mail.com');loginloginloginlogin