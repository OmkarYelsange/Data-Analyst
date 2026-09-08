-- 🟡 LEVEL 2 — Aggregation & GROUP BY
-- Q11 Find the total number of customers.
SELECT COUNT(*) FROM customers;

-- Q12 Find the number of customers in each state.
-- Expected concept:
-- GROUP BY
-- COUNT()
SELECT state,COUNT(*) AS No_of_Customers FROM customers
GROUP BY state;

-- Q13 Find the number of products in each category.
SELECT category,COUNT(*) AS No_of_Products FROM products
GROUP BY category;

-- Q14 Find the average product price for each category.
SELECT category,ROUND(AVG(price),2) AS Avg_Product_Price FROM products
GROUP BY category; 

-- Q15 Find the maximum product price in each category.
SELECT category,MAX(price) AS Max_Product_Price FROM products
GROUP BY category; 

-- Q16 Find the minimum product price in each category.
SELECT category,MIN(price) AS Min_Product_Price FROM products
GROUP BY category; 

-- Q17 Calculate the total order amount.
SELECT SUM(order_amount) FROM orders;

-- Q18 Calculate total order amount by order status.
SELECT order_status,SUM(order_amount) FROM orders
GROUP BY order_status;

-- Q19 Find the number of orders placed by each customer.
SELECT customer_id,COUNT(order_id) FROM orders
GROUP BY customer_id;

-- Q20 Find customers who have placed more than one order.
-- This is your first important:
-- GROUP BY + HAVING
SELECT customer_id,COUNT(order_id) FROM orders
GROUP BY customer_id
HAVING COUNT(order_id)>1;