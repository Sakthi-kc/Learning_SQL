use TestDB;

/*
	DML - data manipulation language inclueds insert, update and delete commands
	DQL - data query language includes select command
		# insert to insert data into database table with defined schema
		# update to update data of existing row in the database table
		# delete to delete specific row(s) in the database table
		# select to query and retrieve required data from the database table
*/

create table Fruit(
	Name varchar(50),
	Price int
);

select * from Fruit;

insert into Fruit values
	('Apple', 100),
	('Grape', 60),
	('Banana', 20)
;

--The below will update all the values in the specified column

update Fruit set Price=50;

--Hence use condition to update specific row values

update Fruit set Price=100 where Name = 'Apple';

--Use Case and close it with End. Else is the default condtion. When Else not mentioned, it changes the unmatched values to NULL

update Fruit set Price=Case
	When Name = 'Grape' then 60
	When Name = 'Banana' then 20
	Else Price
End;

insert Fruit values
('Orange', 60);

delete from Fruit where Price = 60;