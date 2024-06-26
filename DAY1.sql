
# creating table
create table test(
id int ,
name varchar(255),
address varchar(255)
);

# insert value in table
insert into test (id,name ,address) values (1,'nadir','gujrat');
insert into test (id,name ,address) values (2,'rashidi','new delhi');
insert into test (id,name ,address) values (3,'jilani','surat');
insert into test (id,name ,address) values (4,'shivam','baroda');
insert into test (id,name ,address) values (5,'sssss','baroda');


select* from test;
select distinct address from test;
select*from test where address='baroda'
select name ,address from test where address ='baroda'
select id ,name ,address  from test order by id;
select id ,name ,address  from test order by id desc;
select id ,name ,address  from test order by name;

select*from test where id=4 and address='baroda'; 


select*from test where id=4 or address='baroda';

select*from test where  not address ='baroda'

select id,name from test where not address ='baroda'

select * from test where name like 'n%'

select * from test where name not like 'n%'

select id,name from test where id between 1 and  3


select id,name from test where id not  between 1 and  3

select id,address from test where id>3

select id,address from test where not id<3 

select id,name,address from test where id is not null

update test set name='svit'  where id=1
select*from test
update test set name='gtu',address='ahmedabad' where id=3

select top 3*from test
select top 3 id,name from test

--select * from test limit 3;
select min(id) from test
select max(id) from test 

select max(id) as maxid from test

select count(id) as total_no_col from test
select count(*) from test

select count(id) as greater_than_three from test where id>3
select * from test

select count (distinct address) from test

select sum(id) from test

select sum(id)  from test where id>3

select sum(id) from test where id=4 

select sum(id*5) from test

select avg(id) as avg_price from test

select * from test

select id,name,address from test where name like's%' 
select id ,name ,address from  test where name like '%s%'
select id,name,address from test where name like 's%' 
or name like 'r%'

select id,name from test where name like '[sr]%'
select * from test
select id,name ,address from test where address  in 
('baroda','new delhi')

select id,name ,address from test where address not in 
('baroda','new delhi')

select address+name as addressname from test


create table orders(
orderid int,
customerid int,
orderdate date
);

select * from orders
insert into orders (orderid,customerid,orderdate) values
(10308,2,'1996-09-18')
insert into orders (orderid,customerid,orderdate) values
(10309,37,'1996-09-19')
insert into orders (orderid,customerid,orderdate) values
(10310,77,'1996-09-20')

select* from orders


create table customers(
customerid int,
customername varchar(255),
contactname varchar(255),
country varchar(255)
);


select*from customers

insert into customers (customerid,customername,contactname,country)
values (1,	'Alfreds Futterkiste',	'Maria Anders'	,'Germany')

insert into customers (customerid,customername,contactname,country)
values (2,	'Ana Trujillo Emparedados y helados',	'Ana Trujillo'	,'Mexico')

insert into customers (customerid,customername,contactname,country)
values (3,	'Alfreds Futterkiste',	'Maria Anders'	,'Germany')

select * from customers

select * from orders o
join customers c ON o.customerid=c.customerid;

select * from orders o
left join customers c ON o.customerid=c.customerid;

select * from orders o
right join customers c ON o.customerid=c.customerid;

select * from orders o
left join customers c ON o.customerid=c.customerid
union
select * from orders o
right join customers c ON o.customerid=c.customerid;

--union
select customerid from customers
union 
select customerid from orders

select customerid from customers
union 
select orderid from orders

--constraints at the definition of table
create table users (
id integer not null primary key,
name varchar(255) unique,
email varchar(255),
age int ,
check (age>18)
);
select * from users
insert into users (id,name,email,age) values
(1,'Nadir','nadir@gmai.com',22)

insert into users (id,name,email,age) values
(2,'aaa','aaa@gmai.com',32)

insert into users (id,name,email,age) values
(3,'eee','eee@gmai.com',28)

insert into users (id,name,email,age) values
(4,'ddd','ddd@gmai.com',20)

insert into users (id,name,email,age) values
(5,'ggg','ggg@gmai.com',45)


select * from users;





create table order1 (
order1_id int not null primary key,
user_id int ,
foreign key(user_id) references users(id)
);

--using alter we want to add pk and fk
CREATE TABLE pkexample (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
);

alter table pkexample add constraint pkid primary key (id)

CREATE TABLE fkexample (
   Studentid int NOT NULL,
    Age int,
);

alter table fkexample add constraint fkstdid foreign key(Studentid)
references pkexample(id)

create table groupbyexample(
customerid int,
contactame varchar(255),
city varchar(255),
country varchar(255)
);

insert into groupbyexample(customerid,contactame,city,country)
values (1,'new delhi','abulfazal','india')
insert into groupbyexample(customerid,contactame,city,country)
values (2,'aaa','ddd','india')
insert into groupbyexample(customerid,contactame,city,country)
values (3,'ggg','ablgftrd','UK')
insert into groupbyexample(customerid,contactame,city,country)
values (4,'JHJHHF','HGYTF','india')
insert into groupbyexample(customerid,contactame,city,country)
values (5,'khvg','jkygtff','Germany')

select * from groupbyexample

select  count(customerid) , country from groupbyexample group by country

select  count(customerid) , country from groupbyexample group by country
order by count(customerid) desc
