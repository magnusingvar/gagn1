SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    Match_Games.MatchID
FROM Match_Games LEFT OUTER JOIN
(SELECT
    Tourney_Matches.MatchID
FROM
    Tourney_Matches INNER JOIN 
    Bowler_Scores ON 
    Bowler_Scores.MatchID = Tourney_Matches.MatchID
WHERE
    Tourney_Matches.MatchID = NULL) AS "data"
ON Match_Games.MatchID = data.MatchID
WHERE data.MatchID IS NULL;


-- 2. 
SELECT DISTINCT
    Match_Games.MatchID AS "Match ID",
    Match_Games.GameNumber AS "Game Number",
    Teams.TeamName AS "Team Name",
    Match_Games.WinningTeamID AS "Winning Team",
    Tournaments.TourneyLocation AS "Location"
FROM 
    Match_Games INNER JOIN Teams
    LEFT OUTER JOIN Tournaments