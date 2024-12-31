use TestDB;

--Create a table named Students
create table Students(
	id int,
	name varchar(100),
	age int
);

--Add a new column named Grade to the table
alter table Students add grade varchar(10);

--Rename Grade column to FinalGrade
exec sp_rename 'Students.grade', 'finalGrade';

--Insert 10 rows into the table
insert into Students values
	(101,'John Doe', 20, 'A'),
	(102,'Jane Smith', 22, 'B'),
	(103,'Bob Johnson', 19, 'C'),
	(104,'Alice Brown', 21, 'A'),
	(105,'Charlie Davis', 20, 'B'),
	(106,'Emma Watson', 23, 'A'),
	(107,'Michael Lee', 20, 'C'),
	(108,'Olivia Moore', 19, 'B'),
	(109,'William Turner', 21, 'A'),
	(110,'Sophia Rodriguez', 22, 'C')
;

select * from Students;

--Update the age of student with id 101 to 21
update Students set age = 21 where id = 101;

--Delete student with id 101 from the table
delete from Students where id = 101;

--Retrieve all students aged more than 19
select * from Students where age > 19;

--Retrieve student named William Turner or Alice Brown
select * from Students where name = 'William Turner' or name = 'Alice Brown';

select * from Students where name in ('William Turner', 'Alice Brown');


--Retrieve students with grades 'A' or 'B' and aged 20 or more
select * from Students where finalGrade in ('A', 'B') and age >= 20;

--Retrieve students between age 18 and 20
select * from Students where age >= 18 and age <= 20;

select * from Students where age between 18 and 20;

--Retrieve students with grade greater than B
select * from Students where finalGrade > 'B';

--Count the total number of students
select count(*) as TotalCount from Students;

--Calculate the average age of students
select avg(age) as AvgAge from Students;

--Find the sum of ages for students with grade A or B
select sum(age) as SumOfAges from Students where finalGrade in ('A', 'B');

--Group students by grade and count the number of students in each grade
select count(*) as GradeWiseCount, finalGrade from Students group by finalGrade;

--Group students by grade and calculate the avg age in each group
select avg(age) as AvgAge, finalGrade from Students group by finalGrade;

--Find the grade with highest number of students
insert into Students values ( 111, 'John', 25, 'C' );

select top (1) count(*) as HighestCount, finalGrade
from Students 
group by finalGrade
order by HighestCount desc;

--Find grades with avg age greater than 20
select avg(age) as AvgAge, finalGrade
from Students
group by finalGrade
having avg(age) > 20;

--Find grade with fewer than 4 students
select count(*) as GradeWiseCount, finalGrade
from Students
group by finalGrade
having count(*) < 4;

--Find grade where avg age is 20
select finalGrade from Students group by finalGrade having avg(age) = 20; 

--List all students in ascending order of age
select * from Students order by age asc;

--List students with grade A or B in descending order of name
select name, finalGrade from Students where finalGrade in ('A', 'B') order by name desc;

--Sort students by grade in alphabetical order
select * from Students order by finalGrade;

