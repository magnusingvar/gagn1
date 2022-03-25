SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';
-- 1.

SELECT 
    EngagementNumber, StartDate, EndDate
FROM 
    Engagements
ORDER BY 
    StartDate, EndDate;