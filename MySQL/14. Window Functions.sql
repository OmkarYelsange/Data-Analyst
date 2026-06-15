# WINDOW FUNCTIONS
SELECT *
FROM employee_demographics;

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id
GROUP BY gender;


# WINDOW FUNCTION
SELECT ed.first_name, 
ed.last_name, 
gender, 
AVG(salary) OVER(PARTITION BY gender) AS avg_salary
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;
    
    
SELECT ed.employee_id, 
ed.first_name, 
ed.last_name, 
gender, 
salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY ed.employee_id) AS avg_salary
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;
    
    
SELECT ed.employee_id, 
ed.first_name, 
ed.last_name, 
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_no,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_no,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_no
FROM employee_demographics AS ed
JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;