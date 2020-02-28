/****** Object:  Table [dbo].[Attachments]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[CaseAttachmentID] [bigint] NOT NULL,
	[CaseID] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[AttachmentUriPath] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[CaseAttachmentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseActionItems]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseActionItems](
	[ActionItemID] [bigint] NOT NULL,
	[CaseID] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[ActionStatus] [nchar](10) NOT NULL,
	[ActionPriority] [smallint] NOT NULL,
	[ActionCreatorEmployeeID] [nchar](20) NOT NULL,
	[ActionAssignedEmployeeID] [nchar](20) NOT NULL,
	[ActionTaskDesc] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_CaseActionItems] PRIMARY KEY CLUSTERED 
(
	[ActionItemID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseNotes]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseNotes](
	[CaseNotesID] [bigint] NOT NULL,
	[CaseID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[NoteEmployeeID] [nchar](20) NOT NULL,
	[Note] [nvarchar](2500) NOT NULL,
 CONSTRAINT [PK_CaseNotes] PRIMARY KEY CLUSTERED 
(
	[CaseNotesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimsSupportCase]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimsSupportCase](
	[CaseID] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[CaseStatus] [nchar](10) NOT NULL,
	[CaseSeverity] [smallint] NOT NULL,
	[ClaimID] [bigint] NOT NULL,
	[CaseCreatorEmployeeID] [nchar](20) NOT NULL,
	[CurrentCaseOwnerEmployeeID] [nchar](20) NOT NULL,
	[CaseTitle] [nvarchar](500) NOT NULL,
	[CaseDescription] [nvarchar](1500) NOT NULL,
 CONSTRAINT [PK_ClaimsSupportCase] PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerClaimCases]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerClaimCases](
	[CCCID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CaseID] [nvarchar](50) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
 CONSTRAINT [PK_CustomerClaimCases] PRIMARY KEY CLUSTERED 
(
	[CCCID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerContactHistory]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerContactHistory](
	[ContactID] [bigint] NOT NULL,
	[CaseID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ContactEmployeeID] [nchar](20) NOT NULL,
	[CustomerID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerUserProfiles]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerUserProfiles](
	[CustomerID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[CustomerSSN_EIN] [nvarchar](15) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CommunicationPreference] [nchar](10) NOT NULL,
	[PrimaryTelephone] [nvarchar](20) NOT NULL,
	[SecondaryTelephone] [nvarchar](20) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[EmailValidated] [bit] NOT NULL,
	[OnlinePasswordHash] [nvarchar](500) NULL,
	[PasswordChangeDate] [date] NULL,
	[CallCenterPassCode] [nchar](30) NULL,
	[OnlineSecurityQuestion1] [nvarchar](500) NULL,
	[OnlineSecurityAnswer1] [nvarchar](500) NULL,
	[OnlineSecurityQuestion2] [nvarchar](500) NULL,
	[OnlineSecurityAnswer2] [nvarchar](500) NULL,
	[StreetAddress1] [nvarchar](50) NULL,
	[StreeAddress2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[StateProvince] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[CustomerNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CustomerUserProfiles] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineLoginHistory]    Script Date: 2/5/2020 1:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineLoginHistory](
	[LoginRecordID] [bigint] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[DeviceIP] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_OnlineLoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginRecordID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_ClaimsSupportCase] FOREIGN KEY([CaseID])
REFERENCES [dbo].[ClaimsSupportCase] ([CaseID])
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_ClaimsSupportCase]
GO
ALTER TABLE [dbo].[CaseActionItems]  WITH CHECK ADD  CONSTRAINT [FK_CaseActionItems_ClaimsSupportCase] FOREIGN KEY([CaseID])
REFERENCES [dbo].[ClaimsSupportCase] ([CaseID])
GO
ALTER TABLE [dbo].[CaseActionItems] CHECK CONSTRAINT [FK_CaseActionItems_ClaimsSupportCase]
GO
ALTER TABLE [dbo].[CaseNotes]  WITH CHECK ADD  CONSTRAINT [FK_CaseNotes_ClaimsSupportCase] FOREIGN KEY([CaseID])
REFERENCES [dbo].[ClaimsSupportCase] ([CaseID])
GO
ALTER TABLE [dbo].[CaseNotes] CHECK CONSTRAINT [FK_CaseNotes_ClaimsSupportCase]
GO
ALTER TABLE [dbo].[CustomerClaimCases]  WITH CHECK ADD  CONSTRAINT [FK_CustomerClaimCases_ClaimsSupportCase] FOREIGN KEY([CaseID])
REFERENCES [dbo].[ClaimsSupportCase] ([CaseID])
GO
ALTER TABLE [dbo].[CustomerClaimCases] CHECK CONSTRAINT [FK_CustomerClaimCases_ClaimsSupportCase]
GO
ALTER TABLE [dbo].[CustomerClaimCases]  WITH CHECK ADD  CONSTRAINT [FK_CustomerClaimCases_CustomerUserProfiles] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerUserProfiles] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerClaimCases] CHECK CONSTRAINT [FK_CustomerClaimCases_CustomerUserProfiles]
GO
ALTER TABLE [dbo].[CustomerContactHistory]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContactHistory_ClaimsSupportCase] FOREIGN KEY([CaseID])
REFERENCES [dbo].[ClaimsSupportCase] ([CaseID])
GO
ALTER TABLE [dbo].[CustomerContactHistory] CHECK CONSTRAINT [FK_CustomerContactHistory_ClaimsSupportCase]
GO
ALTER TABLE [dbo].[CustomerContactHistory]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContactHistory_CustomerUserProfiles] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerUserProfiles] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerContactHistory] CHECK CONSTRAINT [FK_CustomerContactHistory_CustomerUserProfiles]
GO
ALTER TABLE [dbo].[OnlineLoginHistory]  WITH CHECK ADD  CONSTRAINT [FK_OnlineLoginHistory_CustomerUserProfiles] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerUserProfiles] ([CustomerID])
GO
ALTER TABLE [dbo].[OnlineLoginHistory] CHECK CONSTRAINT [FK_OnlineLoginHistory_CustomerUserProfiles]
GO
