USE [master]
GO
/****** Object:  Database [AKSS_Management]    Script Date: 14-01-2025 12:57:49 AM ******/
CREATE DATABASE [AKSS_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AKSS_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AKSS_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AKSS_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AKSS_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AKSS_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AKSS_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AKSS_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AKSS_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AKSS_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AKSS_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AKSS_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [AKSS_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AKSS_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AKSS_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AKSS_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AKSS_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AKSS_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AKSS_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AKSS_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AKSS_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AKSS_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AKSS_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AKSS_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AKSS_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AKSS_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AKSS_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AKSS_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AKSS_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AKSS_Management] SET RECOVERY FULL 
GO
ALTER DATABASE [AKSS_Management] SET  MULTI_USER 
GO
ALTER DATABASE [AKSS_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AKSS_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AKSS_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AKSS_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AKSS_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AKSS_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AKSS_Management', N'ON'
GO
ALTER DATABASE [AKSS_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [AKSS_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AKSS_Management]
GO
/****** Object:  Table [dbo].[AKM_Mst_Client_Follow_Up]    Script Date: 14-01-2025 12:57:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AKM_Mst_Client_Follow_Up](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Client_Name] [nvarchar](100) NULL,
	[Client_Age] [nvarchar](100) NULL,
	[Client_Gender] [nvarchar](10) NULL,
	[Client_DOB] [nvarchar](20) NULL,
	[Client_Description] [nvarchar](max) NULL,
	[Category] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[Open_Hours] [nvarchar](400) NULL,
	[Website] [nvarchar](100) NULL,
	[Direction] [nvarchar](100) NULL,
	[Ratting] [nvarchar](100) NULL,
	[Mobile_No] [nvarchar](20) NULL,
	[Telephone_No] [nvarchar](20) NULL,
	[Email_Id] [nvarchar](100) NULL,
	[Twitter_Profile] [nvarchar](100) NULL,
	[Facebook_Profile] [nvarchar](100) NULL,
	[Instagram_Profile] [nvarchar](100) NULL,
	[Linkedin_Profile] [nvarchar](100) NULL,
	[Call_Received] [nvarchar](100) NULL,
	[Whatsapp_Message] [nvarchar](100) NULL,
	[Follow_Up_Date_Time] [nvarchar](40) NULL,
	[Follow_Up_Reason] [nvarchar](100) NULL,
	[New_Follow_Up_Date_Time] [nvarchar](40) NULL,
	[New_Follow_Up_Reason] [nvarchar](100) NULL,
	[TaxID] [nvarchar](50) NULL,
	[PaymentTerms] [nvarchar](100) NULL,
	[PreferredPaymentMethod] [nvarchar](50) NULL,
	[AccountManager] [nvarchar](100) NULL,
	[AnnualRevenue] [decimal](18, 2) NULL,
	[NumberOfEmployees] [int] NULL,
	[SocialMediaHandle] [nvarchar](100) NULL,
	[PreferredLanguage] [nvarchar](50) NULL,
	[TimeZone] [nvarchar](50) NULL,
	[SubscriptionStatus] [nvarchar](50) NULL,
	[ReferralSource] [nvarchar](100) NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractEndDate] [datetime] NULL,
	[ServiceLevelAgreement] [nvarchar](100) NULL,
	[TechnicalSupportContact] [nvarchar](100) NULL,
	[ProjectedGrowthRate] [decimal](5, 2) NULL,
	[LastContactedDate] [datetime] NULL,
	[RiskRating] [int] NULL,
	[PreferredContactMethod] [nvarchar](50) NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[CustomerFeedbackScore] [decimal](3, 2) NULL,
	[RiskAssessmentNotes] [nvarchar](max) NULL,
	[MarketingOptIn] [bit] NULL,
	[PreferredShippingMethod] [nvarchar](50) NULL,
	[LoyaltyProgramMember] [bit] NULL,
	[AccountBalance] [decimal](18, 2) NULL,
	[LastInvoiceDate] [datetime] NULL,
	[LegalEntity] [nvarchar](100) NULL,
	[SustainabilityRating] [nvarchar](10) NULL,
	[ComplianceStatus] [nvarchar](50) NULL,
	[RenewalDate] [datetime] NULL,
	[ContractValue] [decimal](18, 2) NULL,
	[ParentCompany] [nvarchar](100) NULL,
	[ChildCompanies] [nvarchar](max) NULL,
	[AccountStatus] [nvarchar](50) NULL,
	[LastActivityDate] [datetime] NULL,
	[PreferredCurrency] [nvarchar](50) NULL,
	[SupportTier] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[MarketingSegment] [nvarchar](50) NULL,
	[ClientPriority] [nvarchar](50) NULL,
	[SalesRepresentative] [nvarchar](100) NULL,
	[StrategicImportance] [nvarchar](50) NULL,
	[OnboardingStatus] [nvarchar](50) NULL,
	[RenewalNotificationDate] [datetime] NULL,
	[ClientSince] [datetime] NULL,
	[EstimatedLifetimeValue] [decimal](18, 2) NULL,
	[InvoicingFrequency] [nvarchar](50) NULL,
	[ContractStatus] [nvarchar](50) NULL,
	[SupportContact] [nvarchar](100) NULL,
	[BillingContact] [nvarchar](100) NULL,
	[EmergencyContact] [nvarchar](100) NULL,
	[BackupContact] [nvarchar](100) NULL,
	[BusinessHours] [nvarchar](50) NULL,
	[PreferredContactDays] [nvarchar](50) NULL,
	[PreferredContactTimes] [nvarchar](50) NULL,
	[PartnershipStatus] [nvarchar](50) NULL,
	[EngagementScore] [decimal](5, 2) NULL,
	[ClientInitiatedProjects] [int] NULL,
	[LastFeedbackDate] [datetime] NULL,
	[PreferredInvoiceFormat] [nvarchar](50) NULL,
	[RiskMitigationPlan] [nvarchar](max) NULL,
	[ClientGoals] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMIS_Create_Billing_Expenses]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMIS_Create_Billing_Expenses](
	[Billing_Expenses_ID] [int] IDENTITY(1,1) NOT NULL,
	[Billing_Party_Name_Or_Expenses] [nvarchar](max) NULL,
	[Amount] [nvarchar](max) NULL,
	[Date] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Billing_Expenses_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMIS_Create_Lab_Report]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMIS_Create_Lab_Report](
	[Lab_Report_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Lab_Report_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMIS_Create_Medicine]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMIS_Create_Medicine](
	[Medicine_ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Category] [nvarchar](100) NULL,
	[Dose_Interval] [nvarchar](100) NULL,
	[Before_Meal] [bit] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Medicine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMIS_CREATE_PATIENT]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMIS_CREATE_PATIENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](100) NULL,
	[Middle_Name] [nvarchar](100) NULL,
	[Last_Name] [nvarchar](100) NULL,
	[Country_Code] [nvarchar](100) NULL,
	[Contact_Number] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Gender] [nvarchar](20) NULL,
	[Age] [nvarchar](10) NULL,
	[Blood_Group] [nvarchar](100) NULL,
	[Weight] [nvarchar](10) NULL,
	[Height] [nvarchar](10) NULL,
	[BP] [nvarchar](10) NULL,
	[Symptoms] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMIS_Mst_Clinic]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMIS_Mst_Clinic](
	[Clinic_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clinic_Name] [nvarchar](max) NULL,
	[Clinic_Email] [nvarchar](100) NULL,
	[Doctor_Name] [nvarchar](100) NULL,
	[Doctor_Degree] [nvarchar](100) NULL,
	[Doctor_Specialization] [nvarchar](100) NULL,
	[Country_Code] [nvarchar](10) NULL,
	[Contact_Number] [nvarchar](20) NULL,
	[Clinic_Telephone_Number] [nvarchar](20) NULL,
	[Old_Case_Price] [nvarchar](100) NULL,
	[New_Case_Price] [nvarchar](100) NULL,
	[Clinic_Address] [nvarchar](max) NULL,
	[Working_Hours] [nvarchar](max) NULL,
	[Special_Notes] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreateDate_Time] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate_Time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Clinic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpDemo]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpDemo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[role] [varchar](100) NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineMaster]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineMaster](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineCode] [nvarchar](50) NOT NULL,
	[MedicineName] [nvarchar](255) NOT NULL,
	[GenericName] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[BatchNumber] [nvarchar](100) NULL,
	[ExpiryDate] [date] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](100) NULL,
	[GSTPercentage] [decimal](5, 2) NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](500) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AKM_Mst_Client_Follow_Up] ON 

INSERT [dbo].[AKM_Mst_Client_Follow_Up] ([ClientID], [Client_Name], [Client_Age], [Client_Gender], [Client_DOB], [Client_Description], [Category], [Country], [State], [City], [Address1], [Address2], [Open_Hours], [Website], [Direction], [Ratting], [Mobile_No], [Telephone_No], [Email_Id], [Twitter_Profile], [Facebook_Profile], [Instagram_Profile], [Linkedin_Profile], [Call_Received], [Whatsapp_Message], [Follow_Up_Date_Time], [Follow_Up_Reason], [New_Follow_Up_Date_Time], [New_Follow_Up_Reason], [TaxID], [PaymentTerms], [PreferredPaymentMethod], [AccountManager], [AnnualRevenue], [NumberOfEmployees], [SocialMediaHandle], [PreferredLanguage], [TimeZone], [SubscriptionStatus], [ReferralSource], [ContractStartDate], [ContractEndDate], [ServiceLevelAgreement], [TechnicalSupportContact], [ProjectedGrowthRate], [LastContactedDate], [RiskRating], [PreferredContactMethod], [CreditLimit], [CustomerFeedbackScore], [RiskAssessmentNotes], [MarketingOptIn], [PreferredShippingMethod], [LoyaltyProgramMember], [AccountBalance], [LastInvoiceDate], [LegalEntity], [SustainabilityRating], [ComplianceStatus], [RenewalDate], [ContractValue], [ParentCompany], [ChildCompanies], [AccountStatus], [LastActivityDate], [PreferredCurrency], [SupportTier], [Region], [MarketingSegment], [ClientPriority], [SalesRepresentative], [StrategicImportance], [OnboardingStatus], [RenewalNotificationDate], [ClientSince], [EstimatedLifetimeValue], [InvoicingFrequency], [ContractStatus], [SupportContact], [BillingContact], [EmergencyContact], [BackupContact], [BusinessHours], [PreferredContactDays], [PreferredContactTimes], [PartnershipStatus], [EngagementScore], [ClientInitiatedProjects], [LastFeedbackDate], [PreferredInvoiceFormat], [RiskMitigationPlan], [ClientGoals], [Notes], [IsActive], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (1, N'Shree Sai Clinic', N'', N'Male', N'', N'', N'Medical clinic mod', N'India', N'Maharashtra', N'Kalyan', N'Kalyan - Bhiwandi Rd, opposite KTM Showroom
mod', N'', N'Open
Closes 10:30 pm', N'', N'Directions', N'4.5', N'090291 89423', N'', N'', N'', N'', N'', N'', N'Yes', N'Yes', N'', N'Not reciving Call', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Will try again', 1, N'Akshay Kodam', CAST(N'2025-01-04T07:20:30.223' AS DateTime), N'Akshay Kodam', CAST(N'2025-01-06T02:33:19.013' AS DateTime))
INSERT [dbo].[AKM_Mst_Client_Follow_Up] ([ClientID], [Client_Name], [Client_Age], [Client_Gender], [Client_DOB], [Client_Description], [Category], [Country], [State], [City], [Address1], [Address2], [Open_Hours], [Website], [Direction], [Ratting], [Mobile_No], [Telephone_No], [Email_Id], [Twitter_Profile], [Facebook_Profile], [Instagram_Profile], [Linkedin_Profile], [Call_Received], [Whatsapp_Message], [Follow_Up_Date_Time], [Follow_Up_Reason], [New_Follow_Up_Date_Time], [New_Follow_Up_Reason], [TaxID], [PaymentTerms], [PreferredPaymentMethod], [AccountManager], [AnnualRevenue], [NumberOfEmployees], [SocialMediaHandle], [PreferredLanguage], [TimeZone], [SubscriptionStatus], [ReferralSource], [ContractStartDate], [ContractEndDate], [ServiceLevelAgreement], [TechnicalSupportContact], [ProjectedGrowthRate], [LastContactedDate], [RiskRating], [PreferredContactMethod], [CreditLimit], [CustomerFeedbackScore], [RiskAssessmentNotes], [MarketingOptIn], [PreferredShippingMethod], [LoyaltyProgramMember], [AccountBalance], [LastInvoiceDate], [LegalEntity], [SustainabilityRating], [ComplianceStatus], [RenewalDate], [ContractValue], [ParentCompany], [ChildCompanies], [AccountStatus], [LastActivityDate], [PreferredCurrency], [SupportTier], [Region], [MarketingSegment], [ClientPriority], [SalesRepresentative], [StrategicImportance], [OnboardingStatus], [RenewalNotificationDate], [ClientSince], [EstimatedLifetimeValue], [InvoicingFrequency], [ContractStatus], [SupportContact], [BillingContact], [EmergencyContact], [BackupContact], [BusinessHours], [PreferredContactDays], [PreferredContactTimes], [PartnershipStatus], [EngagementScore], [ClientInitiatedProjects], [LastFeedbackDate], [PreferredInvoiceFormat], [RiskMitigationPlan], [ClientGoals], [Notes], [IsActive], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (2, N'Highland Super Speciality Clinic', N'', N'Male', N'', N'', N'Medical clinic', N'India', N'Maharashtra', N'Bhiwandi', N'', N'', N'', N'', N'Directions', N'', N'', N'', N'', N'', N'', N'', N'', N'No', N'No', N'', N'number not present', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Not possible to contact,
every thing is blank', 1, N'Akshay Kodam', CAST(N'2025-01-04T07:24:55.517' AS DateTime), N'Akshay Kodam', CAST(N'2025-01-05T22:38:57.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[AKM_Mst_Client_Follow_Up] OFF
GO
SET IDENTITY_INSERT [dbo].[CMIS_CREATE_PATIENT] ON 

INSERT [dbo].[CMIS_CREATE_PATIENT] ([ID], [First_Name], [Middle_Name], [Last_Name], [Country_Code], [Contact_Number], [Email], [Gender], [Age], [Blood_Group], [Weight], [Height], [BP], [Symptoms], [Address], [Notes], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (1, N'akshay', N'ashok', N'kodam', N'+91', N'09833812843', N'Akshaykodam1994@gmail.com', N'Male', N'30', N'B positive (8%)', N'59', N'5.3', N'20', N'Cough mod', N'Mumbai mod', N'Fever mod', N'CreatedBy', NULL, N'ModifiedBy', CAST(N'2025-01-14T00:10:14.340' AS DateTime))
INSERT [dbo].[CMIS_CREATE_PATIENT] ([ID], [First_Name], [Middle_Name], [Last_Name], [Country_Code], [Contact_Number], [Email], [Gender], [Age], [Blood_Group], [Weight], [Height], [BP], [Symptoms], [Address], [Notes], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (7, N'jitendra', N'p_jitu', N'Rajput', N'+91', N'9889789878', N'jitu@gmail.com', N'Male', N'32', N'O negative (13%)', N'67', N'5.8', N'34', N'Back Pain', N'Nalasupara east', N'Testeer', N'CreatedBy', CAST(N'2025-01-13T19:58:04.790' AS DateTime), NULL, NULL)
INSERT [dbo].[CMIS_CREATE_PATIENT] ([ID], [First_Name], [Middle_Name], [Last_Name], [Country_Code], [Contact_Number], [Email], [Gender], [Age], [Blood_Group], [Weight], [Height], [BP], [Symptoms], [Address], [Notes], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (8, N'Nitin', N'p_Nitin', N'Yadav', N'+91', N'3456765430', N'Nitu@gmail.com', N'Male', N'30', N'A positive (30%)', N'76', N'6.2', N'49', N'Neck Pain', N'Nalasupara north', N'Bum pain', N'CreatedBy', CAST(N'2025-01-13T19:59:23.520' AS DateTime), NULL, NULL)
INSERT [dbo].[CMIS_CREATE_PATIENT] ([ID], [First_Name], [Middle_Name], [Last_Name], [Country_Code], [Contact_Number], [Email], [Gender], [Age], [Blood_Group], [Weight], [Height], [BP], [Symptoms], [Address], [Notes], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (9, N'ranjeet', N'p_ranjeet', N'Kumar', N'+92', N'2345678909', N'ranjeet', N'Male', N'56', N'B positive (8%)', N'78', N'5.5', N'343', N'Stomach', N'Kavdiwali', N'DBA', N'CreatedBy', CAST(N'2025-01-13T20:00:38.163' AS DateTime), NULL, NULL)
INSERT [dbo].[CMIS_CREATE_PATIENT] ([ID], [First_Name], [Middle_Name], [Last_Name], [Country_Code], [Contact_Number], [Email], [Gender], [Age], [Blood_Group], [Weight], [Height], [BP], [Symptoms], [Address], [Notes], [CreatedBy], [CreateDate_Time], [ModifiedBy], [ModifiedDate_Time]) VALUES (10, N'Mastan', N'p_mastan', N'Shaikh', N'+91', N'3456543212', N'mastan@gmail.com', N'Male', N'23', N'A positive (30%)', N'90', N'5.8', N'342', N'Nose pain', N'jogeshwari', N'ABM', N'CreatedBy', CAST(N'2025-01-13T20:01:46.200' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CMIS_CREATE_PATIENT] OFF
GO
SET IDENTITY_INSERT [dbo].[EmpDemo] ON 

INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (1, N'akshay', N'admin', 20000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (2, N'mastan', N'abm', 35000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (3, N'ram', N'dba', 50000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (4, N'jitendra', N'tester', 45000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (5, N'sham', N'wings', 3990)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (6, N'priti mod', N'playboy', 59800)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (7, N'mony', N'dancer', 50000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (8, N'baba', N'writer eng', 69320)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (9, N'Booky1', N'azure devops', 90111)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (10, N'yakin', N'fullstack', 60000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (11, N'nitin yadav', N'azure devops', 78000)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (12, N'pintu', N'playboy', 98700)
INSERT [dbo].[EmpDemo] ([id], [name], [role], [salary]) VALUES (14, N'sham', N'wings', 3990)
SET IDENTITY_INSERT [dbo].[EmpDemo] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicineMaster] ON 

INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (1, N'MED001', N'Paracetamol 500mg', N'Acetaminophen', N'ABC Pharma', N'BATCH001', CAST(N'2025-06-30' AS Date), CAST(50.00 AS Decimal(10, 2)), 200, N'Tablet', N'Analgesic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (2, N'MED002', N'Ibuprofen 200mg', N'Ibuprofen', N'XYZ Labs', N'BATCH002', CAST(N'2024-12-15' AS Date), CAST(40.00 AS Decimal(10, 2)), 150, N'Tablet', N'Analgesic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (3, N'MED003', N'Amoxicillin 250mg', N'Amoxicillin', N'ABC Pharma', N'BATCH003', CAST(N'2024-09-30' AS Date), CAST(120.00 AS Decimal(10, 2)), 100, N'Capsule', N'Antibiotic', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (4, N'MED004', N'Ciprofloxacin 500mg', N'Ciprofloxacin', N'XYZ Labs', N'BATCH004', CAST(N'2025-03-20' AS Date), CAST(85.00 AS Decimal(10, 2)), 80, N'Tablet', N'Antibiotic', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (5, N'MED005', N'Aspirin 100mg', N'Acetylsalicylic Acid', N'ABC Pharma', N'BATCH005', CAST(N'2025-08-01' AS Date), CAST(30.00 AS Decimal(10, 2)), 300, N'Tablet', N'Antipyretic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (6, N'MED006', N'Naproxen 250mg', N'Naproxen', N'HealthCare Ltd.', N'BATCH006', CAST(N'2024-11-25' AS Date), CAST(65.00 AS Decimal(10, 2)), 120, N'Tablet', N'Antipyretic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (8, N'MED008', N'Pantoprazole 40mg', N'Pantoprazole', N'Healthy Pharma', N'BATCH008', CAST(N'2026-02-01' AS Date), CAST(55.00 AS Decimal(10, 2)), 100, N'Tablet', N'Antacid', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (9, N'MED009', N'Fluconazole 150mg', N'Fluconazole', N'Wellness Pharma', N'BATCH009', CAST(N'2025-12-01' AS Date), CAST(95.00 AS Decimal(10, 2)), 60, N'Capsule', N'Antifungal', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (10, N'MED010', N'Clotrimazole Cream', N'Clotrimazole', N'CareWell Pharma', N'BATCH010', CAST(N'2024-10-15' AS Date), CAST(75.00 AS Decimal(10, 2)), 50, N'Tube', N'Antifungal', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (11, N'MED011', N'Diclofenac Gel', N'Diclofenac', N'CareWell Pharma', N'BATCH011', CAST(N'2025-05-30' AS Date), CAST(45.00 AS Decimal(10, 2)), 70, N'Tube', N'Pain Reliever', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (12, N'MED012', N'Tramadol 50mg', N'Tramadol', N'SafeHealth Pharma', N'BATCH012', CAST(N'2024-08-25' AS Date), CAST(150.00 AS Decimal(10, 2)), 40, N'Capsule', N'Pain Reliever', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (13, N'MED013', N'Vitamin C 500mg', N'Ascorbic Acid', N'NutriLife', N'BATCH013', CAST(N'2026-01-10' AS Date), CAST(30.00 AS Decimal(10, 2)), 300, N'Tablet', N'Vitamin', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (14, N'MED014', N'Vitamin D3 1000IU', N'Cholecalciferol', N'NutriLife', N'BATCH014', CAST(N'2025-12-15' AS Date), CAST(40.00 AS Decimal(10, 2)), 250, N'Tablet', N'Vitamin', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (15, N'MED015', N'Cetirizine 10mg', N'Cetirizine', N'SafeHealth Pharma', N'BATCH015', CAST(N'2025-04-30' AS Date), CAST(25.00 AS Decimal(10, 2)), 400, N'Tablet', N'Antihistamine', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (16, N'MED016', N'Loratadine 10mg', N'Loratadine', N'GoodCare Pharma', N'BATCH016', CAST(N'2024-09-20' AS Date), CAST(30.00 AS Decimal(10, 2)), 350, N'Tablet', N'Antihistamine', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (17, N'MED017', N'Amlodipine 5mg', N'Amlodipine', N'SafeHealth Pharma', N'BATCH017', CAST(N'2025-06-15' AS Date), CAST(60.00 AS Decimal(10, 2)), 180, N'Tablet', N'Antihypertensive', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (18, N'MED018', N'Losartan 50mg', N'Losartan', N'Wellness Pharma', N'BATCH018', CAST(N'2025-03-10' AS Date), CAST(70.00 AS Decimal(10, 2)), 150, N'Tablet', N'Antihypertensive', CAST(12.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (19, N'MED019', N'Metformin 500mg', N'Metformin', N'Healthy Pharma', N'BATCH019', CAST(N'2025-11-30' AS Date), CAST(45.00 AS Decimal(10, 2)), 200, N'Tablet', N'Antidiabetic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[MedicineMaster] ([MedicineId], [MedicineCode], [MedicineName], [GenericName], [Manufacturer], [BatchNumber], [ExpiryDate], [Price], [StockQuantity], [Unit], [Category], [GSTPercentage], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (20, N'MED020', N'Glimepiride 1mg', N'Glimepiride', N'NutriLife', N'BATCH020', CAST(N'2024-12-25' AS Date), CAST(35.00 AS Decimal(10, 2)), 220, N'Tablet', N'Antidiabetic', CAST(5.00 AS Decimal(5, 2)), N'Admin', CAST(N'2024-12-15T17:32:06.910' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[MedicineMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (1, N'Aky', N'Akshaykodam1994@gmail.com', N'YWRtaW4xMjM=', N'akshay kodam', N'Admin', N'919833812843', CAST(N'2025-01-05T05:24:26.150' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (2, N'jitu', N'jitu@gmail.com', N'aml0dXA=', N'Jitendraj purohit', N'User', N'9876543210', CAST(N'2025-01-05T08:06:32.787' AS DateTime), N'', NULL, NULL, 1)
INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (3, N'yakin', N'yakin@gmail.com', N'eWFraW4x', N'Yakindra Rawal', N'Admin', N'9988776655', CAST(N'2025-01-05T08:07:48.667' AS DateTime), N'', NULL, NULL, 0)
INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (4, N'Nitu', N'Nitu@gmail.com', N'bml0dXA=', N'Nitin Gupta', N'Admin', N'1122334455', CAST(N'2025-01-05T08:08:46.097' AS DateTime), N'', NULL, NULL, 1)
INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (5, N'mast', N'mastan@gmail.com', N'bWFzdGFucA==', N'Mastan Shaikh', N'User', N'7766554433', CAST(N'2025-01-05T08:09:25.023' AS DateTime), N'', NULL, NULL, 1)
INSERT [dbo].[UserMaster] ([UserId], [UserName], [Email], [PasswordHash], [FullName], [Role], [PhoneNumber], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (6, N'ajaz', N'ajaz@gmail.com', N'YWphenA=', N'Ajaz Khan', N'Admin', N'5566778899', CAST(N'2025-01-05T08:09:59.800' AS DateTime), N'', CAST(N'2025-01-05T08:11:40.467' AS DateTime), N'', 1)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Medicine__EF7533381C1B378D]    Script Date: 14-01-2025 12:57:50 AM ******/
ALTER TABLE [dbo].[MedicineMaster] ADD UNIQUE NONCLUSTERED 
(
	[MedicineCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserMast__A9D10534F1CB19C7]    Script Date: 14-01-2025 12:57:50 AM ******/
ALTER TABLE [dbo].[UserMaster] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserMast__C9F28456231FB80D]    Script Date: 14-01-2025 12:57:50 AM ******/
ALTER TABLE [dbo].[UserMaster] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AKM_Mst_Client_Follow_Up] ADD  DEFAULT ((0)) FOR [MarketingOptIn]
GO
ALTER TABLE [dbo].[AKM_Mst_Client_Follow_Up] ADD  DEFAULT ((0)) FOR [LoyaltyProgramMember]
GO
ALTER TABLE [dbo].[AKM_Mst_Client_Follow_Up] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AKM_Mst_Client_Follow_Up] ADD  DEFAULT (getdate()) FOR [CreateDate_Time]
GO
ALTER TABLE [dbo].[AKM_Mst_Client_Follow_Up] ADD  DEFAULT (getdate()) FOR [ModifiedDate_Time]
GO
ALTER TABLE [dbo].[MedicineMaster] ADD  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[MedicineMaster] ADD  DEFAULT ((0)) FOR [GSTPercentage]
GO
ALTER TABLE [dbo].[MedicineMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MedicineMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ('User') FOR [Role]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  StoredProcedure [dbo].[AKSS_CODE]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--USE akss_management

-- exec dbo.GenerateAutomaticCRUDStoredProcedureByTableName_New 'DoctorMaster'
----------------------------------------------------------------------------
/* This will Generate Automatic CRUD Stored Procedure By Taking Table Name as a Parameter
	given below how to execute a Stored Procedure
	eg : 
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_DBA = 'DBA' 
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'Page_Full_Functionality'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'Namespaces'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'Page_Load'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BindOnFirstPageLoad'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'GetMaxId'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'Bind_GV'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'txtId_TextChanged'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'txtClientName_TextChanged'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'CheckClientExistOrNot'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnSave_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnOnlySave_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnOnlyUpdate_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnDelete_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnReset_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'BtnExportToExcel_Click'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'VerifyRenderingInServerForm'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperPageFunction = 'ClearAll'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Full_Functionality'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_DataBound'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCommand'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCreated'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDataBound'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDeleted'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDeleting'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowEditing'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCancelingEdit'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowUpdated'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowUpdating'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_SelectedIndexChanged'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_PageIndexChanging'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Sorting'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Sorted'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
	EXEC dbo.[AKSS_CODE] @TableName = 'CMIS_CREATE_PATIENT',@SQL_Developer = 'DEVELOPER',@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1'
*/

CREATE PROCEDURE [dbo].[AKSS_CODE]
    @TableName NVARCHAR(MAX) = NULL,
	@SQL_Flag NVARCHAR(MAX) = NULL,
	@SQL_SubFlag NVARCHAR(MAX) = NULL,
	@SQL_Developer NVARCHAR(MAX) = NULL,
	@SQL_DBA NVARCHAR(MAX) = NULL,
	@SQL_Designer NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperPageFunction NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperGVFunctionality NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperCSharpLogic NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperStringFunction NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperMathFunciton NVARCHAR(MAX) = NULL,
	@SQL_Developer_DdlDeveloperDateFunciton NVARCHAR(MAX) = NULL
AS
BEGIN

	--SET STATISTICS IO ON;

	SET NOCOUNT ON

	--IF EXISTS (SELECT 1 FROM tempdb.sys.tables WHERE name LIKE '#TestTable%')
	--SELECT '#TestTable Exists';
 
	--IF EXISTS (SELECT * FROM tempdb.INFORMATION_SCHEMA.Tables 
	--		   WHERE Table_Name Like '#TestTable%')
	--SELECT '#TestTable Exists';
 
	--IF EXISTS (SELECT * FROM #TestTable) 
	--SELECT '#TestTable Exists';
 
	--IF EXISTS (SELECT * FROM sys.objects WHERE NAME = '#TestTable')
	--SELECT '#TestTable Exists';
 
	--IF OBJECT_ID('tempdb.dbo.#TestTable') > 0
	--SELECT '#TestTable Exists';

	IF OBJECT_ID('tempdb.dbo.#TEMP_RESULT') IS NOT NULL
	BEGIN
		DROP TABLE #TEMP_RESULT
		SELECT '#TempTable Exists';
	END	
	IF OBJECT_ID('tempdb.dbo.#TEMP_RESULT') IS NULL
	BEGIN
			CREATE TABLE #TEMP_RESULT
			(
				RESULT NVARCHAR(MAX) 	
			)
	END
	

	--IF EXISTS( SELECT * FROM tempdb.sys.TABLES WHERE NAME LIKE '%#TEMP_RESULT%')
	--BEGIN
	--	DROP TABLE #TEMP_RESULT
	--END	
	--ELSE
	--BEGIN
	--		CREATE TABLE #TEMP_RESULT
	--		(
	--			RESULT NVARCHAR(MAX) 	
	--		)
	--END
	 
    DECLARE @SQL NVARCHAR(MAX) = N'';
	DECLARE @SQL1 NVARCHAR(MAX) = N'';
	DECLARE @SQL2 NVARCHAR(MAX) = N'';
	DECLARE @SQL3 NVARCHAR(MAX) = N'';
	DECLARE @SQL4 NVARCHAR(MAX) = N'';
	DECLARE @SQL5 NVARCHAR(MAX) = N'';
    DECLARE @PrimaryKey NVARCHAR(128) = null;
    DECLARE @ColumnList NVARCHAR(MAX) = N'';
	DECLARE @ColumnList_vertical_column NVARCHAR(MAX) = N'';	
    DECLARE @ParameterList NVARCHAR(MAX) = N'';
	DECLARE @ParameterList_Main NVARCHAR(MAX) = N'';
	DECLARE @ParameterListUpdate NVARCHAR(MAX) = N'';
	DECLARE @Alter_Create_SP_Name NVARCHAR(MAX) = N'';
	DECLARE @ParameterListUpdate_final NVARCHAR(MAX) = N'';
	DECLARE @UPDATE_COMMMA_POSITION INT

    -- Get primary key
    set @PrimaryKey = (SELECT top 1 COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName)

	--select @PrimaryKey as Primarykey

	-- Get column names for the table
	
    SELECT @ColumnList += ( + COLUMN_NAME + ',')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	-- Get column names in vertical column of the table
    SELECT @ColumnList_vertical_column += ( + COLUMN_NAME + CHAR(13) )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
	
	-- Generate parameter list for dynamic stored procedure
    SELECT @ParameterList_Main += 
       ('@' + ((COLUMN_NAME + ' ' + DATA_TYPE +  CASE WHEN  CHARACTER_MAXIMUM_LENGTH IS NULL THEN '' ELSE '(' +CAST( CHARACTER_MAXIMUM_LENGTH AS VARCHAR (20) )+')' END )) + ' = NULL,' + CHAR(13) )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	-- Generate parameter list for dynamic stored procedure
    SELECT @ParameterList += 
        ('@' + COLUMN_NAME + ',') 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	SELECT @ParameterListUpdate += 
        --(  COLUMN_NAME + ' = @' + COLUMN_NAME +  ','  + CHAR(13) + '	') 
		(  COLUMN_NAME + ' = @' + COLUMN_NAME +  ',' ) 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	SET @UPDATE_COMMMA_POSITION = (select CHARINDEX(',',@ParameterListUpdate) AS MatchPosition);

	SET @ParameterListUpdate_final = (SELECT RTRIM(LTRIM((SUBSTRING(@ParameterListUpdate, @UPDATE_COMMMA_POSITION + 1, LEN(@ParameterListUpdate)) ))) AS ExtractString)

	--SELECT @ParameterListUpdate_final AS ParameterListUpdate_final
	
	SET @ColumnList = LEFT(@ColumnList, LEN(@ColumnList) - 1);	
	SET @ParameterList = LEFT(@ParameterList, LEN(@ParameterList) - 1);
	SET @ParameterListUpdate = LEFT(@ParameterListUpdate, LEN(@ParameterListUpdate) - 1);
	SET @ParameterListUpdate_final = RTRIM(LTRIM(LEFT(@ParameterListUpdate_final, LEN(@ParameterListUpdate_final) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
	SET @ParameterListUpdate_final = REPLACE(@ParameterListUpdate_final,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
	
	--select @ColumnList as ColumnList
	--select @ColumnList_vertical_column as ColumnList_vertical_column
	--select @ParameterList as ParameterList
	--select @ParameterListUpdate as ParameterListUpdate
	--select @ParameterList_Main as ParameterList_Main
	--select @ParameterListUpdate_final as ParameterListUpdate_final

    -- Generate CRUD stored procedure
		   
	if NOT exists (select * from sysobjects where id = object_id('dbo.CRUD_' + @TableName + '') and xtype = 'P' )
	BEGIN
		--select 'not exists'
		set @Alter_Create_SP_Name = 'CREATE '
	END
	else
	begin 
			set @Alter_Create_SP_Name = 'ALTER '
	--	select 'exists' 
	end
    
	---######### STARTS HERE #################

	/*
	    @TableName NVARCHAR(MAX) = NULL,
		@SQL_Flag NVARCHAR(MAX) = NULL,
		@SQL_SubFlag NVARCHAR(MAX) = NULL,
		@SQL_Developer NVARCHAR(MAX) = NULL,
		@SQL_DBA NVARCHAR(MAX) = NULL,
		@SQL_Designer NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperPageFunction NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperGVFunctionality NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperCSharpLogic NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperStringFunction NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperMathFunciton NVARCHAR(MAX) = NULL,
		@SQL_Developer_DdlDeveloperDateFunciton NVARCHAR(MAX) = NULL,
	*/

	IF (@SQL_Developer = 'DEVELOPER')-- tab
	BEGIN
			--SELECT '' AS DEVELOPER
			IF (@SQL_Developer_DdlDeveloperPageFunction = 'Namespaces') -- Ddl DdlPageFunction
			BEGIN

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SET @SQL5 += (  SELECT top 1  ('new SqlParameter("@'+ COLUMN_NAME+'" * "'+COLUMN_NAME+'")') 			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName)
			
			SET @SQL += N'' +CHAR(13) + 
'
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Web.Security;
using ClosedXML.Excel;
using System.IO;
using System.Configuration;

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

			END												
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'Page_Load') -- Ddl DdlPageFunction
			BEGIN
					
					SET @SQL += N'' +CHAR(13) + 
'
protected void Page_Load(object sender, EventArgs e)
{
	if (!IsPostBack)
	{
		if (Request.QueryString["ClientId"] != null)
		{
			// int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
			txtClientId.Text = Request.QueryString["ClientId"].ToString();
			txtClientId_TextChanged(sender, e);
		}
		else
		{
			BindOnFirstPageLoad();
		}
                     	
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BindOnFirstPageLoad') -- Ddl DdlPageFunction
			BEGIN
					SET @SQL += N'' +CHAR(13) + 
'public void BindOnFirstPageLoad()
 {
 	BtnSave.Text = "Submit";
 	GetMaxId();
 	Bind_gvClientFollowUpMaster();
 } ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'GetMaxId') -- Ddl DdlPageFunction
			BEGIN
					SET @SQL += N'' +CHAR(13) + 
'public async void GetMaxId()
 {
	try
	{
		string spname = "CRUD_'+@TableName+'";
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "GetMaxId"),
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
						 
		if (dt.Rows.Count > 0)
		{
			if (dt.Rows[0]["ClientID"].ToString() != "")
			{
				txtClientId.Text = dt.Rows[0]["ClientID"].ToString();
			}
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "GetMaxId", "alert(''Data Not Present !'');", true);
		}
	}
	catch
	{
		throw;
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'Bind_GV') -- Ddl DdlPageFunction
			BEGIN
					SET @SQL += N'' +CHAR(13) + 
'public async void Bind_GV()
 {
	try
	{
		string spname = "CRUD_'+@TableName+'";
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "GET_ALL"),
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
				 
		if (dt.Rows.Count > 0)
		{
			gv.DataSource = dt;
			gv.DataBind();
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert(''Data Not Present !'');", true);
			gv.DataSource = null;
			gv.DataBind();
		}
	}
	catch
	{
		throw;
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END			
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'txtId_TextChanged') -- Ddl DdlPageFunction
			BEGIN

			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
						 FROM INFORMATION_SCHEMA.COLUMNS
						 WHERE TABLE_NAME = @TableName	)				

					SET @SQL1 += N'' +CHAR(13) + 
'protected async void txtClientId_TextChanged(object sender, EventArgs e)
{																	 
	try																	 
	{																	 
		string spname = "CRUD_'+@TableName+'";				 
		BtnSave.Text = "Modify";										 
		SqlParameter[] parameters = {									 
			new SqlParameter("@CRUD_Action", "GET_BY_ID"),				 
			new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim())) 
		};																			 								
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
																									
		if (dt.Rows.Count > 0)																		
		{																							
			if ('+ @SQL5 +')																			
			{																						
		'																							 	

					SET @SQL2 += N'' +CHAR(13) + '		// txtUserId.Text = dt.Rows[0]["UserId"].ToString();' 
					
					select @SQL3 += '' +CHAR(13) + 
					('		CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["'+COLUMN_NAME+'"].ToString();' )
					FROM INFORMATION_SCHEMA.COLUMNS
					WHERE TABLE_NAME = @TableName

					SET @SQL4 += N'' +CHAR(13) + '						 
				if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)				
				{																	
					ChkActive.Checked = true;										
				}																	
				else																
				{																	
					ChkActive.Checked = false;										
				}																	
																					
			}																		
		}																			
		else																		
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert(''Data Not Present !'');", true);	
		}																			
	}																				
	catch																			
	{																			    
		throw;																		
	}																				
}' +  CHAR(13) +															
					'' + CHAR(13) 

					SET @SQL = @SQL1 + @SQL2 + @SQL3 + @SQL4 + N'' +CHAR(13) ;				
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

			END		
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'txtClientName_TextChanged') -- Ddl DdlPageFunction
			BEGIN

			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
						 FROM INFORMATION_SCHEMA.COLUMNS
						 WHERE TABLE_NAME = @TableName	)				

					SET @SQL += N'' +CHAR(13) + 
