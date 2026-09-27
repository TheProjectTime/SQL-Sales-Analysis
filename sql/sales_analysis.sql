
-- Check how many records you have --
SELECT COUNT(*) AS total_orders
FROM sales;

-- 1. Calculate Total Sales Revenue --
SELECT SUM(total_price) AS total_revenue
FROM sales;

-- 2. Calculate Average Order Value followed by 2 decimals --
SELECT 
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales;

-- 3. Find Top 10 Customers and how much each spent --
SELECT
    customer_name,
    SUM(total_price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
Limit 10;

-- 4. Find Sales by Category --
SELECT
    category,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- 5. Find Sales by Region --
SELECT
    region,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 6. Find Average Order Value by Category --
SELECT
    category,
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales
GROUP BY category
ORDER BY average_order_value DESC;

-- 7. Find Monthly Sales --
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 8. Find the Number of Orders made by Each Customer --
SELECT
    customer_name,
    COUNT(order_id) AS number_of_orders
FROM sales
GROUP BY customer_name
ORDER BY number_of_orders DESC;

-- 9. Find the Highest-Value Individual Order --
SELECT
    order_id,
    customer_name,
    total_price
FROM sales
ORDER BY total_price DESC
LIMIT 1;

-- 10. Find Products generating the Most Revenue --
SELECT
    product_name,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;