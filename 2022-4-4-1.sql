USE jspdb;

CREATE TABLE login(
	id VARCHAR(10),
	pwd VARCHAR(20customer)
);

COMMIT;

DROP TABLE login;

DESC login;
SELECT * FROM login;

memberINSERT INTO login(id,pwd) VALUES('test1', '1111');
INSERT INTO login(id,pwd) VALUES('test2', '2222');
INSERT INTO login(id,pwd) VALUES('test3', '3333');
INSERT INTO login(id,pwd) VALUES('test4', '4444');
INSERT INTO login(name,id,pwd) VALUES('Name','test', '1111');

ALTER TABLE login
	ADD(name VARCHAR(20));
	
delete from login where id='ㅁㅁㅁ';
DELETE FROM login WHERE id