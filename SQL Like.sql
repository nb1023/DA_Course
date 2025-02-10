create table employee_u(
Employee_id int primary key,
Firstname varchar(50),
Lastname varchar(50),
Department varchar(50));

insert into employee_u(Employee_id, Firstname, Lastname, Department) values
(1, 'Alice', 'Smith', 'Finance'),
(2, 'Bob', 'Johnson', 'Engineering'),
(3, 'Charlie', 'Williams', 'Marketing'),
(4, 'Diana', 'Brown', 'Finance'),
(5, 'Edward', 'Jones', 'Engineering'),
(6, 'Fiona', 'Gracia', 'Marketing'),
(7, 'George', 'Miller', 'Finance'),
(8, 'Hannah', 'Wilson', 'Engineering');

select * from employee_u;

-- wildcards 
-- %  - it may represent 0,1 or multipple characters
-- _ - it reperesent only 1 character

-- Find employees whose last name starts with 'S'.
select * from employee_u where Lastname like 'S%';

-- Find employee whose first name ends with 'a'
select * from employee_u where Firstname like '%a';

-- Find employee whose department contains'Eng';
select * from employee_u where Department like '%Eng%';

-- Find employees whose last name is exactly 5 characters long
select * from employee_u where Lastname like '_____';

-- Find employees whose first name starts with C or D;
select * from employee_u where Firstname like 'C%' or Firstname like 'D%';

-- Find employee whose last name contains 'son'
select * from employee_u where Lastname like '%son%';

-- Find the employee whose Firstname contains the letter 'i' as the second character
select * from employee_u where Firstname like '_i%';

-- Find employees whose lastname starts with any letter between 'a' and 'l'
SELECT * FROM employee_u WHERE Lastname REGEXP '^[A-La-l]';

-- Find employee whose firstname does not contain 'o'
select * from employee_u where Firstname not like '%o%';

-- Find employee whose last name ends with a and is exactly 5 characters long
select * from employee_u where Lastname like '____a';

-- Find employee whose department starts with 'Mar' and ends with 'ing'
select * from employee_u where Department like 'Mar%ing';

-- Find employees whose firstname has an 'a' in the third position
select * from employee_u where Firstname like '__a%';

-- Find Employee whose last name starts with Br or Bl
select * from employee_u where Lastname like 'Br%' or Lastname like 'Bl%';

-- Find employees whose firstname starts with a vowel
SELECT * FROM employee_u WHERE LOWER(Firstname) REGEXP '^[aeiou]';

-- Find Employee whose first name start with a consonant;
SELECT * FROM employee_u WHERE LOWER(Firstname) REGEXP '^[^aeiou]';
