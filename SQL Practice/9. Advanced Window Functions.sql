-- 🔥 LEVEL 8 — Advanced Window Functions
-- Q51 For every customer, number their orders chronologically.
-- Output:
-- customer_id
-- order_id
-- order_date
-- order_number

-- Example:
-- Customer 5 | Order 10 | 2024-05-18 | 1
-- Customer 5 | Order 25 | 2025-01-07 | 2

-- Q52 Find each customer's first order.
-- Use:
-- ROW_NUMBER()
-- or another appropriate window technique.

-- Q53 Find each customer's latest order.

-- Q54 For each customer, show:
-- current_order_date
-- previous_order_date
-- Use:
-- LAG()

-- Q55 Calculate the number of days between a customer's current order and previous order.
-- This tests:
-- LAG()
-- DATE functions

-- Q56 For every order, calculate the cumulative revenue over time.
-- Expected concept:
-- SUM(order_amount) OVER (
--     ORDER BY order_date
-- )

-- Q57 Calculate cumulative revenue for each customer.

-- Q58 Calculate the average order amount for each customer using a window function.
-- Do not use GROUP BY.

-- Q59 For every order, display:
-- order_id
-- customer_id
-- order_amount
-- customer_total_spending
-- Use:
-- SUM() OVER(PARTITION BY ...)

-- Q60 Find the top 3 customers by total spending using a window function.