use TestDB;

--Creating 1st table
create table Students(
	id int,
	name varchar(100),
	age int,
	grade varchar(1)
);

--Insert 10 rows into the table
insert into Students values
	(101,'John Doe', 20, 'A'),
	(102,'Jane Smith', 22, 'B'),
	(103,'Bob Johnson', 19, 'B'),
	(104,'Alice Brown', 21, 'A'),
	(105,'Charlie Davis', 20, 'B'),
	(106,'Emma Watson', 23, 'B'),
	(107,'Michael Lee', 20, 'C'),
	(108,'Olivia Moore', 19, 'B'),
	(109,'William Turner', 21, 'A'),
	(110,'Sophia Rodriguez', 22, 'B')
;

select * from Students where grade = 'B';

--Copy the executed record to another table

select * into BGrade_Stud from Students where grade = 'B';

select * from BGrade_Stud;

drop table BGrade_Stud;

select id, name, grade into BGrade_Stud from Students where grade = 'B';

insert into BGrade_Stud
select id, name, grade from Students where grade = 'C';

select * from BGrade_Stud;