SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT
    ord.OrderNumber AS "#Order",
    cust.CustomerID AS "Customer ID",
    (cust.CustFirstName || " " || cust.CustLastName) AS "Customer Name",
    ord.OrderDate AS "Order Date"
FROM
    Customers AS cust INNER JOIN Orders AS ord
    ON cust.CustomerID = ord.CustomerID
ORDER BY 
    ord.OrderDate;

-- 2.
SELECT
    ord.OrderNumber AS "#Order",
    cust.CustomerID AS "Customer ID",
    (cust.CustFirstName || " " || cust.CustLastName) AS "Customer Name",
    emp.EmployeeID AS "Employee ID",
    (emp.EmpFirstName || " " || emp.EmpLastName) AS "Employee Name"
FROM
    Orders AS ord INNER JOIN Employees AS emp 
    ON ord.EmployeeID = emp.EmployeeID
    INNER JOIN Customers AS cust
    ON ord.CustomerID = cust.CustomerID; 

-- 3. 
SELECT 
    prod.ProductName, ord.OrderNumber,
    (ord_d.QuantityOrdered * ord_d.QuotedPrice) AS "Price for all",
    ord_d.QuantityOrdered AS "How many ordered"
FROM
    Order_Details as ord_d INNER JOIN Products AS prod
    ON ord_d.ProductNumber = prod.ProductNumber
    INNER JOIN Orders AS ord
    ON ord.OrderNumber = ord_d.OrderNumber;
ORDER BY
    ord.OrderNumber;

-- 4. 
SELECT
    vend.VendorID, vend.VendName AS "Vendor Name",
    prod.ProductName AS "Product Name",
    prod.RetailPrice
FROM
    Vendors AS vend INNER JOIN Product_Vendors AS prodvend
    ON vend.VendorID = prodvend.VendorID
    INNER JOIN Products AS prod
WHERE 
    prod.RetailPrice <= 100
ORDER BY
    prod.RetailPrice;

-- 5.
SELECT
    cust.CustomerID AS "Cust ID", 
    emp.EmployeeID AS "Emp ID", 
    cust.CustLastName AS "Cust Last Name",
    emp.EmpLastName AS "Emp Last Name",
    cust.CustFirstName AS "Cust First Name",
    emp.EmpFirstName AS "Emp First Name"
FROM
    Customers AS cust INNER JOIN Employees AS emp
WHERE 
    cust.CustLastName LIKE emp.EmpLastName;

-- 6. 
SELECT
    cust.CustCity AS "Cust City",
    emp.EmpCity AS "Emp City",
    (cust.CustFirstName || " " || cust.CustLastName) AS "Cust Name",
    (emp.EmpFirstName || " " || emp.EmpLastName) AS "Emp Name"
FROM
    Customers AS cust INNER JOIN Employees AS emp
WHERE 
    cust.CustCity LIKE emp.EmpCity;