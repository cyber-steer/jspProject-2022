

DROP TABLE formalities;
DROP TABLE meterial;
DROP TABLE recipecontent;
DROP TABLE favorite;
DROP TABLE recipes;
DROP TABLE USER;
DROP TABLE board;

CREATE TABLE USER(
	userid VARCHAR(30) NOT NULL PRIMARY KEY,
	pwd VARCHAR(30),
	nickname VARCHAR(30)
);
CREATE TABLE recipes(
	recipesName VARCHAR(30) PRIMARY KEY,
	proof varchar(30),
	base VARCHAR(30)
);
CREATE TABLE recipecontent(
	recipesname VARCHAR(30) PRIMARY KEY,
	content VARCHAR(100) NOT NULL,
	FOREIGN KEY(recipesname) REFERENCES recipes(recipesname)
);
CREATE TABLE meterial(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	recipesName VARCHAR(30) NOT NULL,
	meterialname VARCHAR(30) NOT NULL,
	voluem INT(10) NOT NULL,
	FOREIGN KEY(recipesname) REFERENCES recipes(recipesName)
);
CREATE TABLE formalities(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	recipesName VARCHAR(30) NOT null,
	num INT(10),
	content VARCHAR(30),
	FOREIGN KEY(recipesname) REFERENCES recipes(recipesName)
);
CREATE TABLE favorite(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	recipesname VARCHAR(30) NOT NULL,
	userid VARCHAR(30) NOT NULL,
	FOREIGN KEY(recipesname) REFERENCES recipes(recipesName),
	FOREIGN KEY(USERid) REFERENCES USER(userid)
);
CREATE TABLE board(
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nickname VARCHAR(30) NOT NULL,
	title VARCHAR(20) NOT NULL,
	content VARCHAR(100) NOT NULL,
	bdate timestamp not null default now()
);

DESC recipes;
DESC USER;
DESC favorite;
DESC formalities;
DESC meterial;
DESC recipecontent;
DESC board;

SELECT * FROM recipes;
SELECT * FROM USER;
SELECT * FROM favorite;
SELECT * FROM formalities;
SELECT * FROM meterial;
SELECT * FROM recipecontent;
SELECT * FROM board order by bdate DESC;

UPDATE board SET title='title', content='content' WHERE id='4';

SELECT name, proof, favorite FROM recipes where favorite=true;
update recipes set favorite=true where NAME='모스코 뮬';
SELECT nickname from user where id='admin' and pwd='root';
SELECT pwd, nickname from user where id='fd';
DELETE FROM USER WHERE pwd='11';
DESC USER;
select recipesname from favorite where userid='admin';
SELECT recipesname FROM favorite WHERE userid='admin' AND recipesname='진토닉';

SELECT * FROM recipes WHERE recipesname='name';
SELECT * FROM recipecontent WHERE recipesname='name';
SELECT * FROM formalities WHERE recipesname='name' ORDER BY num;
SELECT * FROM meterial WHERE recipesname='name';

SELECT * FROM recipes WHERE recipesname LIKE '%n%';
SELECT * FROM favorite WHERE userid='admin' AND recipesname LIKE '%n%';

DELETE FROM formalities WHERE recipesName='name';
DELETE FROM meterial WHERE recipesName='name';
DELETE FROM recipecontent WHERE recipesName='name';
DELETE FROM favorite WHERE recipesName='name';
DELETE FROM recipes WHERE recipesName='name';

SELECT recipesname, proof FROM recipes WHERE recipesname IN (SELECT recipesname FROM favorite WHERE userid='admin') AND recipesname LIKE '%n%';


INSERT INTO USER (userid, pwd, nickName) VALUES('admin','root','관리자');
insert into user(userid, nickname, pwd) VALUES('id', 'nickname', 'pwd');

