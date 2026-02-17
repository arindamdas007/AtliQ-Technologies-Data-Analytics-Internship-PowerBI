CREATE DATABASE atliq_variance;
USE atliq_variance;
CREATE TABLE fact_orders (
    order_id INT,
    order_placement_date DATE,
    mmm_yy VARCHAR(10),
    customer_id INT,
    product_name VARCHAR(100),
    order_qty INT,
    delivery_qty INT
);
CREATE TABLE dim_customers (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE benchmarks (
    mmm_yy VARCHAR(10),
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    total_order_quantity INT,
    total_delivery_quantity INT
);
DROP TABLE IF EXISTS fact_orders;
CREATE TABLE fact_orders (
    order_id VARCHAR(20),
    order_placement_date DATE,
    mmm_yy VARCHAR(10),
    customer_id INT,
    product_name VARCHAR(100),
    order_qty INT,
    delivery_qty INT
);




