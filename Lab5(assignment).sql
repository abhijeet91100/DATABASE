SELECT S.StudentID,S.Name,E.CourseID from Student S
INNER JOIN Enrollment E
ON S.StudentID=E.StudentID;
--STUDENT NAME AND SEMESTER
SELECT S.NAME ,E.Semester FROM Student S
INNER JOIN Enrollment E 
ON S.StudentID=E.STUDENTID;
--STUDENT NAME AND GRADE
SELECT S.NAME,E.Grade FROM Student S 
INNER JOIN Enrollment E 
ON S.STUDENTID=E.StudentID;
-- COURSENAME ,CREDITS ,FACULTY NAME
SELECT C.CourseName,C.Credits,F.Name FROM Course C 
INNER JOIN Faculty F 
ON C.FacultyID=F.FacultyID; 
--COURSE TAUGHT BY FACULTYID='F02'
SELECT CourseName FROM COURSE 
WHERE FacultyID='F02';
--FACULTY NAME ,DESIGNATION WITH COURSENAME
SELECT F.Name,F.Designation,C.CourseName FROM Faculty F 
INNER JOIN Course C 
ON F.FacultyID=C.FacultyID;
--STUDENT NAME WITH COURSENAME
SELECT S.Name,C.CourseName FROM Student S 
INNER JOIN Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseID=C.COURSEID;
--STUDENT NAME, COURSENAME,SEMESTER 
SELECT S.Name ,C.CourseName,E.Semester FROM Student S 
INNER JOIN Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseID=C.CourseID;
--FOR SEMESTER 3 ONLY
SELECT S.Name,C.CourseName ,E.Grade FROM Student S 
INNER JOIN Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseID = C.CourseID WHERE E.Semester = 'Semester 3';
--COURSE OF STUDENT S04
SELECT C.CourseName FROM Enrollment E 
INNER JOIN Course C 
ON E.CourseID=C.CourseID WHERE E.StudentID='S04';
--student name , Departmentid with coursename 
SELECT S.Name,S.DepartmentID,C.CourseName FROM Student S 
INNER JOIN Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseiD=C.CourseID;
--DEPARTMENT-WISE LIST OF COURSES
SELECT D.DepartmentName,C.CourseName FROM Department D 
INNER JOIN Course C 
ON D.DepartmentID=C.DepartmentID;
--FACULTY NAME WITH DEPARTMENT NAME 
SELECT F.Name,D.DepartmentName FROM Faculty F 
INNER JOIN Department D 
ON F.DepartmentID=D.DepartmentID;
--STUDENT OF DEPARTMENT D01
SELECT S.NAME,C.CourseName FROM Student S 
INNER join Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseID=C.CourseID  WHERE S.DepartmentID='D01';
--sort by student name 
SELECT S.Name,C.CourseName FROM Student S 
INNER JOIN Enrollment E 
ON S.StudentID=E.StudentID 
INNER JOIN Course C 
ON E.CourseID=C.CourseID  
ORDER BY S.Name ASC;
--sort by credits(desc)
SELECT F.Name,C.CourseName FROM Faculty F 
INNER JOIN Course C
ON F.FacultyID=C.FacultyID 
ORDER BY C.Credits DESC;
--number of students in each course
SELECT C.CourseName ,COUNT(E.StudentID) FROM Course C 
INNER JOIN Enrollment E 
ON C.CourseID=E.CourseID 
GROUP BY C.CourseName ;
-- Course taught by each faculty 
SELECT F.Name ,COUNT(C.CourseID) FROM Faculty F 
INNER JOIN Course C 
ON F.FacultyID=C.FacultyID 
GROUP BY F.Name;
--department-wise student count 
SELECT DepartmentID,COUNT(StudentID) FROM Student 
GROUP BY DepartmentID;
--MAXIMUM GRADE IN EACH COURSE
SELECT C.CourseName ,MAX(E.Grade) FROM Course C 
INNER JOIN Enrollment E 
ON C.CourseID =E.CourseID 
GROUP BY C.CourseName;
COMMIT;