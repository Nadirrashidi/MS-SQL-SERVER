CREATE TABLE EMPLOYEE(
Emp_Id INT,
Emp_Name VARCHAR(50),
Emp_Salary INT,
Emp_City VARCHAR(50),
Emp_State VARCHAR(50)
);
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1001,	'Akshay',	20000,	'Noida','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1002,	'RAM',	3500,	'JAIPUR','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1003,	'SHAYAM',	2500,	'GURGAON','U.P')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1004,	'MIRA',	3500,	'OLD DEHI','Delhi')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1005,	'AAAA',	5400,	'MAHARASTRA','MUMBAI')
INSERT INTO EMPLOYEE(Emp_Id,Emp_Name,Emp_Salary,Emp_City,Emp_State)
VALUES (1006,	'MOHAN',	6333,	'VADORA','GUJRAT')

SELECT * FROM EMPLOYEE

-- CREATION OF INDEX ON SINGLE COLOUMN
CREATE INDEX INDX ON EMPLOYEE(EMP_STATE)
--CREATION OF INDEX ON MULTI COLUMN
CREATE INDEX INDX2 ON EMPLOYEE(EMP_ID,EMP_NAME)
--CREATION OF UNIQUE INDEX 
CREATE UNIQUE INDEX UNINDX ON EMPLOYEE(EMP_ID)

-- RENAME THE INDEX
-- ALTER INDEX old_Index_Name RENAME TO new_Index_Name
-- ALTER INDEX UNINDX RENAME TO PKINDX

-- DROP INDEX
--ALTER TABLE Table_Name DROP INDEX Index_Name;
-- ALTER TABLE EMPLOYEE DROP INDEX UNINDX

-- STORE PROCEDURE
--1.CREATION OF STORE PROCEDURE
CREATE PROCEDURE SelectAllCustomers
AS BEGIN
SELECT*FROM EMPLOYEE
END;
--USING PROCEDURE
EXEC SelectAllCustomers

CREATE PROCEDURE selectidname
AS BEGIN
SELECT EMP_ID,EMP_NAME FROM EMPLOYEE
END;

EXEC selectidname

-- STORE PROCEDURE WITH ONE PARAMETER
CREATE TABLE CUST(
CustomerID INT,
CustomerName VARCHAR(20),
City VARCHAR(20),
PostalCode INT,	
Country VARCHAR(20)
);

INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(1,'Alfreds',	'Berlin',	12209	,'Germany')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(2,'Ana',	'Mexio',	05610	,'Mexio')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(3,'Alf',	'london',	98765	,'london')
INSERT INTO CUST(CustomerID,CustomerName, City,	PostalCode,	Country)
VALUES(4,'fggds',	'lulea',	12458	,'uk')

select * from CUST

CREATE PROCEDURE SelectAll @City varchar(20)
AS BEGIN
SELECT * FROM CUST WHERE City = @City
END;

EXEC SelectAll @City = 'london';

create procedure selectallonid @CustomerID int
AS BEGIN
SELECT * FROM CUST WHERE CustomerID=@CustomerID
END

exec selectallonid  @CustomerID=4

-- store procedure with multiple parameter
CREATE PROCEDURE SelectAllmultipara @City varchar(20),@Country varchar(20)
AS BEGIN
SELECT * FROM Cust WHERE City = @City AND Country = @Country
END

EXEC SelectAllmultipara @City='Berlin',@Country='Germany'

-- Dynamic qureies
Declare @sqlQry varchar(4000)
SET @sqlQry='Select CustomerID,CustomerName,city from cust'
EXEC(@sqlQry)

Declare @var varchar(4000)
set @var='select CustomerID,CustomerName from cust'
Exec(@var)

--Dynamic SQL Using Table Name as Dynamic
Declare @sql varchar(4000)
Declare @tblName varchar(4000)='Cust'
SET @sql='select CustomerID,CustomerName from '+@tblName
EXEC(@sql)

--Dynamic SQL Using Col as dynamic
Declare @Qry varchar(4000)
Declare @tblcol varchar(50)='CustomerID,CustomerName'
SET @Qry='Select '+ @tblcol +' from Cust '
EXEC(@Qry)

--pivoting the  table
CREATE TABLE emp2 (
    emp_id int NOT NULL,
    Name varchar(255) NOT NULL,
);
alter table emp2 add constraint pk_emp_id primary key (emp_id)
insert into emp2(emp_id,name) values
(1,'nadir')
insert into emp2(emp_id,name) values
(2,'ttt')
insert into emp2(emp_id,name) values
(3,'ppp')
insert into emp2(emp_id,name) values
(4,'nnn')
insert into emp2(emp_id,name) values
(5,'hhh')
select * from emp2

