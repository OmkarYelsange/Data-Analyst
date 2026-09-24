-- 🚨 LEVEL 7 — WINDOW FUNCTIONS
-- This section is very important for Data Engineering interviews.
-- You should be comfortable with:
-- ROW_NUMBER()
-- RANK()
-- DENSE_RANK()
-- LAG()
-- LEAD()
-- SUM() OVER()
-- AVG() OVER()
-- COUNT() OVER()
-- PARTITION BY
-- ORDER BY

-- Q46 Rank all products based on price from highest to lowest.
-- Use:
-- RANK()
SELECT *, 
	RANK() OVER (ORDER BY price DESC) AS price_rank
FROM products;

-- Q47 Rank products within each category based on price.
-- Expected concept: 
-- PARTITION BY category
SELECT *, 
	RANK() OVER (PARTITION BY category
    ORDER BY price DESC ) AS price_rank
FROM products;

-- Q48 Find the highest-priced product in every category using a window function.
WITH RankedProducts AS (
    SELECT 
        category,
        product_id,
        product_name,
        price,
        DENSE_RANK() OVER (
            PARTITION BY category 
            ORDER BY price DESC
        ) AS price_rank
    FROM products
)
SELECT 
	product_id,
    product_name,
    category,
    price
FROM RankedProducts
WHERE price_rank = 1;

-- Q49 Find the second-highest-priced product in every category.
-- This is an excellent interview question.


-- Q50 Assign a sequential row number to every order based on order_date.
-- Use:
-- ROW_NUMBER()
