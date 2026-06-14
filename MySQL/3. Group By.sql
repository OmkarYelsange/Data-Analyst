# GROUP BY
SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, AVG(AGE), MAX(AGE), MIN(AGE), COUNT(AGE)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation,salary 
FROM parks_and_recreation.employee_salary
GROUP BY occupation,salary;