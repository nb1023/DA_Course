-- isnull and coalesce function
create database profit_db;

use profit_db;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);

select * from Customers;
-- check the first value is null if it is null then the second argument is returned
-- else if not then the first argument is returned
SELECT IFNULL(NULL, 'value null'); -- Returns 'value null'

SELECT IFNULL('abx', NULL); -- Returns 'abx'

SELECT IFNULL(NULL, NULL); -- Returns NULL

-- coalesce - returns the first non null value

select coalesce('a','b','c');

select coalesce(null,'b','c');

select Customerid, email, phonenumber from Customers;

select Customerid, IFNULL(email, 'Email NA'), IFNULL(phonenumber,'PH NO NA')
from Customers;

-- if email is not available then show phone no if phone no not available show email
-- if both not null then print Contact NA
select Customerid, coalesce(email, phonenumber, 'Contact NA') from Customers;

