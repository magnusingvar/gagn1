SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT
    (StfFirstName || " " || StfLastname) AS "Name", Salary
FROM
    Staff
ORDER BY
    Salary DESC;

-- 2. 
SELECT
    (StfFirstName || " " || StfLastname) AS "Name", 
    StfPhoneNumber AS "Phone Number"
FROM 
    Staff;

-- 3. 
SELECT
    (StudFirstName || " " || StudLastName) AS "Name",
    StudCity
FROM
    Students
ORDER BY
    StudCity;