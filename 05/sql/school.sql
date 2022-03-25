SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT DISTINCT
    Staff.StaffID AS "Staff ID",
    (Staff.StfFirstName || " " || Staff.StfLastname) AS "Staff Name",
    Class_Rooms.ClassRoomID AS "Classroom ID",
    Class_Rooms.BuildingCode AS "Building Code"
FROM
    Class_Rooms LEFT OUTER JOIN Staff INNER JOIN
    Classes INNER JOIN Student_Schedules
    ON Classes.ClassID = Student_Schedules.ClassID
WHERE 
    Classes.ClassID = Student_Schedules.ClassID;

-- 2.
SELECT DISTINCT
    Subjects.SubjectName AS "Subject Name",
    Subjects.SubjectID
FROM
    Faculty INNER JOIN Staff
    LEFT OUTER JOIN Faculty_Classes 
    INNER JOIN Subjects
ON Staff.Position NOT LIKE "Faculty";

-- 3.
SELECT DISTINCT
    (Students.StudFirstName || " " || Students.StudLastName) AS "Student Name",
    Student_Class_Status.ClassStatusDescription AS "Class Status"
FROM
    Students INNER JOIN Classes
    LEFT OUTER JOIN Student_Class_Status
WHERE 
    Student_Class_Status.ClassStatusDescription NOT LIKE "Enrolled" AND
    Student_Class_Status.ClassStatusDescription NOT LIKE "Completed";

-- 4.
SELECT DISTINCT
    Faculty.StaffID, 
    (Staff.StfFirstName || " " || Staff.StfLastname) AS "Name",
    Staff.Position, Faculty.Title
FROM
    Faculty INNER JOIN Staff
    LEFT OUTER JOIN  Faculty_Classes 
    INNER JOIN Subjects
ON Faculty.StaffID = Staff.StaffID
WHERE Staff.Position = "Faculty";

