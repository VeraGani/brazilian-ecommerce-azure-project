/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 02_create_external_tables.sql

Purpose:
Create external tables that reference the CSV files
stored in Azure Data Lake Storage Gen2.
===========================================================
*/

-----------------------------------------------------------
-- Customers table
-----------------------------------------------------------
CREATE EXTERNAL TABLE ext_customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
)
WITH (
    LOCATION = 'olist_customers_dataset.csv',
    DATA_SOURCE = olist_data_source,
    FILE_FORMAT = csv_file_format
);

-----------------------------------------------------------
-- Orders table
-----------------------------------------------------------
CREATE EXTERNAL TABLE ext_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME2,
    order_approved_at DATETIME2,
    order_delivered_carrier_date DATETIME2,
    order_delivered_customer_date DATETIME2,
    order_estimated_delivery_date DATETIME2
)
WITH (
    LOCATION = 'olist_orders_dataset.csv',
    DATA_SOURCE = olist_data_source,
    FILE_FORMAT = csv_file_format
);

-----------------------------------------------------------
-- Order Items table
-----------------------------------------------------------
CREATE EXTERNAL TABLE ext_order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME2,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
)
WITH (
    LOCATION = 'olist_order_items_dataset.csv',
    DATA_SOURCE = olist_data_source,
    FILE_FORMAT = csv_file_format
);

-----------------------------------------------------------
-- Payments table
-----------------------------------------------------------
CREATE EXTERNAL TABLE ext_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
)
WITH (
    LOCATION = 'olist_order_payments_dataset.csv',
    DATA_SOURCE = olist_data_source,
    FILE_FORMAT = csv_file_format
);

-----------------------------------------------------------
-- Products table
-----------------------------------------------------------
CREATE EXTERNAL TABLE ext_products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght FLOAT,
    product_description_lenght FLOAT,
    product_photos_qty FLOAT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
)
WITH (
    LOCATION = 'olist_products_dataset.csv',
    DATA_SOURCE = olist_data_source,
    FILE_FORMAT = csv_file_format
);

-----------------------------------------------------------
-- Verify that the external tables can be read
-----------------------------------------------------------

SELECT COUNT(*) AS Customers
FROM ext_customers;

SELECT COUNT(*) AS Orders
FROM ext_orders;

SELECT COUNT(*) AS OrderItems
FROM ext_order_items;

SELECT COUNT(*) AS Payments
FROM ext_payments;

SELECT COUNT(*) AS Products
FROM ext_products;