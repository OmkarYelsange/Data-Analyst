DROP SCHEMA IF EXISTS PRACTICE_SQL;
CREATE SCHEMA PRACTICE_SQL;
USE PRACTICE_SQL;

-- Customer's Table
DROP TABLE IF EXISTS customers; 
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

-- Products Table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    product_status VARCHAR(20)
);

-- Order's Table 
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    order_amount DECIMAL(10,2),
    
    FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
);

-- Order Items Table
DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
	order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    
    FOREIGN KEY (order_id)
		REFERENCES orders(order_id),
        
	FOREIGN KEY (product_id)
		REFERENCES products(product_id)
);


-- Values of Customers
INSERT INTO customers
(customer_id, customer_name, email, city, state, signup_date)
VALUES
(1,'Customer_01','cust01@example.com','Pune','MH','2023-01-15'),
(2,'Customer_02','cust02@example.com','Mumbai','MH','2023-02-10'),
(3,'Customer_03','cust03@example.com','Bengaluru','KA','2023-03-05'),
(4,'Customer_04','cust04@example.com','Hyderabad','TS','2023-04-20'),
(5,'Customer_05','cust05@example.com','Delhi','DL','2023-05-12'),
(6,'Customer_06','cust06@example.com','Chennai','TN','2023-06-18'),
(7,'Customer_07','cust07@example.com','Nashik','MH','2023-07-22'),
(8,'Customer_08','cust08@example.com','Nagpur','MH','2023-08-14'),
(9,'Customer_09','cust09@example.com','Ahmedabad','GJ','2023-09-09'),
(10,'Customer_10','cust10@example.com','Jaipur','RJ','2023-10-11'),
(11,'Customer_11','cust11@example.com','Pune','MH','2023-11-03'),
(12,'Customer_12','cust12@example.com','Mumbai','MH','2023-12-17'),
(13,'Customer_13','cust13@example.com','Bengaluru','KA','2024-01-08'),
(14,'Customer_14','cust14@example.com','Hyderabad','TS','2024-02-14'),
(15,'Customer_15','cust15@example.com','Delhi','DL','2024-03-19'),
(16,'Customer_16','cust16@example.com','Chennai','TN','2024-04-21'),
(17,'Customer_17','cust17@example.com','Nashik','MH','2024-05-13'),
(18,'Customer_18','cust18@example.com','Nagpur','MH','2024-06-25'),
(19,'Customer_19','cust19@example.com','Ahmedabad','GJ','2024-07-07'),
(20,'Customer_20','cust20@example.com','Jaipur','RJ','2024-08-16'),
(21,'Customer_21','cust21@example.com','Pune','MH','2024-09-10'),
(22,'Customer_22','cust22@example.com','Mumbai','MH','2024-10-05'),
(23,'Customer_23','cust23@example.com','Bengaluru','KA','2024-11-12'),
(24,'Customer_24','cust24@example.com','Hyderabad','TS','2024-12-03'),
(25,'Customer_25','cust25@example.com','Delhi','DL','2025-01-18'),
(26,'Customer_26','cust26@example.com','Chennai','TN','2025-02-07'),
(27,'Customer_27','cust27@example.com','Nashik','MH','2025-03-11'),
(28,'Customer_28','cust28@example.com','Nagpur','MH','2025-04-16'),
(29,'Customer_29','cust29@example.com','Ahmedabad','GJ','2025-05-21'),
(30,'Customer_30','cust30@example.com','Jaipur','RJ','2025-06-09'),
(31,'Customer_31','cust31@example.com','Pune','MH','2025-07-14'),
(32,'Customer_32','cust32@example.com','Mumbai','MH','2025-08-19'),
(33,'Customer_33','cust33@example.com','Bengaluru','KA','2025-09-23'),
(34,'Customer_34','cust34@example.com','Hyderabad','TS','2025-10-08'),
(35,'Customer_35','cust35@example.com','Delhi','DL','2025-11-17'),
(36,'Customer_36','cust36@example.com','Chennai','TN','2025-12-01'),
(37,'Customer_37','cust37@example.com','Nashik','MH','2026-01-12'),
(38,'Customer_38','cust38@example.com','Nagpur','MH','2026-02-18'),
(39,'Customer_39','cust39@example.com','Ahmedabad','GJ','2026-03-07'),
(40,'Customer_40','cust40@example.com','Jaipur','RJ','2026-04-13'),
(41,'Customer_41','cust41@example.com','Pune','MH','2026-05-20'),
(42,'Customer_42','cust42@example.com','Mumbai','MH','2026-06-04'),
(43,'Customer_43','cust43@example.com','Bengaluru','KA','2026-06-18'),
(44,'Customer_44','cust44@example.com','Hyderabad','TS','2026-07-02'),
(45,'Customer_45','cust45@example.com','Delhi','DL','2026-07-15'),
(46,'Customer_46','cust46@example.com','Chennai','TN','2026-07-29'),
(47,'Customer_47','cust47@example.com','Nashik','MH','2026-08-05'),
(48,'Customer_48','cust48@example.com','Nagpur','MH','2026-08-12'),
(49,'Customer_49','cust49@example.com','Pune','MH','2026-08-20'),
(50,'Customer_50','cust50@example.com','Mumbai','MH','2026-08-28');


