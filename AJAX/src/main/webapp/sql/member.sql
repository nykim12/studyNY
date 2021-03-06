CREATE TABLE MEMBER(
	NO NUMBER PRIMARY KEY,
	ID VARCHAR2(20 BYTE) NOT NULL UNIQUE,
	NAME VARCHAR2(20 BYTE),
	GENDER VARCHAR2(6 BYTE),
	ADDRESS VARCHAR2(100 BYTE)
);

CREATE SEQUENCE MEMBER_SEQ NOCACHE;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user1', '사용자1', 'female', '서울시 금천구 가산동');
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user2', '사용자2', 'male', '경기도 수원시 권선구 세류동');
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user3', '사용자3', 'female', '서울시 강남구 논현동');

SELECT NO, ID, NAME, GENDER, ADDRESS FROM MEMBER;