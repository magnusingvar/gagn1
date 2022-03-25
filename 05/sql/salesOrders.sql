SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT DISTINCT
    (Customers.CustFirstName || " " || Customers.CustLastName) AS "Customer Name"
FROM
    Customers INNER JOIN Orders
    LEFT OUTER JOIN Products
    ON Orders.CustomerID = Customers.CustomerID
WHERE 
    Products.ProductName LIKE "%helmet%";

-- 2.
SELECT DISTINCT
    (cust.CustFirstName || " " || cust.CustLastName) AS "Customer Name"
FROM
    Customers cust INNER JOIN Employees emp
    LEFT OUTER JOIN Employees
    ON cust.CustZipCode != emp.EmpZipCode;

-- 3. 
SELECT DISTINCT
    Products.ProductNumber AS "Product Number",
    Orders.OrderNumber AS "Order Number",
    Products.ProductName AS "Product Name",
    Orders.OrderDate AS "Order Date"
FROM 
    Products LEFT OUTER JOIN Orders;