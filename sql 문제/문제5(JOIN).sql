-- # 실습 문제
-- 1. employees, departments테이블을 INNER JOIN해서
--    first_name, department_id, department_name을 조회하세요.
SELECT COUNT(*) FROM employees;
SELECT employee_id, department_id FROM employees;

SELECT E.first_name, E.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id;

SELECT E.first_name, E.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id;

SELECT E.first_name, department_id, D.department_name
FROM employees E
JOIN departments D
USING (department_id);

-- 2. employees, departments테이블을 NATURAL JOIN해서
--    first_name, department_id, department_name을 조회하세요.

SELECT E.first_name, department_id, D.department_name
FROM employees E 
NATURAL JOIN departments D;

SELECT E.first_name, department_id, D.department_name
FROM employees E 
JOIN departments D 
USING(department_id, manager_id);

SELECT E.first_name, E.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
    AND E.manager_id = D.manager_id;

-- 3. employees, departments테이블을 JOIN ON을 사용해서
--    first_name, department_id, department_name을 조회하세요.

SELECT E.first_name, E.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id;

