CREATE DATABASE mytesting;

use mytesting;

CREATE TABLE testing (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO testing (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2019-03-23'),
(3, 'Alice', 'Johnson', 'IT', 75000.00, '2021-07-10'),
(4, 'Bob', 'Brown', 'Marketing', 55000.00, '2018-09-30'),
(5, 'Charlie', 'Davis', 'IT', 70000.00, '2022-02-20');

select * from testing where not Firstname = 'John' and 
not salary = 60000;

select * from testing where salary not between 75000 and 85000;

select * from testing where Department in ('HR', 'IT');

select * from testing where Department not in ('HR', 'IT');

INSERT INTO testing (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(6, 'Nikita', 'Bisht', 'Project Manager', 80000.00, '2024-01-7'),
(7, 'Nimit', 'Negi', 'Developer', 60000.00, '2015-01-23');

INSERT INTO testing (EmployeeID, FirstName, LastName)
VALUES (8, 'Rohit', 'Mehra');

INSERT INTO testing
VALUES (9,'Mahesh', 'Bhatt', 'HR', 73000, '2024-01-21');

select * from INFORMATION_SCHEMA.COLUMNS 
where table_name= 'testing';

INSERT INTO testing
VALUES (10,'Jay', '', 'HR', 73000, '2022-04-04');

SELECT * from testing where Department is NULL;

select * from testing;

create temporary table new_tbl select * from testing;

select * from new_tbl;

SET SQL_SAFE_UPDATES = 0;

update new_tbl set Department = 'HR' where Department is NULL;

update new_tbl set Salary = 89000, HireDate ='2023-01-01'
where EmployeeID = 8;

create temporary table new_tbl1 select * from testing;

select * from new_tbl1;

delete from new_tbl1 where LastName = '' or Department = '0';

create temporary table new_tb select * from testing;
select * from new_tb;

truncate table new_tbl1;

drop table new_tbl1;

select * from testing;
select * from testing limit 2;