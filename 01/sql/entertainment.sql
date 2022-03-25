SELECT
    Name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT AgtFirstName, AgtLastName, AgtPhoneNumber
FROM Agents
ORDER BY AgtLastName, AgtFirstName;

-- 2.
SELECT *
FROM Engagements;

-- 3.
SELECT EngagementNumber, StartDate
FROM Engagements
ORDER BY StartDate DESC, EngagementNumber;