-- 🟢 LEVEL 1 — Easy Foundation
-- Q1 Display all customers.
SELECT * FROM customers;

-- Q2 Display only: customer_id, customer_name, city, state
SELECT customer_id,customer_name,city,state FROM customers;

-- Q3 Find all customers who belong to Maharashtra (MH).
SELECT * FROM customers
WHERE state = "MH";

-- Q4 Find all products whose price is greater than ₹10,000.
SELECT * FROM products
WHERE price > 10000
ORDER BY price DESC;

-- Q5 Find all products belonging to the Electronics category.
SELECT * FROM products
WHERE category = "Electronics";

-- Q6 Find all products that are currently Active.
SELECT * FROM products
WHERE product_status = "Active";

-- Q7 Find all orders whose status is Delivered.
SELECT * FROM orders
WHERE order_status = "Delivered";

-- Q8 Find all orders placed during 2024.
SELECT * FROM orders
WHERE YEAR(order_date) = 2024;

-- Q9 Find the cheapest product.
SELECT * FROM products
ORDER BY price ASC
LIMIT 1;

-- Q10 Find the most expensive product. 
SELECT * FROM products
ORDER BY price DESC
LIMIT 1;