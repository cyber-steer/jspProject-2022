USE jspdb;

CREATE TABLE login(
	id VARCHAR(10),
	pwd VARCHAR(20)
);

COMMIT;

DROP TABLE login;

DESC login;
SELECT * FROM login;

INSERT INTO login(id,pwd) VALUES('test1', '1111');
INSERT INTO login(id,pwd) VALUES('test2', '2222');
INSERT INTO login(id,pwd) VALUES('test3', '3333');
INSERT INTO login(id,pwd) VALUES('test4', '4444');