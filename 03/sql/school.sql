SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    (StfFirstName || " " || StfLastname) AS "Name",
    StfStreetAddress AS "Adress"
FROM
    Staff
WHERE
    StfStreetAddress LIKE "%Box%"
ORDER BY
    StfFirstName;