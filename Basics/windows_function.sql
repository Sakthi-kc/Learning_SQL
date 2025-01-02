use TestDB;

create table Students
(
	id int,
	name varchar(100),
	subject varchar(25),
	marks int
);

insert into Students values
	(1, 'Asha', 'CS', 100),
	(2, 'Bob', 'CS', 88),
	(3, 'Teena', 'Bio', 90),
	(4, 'Rashu', 'CS', 28),
	(5, 'Sophia', 'Bio', 77);

--Windows function returns aggregate result for each row unlike aggregate function which returns single result

select *, Sum(marks) over() as TotalMarks from Students;

select *, Sum(marks) over(partition by subject) as SubjectTotal from Students;

select *, Min(marks) over() as MinMarks from Students;