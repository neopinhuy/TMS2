USE [TMS]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Action]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[ActionPolicy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[CommodityType]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[ComponentDesc]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentDesc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentGroup]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsTab] [bit] NOT NULL,
	[Width] [float] NOT NULL,
	[Column] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[Border] [varchar](50) NULL,
	[Visibility] [bit] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UIGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[ContainerType]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Coordination]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Entity]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[EntityPolicy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Feature]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ShortName] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[Icon] [varchar](50) NULL,
	[IsDevider] [bit] NOT NULL,
	[IsGroup] [bit] NOT NULL,
	[IsMenu] [bit] NOT NULL,
	[ViewClass] [varchar](150) NULL,
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
/****** Object:  Table [dbo].[FeaturePolicy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Field]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityId] [int] NOT NULL,
	[FieldName] [varchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[ShortDesc] [nvarchar](50) NULL,
	[ColumnType] [varchar](50) NOT NULL,
	[AllowNull] [bit] NOT NULL,
	[ReferenceId] [int] NULL,
	[RefValueField] [varchar](100) NULL,
	[RefDisplayFields] [nchar](10) NULL,
	[Order] [int] NULL,
	[Hidden] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[FreightProof]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[FreightState]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[FuelType]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[GroupMember]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[GroupRole]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Ledger]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Objective]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[OperationType]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[PaymentPolicy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Policy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[StatePolicy]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Surcharge]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Terminal]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TicketState]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Timebox]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Transition]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TransitionAction]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Truck]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[TruckType]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[UserInterface]    Script Date: 10/23/2019 11:48:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInterface](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[FieldId] [int] NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[CanSee] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[Visibility] [bit] NULL,
	[ComponentDescId] [int] NOT NULL,
	[ComponentGroupId] [int] NULL,
	[Column] [int] NULL,
	[Row] [int] NULL,
	[Order] [int] NULL,
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[VendorType]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[WeightRange]    Script Date: 10/23/2019 11:48:50 PM ******/
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
/****** Object:  Table [dbo].[Workflow]    Script Date: 10/23/2019 11:48:50 PM ******/
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
SET IDENTITY_INSERT [dbo].[ComponentDesc] ON 

INSERT [dbo].[ComponentDesc] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Input', N'N/A', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ComponentDesc] OFF
SET IDENTITY_INSERT [dbo].[ComponentGroup] ON 

