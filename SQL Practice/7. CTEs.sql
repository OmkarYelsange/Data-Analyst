-- 🔴 LEVEL 6 — CTEs
-- Q42 Using a CTE, calculate total spending per customer and return customers whose spending is greater than ₹20,000.
WITH CustomerSpending AS (
	SELECT customer_id,
		SUM(order_amount) AS total_spent
	FROM orders 
    GROUP BY customer_id
)
SELECT customer_id,
	total_spent 
FROM CustomerSpending
WHERE total_spent > 20000;

-- Q43 Using a CTE, calculate total sales by category and return the top 3 categories.
WITH total_sales AS (
	SELECT category,
		SUM(price) AS total_amount
	FROM products 
    GROUP BY category
)
SELECT category,
	total_amount 
FROM total_sales
ORDER BY total_amount DESC 
LIMIT 3;

-- Q44 Using a CTE, find the customers who have placed at least two orders.
WITH CustomerAtLeast2Orders AS (
	SELECT customer_id,
		SUM(order_id) 
	FROM orders
    GROUP BY customer_id
)
SELECT * FROM CustomerAtLeast2Orders
WHERE COUNT(order_id) <= 2;

-- Q45 Using multiple CTEs, calculate:
-- customer_name
-- total_orders
-- total_spent
-- average_order_value

SELECT * FROM products;