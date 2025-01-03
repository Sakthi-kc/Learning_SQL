use TestDB;

/*
	SQL supports system functions and user-defined fundtions
		# System functions include aggregate, math, date and string functions
		# User defined functions include scalar function and table valued function

*/

--String function
select concat('Shalu', ' ', 'Gowtham') as Couple;

--Scalar function
create function addition( @val1 int, @val2 int )
returns int
as
Begin
	return @val1 + @val2
End;

select dbo.addition(3, 4) as Sum;

--Another function
create function pass_or_fail (@marks int)
returns char(1)
as
Begin
	Declare @grade char(1)
	if @marks > 35
		set @grade = 'P'
	else
		set @grade = 'F'
	return @grade
End;

select dbo.pass_or_fail(77) as PGrade, dbo.pass_or_fail(35) as FGrade;


--Inline Table valued function returns a table while scalar valued returns single value
create table Student(
	id int,
	name varchar(100),
	dept int
);

insert into Student values
	(1, 'A', 1),
	(2, 'B', 1),
	(3, 'C', 1),
	(4, 'D', 2),
	(5, 'E', 3);

create function udf_dept1 (@dept int)
returns table
as
	return select * from Student where dept = @dept;

select * from udf_dept1(1);


--multi table valued function
create function udf_multivalue ()
returns @emp_table table (id int, name varchar(100), dept int, hod varchar(100))
as
Begin
	insert into @emp_table
	select *, null from Student;
	insert into @emp_table
	select *, 'Sreya' from Student where dept = 1;
	return;
End;

select * from udf_multivalue();


