# LIMIT CLAUSE
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_demographics
LIMIT 3;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY AGE DESC
LIMIT 3;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY AGE DESC
LIMIT 3,3;