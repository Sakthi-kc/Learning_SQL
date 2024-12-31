use TestDB;

create table Employee(
	employee_id int,
	firstname varchar(100),
	lastname varchar(100),
	department varchar(10),
	salary int
);

insert into Employee values
	(1, 'John', 'Doe', 'HR', 55000),
	(2, 'Jane', 'Smith', 'IT', 64000),
	(3, 'Bob', 'Johnson', 'IT', 62000),
	(4, 'Alice', 'Williams', 'HR', 540000),
	(5, 'Eva', 'Davis', 'Finance', 58000),
	(6, 'Mike', 'Brown', 'Finance', 59000)
;

select * from Employee;

--List all employees in alphabetical order by lastname
select * from Employee order by lastname asc;


--List all the employees in IT department and sort them by salary in descending
select * from Employee where department = 'IT' order by salary desc;


--Find the total number of employees in each department
select count(*) as dept_emp_count, department from Employee group by department;


--Calculate the avg salary for each department where department sorted in ascending
select avg(salary) as dept_avg_salary, department from Employee group by department order by department;


--Find the department with highest average salary
select top (1) avg(salary) as dept_avg_salary, department 
from Employee 
group by department 
order by dept_avg_salary;


--Find the department with lowest average salary
select top (1) avg(salary) as dept_avg_salary, department 
from Employee 
group by department 
order by dept_avg_salary desc;


--Find department with avg salary > 55000 and having more than 2 employees

update Employee set department = 'IT' where department = 'FINANCE';


--can be printed without adding the having expression in select query. This also works and displays only department
select department
--, avg(salary) as avg_salary , count(*) as total_count 
from Employee 
group by department 
having avg(salary) > 60000 or count(*) > 2;
