SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    VendName AS "Vendor Name", Vendcity AS "Vendor City"
FROM
    Vendors
WHERE
    VendCity IN 
    ("Ballard","Bellevue","Redmond");
    --Vendcity = "Ballard" OR
    --Vendcity = "Bellevue" OR
    --Vendcity = "Redmond";

-- 2.
SELECT
   ProductName AS "Name", RetailPrice AS "Price"
FROM
    Products
WHERE
    RetailPrice >= 125
ORDER BY
    ProductName;