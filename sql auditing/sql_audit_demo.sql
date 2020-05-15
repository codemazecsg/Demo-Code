

-- Microsoft SQL Server 2019 (RTM-CU3) (KB4538853) - 15.0.4023.6 (X64)
use master;
go

-- remove old db
if exists(select 1 from sys.databases where name = 'foo')
	drop database foo;
go

-- remove audit
if exists(select 1 from sys.server_audits where name = 'testAudit')
  begin
	alter server audit testAudit with (state=off);
	drop server audit testAudit;
  end;
go

-- remove specification
if exists(select 1 from sys.server_audit_specifications where name = 'testAuditspec1')
  begin
	alter server audit specification testAuditspec1 with (state=off);
	drop server audit specification testAuditspec1;
  end;
go

-- remove logins
if exists(select 1 from sys.syslogins where name = 'user1')
	drop login user1;
go
if exists(select 1 from sys.syslogins where name = 'user2')
	drop login user2;
go

-- create a database
create database foo;
go

-- create two sql logins
create login user1 with password= '???',
default_database = foo,
check_policy = off,
check_expiration = off;
go

create login user2 with password='???',
default_database = foo,
check_policy = off,
check_expiration = off;
go

-- create a server audit
create server audit testAudit
	to file ( filepath = 'c:\temp')
	where database_principal_name = 'user2';
go

-- create a server level audit specification to get successful and failed logins
create server audit specification testAuditspec1
	for server audit testAudit
	add (SUCCESSFUL_LOGIN_GROUP),
	add (FAILED_LOGIN_GROUP)
	with (state=on);
go

-- enable server audit
alter server audit testAudit with (state=on);
go

-- switch context to db
use foo;
go

-- create a table
create table t 
(
	id int identity(1,1) primary key clustered,
	fullName nvarchar(50)
)
go

-- insert a few rows
insert into t values ('Alexander Hamilton');
insert into t values ('George Washington');
insert into t values ('Thomas Jefferson');
go

-- create users
create user user1 for login user1 with default_schema = dbo;
create user user2 for login user2 with default_schema = dbo;

-- give perms
grant select on t to user1;
grant select on t to user2;

-- create database level audit specification to capture completed batches (you can get individual stmt SELECT, INSERT, etc... too)
create database audit specification dbFooAudit
	for server audit testAudit
	add (BATCH_COMPLETED_GROUP)
	with (state=on)
go

-- now go logon as user1 & user2 and execute 'select * from t;'

-- view audit records
select 
 action_id,
 session_id,
 database_name,
 database_principal_name,
 object_name,
 statement
from fn_get_audit_file('c:\temp\*.sqlaudit',default, default);
go