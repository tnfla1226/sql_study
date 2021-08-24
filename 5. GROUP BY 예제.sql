

-- #GROUP BY, HAVING
-- 1. ���� �Լ�
SELECT
    COUNT(emp_no) AS "�� ��� ��"
    , MAX(birth_de) AS "���� � ���"
    , MIN(birth_de) AS "���� ���� ���� ���" 
FROM tb_emp;

SELECT
    COUNT(*)
    ,COUNT(direct_manager_emp_no)
FROM tb_emp;


--2. GROUP BY : ���̺� ������ �׷�ȭ�� ��
-- ex) �μ����� ���� ������ �������, ���� ���̸��� ����� �������, �μ��� ���� ���� �˰� ����
SELECT emp_nm, birth_de, dept_cd
FROM tb_emp
ORDER BY dept_cd ASC; -- ���� : ASC-������(�⺻��) // DESC(������)

SELECT
    dept_cd
    , COUNT(*) AS "�μ��� ���� ��"
    , MAX(birth_de) AS "�μ� ����"
    , MIN(birth_de) AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;

-- HAVING�� : �׷�ȭ�� ������� ������ �ɾ� �� ���� ����
SELECT
    dept_cd
    , COUNT(*) AS "�μ��� ���� ��"
    , MAX(birth_de) AS "�μ� ����"
    , MIN(birth_de) AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) >= 2
ORDER BY dept_cd
;

-- ������� �޿��� ���� ���� ���� �׼�, ���� ���� ���� �׼�, ��� �׼� ��ȸ
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de; --emp_no�� ������ �� ���� ���鳢���� pay_de�� ������

SELECT
    emp_no
    , MAX(pay_amt) AS "�ְ� ���ɾ�"
    , MIN(pay_amt) AS "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999.99') AS "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no;

-- 2019�� 1�Ⱓ ��� �޿��� 450���� �̻��� ����� ��ȸ�ϰ� ����
-- �׷�ȭ �� ������ WHERE, �� ������ HAVING
SELECT
    emp_no
    , MAX(pay_amt) AS "�ְ� ���ɾ�"
    , MIN(pay_amt) AS "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999.99') AS "��� ���ɾ�"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no;

-- 2019�� 1�Ⱓ ����� ������ �߰� ��ȸ
SELECT
    emp_no
    , MAX(pay_amt) AS "�ְ� ���ɾ�"
    , MIN(pay_amt) AS "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999.99') AS "��� ���ɾ�"
    , TO_CHAR(ROUND(SUM(pay_amt)), 'L999,999.99') AS "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no;

-- ���� ORDER BY
-- ASC : ������(�⺻��) // DESC : ������
-- �׻� SELECT���� �� �������ٿ� ��ġ
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm;

-- 2��° �� ��������
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no DESC;

SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY 2 DESC, 1 DESC;

SELECT 
    emp_no AS eno
    , emp_nm AS enm
    , addr
FROM tb_emp
ORDER BY eno DESC;

SELECT
 emp_nm, COUNT(emp_no) AS cnt
FROM tb_emp;

