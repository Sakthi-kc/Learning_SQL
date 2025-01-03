use TestDB;

select * from Customers;


--Procedure1
create procedure GetCustomers as
BEGIN
	select * from Customers where len(customer_state) = 2
END;

insert into Customers values
	(7, 'Dora', 9898989806, 'UP', 60607),
	(8, 'Bujji', 9898989807, 'AP', 60608);

exec GetCustomers;


--Proceedure2
create procedure GetCustomers1 @id int
AS
BEGIN
	select customer_name from Customers where customer_id = @id
END;

exec GetCustomers1 4;


--Procedure 3
alter procedure GetCustomers1 @id int = 8
as
BEGIN
	select customer_name from Customers where customer_id = @id;
END;

exec GetCustomers1 2;


--Procedure 4
alter procedure GetCustomers @len int = 2, @count int out AS
BEGIN
	select @count = count(*) from Customers where len(customer_state) >= @len
END;

declare @result int
exec GetCustomers 5, @result out
select @result as StatesCount;


--Procedure 5
alter Procedure GetCustomers @input int = 2 as
BEGIN
	Declare @id int = @input
	select @id as customer_id, customer_name, customer_state from Customers where customer_id = @id
	delete from Customers where customer_id = @id+1;
	select * from Customers;
End;

exec GetCustomers;

exec GetCustomers 5;
