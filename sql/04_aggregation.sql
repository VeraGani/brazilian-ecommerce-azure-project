/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 04_aggregation.sql

Purpose:
Calculate total revenue by product category.
This query supports the Power BI "Revenue by Product
Category" visualization.
===========================================================
*/

SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_category_name
ORDER BY
    total_revenue DESC;