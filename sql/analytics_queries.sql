USE ecommerce_dw;

-- =====================================================
-- ANALYTICAL QUERIES
-- Data Warehouse (Star Schema)
-- These queries are used to analyze sales performance,
-- revenue trends, and customer behavior.
-- =====================================================


-- -----------------------------------------------------
-- 1. Revenue per Month
-- Business Question:
-- How does revenue evolve over time on a monthly basis?
-- -----------------------------------------------------
SELECT
    dd.year,
    dd.month,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_date dd 
    ON fs.date_key = dd.date_key
GROUP BY dd.year, dd.month
ORDER BY dd.year, dd.month;


-- -----------------------------------------------------
-- 2. Top Products by Revenue
-- Business Question:
-- Which products generate the highest revenue?
-- -----------------------------------------------------
SELECT
    dp.product_name,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_product dp 
    ON fs.product_key = dp.product_key
GROUP BY dp.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- -----------------------------------------------------
-- 3. Revenue by Payment Method
-- Business Question:
-- Which payment methods are most used in terms of revenue?
-- -----------------------------------------------------
SELECT
    dpm.payment_method,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_payment_method dpm
    ON fs.payment_method_key = dpm.payment_method_key
GROUP BY dpm.payment_method;


-- -----------------------------------------------------
-- 4. Average Ticket Value
-- Business Question:
-- What is the average value per sale?
-- -----------------------------------------------------
SELECT
    ROUND(AVG(total_amount), 2) AS average_ticket
FROM fact_sales;


*Created by Brenda Espinosa*
