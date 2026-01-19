
SQL*Plus: Release 21.0.0.0.0 - Production on Mon Jan 19 16:57:30 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: Abhijeet
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


Enter user-name: system
Enter password:
Last Successful login time: Mon Jan 19 2026 16:51:53 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table student(RollNo int, Name varchar(50), Dept Varchar(20), Age Int, Phone Varchar(15));

Table created.

SQL> select * from student;

no rows selected

SQL> desc table student;
Usage: DESCRIBE [schema.]object[@db_link]
SQL> select student;
select student
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLLNO                                             NUMBER(38)
 NAME                                               VARCHAR2(50)
 DEPT                                               VARCHAR2(20)
 AGE                                                NUMBER(38)
 PHONE                                              VARCHAR2(15)

SQL> alter table student rename column Phone to MobileNo;

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLLNO                                             NUMBER(38)
 NAME                                               VARCHAR2(50)
 DEPT                                               VARCHAR2(20)
 AGE                                                NUMBER(38)
 MOBILENO                                           VARCHAR2(15)

SQL> alter table student add city varchar(30);

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLLNO                                             NUMBER(38)
 NAME                                               VARCHAR2(50)
 DEPT                                               VARCHAR2(20)
 AGE                                                NUMBER(38)
 MOBILENO                                           VARCHAR2(15)
 CITY                                               VARCHAR2(30)

SQL> alter table student add semester varchar(20);

Table altered.

SQL> create table course( courseid int, coursename varchar(30),credits int);

Table created.

SQL> desc course;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSEID                                           NUMBER(38)
 COURSENAME                                         VARCHAR2(30)
 CREDITS                                            NUMBER(38)

SQL> drop table course;

Table dropped.

SQL> insert into student value(1,'abhijeet','ai',21,'9053432243','delhi');
insert into student value(1,'abhijeet','ai',21,'9053432243','delhi')
                          *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into student values(1,'abhijeet','ai',21,'9053432243','delhi');
insert into student values(1,'abhijeet','ai',21,'9053432243','delhi')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> insert into student values (1,'abhijeet','ai',21,'9053432243','delhi');
insert into student values (1,'abhijeet','ai',21,'9053432243','delhi')
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLLNO                                             NUMBER(38)
 NAME                                               VARCHAR2(50)
 DEPT                                               VARCHAR2(20)
 AGE                                                NUMBER(38)
 MOBILENO                                           VARCHAR2(15)
 CITY                                               VARCHAR2(30)
 SEMESTER                                           VARCHAR2(20)

SQL> insert into student values (1,'abhijeet','ai',21,'9053432243','delhi','5th');

1 row created.

SQL> insert into student values (1,'abhijeet','ai',21,'9053432254','patna','5th');
