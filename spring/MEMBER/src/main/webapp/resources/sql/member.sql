DROP TABLE MEMBER_LOG;
DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
    MEMBER_NO NUMBER NOT NULL,
    ID VARCHAR2(32 BYTE) NOT NULL UNIQUE,
    PW VARCHAR2(64 BYTE) NOT NULL,  -- 암호화된 비번 최대 64바이트
    NAME VARCHAR2(100 BYTE),
    EMAIL VARCHAR2(200 BYTE) NOT NULL UNIQUE,  -- 이메일 인증 때문에 UNIQUE
    AGREE_STATE NUMBER,  -- 동의 여부
    SIGN_IN DATE,  -- 가입일
    PW_MODIFIED DATE,    -- 비번 수정일
    INFO_MODIFIED DATE,  -- 회원정보 수정일
    SESSION_ID VARCHAR2(50 BYTE),  -- 세션 아이디
    SESSION_LIMIT DATE             -- 세션 만료일
);

CREATE TABLE MEMBER_LOG
(
    MEMBER_LOG_NO NUMBER NOT NULL,
    ID VARCHAR2(32 BYTE) NOT NULL,
    SIGN_UP DATE  -- 로그인 일시
);
-- MEMBER 기본키
ALTER TABLE MEMBER
    ADD CONSTRAINT MEMBER_PK
        PRIMARY KEY(MEMBER_NO);
-- MEMBER_LOG 기본키
ALTER TABLE MEMBER_LOG
    ADD CONSTRAINT MEMBER_LOG_PK
        PRIMARY KEY(MEMBER_LOG_NO);
-- MEMBER_LOG 외래키
ALTER TABLE MEMBER_LOG
    ADD CONSTRAINT MEMBER_LOG_MEMBER_FK
        FOREIGN KEY(ID) REFERENCES MEMBER(ID)
            ON DELETE CASCADE;


-- 트리거 구성

-- 탈퇴자 테이블
DROP TABLE SIGN_OUT_MEMBER;
CREATE TABLE SIGN_OUT_MEMBER(
	SIGN_OUT_NO NUMBER NOT NULL,
	MEMBER_NO NUMBER,
	ID VARCHAR2(32 BYTE),
	NAME VARCHAR2(100 BYTE),
	EMAIL VARCHAR2(200 BYTE),
	SIGN_OUT DATE DEFAULT SYSDATE
);

-- PK로 사용할 칼럼 추가
ALTER TABLE SIGN_OUT_MEMBER
    ADD SIGN_OUT_NO NUMBER NOT NULL;

-- 탈퇴일로 사용할 칼럼 추가
ALTER TABLE SIGN_OUT_MEMBER
    ADD SIGN_OUT DATE DEFAULT SYSDATE NOT NULL;

-- 기본키
ALTER TABLE SIGN_OUT_MEMBER
    ADD CONSTRAINT SIGN_OUT_MEMBER_PK
        PRIMARY KEY(SIGN_OUT_NO);

-- 시퀀스
DROP SEQUENCE SIGN_OUT_MEMBER_SEQ;
CREATE SEQUENCE SIGN_OUT_NO_SEQ NOCACHE;

CREATE SEQUENCE MEMBER_SEQ NOCACHE;
CREATE SEQUENCE MEMBER_LOG_SEQ NOCACHE;

-- MEMBER 테이블의 정보가 삭제되면 SIGN_OUT_MEMBER 테이블로 해당 정보가 저장되는 트리거
CREATE OR REPLACE TRIGGER SIGN_OUT_TRIGGER
    AFTER DELETE
    ON MEMBER
    FOR EACH ROW
BEGIN
    INSERT INTO SIGN_OUT_MEMBER
        (SIGN_OUT_NO, MEMBER_NO, ID, NAME, EMAIL)
    VALUES
        (SIGN_OUT_NO_SEQ.NEXTVAL, :OLD.MEMBER_NO, :OLD.ID, :OLD.NAME, :OLD.EMAIL);
END SIGN_OUT_TRIGGER;
