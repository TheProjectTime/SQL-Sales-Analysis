-- Create Database --
CREATE DATABASE sales_analysis;

-- Use Database --
USE sales_analysis;

-- Create table --
CREATE TABLE sales (
    order_id INT,
    customer_name VARCHAR(100),
    order_date DATE,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    region VARCHAR(50)
);

-- Get my csv data into MySQL --
-- Navigator → Tables → right-click sales → Table Data Import Wizard --

-- Show the structure of the created table --
DESCRIBE sales;

-- Check whether your data was imported --
SELECT * FROM sales;

-- Check how many records you have --
SELECT COUNT(*) AS total_orders
FROM sales;

-- Calculate total sales revenue --
SELECT SUM(total_price) AS total_revenue
FROM sales;

-- Calculate average order value followed by 2 decimals --
SELECT 
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales;

-- Find top 10 customers and how much each spent --
SELECT
    customer_name,
    SUM(total_price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
Limit 10;

-- Find the number of orders made by each customer --
SELECT
    customer_name,
    COUNT(order_id) AS number_of_orders
FROM sales
GROUP BY customer_name
ORDER BY number_of_orders DESC;

-- Find sales by category --
SELECT
    category,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- Find average order value by category --
SELECT
    category,
    ROUND(AVG(total_price), 2) AS average_order_value
FROM sales
GROUP BY category
ORDER BY average_order_value DESC;

-- Find sales by region --
SELECT
    region,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Find monthly sales analysis --
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Find the highest-value individual order --
SELECT
    order_id,
    customer_name,
    total_price
FROM sales
ORDER BY total_price DESC
LIMIT 1;

-- Find products generating the most revenue --
SELECT
    product_name,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;