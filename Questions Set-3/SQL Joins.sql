create database sql_joins;

use sql_joins;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);


-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);

select * from Customers;

select * from Orders;

select * from Products;

select distinct(a.CustomerName) from Customers as a inner join Orders as b where 
a.CustomerID = b.CustomerID;

select distinct CustomerName from customers c inner join Orders o on o.CustomerID = c.CustomerID;

select distinct CustomerName from Customers c left join Orders o 
on O.CustomerID = C.CustomerID where o.OrderID is null;

select distinct(ProductName), Price FROM Orders as o left join Products as p
on o.ProductID = p.ProductID;

select distinct CustomerName,OrderID from Customers c 
left join Orders o on o.CustomerID = c.CustomerID;

select distinct p.ProductID, ProductName from Products p left join Orders as o on 
p.ProductID = o.ProductID where o.OrderDate is null;

select CustomerName, count(OrderID) as 'Number of Orders' from Customers c
left join Orders o on c.CustomerID = o.CustomerID group by CustomerName;

select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID 
left join Products p on o.ProductID = p.ProductID;