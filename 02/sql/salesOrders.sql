SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT 
    ProductName AS "Product Name", (RetailPrice * 0.95) 
    AS "Sale"
FROM 
    Products;

-- 2. 
SELECT 
    CustomerID, OrderNumber, OrderDate
FROM 
    Orders
ORDER BY 
    CustomerID, OrderDate DESC;

-- 3.
SELECT 
    VendName AS "Vendor Name",
     VendStreetAddress AS "Vendor Adress"
FROM 
    Vendors
ORDER BY 
    VendName;