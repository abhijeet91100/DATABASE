DESC Student;
DESC Faculty;
DESC Course;
DESC Enrollment;
--Rename all columns from Student table
SELECT StudentID AS ID, 
       Name AS FullName, 
       DateOfBirth AS DOB,
       DepartmentID AS DeptID from Student;
--Rename all columns from Faculty table
SELECT FacultyID AS ID, 
       Name AS FullName, 
       Designation AS Role, 
       Email AS ContactEmail, 
       DepartmentID AS DeptID from Faculty;
--Rename all columns from Course table
SELECT CourseID AS ID, 
       CourseName AS Name, 
       Credits AS CreditHours, 
       DepartmentID AS DeptID, 
       FacultyID AS InstructorID from Course;
--Rename all columns from Enrollment table
SELECT StudentID AS Student_ID, 
       CourseID AS Course_ID, 
       Semester AS Term, 
       Grade AS Final_Grade from Enrollment;
--filter Student in D01
SELECT * FROM Student WHERE DepartmentID = 'D01';
--female students
SELECT * FROM Student WHERE Gender = 'F';
--Assistant Professors
SELECT * FROM Faculty WHERE Designation = 'Assistant Professor';
--faculty in F02
SELECT * FROM Faculty WHERE DepartmentID = 'F02';
--courses with credits>=4
SELECT * FROM Course WHERE Credits >= 4;
--studnts bron after 2003-01-01
SELECT * FROM Student WHERE DateOfBirth > TO_DATE('2003-01-01','YYYY-MM-DD');
--enrollment in semester 4
SELECT * FROM Enrollment WHERE Semester = 'Semester 4';
--SORT STUDENT BY NAME ASCENDING
SELECT * FROM Student ORDER BY Name ASC;
--SORT BY DOB DESCENDING
SELECT * FROM Student ORDER BY DateOfBirth DESC;
--FACULTY SORTED BY DESIGNATION
SELECT * FROM Faculty order by Designation;
--COURSE SORTED BY CREDITS DESCENDING
SELECT * FROM Course order by Credits DESC;
--DISPLAY FIRST 3 STUDENTS
SELECT * FROM Student WHERE ROWNUM <=3;
--DISPLAY FIRST 5 COURSES
SELECT * FROM Course WHERE ROWNUM <=5;
--STUDENT WITH AGE
SELECT 'Student1' AS Name,
        year(curdate())-year('2004-06-10') AS Age
        UNION SELECT 'Student2' AS Name,
        year(curdate())-year('2003-08-15') AS Age;
SELECT Name, FLOOR(MONTHS_BETWEEN(SYSDATE, DateOfBirth)/12) AS Age FROM Student;
--INCREASE CREDITS BY 1
UPDATE Course SET Credits = Credits + 1;
--GRADE AS FINAL_GRADE
SELECT 
        StudentID, 
        CourseID, 
        Semester, 
        Grade AS Final_Grade FROM Enrollment;
--extract year from DateOfBirth;
SELECT Name, EXTRACT(YEAR FROM DateOfBirth) AS Birth_Year FROM Student;
--Extract email domain from faculty email
SELECT Name, SUBSTR(Email, INSTR(Email, '@') + 1) AS Email_Domain FROM Faculty;
COMMIT;