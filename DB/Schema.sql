USE [TMS]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](100) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[AssembledDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NOT NULL,
	[MaintenancePeriod] [time](7) NOT NULL,
	[NextMaintenanceDate] [datetime2](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Accessary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionPolicy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ActionPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommodityType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommodityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GoodsType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[RentDate] [datetime2](7) NOT NULL,
	[EndRentDate] [datetime2](7) NOT NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[InUse] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ContainerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Salary] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Allowance] [float] NOT NULL,
	[Details] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coordination]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[Distance] [float] NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[ContainerId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Coordinator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[NationalityId] [int] NOT NULL,
	[DoB] [datetime2](7) NULL,
	[SSN] [varchar](50) NOT NULL,
	[Passport] [varchar](50) NULL,
	[Avatar] [nvarchar](1000) NULL,
	[CustomerGroupId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LeaderId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityPolicy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[EntityId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[CanSee] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_EntityPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeaturePolicy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturePolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[CanSee] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FeaturePolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Field]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [int] NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[ColumnType] [varchar](50) NOT NULL,
	[AllowNull] [bit] NOT NULL,
	[ReferenceId] [int] NULL,
	[RefValueField] [varchar](100) NULL,
	[RefDisplayFields] [nchar](10) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Field] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinatorId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[Comment] [nvarchar](1500) NOT NULL,
	[Long] [float] NOT NULL,
	[Lat] [float] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightProof]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightProof](
	[Id] [int] NOT NULL,
	[FreightHistoryId] [int] NOT NULL,
	[Image] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightProof] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightState]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[WorkflowId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FuelType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupRoleId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GroupMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupRole]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[Curency] [varchar](50) NOT NULL,
	[ObjectiveId] [int] NOT NULL,
	[HasInvoice] [bit] NULL,
	[InvoiceImage] [nvarchar](1500) NULL,
	[OperationTypeId] [int] NOT NULL,
	[EntityId] [int] NULL,
	[TargetId] [int] NULL,
	[Approved] [bit] NULL,
	[ApproverId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Ledger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceTicket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[AccessaryId] [int] NULL,
	[ContainerId] [int] NULL,
	[AssigneeId] [int] NULL,
	[RoleId] [int] NULL,
	[GroupRoleId] [int] NULL,
	[TicketStateId] [int] NOT NULL,
	[HasAction] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceTicket2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objective]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objective](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_PaymentObjective] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_OperationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[ContactSSN] [varchar](50) NOT NULL,
	[ContactPassport] [varchar](50) NULL,
	[ContactAddress] [nvarchar](200) NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[TotalContainer] [int] NULL,
	[TotalPrice] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderComposition](
	[CoordinationId] [int] NOT NULL,
	[OrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_OrderComposition_1] PRIMARY KEY CLUSTERED 
(
	[CoordinationId] ASC,
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[IsContainer] [bit] NOT NULL,
	[ContainerTypeId] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NOT NULL,
	[Weight] [float] NULL,
	[Volume] [float] NULL,
	[TimeboxId] [int] NULL,
	[QuotationId] [int] NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentApproval]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentApproval](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApproverId] [int] NOT NULL,
	[LedgerId] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Approval] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentPolicy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PolicyId] [int] NULL,
	[MaxApproval] [float] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ApprovalConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IncludeAll] [bit] NULL,
	[IncludedGroupRole] [varchar](max) NULL,
	[IncludedUser] [varchar](max) NULL,
	[ExcludedGroupRole] [varchar](max) NULL,
	[ExcludedUserIds] [varchar](max) NULL,
	[ExcludeAll] [bit] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CustomerGroupId] [int] NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
	[ContainerTypeId] [int] NULL,
	[IsContainer] [bit] NOT NULL,
	[TotalContainer] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NOT NULL,
	[WeightRangeId] [int] NULL,
	[VolumeRangeId] [int] NULL,
	[TimeboxId] [int] NULL,
	[EffectiveDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatePolicy]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatePolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_StatePolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surcharge]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surcharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Surcharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[NationalityId] [int] NOT NULL,
	[Long] [float] NOT NULL,
	[Lat] [float] NOT NULL,
	[ContactNumber] [varchar](50) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Terminal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketState]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TicketState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timebox]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timebox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeboxStart] [time](7) NOT NULL,
	[TimeboxEnd] [time](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Timebox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transition]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkflowId] [int] NOT NULL,
	[CurrentStateId] [int] NOT NULL,
	[NextStateId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Transition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransitionAction]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransitionAction](
	[TransitionId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_TransitionAction] PRIMARY KEY CLUSTERED 
(
	[TransitionId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truck]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckPlate] [varchar](50) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [varchar](4) NULL,
	[Color] [nvarchar](50) NULL,
	[Vin] [varchar](50) NULL,
	[TruckTypeId] [int] NULL,
	[FuelTypeId] [int] NULL,
	[KmPerLit] [float] NULL,
	[MaxCapacity] [float] NULL,
	[PlateRenewal] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[Note] [nvarchar](1500) NULL,
	[Image] [varchar](1500) NULL,
	[InUse] [bit] NULL,
	[MaxCBM] [float] NULL,
	[VendorId] [int] NOT NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[DriverId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[BoughtDate] [datetime2](7) NOT NULL,
	[ActiveDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[MaintenanceStart] [datetime2](7) NULL,
	[MaintenanceEnd] [datetime2](7) NULL,
	[NextMaintenanceDate] [datetime2](7) NULL,
	[MaintenancePeriod] [time](7) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Truck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[VendorId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[AdvancedPaid] [decimal](20, 5) NOT NULL,
	[Paid] [bit] NOT NULL,
	[Total] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[AccountableUserId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckMaintenance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenanceDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceId] [int] NOT NULL,
	[AccessaryId] [int] NULL,
	[Detail] [nvarchar](200) NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMonitorConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NOT NULL,
	[AccessoryId] [int] NULL,
	[PolicyId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_MaintenanceTicket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruckType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DoB] [datetime2](7) NOT NULL,
	[SSN] [varchar](50) NOT NULL,
	[Passport] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[NationalityId] [int] NULL,
	[ContractId] [int] NULL,
	[DepartmentId] [int] NULL,
	[RoleId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[SupervisorId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInterface]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInterface](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[CanSee] [bit] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[Visibility] [bit] NULL,
	[ComponentId] [int] NOT NULL,
	[FieldId] [int] NULL,
	[ParentId] [int] NULL,
	[ParamName] [varchar](100) NULL,
	[Renderer] [varchar](200) NULL,
	[Events] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UserInterface] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[VendorTypeId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Address2] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckVendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorType]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_VendorType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VolumeStart] [float] NOT NULL,
	[VolumeEnd] [float] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_VolumeRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeightRange]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeightStart] [float] NOT NULL,
	[WeightEnd] [float] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_WeightRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 10/19/2019 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[EffectiveDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [UserId], [StartDate], [EndDate], [Salary], [Currency], [Allowance], [Details], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2029-10-07T00:00:00.0000000' AS DateTime2), 1000000000, N'USD', 0, N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [LeaderId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'IT', 1, N'Information technology', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[FreightState] ON 

INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Moving', N'Moving with container', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Idle', N'Idling', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'In-Order', N'In Order', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'In-Coordination', N'In Coordination', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Ready to transit', N'Driver takes the container to deliver', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'In-Transit', N'Driver in in his wat', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Delivered', N'Delivered', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FreightState] OFF
SET IDENTITY_INSERT [dbo].[GroupMember] ON 

INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 3, N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 4, N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 5, N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 6, N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupMember] OFF
SET IDENTITY_INSERT [dbo].[GroupRole] ON 

INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Office', N'Office', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'None-office', N'Non office', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Admin', N'Admin', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupRole] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', N'System', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GroupRole] OFF
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Vietnamese', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', NULL, N'5', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Admin', NULL, N'4', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Office', NULL, N'1', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'None-office', NULL, N'2', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Policy] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Driver', N'driver', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Coordinator', N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Sale', N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Accountant', N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Director', N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Truck] ON 

INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'asd-123', N'Toyota', N'7777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T16:29:06.2660000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'23K5 - 8288', N'Ford', N'Everest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:37:52.0250000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'23K5 - 8288', N'Honda', N'16t', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:41:39.7910000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'23K5 - 8288', N'Ford', N'Everest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'23K5 - 8288', N'Honda', N'16t', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'23K5 - 8288', N'Ford', N'Everest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'23K5 - 8288', N'Honda', N'16t', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10.00923, 11.292888, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Truck] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (1, N'sys', N'admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'123123123', N'123123123', N'Abc', N'Abc', N'09202439', N'02923488', 1, 1, 2, 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Mekoong', 1, N'The main provider', N'12031239', N'1231235', N'ABC', NULL, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Truck provider', N'Truck resale', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gara', N'Maintenace', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] ON 

