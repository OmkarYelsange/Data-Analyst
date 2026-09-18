-- 🟣 LEVEL 5 — Subqueries
-- Q37 Find products whose price is greater than the average product price.
SELECT * FROM products
WHERE price > ( SELECT AVG(price) FROM products );

-- Q38 Find customers whose total spending is greater than the average customer spending.
SELECT c.customer_id,
c.customer_name,
o.order_status,
o.order_amount 
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_status = "Delivered" 
AND o.order_amount > (SELECT AVG(order_amount) FROM orders);

-- Q39 Find the customer who placed the order with the highest order amount.
SELECT * FROM customers;
SELECT customer_id,MAX(order_amount) FROM orders
WHERE order_status = "Delivered"
GROUP BY customer_id;

-- Q40 Find the second-highest product price.
SELECT MAX(price) FROM products
WHERE price < ( SELECT MAX(price) FROM products );

-- Q41 Find products that have a price greater than the average price of their category.
-- This is significantly more interview-oriented.
SELECT * FROM products p
WHERE p.price > ( 
SELECT AVG(price) FROM products p2 
WHERE p2.category = p.category);