INSERT [dbo].[ComponentGroup] ([Id], [Name], [IsTab], [Width], [Column], [Row], [Border], [Visibility], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Truck info', 0, 100, 6, 4, NULL, 1, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ComponentGroup] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [UserId], [StartDate], [EndDate], [Salary], [Currency], [Allowance], [Details], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2029-10-07T00:00:00.0000000' AS DateTime2), 1000000000, N'USD', 0, N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [LeaderId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'IT', 1, N'Information technology', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Accessory', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'OrderDetail', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'PaymentPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Policy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Quotation', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Role', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'StatePolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Surcharge', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Terminal', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'TicketState', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Timebox', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Transition', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'TransitionAction', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Truck', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'TruckMaintenance', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'TruckMaintenanceDetail', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'TruckMonitorConfig', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'TruckType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'User', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'UserInterface', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'Vendor', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'VendorType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'VolumeRange', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'WeightRange', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Workflow', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Action', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'ActionPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'CommodityType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, N'ComponentDesc', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, N'Container', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, N'ContainerType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Contract', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, N'Coordination', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Customer', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'CustomerGroup', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'Department', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Entity', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, N'EntityPolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'Feature', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'FeaturePolicy', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'Field', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'FreightHistory', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'FreightProof', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'FreightState', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'FuelType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'GroupMember', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'GroupRole', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'Ledger', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'MaintenanceTicket', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'Nationality', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'Objective', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'OperationType', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'Order', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'OrderComposition', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Main', NULL, NULL, NULL, 0, 1, 1, NULL, N'Manage truck detail', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Dashboard', NULL, NULL, N'mif-home', 0, 0, 1, N'TMS.UI.Business.Dashboard.Dashboard', N'Statistic', 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Asset', NULL, NULL, N'mif-truck', 0, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Truck', NULL, 3, N'mif-truck', 0, 0, 1, N'TMS.UI.Business.TruckManagement.TruckList', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Accessory', NULL, 3, N'mif-steam2', 0, 0, 1, N'TMS.UI.Business.TruckManagement.TruckList', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Maintenance', NULL, 3, N'mif-calendar', 0, 0, 1, N'TMS.UI.Business.TruckManagement.TruckList', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, NULL, NULL, 3, NULL, 1, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Container', NULL, 3, N'fa fa-cube', 0, 0, 1, N'TMS.UI.Business.TruckManagement.TruckList', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [ShortName], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Truck Detail', N'Truck Detail', NULL, NULL, 0, 0, 0, N'TMS.Business.TruckDetail', N'Add new or edit truck', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[Field] ON 

INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 1, N'TruckId', N'TruckId', N'TruckId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 1, N'Name', N'Name', N'Name', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 1, N'Version', N'Version', N'Version', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 1, N'VendorId', N'VendorId', N'VendorId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 1, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 1, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 1, N'AssembledDate', N'AssembledDate', N'AssembledDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 1, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 1, N'MaintenancePeriod', N'MaintenancePeriod', N'MaintenancePeriod', N'time', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 1, N'NextMaintenanceDate', N'NextMaintenanceDate', N'NextMaintenanceDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 1, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 1, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 1, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 1, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 1, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 27, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, 27, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, 27, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, 27, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 27, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 27, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 27, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 28, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 28, N'ActionId', N'ActionId', N'ActionId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 28, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 28, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 28, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 28, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, 28, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 28, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 29, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 29, N'TypeName', N'TypeName', N'TypeName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 29, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 29, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 29, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 29, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 29, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 29, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 30, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, 30, N'Name', N'Name', N'Name', N'varchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, 30, N'Description', N'Description', N'Description', N'nvarchar(1000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, 30, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, 30, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 30, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 30, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 30, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 31, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, 31, N'VendorId', N'VendorId', N'VendorId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, 31, N'ContainerTypeId', N'ContainerTypeId', N'ContainerTypeId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, 31, N'Code', N'Code', N'Code', N'varchar(20)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, 31, N'Status', N'Status', N'Status', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, 31, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, 31, N'FreightStateId', N'FreightStateId', N'FreightStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, 31, N'RentDate', N'RentDate', N'RentDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, 31, N'EndRentDate', N'EndRentDate', N'EndRentDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, 31, N'Price', N'Price', N'Price', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, 31, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, 31, N'InUse', N'InUse', N'InUse', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, 31, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, 31, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, 31, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, 31, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, 31, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, 32, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, 32, N'TypeName', N'TypeName', N'TypeName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, 32, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, 32, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, 32, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, 32, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, 32, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, 32, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, 33, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, 33, N'UserId', N'UserId', N'UserId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, 33, N'StartDate', N'StartDate', N'StartDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, 33, N'EndDate', N'EndDate', N'EndDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, 33, N'Salary', N'Salary', N'Salary', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, 33, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, 33, N'Allowance', N'Allowance', N'Allowance', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, 33, N'Details', N'Details', N'Details', N'nvarchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, 33, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, 33, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, 33, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, 33, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, 33, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, 34, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, 34, N'TruckId', N'TruckId', N'TruckId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, 34, N'DriverId', N'DriverId', N'DriverId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, 34, N'FromId', N'FromId', N'FromId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, 34, N'ToId', N'ToId', N'ToId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, 34, N'Distance', N'Distance', N'Distance', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, 34, N'FreightStateId', N'FreightStateId', N'FreightStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, 34, N'ContainerId', N'ContainerId', N'ContainerId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, 34, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, 34, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, 34, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, 34, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, 34, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, 35, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, 35, N'FirstName', N'FirstName', N'FirstName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, 35, N'LastName', N'LastName', N'LastName', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, 35, N'PhoneNumber', N'PhoneNumber', N'PhoneNumber', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, 35, N'PhoneNumber2', N'PhoneNumber2', N'PhoneNumber2', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, 35, N'Address', N'Address', N'Address', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, 35, N'Address2', N'Address2', N'Address2', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, 35, N'NationalityId', N'NationalityId', N'NationalityId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, 35, N'DoB', N'DoB', N'DoB', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, 35, N'SSN', N'SSN', N'SSN', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, 35, N'Passport', N'Passport', N'Passport', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, 35, N'Avatar', N'Avatar', N'Avatar', N'nvarchar(2000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, 35, N'CustomerGroupId', N'CustomerGroupId', N'CustomerGroupId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, 35, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, 35, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, 35, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, 35, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, 35, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, 36, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, 36, N'GroupName', N'GroupName', N'GroupName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, 36, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, 36, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, 36, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, 36, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, 36, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, 36, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, 37, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, 37, N'Name', N'Name', N'Name', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, 37, N'LeaderId', N'LeaderId', N'LeaderId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, 37, N'Description', N'Description', N'Description', N'nvarchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, 37, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, 37, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, 37, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, 37, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, 37, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, 38, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, 38, N'Name', N'Name', N'Name', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, 38, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, 38, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, 38, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, 38, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, 38, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, 39, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, 39, N'Name', N'Name', N'Name', N'nvarchar(300)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, 39, N'EntityId', N'EntityId', N'EntityId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, 39, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, 39, N'CanSee', N'CanSee', N'CanSee', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, 39, N'CanAdd', N'CanAdd', N'CanAdd', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, 39, N'CanEdit', N'CanEdit', N'CanEdit', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, 39, N'CanDelete', N'CanDelete', N'CanDelete', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, 39, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, 39, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, 39, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, 39, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, 39, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, 40, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, 40, N'Name', N'Name', N'Name', N'nvarchar(200)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, 40, N'ShortName', N'ShortName', N'ShortName', N'nvarchar(200)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, 40, N'ParentId', N'ParentId', N'ParentId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, 40, N'Icon', N'Icon', N'Icon', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, 40, N'IsDevider', N'IsDevider', N'IsDevider', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, 40, N'IsGroup', N'IsGroup', N'IsGroup', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, 40, N'ViewClass', N'ViewClass', N'ViewClass', N'varchar(150)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, 40, N'Description', N'Description', N'Description', N'nvarchar(1000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, 40, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, 40, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, 40, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, 40, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, 40, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, 41, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, 41, N'FeatureId', N'FeatureId', N'FeatureId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, 41, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, 41, N'CanSee', N'CanSee', N'CanSee', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, 41, N'CanAdd', N'CanAdd', N'CanAdd', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, 41, N'CanEdit', N'CanEdit', N'CanEdit', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, 41, N'CanDelete', N'CanDelete', N'CanDelete', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (178, 41, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (179, 41, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (180, 41, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (181, 41, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (182, 41, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (183, 42, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (184, 42, N'EntityId', N'EntityId', N'EntityId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (185, 42, N'FieldName', N'FieldName', N'FieldName', N'varchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (186, 42, N'ColumnType', N'ColumnType', N'ColumnType', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (187, 42, N'AllowNull', N'AllowNull', N'AllowNull', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (188, 42, N'ReferenceId', N'ReferenceId', N'ReferenceId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (189, 42, N'RefValueField', N'RefValueField', N'RefValueField', N'varchar(100)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (190, 42, N'RefDisplayFields', N'RefDisplayFields', N'RefDisplayFields', N'nchar', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (191, 42, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (192, 42, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (193, 42, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (194, 42, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (195, 42, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (196, 43, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (197, 43, N'CoordinatorId', N'CoordinatorId', N'CoordinatorId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (198, 43, N'ActorId', N'ActorId', N'ActorId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (199, 43, N'ActionId', N'ActionId', N'ActionId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (200, 43, N'FreightStateId', N'FreightStateId', N'FreightStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (201, 43, N'Comment', N'Comment', N'Comment', N'nvarchar(3000)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (202, 43, N'Long', N'Long', N'Long', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (203, 43, N'Lat', N'Lat', N'Lat', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (204, 43, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (205, 43, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (206, 43, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (207, 43, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (208, 43, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (209, 44, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (210, 44, N'FreightHistoryId', N'FreightHistoryId', N'FreightHistoryId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (211, 44, N'Image', N'Image', N'Image', N'nvarchar(2000)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (212, 44, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (213, 44, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (214, 44, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (215, 44, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (216, 44, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (217, 45, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (218, 45, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (219, 45, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (220, 45, N'WorkflowId', N'WorkflowId', N'WorkflowId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (221, 45, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (222, 45, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (223, 45, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (224, 45, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (225, 45, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (226, 46, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (227, 46, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (228, 46, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (229, 46, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (230, 46, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (231, 46, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (232, 46, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (233, 47, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (234, 47, N'GroupRoleId', N'GroupRoleId', N'GroupRoleId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (235, 47, N'RoleId', N'RoleId', N'RoleId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (236, 47, N'Description', N'Description', N'Description', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (237, 47, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (238, 47, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (239, 47, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (240, 47, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (241, 47, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (242, 48, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (243, 48, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (244, 48, N'Description', N'Description', N'Description', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (245, 48, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (246, 48, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (247, 48, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (248, 48, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (249, 48, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (250, 49, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (251, 49, N'Debit', N'Debit', N'Debit', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (252, 49, N'Credit', N'Credit', N'Credit', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (253, 49, N'Curency', N'Curency', N'Curency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (254, 49, N'ObjectiveId', N'ObjectiveId', N'ObjectiveId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (255, 49, N'HasInvoice', N'HasInvoice', N'HasInvoice', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (256, 49, N'InvoiceImage', N'InvoiceImage', N'InvoiceImage', N'nvarchar(3000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (257, 49, N'OperationTypeId', N'OperationTypeId', N'OperationTypeId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (258, 49, N'EntityId', N'EntityId', N'EntityId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (259, 49, N'TargetId', N'TargetId', N'TargetId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (260, 49, N'Approved', N'Approved', N'Approved', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (261, 49, N'ApproverId', N'ApproverId', N'ApproverId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (262, 49, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (263, 49, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (264, 49, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (265, 49, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (266, 49, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (267, 50, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (268, 50, N'TruckId', N'TruckId', N'TruckId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (269, 50, N'AccessaryId', N'AccessaryId', N'AccessaryId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (270, 50, N'ContainerId', N'ContainerId', N'ContainerId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (271, 50, N'AssigneeId', N'AssigneeId', N'AssigneeId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (272, 50, N'RoleId', N'RoleId', N'RoleId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (273, 50, N'GroupRoleId', N'GroupRoleId', N'GroupRoleId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (274, 50, N'TicketStateId', N'TicketStateId', N'TicketStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (275, 50, N'HasAction', N'HasAction', N'HasAction', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (276, 50, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (277, 50, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (278, 50, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (279, 50, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (280, 50, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (281, 51, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (282, 51, N'Name', N'Name', N'Name', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (283, 51, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (284, 51, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (285, 51, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (286, 51, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (287, 51, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (288, 52, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (289, 52, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (290, 52, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (291, 52, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (292, 52, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (293, 52, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (294, 52, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (295, 53, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (296, 53, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (297, 53, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (298, 53, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (299, 53, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (300, 53, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (301, 53, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (302, 54, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (303, 54, N'CustomerId', N'CustomerId', N'CustomerId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (304, 54, N'ContactFirstName', N'ContactFirstName', N'ContactFirstName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (305, 54, N'ContactLastName', N'ContactLastName', N'ContactLastName', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (306, 54, N'ContactNumber', N'ContactNumber', N'ContactNumber', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (307, 54, N'ContactSSN', N'ContactSSN', N'ContactSSN', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (308, 54, N'ContactPassport', N'ContactPassport', N'ContactPassport', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (309, 54, N'ContactAddress', N'ContactAddress', N'ContactAddress', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (310, 54, N'FromId', N'FromId', N'FromId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (311, 54, N'ToId', N'ToId', N'ToId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (312, 54, N'TotalContainer', N'TotalContainer', N'TotalContainer', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (313, 54, N'TotalPrice', N'TotalPrice', N'TotalPrice', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (314, 54, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (315, 54, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (316, 54, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (317, 54, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (318, 54, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (319, 54, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (320, 55, N'CoordinationId', N'CoordinationId', N'CoordinationId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (321, 55, N'OrderDetailId', N'OrderDetailId', N'OrderDetailId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (322, 2, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (323, 2, N'OrderId', N'OrderId', N'OrderId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (324, 2, N'IsContainer', N'IsContainer', N'IsContainer', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (325, 2, N'ContainerTypeId', N'ContainerTypeId', N'ContainerTypeId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (326, 2, N'VendorId', N'VendorId', N'VendorId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (327, 2, N'CommodityTypeId', N'CommodityTypeId', N'CommodityTypeId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (328, 2, N'Weight', N'Weight', N'Weight', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (329, 2, N'Volume', N'Volume', N'Volume', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (330, 2, N'TimeboxId', N'TimeboxId', N'TimeboxId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (331, 2, N'QuotationId', N'QuotationId', N'QuotationId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (332, 2, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (333, 2, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (334, 2, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (335, 2, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (336, 2, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (337, 2, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (338, 2, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (339, 3, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (340, 3, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (341, 3, N'MaxApproval', N'MaxApproval', N'MaxApproval', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (342, 3, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (343, 3, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (344, 3, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (345, 3, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (346, 3, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (347, 4, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (348, 4, N'Name', N'Name', N'Name', N'nvarchar(300)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (349, 4, N'IncludeAll', N'IncludeAll', N'IncludeAll', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (350, 4, N'IncludedGroupRole', N'IncludedGroupRole', N'IncludedGroupRole', N'varchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (351, 4, N'IncludedUser', N'IncludedUser', N'IncludedUser', N'varchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (352, 4, N'ExcludedGroupRole', N'ExcludedGroupRole', N'ExcludedGroupRole', N'varchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (353, 4, N'ExcludedUserIds', N'ExcludedUserIds', N'ExcludedUserIds', N'varchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (354, 4, N'ExcludeAll', N'ExcludeAll', N'ExcludeAll', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (355, 4, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (356, 4, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (357, 4, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (358, 4, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (359, 4, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (360, 5, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (361, 5, N'CustomerId', N'CustomerId', N'CustomerId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (362, 5, N'CustomerGroupId', N'CustomerGroupId', N'CustomerGroupId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (363, 5, N'FromId', N'FromId', N'FromId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (364, 5, N'ToId', N'ToId', N'ToId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (365, 5, N'ContainerTypeId', N'ContainerTypeId', N'ContainerTypeId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (366, 5, N'IsContainer', N'IsContainer', N'IsContainer', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (367, 5, N'TotalContainer', N'TotalContainer', N'TotalContainer', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (368, 5, N'VendorId', N'VendorId', N'VendorId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (369, 5, N'CommodityTypeId', N'CommodityTypeId', N'CommodityTypeId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (370, 5, N'WeightRangeId', N'WeightRangeId', N'WeightRangeId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (371, 5, N'VolumeRangeId', N'VolumeRangeId', N'VolumeRangeId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (372, 5, N'TimeboxId', N'TimeboxId', N'TimeboxId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (373, 5, N'EffectiveDate', N'EffectiveDate', N'EffectiveDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (374, 5, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (375, 5, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (376, 5, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (377, 5, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (378, 5, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (379, 5, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (380, 5, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (381, 5, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (382, 6, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (383, 6, N'RoleName', N'RoleName', N'RoleName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (384, 6, N'Description', N'Description', N'Description', N'nvarchar(200)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (385, 6, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (386, 6, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (387, 6, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (388, 6, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (389, 6, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (390, 7, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (391, 7, N'StateId', N'StateId', N'StateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (392, 7, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (393, 7, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (394, 7, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (395, 7, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (396, 7, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (397, 7, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (398, 8, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (399, 8, N'OrderDetailId', N'OrderDetailId', N'OrderDetailId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (400, 8, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (401, 8, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (402, 8, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (403, 8, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (404, 8, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (405, 8, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (406, 8, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (407, 9, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (408, 9, N'FullName', N'FullName', N'FullName', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (409, 9, N'ShortName', N'ShortName', N'ShortName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (410, 9, N'Address', N'Address', N'Address', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (411, 9, N'NationalityId', N'NationalityId', N'NationalityId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (412, 9, N'Long', N'Long', N'Long', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (413, 9, N'Lat', N'Lat', N'Lat', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (414, 9, N'ContactNumber', N'ContactNumber', N'ContactNumber', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (415, 9, N'ContactFirstName', N'ContactFirstName', N'ContactFirstName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (416, 9, N'ContactLastName', N'ContactLastName', N'ContactLastName', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (417, 9, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (418, 9, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (419, 9, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (420, 9, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (421, 9, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (422, 10, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (423, 10, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (424, 10, N'Description', N'Description', N'Description', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (425, 10, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (426, 10, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (427, 10, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (428, 10, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (429, 10, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (430, 11, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (431, 11, N'TimeboxStart', N'TimeboxStart', N'TimeboxStart', N'time', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (432, 11, N'TimeboxEnd', N'TimeboxEnd', N'TimeboxEnd', N'time', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (433, 11, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (434, 11, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (435, 11, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (436, 11, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (437, 11, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (438, 12, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (439, 12, N'WorkflowId', N'WorkflowId', N'WorkflowId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (440, 12, N'CurrentStateId', N'CurrentStateId', N'CurrentStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (441, 12, N'NextStateId', N'NextStateId', N'NextStateId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (442, 12, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (443, 12, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (444, 12, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (445, 12, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (446, 12, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (447, 13, N'TransitionId', N'TransitionId', N'TransitionId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (448, 13, N'ActionId', N'ActionId', N'ActionId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (449, 14, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (450, 14, N'TruckPlate', N'Truck Plate', N'TruckPlate', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (451, 14, N'BrandName', N'Brand Name', N'BrandName', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (452, 14, N'Model', N'Model', N'Model', N'nvarchar(100)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (453, 14, N'Year', N'Year', N'Year', N'varchar(4)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (454, 14, N'Color', N'Color', N'Color', N'nvarchar(100)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (455, 14, N'Vin', N'Vin', N'Vin', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (456, 14, N'TruckTypeId', N'Truck Type', N'TruckTypeId', N'int', 1, 18, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (457, 14, N'FuelTypeId', N'Fuel Type', N'FuelTypeId', N'int', 1, 46, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (458, 14, N'KmPerLit', N'Km per Lit', N'KmPerLit', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (459, 14, N'MaxCapacity', N'Max Capacity', N'MaxCapacity', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (460, 14, N'PlateRenewal', N'Plate Renewal', N'PlateRenewal', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (461, 14, N'DepartmentId', N'Department', N'DepartmentId', N'int', 1, 37, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (462, 14, N'Note', N'Note', N'Note', N'nvarchar(3000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (463, 14, N'Image', N'Image', N'Image', N'varchar(1500)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (464, 14, N'InUse', N'InUse', N'InUse', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (465, 14, N'MaxCbm', N'Max CBM', N'MaxCBM', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (466, 14, N'VendorId', N'Vendor', N'VendorId', N'int', 0, 21, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (467, 14, N'Long', N'Long', N'Long', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (468, 14, N'Lat', N'Lat', N'Lat', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (469, 14, N'DriverId', N'DriverId', N'DriverId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (470, 14, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (471, 14, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (472, 14, N'BoughtDate', N'BoughtDate', N'BoughtDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (473, 14, N'ActiveDate', N'ActiveDate', N'ActiveDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (474, 14, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (475, 14, N'MaintenanceStart', N'MaintenanceStart', N'MaintenanceStart', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (476, 14, N'MaintenanceEnd', N'MaintenanceEnd', N'MaintenanceEnd', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (477, 14, N'NextMaintenanceDate', N'NextMaintenanceDate', N'NextMaintenanceDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (478, 14, N'MaintenancePeriod', N'MaintenancePeriod', N'MaintenancePeriod', N'time', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (479, 14, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (480, 14, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (481, 14, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, 19, NULL, N'FirstName ', NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (482, 14, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, N'          ', NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (483, 14, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, 19, NULL, N'FirstName ', NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (484, 15, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (485, 15, N'TruckId', N'TruckId', N'TruckId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (486, 15, N'VendorId', N'VendorId', N'VendorId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (487, 15, N'StartDate', N'StartDate', N'StartDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (488, 15, N'EndDate', N'EndDate', N'EndDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (489, 15, N'AdvancedPaid', N'AdvancedPaid', N'AdvancedPaid', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (490, 15, N'Paid', N'Paid', N'Paid', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (491, 15, N'Total', N'Total', N'Total', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (492, 15, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (493, 15, N'AccountableUserId', N'AccountableUserId', N'AccountableUserId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (494, 15, N'TicketId', N'TicketId', N'TicketId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (495, 15, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (496, 15, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (497, 15, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (498, 15, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (499, 15, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (500, 16, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (501, 16, N'MaintenanceId', N'MaintenanceId', N'MaintenanceId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (502, 16, N'AccessaryId', N'AccessaryId', N'AccessaryId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (503, 16, N'Detail', N'Detail', N'Detail', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (504, 16, N'Price', N'Price', N'Price', N'decimal', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (505, 16, N'Currency', N'Currency', N'Currency', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (506, 16, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (507, 16, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (508, 16, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (509, 16, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (510, 16, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (511, 17, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (512, 17, N'TruckId', N'TruckId', N'TruckId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (513, 17, N'AccessoryId', N'AccessoryId', N'AccessoryId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (514, 17, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (515, 17, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (516, 17, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (517, 17, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (518, 17, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (519, 17, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (520, 18, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (521, 18, N'Name', N'Name', N'Name', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (522, 18, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (523, 18, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (524, 18, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (525, 18, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (526, 18, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (527, 19, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (528, 19, N'FirstName', N'FirstName', N'FirstName', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (529, 19, N'LastName', N'LastName', N'LastName', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (530, 19, N'DoB', N'DoB', N'DoB', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (531, 19, N'SSN', N'SSN', N'SSN', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (532, 19, N'Passport', N'Passport', N'Passport', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (533, 19, N'Address', N'Address', N'Address', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (534, 19, N'Address2', N'Address2', N'Address2', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (535, 19, N'PhoneNumber', N'PhoneNumber', N'PhoneNumber', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (536, 19, N'PhoneNumber2', N'PhoneNumber2', N'PhoneNumber2', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (537, 19, N'NationalityId', N'NationalityId', N'NationalityId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (538, 19, N'ContractId', N'ContractId', N'ContractId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (539, 19, N'DepartmentId', N'DepartmentId', N'DepartmentId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (540, 19, N'RoleId', N'RoleId', N'RoleId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (541, 19, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (542, 19, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (543, 19, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (544, 19, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (545, 19, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (546, 19, N'SupervisorId', N'SupervisorId', N'SupervisorId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (547, 20, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (548, 20, N'FeatureId', N'FeatureId', N'FeatureId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (549, 20, N'PolicyId', N'PolicyId', N'PolicyId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (550, 20, N'StateId', N'StateId', N'StateId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (551, 20, N'CanSee', N'CanSee', N'CanSee', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (552, 20, N'CanEdit', N'CanEdit', N'CanEdit', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (553, 20, N'Disabled', N'Disabled', N'Disabled', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (554, 20, N'Visibility', N'Visibility', N'Visibility', N'bit', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (555, 20, N'ComponentId', N'ComponentId', N'ComponentId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (556, 20, N'FieldId', N'FieldId', N'FieldId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (557, 20, N'ParentId', N'ParentId', N'ParentId', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (558, 20, N'ParamName', N'ParamName', N'ParamName', N'varchar(100)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (559, 20, N'Renderer', N'Renderer', N'Renderer', N'varchar(200)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (560, 20, N'Events', N'Events', N'Events', N'varchar(-1)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (561, 20, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (562, 20, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (563, 20, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (564, 20, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (565, 20, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (566, 21, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (567, 21, N'Name', N'Name', N'Name', N'nvarchar(200)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (568, 21, N'VendorTypeId', N'VendorTypeId', N'VendorTypeId', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (569, 21, N'Description', N'Description', N'Description', N'nvarchar(-1)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (570, 21, N'PhoneNumber', N'PhoneNumber', N'PhoneNumber', N'varchar(50)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (571, 21, N'PhoneNumber2', N'PhoneNumber2', N'PhoneNumber2', N'varchar(50)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (572, 21, N'Address', N'Address', N'Address', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (573, 21, N'Address2', N'Address2', N'Address2', N'nvarchar(400)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (574, 21, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (575, 21, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (576, 21, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (577, 21, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (578, 21, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (579, 22, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (580, 22, N'Name', N'Name', N'Name', N'nvarchar(100)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (581, 22, N'Description', N'Description', N'Description', N'nvarchar(400)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (582, 22, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (583, 22, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (584, 22, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (585, 22, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (586, 22, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (587, 23, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (588, 23, N'VolumeStart', N'VolumeStart', N'VolumeStart', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (589, 23, N'VolumeEnd', N'VolumeEnd', N'VolumeEnd', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (590, 23, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (591, 23, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (592, 23, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (593, 23, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (594, 23, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (595, 24, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (596, 24, N'WeightStart', N'WeightStart', N'WeightStart', N'float', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (597, 24, N'WeightEnd', N'WeightEnd', N'WeightEnd', N'float', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (598, 24, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (599, 24, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (600, 24, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (601, 24, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (602, 24, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (603, 25, N'Id', N'Id', N'Id', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (604, 25, N'Name', N'Name', N'Name', N'nvarchar(300)', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (605, 25, N'Description', N'Description', N'Description', N'nvarchar(2000)', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (606, 25, N'EffectiveDate', N'EffectiveDate', N'EffectiveDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (607, 25, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (608, 25, N'Active', N'Active', N'Active', N'bit', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (609, 25, N'InsertedDate', N'InsertedDate', N'InsertedDate', N'datetime2', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (610, 25, N'InsertedBy', N'InsertedBy', N'InsertedBy', N'int', 0, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (611, 25, N'UpdatedDate', N'UpdatedDate', N'UpdatedDate', N'datetime2', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Field] ([Id], [EntityId], [FieldName], [Description], [ShortDesc], [ColumnType], [AllowNull], [ReferenceId], [RefValueField], [RefDisplayFields], [Order], [Hidden], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (612, 25, N'UpdatedBy', N'UpdatedBy', N'UpdatedBy', N'int', 1, NULL, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-21T15:32:58.5233333' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Field] OFF
SET IDENTITY_INSERT [dbo].[FreightState] ON 

INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Moving', N'Moving with container', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Idle', N'Idling', 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'In-Order', N'In Order', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'In-Coordination', N'In Coordination', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Ready to transit', N'Driver takes the container to deliver', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'In-Transit', N'Driver in in his wat', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Delivered', N'Delivered', 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FreightState] OFF
SET IDENTITY_INSERT [dbo].[FuelType] ON 

INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Diesel', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gas', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FuelType] OFF
SET IDENTITY_INSERT [dbo].[GroupMember] ON 

INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 3, N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 4, N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 5, N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 6, N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GroupMember] ([Id], [GroupRoleId], [RoleId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 2, 2, N'Non-Office', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
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

INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', NULL, N'[5]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Admin', NULL, N'[4]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Office', NULL, N'[1]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'None-office', NULL, N'[2]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Public', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
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

INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'asd-123', N'Toyota', N'7777', N'2019', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-21T19:09:54.5310000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'23K5 - 8288', N'Ford', N'Everest', N'2019', N'White', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:37:52.0250000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'23K5 - 8288', N'Honda', N'16t', N'2019', N'Black', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:41:39.7910000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'23K5 - 8288', N'Ford', N'Everest', N'2019', N'VinYel', NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'23K5 - 8288', N'Honda', N'16t', N'2019', N'Blackjet', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'23K5 - 8288', N'Ford', N'Everest', N'2019', N'Gold', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BrandName], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [DriverId], [Price], [Currency], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'23K5 - 8288', N'Honda', N'16t', N'2019', N'Silver', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10.00923, 11.292888, 1, CAST(10000.00000 AS Decimal(20, 5)), N'USD', CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Truck] OFF
SET IDENTITY_INSERT [dbo].[TruckType] ON 

INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'20ft', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'40ft', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Mixed', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TruckType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (1, N'sys', N'admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'123123123', N'123123123', N'Abc', N'Abc', N'09202439', N'02923488', 1, 1, 2, 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [SSN], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy], [SupervisorId]) VALUES (2, N'Quynh', N'Pham', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'999xxxxx', N'12399xxxxx', N'Tinhte', N'Genk', N'123xxx90', N'123xx8xx', 1, 1, 2, 2, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInterface] ON 

INSERT [dbo].[UserInterface] ([Id], [FeatureId], [FieldId], [PolicyId], [StateId], [CanSee], [CanEdit], [Disabled], [Visibility], [ComponentDescId], [ComponentGroupId], [Column], [Row], [Order], [Renderer], [Events], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 450, 10, NULL, 1, 1, 0, 1, 1, 1, 2, 1, 1, NULL, NULL, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInterface] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Mekoong', 1, N'The main provider', N'12031239', N'1231235', N'ABC', NULL, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Trường Hải', 1, N'Oto lắp ráp', N'123123', N'098098', N'DÈ', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Truck provider', N'Truck resale', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gara', N'Maintenace', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] ON 

INSERT [dbo].[Workflow] ([Id], [Name], [Description], [EffectiveDate], [ExpiredDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Frieght work flow', N'N/A', NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] OFF
ALTER TABLE [dbo].[ComponentGroup] ADD  CONSTRAINT [DF_UIGroup_IsTab]  DEFAULT ((0)) FOR [IsTab]
GO
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_IsMaintained]  DEFAULT ((0)) FOR [InUse]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Allowance]  DEFAULT ((0)) FOR [Allowance]
GO
ALTER TABLE [dbo].[Feature] ADD  CONSTRAINT [DF_Feature_IsMenu]  DEFAULT ((0)) FOR [IsMenu]
GO
ALTER TABLE [dbo].[Field] ADD  CONSTRAINT [DF_Field_AllowNull]  DEFAULT ((0)) FOR [AllowNull]
GO
ALTER TABLE [dbo].[Field] ADD  CONSTRAINT [DF_Field_Hidden]  DEFAULT ((0)) FOR [Hidden]
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
ALTER TABLE [dbo].[ComponentDesc]  WITH CHECK ADD  CONSTRAINT [FK_ComponentDesc_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentDesc] CHECK CONSTRAINT [FK_ComponentDesc_UserInserted]
GO
ALTER TABLE [dbo].[ComponentDesc]  WITH CHECK ADD  CONSTRAINT [FK_ComponentDesc_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentDesc] CHECK CONSTRAINT [FK_ComponentDesc_UserUpdated]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_UserInserted]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_UserUpdated]
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
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Parent] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_Parent]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_UserInserted]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_Feature]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_Policy]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_UserInserted]
GO
ALTER TABLE [dbo].[FeaturePolicy]  WITH CHECK ADD  CONSTRAINT [FK_FeaturePolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FeaturePolicy] CHECK CONSTRAINT [FK_FeaturePolicy_UserUpdated]
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
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_ComponentDesc] FOREIGN KEY([ComponentDescId])
REFERENCES [dbo].[ComponentDesc] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_ComponentDesc]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_ComponentGroup] FOREIGN KEY([ComponentGroupId])
REFERENCES [dbo].[ComponentGroup] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_ComponentGroup]
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
