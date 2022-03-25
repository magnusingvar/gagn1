SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT 
    build.BuildingCode AS "Building Code",
    build.BuildingName AS "Building Name",
    class.ClassRoomID 
FROM
    Buildings AS build INNER JOIN Class_Rooms as c_rooms
    ON build.BuildingCode = c_rooms.BuildingCode
    INNER JOIN Classes AS class
    ON c_rooms.ClassRoomID != class.ClassRoomID;

-- 2.
SELECT 
    (StudFirstName || " " || StudLastName) AS "Name",
    Subjects.SubjectName
FROM 
    Students INNER JOIN Student_Schedules
    ON Students.StudentID = Student_Schedules.StudentID
    INNER JOIN Classes
    ON Student_Schedules.ClassID = Classes.ClassID
    INNER JOIN Student_Class_Status
    ON Student_Schedules.ClassStatus = Student_Class_Status.ClassStatus
    INNER JOIN Subjects
    ON Subjects.SubjectID = Classes.SubjectID
WHERE 
    Student_Class_Status.ClassStatusDescription = "Enrolled";

-- 3. 
SELECT
    (Staff.StfFirstName || " " || Staff.StfLastname) AS "Name",
    sub.CategoryID AS "Subject Category"
    ,sub.SubjectCode AS "Subject Code"
FROM
    Staff INNER JOIN Faculty_Subjects AS fac_sub
    ON Staff.StaffID = fac_sub.StaffID
    INNER JOIN Subjects AS sub
    ON sub.SubjectID = fac_sub.SubjectID
ORDER BY
    Staff.StaffId, sub.SubjectID;
   
-- 4.
SELECT DISTINCT
    ART1.idArt, ART1.Grade, CIS1.Grade
FROM
    (SELECT
        Students.StudentID AS "idArt",
        Student_Schedules.Grade AS "grade"
    FROM
        Students INNER JOIN Student_Schedules
        ON Students.StudentID = Student_Schedules.StudentID
        INNER JOIN Classes
        ON Student_Schedules.ClassID = Classes.ClassID
        INNER JOIN Subjects
        ON Classes.SubjectID = Subjects.SubjectID
    WHERE 
        Student_Schedules.Grade > 85 AND
        Subjects.CategoryID LIKE "ART") AS "ART1"
    INNER JOIN 
        (SELECT
        Students.StudentID AS "idCis",
        Student_Schedules.Grade AS "grade"
    FROM
        Students INNER JOIN Student_Schedules
        ON Students.StudentID = Student_Schedules.StudentID
        INNER JOIN Classes
        ON Student_Schedules.ClassID = Classes.ClassID
        INNER JOIN Subjects
        ON Classes.SubjectID = Subjects.SubjectID
    WHERE 
        Student_Schedules.Grade > 85 AND
        Subjects.CategoryID LIKE "CIS") AS "CIS1"
WHERE
    CIS1.idCis = ART1.idArt;
