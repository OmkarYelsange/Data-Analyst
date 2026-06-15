# STRING FUNCTIONS
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT ('SKY');
SELECT LENGTH('SKY');

SELECT first_name, 
LENGTH(first_name) 
FROM employee_demographics
ORDER BY 2;

SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name, 
last_name, 
UPPER(first_name), 
LOWER(last_name)
FROM employee_demographics;

# TRIM
SELECT TRIM('          sky           ');
SELECT LTRIM('          sky           ');
SELECT RTRIM('          sky           ');


# 
SELECT first_name, 
LEFT(first_name,4),
RIGHT(first_name,4)
FROM employee_demographics;


# SUBSTRING
SELECT first_name, 
SUBSTRING(first_name,2,5),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;


# REPLACE
SELECT first_name, REPLACE(first_name,'e','x') 
FROM employee_demographics;

# LOCATE
SELECT first_name,
LOCATE('e',first_name)
FROM employee_demographics;

# CONCAT
SELECT first_name,
last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;