/*Problem 1
- adds category_name: Brass row to the Categories table
- Codes the INSERT statement so MySQL automatically generates the category_id
column
--------------------*/
CREATE TABLE Category(category_id int IDENTITY(1,1) PRIMARY KEY,category_name varchar(255) NOT NULL);

INSERT INTO Category(category_name) VALUES(Brass);

/*---------------------
Problem 2
- modifies the row you just added to the Categories table
- changes the product_name column to “Woodwinds”, and 
- it should use the category_id column to identify the row
------------------------*/
UPDATE Product SET product_name ="WoodWinds" WHERE category_id=1;

/*-------------------------
Problem 3
- deletes the row you added to the Categories table in exercise 1
- uses the category_id column to identify the row
---------------------------*/
DELETE FROM Category WHERE Category_id=1;

/*------------------------- 
Problem 4
- INSERT statement that adds this row to the Products table
---------------------------*/
INSERT INTO Product (category_id, product_code,product_name, description, list_price, discount_percent, date_added) VALUES(4,"dgx_640","Yamaha DGX 640 88-key digital piano","long description to come",799.99,0,GETDATE());

/*-------------------------
Problem 5
- UPDATE statement that modifies the product you added in exercise 4
- changes the discount_percent column from 0% to 35%
----------------------------*/
UPDATE Product SET discount_percent ="35" WHERE product_name="Yamaha DGX 640 88-key digital piano";

/*--------------------------
Problem 6
- deletes the row that you added to the Categories table in exercise 1
- produce an error since the category has related rows in the Products table
- precede the DELETE statement with another DELETE statement that deletes all products in this category
-----------------------------*/
DELETE FROM Product WHERE Category_id=1;

DELETE FROM Category WHERE Category_id=1;

/*---------------------------
Problem 7
- adds email_address: rick@raven.com password: (empty string) first_name: Rick last_name: Raven to the Customers table
-----------------------------*/
USE ColumnList

INSERT INTO customer (email_address, password, first_name, last_name)

VALUES ('rick@raven.com','','Rick','Raven');

/*---------------------------
Problem 8
- modifies the Customers table
- Change the password column to “secret” for the customer with an email address of rick@raven.com.
------------------------------*/
UPDATE Customers

SET password='secret'

WHERE email_address='rick@raven.com';

/*-----------------------------
Problem 9
- modifies the Customers table
- Changes the password column to “reset” for every customer in the table
- add a LIMIT clause to update the first 100 rows of the table
--------------------------------*/
UPDATE customers SET password='reset';

/* -----------------------------
Problem 10
- restores the data that’s in the database
--------------------------------*/
USE MyGuitarShop;
GO IF DB_ID('MyGuitarShop') IS NOT NULL
DROP DATABASE MyGuitarShop;
GO
CREATE DATABASE MyGuitarShop;
GO
USE MyGuitarShop;
GO
-- create the tables for the database
CREATE TABLE Categories (
CategorylD INT PRIMARY KEY IDENTITY,
CategoryName VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE Customers(EmailAddress VARCHAR(20),
Password VARCHAR(20) NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20));
CREATE TABLE PRODUCT(ProductName VARCHAR(10),
ProductlD INT,
ProductDescription VARCHAR(201,
ListPrice INT, DiscountPercent REAL,
DateAdded VARCHAR);



