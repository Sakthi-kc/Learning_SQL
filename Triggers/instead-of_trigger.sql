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

alter table Students add active bit;
alter table Students add enddate date;

update Students set active = 1;

select * from Students;

--Instead of trigger is used to perform an operation instead of a requested one
create trigger insteadof_del
on Students
instead of delete
as
BEGIN
	update Students set active = 0, enddate = GetDate()
	where id in (select id from deleted);
END;

delete from Students where id = 3 or id = 5;

select * from Students;

alter table Students add new_mark int;

--Another trigger for update
create trigger insteadof_upd
on Students
instead of update
as
BEGIN
	UPDATE Students
    SET new_mark = i.marks
    FROM Students s
    JOIN inserted i ON s.id = i.id;
END;

update Students set marks = 81 where id = 2;

select * from Students;