'
protected async void txtClientName_TextChanged(object sender, EventArgs e)
{
	try
	{
		string spname = "CRUD_'+@TableName+'";                
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_CLIENT_NAME"),
			new SqlParameter("@Client_Name",  txtClientName.Text.Trim())
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
					 
		if (dt.Rows.Count > 0)
		{
			if ('+ @SQL5 +')
			{                        
				txtClientName.Text = dt.Rows[0]["Client_Name"].ToString();
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientName_TextChanged", "alert(''Same Client Name Is Already Exists !'');", true);
			}
		}
		else
		{
			// ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert(''Data Not Present !'');", true);
		}
	}
	catch
	{
		throw;
	}
}' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'CheckClientExistOrNot') -- Ddl DdlPageFunction
			BEGIN

						SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
						 FROM INFORMATION_SCHEMA.COLUMNS
						 WHERE TABLE_NAME = @TableName	)				

					SET @SQL += N'' +CHAR(13) + 
'
public async Task<bool> CheckClientExistOrNot()
{
  try
  {
 	bool user_exists_bool = false;
 	string spname = "CRUD_'+@TableName+'";
 	SqlParameter[] parameters = {
 		new SqlParameter("@CRUD_Action", "CHECK_CLIENT_EXISTS"),
 		new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim())),
 		//new SqlParameter("@Client_Name", txtClientName.Text.Trim())
 	};
 	DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
 
 	if (dt.Rows.Count > 0)
 	{
 		if ('+ @SQL5 +')
 		{							 				
 			user_exists_bool = true;							 
 		}
 	}
 	else
 	{
 		// ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckClientExistOrNot", "alert(''Data Not Present !'');", true);
 		user_exists_bool = false;
 	}
 	return user_exists_bool;
 }
 catch
 {
 	throw;
 }
}' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END			
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnSave_Click') -- Ddl DdlPageFunction
			BEGIN

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnSave_Click(object sender, EventArgs e)
{             
        Task<bool> ClientExist = CheckClientExistOrNot();

        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;

            if (await ClientExist != true)
            {
                CRUD_Action = "CREATE";
                CreatedBy = ""; // session username
            }
            else
            {
                CRUD_Action = "UPDATE";
                ModifiedBy = ""; // session username
            }

            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {
                if (await ClientExist != true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert(''Saved Succefully !'');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert(''Updated Succefully !'');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "e1", "alert(''Data Not Saved !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END			
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnOnlySave_Click') -- Ddl DdlPageFunction
			BEGIN

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnOnlySave_Click(object sender, EventArgs e)
{             
        
        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;
           
            CRUD_Action = "CREATE";
            CreatedBy = ""; // session username
                        
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {               
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert(''Saved Succefully !'');", true);
                ClearAll();
                BindOnFirstPageLoad();                             
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "e1", "alert(''Data Not Saved !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnOnlyUpdate_Click') -- Ddl DdlPageFunction
			BEGIN

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnOnlyUpdate_Click(object sender, EventArgs e)
{                     
        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;
           
            CRUD_Action = "UPDATE";
            CreatedBy = ""; // session username
                        
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {               
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert(''Updated Succefully !'');", true);
                ClearAll();
                BindOnFirstPageLoad();                             
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u2", "alert(''Data Not Updated !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnDelete_Click') -- Ddl DdlPageFunction
			BEGIN

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SET @SQL5 += (  SELECT top 1  ('new SqlParameter("@'+ COLUMN_NAME+'" , "'+COLUMN_NAME+'")') 			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName)
			
			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnDelete_Click(object sender, EventArgs e)
{
    try
    {
        string spname = "CRUD_'+@TableName+'";
        SqlParameter[] parameters = {

        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),

        //new SqlParameter("@ClientID", Convert.ToInt32(txtClientId.Text.Trim())),

		'+ @SQL5 +'

        };

        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

        if (i > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert(''Record Deleted Succefully !'');", true);
            ClearAll();
            BindOnFirstPageLoad();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D2", "alert(''Data Not Deleted !'');", true);
        }
    }
    catch
    {
        throw;
    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnReset_Click') -- Ddl DdlPageFunction
			BEGIN
			 
			SET @SQL += N'' +CHAR(13) + 
'
protected void BtnReset_Click(object sender, EventArgs e)
{
    ClearAll();
    BindOnFirstPageLoad();
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'BtnExportToExcel_Click') -- Ddl DdlPageFunction
			BEGIN
			 
			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnExportToExcel_Click(object sender, EventArgs e)
{
    string spname = "CRUD_'+@TableName+'";
    SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
        };
    DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

    if (dt.Rows.Count > 0)
    {
        // dt = city.GetAllCity();//your datatable
        //string attachment = "attachment; filename=ClientFollowUp.xls";
        //Response.ClearContent();
        //Response.AddHeader("content-disposition", attachment);
        //Response.ContentType = "application/vnd.ms-excel";
        //string tab = "";
        //foreach (DataColumn dc in dt.Columns)
        //{
        //    Response.Write(tab + dc.ColumnName);
        //    tab = "\t";
        //}
        //Response.Write("\n");
        //int i;
        //foreach (DataRow dr in dt.Rows)
        //{
        //    tab = "";
        //    for (i = 0; i < dt.Columns.Count; i++)
        //    {
        //        Response.Write(tab + dr[i].ToString());
        //        tab = "\t";
        //    }
        //    Response.Write("\n");
        //}
        //Response.End();

        using ( XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dt, "ClientFollowUp");

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=ClientFollowUpList.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'VerifyRenderingInServerForm') -- Ddl DdlPageFunction
			BEGIN
			 
			SET @SQL += N'' +CHAR(13) + 
'
public override void VerifyRenderingInServerForm(Control control)
{
    //required to avoid the runtime error "
    //Control ''GridView1'' of type ''GridView'' must be placed inside a form tag with runat=server."
}

' +  CHAR(13)
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END					
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'ClearAll') -- Ddl DdlPageFunction
			BEGIN
			 
			SET @SQL += N'' +CHAR(13) + 
'
public void ClearAll()
{             
    txtClientId.Text = string.Empty;
    txtClientName.Text = string.Empty;
    txtAge.Text = string.Empty;
    DdlGender.SelectedIndex = 0;
    txtDOB.Text = string.Empty;
    txtDescription.Text = string.Empty;
    txtCategory.Text = string.Empty;
    DdlCountry.SelectedIndex = 0;
    DdlState.SelectedIndex = 0;
    DdlCity.SelectedIndex = 0;
    txtAddress1.Text = string.Empty;
    txtAddress2.Text = string.Empty;
    txtOpenHours.Text = string.Empty;
    txtWebsite.Text = string.Empty;
    txtDirection.Text = string.Empty;
    txtRating.Text = string.Empty;
    txtMobileNumber.Text = string.Empty;
    txtTelephoneNumber.Text = string.Empty;
    txtEmailId.Text = string.Empty;
    txtTwitter.Text = string.Empty;
    txtFacebook.Text = string.Empty;
    txtInstagram.Text = string.Empty;
    txtLinkedin.Text = string.Empty;
    DdlCallReceived.SelectedIndex = 0;
    DdlWhatsApp.SelectedIndex = 0;
    txtFollowUpDateTime.Text = string.Empty;
    txtFollowUpReason.Text = string.Empty;
    txtNewFollowUpDateTime.Text = string.Empty;
    txtNewFollowUpReason.Text = string.Empty;
    txtNotes.Text = string.Empty;
    ChkActive.Checked = false;
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END		
			
			ELSE IF (@SQL_Developer_DdlDeveloperPageFunction = 'Page_Full_Functionality') -- Ddl DdlDeveloperGVFunctionality
			BEGIN
			
			-----------------------------------------START Page_Full_Functionality---------------------------------------------------------------

			
-- 1 ) Namespaces
 SET @SQL += N'' +CHAR(13) + 
'
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Web.Security;
using ClosedXML.Excel;
using System.IO;
using System.Configuration;
'

	INSERT INTO #TEMP_RESULT
	(RESULT)
	VALUES 
	((SELECT @SQL))

	SET @SQL = '';

-- 2 ) Page_Load	
SET @SQL += N'' +CHAR(13) + 
'
protected void Page_Load(object sender, EventArgs e)
{
	if (!IsPostBack)
	{
		if (Request.QueryString["ClientId"] != null)
		{
			// int ClientId = Convert.ToInt32(Request.QueryString["ClientId"].ToString());
			txtClientId.Text = Request.QueryString["ClientId"].ToString();
			txtClientId_TextChanged(sender, e);
		}
		else
		{
			BindOnFirstPageLoad();
		}
                     	
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
	SET @SQL = '';

-- 3 ) BindOnFirstPageLoad	

					SET @SQL += N'' +CHAR(13) + 
'public void BindOnFirstPageLoad()
 {
 	BtnSave.Text = "Submit";
 	GetMaxId();
 	Bind_gvClientFollowUpMaster();
 } ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
	SET @SQL = '';
	
-- 4 ) GetMaxId	
					SET @SQL += N'' +CHAR(13) + 
'public async void GetMaxId()
 {
	try
	{
		string spname = "CRUD_'+@TableName+'";
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "GetMaxId"),
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
						 
		if (dt.Rows.Count > 0)
		{
			if (dt.Rows[0]["ClientID"].ToString() != "")
			{
				txtClientId.Text = dt.Rows[0]["ClientID"].ToString();
			}
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "GetMaxId", "alert(''Data Not Present !'');", true);
		}
	}
	catch
	{
		throw;
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
	SET @SQL = '';
	
-- 5 ) Bind_GV	
					SET @SQL += N'' +CHAR(13) + 
'public async void Bind_GV()
 {
	try
	{
		string spname = "CRUD_'+@TableName+'";
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "GET_ALL"),
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
				 
		if (dt.Rows.Count > 0)
		{
			gv.DataSource = dt;
			gv.DataBind();
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Bind_GV", "alert(''Data Not Present !'');", true);
			gv.DataSource = null;
			gv.DataBind();
		}
	}
	catch
	{
		throw;
	}
} ' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
	SET @SQL = '';
	
-- 6 ) txtId_TextChanged	

			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
						 FROM INFORMATION_SCHEMA.COLUMNS
						 WHERE TABLE_NAME = @TableName	)				

					SET @SQL1 += N'' +CHAR(13) + 
'protected async void txtClientId_TextChanged(object sender, EventArgs e)
{																	 
	try																	 
	{																	 
		string spname = "CRUD_'+@TableName+'";				 
		BtnSave.Text = "Modify";										 
		SqlParameter[] parameters = {									 
			new SqlParameter("@CRUD_Action", "GET_BY_ID"),				 
			new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim())) 
		};																			 								
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
																									
		if (dt.Rows.Count > 0)																		
		{																							
			if ('+ @SQL5 +')																			
			{																						
		'																							 	

					SET @SQL2 += N'' +CHAR(13) + '		// txtUserId.Text = dt.Rows[0]["UserId"].ToString();' 
					
					select @SQL3 += '' +CHAR(13) + 
					('		CONTROLLER_NAME.CONTROLLER_PROPERTY = dt.Rows[0]["'+COLUMN_NAME+'"].ToString();' )
					FROM INFORMATION_SCHEMA.COLUMNS
					WHERE TABLE_NAME = @TableName

					SET @SQL4 += N'' +CHAR(13) + '						 
				if (Convert.ToBoolean(dt.Rows[0]["IsActive"]) == true)				
				{																	
					ChkActive.Checked = true;										
				}																	
				else																
				{																	
					ChkActive.Checked = false;										
				}																	
																					
			}																		
		}																			
		else																		
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert(''Data Not Present !'');", true);	
		}																			
	}																				
	catch																			
	{																			    
		throw;																		
	}																				
}' +  CHAR(13) +															
					'' + CHAR(13) 

					SET @SQL = @SQL1 + @SQL2 + @SQL3 + @SQL4 + N'' +CHAR(13) ;				
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

	SET @SQL = '';

