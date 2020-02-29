
/*
#
#  External Table Fact_Policies
#
*/

if exists (select * from sys.tables t inner join sys.schemas s on t.schema_id = s.schema_id where t.name = 'Fact_Policies' and s.name = 'ext')
	drop external table [ext].[Fact_Policies];
GO

CREATE EXTERNAL TABLE [ext].[Fact_Policies]
(
	[Id] [int] NOT NULL,
	[ExtId] [int] NOT NULL,
	[RC] [varchar](32) NOT NULL,
	[Fin_Statement_Id] [int] NOT NULL,
	[Fin_Line_Id] [int] NOT NULL,
	[Fin_PYN] [int] NOT NULL,
	[Fin_Src_Id] [int] NOT NULL,
	[Fin_Prod_Id] [int] NOT NULL,
	[Fin_Reg_Src_Id] [int] NOT NULL,
	[Fin_Reg_Id] [int] NOT NULL,
	[Fin_Country_Id] [int] NOT NULL,
	[Fin_Country_Sub_Id] [int] NOT NULL,
	[Leg_Unit_Code] [varchar](20) NOT NULL,
	[Leg_Src_Id] [int] NOT NULL,
	[Agreement_Ver_Id] [int] NOT NULL,
	[Agreement_Ver_Id2] [int] NOT NULL,
	[C_Flag] [char](1) NOT NULL,
	[Agreement_Ver_Src_Id] [int] NOT NULL,
	[Agreement_Ver_Src_Id2] [int] NOT NULL,
	[Direct_Code] [varchar](20) NOT NULL,
	[Direct_Name] [varchar](256) NOT NULL,
	[Agreement_Ver_Ext_Src_Id] [int] NOT NULL,
	[Agreement_Ver_Ext_Id] [int] NOT NULL,
	[Internal_Src_Id] [int] NOT NULL,
	[Internal_Entity_Id] [int] NOT NULL,
	[Company_Src_Id] [int] NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Agreement_Ver_Ext_Src_Code] [int] NOT NULL,
	[Agreement_Ver_Ext_Id2] [int] NOT NULL,
	[Agreement_Ver_Ext_Src_Code_Id] [int] NOT NULL,
	[Agreement_Ver_Id3] [int] NOT NULL,
	[Pop_Code_Id] [int] NOT NULL,
	[Pop_Id] [int] NOT NULL,
	[Reinsurance_Id] [int] NOT NULL,
	[Reinsurance_Agreement_Id] [int] NOT NULL,
	[ReInsurer_Ext_Id] [int] NOT NULL,
	[ReInsurer_Id] [int] NOT NULL,
	[Brokerage_Commission_Amount] [decimal](20, 5) NOT NULL,
	[Commission_Amount] [decimal](20, 5) NOT NULL,
	[Premium_Amount] [decimal](20, 5) NOT NULL,
	[Exposure_Year_Amount] [decimal](20, 5) NOT NULL,
	[Acquisition_Cost_Amount] [decimal](20, 5) NOT NULL,
	[Reinstatement_Premium_Amount] [decimal](20, 5) NOT NULL,
	[Unearned_Premium_Amount] [decimal](20, 5) NOT NULL,
	[Written_Premium_Amount] [decimal](20, 5) NOT NULL
)
WITH
(
	LOCATION = '/<folderpath>',
	DATA_SOURCE = pbDemoDS,
	FILE_FORMAT = pbDemoDF,
	REJECT_TYPE = value,
	REJECT_VALUE = 0
);
GO