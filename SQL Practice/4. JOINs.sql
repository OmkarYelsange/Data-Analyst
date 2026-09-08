-- 🟠 LEVEL 3 — JOINs
-- Q21 Display:
-- order_id
-- customer_name
-- order_date
-- order_status
-- order_amount
-- using customers and orders.
SELECT o.order_id, 
c.customer_name, 
o.order_date, 
o.order_status, 
o.order_amount 
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Q22 Display:
-- order_id
-- customer_name
-- city
-- order_date
SELECT o.order_id, 
c.customer_name, 
c.city, 
o.order_date 
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Q23 Display:
-- order_id
-- product_name
-- quantity
-- unit_price
-- using orders, order_items, and products.
SELECT o.order_id, 
p.product_name, 
ot.quantity, 
ot.unit_price 
FROM products AS p
JOIN order_items AS ot
ON p.product_id = ot.product_id
JOIN orders AS o
ON ot.order_id = o.order_id
ORDER BY o.order_id ASC;

-- Q24 Display complete order information:
-- order_id - O
-- customer_name - C
-- product_name - P
-- category - P
-- quantity - OT
-- unit_price - OT
-- order_date - O
-- order_status - O
-- You need three/four-table joins.
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT c.customer_name, 
p.product_name, 
p.category, 
ot.quantity, 
ot.unit_price, 
o.order_date, 
o.order_status FROM orders AS o
JOIN order_items AS ot
ON o.order_id = ot.order_id
JOIN customers AS c
ON o.customer_id = c.customer_id
JOIN products AS p
ON ot.product_id = p.product_id;


-- Q25 Find the total amount spent by each customer.
-- Output:
-- customer_id
-- customer_name
-- total_spent
SELECT c.customer_id,
c.customer_name,
o.order_amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;

-- Q26 Find the total amount spent by each city.
SELECT c.city, 
SUM(o.order_amount) AS total_amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Q27 Find total sales by product category.
SELECT p.category,
o.order_status,
o.order_amount
FROM products AS p
JOIN orders AS o
ON p.


-- Q28 Find the number of orders for every customer, including customers who have placed zero orders.
-- This should make you think about:
-- LEFT JOIN

-- Q29 Find customers who have never placed an order.
-- This is a very common interview question.

-- Q30 Find products that have never been ordered.