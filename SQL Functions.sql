create database salesData;

use salesData;

CREATE TABLE sales(
ProductId INT,
SaleDate Date,
Quantity INT,
TotalAmount DECIMAL(10,2),
CustomerID INT,
StoreID INT,
SalespersonID INT,
PaymentMethod VARCHAR(50)
);

INSERT INTO sales(ProductId, SaleDate, Quantity, 
TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 1, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),
(3, '2023-08-04', 12, 300.00, 106, 1, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 1, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),
(3, '2023-08-05', 15, 375.00, 109, 1, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 1, 203, 'Credit Card');

select * from sales;

select max(TotalAmount) as 'Maximum Amount' from sales;
select max(SaleDate) as 'Max Sale Date' from sales;

-- Maximum quantity sold for each productID
select ProductId, max(Quantity) as 'Max Quantity' from sales group by ProductId;

-- Maxiumum TotalAmount for all distinct dates in saledate column
select SaleDate, max(TotalAmount) as 'Max TotalAmount' from sales group by SaleDate;

select min(Quantity) as 'Minimum Quantity' from sales;
select min(SaleDate) as 'Minimum Sale Date' from sales;

-- Minimum TotalAmount for all distinct StoreID 
select StoreID, min(TotalAmount) as 'Minimum total Amount' from sales group by StoreID; 

select sum(Quantity) as 'Sum of quantity' from sales;

select sum(Quantity) as 'Sum of quantity', sum(TotalAmount) as 'sum of totalamount'
 from sales;
 
select avg(Quantity) as 'avg of quantity' from sales;

-- Sum of quantity, sum of totalamount, avg of quantity, avg of totalamount for each distinct product
select ProductID, sum(Quantity) as 'Sum of quantity', sum(TotalAmount) as 'sum of totalamount'
, avg(Quantity) as 'avg of quantity', avg(TotalAmount) as 'avg of TotalAmount' 
from sales group by ProductID;

select count(*) as 'Number of rows' from sales;

select count(PaymentMethod) as 'Number of Records' from sales;

select count(distinct(ProductID)) as 'Distinct products' from sales;

select PaymentMethod, count(distinct(PaymentMethod)) as 'Distinct PaymentMethod' 
from sales group by PaymentMethod;

select PaymentMethod, count(PaymentMethod) as 'PaymentMethod' 
from sales group by PaymentMethod;

select PaymentMethod, count(*) as 'PaymentMethod' 
from sales group by PaymentMethod;

select PaymentMethod, sum(TotalAmount) as 'Sum of totalAmount' 
from sales group by PaymentMethod;

select ProductID, PaymentMethod, sum(TotalAmount) as 'Sum of totalAmount' 
from sales group by ProductID, PaymentMethod order by ProductID;

SELECT ProductID, sum(TotalAmount), sum(Quantity), avg(TotalAmount), avg(Quantity)
from sales group by ProductID having sum(TotalAmount) < 700 and sum(Quantity) = 21;

select * from sales where TotalAmount >= 161;

select ProductID, sum(TotalAmount) from sales group by ProductID
having sum(TotalAmount) < 700;

select ProductID, sum(TotalAmount) from sales where TotalAmount>=161 
group by ProductID
having sum(TotalAmount) >=250 order by ProductID desc;

create table table1 (c1 int, c2 varchar(50));

insert into table1 values 
(1, 'A'),
(1, 'B'),
(2, 'C'),
(NULL, 'D'),
(3, 'E'),
(7, 'DA');

create table table2 (c1 int, c3 varchar(50));

insert into table2 values 
(1, 'XA'),
(2, 'MB'),
(2, 'NX'),
(NULL, 'MO'),
(4, 'XY'),
(5, 'TF');

select * from table2;
select * from table1 inner join table2 on table1.c1 = table2.c1;

select a.c1, a.c2, b.c3 from table1 as a inner join table2 as b on a.c1 = b.c1;