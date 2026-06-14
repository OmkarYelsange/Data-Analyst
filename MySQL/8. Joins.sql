# JOINS
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;


# INNER JOIN
SELECT ed.employee_id, age, occupation, salary
FROM employee_demographics AS ed
INNER JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;


# OUTER JOIN - LEFT JOIN
SELECT *
FROM employee_demographics AS ed
LEFT JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;


# OUTER JOIN - RIGHT JOIN
SELECT *
FROM employee_demographics AS ed
RIGHT JOIN employee_salary AS es
	ON ed.employee_id = es.employee_id;


# SELF JOIN
SELECT *
FROM employee_salary AS es1
JOIN employee_salary AS es2	
	ON es1.employee_id = es2.employee_id;

SELECT *
FROM employee_salary AS es1
JOIN employee_salary AS es2	
	ON es1.employee_id + 1 = es2.employee_id;
    
    
