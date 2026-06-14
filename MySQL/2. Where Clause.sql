# WHERE CLAUSE
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != 'FEMALE';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';

# LOGICAL OPERATORS - AND, OR, NOT
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'MALE';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'TOM' AND age = 36) OR age > 50;


# LIKE STATEMENT
# %
# _

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A%';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%E%';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A__';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A___';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'A___%';