SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT 
    TourneyLocation, TourneyDate
FROM 
    Tournaments
WHERE 
    TourneyDate LIKE "2013%"; -- filter/sia, stjórnar hvaða gögn birtast
-- LIKE segir að dálkurinn er sirka svona
-- % er wildcard

-- 2.
SELECT 
    (BowlerFirstName || " " || BowlerLastName) AS "Full Name",
    BowlerPhoneNumber AS "Phone"
FROM 
    Bowlers; -- || sameinar dálka, AS stendur fyrir ALIAS

-- 3.
SELECT 
    (BowlerFirstName || " " || BowlerLastName) AS "Full Name",
    TeamID AS "Team"
FROM 
    BOWLERS
ORDER BY 
    TeamID;