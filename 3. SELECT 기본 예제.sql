-- SELECT 기본
SELECT 
    certi_cd, certi_nm
FROM TB_CERTI;

SELECT 
    certi_nm
FROM TB_CERTI;

SELECT 
    *
FROM TB_CERTI;

-- DISTINCT : 중복값 제외
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM TB_CERTI;


-- 열 별칭 지정 (ALIAS)
SELECT 
    certi_cd AS "자격증코드"
    , certi_nm AS "자격증이름"
    , issue_insti_nm "발행기관명"
FROM tb_certi;


-- 결합연산자( || )를 사용한 컬럼데이터 결합
SELECT 
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM tb_certi;

-- 더미 테이블 (dual) : 단순 연산결과를 조회하고 싶을 때

SELECT 
    (3 + 7) * 5 / 10 AS "연산결과"
FROM dual;

-- WHERE 조건절 : 조회 결과 행을 제한하는 조건절
SELECT 
    emp_NO, emp_nm, addr
FROM tb_emp
WHERE sex_cd = 2;

--PK로 조건을 제한하면 무조건 단일행이 조회됩니다.
SELECT
    emp_NO, emp_nm, tel_no
FROM tB_emp
WHERE emp_no = 1000000005;

-- 비교 연산자 (=, <>, <, <=, >, >=)
-- SQL 비교 연산자 (BETWEEN, IN, LIKE)

SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >= '19900101' AND birth_de <= '19991231';

-- BETWEEN 연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231';

-- IN 연산자
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004' OR dept_cd = '100006';

SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006');

SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006');


-- LIKE 연산자
-- 와일드카드 매핑 - % : 1글자 이상 포함, _ : 딱 1글자 포함
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '이%';

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '%심';

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '이_';

SELECT
    emp_nm, addr, tel_no
FROM tb_emp
WHERE addr = '%수원%';



-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서, 
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회

SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '김%' 
    AND birth_de BETWEEN '19900101'AND '19991231' 
    AND dept_cd IN('100003', '100004', '100006');
    

-- WHERE 조건절 : 조회 결과 행을 제한하는 조건절
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL; -- null은 is로만 비교

SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL;

-- 부정 비교연산자
SELECT
    emp_no, emp_nm, sex_cd, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '이%'
    AND sex_cd <> 1;

