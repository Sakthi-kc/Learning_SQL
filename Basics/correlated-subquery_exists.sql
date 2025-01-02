use TestDB;

create table Sales(
	id bigint,
	name varchar(100)
);

create table Orders(
	id int,
	orderdate date,
	salesman_id bigint,
	amount decimal
);

insert into Sales values
	(1001, 'Alpha'),
	(1002, 'Beta'),
	(1003, 'Gamma'),
	(1004, 'Judo');

insert into Sales values (1005, 'Lidia');


insert into Orders values
	(1, '2024-01-12', 1001, 545.50),
	(2, '2024-03-12', 1002, 990),
	(3, '2024-03-12', 1002, 121.30),
	(4, '2024-04-12', 1004, 1210),
	(5, '2024-05-12', 1005, 50),
	(6, '2024-05-12', 1001, 435.75);


--correlated subquery is when outer query is dependent on inner query
select * from Sales s where id in (select salesman_id from Orders o where o.salesman_id = s.id);

--select 1, select 0 or select * makes no difference

--exists checks the correlated subquery to return true or false
select * from Sales s where exists (select 1 from Orders o where s.id = o.salesman_id);

--not exists checks the correlated subquery to return true or false
select * from Sales s where not exists (select 0 from Orders o where s.id = o.salesman_id);
