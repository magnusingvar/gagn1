SELECT
    Name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT SubjectName
FROM Subjects;

-- 2. 
SELECT Title
FROM Faculty;

-- 3.
SELECT StfFirstName, StfLastname, StfPhoneNumber
FROM Staff
ORDER BY StfLastname, StfFirstName;