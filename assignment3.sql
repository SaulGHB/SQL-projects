------------------
Problem 1
* returns all columns from the Vendors table
* inner-joins all columns from the Invoices table.
--------------------
SELECT *
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID;
--------------------

Problem 2
* returns these four columns
* Use these aliases for the tables
* Returns one row for each invoice with a non-zero balance
* return 11 rows
* Order in ascending 
---------------------
SELECT VendorName, InvoiceNumber, InvoiceDate,
InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName; 
----------------------

Problem 3
* returns these three columns
* returns one row for each vendor
* sorts the result set by account_description and then by vendor_name
-----------------------
SELECT VendorName, DefaultAccountNo, AccountDescription
FROM Vendors JOIN GLAccounts
ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
ORDER BY AccountDescription, VendorName;
-----------------------

Problem 4
* SELECT statement that returns these five columns:vendor name invoice date - invoice number li_sequence Ii amount
* returns one row for each vendor whose contact has the same last name as another vendor's contact
------------------------
SELECT VendorName AS Vendor, InvoiceDate AS Date,
InvoiceNumber AS Number, InvoiceSequence AS [#],
InvoiceLineItemAmount AS LineItem
FROM Vendors AS v JOIN Invoices AS i
ON v.VendorID = i.VendorID
JOIN InvoiceLineItems AS li
ON i.InvoiceID = li.InvoiceID
ORDER BY Vendor, Date, Number, [#];
------------------------

Problem 5
* SELECT statement that returns three columns: vendor id vendor name contact_name
* returns one row for each vendor whose contact has the same last name as another vendor's contact
------------------------
SELECT DISTINCT v1.VendorID, v1.VendorName,
v1.VendorContactFName + ' ' + v1.VendorContactLName AS Name
FROM Vendors AS v1 JOIN Vendors AS v2
ON (v1.VendorID <> v2.VendorID) AND
(v1.VendorContactLName = v2.VendorContactLName)
ORDER BY Name; 
------------------------

Problem 6

* SELECT statement that returns these three columns: account number - account_ description invoice id
* Return one row for each account number that has never been used
------------------------
SELECT account_number
        , account_description
        , invoice_id
FROM General_Ledger INNER
        LEFT OUTER JOIN Invoice_Lineitems 
    ON 
    General_Ledger.account_number = Invoice_Lineitems.account_number
    WHERE
       invoice_id IS NULL
    ORDER BY 
      account_number
-------------------------

Problem 7

* uses UNION operator to generate a result set consisting of two columns from the Vendors table: vendor_name and vendor_state
* If the vendor is in California, the vendor_state value should be ''CA''; otherwise, the vendor_state value should be ''Outside CA."
* sort the final result set by vendor name. 
---------------------------
SELECT VendorName, VendorState
FROM Vendors
WHERE VendorState = 'CA'
UNION
SELECT VendorName, 'Outside CA'
FROM Vendors
WHERE VendorState <> 'CA'
ORDER BY VendorName;