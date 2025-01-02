use TestDB;

create table Students(
	id int,
	name varchar(100),
	dept int,
	yop int
);

create table Departments(
	id int,
	name varchar(20)
);

insert into Students values
	(1, 'Asha', 1, 2020),
	(2, 'Bob', 2, 2023),
	(3, 'Citra', 2, 2022),
	(4, 'David', 1, 2021),
	(5, 'Emily', 1, 2022),
	(6, 'Francis', 2, 2022),
	(7, 'Gugan', 1, 2023),
	(8, 'Rajeev', 2, 2024);


insert into Departments values
	(1, 'CS'), (2,'BioMedical');



--Select student details whose atleast 2 students in that yop
select s.yop, count(s.id) from Students s
group by s.yop
having count(s.id) >= 2;

select s.id, s.name, d.name, s.yop from Students s
join Departments d
on d.id = s.dept
where s.yop in (
	select s.yop from Students s
	group by s.yop
	having count(s.id) >= 2
)
order by yop;


/*
	CTE or common table expression is a temporary named result set which is used along with DML-DQL queries
	Exists only during the execution of the query
	Syntx is With <CTE-Name> as <Query>
*/

With yop_condition as (
	select s.yop from Students s
	group by s.yop
	having count(s.id) >= 2
)
select s.id, s.name, d.name, s.yop from Students s
join Departments d
on d.id = s.dept
where s.yop in (select yop from yop_condition);

