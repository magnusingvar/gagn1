SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    (TourneyDate) AS "Date", 
    (TourneyLocation) AS "Location"
FROM
    Tournaments
WHERE
    TourneyLocation IN
    ("Bolero Lanes","Red Rooster Lanes",
    "Thunderbird Lanes");

-- 2.
SELECT
    (BowlerFirstName || " " || BowlerLastName)
    AS "Name",
    BowlerCity AS "City",
    BowlerState AS "State",
    TeamID AS "Team"
FROM
    Bowlers
WHERE
    TeamID  LIKE "5" OR TeamID LIKE "6" OR 
    TeamID LIKE "7" OR TeamID LIKE "8";