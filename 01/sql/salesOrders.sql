SELECT
    Name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT *
FROM Employees;

-- 2. 
SELECT VendCity, VendStreetAddress ,VendName
FROM Vendors
ORDER BY VendCity;