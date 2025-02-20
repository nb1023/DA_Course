create database sql_basics_ques;

use sql_basics_ques;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);

select * from Employees;

select FirstName, LastName from Employees;

select * from Employees where Department = 'IT';

select * from Employees where Salary > 70000;

select * from Employees order by LastName asc;

select distinct(Department) from Employees;

select Department, count(*) as 'Number of employees' from Employees group by Department;

select max(Salary) as 'Max Salary' from Employees;

select avg(Salary) as 'Avg Salary' from Employees where Department = 'Finance';

select * from Employees where LastName like 'm%';