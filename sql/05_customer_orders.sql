/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 05_customer_orders.sql

Purpose:
Join customer and order data to calculate the number of
orders and customers by Brazilian state.

This query supports the Power BI
"Customers by State" visualization.
===========================================================
*/

SELECT
    c.customer_state,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_state
ORDER BY
    total_customers DESC;