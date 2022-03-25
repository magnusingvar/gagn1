SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT
    agnt.AgentID,
    (agnt.AgtFirstName || " " || agnt.AgtLastName) AS "Agent Name",
    eng.EngagementNumber, eng.StartDate, eng.EndDate
FROM
    Agents AS agnt INNER JOIN Engagements AS eng
    ON agnt.AgentID = eng.AgentID
ORDER BY
    eng.StartDate;

-- 2.
SELECT 
    cust.CustomerID,
    (cust.CustFirstName || " " || cust.CustLastName) AS "Cust Name", 
    ent.EntertainerID, ent.EntStageName AS "Ent Name"
FROM
    Customers AS cust INNER JOIN Engagements AS eng
    ON cust.CustomerID = eng.CustomerID
    INNER JOIN Entertainers as ent
    ON ent.EntertainerID = eng.EntertainerID;

-- 3. 
SELECT
    (agnt.AgtFirstName || " " || agnt.AgtLastName) AS "Agent Name",
    agnt.AgtZipCode AS "Agent ZIP",
    ent.EntStageName AS "Entertainer Name",
    ent.EntZipCode AS "Entertainer ZIP"
FROM 
    Agents AS agnt INNER JOIN Entertainers AS ent
    ON agnt.AgtZipCode = ent.EntZipCode
ORDER BY 
    agnt.AgtZipCode, ent.EntZipCode;