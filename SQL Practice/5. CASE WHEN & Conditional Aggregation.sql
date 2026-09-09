-- 🔵 LEVEL 4 — CASE WHEN & Conditional Aggregation
-- Q31 Classify products based on price:
-- price >= 50000     → Premium
-- price >= 10000     → Expensive
-- price >= 1000      → Medium
-- otherwise          → Budget
-- Use CASE.

-- Q32 Count orders by status in a single query.
-- Return:
-- delivered_orders
-- shipped_orders
-- pending_orders
-- cancelled_orders
-- returned_orders
-- Think:
-- SUM(CASE WHEN ...)

-- Q33 Calculate:
-- Total Orders
-- Delivered Orders
-- Cancelled Orders
-- Returned Orders
-- Pending Orders
-- in one query.

-- Q34 Calculate the percentage of orders that were delivered.

-- Q35 Calculate total revenue from only delivered orders.

-- Q36 For every customer, classify them:
-- total_spent >= 50000 → High Value
-- total_spent >= 20000 → Medium Value
-- otherwise            → Low Value