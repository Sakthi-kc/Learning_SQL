use TestDB;

/*
	Joins are used to combine 2/> tables based on related column between them
		# Inner join combines rows that have matching col values in both the tables
		# Left outer join returns all records from the left table, and the matched records from the right table else null for right col
		# Right outer join returns all records from the right table, and the matched records from the left table else null for left col	
		# Full outer join returns all records when there is a match in either left or right table and null for unmatched cols
		# Self join is a regular join, but the table is joined with itself
		# Cross join every row of table A joins with every row of table B so no condition required
*/

create table Products(
	ProductId int not null primary key,
	ProductName varchar(100),
	CategoryId int not null
);

create table Categories(
	CategoryId int not null primary key,
	CategoryName varchar(100),
	Description varchar(250)
);

insert into Products values
	(1, 'Chais', 1),
	(2, 'Chang', 1),
	(3, 'Aniseed Syrup', 2);

insert into Categories values
	(1, 'Beverages', 'Soft drinks, coffee and tea'),
	(2, 'Condiments', 'Sweets an savory sauces, seasonings'),
	(3, 'Confections', 'Desserts and candies');


--Inner join
select prod.ProductId,prod.productName, cate.CategoryName, cate.Description from Products prod
inner join Categories cate
on prod.CategoryId = cate.CategoryId;


--For these outer joins the table sequenect to be followed in select and not on 'on' condition

--Left outer join
select c.CategoryName, c.Description, p.productName from Categories c
left outer join Products p
on c.CategoryId = p.CategoryId;

select * from Categories left outer join Products on Categories.CategoryId = Products.CategoryId;

--Right outer join
select c.CategoryName, c.Description, p.productName from Products p
right outer join Categories c
on c.CategoryId = p.CategoryId;


--Full outer join
insert into Products values (4, 'Arabian Dates', 4);

select * from Products p
full outer join Categories c
on p.CategoryId = c.CategoryId;


--Self join
create table Employees(
	empId int not null primary key,
	empName varchar(100),
	gender varchar(1),
	managerId int
);

insert into Employees values
	(1001, 'Aishu', 'F', 1002),
	(1002, 'Anand', 'M', 1003),
	(1003, 'Bala', 'M', 1005),
	(1004, 'Bala', 'F', 1005),
	(1005, 'Deepa', 'F', 1001),
	(1006, 'Dev', 'M', NULL);

select emp.empId, emp.empName, emp.gender, manager.empName as managerName from Employees emp
join Employees manager  --inner join
on emp.managerId = manager.empId;

select emp.empId, emp.empName, emp.gender, manager.empName as managerName from Employees emp
left join Employees manager  --inner join
on emp.managerId = manager.empId;


select emp1.empName as Employee1, emp2.empName as Employee2
from Employees emp1
cross join Employees emp2;

select emp1.empName as Employee1, emp2.empName as Employee2
from Employees emp1
cross join Employees emp2
where emp1.empName != emp2.empName;