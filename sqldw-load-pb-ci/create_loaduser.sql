
-- from master
CREATE LOGIN loaduser WITH PASSWORD = 'XXXXXXXXXXXX';
GO

-- from pbdemosqldw01/master
CREATE USER loaduser FOR LOGIN loaduser;
GO

EXEC sp_addrolemember 'xlargerc', 'loaduser';
GO

EXEC sp_addrolemember 'db_owner', 'loaduser';
GO

