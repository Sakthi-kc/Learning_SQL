/*
	Primary Key is used to uniquely identify a record in the table
		# Primary key can be added during creation of a table
		# Primary key can be added as a constraint (rule) to the table
		# Each table supports only 1 primary key and that column should be not null
*/

use TestDB;

select * from Fruit;

alter table Fruit alter column Id int not null;

update Fruit set Id = Case
	When Name = 'Apple' then 1
	When Name = 'Banana' then 2
End;

--Altering Id as Primary key to the table but id should be not null
alter table Fruit add constraint pk_rule primary key (Id);


/*
	When trying to add another record with id 3 it says Violation of PRIMARY KEY constraint 'pk_rule'. 
	Cannot insert duplicate key in object 'dbo.Fruit'. The duplicate key value is (3).
*/
insert into Fruit values ('Mango', 55, 3);


--Another example
create table Book(
	BookId int primary key,
	BookTitle varchar(100)
);

insert into Book values
	(1, 'Book1'),
	(2, 'Book2')
;

insert into Book values 
	(NULL, 'BookThree'), -- null exception error
	(2, 'BookThree'); -- duplicate error

drop table Book;


--Change primary key from the table
select CONSTRAINT_NAME from INFORMATION_SCHEMA.KEY_COLUMN_USAGE
where TABLE_NAME = 'Book';

alter table Book drop constraint PK__Book__3DE0C2074AA1E16F;

alter table Book alter column BookTitle varchar(100) not null;

alter table Book add constraint new_pk primary key (BookTitle);

insert into Book values
	(3, NULL), -- null exception error
	(2, 'BookThree'); -- duplicate error
;