INSERT INTO recipes (recipesName, proof, base) VALUES('모스코 뮬','12','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('블랙 러시안','32','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('블러디 메리','15','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('섹스 온 더 비치','9','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('스크루드라이버','25','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('카미카제','27','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('코스모폴리탄','30','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('키스 오브 파이어','25','보드카');
INSERT INTO recipes (recipesName, proof, base) VALUES('김렛','30','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('네그로니','25','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('라모스 진 피즈','10','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('마티니','34','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('진토닉','14','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('진피즈','16','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('핑크레이디','20','진');
INSERT INTO recipes (recipesName, proof, base) VALUES('XYZ','30','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('다이키리','30','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('모히토','15','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('블루 하와이','17','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('쿠바 리브레','14','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('파우스트','49.7','럼');
INSERT INTO recipes (recipesName, proof, base) VALUES('피나 콜라다','10','럼');

INSERT INTO favorite(recipesname, userid) VALUES('진토닉', 'admin');
INSERT INTO favorite(recipesname, userid) VALUES('파우스트', 'admin');
DELETE FROM favorite WHERE userid='admin' AND recipesname='진토닉';

INSERT INTO recipecontent(recipesname,material,volum) VALUES('진토닉','item',30);

INSERT INTO recipecontent(recipesname, content) VALUES('블랙 러시안', '커피맛 잠깨는데 특화');

INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 6, '완성!!');
INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 1, '온더락 글라스를 준비한다');
INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 4, '깔루아를 넣는다');
INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 3, '보드카를 넣는다');
INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 5, '섞는다');
INSERT INTO formalities(recipesname, num, content) VALUES('블랙 러시안', 2, '큰 얼음을 넣는다');

INSERT INTO meterial(recipesname, meterialname, voluem) VALUES('블랙 러시안', '깔루아', 20);
INSERT INTO meterial(recipesname, meterialname, voluem) VALUES('블랙 러시안', '보드카', 40);


INSERT INTO formalities(recipesname, content) VALUES('진토닉', '첫번째\n두번째\n세번째');

INSERT INTO board(title, content, nickname) VALUES('제목', '내용', '관리자');



SELECT * FROM recipes WHERE recipesname='name';
SELECT * FROM recipecontent WHERE recipesname='name';
SELECT * FROM formalities WHERE recipesname='name' ORDER BY num;
SELECT * FROM meterial WHERE recipesname='name';

INSERT INTO recipes (recipesName, proof, base) VALUES('카미카제','27','보드카');
INSERT INTO recipecontent(recipesname, content) VALUES('카미카제','작은 잔에 강한 술을 섞어 마시는 종류의 칵테일입니다.');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('카미카제','보드카',30);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('카미카제','코앵트루',15);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('카미카제','라임 주스',15);
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',1,'칵테일 글라스에 얼음을 넣어 차갑게한다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',2,'세이커에 얼음을 넣고 보드카를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',3,'쿠앵트르를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',4,'라임주스를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',5,'세이커를 흔든다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',6,'글라스에 얼음을 버리고 음료를 따른다');
INSERT INTO formalities(recipesName, num, content) VALUES('카미카제',7,'가니쉬로 라임을 쓴다');

INSERT INTO recipes (recipesName, proof, base) VALUES('블랙 러시안','32','보드카');
INSERT INTO recipecontent(recipesname, content) VALUES('블랙 러시안','커피 리큐르의 단맛이 특징으로 알코올 도수가 높은데도 마시기가 힘들지 않는 게 특징이다');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('블랙 러시안','보드카',30);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('블랙 러시안','깔루아',15);
INSERT INTO formalities(recipesName, num, content) VALUES('블랙 러시안',1,'올드패션드 글라스에 얼음을 채운다');
INSERT INTO formalities(recipesName, num, content) VALUES('블랙 러시안',2,'보드카를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('블랙 러시안',3,'깔루아를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('블랙 러시안',4,'바 스푼으로 잘 섞어준다');


INSERT INTO recipes (recipesName, proof, base) VALUES('핑크레이디','20','진');
INSERT INTO recipecontent(recipesname, content) VALUES('핑크레이디','단맛이 별로 없지만 부드럽다');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('핑크레이디','진',45);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('핑크레이디','그레나딘 시럽',10);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('핑크레이디','크림',15);
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('핑크레이디','달걀 흰자',1);
INSERT INTO formalities(recipesName, num, content) VALUES('핑크레이디',1,'쉐이커에 모든 재료를 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('핑크레이디',2,'쉐이커를 잘 흔든다');
INSERT INTO formalities(recipesName, num, content) VALUES('핑크레이디',3,'쉐이커에 얼음을 넣는다');
INSERT INTO formalities(recipesName, num, content) VALUES('핑크레이디',3,'다시 잘 흔들어준다');
INSERT INTO formalities(recipesName, num, content) VALUES('핑크레이디',3,'잔에 음료를 따른다');


INSERT INTO recipes (recipesName, proof, base) VALUES('김렛','30','진');
INSERT INTO recipecontent(recipesname, content) VALUES('','');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('','',);
INSERT INTO formalities(recipesName, num, content) VALUES('',,'');


INSERT INTO recipes (recipesName, proof, base) VALUES('네그로니','25','진');
INSERT INTO recipecontent(recipesname, content) VALUES('','');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('','',);
INSERT INTO formalities(recipesName, num, content) VALUES('',,'');


INSERT INTO recipes (recipesName, proof, base) VALUES('다이키리','30','럼');
INSERT INTO recipecontent(recipesname, content) VALUES('','');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('','',);
INSERT INTO formalities(recipesName, num, content) VALUES('',,'');


INSERT INTO recipes (recipesName, proof, base) VALUES('모히토','15','럼');
INSERT INTO recipecontent(recipesname, content) VALUES('','');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('','',);
INSERT INTO formalities(recipesName, num, content) VALUES('',,'');


INSERT INTO recipes (recipesName, proof, base) VALUES('블루 하와이','17','럼');
INSERT INTO recipecontent(recipesname, content) VALUES('','');
INSERT INTO meterial(recipesName, meterialname, voluem) VALUES('','',);
INSERT INTO formalities(recipesName, num, content) VALUES('',,'');

