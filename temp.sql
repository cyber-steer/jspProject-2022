SELECT * FROM mysql.user;
SHOW GRANTS FOR jsp@localhost;

USE android;
customerCREATE TABLE customer(
	id INT,
	NAME VARCHAR(30),
	telno VARCHAR(30),
	email VARCHAR(30)
);

SELECT * FROM customer;
SELECT * FROM androiddb;

CREATE DATABASE androiddb;
GRANT ALL PRIVILEGES ON androiddb.* TO android@localhost IDENTIFIED BY '1111' WITH GRANT OPTION;
androiddbflush PRIVILEGES;

INSERT INTO customer VALUES(1,'홍길동', '01012345678', 'e@mail.com');