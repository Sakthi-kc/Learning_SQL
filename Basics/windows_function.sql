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

--Windows function returns aggregate result for each row unlike aggregate function which returns single result

select *, Sum(marks) over() as TotalMarks from Students;

select *, Sum(marks) over(partition by subject) as SubjectTotal from Students;

select *, Min(marks) over() as MinMarks from Students;


--Value based windows function

select *, First_value(marks) over(order by id) as First_value, 
Last_Value(marks) over(order by id) as Last_value from Students;

select *, First_value(marks) over(partition by subject order by id) as First_value,
Last_Value(marks) over(partition by subject order by id) as Last_value from Students;


--The range mentioned below is called as frame. Windows function usually considers single row so use range to compare all rows
select *,LAST_VALUE(marks) over(order by subject range between unbounded preceding and unbounded following) as Final_Value
from Students;


--Lag to display previous value, lead for next value where 2 is the offset (skips by 2) and -1 instead of NULL
select *, Lag(marks) over(partition by subject order by id) as Previous_Value,
Lead(marks,2,-1) over(order by id) as Next_Value from Students;


--Ranking based windows function

select *, Row_number() over(partition by subject order by id) as Rno from Students;

With Row1 as (
	select *, Row_number() over(partition by subject order by id) as Rno from Students
)
select * from Row1 where Rno = 1;

select *, Rank() over(order by marks desc) as Rank from Students;

update Students set marks = 88 where id = 5;
select *, Rank() over(order by marks desc) as Rank from Students; --skips the count of rank from 3 to 5

--use dense rank when the count has to be sequential
select *, dense_rank() over(order by marks desc) as Rank from Students;


--use ntile to divide them into groups where inital group will have the additional row
select *, ntile(2) over(order by subject) as Groups from Students;
