use TestDB;

/*
	DDL - data definition languange include create, alter, drop, truncate commands
		# create to create a table in the database
		# alter to change column name, column data type or to add new column to existing database
		# drop to delete the complete table including the structure of the table in the database
		# truncate to remove the data from the table and maintains the structure
*/

create table Student(
	Name varchar(50),
	Department varchar(10),
	Marks_scored int
);

--Adding new column to the database table

alter table Student add City varchar(50);

--Changing existing col name in table

exec sp_rename 'Student.Marks_scored', 'Student.Marks';

/*
	While renmaing we should specify the table name only in the old name, else new name will become Student.Marks in Students table
	Changing column name doesn't say executed successfully. It throws caution but still operation is performed
*/

exec sp_rename 'Student.[Student.Marks]', 'Marks_scored';

exec sp_rename 'Student.Marks_scored', 'Marks';

--Changing column data type from int to varchar

alter table Student alter column Marks varchar(50);

drop table Student;