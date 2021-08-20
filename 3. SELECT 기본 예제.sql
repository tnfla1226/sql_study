-- SELECT �⺻
SELECT 
    certi_cd, certi_nm
FROM TB_CERTI;

SELECT 
    certi_nm
FROM TB_CERTI;

SELECT 
    *
FROM TB_CERTI;

-- DISTINCT : �ߺ��� ����
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM TB_CERTI;


-- �� ��Ī ���� (ALIAS)
SELECT 
    certi_cd AS "�ڰ����ڵ�"
    , certi_nm AS "�ڰ����̸�"
    , issue_insti_nm "��������"
FROM tb_certi;


-- ���տ�����( || )�� ����� �÷������� ����
SELECT 
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;

-- ���� ���̺� (dual) : �ܼ� �������� ��ȸ�ϰ� ���� ��

SELECT 
    (3 + 7) * 5 / 10 AS "������"
FROM dual;

-- WHERE ������ : ��ȸ ��� ���� �����ϴ� ������
SELECT 
    emp_NO, emp_nm, addr
FROM tb_emp
WHERE sex_cd = 2;

--PK�� ������ �����ϸ� ������ �������� ��ȸ�˴ϴ�.
SELECT
    emp_NO, emp_nm, tel_no
FROM tB_emp
WHERE emp_no = 1000000005;

-- �� ������ (=, <>, <, <=, >, >=)
-- SQL �� ������ (BETWEEN, IN, LIKE)

SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >= '19900101' AND birth_de <= '19991231';

-- BETWEEN ������
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231';

-- IN ������
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


-- LIKE ������
-- ���ϵ�ī�� ���� - % : 1���� �̻� ����, _ : �� 1���� ����
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��%';

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '%��';

SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '��_';

SELECT
    emp_nm, addr, tel_no
FROM tb_emp
WHERE addr = '%����%';



-- ������ �达�̸鼭, �μ��� 100003, 100004, 100006�� �߿� �ϳ��̸鼭, 
-- 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ

SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '��%' 
    AND birth_de BETWEEN '19900101'AND '19991231' 
    AND dept_cd IN('100003', '100004', '100006');
    

-- WHERE ������ : ��ȸ ��� ���� �����ϴ� ������
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL; -- null�� is�θ� ��

SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL;

-- ���� �񱳿�����
SELECT
    emp_no, emp_nm, sex_cd, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND sex_cd <> 1;
    

--AND�� OR�� �켱����
-- AND�� OR���� �켱������ ���Ƽ� ��ȣ�� ������ �׳� ������� ����� �� ����
SELECT
    emp_no, emp_nm, addr, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN('100004', '100006')
    AND (addr LIKE '%����%' OR addr LIKE '%����%');
    
SELECT
    emp_no, emp_nm, addr, dept_cd
FROM tb_emp
WHERE emp_nm LIKE '��%'
    AND dept_cd IN('100004', '100006')
    AND NOT(addr LIKE '%����%' OR addr LIKE '%����%');