-- Values of Products
INSERT INTO products
(product_id, product_name, category, price, product_status)
VALUES
(1,'Laptop Pro 14','Electronics',85000,'Active'),
(2,'Laptop Air 13','Electronics',72000,'Active'),
(3,'Wireless Mouse','Electronics',1200,'Active'),
(4,'Mechanical Keyboard','Electronics',4500,'Active'),
(5,'USB-C Hub','Electronics',2500,'Active'),
(6,'27 Inch Monitor','Electronics',22000,'Active'),
(7,'Bluetooth Speaker','Electronics',3500,'Active'),
(8,'Noise Cancelling Headphones','Electronics',12000,'Active'),
(9,'Smart Watch','Electronics',9000,'Active'),
(10,'Power Bank','Electronics',1800,'Active'),
(11,'Office Chair','Furniture',15000,'Active'),
(12,'Study Table','Furniture',8500,'Active'),
(13,'Bookshelf','Furniture',7000,'Active'),
(14,'Dining Chair','Furniture',4500,'Active'),
(15,'Sofa Set','Furniture',35000,'Active'),
(16,'Bed Frame','Furniture',28000,'Active'),
(17,'Coffee Table','Furniture',6500,'Active'),
(18,'Office Desk','Furniture',12000,'Active'),
(19,'Wardrobe','Furniture',24000,'Active'),
(20,'TV Stand','Furniture',9000,'Discontinued'),
(21,'Rice 5kg','Grocery',450,'Active'),
(22,'Wheat Flour 5kg','Grocery',300,'Active'),
(23,'Cooking Oil 1L','Grocery',160,'Active'),
(24,'Sugar 5kg','Grocery',280,'Active'),
(25,'Tea 1kg','Grocery',520,'Active'),
(26,'Coffee 500g','Grocery',450,'Active'),
(27,'Breakfast Cereal','Grocery',350,'Active'),
(28,'Dry Fruits 500g','Grocery',650,'Active'),
(29,'Organic Honey','Grocery',550,'Active'),
(30,'Green Tea','Grocery',300,'Discontinued'),
(31,'Mens T-Shirt','Clothing',799,'Active'),
(32,'Mens Jeans','Clothing',1999,'Active'),
(33,'Womens T-Shirt','Clothing',899,'Active'),
(34,'Womens Jeans','Clothing',2199,'Active'),
(35,'Jacket','Clothing',2999,'Active'),
(36,'Formal Shirt','Clothing',1499,'Active'),
(37,'Sports Shoes','Clothing',3499,'Active'),
(38,'Running Shoes','Clothing',3999,'Active'),
(39,'Hoodie','Clothing',1899,'Active'),
(40,'Saree','Clothing',2499,'Active'),
(41,'SQL Fundamentals','Books',699,'Active'),
(42,'Advanced SQL','Books',899,'Active'),
(43,'Data Engineering Guide','Books',1099,'Active'),
(44,'Python Programming','Books',799,'Active'),
(45,'Spark Handbook','Books',1299,'Active'),
(46,'Databricks Guide','Books',1499,'Active'),
(47,'Cloud Computing','Books',999,'Active'),
(48,'AWS Fundamentals','Books',1199,'Active'),
(49,'Data Structures','Books',749,'Active'),
(50,'Machine Learning Basics','Books',1299,'Discontinued');


