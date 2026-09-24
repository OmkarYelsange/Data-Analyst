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
WITH CustomerOrderCounts AS (
	SELECT customer_id,
		COUNT(order_id) AS order_count
	FROM orders
    GROUP BY customer_id
)
SELECT customer_id,order_count FROM CustomerOrderCounts
WHERE order_count >= 2;

-- Q45 Using multiple CTEs, calculate:
-- customer_name
-- total_orders
-- total_spent
-- average_order_value
WITH OrderMetrics AS (
	SELECT customer_id,
		COUNT(order_id) AS total_orders,
		SUM(order_amount) AS total_spent,
		AVG(order_amount) AS avg_order_value
    FROM orders
    GROUP BY customer_id    
),
CustomerDetails AS (
	SELECT customer_id,
		customer_name
	FROM customers
)
SELECT cd.customer_id,
	cd.customer_name,
    om.total_orders,
    om.total_spent,
    om.avg_order_value
FROM CustomerDetails AS cd
JOIN OrderMetrics AS om
ON cd.customer_id = om.customer_id;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

