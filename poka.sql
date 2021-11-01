
/* Drop Tables */

DROP TABLE P_BOARDATTACH CASCADE CONSTRAINTS;
DROP TABLE P_REPORT CASCADE CONSTRAINTS;
DROP TABLE P_BOARD CASCADE CONSTRAINTS;
DROP TABLE P_FOLLOW CASCADE CONSTRAINTS;
DROP TABLE P_MEMBERATTACH CASCADE CONSTRAINTS;
DROP TABLE P_NIJIATTACH CASCADE CONSTRAINTS;
DROP TABLE P_NIJI_TAG CASCADE CONSTRAINTS;
DROP TABLE P_PAYATTACH CASCADE CONSTRAINTS;
DROP TABLE P_PAY CASCADE CONSTRAINTS;
DROP TABLE P_NIJI CASCADE CONSTRAINTS;
DROP TABLE P_REVIEW CASCADE CONSTRAINTS;
DROP TABLE P_SOUDAN CASCADE CONSTRAINTS;
DROP TABLE P_MEMBER CASCADE CONSTRAINTS;
DROP TABLE P_AUTH CASCADE CONSTRAINTS;
DROP TABLE P_GAME_TAG CASCADE CONSTRAINTS;
DROP TABLE P_GAME CASCADE CONSTRAINTS;
DROP TABLE P_GRADEATTACH CASCADE CONSTRAINTS;
DROP TABLE P_GRADE CASCADE CONSTRAINTS;
DROP TABLE P_NEWS CASCADE CONSTRAINTS;
DROP TABLE P_TAG CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE P_AUTH
(
	userid varchar2(50) NOT NULL,
	auth varchar2(50) NOT NULL,
	PRIMARY KEY (userid)
);


