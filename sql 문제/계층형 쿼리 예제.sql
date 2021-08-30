

-- #계층형 쿼리 추가 예제

SELECT
    employee_id,
    first_name,
    manager_id,
    LEVEL
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY first_name;