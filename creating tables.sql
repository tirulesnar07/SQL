-- Creating students tables!

CREATE TABLE Students (
student_id varchar(20) PRIMARY KEY,
first_name varchar(20) NOT NULL,
last_name varchar(20),
email_id varchar(50) UNIQUE,
age int check(age >=18),
);

--Creting course table!

CREATE TABLE Courses (
course_id int PRIMARY KEY,
course_name varchar(20));

--creating Enrolment table!

CREATE TABLE ENROLLMENT (
enr_id int PRIMARY KEY,
student_id varchar(20),
course_id int,
FOREIGN KEY (student_id) references students(student_id),
FOREIGN KEY (course_id) references courses(course_id));

select * from sys.tables; --show all tables.
select COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH from INFORMATION_SCHEMA.COLUMNS 
where table_name='enrollment'; -- to show  table structure.

--\\-- Inserting data--\\--

select * from Students;

insert into Students (student_id,first_name,last_name,email_id,age)
values(1,'tiru','gugg','tiru@gmail.com',18)
insert into Students (student_id,first_name,last_name,email_id,age)
values(2,'uv','gugg','uv@gmail.com',19)
insert into Students (student_id,first_name,last_name,email_id,age)
values(3,'teja','dwa','tej@gmail.com',20)

select * from Courses;

insert into Courses(course_id,course_name)
values(101,'SQL'),(102,'Data');

select * from ENROLLMENT;

INSERT INTO ENROLLMENT
values(1002,2,102);

-- See which student enrolled in which course

SELECT s.first_name, c.course_name
FROM Enrollment e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;