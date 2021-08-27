-- OUTER JOIN ����
SELECT * FROM job_history ORDER BY employee_id;

-- ��� ����� ������ ��ȸ�Ұǵ� Ȥ�� �������� �̷��� ������ �Բ� ��ȸ�ϰ� �ʹ�

SELECT
    E.employee_id, E.first_name, E.hire_date, E.job_id AS "current job"
    , J.start_date, J.end_date, J.job_id AS "last_job"
FROM employees E 
LEFT JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id;



-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.

SELECT A.employee_id, A.first_name, B.first_name AS "manager_name"
FROM employees A
LEFT OUTER JOIN employees B
ON A.manager_id = B.employee_id
WHERE A.employee_id = 103;


-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����

SELECT E.first_name, D.department_name, L.street_address || ',' || L.city || ',' || L.state_province AS address
FROM employees E 
LEFT OUTER JOIN departments D
ON E.employee_id = D.department_id
LEFT OUTER JOIN locations L
ON D.location_id = L.location_id;

-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT E.first_name, D.department_name, L.street_address || ', ' || L.city || ', ' || L.state_province AS address
FROM employees E 
LEFT OUTER JOIN departments D
ON E.department_id = D.department_id
LEFT OUTER JOIN locations L
ON D.location_id = L.location_id
WHERE E.employee_id = 103;

-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT 
    E.first_name, D.department_name, D.location_id
    , L.street_address || ', ' || L.city || ', ' || L.state_province AS address
FROM employees E 
LEFT JOIN departments D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON D.location_id = L.location_id
WHERE D.department_name LIKE 'IT%';

-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.

SELECT J.job_id, J.job_title
    , H.start_date, H.end_date, H.job_id, H.employee_id
    , E.first_name, E.department_id
    , D.department_name
FROM jobs J
LEFT JOIN job_history H
ON J.job_id = H.job_id
LEFT JOIN employees E 
ON H.employee_id = E.employee_id
LEFT JOIN departments D
ON E.department_id = D.department_id;