INSERT [dbo].[Workflow] ([Id], [Name], [Description], [EffectiveDate], [ExpiredDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Frieght work flow', N'N/A', NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] OFF
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_IsMaintained]  DEFAULT ((0)) FOR [InUse]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Allowance]  DEFAULT ((0)) FOR [Allowance]
GO
ALTER TABLE [dbo].[Field] ADD  CONSTRAINT [DF_Field_AllowNull]  DEFAULT ((0)) FOR [AllowNull]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Volume]  DEFAULT ((0)) FOR [Volume]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_TotalContainer]  DEFAULT ((0)) FOR [TotalContainer]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessary_Vendor]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Truck]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_UserInserted]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_UserUpdated]
GO
ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_UserInserted]
GO
ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_UserUpdated]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_Action]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_Policy]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_User] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_User]
GO
ALTER TABLE [dbo].[ActionPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ActionPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ActionPolicy] CHECK CONSTRAINT [FK_ActionPolicy_UserInserted]
GO
ALTER TABLE [dbo].[CommodityType]  WITH CHECK ADD  CONSTRAINT [FK_CommodityType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CommodityType] CHECK CONSTRAINT [FK_CommodityType_UserInserted]
GO
ALTER TABLE [dbo].[CommodityType]  WITH CHECK ADD  CONSTRAINT [FK_CommodityType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CommodityType] CHECK CONSTRAINT [FK_CommodityType_UserUpdated]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_FreightState]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_UserInserted]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_UserUpdated]
GO
ALTER TABLE [dbo].[Container]  WITH CHECK ADD  CONSTRAINT [FK_Container_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Container] CHECK CONSTRAINT [FK_Container_Vendor]
GO
ALTER TABLE [dbo].[ContainerType]  WITH CHECK ADD  CONSTRAINT [FK_ContainerType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerType] CHECK CONSTRAINT [FK_ContainerType_UserInserted]
GO
ALTER TABLE [dbo].[ContainerType]  WITH CHECK ADD  CONSTRAINT [FK_ContainerType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerType] CHECK CONSTRAINT [FK_ContainerType_UserUpdated]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_UserInserted]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_UserUpdated]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Container]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_FreightState]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TerminalFrom]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TerminalTo] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TerminalTo]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Truck]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserDriver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserDriver]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserInserted]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_UserUpdated]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Nationality]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_UserInserted]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_UserUpdated]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Leader] FOREIGN KEY([LeaderId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Leader]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_UserInserted]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_UserUpdated]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_UserInserted]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_UserUpdated]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_Entity]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_Policy]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_UserInserted]
GO
ALTER TABLE [dbo].[EntityPolicy]  WITH CHECK ADD  CONSTRAINT [FK_EntityPolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EntityPolicy] CHECK CONSTRAINT [FK_EntityPolicy_UserUpdated]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_UserInserted]
GO
ALTER TABLE [dbo].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[Field] CHECK CONSTRAINT [FK_Field_Entity]
GO
ALTER TABLE [dbo].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_EntityReference] FOREIGN KEY([ReferenceId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[Field] CHECK CONSTRAINT [FK_Field_EntityReference]
GO
ALTER TABLE [dbo].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Field] CHECK CONSTRAINT [FK_Field_UserInserted]
GO
ALTER TABLE [dbo].[Field]  WITH CHECK ADD  CONSTRAINT [FK_Field_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Field] CHECK CONSTRAINT [FK_Field_UserUpdated]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_Action]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_Coordination] FOREIGN KEY([CoordinatorId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_Coordination]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_FreightState]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserActor] FOREIGN KEY([ActorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserActor]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserInserted]
GO
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_UserUpdated]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_FreightHistory] FOREIGN KEY([FreightHistoryId])
REFERENCES [dbo].[FreightHistory] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_FreightHistory]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_UserInserted]
GO
ALTER TABLE [dbo].[FreightProof]  WITH CHECK ADD  CONSTRAINT [FK_FreightProof_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightProof] CHECK CONSTRAINT [FK_FreightProof_UserUpdated]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_UserInserted]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_UserUpdated]
GO
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_Workflow] FOREIGN KEY([WorkflowId])
REFERENCES [dbo].[Workflow] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_Workflow]
GO
ALTER TABLE [dbo].[FuelType]  WITH CHECK ADD  CONSTRAINT [FK_FuelType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FuelType] CHECK CONSTRAINT [FK_FuelType_UserInserted]
GO
ALTER TABLE [dbo].[FuelType]  WITH CHECK ADD  CONSTRAINT [FK_FuelType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FuelType] CHECK CONSTRAINT [FK_FuelType_UserUpdated]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_GroupRole_GroupRoleId] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_GroupRole_GroupRoleId]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_Role_RoleId]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_User_InsertedBy] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_User_InsertedBy]
GO
ALTER TABLE [dbo].[GroupMember]  WITH CHECK ADD  CONSTRAINT [FK_GroupMember_User_UpdatedBy] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupMember] CHECK CONSTRAINT [FK_GroupMember_User_UpdatedBy]
GO
ALTER TABLE [dbo].[GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_GroupRole_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupRole] CHECK CONSTRAINT [FK_GroupRole_UserInserted]
GO
ALTER TABLE [dbo].[GroupRole]  WITH CHECK ADD  CONSTRAINT [FK_GroupRole_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GroupRole] CHECK CONSTRAINT [FK_GroupRole_UserUpdated]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Entity]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Objective] FOREIGN KEY([ObjectiveId])
REFERENCES [dbo].[Objective] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Objective]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_OperationType] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationType] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_OperationType]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserApprover] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserApprover]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserInserted]
GO
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_UserUpdated]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Accessory] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Accessory]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Assignee] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Assignee]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Container]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_GroupRole]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Role]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_TicketState] FOREIGN KEY([Id])
REFERENCES [dbo].[TicketState] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_TicketState]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Truck]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_UserInserted]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_UserUpdated]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_UserInserted] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_UserInserted]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_UserUpdated]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TerminalFrom]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_TerminalTo] FOREIGN KEY([Id])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_TerminalTo]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInserted]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserUpdated]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_Coordination] FOREIGN KEY([CoordinationId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_Coordination]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_CommodityType]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Quotation] FOREIGN KEY([QuotationId])
REFERENCES [dbo].[Quotation] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Quotation]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Timebox]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserInserted]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserUpdated]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Vendor]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_ApprovalConfig_UserInserted]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_ApprovalConfig_UserUpdated]
GO
ALTER TABLE [dbo].[PaymentPolicy]  WITH CHECK ADD  CONSTRAINT [FK_PaymentPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[PaymentPolicy] CHECK CONSTRAINT [FK_PaymentPolicy_Policy]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CommodityType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_ContainerType] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_ContainerType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CustomerGroup]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalFrom]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalTo] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalTo]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Timebox]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_UserInserted]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_UserUpdated]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Vendor]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_VolumeRange] FOREIGN KEY([VolumeRangeId])
REFERENCES [dbo].[VolumeRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_VolumeRange]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_WeightRange] FOREIGN KEY([WeightRangeId])
REFERENCES [dbo].[WeightRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_WeightRange]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_Policy]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_State]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_UserInserted]
GO
ALTER TABLE [dbo].[StatePolicy]  WITH CHECK ADD  CONSTRAINT [FK_StatePolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StatePolicy] CHECK CONSTRAINT [FK_StatePolicy_UserUpdated]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_OrderDetail]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserInserted]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserUpdated] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserUpdated]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Nationality]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_UserInserted] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_UserInserted]
GO
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_UserUpdated]
GO
ALTER TABLE [dbo].[TicketState]  WITH CHECK ADD  CONSTRAINT [FK_TicketState_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketState] CHECK CONSTRAINT [FK_TicketState_UserInserted]
GO
ALTER TABLE [dbo].[TicketState]  WITH CHECK ADD  CONSTRAINT [FK_TicketState_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TicketState] CHECK CONSTRAINT [FK_TicketState_UserUpdated]
GO
ALTER TABLE [dbo].[Timebox]  WITH CHECK ADD  CONSTRAINT [FK_Timebox_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Timebox] CHECK CONSTRAINT [FK_Timebox_UserInserted]
GO
ALTER TABLE [dbo].[Timebox]  WITH CHECK ADD  CONSTRAINT [FK_Timebox_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Timebox] CHECK CONSTRAINT [FK_Timebox_UserUpdated]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_FreightStateCurrent] FOREIGN KEY([CurrentStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_FreightStateCurrent]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_FreightStateNext] FOREIGN KEY([NextStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_FreightStateNext]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_UserInserted]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_UserUpdated]
GO
ALTER TABLE [dbo].[Transition]  WITH CHECK ADD  CONSTRAINT [FK_Transition_Workflow] FOREIGN KEY([WorkflowId])
REFERENCES [dbo].[Workflow] ([Id])
GO
ALTER TABLE [dbo].[Transition] CHECK CONSTRAINT [FK_Transition_Workflow]
GO
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Action] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_Action]
GO
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_Transition] FOREIGN KEY([TransitionId])
REFERENCES [dbo].[Transition] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_Transition]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_FuelType] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[FuelType] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_FuelType]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_TruckType] FOREIGN KEY([TruckTypeId])
REFERENCES [dbo].[TruckType] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_TruckType]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[MaintenanceTicket] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Truck]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_TruckMaintenance] FOREIGN KEY([Id])
REFERENCES [dbo].[TruckMaintenance] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_TruckMaintenance]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserAccountable] FOREIGN KEY([AccountableUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserAccountable]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Vendor]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Accessory] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Accessory]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Maintenance] FOREIGN KEY([MaintenanceId])
REFERENCES [dbo].[TruckMaintenance] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Maintenance]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserInserted]
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Accessory] FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Accessory]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Truck]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_UserInserted]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_UserUpdated]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitorConfig_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitorConfig_Policy]
GO
ALTER TABLE [dbo].[TruckType]  WITH CHECK ADD  CONSTRAINT [FK_TruckType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckType] CHECK CONSTRAINT [FK_TruckType_UserInserted]
GO
ALTER TABLE [dbo].[TruckType]  WITH CHECK ADD  CONSTRAINT [FK_TruckType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckType] CHECK CONSTRAINT [FK_TruckType_UserUpdated]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Contract]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Nationality] FOREIGN KEY([NationalityId])
REFERENCES [dbo].[Nationality] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Nationality]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_SupervisorId] FOREIGN KEY([SupervisorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_SupervisorId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserInserted]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserUpdated]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Feature]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Field] FOREIGN KEY([FieldId])
REFERENCES [dbo].[Field] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Field]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_FreightState]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Policy]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_UserInserted]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_UserInterface] FOREIGN KEY([ParentId])
REFERENCES [dbo].[UserInterface] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_UserInterface]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_UserUpdated]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_VendorType] FOREIGN KEY([VendorTypeId])
REFERENCES [dbo].[VendorType] ([Id])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_VendorType]
GO
ALTER TABLE [dbo].[VendorType]  WITH CHECK ADD  CONSTRAINT [FK_VendorType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VendorType] CHECK CONSTRAINT [FK_VendorType_UserInserted]
GO
ALTER TABLE [dbo].[VendorType]  WITH CHECK ADD  CONSTRAINT [FK_VendorType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VendorType] CHECK CONSTRAINT [FK_VendorType_UserUpdated]
GO
ALTER TABLE [dbo].[VolumeRange]  WITH CHECK ADD  CONSTRAINT [FK_VolumeRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VolumeRange] CHECK CONSTRAINT [FK_VolumeRange_UserInserted]
GO
ALTER TABLE [dbo].[VolumeRange]  WITH CHECK ADD  CONSTRAINT [FK_VolumeRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[VolumeRange] CHECK CONSTRAINT [FK_VolumeRange_UserUpdated]
GO
ALTER TABLE [dbo].[WeightRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WeightRange] CHECK CONSTRAINT [FK_WeightRange_UserInserted]
GO
ALTER TABLE [dbo].[WeightRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[WeightRange] CHECK CONSTRAINT [FK_WeightRange_UserUpdated]
GO
ALTER TABLE [dbo].[Workflow]  WITH CHECK ADD  CONSTRAINT [FK_Workflow_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Workflow] CHECK CONSTRAINT [FK_Workflow_UserInserted]
GO
ALTER TABLE [dbo].[Workflow]  WITH CHECK ADD  CONSTRAINT [FK_Workflow_UserUpdated] FOREIGN KEY([Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Workflow] CHECK CONSTRAINT [FK_Workflow_UserUpdated]
GO
