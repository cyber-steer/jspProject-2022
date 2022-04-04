USE jspdb;

CREATE TABLE member(
	id INT PRIMARY KEY,
	pwd VARCHAR(50),
	NAME VARCHAR(50),
	gender CHAR(2),
	phone CHAR(13),
	regdate DATE
);

COMMIT;

ALTER TABLE member
	ADD(email VARCHAR(100));


INSERT INTO member (id, pwd, NAME, gender, phone, email, regdate)
VALUES(1,'11', '홍길동', '남성', '010-1234-5678', 'mail@emails.com', CURDATE());

INSERT INTO member (id, pwd, NAME, gender, phone, email, regdate)
VALUES(2,'22', '아무개', '여성', '010-8765-4321', 'abc@emails.com', CURDATE());

SELECT * FROM member;
SELECT * FROM member WHERE id = 2;