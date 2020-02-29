
/*
#
#  Fact_Policies
#
*/

-- metrics
DECLARE @start DATETIME, @end DATETIME, @duration VARCHAR(30);

-- POLYBASE LOAD
IF OBJECT_ID('dbo.Fact_Policies_STG') IS NOT NULL
BEGIN
    DROP TABLE [dbo].[Fact_Policies_STG];
END

SELECT @start = GETDATE();

CREATE TABLE [dbo].[Fact_Policies_STG]
WITH
(
	CLUSTERED COLUMNSTORE INDEX,
	DISTRIBUTION = HASH(Agreement_Ver_Id2)
)
AS 
SELECT * 
FROM [ext].[Fact_Policies];

SELECT @end = GETDATE();
SELECT @duration = Convert(Time(7), @end - @start, 102);
SELECT @duration as 'time elapsed'
