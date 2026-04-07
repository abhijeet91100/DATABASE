SELECT Name
from Student
where DepartmentID=(SELECT DepartmentID
                    from Student
                    where StudentID='S04');
--
SELECT NAME
from STUDENT
where GENDER=(SELECT GENDER
              from STUDENT
              where STUDENTID='S03');
--3
SELECT NAME
from STUDENT
where DEPARTMENTID='D03';
--4
SELECT NAME
from STUDENT
where DEPARTMENTID IN (SELECT DEPARTMENTID
                       from STUDENT
                       where gender='F');
--5
SELECT NAME
from STUDENT
where studentID IN (SELECT StudentID
                       from ENROLLMENT);
--6
SELECT NAME
from STUDENT
where studentID IN (SELECT StudentID
                       from enrollment);
--7
SELECT courseName
from course
where CREDITS>(SELECT avg(CREDITS)
              from course);
--8
SELECT NAME
from STUDENT
where TO_NUMBER(SUBSTR(StudentID,2))>
            (SELECT avg(TO_NUMBER(SUBSTR(StudentID,2)))
            from STUDENT);
--9
SELECT DepartmentID
FROM Student
GROUP BY DepartmentID
HAVING COUNT(*) >
(
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) cnt
        FROM Student
        GROUP BY DepartmentID
    )
);
SELECT Name
FROM Student
WHERE DepartmentID IS NOT NULL;
SELECT CourseName
FROM Course
WHERE CourseID IN (
    SELECT CourseID
    FROM Enrollment
);
SELECT Name
FROM Student
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollment
);
SELECT DepartmentID
FROM Student
GROUP BY DepartmentID
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM Student
    GROUP BY DepartmentID
);
SELECT Name
FROM Student
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollment
    GROUP BY StudentID
    HAVING COUNT(CourseID) > 1
);
SELECT CourseName
FROM Course
WHERE Credits = (
    SELECT MAX(Credits)
    FROM Course
);
SELECT CourseName
FROM Course
WHERE CourseID NOT IN (
    SELECT CourseID
    FROM Enrollment
);
SELECT Name
FROM Student
WHERE StudentID NOT IN (
    SELECT StudentID
    FROM Enrollment
);
SELECT Name
FROM Student
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollment
    WHERE CourseID IN (
        SELECT CourseID
        FROM Enrollment
        WHERE StudentID = 'S401'
    )
);