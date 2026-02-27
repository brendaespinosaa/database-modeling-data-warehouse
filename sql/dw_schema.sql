CREATE DATABASE ecommerce_dw;
USE ecommerce_dw;

CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE dim_payment_method (
    payment_method_key INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(50)
);

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE fact_sales (
    sales_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_key INT,
    product_key INT,
    date_key INT,
    payment_method_key INT,
    quantity INT,
    total_amount DECIMAL(10,2)
);



*Created by Brenda Espinosa*
