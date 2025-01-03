use TestDB;

create table Customers(
	customer_id int,
	customer_name varchar(100),
	customer_phone bigint,
	customer_state varchar(50),
	customer_zipcode bigint
);

insert into Customers values
	(1, 'Jerry', 9898989800, 'Assam', 60601),
	(2, 'Tom', 9898989801, 'Andhra', 60602),
	(3, 'Donaldo', 9898989802, 'Agra', 60603),
	(4, 'Ben', 9898989803, 'Nepal', 60604),
	(5, 'Heena', 9898989804, 'Telangana', 60605),
	(6, 'Tina', 9898989805, 'TN', 60606);


--Create temp table
select * into #StateA from Customers where customer_state like 'A%';

select * from #StateA;

--Another method
create table #StateA1(
	customer_id int,
	customer_name varchar(100),
	customer_phone bigint,
	customer_state varchar(50),
	customer_zipcode bigint
);

insert into #StateA1
select * from #StateA;

select * from #StateA1;

drop table #StateA, #StateA1;


--Method 3
select * into #StateA2 from Customers where 1=0;

insert into #StateA2
select * from Customers where customer_state like '%n%';

select * from #StateA2;
