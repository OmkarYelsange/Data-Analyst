# ALIASING
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT gender, AVG(AGE) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT gender, AVG(AGE) avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40;