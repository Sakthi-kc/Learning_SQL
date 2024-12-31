--Select a DB to work upon
use TestDB;


--Create a table in the DB
create table Customer(
	customer_id int,
	customer_name varchar(100),
	customer_address varchar(200),
	city varchar(100),
	state varchar(100),
	zip_code int
);


--Verify the table in outputs
select * from Customer;


--Insert rows with same number of columns into the table
insert into Customer values
	(1, 'John Doe', '392 Sunset Blvd', 'New York', 'NT', 10059),
	(2, 'Mary Smith', '6900 Main St', 'San Francisco', 'CA', 94032),
	(3, 'Richard Newman', '2040 Riverside Rd', 'San Diego', 'CA', 92010),
	(4, 'Cathy Cook', '4010 Speedway', 'Tucson', 'AZ', 85719)
;


--Rename column name in the table
exec sp_rename 'Customer.customer_address', 'address';


--Alter data type of address from 200 to 100
alter table Customer alter column address varchar(100);


--Add a new column to the table
alter table Customer add mobile_number int;
alter table Customer alter column mobile_number bigint;


--Delete column where mobile number is null

--0 rows affected because null is not a value
delete from Customer where mobile_number = NULL;

--follow the below command to check null
delete from Customer where mobile_number is NULL;


--Reinsert rows with same number of columns into the table
insert into Customer values
	(1, 'John Doe', '392 Sunset Blvd', 'New York', 'NT', 10059, 5551234567),
	(2, 'Mary Smith', '6900 Main St', 'San Francisco', 'CA', 94032, 5551234568),
	(3, 'Richard Newman', '2040 Riverside Rd', 'San Diego', 'CA', 92010, 5551234569),
	(4, 'Cathy Cook', '4010 Speedway', 'San Deigo', 'CA', 85719, 5551234570),
	(5, 'Alice Johnson', '123 Oak Street', 'San Deigo', 'CA', 90001, 5551234571),
	(6, 'Bob Williams', '456 Elm Avenue', 'Chicago', 'IL', 60601, 5551234572)
;


--Verify the new rows inserted into the table
select * from Customer;


--Update phone number for Mary Smith
update Customer set mobile_number = 822061234 where customer_name = 'Mary Smith';


--Delete record where zipcode is 60601
delete from Customer where zip_code = 60601;


--Select customers who are from state = CA
select * from Customer where state = 'CA';


--Print customer whose ID is greater than 5

--no error, will return only the col names in output as the max id itself is 5
select * from Customer where customer_id > 5;


--Delete a column from the table
alter table Customer drop column mobile_number;


--Truncate the Customer table
truncate table Customer;
