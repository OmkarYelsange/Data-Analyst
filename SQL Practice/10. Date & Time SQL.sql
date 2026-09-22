-- ⚫ LEVEL 9 — Date & Time SQL
-- These are particularly useful in Data Engineering interviews.

-- Q61 Find the number of orders placed in each year.
SELECT YEAR(order_date),COUNT(*) FROM orders
GROUP BY YEAR(order_date);

-- Q62 Find the number of orders placed in each month.
SELECT MONTHNAME(order_date),COUNT(*) FROM orders
GROUP BY MONTHNAME(order_date);

-- Q63 Calculate monthly revenue.
-- Output:
-- year
-- month
-- revenue
SELECT YEAR(order_date),MONTHNAME(order_date),SUM(order_amount) FROM orders
WHERE order_status = "Delivered"
GROUP BY YEAR(order_date),MONTHNAME(order_date);

-- Q64 Find the month with the highest revenue.
SELECT YEAR(order_date),MONTH(order_date),SUM(order_amount) FROM orders
WHERE order_status = "Delivered"
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY SUM(order_amount) DESC
LIMIT 1;

-- Q65 Find customers who signed up in 2024.
SELECT * FROM customers
WHERE YEAR(signup_date) = 2024
ORDER BY signup_date ASC;

-- Q66 Find orders placed on weekends.
SELECT * FROM orders
WHERE DAYNAME(order_date) = "Saturday" OR "Sunday";

-- Q67 Find the number of days between customer signup and their first order.
SELECT DATEDIFF(o.order_date,c.signup_date) FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_date > c.signup_date;

-- Q68 Find customers whose first order happened within 30 days of signup.

-- Q69 Find customers who placed an order in 2024 but did not place any order in 2025.

-- Q70 Find customers who placed orders in both 2024 and 2025.