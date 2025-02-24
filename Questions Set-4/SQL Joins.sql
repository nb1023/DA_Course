select * from Customers;
select * from Orders;
select * from Products;

-- Identify pairs of customers who live in the same country
select a.CustomerName, b.CustomerName from Customers as a join Customers as b
on a.Country = b.Country and a.CustomerID<>b.CustomerID and a.CustomerID > b.CustomerID;

-- Find the customer who has spent the most on their orders
select CustomerName from (select CustomerName, sum(price) as 'Amount spent',
DENSE_RANK() over(order by sum(price) desc) as 'DR' from Customers as c inner join 
Orders as o on c.CustomerID = o.CustomerID inner join Products as p on o.ProductID = 
p.ProductID group by CustomerName) as m where DR = 1;

-- Find customers who have ordered more than one type of products
select CustomerName from Customers as c join Orders as o on 
c.CustomerID = o.CustomerID group by CustomerName
having count(ProductID) > 1;

-- List all products and their corresponding orders, using a right join, including 
-- products that have never been ordered
select OrderID, p.ProductID, ProductName from Orders o right join Products p on 
o.ProductID = p.ProductID;

-- Retrieve all orders placed by customers from the USA
select OrderID from Customers as c inner join Orders as o on 
c.CustomerID =o.CustomerID where Country = 'USA';

-- Find the names of customers who have ordered a product priced above $500
select distinct(CustomerName)  from Customers as c inner join 
Orders as o on c.CustomerID = o.CustomerID inner join Products as p on o.ProductID = 
p.ProductID where Price > 500;

-- find customers who hav eordered the same product more than once
select distinct m.CustomerName from (select CustomerName, ProductID, count(OrderID) from Customers as c join Orders as o on 
c.CustomerID = o.CustomerID group by CustomerName, ProductID having count(OrderID)>1) m;