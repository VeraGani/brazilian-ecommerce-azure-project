/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 06_pivot_sales.sql

Purpose:
Use a PIVOT operation to summarize payment values by
payment method.

This query demonstrates how rows can be transformed into
columns for reporting and analysis.
===========================================================
*/

SELECT
    credit_card,
    boleto,
    voucher,
    debit_card,
    not_defined
FROM
(
    SELECT
        payment_type,
        payment_value
    FROM payments
) AS payment_data
PIVOT
(
    SUM(payment_value)
    FOR payment_type IN
    (
        credit_card,
        boleto,
        voucher,
        debit_card,
        not_defined
    )
) AS payment_pivot;