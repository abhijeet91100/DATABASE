
SQL*Plus: Release 21.0.0.0.0 - Production on Mon Feb 23 13:07:07 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: SYSTEM
Enter password:
Last Successful login time: Mon Feb 16 2026 15:54:51 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE Department (
  2      DepartmentID VARCHAR(10) PRIMARY KEY,
  3      DepartmentName VARCHAR(100),
  4      OfficeLocation VARCHAR(100)
  5  );
CREATE TABLE Department (
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL>
SQL> -- ==============================
SQL> -- Faculty
SQL> -- ==============================
SQL> CREATE TABLE Faculty (
  2      FacultyID VARCHAR(10) PRIMARY KEY,
  3      Name VARCHAR(100),
  4      Designation VARCHAR(50),
  5      Email VARCHAR(100),
  6      DepartmentID VARCHAR(10),
  7      FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
  8  );
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
                                                     *
ERROR at line 7:
ORA-00904: "DEPARTMENTID": invalid identifier


SQL>
SQL> -- ==============================
SQL> -- Student
SQL> -- ==============================
SQL> CREATE TABLE Student (
  2      StudentID VARCHAR(10) PRIMARY KEY,
  3      Name VARCHAR(100),
  4      DateOfBirth DATE,
  5      Gender CHAR(1),
  6      ContactNumber VARCHAR(15),
  7      DepartmentID VARCHAR(10),
  8      FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
  9  );
CREATE TABLE Student (
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object


SQL>
SQL> -- ==============================
SQL> -- Course
SQL> -- ==============================
SQL> CREATE TABLE Course (
  2      CourseID VARCHAR(10) PRIMARY KEY,
  3      CourseName VARCHAR(100),
  4      Credits INT,
  5      DepartmentID VARCHAR(10),
  6      FacultyID VARCHAR(10),
  7      FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
  8      FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
  9  );
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
                                                     *
ERROR at line 7:
ORA-00904: "DEPARTMENTID": invalid identifier


SQL>
SQL> -- ==============================
SQL> -- Enrollment
SQL> -- ==============================
SQL> CREATE TABLE Enrollment (
  2      StudentID VARCHAR(10),
  3      CourseID VARCHAR(10),
  4      Semester VARCHAR(20),
  5      Grade CHAR(2),
  6      PRIMARY KEY (StudentID, CourseID),
  7      FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  8      FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
  9  );
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
                                               *
ERROR at line 7:
ORA-00904: "STUDENTID": invalid identifier


SQL>
SQL> COMMIT;
