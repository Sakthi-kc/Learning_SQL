/*
	Index are used to arrange data in a table for query optimisation, making the search easier. A table can have 1 clustered and n non-clustered index
		# The primary key of a table is by default considered a clustered index (physically arranges table by clustered index)
		# The unique field of a table is by default considered as non-clustered index (acts as a pointer)
	If no primary key or unique field, then index can be created
	When a primary key is created after creating clustered index, then pk will be taken as non-clustered index
*/

use TestDB;

create Table UserDetails(
	userID int primary key,
	username varchar(100) unique,
	dob date
);

insert into UserDetails values
	(5, 'Bob', '2002-05-15'),
	(1, 'Atos', '1999-11-27'),
	(3, 'Mike', '2000-03-04');

select * from UserDetails;

select * from UserDetails where username = 'Mike';

--Create a clustered index
create clustered index userdetails_ci
on UserDetails(userid);

--Create a non-clustered index
create index userdetails_nci
on UserDetails(dob);

create index ud_duo
on UserDetails(username, dob);

drop index UserDetails.ud_duo;

create unique index ud_duo
on UserDetails(username, dob);

select * from UserDetails where username = 'Bob' and dob = '2002-05-15';

drop table UserDetails;