-- Values of Orders
INSERT INTO orders
(order_id, customer_id, order_date, order_status, order_amount)
VALUES
(1,1,'2024-01-05','Delivered',4500),
(2,2,'2024-01-18','Delivered',12500),
(3,3,'2024-02-03','Shipped',72000),
(4,4,'2024-02-19','Delivered',3500),
(5,5,'2024-03-11','Cancelled',8500),
(6,6,'2024-03-25','Delivered',22000),
(7,7,'2024-04-08','Delivered',1999),
(8,8,'2024-04-21','Returned',12000),
(9,9,'2024-05-04','Delivered',450),
(10,10,'2024-05-18','Pending',2999),
(11,11,'2024-06-02','Delivered',15000),
(12,12,'2024-06-17','Delivered',899),
(13,13,'2024-07-01','Shipped',9000),
(14,14,'2024-07-15','Delivered',6500),
(15,15,'2024-08-03','Delivered',35000),
(16,16,'2024-08-20','Cancelled',28000),
(17,17,'2024-09-05','Delivered',450),
(18,18,'2024-09-22','Delivered',1499),
(19,19,'2024-10-06','Returned',3999),
(20,20,'2024-10-25','Delivered',1099),
(21,21,'2024-11-04','Delivered',85000),
(22,22,'2024-11-19','Shipped',12000),
(23,23,'2024-12-02','Delivered',1999),
(24,24,'2024-12-18','Pending',699),
(25,25,'2025-01-07','Delivered',2499),
(26,26,'2025-01-23','Delivered',3499),
(27,27,'2025-02-09','Cancelled',4500),
(28,28,'2025-02-25','Delivered',22000),
(29,29,'2025-03-12','Delivered',899),
(30,30,'2025-03-28','Shipped',72000),
(31,31,'2025-04-14','Delivered',650),
(32,32,'2025-04-30','Delivered',2999),
(33,33,'2025-05-16','Returned',1499),
(34,34,'2025-06-01','Delivered',1299),
(35,35,'2025-06-17','Delivered',15000),
(36,36,'2025-07-03','Pending',8500),
(37,37,'2025-07-19','Delivered',550),
(38,38,'2025-08-04','Delivered',3999),
(39,39,'2025-08-21','Shipped',1099),
(40,40,'2025-09-05','Delivered',24000),
(41,41,'2025-09-22','Delivered',1200),
(42,42,'2025-10-08','Cancelled',4500),
(43,43,'2025-10-24','Delivered',1299),
(44,44,'2025-11-09','Delivered',35000),
(45,45,'2025-11-25','Returned',799),
(46,46,'2025-12-10','Delivered',22000),
(47,47,'2025-12-27','Shipped',699),
(48,48,'2026-01-13','Delivered',1199),
(49,49,'2026-02-01','Delivered',85000),
(50,50,'2026-02-18','Pending',1899);


-- Values of Order Items
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1,1,4,1,4500),
(2,2,11,1,12500),
(3,3,2,1,72000),
(4,4,7,1,3500),
(5,5,12,1,8500),
(6,6,6,1,22000),
(7,7,32,1,1999),
(8,8,8,1,12000),
(9,9,21,1,450),
(10,10,35,1,2999),
(11,11,11,1,15000),
(12,12,33,1,899),
(13,13,9,1,9000),
(14,14,17,1,6500),
(15,15,15,1,35000),
(16,16,16,1,28000),
(17,17,21,1,450),
(18,18,36,1,1499),
(19,19,38,1,3999),
(20,20,43,1,1099),
(21,21,1,1,85000),
(22,22,18,1,12000),
(23,23,32,1,1999),
(24,24,41,1,699),
(25,25,40,1,2499),
(26,26,37,1,3499),
(27,27,14,1,4500),
(28,28,6,1,22000),
(29,29,33,1,899),
(30,30,2,1,72000),
(31,31,28,1,650),
(32,32,35,1,2999),
(33,33,36,1,1499),
(34,34,45,1,1299),
(35,35,11,1,15000),
(36,36,12,1,8500),
(37,37,29,1,550),
(38,38,38,1,3999),
(39,39,43,1,1099),
(40,40,19,1,24000),
(41,41,3,1,1200),
(42,42,4,1,4500),
(43,43,45,1,1299),
(44,44,15,1,35000),
(45,45,31,1,799),
(46,46,6,1,22000),
(47,47,41,1,699),
(48,48,48,1,1199),
(49,49,1,1,85000),
(50,50,39,1,1899);


-- Data Validation
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;