-- 7 ) txtClientName_TextChanged	


			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
						 FROM INFORMATION_SCHEMA.COLUMNS
						 WHERE TABLE_NAME = @TableName	)				

					SET @SQL += N'' +CHAR(13) + 
'
protected async void txtClientName_TextChanged(object sender, EventArgs e)
{
	try
	{
		string spname = "CRUD_'+@TableName+'";                
		SqlParameter[] parameters = {
			new SqlParameter("@CRUD_Action", "CHECK_DUPLICATE_CLIENT_NAME"),
			new SqlParameter("@Client_Name",  txtClientName.Text.Trim())
		};
		DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
					 
		if (dt.Rows.Count > 0)
		{
			if ('+ @SQL5 +')
			{                        
				txtClientName.Text = dt.Rows[0]["Client_Name"].ToString();
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientName_TextChanged", "alert(''Same Client Name Is Already Exists !'');", true);
			}
		}
		else
		{
			// ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "txtClientId_TextChanged", "alert(''Data Not Present !'');", true);
		}
	}
	catch
	{
		throw;
	}
}' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

	SET @SQL = '';
	SET @SQL5 = '';

-- 8 ) CheckClientExistOrNot

	SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @TableName	)				

					SET @SQL += N'' +CHAR(13) + 
'
public async Task<bool> CheckClientExistOrNot()
{
  try
  {
 	bool user_exists_bool = false;
 	string spname = "CRUD_'+@TableName+'";
 	SqlParameter[] parameters = {
 		new SqlParameter("@CRUD_Action", "CHECK_CLIENT_EXISTS"),
 		new SqlParameter("@ClientID", Convert.ToInt32( txtClientId.Text.Trim())),
 		//new SqlParameter("@Client_Name", txtClientName.Text.Trim())
 	};
 	DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);
 
 	if (dt.Rows.Count > 0)
 	{
 		if ('+ @SQL5 +')
 		{							 				
 			user_exists_bool = true;							 
 		}
 	}
 	else
 	{
 		// ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "CheckClientExistOrNot", "alert(''Data Not Present !'');", true);
 		user_exists_bool = false;
 	}
 	return user_exists_bool;
 }
 catch
 {
 	throw;
 }
}' +  CHAR(13) +
'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
	SET @SQL = '';
	SET @SQL5 = '';

