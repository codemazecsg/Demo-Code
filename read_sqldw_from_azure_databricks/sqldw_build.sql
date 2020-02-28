
-- clean up
if exists (select * from sys.tables where name = 'people' and [schema_id] = schema_id('history'))
	drop table history.people
go

if exists (select * from sys.schemas where name = 'history')
	drop schema history
go

-- create schema
create schema history
go

-- create table
create table history.people
(
	id int not null,
	firstname nchar(50) not null,
	lastname nchar(50) not null,
	email nvarchar(50) not null
)
with
(
	distribution = hash(id),
	clustered index (lastname)
)
go

-- load a few rows
insert into history.people values (1, 'Alexander', 'Hamilton', 'alexander.hamilton@microsoft.com');
insert into history.people values (2, 'George', 'Washington', 'george.washington@microsoft.com');
insert into history.people values (3, 'Abraham', 'Lincoln', 'abraham.lincoln@microsoft.com');
insert into history.people values (4, 'Thomas', 'Jefferson', 'thomas.jefferson@microsoft.com');
insert into history.people values (5, 'Benjamin', 'Franklin', 'benjamin.franklin@microsoft.com');
insert into history.people values (6, 'Ulysses', 'Grant', 'ulysses.grant@microsoft.com');
insert into history.people values (7, 'James', 'Madison', 'james.madison@microsoft.com');
insert into history.people values (8, 'Theodore', 'Roosevelt', 'teddy.roosevelt@microsoft.com');
insert into history.people values (9, 'Franklin', 'Roosevelt', 'franklin.roosevelt@microsoft.com');
insert into history.people values (10, 'John', 'Kennedy', 'john.f.kennedy@microsoft.com');

-- read
select * from history.people