
/*Solution 1:
-SELECT statement  returns the same result set as the following SELECT
-uses a subquery in a WHERE clause that uses
the IN keyword
-----------------------*/
SELECT DISTINCT category_name FROM Categories WHERE category_id IN
(SELECT category_id FROM Products) ORDER BY category_name;

/*---------------------
Solution 2:
- SELECT statement that answers this question: Which products have a list
price that’s greater than the average list price for all products?
-returns the product_name and list_price columns for each product
-sort the result set by the list_price column in descending sequence
-----------------------*/
SELECT product_name, list_price FROM Categories WHERE list_price > AVG(list_price)
ORDER BY list_price DESC;

/*----------------------
Solution 3:
- SELECT statement that returns the category_name column from the
Categories table
- Return one row for each category that has never been assigned to any product in the
Products table using a subquery introduced with the NOT EXISTS
operator
------------------------*/
SELECT FROM c.category_name FROM Categories WHERE NOT EXISTS
(SELECT 1 FROM Products p where p.category_id = c.id);

/*----------------------
Solution 4:
-SELECT statement that returns three columns: email_address, order_id, and
the order total for each customer
-calculate the order total from the columns in the Order_Items table
------------------------*/
SELECT email_address, order_id, SUM(order) AS [Order Total] FROM Order_Items
GROUP BY email_address,order_id ;

SELECT TOP 1 email_address, [Order Total] FROM
(SELECT email_address, order_id, SUM(order) AS [Order Total] FROM Order_Items
GROUP BY email_address, order_id) x ORDER BY [Order Total] DESC;

/*----------------------
Solution 5:
- SELECT statement that returns the name and discount percent of each product that has a unique discount percent
- Sort the result set by the product_name column
------------------------*/
SELECT product_name, discount_percent FROM Products WHERE discount_percent IN
(SELECT discount_percent FROM Products GROUP BY discount_percent
HAVING COUNT(*) = 1) ORDER BY product_name;

/*-----------------------
Solution 6:
- correlated subquery to return one row per customer, representing the customer’s oldest order (the one with the earliest date)
- Each row should include these three columns: email_address, order_id, and order_date
- Sort the result set by the order_date and order_id columns 
-------------------------*/
SELECT email_address, order_id, order_date FROM Products a WHERE order_date=
(SELECT MIN (b.order_date) FROM Products b WHERE a.email_address=b.email_address);