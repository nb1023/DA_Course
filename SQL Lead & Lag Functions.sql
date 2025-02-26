create database Profit;

use Profit;

-- Create a table to store monthly profit data for different products
CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);

select * from ProfitData;

-- add a new column that shows next month's profit for each product
select * , Lead(Profit) over(partition by product order by monthnumber) as 'Next 
months Profit' from ProfitData;

-- we don't want product column output but we want each month's total profit to be shown by 
-- monthnumber and monthname and also a new column should be added to show next month
-- total profit
select MonthNumber, MonthName, sum(Profit) as 'Total Profit',
LEAD(sum(Profit)) over(order by MonthNumber) as 'Total Profit of next month'
from ProfitData 
group by MonthNumber, MonthName
order by MonthNumber;

-- add a new column that shows previous month's profit for each product
select * , LAG(Profit) over(partition by product order by monthnumber) as 'Previous 
months Profit' from ProfitData;

-- we don't want product column output but we want each month's total profit to be shown by 
-- monthnumber and monthname and also a new column should be added to show previous month
-- total profit
select MonthNumber, MonthName, sum(Profit) as 'Total Profit',
LAG(sum(Profit)) over(order by MonthNumber) as 'Total Profit of previous month'
from ProfitData 
group by MonthNumber, MonthName
order by MonthNumber;