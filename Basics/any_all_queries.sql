use TestDB;

create table Employees(
	id int,
	name varchar(100),
	dept int,
	salary bigint
);

create table Departments(
	id int,
	deptname varchar(10)
);


insert into Employees values
	(1, 'Ram', 1, 1000),
	(2, 'Rajesh', 2, 2000),
	(3, 'Ravi', 3, 1700),
	(4, 'Surya', 1, 1200),
	(5, 'Tanya', 3, 1455);


--As is required for the outer query to reference a table
select dept, AvgSalary from (select dept, avg(salary) as AvgSalary from Employees group by dept) as DerivedValue;


--Select emplooyees whose salary is greater than any of the department avg salary
select * from Employees where salary > any
( select AvgSalary from (select avg(salary) as AvgSalary from Employees group by dept) as DerivedValue );


--Select emplooyees whose salary is greater than or equal to all of the department avg salary
select * from Employees where salary >= all
( select AvgSalary from (select avg(salary) as AvgSalary from Employees group by dept) as DerivedValue );
