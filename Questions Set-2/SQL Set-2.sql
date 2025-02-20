select * from Employees;

select * from Employees where Department = 'IT' and Salary > 75000;

select * from Employees where Department = 'HR' or Salary < 65000;

select * from Employees where Department not in ('Finance');

select * from Employees where Department in ('Finance') and Salary between 60000 and 70000;

select * from Employees where Department = 'IT' and not Salary > 80000;

select * from Employees where Department = 'HR' or Department = 'Finance'
and Salary > 65000;
 
select * from Employees where LastName like 'd%' and Department not in ('HR');

select * from Employees where not Department = 'IT' and Salary>70000;

select * from Employees where Department = 'IT' and 
(Salary>75000 OR FirstName like '%Laura%');

select * from Employees where 
(Salary>75000 or FirstName = 'Laura') and Department in ('IT');

select * from Employees where Department not in ('IT', 'HR');