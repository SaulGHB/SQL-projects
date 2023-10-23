/*-----------------------
Problem 2:
-SELECT statement that returns one row for each category that has products
with The category_name column from the Categories table, The count of the products in the Products table, The list price of the most expensive product in the Products table
-sorts the result set so the category with the most products appears first
--------------------------*/
SELECT vendor_name, SUM(payment_total) AS payment_total_sum
FROM vendors v JOIN invoices i
  ON v.vendor_id = i.vendor_id
GROUP BY vendor_name
ORDER BY payment_total_sum DESC

/*-------------------------
Problem 4
-SELECT statement that returns one row for each customer that has orders
with The email_address column from the Customers table, A count of the number of orders, The total amount for each order
---------------------------*/
SELECT account_description, COUNT(*) AS line_item_count,
       SUM(line_item_amount) AS line_item_amount_sum
FROM general_ledger_accounts gl 
  JOIN invoice_line_items li
    ON gl.account_number = li.account_number
GROUP BY account_description
HAVING line_item_count > 1
ORDER BY line_item_amount_sum DESC

/*---------------------------
Problem 6
-SELECT statement that answers What is the total amount ordered for each product?
-returns the product_name column from the Products table and the total amount for each product in the Order_Items table
-----------------------------*/
SELECT account_number, SUM(line_item_amount) AS line_item_sum
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP

/*---------------------------
Problem 8
-SELECT statement that answers What is the total quantity purchased for each product within each category?
-returns the category_name column from the category table, the product_name column from the products table,the total quantity purchased for each product with orders in the Order_Items
table
------------------------------*/
SELECT
if(Grouping(c.category_name)= 1, 'Grand Total', c.category_name) as category_name,
if(Grouping(p.product_name)= 1, 'Subtotal', p.product_name) as product_name,
sum((o.item_price- o.discount_amount) * o.quantity)
as Total_Spend
from products p, order_items o, categories c
Where o.product_id = p.product_id and c.category_id = p.category_id
group by category_name, product_name WITH ROLLUP;

/*-----------------------------
Problem 10
-modifies the solution to exercise 9 so the column that contains the total amount for each order contains a cumulative total by item amount
-adds another column to the SELECT statement that uses an aggregate windowfunction to get the average item amount for each order
-modifies the SELECT statement so it uses a named window for the two aggregate functions
--------------------------------*/
SELECT vendor_id, invoice_total - payment_total - credit_total AS balance_due,
	   SUM(invoice_total - payment_total - credit_total) OVER() AS total_due,
       SUM(invoice_total - payment_total - credit_total) OVER vendor_window AS vendor_due,
       ROUND(AVG(invoice_total - payment_total - credit_total) OVER vendor_window, 2) AS vendor_avg
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0
WINDOW vendor_window AS (PARTITION BY vendor_id ORDER BY invoice_total - payment_total - credit_total)
