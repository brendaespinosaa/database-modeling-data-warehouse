USE ecommerce_dw;

-- Revenue per month
SELECT
    dd.year,
    dd.month,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
GROUP BY dd.year, dd.month
ORDER BY dd.year, dd.month;

-- Top products by revenue
SELECT
    dp.product_name,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_product dp ON fs.product_key = dp.product_key
GROUP BY dp.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Revenue by payment method
SELECT
    dpm.payment_method,
    SUM(fs.total_amount) AS total_revenue
FROM fact_sales fs
JOIN dim_payment_method dpm
    ON fs.payment_method_key = dpm.payment_method_key
GROUP BY dpm.payment_method;

-- Average ticket
SELECT
    ROUND(AVG(total_amount), 2) AS average_ticket
FROM fact_sales;
