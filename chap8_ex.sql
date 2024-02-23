-- CHAP 8
-- ex 1
-- SELECT FORMAT(invoice_total, 1), CONVERT(invoice_total, INTEGER), CAST(invoice_total AS INTEGER)
-- FROM invoices

SELECT FORMAT(invoice_total, 1), CONVERT(invoice_total, SIGNED), CAST(invoice_total AS SIGNED)
FROM invoices;

-- ex 2 
-- SELECT invoice_date, CAST(invoice_date AS DATETIME), CAST(invoice_date AS %YYYY%MM)
-- FROm invoices

SELECT invoice_date, CAST(invoice_date AS DATETIME), CAST(invoice_date AS CHAR(7))
FROM invoices;