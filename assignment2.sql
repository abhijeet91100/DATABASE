
SQL*Plus: Release 21.0.0.0.0 - Production on Mon Feb 16 13:37:53 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Mon Feb 16 2026 13:00:54 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> /*
SQL> CREATE TABLE Department (
SQL>     dept_id VARCHAR2(10) PRIMARY KEY,
SQL>     dept_name VARCHAR2(100) NOT NULL,
SQL>     office_location VARCHAR2(50)
SQL> );
SQL>
SQL> CREATE TABLE Faculty (
SQL>     faculty_id VARCHAR2(10) PRIMARY KEY,
SQL>     faculty_name VARCHAR2(100) NOT NULL,
SQL>     designation VARCHAR2(100),
SQL>     email VARCHAR2(100),
SQL>     dept_id VARCHAR2(10),
SQL>     CONSTRAINT fk_fac_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
SQL> );
SQL>
SQL> CREATE TABLE Course (
SQL>     course_id VARCHAR2(10) PRIMARY KEY,
SQL>     course_name VARCHAR2(100) NOT NULL,
SQL>     credits NUMBER,
SQL>     dept_id VARCHAR2(10),
SQL>     faculty_id VARCHAR2(10),
SQL>     CONSTRAINT fk_course_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
SQL>     CONSTRAINT fk_course_fac FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
SQL> );
SQL>
SQL> CREATE TABLE Student (
SQL>     student_id VARCHAR2(10) PRIMARY KEY,
SQL>     student_name VARCHAR2(100) NOT NULL,
SQL>     dob DATE,
SQL>     gender CHAR(1),
SQL>     contact_no VARCHAR2(10),
SQL>     dept_id VARCHAR2(10),
SQL>     CONSTRAINT fk_stu_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
SQL> );
SQL>
SQL> CREATE TABLE Enrollment (
SQL>     student_id VARCHAR2(10),
SQL>     course_id VARCHAR2(10),
SQL>     semester NUMBER,
SQL>     grade VARCHAR2(5),
SQL>     CONSTRAINT pk_enroll PRIMARY KEY (student_id, course_id),
SQL>     CONSTRAINT fk_enroll_stu FOREIGN KEY (student_id) REFERENCES Student(student_id),
SQL>     CONSTRAINT fk_enroll_course FOREIGN KEY (course_id) REFERENCES Course(course_id)
SQL> );
SQL>
SQL>
SQL>
SQL> INSERT INTO Department VALUES ('D01','Computer Science & Engineering','Block A');
SQL> INSERT INTO Department VALUES ('D02','Computer Science & Engineering (AI & ML)','Block B');
SQL> INSERT INTO Department VALUES ('D03','3D Animation & Graphics','Block C');
SQL> INSERT INTO Department VALUES ('D04','Electronics and Electrical Engineering','Block D');
SQL> INSERT INTO Department VALUES ('D05','Mechanical Engineering','Block E');
SQL> INSERT INTO Department VALUES ('D06','Civil Engineering','Block F');
SQL> INSERT INTO Department VALUES ('D07','Civil Engineering with Computer Application','Block F');
SQL>
SQL> INSERT INTO Faculty VALUES ('F01','Prof. Murlidhar Prasad Singh (HoD)','Assistant Professor, HOD','singhmurlidhar@gmail.com','D01');
SQL> INSERT INTO Faculty VALUES ('F02','Prof. Md. Ehtashamoul Haque','Assistant Professor','ehtasham47@gmail.com','D01');
SQL> INSERT INTO Faculty VALUES ('F03','Prof. Arun Kumar','Assistant Professor (Guest)','arunkr75@gmail.com','D01');
SQL> INSERT INTO Faculty VALUES ('F04','Prof. Amit Kumar','Associate Professor','amitbcebhagalpur@gmail.com','D01');
SQL> INSERT INTO Faculty VALUES ('F05','Sujeet Kumar','Assistant Professor','ksujeet.cs@gmail.com','D02');
SQL> INSERT INTO Faculty VALUES ('F06','Prof. Praveen Kumar','Assistant Professor','manisha.ks241@gmail.com','D02');
SQL> INSERT INTO Faculty VALUES ('F07','Prof. Md. Izhar','Assistant Professor','akumar@bpmce.ac.in','D03');
SQL> INSERT INTO Faculty VALUES ('F08','Prof. Hare Krishna Mishra','Assistant Professor','hare.dbit@gmail.com','D04');
SQL> INSERT INTO Faculty VALUES ('F09','Prof. Ashish Kumar Suman','Assistant Professor','sumanashish.rkt@gmail.com','D04');
SQL> INSERT INTO Faculty VALUES ('F10','Prof. Kunal Kumar (HoD)','Assistant Professor & HOD','kunal1989kumar@gmail.com','D05');
SQL> INSERT INTO Faculty VALUES ('F11','Mr. Nishikant Kumar','Assistant Professor','nishikantbpmce32@gmail.com','D05');
SQL>
SQL> INSERT INTO Course VALUES ('C01','Data Structures',4,'D01','F01');
SQL> INSERT INTO Course VALUES ('C02','Database Management Systems',4,'D01','F02');
SQL> INSERT INTO Course VALUES ('C03','Operating Systems',4,'D01','F01');
SQL> INSERT INTO Course VALUES ('C04','Computer Networks',4,'D01','F02');
SQL> INSERT INTO Course VALUES ('C05','Software Engineering',3,'D01','F01');
SQL> INSERT INTO Course VALUES ('C06','Engineering Mechanics',3,'D02','F03');
SQL> INSERT INTO Course VALUES ('C07','Thermodynamics',4,'D02','F03');
SQL> INSERT INTO Course VALUES ('C08','Structural Analysis',4,'D03','F04');
SQL> INSERT INTO Course VALUES ('C09','Concrete Technology',3,'D03','F04');
SQL> INSERT INTO Course VALUES ('C10','Basic Electrical Engineering',3,'D04','F04');
SQL>
SQL>
SQL> INSERT INTO Student VALUES ('S01','Rohit Kumar', TO_DATE('2004-01-10','YYYY-MM-DD'),'M','9000000001','D01');
SQL> INSERT INTO Student VALUES ('S02','Anjali Singh', TO_DATE('2004-02-15','YYYY-MM-DD'),'F','9000000002','D01');
SQL> INSERT INTO Student VALUES ('S03','Aman Verma', TO_DATE('2003-12-20','YYYY-MM-DD'),'M','9000000003','D01');
SQL> INSERT INTO Student VALUES ('S04','Neha Gupta', TO_DATE('2004-03-05','YYYY-MM-DD'),'F','9000000004','D02');
SQL> INSERT INTO Student VALUES ('S05','Rahul Yadav', TO_DATE('2003-11-11','YYYY-MM-DD'),'M','9000000005','D02');
SQL> INSERT INTO Student VALUES ('S06','Pooja Sharma', TO_DATE('2004-04-18','YYYY-MM-DD'),'F','9000000006','D03');
SQL> INSERT INTO Student VALUES ('S07','Vikas Patel', TO_DATE('2003-10-09','YYYY-MM-DD'),'M','9000000007','D03');
SQL> INSERT INTO Student VALUES ('S08','Kriti Mishra', TO_DATE('2004-05-22','YYYY-MM-DD'),'F','9000000008','D01');
SQL> INSERT INTO Student VALUES ('S09','Suresh Kumar', TO_DATE('2003-09-30','YYYY-MM-DD'),'M','9000000009','D04');
SQL> INSERT INTO Student VALUES ('S10','Nisha Rai', TO_DATE('2004-06-14','YYYY-MM-DD'),'F','9000000010','D04');
SQL>
SQL> INSERT INTO Enrollment VALUES ('S01','C01',3,'A');
SQL> INSERT INTO Enrollment VALUES ('S01','C02',3,'B+');
SQL> INSERT INTO Enrollment VALUES ('S02','C01',3,'A-');
SQL> INSERT INTO Enrollment VALUES ('S03','C03',4,'B');
SQL> INSERT INTO Enrollment VALUES ('S04','C06',2,'A');
SQL> INSERT INTO Enrollment VALUES ('S05','C07',3,'B+');
SQL> INSERT INTO Enrollment VALUES ('S06','C08',4,'A');
SQL> INSERT INTO Enrollment VALUES ('S07','C09',4,'B');
SQL> INSERT INTO Enrollment VALUES ('S08','C04',3,'A-');
SQL> INSERT INTO Enrollment VALUES ('S09','C10',1,'B+');
SQL>
SQL>
SQL>
SQL> SELECT * FROM Department;
SQL> SELECT * FROM Faculty;
SQL> SELECT * FROM Course;
SQL> SELECT * FROM Student;
SQL> SELECT * FROM Enrollment;
SQL>
SQL> */
SQL>
SQL> INSERT INTO Student VALUES ('S26','Akash Dubey', TO_DATE('2003-01-12','YYYY-MM-DD'),'M','9000000026','D01');
INSERT INTO Student VALUES ('S26','Akash Dubey', TO_DATE('2003-01-12','YYYY-MM-DD'),'M','9000000026','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S27','Riya Arora', TO_DATE('2004-02-18','YYYY-MM-DD'),'F','9000000027','D02');
INSERT INTO Student VALUES ('S27','Riya Arora', TO_DATE('2004-02-18','YYYY-MM-DD'),'F','9000000027','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S28','Manish Pandey', TO_DATE('2003-03-22','YYYY-MM-DD'),'M','9000000028','D03');
INSERT INTO Student VALUES ('S28','Manish Pandey', TO_DATE('2003-03-22','YYYY-MM-DD'),'M','9000000028','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S29','Shalini Saxena', TO_DATE('2004-04-09','YYYY-MM-DD'),'F','9000000029','D04');
INSERT INTO Student VALUES ('S29','Shalini Saxena', TO_DATE('2004-04-09','YYYY-MM-DD'),'F','9000000029','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S30','Naveen Mishra', TO_DATE('2003-05-15','YYYY-MM-DD'),'M','9000000030','D01');
INSERT INTO Student VALUES ('S30','Naveen Mishra', TO_DATE('2003-05-15','YYYY-MM-DD'),'M','9000000030','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S31','Komal Bansal', TO_DATE('2004-06-20','YYYY-MM-DD'),'F','9000000031','D02');
INSERT INTO Student VALUES ('S31','Komal Bansal', TO_DATE('2004-06-20','YYYY-MM-DD'),'F','9000000031','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S32','Rohit Mishra', TO_DATE('2003-07-11','YYYY-MM-DD'),'M','9000000032','D03');
INSERT INTO Student VALUES ('S32','Rohit Mishra', TO_DATE('2003-07-11','YYYY-MM-DD'),'M','9000000032','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S33','Ankita Tripathi', TO_DATE('2004-08-25','YYYY-MM-DD'),'F','9000000033','D04');
INSERT INTO Student VALUES ('S33','Ankita Tripathi', TO_DATE('2004-08-25','YYYY-MM-DD'),'F','9000000033','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S34','Saurabh Jain', TO_DATE('2003-09-13','YYYY-MM-DD'),'M','9000000034','D01');
INSERT INTO Student VALUES ('S34','Saurabh Jain', TO_DATE('2003-09-13','YYYY-MM-DD'),'M','9000000034','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S35','Pallavi Kulkarni', TO_DATE('2004-10-07','YYYY-MM-DD'),'F','9000000035','D02');
INSERT INTO Student VALUES ('S35','Pallavi Kulkarni', TO_DATE('2004-10-07','YYYY-MM-DD'),'F','9000000035','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL>
SQL> INSERT INTO Student VALUES ('S36','Vivek Tandon', TO_DATE('2003-11-19','YYYY-MM-DD'),'M','9000000036','D03');
INSERT INTO Student VALUES ('S36','Vivek Tandon', TO_DATE('2003-11-19','YYYY-MM-DD'),'M','9000000036','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S37','Neelam Rathi', TO_DATE('2004-12-02','YYYY-MM-DD'),'F','9000000037','D04');
INSERT INTO Student VALUES ('S37','Neelam Rathi', TO_DATE('2004-12-02','YYYY-MM-DD'),'F','9000000037','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S38','Amit Kulkarni', TO_DATE('2003-01-28','YYYY-MM-DD'),'M','9000000038','D01');
INSERT INTO Student VALUES ('S38','Amit Kulkarni', TO_DATE('2003-01-28','YYYY-MM-DD'),'M','9000000038','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S39','Shreya Ghosh', TO_DATE('2004-02-14','YYYY-MM-DD'),'F','9000000039','D02');
INSERT INTO Student VALUES ('S39','Shreya Ghosh', TO_DATE('2004-02-14','YYYY-MM-DD'),'F','9000000039','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S40','Rakesh Yadav', TO_DATE('2003-03-06','YYYY-MM-DD'),'M','9000000040','D03');
INSERT INTO Student VALUES ('S40','Rakesh Yadav', TO_DATE('2003-03-06','YYYY-MM-DD'),'M','9000000040','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S41','Nidhi Kapoor', TO_DATE('2004-04-21','YYYY-MM-DD'),'F','9000000041','D04');
INSERT INTO Student VALUES ('S41','Nidhi Kapoor', TO_DATE('2004-04-21','YYYY-MM-DD'),'F','9000000041','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S42','Alok Srivastava', TO_DATE('2003-05-17','YYYY-MM-DD'),'M','9000000042','D01');
INSERT INTO Student VALUES ('S42','Alok Srivastava', TO_DATE('2003-05-17','YYYY-MM-DD'),'M','9000000042','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S43','Poonam Joshi', TO_DATE('2004-06-10','YYYY-MM-DD'),'F','9000000043','D02');
INSERT INTO Student VALUES ('S43','Poonam Joshi', TO_DATE('2004-06-10','YYYY-MM-DD'),'F','9000000043','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S44','Siddharth Malhotra', TO_DATE('2003-07-03','YYYY-MM-DD'),'M','9000000044','D03');
INSERT INTO Student VALUES ('S44','Siddharth Malhotra', TO_DATE('2003-07-03','YYYY-MM-DD'),'M','9000000044','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S45','Kavita Deshmukh', TO_DATE('2004-08-29','YYYY-MM-DD'),'F','9000000045','D04');
INSERT INTO Student VALUES ('S45','Kavita Deshmukh', TO_DATE('2004-08-29','YYYY-MM-DD'),'F','9000000045','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL>
SQL> INSERT INTO Student VALUES ('S46','Harsh Vardhan', TO_DATE('2003-09-18','YYYY-MM-DD'),'M','9000000046','D01');
INSERT INTO Student VALUES ('S46','Harsh Vardhan', TO_DATE('2003-09-18','YYYY-MM-DD'),'M','9000000046','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S47','Tanvi Chaturvedi', TO_DATE('2004-10-12','YYYY-MM-DD'),'F','9000000047','D02');
INSERT INTO Student VALUES ('S47','Tanvi Chaturvedi', TO_DATE('2004-10-12','YYYY-MM-DD'),'F','9000000047','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S48','Pankaj Rawat', TO_DATE('2003-11-05','YYYY-MM-DD'),'M','9000000048','D03');
INSERT INTO Student VALUES ('S48','Pankaj Rawat', TO_DATE('2003-11-05','YYYY-MM-DD'),'M','9000000048','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S49','Ruchi Bhatia', TO_DATE('2004-12-22','YYYY-MM-DD'),'F','9000000049','D04');
INSERT INTO Student VALUES ('S49','Ruchi Bhatia', TO_DATE('2004-12-22','YYYY-MM-DD'),'F','9000000049','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S50','Ashish Tomar', TO_DATE('2003-01-09','YYYY-MM-DD'),'M','9000000050','D01');
INSERT INTO Student VALUES ('S50','Ashish Tomar', TO_DATE('2003-01-09','YYYY-MM-DD'),'M','9000000050','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S51','Megha Arora', TO_DATE('2004-02-26','YYYY-MM-DD'),'F','9000000051','D02');
INSERT INTO Student VALUES ('S51','Megha Arora', TO_DATE('2004-02-26','YYYY-MM-DD'),'F','9000000051','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S52','Dinesh Khandelwal', TO_DATE('2003-03-30','YYYY-MM-DD'),'M','9000000052','D03');
INSERT INTO Student VALUES ('S52','Dinesh Khandelwal', TO_DATE('2003-03-30','YYYY-MM-DD'),'M','9000000052','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S53','Ishita Sengupta', TO_DATE('2004-04-16','YYYY-MM-DD'),'F','9000000053','D04');
INSERT INTO Student VALUES ('S53','Ishita Sengupta', TO_DATE('2004-04-16','YYYY-MM-DD'),'F','9000000053','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S54','Pradeep Solanki', TO_DATE('2003-05-24','YYYY-MM-DD'),'M','9000000054','D01');
INSERT INTO Student VALUES ('S54','Pradeep Solanki', TO_DATE('2003-05-24','YYYY-MM-DD'),'M','9000000054','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S55','Ananya Chatterjee', TO_DATE('2004-06-08','YYYY-MM-DD'),'F','9000000055','D02');
INSERT INTO Student VALUES ('S55','Ananya Chatterjee', TO_DATE('2004-06-08','YYYY-MM-DD'),'F','9000000055','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL>
SQL> INSERT INTO Student VALUES ('S56','Gaurav Bansal', TO_DATE('2003-07-27','YYYY-MM-DD'),'M','9000000056','D03');
INSERT INTO Student VALUES ('S56','Gaurav Bansal', TO_DATE('2003-07-27','YYYY-MM-DD'),'M','9000000056','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S57','Rashmi Kulkarni', TO_DATE('2004-08-13','YYYY-MM-DD'),'F','9000000057','D04');
INSERT INTO Student VALUES ('S57','Rashmi Kulkarni', TO_DATE('2004-08-13','YYYY-MM-DD'),'F','9000000057','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S58','Sanjay Pathak', TO_DATE('2003-09-04','YYYY-MM-DD'),'M','9000000058','D01');
INSERT INTO Student VALUES ('S58','Sanjay Pathak', TO_DATE('2003-09-04','YYYY-MM-DD'),'M','9000000058','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S59','Preeti Nanda', TO_DATE('2004-10-19','YYYY-MM-DD'),'F','9000000059','D02');
INSERT INTO Student VALUES ('S59','Preeti Nanda', TO_DATE('2004-10-19','YYYY-MM-DD'),'F','9000000059','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S60','Karan Oberoi', TO_DATE('2003-11-26','YYYY-MM-DD'),'M','9000000060','D03');
INSERT INTO Student VALUES ('S60','Karan Oberoi', TO_DATE('2003-11-26','YYYY-MM-DD'),'M','9000000060','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S61','Swati Kulshreshtha', TO_DATE('2004-12-15','YYYY-MM-DD'),'F','9000000061','D04');
INSERT INTO Student VALUES ('S61','Swati Kulshreshtha', TO_DATE('2004-12-15','YYYY-MM-DD'),'F','9000000061','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S62','Rohit Choudhary', TO_DATE('2003-01-17','YYYY-MM-DD'),'M','9000000062','D01');
INSERT INTO Student VALUES ('S62','Rohit Choudhary', TO_DATE('2003-01-17','YYYY-MM-DD'),'M','9000000062','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S63','Neha Bansal', TO_DATE('2004-02-05','YYYY-MM-DD'),'F','9000000063','D02');
INSERT INTO Student VALUES ('S63','Neha Bansal', TO_DATE('2004-02-05','YYYY-MM-DD'),'F','9000000063','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S64','Vinayak Desai', TO_DATE('2003-03-11','YYYY-MM-DD'),'M','9000000064','D03');
INSERT INTO Student VALUES ('S64','Vinayak Desai', TO_DATE('2003-03-11','YYYY-MM-DD'),'M','9000000064','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S65','Aparna Kulkarni', TO_DATE('2004-04-28','YYYY-MM-DD'),'F','9000000065','D04');
INSERT INTO Student VALUES ('S65','Aparna Kulkarni', TO_DATE('2004-04-28','YYYY-MM-DD'),'F','9000000065','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL>
SQL> INSERT INTO Student VALUES ('S66','Lokesh Verma', TO_DATE('2003-05-02','YYYY-MM-DD'),'M','9000000066','D01');
INSERT INTO Student VALUES ('S66','Lokesh Verma', TO_DATE('2003-05-02','YYYY-MM-DD'),'M','9000000066','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S67','Pooja Mehra', TO_DATE('2004-06-17','YYYY-MM-DD'),'F','9000000067','D02');
INSERT INTO Student VALUES ('S67','Pooja Mehra', TO_DATE('2004-06-17','YYYY-MM-DD'),'F','9000000067','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S68','Rahul Saxena', TO_DATE('2003-07-23','YYYY-MM-DD'),'M','9000000068','D03');
INSERT INTO Student VALUES ('S68','Rahul Saxena', TO_DATE('2003-07-23','YYYY-MM-DD'),'M','9000000068','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S69','Shikha Pandit', TO_DATE('2004-08-06','YYYY-MM-DD'),'F','9000000069','D04');
INSERT INTO Student VALUES ('S69','Shikha Pandit', TO_DATE('2004-08-06','YYYY-MM-DD'),'F','9000000069','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S70','Nikhil Saini', TO_DATE('2003-09-14','YYYY-MM-DD'),'M','9000000070','D01');
INSERT INTO Student VALUES ('S70','Nikhil Saini', TO_DATE('2003-09-14','YYYY-MM-DD'),'M','9000000070','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S71','Monika Shetty', TO_DATE('2004-10-01','YYYY-MM-DD'),'F','9000000071','D02');
INSERT INTO Student VALUES ('S71','Monika Shetty', TO_DATE('2004-10-01','YYYY-MM-DD'),'F','9000000071','D02')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S72','Tarun Awasthi', TO_DATE('2003-11-10','YYYY-MM-DD'),'M','9000000072','D03');
INSERT INTO Student VALUES ('S72','Tarun Awasthi', TO_DATE('2003-11-10','YYYY-MM-DD'),'M','9000000072','D03')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S73','Kiran Pillai', TO_DATE('2004-12-27','YYYY-MM-DD'),'F','9000000073','D04');
INSERT INTO Student VALUES ('S73','Kiran Pillai', TO_DATE('2004-12-27','YYYY-MM-DD'),'F','9000000073','D04')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S74','Ankit Bhardwaj', TO_DATE('2003-01-31','YYYY-MM-DD'),'M','9000000074','D01');
INSERT INTO Student VALUES ('S74','Ankit Bhardwaj', TO_DATE('2003-01-31','YYYY-MM-DD'),'M','9000000074','D01')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> INSERT INTO Student VALUES ('S75','Ritu Malhotra', TO_DATE('2004-02-09','YYYY-MM-DD'),'F','9000000075','D02')
