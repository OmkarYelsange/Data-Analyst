# TEMPORARY TABLES

CREATE TEMPORARY TABLE temp_table 
( 
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT
);

INSERT INTO temp_table 
VALUES ( 'Ana','Doe',25);

SELECT * 
FROM temp_table;


CREATE TEMPORARY TABLE salary_over_50K
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50K;