-- 🧠 LEVEL 10 — Real Data Engineering Problems

-- These are closer to the kind of problems I'd use to distinguish someone who knows SQL syntax from someone who can actually solve data problems.

-- Q71 — Duplicate Detection
-- Assume customers can contain duplicate emails.
-- Write a query to identify duplicate emails.

-- Q72 — Deduplication
-- Using:
-- ROW_NUMBER()
-- identify which customer record should be retained for each email.

-- Q73 — Latest Record
-- Suppose a customer can have multiple records.
-- Find the latest customer record based on signup_date.

-- Q74 — Missing Data
-- Find customers who have no corresponding order.

-- Q75 — Orphan Records
-- Find order items whose order_id does not exist in orders.

-- Q76 — Data Quality
-- Find orders where:
-- order_amount <= 0
-- or
-- order_status IS NULL
-- or
-- customer_id IS NULL

-- Q77 — Revenue Validation
-- Calculate revenue from order_items:
-- quantity * unit_price
-- Then compare it with orders.order_amount.
-- Find orders where the calculated amount differs from order_amount.
-- This is a very realistic Data Engineering data-quality problem.

-- Q78 — Category Ranking
-- Find the top 3 products by revenue within each category.
-- You will need something like:
-- GROUP BY
-- +
-- CTE
-- +
-- WINDOW FUNCTION

-- Q79 — Customer Ranking
-- Rank customers by their total spending.
-- Output:
-- customer_id
-- customer_name
-- total_spent
-- rank

-- Q80 — Top Customer Per City
-- Find the highest-spending customer in every city.
-- This is another classic interview problem.