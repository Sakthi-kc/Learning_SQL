use TestDB;

create table Student(
	student_name varchar(100),
	student_mark int,
	department varchar(10)
);

insert into Student values
	('Praveen', 1, 'CSE'),
	('Manoj', 2, 'Mech'),
	('Karthi', 3, 'ECE'),
	('Raju', 4, 'Mech'),
	('Deepak', 3, 'CSE')
;

select * from Student;

/*
	aggregate functions include sum(), max(), min(), avg(), count()
		# sum to calculate the sum of the column
		# max, min returns maximum or minimum value from the column
		# avg to calutate the average of the column
		# count to display the number of values in the column

*/

select sum(student_mark) as total_marks from Student;

select max(student_mark) as max_mark, min(student_mark) as min_mark from Student;

select avg(student_mark) as avg_mark from Student;

select count(student_name) as total_count from Student;

select count(student_name) as cse_students from Student where department = 'CSE';


--null values in a column are not counted

update Student set student_mark = NULL where department = 'CSE';

select * from Student;
select count(student_mark) as total_count from Student;