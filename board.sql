DROP table member;
DROP table board;

CREATE TABLE member(
	id VARCHAR(30),
	pw VARCHAR(30),
	NAME VARCHAR(30)
);
CREATE TABLE board(
	title VARCHAR(30),
	name VARCHAR(20),
	content VARCHAR(200),
	idx VARCHAR(200)
);
DROP TABLE board;
INSERT INTO member(id, NAME, pw) VALUES('test', '1111', '관리자');
INSERT INTO member(id, NAME, pw) VALUES('test1', '11111', '관리자1');
INSERT INTO board(title, NAME, content, idx) VALUES('title', '관리자','test','0000');

SELECT * FROM member;
SELECT * FROM board;

update member set NAME='aa', pw=2 where id='test';
delete from member where id='test';
delete from board  where NAME IS NULL;
DELETE FROM board WHERE title='';
select id from member where id='test';

update board set title=?, content=? where NAME=?;
update board set title='임시제목', content='rfa3' where idx='369';

delete from board where idx='11';
select * from member where NAME="관리자";
select * from board where idx='0000';