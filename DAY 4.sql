--- with claue 

create table data (
id int,
name varchar(24),
age int ,
salary int 
);

insert into data values(101 , 'raja', 25,55452)
insert into data values(102 , 'roja', 29,66452)
insert into data values(103 , 'raj', 35,77452)

select * from data 

WITH CTE  as (select id ,name ,age , salary from data ) 
Select * from CTE;


---CTE FOR MULTIPLE TABLE 

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


INSERT INTO CUSTOMERS VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 ),
(4, 'Chaitali', 25, 'Mumbai', 6500.00 ),
(5, 'Hardik', 27, 'Bhopal', 8500.00 ),
(6, 'Komal', 22, 'Hyderabad', 4500.00 ),
(7, 'Muffy', 24, 'Indore', 10000.00 );

WITH CUSTOMER_AGE AS (
SELECT * FROM customers WHERE AGE = 23)
SELECT ID, NAME, AGE FROM CUSTOMER_AGE;

WITH
CUSTOMERS_IN_DELHI AS (
   SELECT * FROM CUSTOMERS WHERE ADDRESS = 'Delhi'),
CUSTOMERS_IN_MUMBAI AS (
   SELECT * FROM CUSTOMERS WHERE ADDRESS = 'Mumbai')
SELECT ID, NAME, ADDRESS FROM CUSTOMERS_IN_DELHI
UNION ALL
SELECT ID, NAME, ADDRESS FROM CUSTOMERS_IN_MUMBAI;

WITH recursive_cust (ID, NAME, ADDRESS, AGE) AS (
   SELECT ID, NAME, ADDRESS, AGE
   FROM CUSTOMERS
   WHERE SALARY > 3000
   UNION ALL
   SELECT ID, NAME, ADDRESS, AGE
   FROM CUSTOMERS
   WHERE AGE > 25
)
SELECT * FROM recursive_cust;