CREATE TABLE salary (
   id int NOT NULL,
   emp_id int,
   salary int,
   salary_date date
);
alter table salary add constraint fk_emp_id foreign key(emp_id)
references emp2(emp_id)

insert into salary(id,emp_id,salary,salary_date) values
(1,1,8000,'1-jan-2019')
select * from salary
insert into salary(id,emp_id,salary,salary_date) values
(2,2,1067,'2-march-2019')
insert into salary(id,emp_id,salary,salary_date) values
(3,3,8877,'15-jan-2019')
insert into salary(id,emp_id,salary,salary_date) values
(4,4,7865,'5-apr-2019')
insert into salary(id,emp_id,salary,salary_date) values
(5,5,3000,'25-apr-2019')

select * from salary   

create table pivotexample
( year int,
  region varchar(255),
  sales int
);

insert into pivotexample(year,region,sales) values
(2019,'north',1500)
insert into pivotexample(year,region,sales) values
(2019,'soutg',1900)
insert into pivotexample(year,region,sales) values
(2020,'north',900)
insert into pivotexample(year,region,sales) values
(2020,'south',2200)

select * from pivotexample

select year,north,south from (select year,region,sales from pivotexample) as demo
pivot
(SUM(Sales) FOR Region IN (North, South)) AS Tab2


select Region, [2019],[2020] from
(SELECT Region, [Year], Sales FROM pivotexample) AS aaa
pivot
(SUM(Sales) FOR [Year] IN ([2019], [2020])) AS bbb  

select * from cust
---views virtual table

CREATE VIEW [viewkanaam] AS
SELECT CustomerID, CustomerName
FROM cust
WHERE Country = 'Germany';

select * from viewkanaam

--update view
ALTER  VIEW [viewkanaam] AS
SELECT CustomerID, CustomerName,City
FROM Cust
WHERE Country = 'Germany';

select * from viewkanaam

--Drop view
-- drop view viewname 

-- user defined functions
--1.Scalar Functions
--2.Table Valued Functions

create table std(
Rno int,
marks int,
name varchar(20)
);

insert into std(Rno,marks,name) values
(1,60,'Ram')
insert into std(Rno,marks,name) values
(2,50,'Ganesh')
insert into std(Rno,marks,name) values
(3,55,'sham')
insert into std(Rno,marks,name) values
(4,70,'Raj')

 

create or alter function first(@Rno int,@marks int)
	returns varchar(20)
	as
	begin
return(select name from std where Rno=@Rno and marks=@marks)
	end


select dbo.first(1,60);

--table valued function
create or alter function sal(@Rno int)
	returns table
	as
return(select name, marks from std where Rno= @Rno)
	go

select * from dbo.sal(1)

--PIVOT TABLE
create table sales (
id int,
year int,
product varchar(20),
sale int
);
insert into sales (id ,year,product,sale) values
(1,2021,'pen',89)

insert into sales (id ,year,product,sale) values
(2,2022,'pen',88)

insert into sales (id ,year,product,sale) values
(3,2022,'pencil',67)

insert into sales (id ,year,product,sale) values
(4,2020,'nouse',68)

insert into sales (id ,year,product,sale) values
(5,2020,'cpu',65)

insert into sales (id ,year,product,sale) values
(6,2022,'cpu',78)

insert into sales (id ,year,product,sale) values
(7,2021,'pencil',76)

insert into sales (id ,year,product,sale) values
(8,2022,'mouse',56)

insert into sales (id ,year,product,sale) values
(9,2022,'cpu',78)

insert into sales (id ,year,product,sale) values
(10,2021,'pen',100)

insert into sales (id ,year,product,sale) values
(11,2020,'pen',11)

insert into sales (id ,year,product,sale) values
(12,2020,'pencil',90)

insert into sales (id ,year,product,sale) values
(13,2021,'pen',89)

insert into sales (id ,year,product,sale) values
(14,2022,'pen',88)

insert into sales (id ,year,product,sale) values
(15,2022,'pencil',67)



select * from sales

select * from sales
pivot (
sum([sale])
for [product]
in (
[pen],
[pencil],
[mouse],
[cpu]
)
) as pivottable

select * from 
(select year,product,sale from sales) resultset
pivot (
sum([sale])
for [product]
in (
[pen],
[pencil],
[cpu]
)
) as pivottable
select newid()
-- pagination 
CREATE PROCEDURE getdatawithpagesize
@Page int,
@Size int
as 
BEGIN
declare @startrow int,
@endrow int

set @startrow=((@Page-1)*@Size)+1;
set @endrow=@Page*@Size;
with getdata as (
select ROW_NUMBER() over (order by id) as srno,* from sales
)
select * from getdata where srno between @startrow and @endrow
end

exec getdatawithpagesize 1,5 -- 1 =page ,5=size 


