-- chap 5

-- ex 1
-- 1. insert new term row to Terms table, only include id, description and dur days in terms column
-- 2. check result

USE ap;
INSERT INTO terms (terms_id, terms_description, terms_due_days)
VALUES (6, 'Net due 120 days', 120);

SELECT * FROM terms WHERE terms_id = 6;

-- ex 2 
-- update/modify  terms  row where id = 6, change/SET descriptioon and due days  -> 125

UPDATE terms
SET terms_description = 'Net due 125 days', terms_due_days = 125
WHERE terms_id = 6;

SELECT * FROM terms WHERE terms_id = 6;

-- ex 3
-- DELETE row where id = 6

DELETE FROM terms
WHERE terms_id = 6;
SELECT * from terms;

-- ex 4
-- INSERT  add row to Invoices without column list -> where you update all columns
INSERT INTO invoices
VALUES (default, 32, 'AX-014-027', '2018-08-01', 434.58, default, default, 2, '2018-08-31', default);

SELECT * FROM invoices WHERE terms_id = 2;

-- ex 5
-- INSERT multiple rows into invoice_line_items and invoice_id for each col should be the same as for
-- last created row

INSERT INTO invoice_line_items (invoice_id, invoice_sequence, account_number, line_item_amount, line_item_description)
VALUES (116, 1, 160, 180.23, 'Hard drive'), (116, 2, 527, 254.35, 'Exchange server update');

-- ex 6
-- UPDATE terms row where invoice_id = 116 FROM invoices
-- update credit total equals 10% of invoice_total
-- update payment_total equals invoice_total - credit_total

SELECT * from invoices WHERE invoice_id = 116;
UPDATE invoices
SET credit_total = invoice_total * 0.1, payment_total = invoice_total - credit_total
WHERE invoice_id = 116;

SELECT * from invoices WHERE invoice_id = 116;

-- ex 7
-- UPDATE default acc number FROM VENDORS WHERE id = 44
-- update vendors to set acc num to 403 where id = 44

UPDATE vendors
SET default_account_number = 403
WHERE vendor_id = 44;

-- ex 8
-- UPDATE invoices JOIN vendors ON invoices.vendor_id = vendors.vendor_id set terms id = 2 WHERE default_terms_id = 2

-- 2 ways to do it
-- with join
UPDATE invoices i
JOIN vendors v ON i.vendor_id = v.vendor_id
SET terms_id = 2
WHERE default_terms_id = 2;
-- with subquery
UPDATE invoices
SET terms_id = 2
WHERE vendor_id IN (
SELECT vendor_id FROM vendors WHERE default_terms_id = 2);

-- ex 9
-- DELETE FROM invoices where invoice_id = 116 
-- precede the delete with another delete 
-- DELETE from invoice_line_items where invoice_id = 116 

DELETE FROM invoice_line_items
WHERE invoice_id = 116;
DELETE FROM invoices
WHERE invoice_id = 116;
