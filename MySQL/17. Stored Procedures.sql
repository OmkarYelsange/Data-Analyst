# STORED PROCEDURES

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries1()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000;
    SELECT * 
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries1()


DELIMITER $$
CREATE PROCEDURE large_salaries2(p_employee_id INT)
BEGIN
	SELECT first_name, last_name, salary 
	FROM employee_salary
	WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL large_salaries2(10)