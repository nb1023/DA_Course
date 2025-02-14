create database student;

use student;

create table student_details(
student_name varchar(256),
Gender char(1),
Age tinyint,
event_date date,
distance decimal(5,2));

INSERT INTO student_details(student_name, Gender,Age, event_date, distance)
VALUES ('Raj Mehra', 'M', 25, '2024-08-03', 123.11);

INSERT INTO student_details()
VALUES ('Sumit Mehra', 'M', 21, '2024-08-09', 200.11);

INSERT INTO student_details(student_name, Gender,Age, event_date, distance)
VALUES ('Mayank', 'M', 18, '2024-02-03', 234.25),
('Sujal', 'M', 20, '2024-10-03', 678.22)
;

-- to check ordinal position like whihc column is in first position
select * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'student_details';

INSERT INTO student_details(student_name, Gender)
VALUES ('Priya', 'F');

INSERT INTO student_details(Age, event_date)
VALUES (34, '2023-10-04'),
(43, '2024-01-10'),
(13, '2024-09-10');

select * from student_details;

-- Data Type of column age is tinyint (0-255 range)
INSERT INTO student_details(Age)
VALUES (256);
-- it will give error as it is beyond the provided range

-- COPYING DATA FROM EXISTING TABLE TO NEW TABLE
-- case 1 : new table simple does not exist
-- case 2 : the new table structure/new table exist

select * from sales;

CREATE TABLE new_table1 AS 
SELECT * FROM sales;
-- this statement will result in creation of new_table1 which 
-- will have structure and records both same as that of sales table

-- to copy certain columns only 
drop table new_table1;

CREATE TABLE new_table1 AS 
SELECT ProductId, Quantity FROM sales;

select * from new_table1;

-- CASE 2 - NEW TABLE STRUCTURE/TABLE ALREADY EXIST
INSERT INTO new_table1 (ProductId, Quantity)
SELECT ProductId, Quantity FROM sales;
