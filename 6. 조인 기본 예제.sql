

-- ���� ����
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp;

SELECT
    dept_cd, dept_nm
FROM tb_dept;

SELECT
    E.emp_no
    , E.emp_nm
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd;


-- �ڰ��� ���� ���̺�
SELECT * FROM tb_certi;

-- ����� ����� �ڰ��� ���� ���̺�
SELECT * FROM tb_emp_certi;

SELECT
    E.emp_no, E.emp_nm,
    EC.certi_cd, EC.acqu_de
FROM tb_emp E, tb_emp_certi EC
WHERE E.emp_no = EC.emp_no;

SELECT
    c.certi_cd, c.certi_nm, c.issue_insti_nm
    , ec.acqu_de, ec.emp_no
FROM tb_certi C, tb_emp_certi EC
WHERE C.certi_cd = EC.certi_cd;

-- 3�� ���̺� ����
SELECT
    A.emp_no, A.emp_nm, B.certi_cd,
    B.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
    AND B.certi_cd = C.certi_cd;
    
    
SELECT
    A.emp_no, A.emp_nm, B.certi_cd,
    B.certi_nm, C.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.emp_nm like '��%'
    AND C.acqu_de BETWEEN '20190101' AND '20191231'
ORDER BY C.acqu_de;


-- �Խñ� ���̺�
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
-- ��� ���̺�
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);
COMMIT;

SELECT * FROM TEST_A;
SELECT * FROM TEST_B;

SELECT
    A.id, A.content, B.b_id, B.reply 
FROM TEST_A A, TEST_B B
WHERE A.id = B.a_id;


-- #INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%����%'
ORDER BY E.emp_nm;

SELECT
    *
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%����%'
ORDER BY E.emp_nm;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ������տ��� �ѹ��� ǥ��˴ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm  -- �����ϴ� �÷��� ���̺�� �Ⱦ�
FROM tb_emp E NATURAL JOIN tb_dept D;

SELECT
    *
FROM tb_emp E NATURAL JOIN tb_dept D; -- ���� �÷��� �Ǿտ� �ѹ��� ǥ���


-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������
--    �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D USING(dept_cd);


-- # JOIN ON��
-- 1. ���� ���� ������(ON��)�� �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.

SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd;
    
SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no =  B.emp_no
JOIN tb_certi C
ON B.certi_cd = C.certi_cd
JOIN tb_dept D
ON  A.dept_cd = D.dept_cd;


SELECT
    E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE addr LIKE '%����%'
ORDER BY E.emp_no;

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];
