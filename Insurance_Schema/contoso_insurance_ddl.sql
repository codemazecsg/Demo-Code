/****** Object:  Table [dbo].[Address]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [bigint] NOT NULL,
	[AddressValid] [bit] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[StreetAddress1] [nvarchar](50) NOT NULL,
	[StreetAddress2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[StateProvince] [nvarchar](50) NOT NULL,
	[PostalCode] [nchar](10) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimAdjustments]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimAdjustments](
	[ClaimAdjustmentID] [bigint] NOT NULL,
	[ClaimID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[AdjusterEmployeeID] [nchar](20) NOT NULL,
	[IsCoveredByPolicy] [bit] NOT NULL,
	[PhPID] [bigint] NOT NULL,
	[ItemAdjustmentDescription] [nvarchar](1000) NOT NULL,
	[ItemBasisValue] [decimal](15, 2) NOT NULL,
	[ItemCurrentFairMarketValue] [decimal](15, 2) NOT NULL,
	[ItemLiabilityValue] [decimal](15, 2) NOT NULL,
	[ItemExtraCharges] [decimal](15, 2) NOT NULL,
	[ItemTotalAdjustmentAmount] [decimal](15, 2) NOT NULL,
	[AdjusterNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ClaimAdjustments] PRIMARY KEY CLUSTERED 
(
	[ClaimAdjustmentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimAttachements]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimAttachements](
	[ClaimAttachmentID] [bigint] NOT NULL,
	[ClaimID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[AttachmentUriPath] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClaimAttachements] PRIMARY KEY CLUSTERED 
(
	[ClaimAttachmentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimPayments]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimPayments](
	[ClaimPaymentID] [bigint] NOT NULL,
	[ClaimID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[PaymentAmount] [decimal](15, 2) NOT NULL,
	[ClearedDate] [date] NULL,
	[CheckNoTrackingID] [nvarchar](75) NOT NULL,
	[ClaimPaymentMemo] [nvarchar](100) NULL,
 CONSTRAINT [PK_ClaimPayments] PRIMARY KEY CLUSTERED 
(
	[ClaimPaymentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverageItemCodes]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverageItemCodes](
	[CoverageItemCode] [bigint] NOT NULL,
	[CoverageItemClass] [nchar](30) NOT NULL,
	[CoverageItemDescription] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_CoverageItemCodes] PRIMARY KEY CLUSTERED 
(
	[CoverageItemCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoveredParties]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoveredParties](
	[CoveredPartyID] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[PolicyPartyID] [bigint] NOT NULL,
	[PolicyNumber] [bigint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_CoveredParties] PRIMARY KEY CLUSTERED 
(
	[CoveredPartyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentProfiles]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentProfiles](
	[PaymentProfileID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[PaymentType] [nchar](3) NOT NULL,
	[PayerFullName] [nvarchar](100) NOT NULL,
	[CardNumber] [nvarchar](20) NULL,
	[ExpirationDate] [date] NULL,
	[CVC] [nchar](3) NULL,
	[PostalCode] [nchar](10) NULL,
	[RoutingNumber] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[InstitutionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentProfiles] PRIMARY KEY CLUSTERED 
(
	[PaymentProfileID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[PolicyNumber] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[DeductibleAmount] [decimal](15, 2) NOT NULL,
	[MaxCoveragePerClaim] [decimal](15, 2) NOT NULL,
	[MaxPropertyCoverageLimt] [decimal](15, 2) NOT NULL,
	[MaxLiabilityCoverageLimit] [decimal](15, 2) NOT NULL,
	[MaxPolicyCoverageLimit] [decimal](15, 2) NOT NULL,
	[PaymentProfileID] [bigint] NULL,
	[AutoRenewal] [bit] NOT NULL,
	[CommunicationPreference] [nchar](10) NOT NULL,
	[PolicyNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Policies] PRIMARY KEY CLUSTERED 
(
	[PolicyNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyClaimants]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyClaimants](
	[ClaimantID] [bigint] NOT NULL,
	[ClaimID] [bigint] NOT NULL,
	[ClaimantSSN_EIN] [nchar](15) NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[PrimaryTelephone] [nvarchar](20) NOT NULL,
	[SecondaryTelephone] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[StreetAddress1] [nvarchar](50) NOT NULL,
	[StreetAddress2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[StateProvince] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[ClaimantInstitutionName] [nvarchar](50) NULL,
	[ClaimantRoutingNumber] [nvarchar](50) NULL,
	[ClaimantAccountNumber] [nvarchar](50) NULL,
	[ClaimantNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PolicyClaimants] PRIMARY KEY CLUSTERED 
(
	[ClaimantID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyClaims]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyClaims](
	[ClaimID] [bigint] NOT NULL,
	[PolicyNumber] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[StatusCode] [nchar](5) NOT NULL,
	[ApprovalCode] [nchar](5) NOT NULL,
	[ApproverEmployeeID] [nchar](20) NOT NULL,
	[IncidentDate] [date] NOT NULL,
	[IncidentDescription] [nvarchar](1000) NOT NULL,
	[DeductibleApplied] [decimal](15, 2) NOT NULL,
	[InitialClaimEstimate] [decimal](15, 2) NOT NULL,
	[TotalSettledClaimAmount] [decimal](15, 2) NOT NULL,
	[ClaimPaymentMethod] [nchar](10) NOT NULL,
	[ClaimPaymentStructure] [nchar](5) NOT NULL,
	[ClaimPaymentTotalRequiredCount] [smallint] NOT NULL,
	[ClaimPaymentFrequencyCode] [nchar](1) NOT NULL,
	[ClaimNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PolicyClaims] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyHolderProperty]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyHolderProperty](
	[PhPID] [bigint] NOT NULL,
	[PolicyNumber] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[CoverageItemCode] [bigint] NOT NULL,
	[PropertyDescription] [nvarchar](1000) NOT NULL,
	[PropertyBasisValue] [decimal](15, 2) NOT NULL,
	[PropertyCurrentFairMarketValue] [decimal](15, 2) NOT NULL,
	[PropertyReplacementValue] [decimal](15, 2) NOT NULL,
	[PropertyInsuredValue] [decimal](15, 2) NOT NULL,
	[PropertyLocationPostalCode] [nchar](10) NOT NULL,
	[PropertyLegalDescription] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_PolicyHolderProperty] PRIMARY KEY CLUSTERED 
(
	[PhPID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyParties]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyParties](
	[PolicyPartyID] [bigint] NOT NULL,
	[PolicyPartySSN_EIN] [nchar](15) NULL,
	[CreateDate] [date] NOT NULL,
	[LastUpdateDate] [date] NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[PrimaryTelephone] [nvarchar](20) NOT NULL,
	[SecondaryTelephone] [nvarchar](20) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[BirthDate] [date] NOT NULL,
 CONSTRAINT [PK_PolicyParties_1] PRIMARY KEY CLUSTERED 
(
	[PolicyPartyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyParties_Address_History]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyParties_Address_History](
	[PolicyPartyAddressID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[AddressID] [bigint] NOT NULL,
	[PolicyPartyID] [bigint] NOT NULL,
 CONSTRAINT [PK_PolicyParties_Address_History] PRIMARY KEY CLUSTERED 
(
	[PolicyPartyAddressID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyPremiumLineItems]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyPremiumLineItems](
	[LineItemID] [bigint] NOT NULL,
	[PolicyPremiumScheduleID] [bigint] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[ItemDescription] [nvarchar](200) NOT NULL,
	[ItemAmount] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_PolicyPremiumLineItems] PRIMARY KEY CLUSTERED 
(
	[LineItemID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyPremiumSchedule]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyPremiumSchedule](
	[PolicyPremiumScheduleID] [bigint] NOT NULL,
	[PolicyNumber] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[CoveragePeriodFrom] [date] NOT NULL,
	[CoveragePeriodTo] [date] NOT NULL,
	[InitialDueDate] [date] NOT NULL,
	[TotalPremium] [decimal](15, 2) NOT NULL,
	[PaymentFrequencySchedCode] [nchar](1) NOT NULL,
	[PolicyPremiumNotes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PolicyPremiumSchedule] PRIMARY KEY CLUSTERED 
(
	[PolicyPremiumScheduleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremiumPayments]    Script Date: 2/5/2020 5:49:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumPayments](
	[PremiumPaymentID] [bigint] NOT NULL,
	[PolicyPremiumScheduleID] [bigint] NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[PaymentMethod] [nchar](10) NOT NULL,
	[PaymentProfileId] [bigint] NULL,
	[AmountPaid] [decimal](15, 2) NOT NULL,
	[ApprovalCode] [nvarchar](30) NULL,
	[CheckImageUri] [nvarchar](250) NULL,
	[PaymentNotes] [nvarchar](500) NULL,
 CONSTRAINT [PK_PremiumPayments] PRIMARY KEY CLUSTERED 
(
	[PremiumPaymentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClaimAdjustments]  WITH CHECK ADD  CONSTRAINT [FK_ClaimAdjustments_PolicyClaims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PolicyClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[ClaimAdjustments] CHECK CONSTRAINT [FK_ClaimAdjustments_PolicyClaims]
GO
ALTER TABLE [dbo].[ClaimAdjustments]  WITH CHECK ADD  CONSTRAINT [FK_ClaimAdjustments_PolicyHolderProperty] FOREIGN KEY([PhPID])
REFERENCES [dbo].[PolicyHolderProperty] ([PhPID])
GO
ALTER TABLE [dbo].[ClaimAdjustments] CHECK CONSTRAINT [FK_ClaimAdjustments_PolicyHolderProperty]
GO
ALTER TABLE [dbo].[ClaimAttachements]  WITH CHECK ADD  CONSTRAINT [FK_ClaimAttachements_PolicyClaims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PolicyClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[ClaimAttachements] CHECK CONSTRAINT [FK_ClaimAttachements_PolicyClaims]
GO
ALTER TABLE [dbo].[ClaimPayments]  WITH CHECK ADD  CONSTRAINT [FK_ClaimPayments_PolicyClaims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PolicyClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[ClaimPayments] CHECK CONSTRAINT [FK_ClaimPayments_PolicyClaims]
GO
ALTER TABLE [dbo].[CoveredParties]  WITH CHECK ADD  CONSTRAINT [FK_CoveredParties_Policies] FOREIGN KEY([PolicyNumber])
REFERENCES [dbo].[Policies] ([PolicyNumber])
GO
ALTER TABLE [dbo].[CoveredParties] CHECK CONSTRAINT [FK_CoveredParties_Policies]
GO
ALTER TABLE [dbo].[CoveredParties]  WITH CHECK ADD  CONSTRAINT [FK_CoveredParties_PolicyParties] FOREIGN KEY([PolicyPartyID])
REFERENCES [dbo].[PolicyParties] ([PolicyPartyID])
GO
ALTER TABLE [dbo].[CoveredParties] CHECK CONSTRAINT [FK_CoveredParties_PolicyParties]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_Policies_PaymentProfiles] FOREIGN KEY([PaymentProfileID])
REFERENCES [dbo].[PaymentProfiles] ([PaymentProfileID])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_Policies_PaymentProfiles]
GO
ALTER TABLE [dbo].[PolicyClaimants]  WITH CHECK ADD  CONSTRAINT [FK_PolicyClaimants_PolicyClaims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[PolicyClaims] ([ClaimID])
GO
ALTER TABLE [dbo].[PolicyClaimants] CHECK CONSTRAINT [FK_PolicyClaimants_PolicyClaims]
GO
ALTER TABLE [dbo].[PolicyClaims]  WITH CHECK ADD  CONSTRAINT [FK_PolicyClaims_Policies] FOREIGN KEY([PolicyNumber])
REFERENCES [dbo].[Policies] ([PolicyNumber])
GO
ALTER TABLE [dbo].[PolicyClaims] CHECK CONSTRAINT [FK_PolicyClaims_Policies]
GO
ALTER TABLE [dbo].[PolicyHolderProperty]  WITH CHECK ADD  CONSTRAINT [FK_PolicyHolderProperty_CoverageItemCodes] FOREIGN KEY([CoverageItemCode])
REFERENCES [dbo].[CoverageItemCodes] ([CoverageItemCode])
GO
ALTER TABLE [dbo].[PolicyHolderProperty] CHECK CONSTRAINT [FK_PolicyHolderProperty_CoverageItemCodes]
GO
ALTER TABLE [dbo].[PolicyHolderProperty]  WITH CHECK ADD  CONSTRAINT [FK_PolicyHolderProperty_Policies] FOREIGN KEY([PolicyNumber])
REFERENCES [dbo].[Policies] ([PolicyNumber])
GO
ALTER TABLE [dbo].[PolicyHolderProperty] CHECK CONSTRAINT [FK_PolicyHolderProperty_Policies]
GO
ALTER TABLE [dbo].[PolicyParties_Address_History]  WITH CHECK ADD  CONSTRAINT [FK_PolicyParties_Address_History_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[PolicyParties_Address_History] CHECK CONSTRAINT [FK_PolicyParties_Address_History_Address]
GO
ALTER TABLE [dbo].[PolicyParties_Address_History]  WITH CHECK ADD  CONSTRAINT [FK_PolicyParties_Address_History_PolicyParties] FOREIGN KEY([PolicyPartyID])
REFERENCES [dbo].[PolicyParties] ([PolicyPartyID])
GO
ALTER TABLE [dbo].[PolicyParties_Address_History] CHECK CONSTRAINT [FK_PolicyParties_Address_History_PolicyParties]
GO
ALTER TABLE [dbo].[PolicyPremiumLineItems]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPremiumLineItems_PolicyPremiumSchedule] FOREIGN KEY([PolicyPremiumScheduleID])
REFERENCES [dbo].[PolicyPremiumSchedule] ([PolicyPremiumScheduleID])
GO
ALTER TABLE [dbo].[PolicyPremiumLineItems] CHECK CONSTRAINT [FK_PolicyPremiumLineItems_PolicyPremiumSchedule]
GO
ALTER TABLE [dbo].[PolicyPremiumSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPremiumSchedule_Policies] FOREIGN KEY([PolicyNumber])
REFERENCES [dbo].[Policies] ([PolicyNumber])
GO
ALTER TABLE [dbo].[PolicyPremiumSchedule] CHECK CONSTRAINT [FK_PolicyPremiumSchedule_Policies]
GO
ALTER TABLE [dbo].[PremiumPayments]  WITH CHECK ADD  CONSTRAINT [FK_PremiumPayments_PolicyPremiumSchedule] FOREIGN KEY([PolicyPremiumScheduleID])
REFERENCES [dbo].[PolicyPremiumSchedule] ([PolicyPremiumScheduleID])
GO
ALTER TABLE [dbo].[PremiumPayments] CHECK CONSTRAINT [FK_PremiumPayments_PolicyPremiumSchedule]
GO
