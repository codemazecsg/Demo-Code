

COPY INTO dbo.Fact_Policies 
FROM '<uri to storage folder containing data>'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL=(IDENTITY= 'Managed Identity'),
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0A',
    ENCODING = 'UTF8'
)