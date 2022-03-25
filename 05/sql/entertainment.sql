SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT DISTINCT
    Agents.AgentID AS "Agent ID",
    (Agents.AgtFirstName || " " || Agents.AgtLastName) AS "Agent Name"
FROM
    Agents INNER JOIN Engagements
ON Engagements.AgentID = Agents.AgentID;

-- 2
SELECT DISTINCT
    Customers.CustomerID AS "Customer ID",
    (Customers.CustFirstName || " " || Customers.CustLastName) AS "Customer Name"
FROM
    Customers LEFT OUTER JOIN Engagements
    INNER JOIN Entertainers
WHERE
    Customers.CustomerID != Engagements.CustomerID;

-- 3.
SELECT DISTINCT
    Engagements.EngagementNumber AS "Eng Number",
    Entertainers.EntertainerID AS "Ent ID",
    Entertainers.EntStageName AS "Ent Stage Name",
    (Customers.CustFirstName || " " || Customers.CustLastName) AS "Cust Name",
    Engagements.StartDate AS "Start Date", 
    Engagements.EndDate AS "End Date"
FROM
    Entertainers INNER JOIN Customers
    LEFT OUTER JOIN Engagements
ORDER BY 
    Engagements.EngagementNumber;