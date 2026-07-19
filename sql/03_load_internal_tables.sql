/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 03_load_internal_tables.sql

Purpose:
Load data from external tables into internal warehouse
tables using CTAS (CREATE TABLE AS SELECT).
===========================================================
*/

-----------------------------------------------------------
-- Customers table
-----------------------------------------------------------
CREATE TABLE customers
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
)
AS
SELECT *
FROM ext_customers;

-----------------------------------------------------------
-- Orders table
-----------------------------------------------------------
CREATE TABLE orders
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
)
AS
SELECT *
FROM ext_orders;

-----------------------------------------------------------
-- Order Items table
-----------------------------------------------------------
CREATE TABLE order_items
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
)
AS
SELECT *
FROM ext_order_items;

-----------------------------------------------------------
-- Payments table
-----------------------------------------------------------
CREATE TABLE payments
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
)
AS
SELECT *
FROM ext_payments;

-----------------------------------------------------------
-- Products table
-----------------------------------------------------------
CREATE TABLE products
WITH
(
    DISTRIBUTION = ROUND_ROBIN,
    HEAP
)
AS
SELECT *
FROM ext_products;

-----------------------------------------------------------
-- Verify internal table row counts
-----------------------------------------------------------

SELECT COUNT(*) AS Customers
FROM customers;

SELECT COUNT(*) AS Orders
FROM orders;

SELECT COUNT(*) AS OrderItems
FROM order_items;

SELECT COUNT(*) AS Payments
FROM payments;

SELECT COUNT(*) AS Products
FROM products;