--A table can have many unique keys and it can accept null value but only 1 record can have null
use TestDB;

create table UserDetails(
	id int not null primary key,
	name varchar(100),
	email varchar(100) unique,
	phoneno bigint unique
	--constraint uk_rule unique (email, phoneno)
);

insert into UserDetails values (1, 'Adam', 'adam@gmail.com', 9898989800);

--Violation of UNIQUE KEY constraint 'UQ__UserDeta__AB6E6164CB80DDB6'. Cannot insert duplicate key in object 'dbo.UserDetails'. The duplicate key value is (adam@gmail.com).
insert into UserDetails values (2, 'Bobby', 'adam@gmail.com', 9898989801);

--Inserted the records
insert into UserDetails values (2, 'Bobby', 'bobby@gmail.com', 9898989801);
insert into UserDetails values
	(3, 'Cavey', NULL, 9898989802),
	(4, 'Dane', 'dane@gmail.com', NULL)
;


--Cannot insert duplicate key in object 'dbo.UserDetails'. The duplicate key value is (<NULL>).
insert into UserDetails values
	(5, 'Cavey1', NULL, 9898989803),
	(6, 'Dane1', 'dane1@gmail.com', NULL)
;

select * from UserDetails;

drop table UserDetails;


--check constraint

create table Products(
	productId int not null primary key,
	productName varchar(100),
	price int
	--price int check (price >= 200)
);

alter table Products add check (price >= 200 and productId > 1);


--The INSERT statement conflicted with the CHECK constraint "CK__Products__0880433F". The conflict occurred in database "TestDB", table "dbo.Products".
insert into Products values (0, 'Sweets', 250);

insert into Products values (1, 'Sweets', 100);

--executed
insert into Products values (2, 'Sweets', 250);
select * from Products;

drop table Products;


--default constraint
create table Customers(
	id int not null primary key,
	name varchar(100),
	gender varchar(20)
	--gender varchar(20) default 'Unknown'
);

alter table Customers add constraint def_rule default 'Unknown' for gender;

insert into Customers values
	(1, 'Willaims', 'Male'),
	(2, 'Reena', 'Female');

insert into Customers (id, name) values (3, 'Tabley');

select * from Customers;

drop table Customers;
