

-- Select everything from sales table

select * from sales;

-- Show just a few columns from sales table

select Date, Amount, Customers from sales;
select Amount, Customers, GeoID from sales;

-- Adding a calculated column with SQL

SELECT 
    Date,
    Amount,
    Boxes,
    FORMAT(
      CAST(Amount AS DECIMAL(10,2)) / NULLIF(Boxes, 0), 
      'N2'
    ) AS AmountPerBox
FROM sales;




-- Using WHERE Clause in SQL

select * from sales
where amount > 10000;

-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales
where amount > 10000
order by amount desc;

-- Showing sales data where geography is g1 by product ID &
-- descending order of amounts

select * from sales
where GeoID='g1'
order by PID, Amount desc;

-- Working with dates in SQL

Select * from sales
where amount > 10000 and Date >= '2022-01-01';

-- Using year() function to select all data in a specific year

select Date, Amount from sales
where amount > 10000 and year(Date) = 2022
order by amount desc;

-- BETWEEN condition in SQL with < & > operators

select * from sales
where boxes >0 and boxes <=50;

-- Using the between operator in SQL

select * from sales
where boxes between 0 and 50;

-- Using weekday() function in SQL

SELECT 
    Date,
    Amount,
    Boxes,
    DATENAME(WEEKDAY, Date) AS [Day of week]
FROM sales
WHERE DATEPART(WEEKDAY, Date) = 5; -- 5 is Thursday by default (Sunday=1)

-- Working with People table

select * from people;

-- OR operator in SQL

select * from people
where team = 'Delish' or team = 'Jucies';

-- IN operator in SQL

select * from people
where team in ('Delish','Jucies');

-- LIKE operator in SQL

select * from people
where Sales_person like 'B%';

select * from people
where Sales_person like '%B%';

select * from sales;

-- Using CASE to create branching logic in SQL

select 	Date, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;

-- GROUP BY in SQL

select team, count(*) from people
group by team

Select * from sales
select * from products;


EXEC sp_rename 'sales.Sales_Person', 'SPID', 'COLUMN';

EXEC sp_rename 'sales.Geo', 'GeoID', 'COLUMN';

EXEC sp_rename 'sales.Product', 'PID', 'COLUMN';

EXEC sp_rename 'Products.Product_ID', 'PID', 'COLUMN';

EXEC sp_rename 'people.SP_ID', 'SPID', 'COLUMN';

select * from people;
select * from sales

select s.Date , s.amount,p.Sales_person
from sales as s
join people as p on p.SPID=s.SPID; 



select * from sales ;
select * from products;

select s.Date,s.Amount,pr.product
from sales as s
left join products as pr on pr.PID=s.PID;


-- join multiple table 

select s.Date , s.amount,p.Sales_person,pr.Product,p.Team
from sales as s
join people as p on p.SPID=s.SPID
left join products as pr on pr.PID=s.PID;

--Group by

select GeoID,sum(amount)
from sales
group by GeoID

select g.geo,sum(amount),avg(amount),sum(boxes)
from sales s
join geo g on s.GeoID=g.GeoID
group by g.geo;


--  Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
select * from sales;
SELECT Date, Amount, Boxes
FROM sales
WHERE Amount > 2000 AND Boxes < 100;

--How many shipments (sales) each of the sales persons had in the month of January 2022?
select * from sales;

SELECT p.Sales_Person, COUNT(*) AS Number_of_Shipments
FROM sales AS s
JOIN people AS p ON p.SPID = s.SPID
WHERE s.Date >= '2022-01-01' AND s.Date < '2022-02-01'
GROUP BY p.Sales_Person;
select * from people;

-- Which product sells more boxes? Milk Bars or Eclairs?

select * from products;
select * from sales;

select pr.Product,s.Boxes
from sales as s
join products as pr on pr.PID=s.PID