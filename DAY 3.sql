create table employee(
id  int identity(1,1),
name varchar(30),
age int,
joining datetime
);

create table salary (
id int ,
emp_id int,
salary real,
salary_date datetime
);

alter table employee add constraint pkid primary key (id)

alter table salary add constraint fkid foreign key(id)
references employee(id)

insert into employee values
('aaa',25,'01-jan-2023')
insert into employee values
('ppp',35,'01-june-2023')
insert into employee values
('bbb',22,'01-april-2023')
insert into employee values
('ddd',20,'01-feb-2023')
insert into employee values
('abp',19,'06-dec-2023')

select * from employee

insert into salary(id,emp_id,salary,salary_date)
values (1,'1','10000','01-jan-2023') 

select * from salary

insert into salary(id,emp_id,salary,salary_date)
values (2,'2','15000','01-june-2023') 

insert into salary(id,emp_id,salary,salary_date)
values (3,'3','1000','01-april-2023') 

insert into salary(id,emp_id,salary,salary_date)
values (4,'4','10000','01-feb-2023') 

insert into salary(id,emp_id,salary,salary_date)
values (5,'5','10050','06-dec-2023') 


select * from salary

select * from (
select 
employee.name,
FORMAT(salary.salary_date,'MMMM')as month,
salary.salary
from
employee
join
salary on employee.id=salary.emp_id ) as tab1
pivot ( sum(salary) for month in ([January], [June],[April],[February],[December])) 
as pivottable



create or alter function result(@salary real)
	returns table
	as
return(select id ,emp_id,salary from salary where salary > @salary)
	go

select * from dbo.result(10000)

create or alter function get(@salary real)
returns table
as
return (
		select employee.id,employee.name,salary.salary,month(salary_date) as mon
		from employee
		inner join salary on employee.id = salary.emp_id
		where @salary <= salary
		AND month(salary_date) =3
		AND name (like 'a%' or name like 'p%')
		)
GO

select * from get(10000)


create table tt2
(id  uniqueidentifier  default newid() primary key,
name varchar(24), 
);
insert into tt2 (name) values ('nadir')
insert into tt2 (name) values ('aaaaa')
insert into tt2 (name) values ('bbbbb')
insert into tt2 (name) values ('fffff')
select * from tt2
CREATE TABLE fke2(
   id uniqueidentifier,
    Age int,
);
select *from fke2

alter table fke2 add constraint fkuid foreign key(id)
references tt2(id)
