/*
	Foreign key is a field in one table which refers to the Primary key in another table
	It is a constraint used to prevent actions that would destroy the relationship between tables
	The table with foreign key is called the child table, and the table with the primary key is the referenced or parent table
*/

Use TestDB;

--Reference or Parent table
create table Course(
	courseId int primary key,
	courseName varchar(100),
	staffName varchar(100)
);

insert into Course values
	(1001, 'CSE', 'Nirmala'),
	(1002, 'ECE', 'Johnson'),
	(1003, 'EEE', 'Newton')
;

select * from Course;

--Child table


--Method 1 to add foreign key while creating the table
create table Users(
	name varchar(100),
	courseId int foreign key references Course(courseId)
);

select * from Users;

drop table Users;

--Method 2 to create as a constraint while creating table
create table Users(
	name varchar(100),
	courseId int,
	courseName varchar(100)
	constraint fk_rule foreign key (courseId) references Course(courseId)
);

insert into Users values ('Bob', 1003, 'CSE');

--The INSERT statement conflicted with the FOREIGN KEY constraint "fk_rule". Bcoz id 1004 is not present in Course table.
--The conflict occurred in database "TestDB", table "dbo.Course", column 'courseId'.
insert into Users values ('Adam', 1004, 'ECE');


--The DELETE statement conflicted with the REFERENCE constraint "fk_rule". Bcoz first it has to be deleted from child table
--The conflict occurred in database "TestDB", table "dbo.Users", column 'courseId'.
delete from Course where courseId = 1003;

truncate table Users;
delete from Course where courseId = 1003;


drop table Users;


/*
	Mutliple foreign keys --> each of the foreign key has to be a primary key in other tables
	1 table can have only 1 primary key, hence 2 foreign key means primary key of 2 tables
*/
