SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    (Bowlers.BowlerFirstName || " " || Bowlers.BowlerLastName) AS "Bowlers",
    Teams.TeamName AS "Team"
FROM
    Bowlers INNER JOIN Teams
    ON Bowlers.TeamID = Teams.TeamID
ORDER BY 
    Teams.TeamName, Bowlers.BowlerFirstName;

-- 2.
SELECT
    Bowlers.BowlerFirstName || " " || BowlerLastName AS "Bowlers",
    Teams.TeamName AS "Team",
    Tournaments.TourneyLocation AS "Tournament Location",
    Bowler_Scores.RawScore    
FROM
    Bowlers INNER JOIN Bowler_Scores
    ON Bowlers.BowlerID = Bowler_Scores.BowlerID
    INNER JOIN Tourney_Matches
    ON Bowler_Scores.MatchID = Tourney_Matches.MatchID
    INNER JOIN Tournaments
    ON Tourney_Matches.TourneyID = Tournaments.TourneyID
    INNER JOIN Teams
    ON Bowlers.TeamID = Teams.TeamID;


-- 3.
SELECT
    (b1.BowlerFirstName || " " || b1.BowlerLastName) AS "Name",
    b2.BowlerZip AS "ZIP", b2.BowlerLastName,
    b1.BowlerZip AS "ZIP"
FROM
    Bowlers AS b1 INNER JOIN
    Bowlers AS b2
    ON b1.BowlerZip = b2.BowlerZip
    AND b1.BowlerID != b2.BowlerID;