-- 9) BtnSave_Click

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnSave_Click(object sender, EventArgs e)
{             
        Task<bool> ClientExist = CheckClientExistOrNot();

        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;

            if (await ClientExist != true)
            {
                CRUD_Action = "CREATE";
                CreatedBy = ""; // session username
            }
            else
            {
                CRUD_Action = "UPDATE";
                ModifiedBy = ""; // session username
            }

            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {
                if (await ClientExist != true)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert(''Saved Succefully !'');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert(''Updated Succefully !'');", true);
                    ClearAll();
                    BindOnFirstPageLoad();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "e1", "alert(''Data Not Saved !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
	SET @SQL = '';
	SET @SQL5 = '';

-- 10) BtnOnlySave_Click

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnOnlySave_Click(object sender, EventArgs e)
{             
        
        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;
           
            CRUD_Action = "CREATE";
            CreatedBy = ""; // session username
                        
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {               
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "s1", "alert(''Saved Succefully !'');", true);
                ClearAll();
                BindOnFirstPageLoad();                             
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "e1", "alert(''Data Not Saved !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
		
	SET @SQL = '';
	SET @SQL5 = '';
	
-- 11) BtnOnlyUpdate_Click


--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SELECT @SQL5 += ('new SqlParameter("@'+COLUMN_NAME+'" * "'+COLUMN_NAME+'"),')			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName
			
			SET @SQL5 = RTRIM(LTRIM(LEFT(@SQL5, LEN(@SQL5) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
			SET @SQL5 = REPLACE(@SQL5,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
			SET @SQL5 = REPLACE(@SQL5, '*' , (',')); -- THIS WILL ONLY REPLACE * WITH , (COMMA)
			--SELECT @SQL5 AS SQL5			

			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnOnlyUpdate_Click(object sender, EventArgs e)
{                     
        try
        {
            string spname = "CRUD_'+@TableName+'";
            string CRUD_Action = string.Empty;
            string CreatedBy = string.Empty;
            string ModifiedBy = string.Empty;
           
            CRUD_Action = "UPDATE";
            CreatedBy = ""; // session username
                        
            SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", CRUD_Action),

	'+ @SQL5 +' 
				
	};

            int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

            if (i > 0)
            {               
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u1", "alert(''Updated Succefully !'');", true);
                ClearAll();
                BindOnFirstPageLoad();                             
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "u2", "alert(''Data Not Updated !'');", true);
            }
        }
        catch
        {
            throw;
        }
    }

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

	SET @SQL = '';
	SET @SQL5 = '';

-- 12) BtnDelete_Click				

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 

			SET @SQL5 += (  SELECT top 1  ('new SqlParameter("@'+ COLUMN_NAME+'" * "'+COLUMN_NAME+'")') 			   								
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @TableName)
			
			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnDelete_Click(object sender, EventArgs e)
{
    try
    {
        string spname = "CRUD_'+@TableName+'";
        SqlParameter[] parameters = {

        new SqlParameter("@CRUD_Action", "DELETE_BY_ID"),

        //new SqlParameter("@ClientID", Convert.ToInt32(txtClientId.Text.Trim())),

		'+ @SQL5 +'

        };

        int i = await CommonUtility.ExecuteStoredProcedureNonQueryAsync(spname, parameters);

        if (i > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D1", "alert(''Record Deleted Succefully !'');", true);
            ClearAll();
            BindOnFirstPageLoad();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "D2", "alert(''Data Not Deleted !'');", true);
        }
    }
    catch
    {
        throw;
    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

	SET @SQL = '';
	SET @SQL5 = '';

-- 13) BtnReset_Click				

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
 
			SET @SQL += N'' +CHAR(13) + 
'
protected void BtnReset_Click(object sender, EventArgs e)
{
    ClearAll();
    BindOnFirstPageLoad();
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
	
	
	SET @SQL = '';
	SET @SQL5 = '';

-- 14) BtnExportToExcel_Click	


--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
 
			SET @SQL += N'' +CHAR(13) + 
'
protected async void BtnExportToExcel_Click(object sender, EventArgs e)
{
    string spname = "CRUD_'+@TableName+'";
    SqlParameter[] parameters = {
            new SqlParameter("@CRUD_Action", "GET_ALL")
        };
    DataTable dt = await CommonUtility.ExecuteStoredProcedureDataTableAsync(spname, parameters);

    if (dt.Rows.Count > 0)
    {
        // dt = city.GetAllCity();//your datatable
        //string attachment = "attachment; filename=ClientFollowUp.xls";
        //Response.ClearContent();
        //Response.AddHeader("content-disposition", attachment);
        //Response.ContentType = "application/vnd.ms-excel";
        //string tab = "";
        //foreach (DataColumn dc in dt.Columns)
        //{
        //    Response.Write(tab + dc.ColumnName);
        //    tab = "\t";
        //}
        //Response.Write("\n");
        //int i;
        //foreach (DataRow dr in dt.Rows)
        //{
        //    tab = "";
        //    for (i = 0; i < dt.Columns.Count; i++)
        //    {
        //        Response.Write(tab + dr[i].ToString());
        //        tab = "\t";
        //    }
        //    Response.Write("\n");
        //}
        //Response.End();

        using ( XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dt, "ClientFollowUp");

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=ClientFollowUpList.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
	SET @SQL = '';
	SET @SQL5 = '';

-- 15) VerifyRenderingInServerForm

--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
 
			SET @SQL += N'' +CHAR(13) + 
'
public override void VerifyRenderingInServerForm(Control control)
{
    //required to avoid the runtime error "
    //Control ''GridView1'' of type ''GridView'' must be placed inside a form tag with runat=server."
}

' +  CHAR(13)
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
	SET @SQL = '';
	SET @SQL5 = '';

-- 16) ClearAll


--			SET @SQL5 = (SELECT TOP 1 ('dt.Rows[0]["'+ COLUMN_NAME +'"].ToString() != ""') 
 
			SET @SQL += N'' +CHAR(13) + 
'
public void ClearAll()
{             
    txtClientId.Text = string.Empty;
    txtClientName.Text = string.Empty;
    txtAge.Text = string.Empty;
    DdlGender.SelectedIndex = 0;
    txtDOB.Text = string.Empty;
    txtDescription.Text = string.Empty;
    txtCategory.Text = string.Empty;
    DdlCountry.SelectedIndex = 0;
    DdlState.SelectedIndex = 0;
    DdlCity.SelectedIndex = 0;
    txtAddress1.Text = string.Empty;
    txtAddress2.Text = string.Empty;
    txtOpenHours.Text = string.Empty;
    txtWebsite.Text = string.Empty;
    txtDirection.Text = string.Empty;
    txtRating.Text = string.Empty;
    txtMobileNumber.Text = string.Empty;
    txtTelephoneNumber.Text = string.Empty;
    txtEmailId.Text = string.Empty;
    txtTwitter.Text = string.Empty;
    txtFacebook.Text = string.Empty;
    txtInstagram.Text = string.Empty;
    txtLinkedin.Text = string.Empty;
    DdlCallReceived.SelectedIndex = 0;
    DdlWhatsApp.SelectedIndex = 0;
    txtFollowUpDateTime.Text = string.Empty;
    txtFollowUpReason.Text = string.Empty;
    txtNewFollowUpDateTime.Text = string.Empty;
    txtNewFollowUpReason.Text = string.Empty;
    txtNotes.Text = string.Empty;
    ChkActive.Checked = false;
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				


			-----------------------------------------END Page_Full_Functionality---------------------------------------------------------------


			END
			
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			PRINT ' in GridView1 '

			SET @SQL += N'' +CHAR(13) + 
'
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
     OnDataBound="GridView1_DataBound"
     OnRowCommand="GridView1_RowCommand"
     OnRowCreated="GridView1_RowCreated"
     OnRowDataBound="GridView1_RowDataBound"
     OnRowDeleted="GridView1_RowDeleted"
     OnRowDeleting="GridView1_RowDeleting"
     OnRowEditing="GridView1_RowEditing"
     OnRowCancelingEdit="GridView1_RowCancelingEdit"
     OnRowUpdated="GridView1_RowUpdated"
     OnRowUpdating="GridView1_RowUpdating"
     OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
     OnPageIndexChanging="GridView1_PageIndexChanging"
     OnSorting="GridView1_Sorting"
     OnSorted="GridView1_Sorted"
     AllowPaging="True" DataKeyNames="Id" AllowSorting="true">
     <Columns>
         <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
         <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
         <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
         <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
         <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
     </Columns>
</asp:GridView>
<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
' +  CHAR(13) +
					'' + CHAR(13) 
			
			PRINT @SQL

			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Full_Functionality') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

--			SET @SQL += N'' +CHAR(13) + 
--'
--string connectionString = string.Empty;
--    protected void Page_Load(object sender, EventArgs e)
--    {
--        connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
--        if (!IsPostBack)
--        {
--            {
--                BindGridView();
--            }
--        }
--    }
--    private string SortDirection
--    {
--        get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
--        set { ViewState["SortDirection"] = value; }
--    }
--    private void BindGridView(string sortExpression = null)
--    {
 
--        string query = "SELECT * FROM Employee";
 
--        using (SqlConnection connection = new SqlConnection(connectionString))
--        {
--            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
--            DataTable table = new DataTable();
--            adapter.Fill(table);
 
--            if (sortExpression != null)
--            {
--                DataView dv = table.AsDataView();
--                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
 
--                dv.Sort = sortExpression + " " + this.SortDirection;
--                GridView1.DataSource = dv;
--            }
--            else
--            {
--                GridView1.DataSource = table;
--            }
--            GridView1.DataBind();
--        }
--    }
 
--    protected void GridView1_DataBound(object sender, EventArgs e)
--    {
--        // Example: Display a message after data binding
--        lblMessage.Text = "GridView data bound successfully!";
--    }
 
--    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
--    {
--        // Example: Modify row attributes during row creation
--        if (e.Row.RowType == DataControlRowType.DataRow)
--        {
--            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor=''lightgray'';";
--            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''white'';";
--        }
--    }
 
--    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
--    {
--        if (e.Row.RowType == DataControlRowType.DataRow)
--        {
--            // Retrieve the age value from the data source
--            DataRowView rowView = e.Row.DataItem as DataRowView;
--            if (rowView != null)
--            {
--                int age = Convert.ToInt32(rowView["Age"]);
--                if (age > 40)
--                {
--                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
--                }
--            }
--        }
--    }
 
--    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
--    {
--        GridView1.EditIndex = e.NewEditIndex;
--        BindGridView();
--    }
 
--    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
--    {
--        GridView1.EditIndex = -1;
--        BindGridView();
--    }
 
--    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
--    {
--        GridViewRow row = GridView1.Rows[e.RowIndex];
--        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
--        string name = ((TextBox)row.Cells[0].Controls[0]).Text;
--        string email = ((TextBox)row.Cells[1].Controls[0]).Text;
--        int age = Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text);
--        string country = ((TextBox)row.Cells[3].Controls[0]).Text;
 
--        // Update the record in the database
--        using (SqlConnection connection = new SqlConnection(connectionString))
--        {
--            connection.Open();
--            SqlCommand cmd = new SqlCommand("UPDATE Employee SET Name=@Name, Email=@Email, Age=@Age, Country=@Country WHERE Id=@Id", connection);
--            cmd.Parameters.AddWithValue("@Name", name);
--            cmd.Parameters.AddWithValue("@Email", email);
--            cmd.Parameters.AddWithValue("@Age", age);
--            cmd.Parameters.AddWithValue("@Country", country);
--            cmd.Parameters.AddWithValue("@Id", id);
--            cmd.ExecuteNonQuery();
--        }
 
--        GridView1.EditIndex = -1;
--        BindGridView();
--    }
 
 
--    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
--    {
--        lblMessage.Text = "GridView row updated successfully!";
--    }
 
--    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
--    {
--        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
 
--        // Delete the record from the database
--        using (SqlConnection connection = new SqlConnection(connectionString))
--        {
--            connection.Open();
--            SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE Id=@Id", connection);
--            cmd.Parameters.AddWithValue("@Id", id);
--            cmd.ExecuteNonQuery();
--        }
 
--        BindGridView();
--    }
 
 
--    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
--    {
--        if (e.Exception == null)
--        {
--            // Row deleted successfully
--            lblMessage.Text = "Row deleted successfully!";
--        }
--        else
--        {
--            // Handle exception if row deletion fails
--            lblMessage.Text = "Error deleting row: " + e.Exception.Message;
--        }
--    }
 
--    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
--    {
--        GridViewRow selectedRow = GridView1.SelectedRow;
--        if (selectedRow != null)
--        {
--            lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
--        }
--    }
 
--    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
--    {
--        GridView1.PageIndex = e.NewPageIndex;
--        BindGridView();
--    }
 
--    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
--    {
--        if (e.CommandName == "DeleteRow")
--        {
--            int rowIndex = Convert.ToInt32(e.CommandArgument);
--            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
 
--            // Delete the row from the database
--            // Your deletion logic here
 
--            lblMessage.Text = "Row deleted successfully!";
--            BindGridView(); // Refresh GridView after deletion
--        }
--    }
 
 
--    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
--    {
 
--        this.BindGridView(e.SortExpression);
--    }
 
 
--    protected void GridView1_Sorted(object sender, EventArgs e)
--    {
--        // Perform any post-sorting actions here
--        lblMessage.Text = "GridView sorted successfully!";
--    }
 
--}
--' +  CHAR(13) +
--					'' + CHAR(13) 
						    
 SET @SQL1 += N'' +CHAR(13) + 
'
string connectionString = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        if (!IsPostBack)
        {
            {
                BindGridView();
            }
        }
    }
    private string SortDirection
    {
        get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
        set { ViewState["SortDirection"] = value; }
    }
    private void BindGridView(string sortExpression = null)
    {
 
        string query = "SELECT * FROM Employee";
 
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataTable table = new DataTable();
            adapter.Fill(table);
 
            if (sortExpression != null)
            {
                DataView dv = table.AsDataView();
                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
 
                dv.Sort = sortExpression + " " + this.SortDirection;
                GridView1.DataSource = dv;
            }
            else
            {
                GridView1.DataSource = table;
            }
            GridView1.DataBind();
        }
    }
 
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        // Example: Display a message after data binding
        lblMessage.Text = "GridView data bound successfully!";
    }
 
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        // Example: Modify row attributes during row creation
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor=''lightgray'';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''white'';";
        }
    }
 '
 SET @SQL2 += N'' +CHAR(13) + 
 '
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Retrieve the age value from the data source
            DataRowView rowView = e.Row.DataItem as DataRowView;
            if (rowView != null)
            {
                int age = Convert.ToInt32(rowView["Age"]);
                if (age > 40)
                {
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
 
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }
 
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridView();
    }
 
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string name = ((TextBox)row.Cells[0].Controls[0]).Text;
        string email = ((TextBox)row.Cells[1].Controls[0]).Text;
        int age = Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text);
        string country = ((TextBox)row.Cells[3].Controls[0]).Text;
 
        // Update the record in the database
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Employee SET Name=@Name, Email=@Email, Age=@Age, Country=@Country WHERE Id=@Id", connection);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Age", age);
            cmd.Parameters.AddWithValue("@Country", country);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();
        }
 
        GridView1.EditIndex = -1;
        BindGridView();
    }
 
 '
 SET @SQL3 += N'' +CHAR(13) + 
 '
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        lblMessage.Text = "GridView row updated successfully!";
    }
 
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
 
        // Delete the record from the database
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE Id=@Id", connection);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();
        }
 
        BindGridView();
    }
 
 
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            // Row deleted successfully
            lblMessage.Text = "Row deleted successfully!";
        }
        else
        {
            // Handle exception if row deletion fails
            lblMessage.Text = "Error deleting row: " + e.Exception.Message;
        }
    }
 
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow selectedRow = GridView1.SelectedRow;
        if (selectedRow != null)
        {
            lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
        }
    }
 
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView();
    }
 
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
 
            // Delete the row from the database
            // Your deletion logic here
 
            lblMessage.Text = "Row deleted successfully!";
            BindGridView(); // Refresh GridView after deletion
        }
    }
 
 '


 SET @SQL4 += N'' +CHAR(13) + 
 '
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
 
        this.BindGridView(e.SortExpression);
    }
 
 
    protected void GridView1_Sorted(object sender, EventArgs e)
    {
        // Perform any post-sorting actions here
        lblMessage.Text = "GridView sorted successfully!";
    }
 
}
' +  CHAR(13) 			 
	
	INSERT INTO #TEMP_RESULT
	(RESULT)
	VALUES 
	((SELECT @SQL1)),
	((SELECT @SQL2)),
	((SELECT @SQL3)),
	((SELECT @SQL4))
	
	--SELECT RESULT  AS SQL_RESULT FROM #TEMP_RESULT

	--SELECT @SQL AS SQL_RESULT

	--SELECT RESULT as Result FROM #TEMP_RESULT

			END				
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_DataBound') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
DataBound Event: Occurs after the GridView is bound to a data source. 
This event is handy for performing tasks after data binding, 
such as displaying messages or modifying the GridView''s appearance.

