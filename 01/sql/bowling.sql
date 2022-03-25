SELECT
    Name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT TeamName
FROM Teams 
ORDER BY TeamName;

-- 1.
SELECT *
FROM Bowler_Scores;

-- 3.
SELECT BowlerFirstName, BowlerLastName, BowlerAddress
FROM Bowlers
ORDER BY BowlerFirstName, BowlerAddress;