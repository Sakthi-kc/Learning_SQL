use TestDB;

/*
	In SQL, a view is a virtual table based on the result-set of an SQL statement
	It doesn't take any storage space, it executes the query on call and returns latest results from the table
	A view always shows up-to-date data. The database engine recreates the view, every time a user queries it
	Direct insert/update/delete on view will fail when aggregate function or distinct value is choosen in the query
*/

create table Employees(
	id int primary key,
	empname varchar(100),
	dept int,
	experience int
);

create table Departments(
	id int primary key,
	deptname varchar(10),
);


insert into Employees values
	(1, 'Sarath', 3, 4),
	(2, 'Sophia', 3, 1),
	(3, 'Gopi', 1, 5),
	(4, 'Sudha', 4, 8),
	(5, 'Sethu', 4, 3),
	(6, 'Deepa', 6, 8);

insert into Departments values
	(1, 'DataMgmt'),
	(2, 'DataEngg'),
	(3, 'Fin'),
	(4, 'HR'),
	(5, 'ProdOwners'),
	(6, 'Ops');

--Create view
create view Emp_details as
select emp.empname, dept.deptname, emp.experience from Employees emp
join Departments dept
on emp.dept = dept. id;

select * from Emp_details;

--Altering table data
insert into Employees values (7, 'Johnson', 2, 2);

--Returns output with the above employee as the query is executed everytime
select * from Emp_details;


--Alter view 
alter view Emp_details as
select emp.empname, dept.deptname, cast(emp.experience as varchar) + ' years' as experience 
from Employees emp
join Departments dept
on emp.dept = dept. id;


--Insert on view can be done when it referes to only 1 table
create view Senior_emps as
select empname, concat(experience, ' years') as experience from Employees
where experience > 3;

select * from Senior_Emps;

-- insert fails bcoz experience is a dervied column, in this case insert to base table
insert into Senior_Emps values ('Vinay', 4); 

drop view Senior_Emps;


--Redo

--When we insert directly into view it is added to base table also. Since id is primary key we need to insert that value mandatory.
create view Senior_emps as
select id, empname, experience from Employees
where experience > 3;

insert into Senior_emps values (8, 'Vinay', 4); 

select * from Senior_emps;

select * from Employees;


--Update view
update Senior_emps
set empname = 'Carley'
where empname = 'Gopi';

select * from Senior_emps;

select * from Employees;


--Delete from view table
delete from Senior_emps where experience = 4;