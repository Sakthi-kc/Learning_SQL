/*
	Automatically triggers when a action is performed - DML triggers, DDL triggers, Logon or user session triggers
	Triggers create 2 virutal table. Inserted table when new data/record inserted or updated
	Deleted table stores the old data which was updated or deleted
*/


use TestDB;

create table Students
(
	id int,
	name varchar(100),
	subject varchar(25),
	marks int
);

insert into Students values
	(1, 'Asha', 'CS', 100),
	(2, 'Bob', 'CS', 88),
	(3, 'Teena', 'Bio', 90),
	(4, 'Rashu', 'CS', 28),
	(5, 'Sophia', 'Bio', 77);


create table student_audit(
	id int,
	operation varchar(10),
	updated_date datetime
);

--Create trigger on insert/update
create trigger stud_update_trigger
on Students
after insert
as
BEGIN
	insert into student_audit
	select id, 'Inserted', GETDATE() 
	from inserted
END;

insert into Students values (6, 'Rina', 'Bio', 92);

select * from student_audit;


--Alter trigger
alter trigger stud_update_trigger
on Students
after insert, delete
as
BEGIN
	insert into student_audit
	
	select id, 'Inserted', GETDATE() 
	from inserted

	union all

	select id, 'Deleted', GETDATE()
	from deleted
END;

delete from Students where id = 6;

select * from student_audit;