protected void GridView1_DataBound(object sender, EventArgs e)
{
    // Example: Display a message after data binding
    lblMessage.Text = "GridView data bound successfully!";
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END					
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCommand') -- Ddl DdlDeveloperGVFunctionality
			BEGIN
 
			SET @SQL += N'' +CHAR(13) + 
'
//RowCommand Event: Occurs when a button is clicked in a GridView row. 
//You can handle different button clicks and perform corresponding actions.

protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
{
   if (e.CommandName == "DeleteRow")
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
 
        // Delete the row from the database
        // Your deletion logic here
 
        lblMessage.Text = "Row deleted successfully!";
        BindGridView(); // Refresh GridView after deletion
    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END																
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCreated') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//RowCreated Event: Occurs when a GridView row is created. 
//You can use this event to tweak row attributes or attach client-side scripts. 
//For instance, changing row colors on hover.

protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
{
    // Example: Modify row attributes during row creation
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor=''lightgray'';";
        e.Row.Attributes["onmouseout"] = "this.style.backgroundColor=''white'';";
    }
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDataBound') -- Ddl DdlDeveloperGVFunctionality
			BEGIN
 
			SET @SQL += N'' +CHAR(13) + 
'
//RowDataBound Event: Occurs when a GridView row is bound to data. 
//Use this event to customize row data dynamically. For example, 
//highlighting rows based on certain conditions like age > 40.

protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
{
     if (e.Row.RowType == DataControlRowType.DataRow)
 {
     // Retrieve the age value from the data source
     DataRowView rowView = e.Row.DataItem as DataRowView;
     if (rowView != null)
     {
         int age = Convert.ToInt32(rowView["Age"]);
         if (age > 40)
         {
             e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
         }
     }
 }
}
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDeleted') -- Ddl DdlDeveloperGVFunctionality
			BEGIN
 
			SET @SQL += N'' +CHAR(13) + 
'
//RowDeleted Event: Occurs after a row has been successfully deleted from the database. 
//You can handle exceptions and display error messages if deletion fails.

protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
{
    if (e.Exception == null)
    {
        // Row deleted successfully
        lblMessage.Text = "Row deleted successfully!";
    }
    else
    {
        // Handle exception if row deletion fails
        lblMessage.Text = "Error deleting row: " + e.Exception.Message;
    }
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowDeleting') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//RowDeleting Event: Occurs when a row''s Delete button is clicked. 
//Handle this event to delete the row from the database.

protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
{
    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
 
    // Delete the record from the database
    using (SqlConnection connection = new SqlConnection("YourConnectionString"))
    {
        connection.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Employee WHERE Id=@Id", connection);
        cmd.Parameters.AddWithValue("@Id", id);
        cmd.ExecuteNonQuery();
    }
 
    BindGridView();
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END					
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowEditing') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//RowEditing Event: Occurs when a row''s Edit button is clicked. 
//Handle this event to enable row editing functionality.

protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
{
    GridView1.EditIndex = e.NewEditIndex;
    BindGridView();
}


' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END																
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowCancelingEdit') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//RowCancelingEdit Event: Occurs when a row''s Cancel button is clicked during editing mode. 
//Use this event to cancel row editing and revert changes.

protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
{
    GridView1.EditIndex = -1;
    BindGridView();
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowUpdated') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//RowUpdated Event: Occurs after a row has been successfully updated in the database. 
//You can perform post-update actions here, like displaying a success message.

protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
{
    lblMessage.Text = "GridView row updated successfully!";
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_RowUpdating') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
  //RowUpdating Event: Occurs when a row''s Update button is clicked. 
  //Handle this event to update the database with edited row data.

protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
{
    GridViewRow row = GridView1.Rows[e.RowIndex];
        int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
        string name = ((TextBox)row.Cells[0].Controls[0]).Text;
        string email = ((TextBox)row.Cells[1].Controls[0]).Text;
        int age = int.Parse(((TextBox)row.Cells[2].Controls[0]).Text);
        string country = ((TextBox)row.Cells[3].Controls[0]).Text;
 
        // Update the database
        using (YourDbContext context = new YourDbContext())
        {
            var employee = context.Employees.Find(id);
            if (employee != null)
            {
                employee.Name = name;
                employee.Email = email;
                employee.Age = age;
                employee.Country = country;
                context.SaveChanges();
            }
        }
 
        GridView1.EditIndex = -1;
        BindGridView();
}


' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_SelectedIndexChanged') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//SelectedIndexChanged Event: Occurs when the selected index has changed. 
//You can use this event to perform actions based on the selected row, like displaying its data.

protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
{
   // Get the selected row and display its data
    GridViewRow selectedRow = GridView1.SelectedRow;
    if (selectedRow != null)
    {
        lblMessage.Text = "Selected Employee: " + selectedRow.Cells[0].Text + ", " + selectedRow.Cells[1].Text;
    }
}
' +  CHAR(13) +
					'' + CHAR(13) 
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
				
			END					
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_PageIndexChanging') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//PageIndexChanging Event: Occurs when the page index is changing. 
//Handle this event to implement paging functionality for the GridView.

protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
{
    GridView1.PageIndex = e.NewPageIndex;
    BindGridView();
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END																
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Sorting') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//Sorting and Sorted Events: Sorting event occurs when the sorting operation is performed, 
//and Sorted event occurs after the sorting operation is complete. 
//Handle these events to implement sorting functionality for the GridView.

protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
{
    this.BindGridView(e.SortExpression);
}
 
' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	
			ELSE IF (@SQL_Developer_DdlDeveloperGVFunctionality = 'GridView1_Sorted') -- Ddl DdlDeveloperGVFunctionality
			BEGIN

			SET @SQL += N'' +CHAR(13) + 
'
//Sorted event occurs after the sorting operation is complete. 
protected void GridView1_Sorted(object sender, EventArgs e)
{
    lblMessage.Text = "GridView sorted successfully!";
}

' +  CHAR(13) +
					'' + CHAR(13) 
				
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))
				
			END	

			
	END
	ELSE IF (@SQL_DBA = 'DBA')
	BEGIN			
			SET @SQL += N'' +CHAR(13) + 
				@Alter_Create_SP_Name + ' PROCEDURE dbo.CRUD_' + @TableName +  CHAR(13) +
				'' + @ParameterList_Main + 
                '@CRUD_Action NVARCHAR(100) = NULL ' + CHAR(13) +
                'AS BEGIN ' + CHAR(13) +
				'IF @CRUD_Action = ''GetMaxId''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
				'	SELECT isnull(max(' + @PrimaryKey + ')+ 1,1) as ' + @PrimaryKey + ' from '+ QUOTENAME(@TableName)  + CHAR(13) +                
				'END ' + CHAR(13) +
                'IF @CRUD_Action = ''CREATE''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	INSERT INTO ' + QUOTENAME(@TableName) +  CHAR(13) + '	(' + @ColumnList + ') ' + CHAR(13) + '	VALUES ' + CHAR(13) +'	(' + @ParameterList + '); ' + CHAR(13) +                 
                'END ' + CHAR(13) +
				'ELSE IF  @CRUD_Action = ''GET_ALL''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	SELECT ' + @ColumnList + ' FROM ' + QUOTENAME(@TableName) + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''GET_BY_ID''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	SELECT ' + @ColumnList + ' FROM ' + QUOTENAME(@TableName) + CHAR(13) + '	WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''UPDATE''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	UPDATE ' + QUOTENAME(@TableName) + CHAR(13) + 
				'	SET ' +  CHAR(13) + 
				'	' + @ParameterListUpdate_final + CHAR(13) +
				'	WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''DELETE_BY_ID''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	DELETE FROM ' + QUOTENAME(@TableName) + CHAR(13) + 
				'    WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE ' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	RAISERROR(''Invalid operation specified.'', 16, 1); ' + CHAR(13) +
                'END ' + CHAR(13) +
                'END;';
	
					
			INSERT INTO #TEMP_RESULT
			(RESULT)
			VALUES 
			((SELECT @SQL))

	END
	ELSE IF (@SQL_Designer = 'DESIGNER')
	BEGIN
			SELECT '' AS Designer
	END

	---######### ENDS HERE #################

    -- Execute the generated SQL to create the CRUD procedure
			
    --EXEC sp_executesql @SQL;

	SELECT RESULT as Result FROM #TEMP_RESULT

	PRINT @SQL
	
END;


GO
/****** Object:  StoredProcedure [dbo].[CRUD_AKM_Mst_Client_Follow_Up]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CRUD_AKM_Mst_Client_Follow_Up]
@ClientID int = NULL,
@Client_Name nvarchar(100) = NULL,
@Client_Age nvarchar(100) = NULL,
@Client_Gender nvarchar(10) = NULL,
@Client_DOB nvarchar(20) = NULL,
@Client_Description nvarchar(max) = NULL,
@Category nvarchar(100) = NULL,
@Country nvarchar(100) = NULL,
@State nvarchar(100) = NULL,
@City nvarchar(100) = NULL,
@Address1 nvarchar(max) = NULL,
@Address2 nvarchar(max) = NULL,
@Open_Hours nvarchar(400) = NULL,
@Website nvarchar(100) = NULL,
@Direction nvarchar(100) = NULL,
@Ratting nvarchar(100) = NULL,
@Mobile_No nvarchar(20) = NULL,
@Telephone_No nvarchar(20) = NULL,
@Email_Id nvarchar(100) = NULL,
@Twitter_Profile nvarchar(100) = NULL,
@Facebook_Profile nvarchar(100) = NULL,
@Instagram_Profile nvarchar(100) = NULL,
@Linkedin_Profile nvarchar(100) = NULL,
@Call_Received nvarchar(100) = NULL,
@Whatsapp_Message nvarchar(100) = NULL,
@Follow_Up_Date_Time nvarchar(40) = NULL,
@Follow_Up_Reason nvarchar(100) = NULL,
@New_Follow_Up_Date_Time nvarchar(40) = NULL,
@New_Follow_Up_Reason nvarchar(100) = NULL,
@TaxID nvarchar(50) = NULL,
@PaymentTerms nvarchar(100) = NULL,
@PreferredPaymentMethod nvarchar(50) = NULL,
@AccountManager nvarchar(100) = NULL,
@AnnualRevenue decimal = NULL,
@NumberOfEmployees int = NULL,
@SocialMediaHandle nvarchar(100) = NULL,
@PreferredLanguage nvarchar(50) = NULL,
@TimeZone nvarchar(50) = NULL,
@SubscriptionStatus nvarchar(50) = NULL,
@ReferralSource nvarchar(100) = NULL,
@ContractStartDate datetime = NULL,
@ContractEndDate datetime = NULL,
@ServiceLevelAgreement nvarchar(100) = NULL,
@TechnicalSupportContact nvarchar(100) = NULL,
@ProjectedGrowthRate decimal = NULL,
@LastContactedDate datetime = NULL,
@RiskRating int = NULL,
@PreferredContactMethod nvarchar(50) = NULL,
@CreditLimit decimal = NULL,
@CustomerFeedbackScore decimal = NULL,
@RiskAssessmentNotes nvarchar(max) = NULL,
@MarketingOptIn bit = NULL,
@PreferredShippingMethod nvarchar(50) = NULL,
@LoyaltyProgramMember bit = NULL,
@AccountBalance decimal = NULL,
@LastInvoiceDate datetime = NULL,
@LegalEntity nvarchar(100) = NULL,
@SustainabilityRating nvarchar(10) = NULL,
@ComplianceStatus nvarchar(50) = NULL,
@RenewalDate datetime = NULL,
@ContractValue decimal = NULL,
@ParentCompany nvarchar(100) = NULL,
@ChildCompanies nvarchar(max) = NULL,
@AccountStatus nvarchar(50) = NULL,
@LastActivityDate datetime = NULL,
@PreferredCurrency nvarchar(50) = NULL,
@SupportTier nvarchar(50) = NULL,
@Region nvarchar(50) = NULL,
@MarketingSegment nvarchar(50) = NULL,
@ClientPriority nvarchar(50) = NULL,
@SalesRepresentative nvarchar(100) = NULL,
@StrategicImportance nvarchar(50) = NULL,
@OnboardingStatus nvarchar(50) = NULL,
@RenewalNotificationDate datetime = NULL,
@ClientSince datetime = NULL,
@EstimatedLifetimeValue decimal = NULL,
@InvoicingFrequency nvarchar(50) = NULL,
@ContractStatus nvarchar(50) = NULL,
@SupportContact nvarchar(100) = NULL,
@BillingContact nvarchar(100) = NULL,
@EmergencyContact nvarchar(100) = NULL,
@BackupContact nvarchar(100) = NULL,
@BusinessHours nvarchar(50) = NULL,
@PreferredContactDays nvarchar(50) = NULL,
@PreferredContactTimes nvarchar(50) = NULL,
@PartnershipStatus nvarchar(50) = NULL,
@EngagementScore decimal = NULL,
@ClientInitiatedProjects int = NULL,
@LastFeedbackDate datetime = NULL,
@PreferredInvoiceFormat nvarchar(50) = NULL,
@RiskMitigationPlan nvarchar(max) = NULL,
@ClientGoals nvarchar(max) = NULL,
@Notes nvarchar(max) = NULL,
@IsActive bit = NULL,
@CreatedBy nvarchar(100) = NULL,
@CreateDate_Time datetime = NULL,
@ModifiedBy nvarchar(100) = NULL,
@ModifiedDate_Time datetime = NULL,
@CRUD_Action NVARCHAR(100) = NULL 
AS BEGIN 
IF @CRUD_Action = 'GetMaxId'
BEGIN 
	SELECT isnull(max(ClientID)+ 1,1) as ClientID from [AKM_Mst_Client_Follow_Up]
END 
ELSE IF @CRUD_Action = 'CHECK_DUPLICATE_CLIENT_NAME'
BEGIN 
	SELECT ClientID,Client_Name,IsActive FROM [AKM_Mst_Client_Follow_Up]
	WHERE Client_Name = @Client_Name
	--[ClientID] = @ClientID  AND IsActive = 1 and AND Client_Name = @Client_Name ; 
END 
ELSE IF @CRUD_Action = 'CHECK_CLIENT_EXISTS'
BEGIN 
	SELECT ClientID,Client_Name,IsActive FROM [AKM_Mst_Client_Follow_Up]
	WHERE [ClientID] = @ClientID 
	--AND IsActive = 1 and AND Client_Name = @Client_Name ; 
END 
ELSE IF @CRUD_Action = 'CREATE'
BEGIN 

	INSERT INTO [AKM_Mst_Client_Follow_Up]
	(Client_Name,Client_Age,Client_Gender,Client_DOB,Client_Description,Category,
	Country,State,City,Address1,Address2,Open_Hours,
	Website,Direction,Ratting,Mobile_No,Telephone_No,Email_Id,Twitter_Profile,Facebook_Profile,Instagram_Profile,Linkedin_Profile,
	Call_Received,Whatsapp_Message,Follow_Up_Date_Time,Follow_Up_Reason,New_Follow_Up_Date_Time,New_Follow_Up_Reason,
	TaxID,PaymentTerms,PreferredPaymentMethod,AccountManager,AnnualRevenue,NumberOfEmployees,SocialMediaHandle,PreferredLanguage,TimeZone,SubscriptionStatus,ReferralSource,ContractStartDate,ContractEndDate,ServiceLevelAgreement,TechnicalSupportContact,ProjectedGrowthRate,LastContactedDate,RiskRating,PreferredContactMethod,CreditLimit,CustomerFeedbackScore,RiskAssessmentNotes,MarketingOptIn,PreferredShippingMethod,LoyaltyProgramMember,AccountBalance,LastInvoiceDate,LegalEntity,SustainabilityRating,ComplianceStatus,RenewalDate,ContractValue,ParentCompany,ChildCompanies,AccountStatus,LastActivityDate,PreferredCurrency,SupportTier,Region,MarketingSegment,ClientPriority,SalesRepresentative,StrategicImportance,OnboardingStatus,RenewalNotificationDate,ClientSince,EstimatedLifetimeValue,InvoicingFrequency,ContractStatus,SupportContact,BillingContact,EmergencyContact,BackupContact,BusinessHours,PreferredContactDays,PreferredContactTimes,PartnershipStatus,EngagementScore,ClientInitiatedProjects,LastFeedbackDate,PreferredInvoiceFormat,RiskMitigationPlan,ClientGoals,
	Notes,IsActive,CreatedBy,CreateDate_Time) 

	VALUES 

	(@Client_Name,@Client_Age,@Client_Gender,@Client_DOB,@Client_Description,@Category,
	@Country,@State,@City,@Address1,@Address2,@Open_Hours,
	@Website,@Direction,@Ratting,@Mobile_No,@Telephone_No,@Email_Id,@Twitter_Profile,@Facebook_Profile,@Instagram_Profile,@Linkedin_Profile,
	@Call_Received,@Whatsapp_Message,@Follow_Up_Date_Time,@Follow_Up_Reason,@New_Follow_Up_Date_Time,@New_Follow_Up_Reason,
	@TaxID,@PaymentTerms,@PreferredPaymentMethod,@AccountManager,@AnnualRevenue,@NumberOfEmployees,@SocialMediaHandle,@PreferredLanguage,@TimeZone,@SubscriptionStatus,@ReferralSource,@ContractStartDate,@ContractEndDate,@ServiceLevelAgreement,@TechnicalSupportContact,@ProjectedGrowthRate,@LastContactedDate,@RiskRating,@PreferredContactMethod,@CreditLimit,@CustomerFeedbackScore,@RiskAssessmentNotes,@MarketingOptIn,@PreferredShippingMethod,@LoyaltyProgramMember,@AccountBalance,@LastInvoiceDate,@LegalEntity,@SustainabilityRating,@ComplianceStatus,@RenewalDate,@ContractValue,@ParentCompany,@ChildCompanies,@AccountStatus,@LastActivityDate,@PreferredCurrency,@SupportTier,@Region,@MarketingSegment,@ClientPriority,@SalesRepresentative,@StrategicImportance,@OnboardingStatus,@RenewalNotificationDate,@ClientSince,@EstimatedLifetimeValue,@InvoicingFrequency,@ContractStatus,@SupportContact,@BillingContact,@EmergencyContact,@BackupContact,@BusinessHours,@PreferredContactDays,@PreferredContactTimes,@PartnershipStatus,@EngagementScore,@ClientInitiatedProjects,@LastFeedbackDate,@PreferredInvoiceFormat,@RiskMitigationPlan,@ClientGoals,
	@Notes,@IsActive,'Akshay Kodam',GETDATE()); 

END 
ELSE IF  @CRUD_Action = 'GET_ALL'
BEGIN 

	--SELECT ClientID,ROW_NUMBER() over(order by ClientID) as RowNumber ,Client_Name,Client_Age,Client_Gender,Client_DOB,Client_Description,Category,
	--Country,State,City,Address1,Address2,Open_Hours,
	--Website,Direction,Ratting,Mobile_No,Telephone_No,Email_Id,Twitter_Profile,Facebook_Profile,Instagram_Profile,Linkedin_Profile,
	--Call_Received,Whatsapp_Message,Follow_Up_Date_Time,Follow_Up_Reason,New_Follow_Up_Date_Time,New_Follow_Up_Reason,
	--TaxID,PaymentTerms,PreferredPaymentMethod,AccountManager,AnnualRevenue,NumberOfEmployees,SocialMediaHandle,PreferredLanguage,TimeZone,SubscriptionStatus,ReferralSource,ContractStartDate,ContractEndDate,ServiceLevelAgreement,TechnicalSupportContact,ProjectedGrowthRate,LastContactedDate,RiskRating,PreferredContactMethod,CreditLimit,CustomerFeedbackScore,RiskAssessmentNotes,MarketingOptIn,PreferredShippingMethod,LoyaltyProgramMember,AccountBalance,LastInvoiceDate,LegalEntity,SustainabilityRating,ComplianceStatus,RenewalDate,ContractValue,ParentCompany,ChildCompanies,AccountStatus,LastActivityDate,PreferredCurrency,SupportTier,Region,MarketingSegment,ClientPriority,SalesRepresentative,StrategicImportance,OnboardingStatus,RenewalNotificationDate,ClientSince,EstimatedLifetimeValue,InvoicingFrequency,ContractStatus,SupportContact,BillingContact,EmergencyContact,BackupContact,BusinessHours,PreferredContactDays,PreferredContactTimes,PartnershipStatus,EngagementScore,ClientInitiatedProjects,LastFeedbackDate,PreferredInvoiceFormat,RiskMitigationPlan,ClientGoals,
	--Notes,IsActive,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time 
	--FROM [AKM_Mst_Client_Follow_Up]; 

	--SELECT ClientID,ROW_NUMBER() over(order by ClientID) as RowNumber ,Client_Name,Client_Age,Client_Gender,Client_DOB,Client_Description,Category,
	--Country,State,City,Address1,Address2,Open_Hours,
	--Website,Direction,Ratting,Mobile_No,Telephone_No,Email_Id,Twitter_Profile,Facebook_Profile,Instagram_Profile,Linkedin_Profile,
	--Call_Received,Whatsapp_Message,Follow_Up_Date_Time,Follow_Up_Reason,New_Follow_Up_Date_Time,New_Follow_Up_Reason,
	--Notes,IsActive,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time 
	--FROM [AKM_Mst_Client_Follow_Up]; 

	SELECT ClientID,ROW_NUMBER() over(order by ClientID) as RowNumber ,
	Client_Name,Client_Description,Ratting,Category,
	Address1,Address2,Open_Hours,
	Website,Direction,Mobile_No,Telephone_No,
	Follow_Up_Reason,
	Notes,(CASE WHEN IsActive = 1 THEN 'Active' ELSE 'Deactive' end) as IsActive,
	CreateDate_Time
	FROM [AKM_Mst_Client_Follow_Up]
	order by ClientID desc ; 

END 
ELSE IF @CRUD_Action = 'GET_BY_ID'
BEGIN 

	SELECT ClientID,Client_Name,Client_Age,Client_Gender,Client_DOB,Client_Description,Category,
	Country,State,City,Address1,Address2,Open_Hours,
	Website,Direction,Ratting,Mobile_No,Telephone_No,Email_Id,Twitter_Profile,Facebook_Profile,Instagram_Profile,Linkedin_Profile,
	Call_Received,Whatsapp_Message,Follow_Up_Date_Time,Follow_Up_Reason,New_Follow_Up_Date_Time,New_Follow_Up_Reason,
	TaxID,PaymentTerms,PreferredPaymentMethod,AccountManager,AnnualRevenue,NumberOfEmployees,SocialMediaHandle,PreferredLanguage,TimeZone,SubscriptionStatus,ReferralSource,ContractStartDate,ContractEndDate,ServiceLevelAgreement,TechnicalSupportContact,ProjectedGrowthRate,LastContactedDate,RiskRating,PreferredContactMethod,CreditLimit,CustomerFeedbackScore,RiskAssessmentNotes,MarketingOptIn,PreferredShippingMethod,LoyaltyProgramMember,AccountBalance,LastInvoiceDate,LegalEntity,SustainabilityRating,ComplianceStatus,RenewalDate,ContractValue,ParentCompany,ChildCompanies,AccountStatus,LastActivityDate,PreferredCurrency,SupportTier,Region,MarketingSegment,ClientPriority,SalesRepresentative,StrategicImportance,OnboardingStatus,RenewalNotificationDate,ClientSince,EstimatedLifetimeValue,InvoicingFrequency,ContractStatus,SupportContact,BillingContact,EmergencyContact,BackupContact,BusinessHours,PreferredContactDays,PreferredContactTimes,PartnershipStatus,EngagementScore,ClientInitiatedProjects,LastFeedbackDate,PreferredInvoiceFormat,RiskMitigationPlan,ClientGoals,
	Notes,IsActive,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [AKM_Mst_Client_Follow_Up]
	WHERE [ClientID] = @ClientID; 

END 
ELSE IF @CRUD_Action = 'UPDATE'
BEGIN 
	UPDATE [AKM_Mst_Client_Follow_Up]
	SET 
	Client_Name = @Client_Name,
	Client_Age = @Client_Age,
	Client_Gender = @Client_Gender,
	Client_DOB = @Client_DOB,
	Client_Description = @Client_Description,
	Category = @Category,
	Country = @Country,
	State = @State,
	City = @City,
	Address1 = @Address1,
	Address2 = @Address2,
	Open_Hours = @Open_Hours,
	Website = @Website,
	Direction = @Direction,
	Ratting = @Ratting,
	Mobile_No = @Mobile_No,
	Telephone_No = @Telephone_No,
	Email_Id = @Email_Id,
	Twitter_Profile = @Twitter_Profile,
	Facebook_Profile = @Facebook_Profile,
	Instagram_Profile = @Instagram_Profile,
	Linkedin_Profile = @Linkedin_Profile,
	Call_Received = @Call_Received,
	Whatsapp_Message = @Whatsapp_Message,
	Follow_Up_Date_Time = @Follow_Up_Date_Time,
	Follow_Up_Reason = @Follow_Up_Reason,
	New_Follow_Up_Date_Time = @New_Follow_Up_Date_Time,
	New_Follow_Up_Reason = @New_Follow_Up_Reason,
	TaxID = @TaxID,
	PaymentTerms = @PaymentTerms,
	PreferredPaymentMethod = @PreferredPaymentMethod,
	AccountManager = @AccountManager,
	AnnualRevenue = @AnnualRevenue,
	NumberOfEmployees = @NumberOfEmployees,
	SocialMediaHandle = @SocialMediaHandle,
	PreferredLanguage = @PreferredLanguage,
	TimeZone = @TimeZone,
	SubscriptionStatus = @SubscriptionStatus,
	ReferralSource = @ReferralSource,
	ContractStartDate = @ContractStartDate,
	ContractEndDate = @ContractEndDate,
	ServiceLevelAgreement = @ServiceLevelAgreement,
	TechnicalSupportContact = @TechnicalSupportContact,
	ProjectedGrowthRate = @ProjectedGrowthRate,
	LastContactedDate = @LastContactedDate,
	RiskRating = @RiskRating,
	PreferredContactMethod = @PreferredContactMethod,
	CreditLimit = @CreditLimit,
	CustomerFeedbackScore = @CustomerFeedbackScore,
	RiskAssessmentNotes = @RiskAssessmentNotes,
	MarketingOptIn = @MarketingOptIn,
	PreferredShippingMethod = @PreferredShippingMethod,
	LoyaltyProgramMember = @LoyaltyProgramMember,
	AccountBalance = @AccountBalance,
	LastInvoiceDate = @LastInvoiceDate,
	LegalEntity = @LegalEntity,
	SustainabilityRating = @SustainabilityRating,
	ComplianceStatus = @ComplianceStatus,
	RenewalDate = @RenewalDate,
	ContractValue = @ContractValue,
	ParentCompany = @ParentCompany,
	ChildCompanies = @ChildCompanies,
	AccountStatus = @AccountStatus,
	LastActivityDate = @LastActivityDate,
	PreferredCurrency = @PreferredCurrency,
	SupportTier = @SupportTier,
	Region = @Region,
	MarketingSegment = @MarketingSegment,
	ClientPriority = @ClientPriority,
	SalesRepresentative = @SalesRepresentative,
	StrategicImportance = @StrategicImportance,
	OnboardingStatus = @OnboardingStatus,
	RenewalNotificationDate = @RenewalNotificationDate,
	ClientSince = @ClientSince,
	EstimatedLifetimeValue = @EstimatedLifetimeValue,
	InvoicingFrequency = @InvoicingFrequency,
	ContractStatus = @ContractStatus,
	SupportContact = @SupportContact,
	BillingContact = @BillingContact,
	EmergencyContact = @EmergencyContact,
	BackupContact = @BackupContact,
	BusinessHours = @BusinessHours,
	PreferredContactDays = @PreferredContactDays,
	PreferredContactTimes = @PreferredContactTimes,
	PartnershipStatus = @PartnershipStatus,
	EngagementScore = @EngagementScore,
	ClientInitiatedProjects = @ClientInitiatedProjects,
	LastFeedbackDate = @LastFeedbackDate,
	PreferredInvoiceFormat = @PreferredInvoiceFormat,
	RiskMitigationPlan = @RiskMitigationPlan,
	ClientGoals = @ClientGoals,
	Notes = @Notes,
	IsActive = @IsActive,	
	ModifiedBy = 'Akshay Kodam',
	ModifiedDate_Time = GETDATE()
	WHERE [ClientID] = @ClientID; 
END 
ELSE IF @CRUD_Action = 'DELETE_BY_ID'
BEGIN 
	DELETE FROM [AKM_Mst_Client_Follow_Up]
    WHERE [ClientID] = @ClientID; 
END 
ELSE 
BEGIN 
	RAISERROR('Invalid operation specified.', 16, 1); 
END 
END;









GO
/****** Object:  StoredProcedure [dbo].[CRUD_CMIS_Create_Billing_Expenses]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[CRUD_CMIS_Create_Billing_Expenses]@Billing_Expenses_ID int = NULL,@Billing_Party_Name_Or_Expenses nvarchar(max) = NULL,@Amount nvarchar(max) = NULL,@Date nvarchar(100) = NULL,@Notes nvarchar(max) = NULL,@CreatedBy nvarchar(100) = NULL,@CreateDate_Time datetime = NULL,@ModifiedBy nvarchar(100) = NULL,@ModifiedDate_Time datetime = NULL,@CRUD_Action NVARCHAR(100) = NULL AS BEGIN IF @CRUD_Action = 'GetMaxId'BEGIN 	SELECT isnull(max(Billing_Expenses_ID)+ 1,1) as Billing_Expenses_ID from [CMIS_Create_Billing_Expenses]END IF @CRUD_Action = 'CREATE'BEGIN 	INSERT INTO [CMIS_Create_Billing_Expenses]	(Billing_Expenses_ID,Billing_Party_Name_Or_Expenses,Amount,Date,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time) 	VALUES 	(@Billing_Expenses_ID,@Billing_Party_Name_Or_Expenses,@Amount,@Date,@Notes,@CreatedBy,@CreateDate_Time,@ModifiedBy,@ModifiedDate_Time); END ELSE IF  @CRUD_Action = 'GET_ALL'BEGIN 	SELECT Billing_Expenses_ID,Billing_Party_Name_Or_Expenses,Amount,Date,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Billing_Expenses]; END ELSE IF @CRUD_Action = 'GET_BY_ID'BEGIN 	SELECT Billing_Expenses_ID,Billing_Party_Name_Or_Expenses,Amount,Date,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Billing_Expenses]	WHERE [Billing_Expenses_ID] = @Billing_Expenses_ID; END ELSE IF @CRUD_Action = 'UPDATE'BEGIN 	UPDATE [CMIS_Create_Billing_Expenses]	SET 	Billing_Party_Name_Or_Expenses = @Billing_Party_Name_Or_Expenses,	Amount = @Amount,	Date = @Date,	Notes = @Notes,	CreatedBy = @CreatedBy,	CreateDate_Time = @CreateDate_Time,	ModifiedBy = @ModifiedBy,	ModifiedDate_Time = @ModifiedDate_Time	WHERE [Billing_Expenses_ID] = @Billing_Expenses_ID; END ELSE IF @CRUD_Action = 'DELETE_BY_ID'BEGIN 	DELETE FROM [CMIS_Create_Billing_Expenses]    WHERE [Billing_Expenses_ID] = @Billing_Expenses_ID; END ELSE BEGIN 	RAISERROR('Invalid operation specified.', 16, 1); END END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_CMIS_Create_Lab_Report]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CRUD_CMIS_Create_Lab_Report]@Lab_Report_ID int = NULL,@Title nvarchar(max) = NULL,@Descriptions nvarchar(max) = NULL,@CreatedBy nvarchar(100) = NULL,@CreateDate_Time datetime = NULL,@ModifiedBy nvarchar(100) = NULL,@ModifiedDate_Time datetime = NULL,@CRUD_Action NVARCHAR(100) = NULL AS BEGIN IF @CRUD_Action = 'GetMaxId'BEGIN 	SELECT isnull(max(Lab_Report_ID)+ 1,1) as Lab_Report_ID from [CMIS_Create_Lab_Report]END IF @CRUD_Action = 'CREATE'BEGIN 	INSERT INTO [CMIS_Create_Lab_Report]	(Lab_Report_ID,Title,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time) 	VALUES 	(@Lab_Report_ID,@Title,@Descriptions,@CreatedBy,@CreateDate_Time,@ModifiedBy,@ModifiedDate_Time); END ELSE IF  @CRUD_Action = 'GET_ALL'BEGIN 	SELECT Lab_Report_ID,Title,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Lab_Report]; END ELSE IF @CRUD_Action = 'GET_BY_ID'BEGIN 	SELECT Lab_Report_ID,Title,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Lab_Report]	WHERE [Lab_Report_ID] = @Lab_Report_ID; END ELSE IF @CRUD_Action = 'UPDATE'BEGIN 	UPDATE [CMIS_Create_Lab_Report]	SET 	Title = @Title,	Descriptions = @Descriptions,	CreatedBy = @CreatedBy,	CreateDate_Time = @CreateDate_Time,	ModifiedBy = @ModifiedBy,	ModifiedDate_Time = @ModifiedDate_Time	WHERE [Lab_Report_ID] = @Lab_Report_ID; END ELSE IF @CRUD_Action = 'DELETE_BY_ID'BEGIN 	DELETE FROM [CMIS_Create_Lab_Report]    WHERE [Lab_Report_ID] = @Lab_Report_ID; END ELSE BEGIN 	RAISERROR('Invalid operation specified.', 16, 1); END END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_CMIS_Create_Medicine]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[CRUD_CMIS_Create_Medicine]@Medicine_ID int = NULL,@Title nvarchar(max) = NULL,@Category nvarchar(100) = NULL,@Dose_Interval nvarchar(100) = NULL,@Before_Meal bit = NULL,@Descriptions nvarchar(max) = NULL,@CreatedBy nvarchar(100) = NULL,@CreateDate_Time datetime = NULL,@ModifiedBy nvarchar(100) = NULL,@ModifiedDate_Time datetime = NULL,@CRUD_Action NVARCHAR(100) = NULL AS BEGIN IF @CRUD_Action = 'GetMaxId'BEGIN 	SELECT isnull(max(Medicine_ID)+ 1,1) as Medicine_ID from [CMIS_Create_Medicine]END IF @CRUD_Action = 'CREATE'BEGIN 	INSERT INTO [CMIS_Create_Medicine]	(Medicine_ID,Title,Category,Dose_Interval,Before_Meal,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time) 	VALUES 	(@Medicine_ID,@Title,@Category,@Dose_Interval,@Before_Meal,@Descriptions,@CreatedBy,@CreateDate_Time,@ModifiedBy,@ModifiedDate_Time); END ELSE IF  @CRUD_Action = 'GET_ALL'BEGIN 	SELECT Medicine_ID,Title,Category,Dose_Interval,Before_Meal,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Medicine]; END ELSE IF @CRUD_Action = 'GET_BY_ID'BEGIN 	SELECT Medicine_ID,Title,Category,Dose_Interval,Before_Meal,Descriptions,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Create_Medicine]	WHERE [Medicine_ID] = @Medicine_ID; END ELSE IF @CRUD_Action = 'UPDATE'BEGIN 	UPDATE [CMIS_Create_Medicine]	SET 	Title = @Title,	Category = @Category,	Dose_Interval = @Dose_Interval,	Before_Meal = @Before_Meal,	Descriptions = @Descriptions,	CreatedBy = @CreatedBy,	CreateDate_Time = @CreateDate_Time,	ModifiedBy = @ModifiedBy,	ModifiedDate_Time = @ModifiedDate_Time	WHERE [Medicine_ID] = @Medicine_ID; END ELSE IF @CRUD_Action = 'DELETE_BY_ID'BEGIN 	DELETE FROM [CMIS_Create_Medicine]    WHERE [Medicine_ID] = @Medicine_ID; END ELSE BEGIN 	RAISERROR('Invalid operation specified.', 16, 1); END END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_CMIS_CREATE_PATIENT]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[CRUD_CMIS_CREATE_PATIENT]
@ID int = NULL,
@First_Name nvarchar(100) = NULL,
@Middle_Name nvarchar(100) = NULL,
@Last_Name nvarchar(100) = NULL,
@Country_Code nvarchar(100) = NULL,
@Contact_Number nvarchar(20) = NULL,
@Email nvarchar(100) = NULL,
@Gender nvarchar(20) = NULL,
@Age nvarchar(10) = NULL,
@Blood_Group nvarchar(100) = NULL,
@Weight nvarchar(10) = NULL,
@Height nvarchar(10) = NULL,
@BP nvarchar(10) = NULL,
@Symptoms nvarchar(max) = NULL,
@Address nvarchar(max) = NULL,
@Notes nvarchar(max) = NULL,
@CreatedBy nvarchar(100) = NULL,
@CreateDate_Time datetime = NULL,
@ModifiedBy nvarchar(100) = NULL,
@ModifiedDate_Time datetime = NULL,
@CRUD_Action NVARCHAR(100) = NULL ,
@Txt_GV_Custom_Search nvarchar(max) = NULL
AS BEGIN 
IF @CRUD_Action = 'GetMaxId'
BEGIN 
	SELECT isnull(max(ID)+ 1,1) as ID from [CMIS_CREATE_PATIENT]
END 
ELSE IF @CRUD_Action = 'CHECK_DUPLICATE_FIRST_NAME'
BEGIN 
	SELECT ID,First_Name FROM [CMIS_CREATE_PATIENT]
	WHERE First_Name = @First_Name	
END 
ELSE IF @CRUD_Action = 'CHECK_ID_EXISTS'
BEGIN 
	SELECT ID,First_Name FROM [CMIS_CREATE_PATIENT]
	WHERE ID = @ID	
END 
ELSE IF @CRUD_Action = 'CREATE'
BEGIN 
	INSERT INTO [CMIS_CREATE_PATIENT]
	(First_Name,Middle_Name,Last_Name,Country_Code,Contact_Number,Email,Gender,Age,Blood_Group,Weight,Height,BP,Symptoms,Address,
	Notes,CreatedBy,CreateDate_Time) 
	VALUES 
	(@First_Name,@Middle_Name,@Last_Name,@Country_Code,@Contact_Number,@Email,@Gender,@Age,@Blood_Group,@Weight,@Height,@BP,@Symptoms,
	@Address,@Notes,@CreatedBy, GETDATE()); 
END 
ELSE IF  @CRUD_Action = 'GET_ALL'
BEGIN 
	SELECT ID,First_Name,Middle_Name,Last_Name,concat(First_Name,' ',Middle_Name,' ',Last_Name) as FullName,Country_Code,Contact_Number,Email,Gender,Age,Blood_Group,Weight,Height,BP,Symptoms,
	Address,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_CREATE_PATIENT]
	order by id desc ;

END 
ELSE IF  @CRUD_Action = 'Txt_GV_Custom_Search'
BEGIN 
	SELECT ID,First_Name,Middle_Name,Last_Name,concat(First_Name,' ',Middle_Name,' ',Last_Name) as FullName,Country_Code,Contact_Number,Email,Gender,Age,Blood_Group,Weight,Height,BP,Symptoms,
	Address,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_CREATE_PATIENT]
	where 
	(First_Name like '%' + @Txt_GV_Custom_Search + '%') OR 
	(Middle_Name like '%' + @Txt_GV_Custom_Search + '%') OR
	(Last_Name like '%' + @Txt_GV_Custom_Search + '%') OR
	(Contact_Number like '%' + @Txt_GV_Custom_Search + '%') 
	--(Age like '%' + @Txt_GV_Custom_Search + '%') OR
	--(Gender like '%' + @Txt_GV_Custom_Search + '%') 	
	order by id desc ;

END 
ELSE IF @CRUD_Action = 'GET_BY_ID'
BEGIN 
	SELECT ID,First_Name,Middle_Name,Last_Name,Country_Code,Contact_Number,Email,Gender,Age,Blood_Group,Weight,Height,BP,Symptoms,
	Address,Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_CREATE_PATIENT]
	WHERE [ID] = @ID; 
END 
ELSE IF @CRUD_Action = 'UPDATE'
BEGIN 
	UPDATE [CMIS_CREATE_PATIENT]
	SET 
	First_Name = @First_Name,
	Middle_Name = @Middle_Name,
	Last_Name = @Last_Name,
	Country_Code =@Country_Code,
	Contact_Number = @Contact_Number,
	Email = @Email,
	Gender = @Gender,
	Age = @Age,
	Blood_Group = @Blood_Group,
	Weight = @Weight,
	Height = @Height,
	BP = @BP,
	Symptoms = @Symptoms,
	Address = @Address,
	Notes = @Notes,	
	ModifiedBy = @ModifiedBy,
	ModifiedDate_Time = GETDATE()
	WHERE [ID] = @ID; 
END 
ELSE IF @CRUD_Action = 'DELETE_BY_ID'
BEGIN 
	DELETE FROM [CMIS_CREATE_PATIENT]
    WHERE [ID] = @ID; 
END 
ELSE 
BEGIN 
	RAISERROR('Invalid operation specified.', 16, 1); 
END 
END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_CMIS_Mst_Clinic]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  PROCEDURE [dbo].[CRUD_CMIS_Mst_Clinic]@Clinic_ID int = NULL,@Clinic_Name nvarchar(max) = NULL,@Clinic_Email nvarchar(100) = NULL,@Doctor_Name nvarchar(100) = NULL,@Doctor_Degree nvarchar(100) = NULL,@Doctor_Specialization nvarchar(100) = NULL,@Country_Code nvarchar(10) = NULL,@Contact_Number nvarchar(20) = NULL,@Clinic_Telephone_Number nvarchar(20) = NULL,@Old_Case_Price nvarchar(100) = NULL,@New_Case_Price nvarchar(100) = NULL,@Clinic_Address nvarchar(max) = NULL,@Working_Hours nvarchar(max) = NULL,@Special_Notes nvarchar(max) = NULL,@CreatedBy nvarchar(100) = NULL,@CreateDate_Time datetime = NULL,@ModifiedBy nvarchar(100) = NULL,@ModifiedDate_Time datetime = NULL,@CRUD_Action NVARCHAR(100) = NULL AS BEGIN IF @CRUD_Action = 'GetMaxId'BEGIN 	SELECT isnull(max(Clinic_ID)+ 1,1) as Clinic_ID from [CMIS_Mst_Clinic]END IF @CRUD_Action = 'CREATE'BEGIN 	INSERT INTO [CMIS_Mst_Clinic]	(Clinic_ID,Clinic_Name,Clinic_Email,Doctor_Name,Doctor_Degree,Doctor_Specialization,Country_Code,Contact_Number,Clinic_Telephone_Number,Old_Case_Price,New_Case_Price,Clinic_Address,Working_Hours,Special_Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time) 	VALUES 	(@Clinic_ID,@Clinic_Name,@Clinic_Email,@Doctor_Name,@Doctor_Degree,@Doctor_Specialization,@Country_Code,@Contact_Number,@Clinic_Telephone_Number,@Old_Case_Price,@New_Case_Price,@Clinic_Address,@Working_Hours,@Special_Notes,@CreatedBy,@CreateDate_Time,@ModifiedBy,@ModifiedDate_Time); END ELSE IF  @CRUD_Action = 'GET_ALL'BEGIN 	SELECT Clinic_ID,Clinic_Name,Clinic_Email,Doctor_Name,Doctor_Degree,Doctor_Specialization,Country_Code,Contact_Number,Clinic_Telephone_Number,Old_Case_Price,New_Case_Price,Clinic_Address,Working_Hours,Special_Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Mst_Clinic]; END ELSE IF @CRUD_Action = 'GET_BY_ID'BEGIN 	SELECT Clinic_ID,Clinic_Name,Clinic_Email,Doctor_Name,Doctor_Degree,Doctor_Specialization,Country_Code,Contact_Number,Clinic_Telephone_Number,Old_Case_Price,New_Case_Price,Clinic_Address,Working_Hours,Special_Notes,CreatedBy,CreateDate_Time,ModifiedBy,ModifiedDate_Time FROM [CMIS_Mst_Clinic]	WHERE [Clinic_ID] = @Clinic_ID; END ELSE IF @CRUD_Action = 'UPDATE'BEGIN 	UPDATE [CMIS_Mst_Clinic]	SET 	Clinic_Name = @Clinic_Name,	Clinic_Email = @Clinic_Email,	Doctor_Name = @Doctor_Name,	Doctor_Degree = @Doctor_Degree,	Doctor_Specialization = @Doctor_Specialization,	Country_Code = @Country_Code,	Contact_Number = @Contact_Number,	Clinic_Telephone_Number = @Clinic_Telephone_Number,	Old_Case_Price = @Old_Case_Price,	New_Case_Price = @New_Case_Price,	Clinic_Address = @Clinic_Address,	Working_Hours = @Working_Hours,	Special_Notes = @Special_Notes,	CreatedBy = @CreatedBy,	CreateDate_Time = @CreateDate_Time,	ModifiedBy = @ModifiedBy,	ModifiedDate_Time = @ModifiedDate_Time	WHERE [Clinic_ID] = @Clinic_ID; END ELSE IF @CRUD_Action = 'DELETE_BY_ID'BEGIN 	DELETE FROM [CMIS_Mst_Clinic]    WHERE [Clinic_ID] = @Clinic_ID; END ELSE BEGIN 	RAISERROR('Invalid operation specified.', 16, 1); END END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_EmpDemo]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CRUD_EmpDemo]
@id int = NULL,
@name varchar(100) = NULL,
@role varchar(100) = NULL,
@salary int = NULL,
@CRUD_Action NVARCHAR(100) = NULL 
AS BEGIN 

IF @CRUD_Action = 'GetMaxId'
BEGIN 
	select isnull(max(id)+ 1,1) as id from EmpDemo
END 
ELSE IF @CRUD_Action = 'CHECK_DUPLICATE_EMP_NAME'
BEGIN 
	SELECT id,name,role FROM EmpDemo
	WHERE name = @name
	--[ClientID] = @ClientID  AND IsActive = 1 and AND Client_Name = @Client_Name ; 
END 
ELSE IF @CRUD_Action = 'CHECK_EMP_EXISTS'
BEGIN 
	SELECT id,name,role FROM EmpDemo
	WHERE id = @id	
END 
IF @CRUD_Action = 'CREATE' 
BEGIN 
	INSERT INTO [EmpDemo]
	(name,role,salary) 
	VALUES 
	(@name,@role,@salary); 
END 
ELSE IF @CRUD_Action = 'GET_ALL' 
BEGIN 
	--SELECT id,name,role,salary FROM [EmpDemo]; 
	SELECT id,ROW_NUMBER() over(order by id) as RowNumber ,name,role,salary FROM [EmpDemo]; 
END 
ELSE IF @CRUD_Action = 'GET_BY_ID' 
BEGIN 
	SELECT id,name,role,salary FROM [EmpDemo]
	WHERE [id] = @id; 
END 
ELSE IF @CRUD_Action = 'UPDATE' 
BEGIN 
	UPDATE [EmpDemo]
	SET 
	name = @name,
	role = @role,
	salary = @salary
	WHERE [id] = @id; 
END 
ELSE IF @CRUD_Action  = 'DELETE_BY_ID' 
BEGIN 
	DELETE FROM [EmpDemo]
    WHERE [id] = @id; 
END 
ELSE IF @CRUD_Action = 'Bind_RadCombobox_name' 
BEGIN 
	SELECT distinct id,name FROM [EmpDemo]; 	
END 
ELSE 
BEGIN 
	RAISERROR('Invalid operation specified.', 16, 1); 
END 
END;
GO
/****** Object:  StoredProcedure [dbo].[CRUD_UserMaster]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[CRUD_UserMaster]
@UserId int = NULL,
@UserName nvarchar(100) = NULL,
@Email nvarchar(255) = NULL,
@PasswordHash nvarchar(500) = NULL,
@FullName nvarchar(255) = NULL,
@Role nvarchar(50) = NULL,
@PhoneNumber nvarchar(15) = NULL,
@CreatedDate datetime = NULL,
@CreatedBy nvarchar(50) = NULL,
@ModifiedDate datetime = NULL,
@ModifiedBy nvarchar(50) = NULL,
@IsActive bit = NULL,
@CRUD_Action NVARCHAR(100) = NULL 
AS BEGIN 
IF @CRUD_Action = 'GetMaxId'
BEGIN 
	SELECT isnull(max(UserId)+ 1,1) as UserId from [UserMaster]
END 
IF @CRUD_Action = 'CREATE'
BEGIN 
	INSERT INTO [UserMaster]
	(UserName,Email,PasswordHash,FullName,Role,PhoneNumber,CreatedDate,CreatedBy,IsActive) 
	VALUES 
	(@UserName,@Email,@PasswordHash,@FullName,@Role,@PhoneNumber,GETDATE(),@CreatedBy,@IsActive); 
END 
ELSE IF  @CRUD_Action = 'GET_ALL'
BEGIN 
	SELECT UserId,UserName,Email,PasswordHash,FullName,Role,PhoneNumber,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,
	CASE WHEN IsActive = 1 THEN 'Active' ELSE 'Deactive' end as IsActive
	FROM [UserMaster]; 
END 
ELSE IF @CRUD_Action = 'GET_BY_ID'
BEGIN 
	SELECT UserId,UserName,Email,PasswordHash,FullName,Role,PhoneNumber,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive FROM [UserMaster]
	WHERE [UserId] = @UserId; 
END 
ELSE IF @CRUD_Action = 'CHECK_USER_EXISTS'
BEGIN 
	SELECT UserId,UserName,IsActive FROM [UserMaster]
	WHERE [UserId] = @UserId 
	--AND IsActive = 1 and AND UserName = @UserName ; 

END 
ELSE IF @CRUD_Action = 'UPDATE'
BEGIN 
	UPDATE [UserMaster]
	SET 
	--UserName = @UserName,
	Email = @Email,
	PasswordHash = @PasswordHash,
	FullName = @FullName,
	Role = @Role,
	PhoneNumber = @PhoneNumber,	
	ModifiedDate = GETDATE(),
	ModifiedBy = @ModifiedBy,
	IsActive = @IsActive
	WHERE [UserId] = @UserId; 
END 
ELSE IF @CRUD_Action = 'DELETE_BY_ID'
BEGIN 
	DELETE FROM [UserMaster]
    WHERE [UserId] = @UserId; 
END 
ELSE 
BEGIN 
	RAISERROR('Invalid operation specified.', 16, 1); 
END 
END;
 
GO
/****** Object:  StoredProcedure [dbo].[GenerateAutomaticCRUDStoredProcedureByTableName_New]    Script Date: 14-01-2025 12:57:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec dbo.GenerateAutomaticCRUDStoredProcedureByTableName_New 'DoctorMaster'
----------------------------------------------------------------------------
/* This will Generate Automatic CRUD Stored Procedure By Taking Table Name as a Parameter
	given below how to execute a Stored Procedure
	eg : 
	EXEC dbo.[GenerateAutomaticCRUDStoredProcedureByTableName_New] 'UserMaster'
*/

CREATE PROCEDURE [dbo].[GenerateAutomaticCRUDStoredProcedureByTableName_New]
    @TableName NVARCHAR(MAX) = NULL,
	@Flag NVARCHAR(MAX) = NULL
AS
BEGIN

	--SET STATISTICS IO ON;

	SET NOCOUNT ON

    DECLARE @SQL NVARCHAR(MAX) = N'';
    DECLARE @PrimaryKey NVARCHAR(128) = null;
    DECLARE @ColumnList NVARCHAR(MAX) = N'';
    DECLARE @ParameterList NVARCHAR(MAX) = N'';
	DECLARE @ParameterList_Main NVARCHAR(MAX) = N'';
	DECLARE @ParameterListUpdate NVARCHAR(MAX) = N'';
	DECLARE @Alter_Create_SP_Name NVARCHAR(MAX) = N'';
	DECLARE @ParameterListUpdate_final NVARCHAR(MAX) = N'';
	DECLARE @UPDATE_COMMMA_POSITION INT

    -- Get primary key
    set @PrimaryKey = (SELECT top 1 COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName)

	--select @PrimaryKey as Primarykey

	-- Get column names for the table
    SELECT @ColumnList += ( + COLUMN_NAME + ',')
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
	
	-- Generate parameter list for dynamic stored procedure
    SELECT @ParameterList_Main += 
       ('@' + ((COLUMN_NAME + ' ' + DATA_TYPE +  CASE WHEN  CHARACTER_MAXIMUM_LENGTH IS NULL THEN '' ELSE '(' +CAST( CHARACTER_MAXIMUM_LENGTH AS VARCHAR (20) )+')' END )) + ' = NULL,' + CHAR(13) )
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	-- Generate parameter list for dynamic stored procedure
    SELECT @ParameterList += 
        ('@' + COLUMN_NAME + ',') 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	SELECT @ParameterListUpdate += 
        --(  COLUMN_NAME + ' = @' + COLUMN_NAME +  ','  + CHAR(13) + '	') 
		(  COLUMN_NAME + ' = @' + COLUMN_NAME +  ',' ) 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

	PRINT @ParameterListUpdate

	SET @UPDATE_COMMMA_POSITION = (select CHARINDEX(',',@ParameterListUpdate) AS MatchPosition);

	SET @ParameterListUpdate_final = (SELECT RTRIM(LTRIM((SUBSTRING(@ParameterListUpdate, @UPDATE_COMMMA_POSITION + 1, LEN(@ParameterListUpdate)) ))) AS ExtractString)
	-- it will remove first column like UserId = @UserId,
	SELECT @ParameterListUpdate_final AS ParameterListUpdate_final
	
	SET @ColumnList = LEFT(@ColumnList, LEN(@ColumnList) - 1);	
	SET @ParameterList = LEFT(@ParameterList, LEN(@ParameterList) - 1);
	SET @ParameterListUpdate = LEFT(@ParameterListUpdate, LEN(@ParameterListUpdate) - 1);
	SET @ParameterListUpdate_final = RTRIM(LTRIM(LEFT(@ParameterListUpdate_final, LEN(@ParameterListUpdate_final) - 1))); -- THIS IS FOR REMOVE LAST STRING COMMA
	SET @ParameterListUpdate_final = REPLACE(@ParameterListUpdate_final,',' ,(','  + CHAR(13) + '	')); -- THIS IS ADDING NEW LINE AND SPACES
	
	--select @ColumnList as ColumnList
	--select @ParameterList as ParameterList
	--select @ParameterListUpdate as ParameterListUpdate
	--select @ParameterList_Main as ParameterList_Main
	--select @ParameterListUpdate_final as ParameterListUpdate_final

    -- Generate CRUD stored procedure
		   
		   if NOT exists (select * from sysobjects where id = object_id('dbo.CRUD_' + @TableName + '') and xtype = 'P' )
			BEGIN
				--select 'not exists'
				set @Alter_Create_SP_Name = 'CREATE '
			END
			else
			begin 
				 set @Alter_Create_SP_Name = 'ALTER '
			--	select 'exists' 
			end
    
    SET @SQL += N'' +CHAR(13) + 
				@Alter_Create_SP_Name + ' PROCEDURE dbo.CRUD_' + @TableName +  CHAR(13) +
				'' + @ParameterList_Main + 
                '@CRUD_Action NVARCHAR(100) = NULL ' + CHAR(13) +
                'AS BEGIN ' + CHAR(13) +
				'IF @CRUD_Action = ''GetMaxId''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
				'	SELECT isnull(max(' + @PrimaryKey + ')+ 1,1) as ' + @PrimaryKey + ' from '+ QUOTENAME(@TableName)  + CHAR(13) +                
				'END ' + CHAR(13) +
                'IF @CRUD_Action = ''CREATE''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	INSERT INTO ' + QUOTENAME(@TableName) +  CHAR(13) + '	(' + @ColumnList + ') ' + CHAR(13) + '	VALUES ' + CHAR(13) +'	(' + @ParameterList + '); ' + CHAR(13) +                 
                'END ' + CHAR(13) +
				'ELSE IF  @CRUD_Action = ''GET_ALL''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	SELECT ' + @ColumnList + ' FROM ' + QUOTENAME(@TableName) + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''GET_BY_ID''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	SELECT ' + @ColumnList + ' FROM ' + QUOTENAME(@TableName) + CHAR(13) + '	WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''UPDATE''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	UPDATE ' + QUOTENAME(@TableName) + CHAR(13) + 
				'	SET ' +  CHAR(13) + 
				'	' + @ParameterListUpdate_final + CHAR(13) +
				'	WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE IF @CRUD_Action = ''DELETE_BY_ID''' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	DELETE FROM ' + QUOTENAME(@TableName) + CHAR(13) + 
				'    WHERE ' + QUOTENAME(@PrimaryKey) + ' = @' + @PrimaryKey + '; ' + CHAR(13) +
                'END ' + CHAR(13) +
                'ELSE ' + CHAR(13) +
                'BEGIN ' + CHAR(13) +
                '	RAISERROR(''Invalid operation specified.'', 16, 1); ' + CHAR(13) +
                'END ' + CHAR(13) +
                'END;';

    -- Execute the generated SQL to create the CRUD procedure
			
    --EXEC sp_executesql @SQL;

	SELECT @SQL

	PRINT @SQL
	

END;


GO
USE [master]
GO
ALTER DATABASE [AKSS_Management] SET  READ_WRITE 
GO
