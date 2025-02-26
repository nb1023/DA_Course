create database stud;

use stud;

CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);

INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

select *  from Students;

-- in caseof tie row number is assigned randomly
select *, ROW_NUMBER() OVER(order by marks desc) as 'Row Number'
from Students;

-- if there is a tie next rank/ranks will be skipped
select *, RANK() OVER(order by marks desc) as 'Row Number'
from Students;

-- dense rank - if there is a tie then ranks will not be skipped
select *, DENSE_RANK() OVER(order by marks desc) as 'Row Number'
from Students;

select *, ROW_NUMBER() OVER(PARTITION by subject order by marks desc) as 'Row Number'
from Students;

select *, ROW_NUMBER() OVER(PARTITION by subject order by marks) as 'Row Number'
from Students;

select *, ROW_NUMBER() OVER(PARTITION by student_name order by marks desc) as 'Row Number'
from Students;

select *, RANK() OVER(PARTITION by student_name order by marks desc) as 'Rank'
from Students;

select *, RANK() OVER(PARTITION by subject order by marks desc) as 'Rank'
from Students;

select *, DENSE_RANK() OVER(PARTITION by subject order by marks desc) as 'Rank'
from Students;

select *, DENSE_RANK() OVER(PARTITION by student_name order by marks desc) as 'Rank'
from Students;




















