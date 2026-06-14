# JOINING MULTIPLE TABLES TOGETHER 
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM parks_departments;


SELECT *
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id
INNER JOIN parks_departments AS pd
	ON es.dept_id = pd.department_id;
    
