--DML, 데이터 조작어
--SELECT, INSERT, UPDATE, DELETE

--데이터 삽입
INSERT INTO BOARD
    (BNO, TITLE, CONTENT, WRITER,REG_DATE)
VALUES
    (1, '안녕!~', '재밌는 내용입니다.', '마이콜', SYSDATE);


-- NOT NULL 제약조건에 걸림(TITLE)
INSERT INTO BOARD
    (BNO, CONTENT, WRITER,REG_DATE)
VALUES
    (2, '재밌는 내용입니다.', '마이콜', SYSDATE);


--PK 제약조건으로 글번호 중복
INSERT INTO BOARD
    (BNO,TITLE, WRITER,REG_DATE)
VALUES
    (1, '새로운 글이야', '도우너', SYSDATE);


INSERT INTO BOARD
    (BNO, TITLE, WRITER,REG_DATE)
VALUES
    (2, '새로운 글이야', '도우너', SYSDATE);

-- 테이블의 모든 컬럼을 순서대로 채울 경우 컬럼지정을 생략 가능
INSERT INTO BOARD
VALUES
    (3, '3번 글', '글 내용', '둘리', SYSDATE);


SELECT * FROM BOARD;

COMMIT; --SAVE 기능

--데이터 수정
UPDATE BOARD
SET writer='수정된철수'
WHERE bno = 2;

UPDATE BOARD
SET content='내요오옹'
WHERE bno = 2;

UPDATE BOARD
SET title = '수정된 제목이야'
    ,content = '수정수정수정'
    WHERE bno = 1;
    
--UPDATE절에서 WHERE가 생략되면 전체수정되므로 주의
UPDATE BOARD
SET CONTENT = '메롱';

--데이터 삭제
DELETE FROM BOARD
WHERE bno = 2;

ROLLBACK; --2번 글이 다시 살아남

COMMIT;

INSERT INTO BOARD
    (BNO, TITLE, CONTENT, WRITER,REG_DATE)
VALUES
    (4, '임시테스트', '메롱', '김테스트', SYSDATE);
    
SELECT * FROM BOARD;

-- 최종커밋 시점으로 이동
ROLLBACK;

--전체 데이터 삭제
--1. WHERE절을 생략한 DELETE절 (ROLLBACK 가능)
DELETE FROM BOARD;

SELECT * FROM BOARD;
ROLLBACK;

--2. TRUNCATE TABLE을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조는 삭제되지 않음)
TRUNCATE TABLE BOARD;

--3. DROP TABLE (ROLLBACK 불가능 / 테이블 구조도 삭제)
DROP TABLE BOARD;