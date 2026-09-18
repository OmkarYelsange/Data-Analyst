-- 🔵 LEVEL 4 — CASE WHEN & Conditional Aggregation
USE practice_sql;
-- Q31 Classify products based on price:
-- price >= 50000     → Premium
-- price >= 10000     → Expensive
-- price >= 1000      → Medium
-- otherwise          → Budget
-- Use CASE.
SELECT product_name,
price,
CASE 
	WHEN price >= 50000 THEN 'Premium'
	WHEN price >= 10000 THEN 'Expensive'
	WHEN price >= 1000 THEN 'Medium'
	ELSE 'Budget'
END AS price_tier
FROM products;

-- Q32 Count orders by status in a single query.
-- Return:
-- delivered_orders
-- shipped_orders
-- pending_orders
-- cancelled_orders
-- returned_orders
-- Think:
-- SUM(CASE WHEN ...)

SELECT
	SUM(order_status = 'Delivered') AS delivered_orders,
	SUM(order_status = 'Shipped') AS delivered_orders,
	SUM(order_status = 'Pending') AS delivered_orders,
	SUM(order_status = 'Cancelled') AS delivered_orders,
	SUM(order_status = 'Returned') AS delivered_orders
FROM orders;

-- Q33 Calculate:
-- Total Orders
-- Delivered Orders
-- Cancelled Orders
-- Returned Orders
-- Pending Orders
-- in one query.
SELECT
	COUNT(order_status) AS total_orders,
    SUM(order_status = 'Delivered') AS delivered_orders,
	SUM(order_status = 'Shipped') AS delivered_orders,
	SUM(order_status = 'Pending') AS delivered_orders,
	SUM(order_status = 'Cancelled') AS delivered_orders,
	SUM(order_status = 'Returned') AS delivered_orders
FROM orders;

-- Q34 Calculate the percentage of orders that were delivered.
SELECT 
(SUM(order_status = 'Delivered')/COUNT(order_status) *100) AS '% of delivered_orders'
FROM orders;

-- Q35 Calculate total revenue from only delivered orders.
SELECT SUM(order_amount) FROM orders
WHERE order_status = 'Delivered';

-- Q36 For every customer, classify them:
-- total_spent >= 50000 → High Value
-- total_spent >= 20000 → Medium Value
-- otherwise            → Low Value
SELECT customer_id,
CASE 
	WHEN order_amount >= 50000 THEN 'High Value'
    WHEN order_amount >= 20000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_tier
FROM orders;
