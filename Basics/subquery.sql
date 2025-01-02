use TestDB;

create table Employees(
	employee_id int primary key,
	firstname varchar(100),
	lastname varchar(100),
	department_id int
);

insert into Employees values
	(1, 'John', 'Doe', 2),
	(2, 'Jane', 'Smith', 3),
	(3, 'Bob', 'Johnson', 3),
	(4, 'Alice', 'Williams', 2),
	(5, 'Eva', 'Davis', 1),
	(6, 'Mike', 'Brown', 1);

create table Departments(
	id int primary key,
	department_name varchar(50),
	salary bigint
);


insert into Departments values
	(1, 'Finance', 40000),
	(2, 'HR', 54000),
	(3, 'IT', 27000);



--Query
select e.firstname, e.lastname, d.department_name, d.salary from Employees e
join Departments d
on e.department_id = d.id
where d.department_name = 'IT';

--Subquery
select firstname, lastname
from Employees
where department_id = (select id from Departments where department_name = 'IT' );


select firstname, lastname
from Employees
where department_id in (select id from Departments where department_name in ('IT', 'Finance'));

select * from Departments where salary > (select avg(salary) from Departments);

create table Locations(
	location_id int primary key,
	city varchar(50)
);

alter table Departments add city varchar(50);

insert into Locations values
	(1, 'New York'),
	(2, 'Jersey');

update Departments set city = Case
	When id = 1 then 2
	When id = 2 then 2
	Else 1
End;


--select employees who work from Jersey order by FirstName
select firstname, lastname from Employees where department_id in 
(select id from Departments where city = 
(select location_id from Locations where city = 'Jersey'))
order by firstname;

--create a table with structure without data by using unsatisfied where condition
select firstname, lastname into JerseyEmployees from Employees where 1=0;

select * from JerseyEmployees;

--insert records into the table with select query
insert into JerseyEmployees
select firstname, lastname from Employees where department_id in 
(select id from Departments where city = 
(select location_id from Locations where city = 'Jersey'))
order by firstname;

alter table JerseyEmployees add city varchar(50);

--update city as Jersey
update JerseyEmployees set city = (select city from Locations where location_id = 2);
