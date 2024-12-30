use TestDB;

truncate table Student;

insert into Student values
	('Praveen', 67, 'CSE'),
	('Manoj', 89, 'Mech'),
	('Karthi', 23, 'ECE'),
	('Raju', 63, 'Mech'),
	('Deepak', 88, 'CSE'),
	('John', 81, 'Mech'),
	('Mani', 91, 'CSE'),
	('Abdul', 50, 'ECE')
;

select * from Student;


/*
	Order by is also an aggreate function
	It is used to categorize rows in the table based on certain condition
*/
select * from Student order by student_mark asc;
select * from Student order by student_mark desc;


/*
	group by is used to perform any aggregate function on group of values in a table
	group by can be used along with number based operation or aggregate functions and the col mentioned in group by
*/
select avg(student_mark) as avg_mark, department from Student group by department;

select student_name, department from Student group by department; --error

select count(student_name), department from Student group by department; -- correct

select count(student_name), department from Student group by department order by department desc;

select count(student_name) as dept_count, department from Student group by department order by dept_count asc;


/*
	Having clause is used to specify a condition on aggregate function along with group by clause
*/

select count(*) as dept_count, department from Student group by department having count(*) > 2;