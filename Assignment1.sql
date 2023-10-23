/---------------------
Problem 1
* selects product_code product_name and list price_price discount_price from products
* ordered by a decreasing list price
---------------------/

SELECT product_code, product_name, list_price, discount_percent FROM products
ORDER BY list_price desc

/---------------------
Problem 2
* concants first name, a space, and last name from customers table to provie full name derived attribute
---------------------/

SELECT concat(first_name, " ", last_name) as full_name from customers 

---------------------
Problem 3
returns product_name, product_name, list_price, list_price, date_added, date_added
returns rows with a list price between 500&2000
sorts by most recent date to oldest date
---------------------

SELECT product_name, product_name, list_price, list_price, date_added, date_added FROM products 
WHERE list_price > 500 and list_price <2000
ORDER BY date_added desc

---------------------
Problem 4
returns two derived columns discount_amount and discount_price that are rounded to the 2nd decimal place 
limit to the first 5 rows 
other columns are asked for: product_name, list price, discount_percent
----------------------

SELECT product_name, list_price, discount_percent, ROUND (list_price *(discount_percent *(1/100))), 2) AS discount_amount, ROUND (list_price * (1-discount_price * (1/100))), 2) AS discount_price
ORDER BY discount_price desc
LIMIT 5

-----------------------
Problem 5
returns item_id, item_price, discount_amount, quantity, and derived columns price_total, discount_total, and item_total
only selects rows where item_total is above 500
order rows in descending item_total order
-----------------------

SELECT item_id, item_price, discount_amount, quantity, (item_price * quantity) AS price_total, (discount_amount*quantity) AS discount_total, (item_price-discount_amount*quantity) AS item_total FROM order_items 
WHERE (item_price-discount_amount*quantity) > 500
ORDER BY (item_price-discount_amount*quantity) desc

------------------------
Problem 6
returns order_id, order_date, ship_date from the Orders table
Return only the rows where the ship_date column contains a null value.
-------------------------

SELECT order_id, order_date, ship_date FROM orders
WHERE ship_date IS NULL

------------------------
Problem 7
Writes a SELECT statement without a FROM clause that uses the NOW function to
create a row with today_unformatted, today_formatted
------------------------

SELECT NOW() AS 'today_unformatted',

DATE_FORMAT(NOW(), '%d-%b-%Y') AS 'today_formatted'

--------------------------
Problem 8
Write a SELECT statement without a FROM clause that creates a row with price, tax_rate, tax_amount, total 
calculates the fourth column, by adding the expressions used for the first and third
columns
--------------------------
SELECT
    100 AS price,
    0.07 AS tax_rate,
    100 * 0.07 AS tax_amount,
    100 + 0.07 * 100 AS total
---------------------------







