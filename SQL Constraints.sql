create database constraints;

use constraints;

-- CASE 1 : Create new table

create table test_not_null(
EID int not null,
age tinyint,
firstname varchar(256)
);

select * from test_not_null;

select * from INFORMATION_SCHEMA.columns 
where TABLE_NAME like 'test_not_null';

insert into test_not_null values(1,23,'Mayank');
insert into test_not_null values(null,23,'Mayank');
insert into test_not_null values(1,null,'Mayank');

-- CASE 2 : Table aleady exists
-- we want to make firstname column nullable

alter table test_not_null
modify column firstname varchar(256) not null;

insert into test_not_null values(21,34,null);

-- cannot mmodify age coluumn because it alreayd consist of null value

-- UNIQUE CONSTRAINT - it ensure that a column consist of unique values

-- case 1 : we need to create the table
create table test_unique(SID int unique,
age tinyint not null,
firstname varchar(256) not null unique,
lastname varchar(256));

select * from test_unique;

insert into test_unique values(1,22,'Mayank', 'mehra');
insert into test_unique values(1,24,'Rohit', 'Jain');
insert into test_unique values(null,34,'Akhil', 'Jain');
insert into test_unique values(null,34,'Akhil', 'Jain');

-- case 2 : already existing table

truncate table test_unique;

alter table test_unique 
add unique(lastname);

-- CHECK CONSTRAINT
-- it checks for certain condition that can be applied on columns of the table,
-- if this condition is not fulfilled we will not be able to insert the records into the table

-- case 1 : table doesn't exist
create table test_check(
EID int,
firstname varchar(256),
age tinyint check(age>=10));

select * from test_check;

insert into test_check values (1, 'Mayank', '20');
insert into test_check values (2, 'Raj', '9');

set SQL_SAFE_UPDATES = 0;

update test_check set EID = 11 where EID = 1;
-- case 2 : table exists and we want to add check constraint
alter table test_check 
add check (EID>5);

insert into test_check values (3,'kullu' , 34);
insert into test_check values (30,'kullu' , 34);

-- Default Constraints
-- This constraint is used to provide default values to columns

-- case 1: table does not exist
create table test_default(
EID int default 5,
firstname varchar(256) default 'Rohit',
lastname varchar(256),
age tinyint
);

select * from test_default;

insert into test_default values (1,'Nikita', 'Bisht', 21);
insert into test_default (lastname, age) values ('Singh', 24);

insert into test_default (lastname) values ('Jain');


-- case 2 - table exist

ALTER TABLE test_default 
ALTER COLUMN age SET DEFAULT 25;

insert into test_default (lastname) values ('Grover');

-- PRIMARY KEY

-- case 1 : create table
create table test_pk (
eid int primary key,
gender char(1),
age tinyint,
firstname varchar(256)
);

insert into test_pk values (1,'M', 23, 'Mayank');
insert into test_pk values (2,'F', 19, 'Priya');
insert into test_pk values (1,'F', 19, 'Priya');
insert into test_pk values (null,'F', 19, 'Priya');
select * from test_pk;
truncate table test_pk;
-- case 2 : table already exist

alter table test_pk 
add primary key (age);

create table test_pk_2(
sid int not null unique,
firstname varchar(256),
age tinyint not null
);

alter table test_pk_2 
add primary key (sid,age);

-- FOREIGN KEY

-- case 1 : create new table 

create table test_primary_key(
id int primary key,
name varchar(256)
);

insert into test_primary_key values (1, 'Mayank'), (2, 'Raj'), (3,'Jayant');

select * from test_primary_key;

CREATE TABLE test_fk1_key (
    id INT,
    course_name VARCHAR(256),
    CONSTRAINT fk_test FOREIGN KEY (id) REFERENCES test_primary_key(id)
);

insert into test_fk1_key values (1, 'A');
insert into test_fk1_key values (null, 'B');
insert into test_fk1_key values (5, 'C');

select * from test_fk1_key;

-- case 2 : table already exists

create table test_fk_2(id int, course varchar(256));

alter table test_fk_2
add foreign key(id) references test_primary_key(id);

