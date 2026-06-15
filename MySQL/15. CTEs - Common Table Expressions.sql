# CTEs - COMMON TABLE EXPRESSIONS
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;


WITH CTE_Example AS 
(
SELECT gender, 
AVG(salary) AS avg_sal, 
MAX(salary) AS max_sal, 
MIN(salary) AS min_sal, 
COUNT(salary) AS count_sal
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) 
FROM CTE_Example;



WITH CTE_Example1 AS
(
SELECT employee_id, gender, birth_date 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary 
FROM employee_salary
WHERE salary > 50000
)
SELECT * 
FROM CTE_Example1 AS CTE1
JOIN CTE_Example2 AS CTE2
	ON CTE1.employee_id = CTE2.employee_id;
    
    
WITH CTE_Example (GENDER, AVG_SAL, MAX_SAL, MIN_SAL, COUNT_SAL) AS 
(
SELECT gender, 
AVG(salary) AS avg_sal, 
MAX(salary) AS max_sal, 
MIN(salary) AS min_sal, 
COUNT(salary) AS count_sal
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT * 
FROM CTE_Example;