# HAVING CLAUSE
# Having Clause is used after Group By Clause Only
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
HAVING AVG(salary) > 60000;


SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%MANAGER%'
GROUP BY occupation
HAVING AVG(salary) > 60000;