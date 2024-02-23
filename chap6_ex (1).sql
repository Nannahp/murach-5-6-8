-- Chap 6
-- ex 1
-- SELECT DISTINCT vendor_id, SUM(invoice_total) FROM invoices

SELECT vendor_id, SUM(invoice_total) AS invoice_total_sum
FROM invoices
GROUP BY vendor_id;

-- ex 2
-- SELECT vendor_name from vendors and sum of payment totals from invoices 

SELECT v.vendor_name, SUM(i.payment_total)
FROM vendors v JOIN invoices i ON v.vendor_id = i.vendor_id
GROUP BY vendor_name 
ORDER BY SUM(i.payment_total) DESC;

-- ex 3
-- SELECT vendor_name from vendors, COUNT(DISTINCT vendor_id) from invoices from EACH vendor
-- SUM (invoice_total) from invoices GROUP BY vendor_id

SELECT v.vendor_name, COUNT(*) as invoice_count, SUM(i.invoice_total) as invoice_total_sum
FROM vendors v JOIN invoices i ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
ORDER BY invoice_count DESC;

-- ex 4
-- SELECT acc desc, count(items from invoice line items), sum(line items amount from invoiceline items)
-- from general ledger acc GROUP BY account desc WHERE count (blabal) > 1

SELECT gla.account_description, COUNT(*) as line_items_count, SUM(ili.line_item_amount) as line_items_sum
FROM general_ledger_accounts gla JOIN invoice_line_items ili ON gla.account_number = ili.account_number
GROUP BY account_description
HAVING line_items_count > 1
ORDER BY line_items_sum DESC;


-- ex 5
SELECT gla.account_description, COUNT(*) as line_items_count, SUM(ili.line_item_amount) as line_items_sum
FROM general_ledger_accounts gla
	JOIN invoice_line_items ili
		ON gla.account_number = ili.account_number
	JOIN invoices i
    ON ili.invoice_id = i.invoice_id
WHERE invoice_date BETWEEN '2014-04-01' AND '2014-06-30'
GROUP BY account_description
HAVING line_items_count > 1
ORDER BY line_items_sum DESC;


-- ex 6
-- SELECT acc number from invoice line items, sum(line items amount)
-- GROUP BY account_number WITH ROLLUP

SELECT account_number, SUM(line_item_amount)
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP;

-- ex 7
-- SELECT vendor name from vendors, count(DISTINCT general ledger acc) from gene led acc
-- WHERE count(owkhegrgorw) > 1

SELECT vendor_name, COUNT(DISTINCT ili.account_number) as number_of_accounts
FROM vendors v JOIN invoices i ON v.vendor_id = i.vendor_id
JOIN invoice_line_items ili ON i.invoice_id = ili.invoice_id
GROUP BY vendor_name
HAVING number_of_accounts > 1
ORDER BY vendor_name;

-- ex 8
-- SELECT terms_id, vednor_id, max(payment_date), SUM(invoice_total - total_payment - credit_total) as amount_due
-- FROM invoices
-- GROUP BY vednor_id WITH ROLLUP
-- ORDER BY vendor_id, terms_id

SELECT terms_id, vendor_id,  MAX(payment_date) AS last_payment_date, SUM(invoice_total - payment_total - credit_total) as amount_due
FROM invoices
GROUP BY terms_id, vendor_id WITH ROLLUP;

-- --------------------------------------------------------------------------- 
-- WHAT THE FUCK IS THIS?
-- KAN DU FORKLARE MÅSKE????? :/// hilsen Nanna og Emma <33

SELECT 
    IF (GROUPING(terms_id) = 1, 'Grand total', terms_id) AS terms_id,
    IF (GROUPING(vendor_id) = 1, 'Total for Terms' || terms_id, vendor_id) AS vendor_id,
    MAX(payment_date) AS last_payment_date,
    SUM(invoice_total - payment_total - credit_total) AS total_amount_due
FROM Invoices
GROUP BY terms_id, vendor_id with rollup;
-- --------------------------------------------------------------------------- 

-- ex 9

-- Der er ikke svar på ex 9 til 11, og ex8 var lige tilpas uforståelig til at vi stopper her