CREATE TABLE P_BOARD
(
	bno varchar2(20) NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(100) NOT NULL,
	writer varchar2(50) NOT NULL,
	regDate date NOT NULL,
	updateDate date NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE P_BOARDATTACH
(
	uuid varchar2(20) NOT NULL,
	uploadPath varchar2(100) NOT NULL,
	fileName varchar2(30) NOT NULL,
	fileType varchar2(10) NOT NULL,
	bno varchar2(20),
	PRIMARY KEY (uuid)
);


CREATE TABLE P_FOLLOW
(
	fno varchar2(20) NOT NULL,
	follow_userid varchar2(50) NOT NULL,
	follower_userid varchar2(50) NOT NULL,
	img varchar2(30) NOT NULL,
	regDate date NOT NULL,
	PRIMARY KEY (fno)
);


CREATE TABLE P_GAME
(
	gno varchar2(30) NOT NULL,
	gameId varchar2(30) NOT NULL,
	game_img varchar2(30) DEFAULT 'game_dedefault.png' NOT NULL,
	gameNm varchar2(50) NOT NULL,
	game_price varchar2(30) NOT NULL,
	avg_score float NOT NULL,
	game_des varchar2(100) NOT NULL,
	game_vid varchar2(100),
	game_company varchar2(30),
	game_age varchar2(20),
	game_url varchar2(100),
	regDate date DEFAULT SYSDATE,
	updateDate date,
	PRIMARY KEY (gno)
);


CREATE TABLE P_GAME_TAG
(
	gno varchar2(30) NOT NULL,
	tagid varchar2(30) NOT NULL,
	PRIMARY KEY (gno, tagid)
);


CREATE TABLE P_GRADE
(
	grade_code varchar2(20) NOT NULL,
	grade_name varchar2(20) NOT NULL,
	grade_img varchar2(30) NOT NULL,
	grade_lv number NOT NULL,
	PRIMARY KEY (grade_code)
);


CREATE TABLE P_GRADEATTACH
(
	uuid varchar2(30) NOT NULL,
	uploadPath varchar2(100) NOT NULL,
	fileName varchar2(30) NOT NULL,
	fileType varchar2(10) NOT NULL,
	grade_code varchar2(20) NOT NULL,
	PRIMARY KEY (uuid)
);


CREATE TABLE P_MEMBER
(
	userid varchar2(50) NOT NULL,
	userpw varchar2(30) NOT NULL,
	ninkname varchar2(20) NOT NULL,
	email varchar2(50) NOT NULL,
	birth date NOT NULL,
	gradecode varchar2(20) DEFAULT 'A1' NOT NULL,
	img varchar2(50) DEFAULT 'img_default.png' NOT NULL,
	gender char NOT NULL,
	lastlogin date NOT NULL,
	account varchar2(30),
	regDate date DEFAULT SYSDATE NOT NULL,
	updateDate date,
	enabled varchar2(20) NOT NULL,
	PRIMARY KEY (userid)
);


CREATE TABLE P_MEMBERATTACH
(
	uuid varchar2(20) NOT NULL,
	uploadPath varchar2(100) NOT NULL,
	fileName varchar2(30) NOT NULL,
	fileType varchar2(10) NOT NULL,
	userid varchar2(50),
	PRIMARY KEY (uuid)
);


CREATE TABLE P_NEWS
(
	news_no varchar2(20) NOT NULL,
	news_title varchar2(50) NOT NULL,
	regDate date DEFAULT SYSDATE,
	updateDate date,
	news_content varchar2(100) NOT NULL,
	PRIMARY KEY (news_no)
);


CREATE TABLE P_NIJI
(
	nno varchar2(20) NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(100),
	writer varchar2(50),
	category varchar2(30) NOT NULL,
	price number NOT NULL,
	updateDate date,
	PRIMARY KEY (nno)
);


CREATE TABLE P_NIJIATTACH
(
	uuid varchar2(20) NOT NULL,
	uploadPath varchar2(100) NOT NULL,
	fileName varchar2(30) NOT NULL,
	fileType varchar2(10) NOT NULL,
	nno varchar2(20),
	PRIMARY KEY (uuid)
);


CREATE TABLE P_NIJI_TAG
(
	nno varchar2(20) NOT NULL,
	tagid varchar2(30) NOT NULL,
	PRIMARY KEY (nno, tagid)
);


CREATE TABLE P_PAY
(
	pno varchar2(20) NOT NULL,
	nno varchar2(20) NOT NULL,
	title varchar2(50) NOT NULL,
	content varchar2(100) NOT NULL,
	seller varchar2(50) NOT NULL,
	buyer varchar2(50),
	buyer_email varchar2(50),
	pay_status number DEFAULT 0 NOT NULL,
	price number NOT NULL,
	payDate date DEFAULT SYSDATE,
	updateDate date,
	PRIMARY KEY (pno)
);


CREATE TABLE P_PAYATTACH
(
	uuid varchar2(30) NOT NULL,
	uploadPath varchar2(100) NOT NULL,
	fileName varchar2(30) NOT NULL,
	fileType varchar2(10) NOT NULL,
	pno varchar2(20) NOT NULL,
	PRIMARY KEY (uuid)
);


CREATE TABLE P_REPORT
(
	report_no varchar2(20) NOT NULL,
	active_userid varchar2(50) NOT NULL,
	passive_userid varchar2(50) NOT NULL,
	bno varchar2(20) NOT NULL,
	regDate date DEFAULT SYSDATE,
	category varchar2(30) NOT NULL,
	status number DEFAULT 0 NOT NULL,
	PRIMARY KEY (report_no)
);


CREATE TABLE P_REVIEW
(
	rno varchar2(20) NOT NULL,
	content varchar2(100) NOT NULL,
	writer varchar2(50) NOT NULL,
	gno varchar2(30),
	score float,
	regDate date DEFAULT SYSDATE,
	updateDate date,
	PRIMARY KEY (rno)
);


CREATE TABLE P_SOUDAN
(
	qno varchar2(20) NOT NULL,
	qusetioner varchar2(50) NOT NULL,
	answerer varchar2(50),
	q_content varchar2(100) NOT NULL,
	a_content varchar2(100),
	q_regDate date DEFAULT SYSDATE NOT NULL,
	a_regDate date,
	status number,
	PRIMARY KEY (qno)
);


CREATE TABLE P_TAG
(
	tagid varchar2(30) NOT NULL,
	tagname varchar2(30) NOT NULL,
	PRIMARY KEY (tagid)
);



/* Create Foreign Keys */

ALTER TABLE P_MEMBER
	ADD FOREIGN KEY (userid)
	REFERENCES P_AUTH (userid)
;


ALTER TABLE P_BOARDATTACH
	ADD FOREIGN KEY (bno)
	REFERENCES P_BOARD (bno)
;


ALTER TABLE P_REPORT
	ADD FOREIGN KEY (bno)
	REFERENCES P_BOARD (bno)
;


ALTER TABLE P_GAME_TAG
	ADD FOREIGN KEY (gno)
	REFERENCES P_GAME (gno)
;


ALTER TABLE P_REVIEW
	ADD FOREIGN KEY (gno)
	REFERENCES P_GAME (gno)
;


ALTER TABLE P_GRADEATTACH
	ADD FOREIGN KEY (grade_code)
	REFERENCES P_GRADE (grade_code)
;


ALTER TABLE P_MEMBER
	ADD FOREIGN KEY (gradecode)
	REFERENCES P_GRADE (grade_code)
;


ALTER TABLE P_BOARD
	ADD FOREIGN KEY (writer)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_FOLLOW
	ADD FOREIGN KEY (follower_userid)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_FOLLOW
	ADD FOREIGN KEY (follow_userid)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_MEMBERATTACH
	ADD FOREIGN KEY (userid)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_NIJI
	ADD FOREIGN KEY (writer)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_PAY
	ADD FOREIGN KEY (buyer)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_PAY
	ADD FOREIGN KEY (seller)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_REPORT
	ADD FOREIGN KEY (active_userid)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_REPORT
	ADD FOREIGN KEY (passive_userid)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_REVIEW
	ADD FOREIGN KEY (writer)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_SOUDAN
	ADD FOREIGN KEY (qusetioner)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_SOUDAN
	ADD FOREIGN KEY (answerer)
	REFERENCES P_MEMBER (userid)
;


ALTER TABLE P_NIJIATTACH
	ADD FOREIGN KEY (nno)
	REFERENCES P_NIJI (nno)
;


ALTER TABLE P_NIJI_TAG
	ADD FOREIGN KEY (nno)
	REFERENCES P_NIJI (nno)
;


ALTER TABLE P_PAY
	ADD FOREIGN KEY (nno)
	REFERENCES P_NIJI (nno)
;


ALTER TABLE P_PAYATTACH
	ADD FOREIGN KEY (pno)
	REFERENCES P_PAY (pno)
;


ALTER TABLE P_GAME_TAG
	ADD FOREIGN KEY (tagid)
	REFERENCES P_TAG (tagid)
;


ALTER TABLE P_NIJI_TAG
	ADD FOREIGN KEY (tagid)
	REFERENCES P_TAG (tagid)
;



