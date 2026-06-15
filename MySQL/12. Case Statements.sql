# CASE STATEMENTS
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


SELECT first_name,
last_name,
age,
CASE 
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 30 AND 60 THEN 'Intermediate'
	WHEN age >= 60 THEN 'Old'
END AS age_category
FROM employee_demographics;


# PAY INCREASE AND BONUS QUESTION
# CONDITIONS 
# 1. SALARY < 50000 THEN 5% 
# 2. SALARY > 50000 THEN 7% 
# 3. DEPT - FINANCE THEN 10% 

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT salary, 
occupation,
CASE 
	WHEN salary <= 50000 THEN salary + (5/100 * salary)
    WHEN salary > 50000 THEN salary + (7/100 * salary)
    WHEN dept_id = 6 THEN salary + (10/100 * salary)
END AS Bonus
FROM employee_salary


