SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT
    CustFirstName, CustLastName, CustCity
FROM 
    Customers
ORDER BY 
    CustCity;

-- 2. 
SELECT 
    EntStageName, EntWebPage
FROM 
    Entertainers
WHERE
    EntWebPage NOTNULL;

-- 3.
SELECT 
    (AgtFirstName || " " || AgtLastName) AS "Agents",
    date(DateHired, "+6 month") AS "6 month review", DateHired
FROM 
    Agents;