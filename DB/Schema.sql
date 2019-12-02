/****** Object:  Table [dbo].[Accessory]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[BranchId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](100) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Price] [decimal](20, 5) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[AssembledDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[MaintenancePeriod] [bigint] NULL,
	[NextMaintenanceDate] [datetime2](7) NULL,
	[ApplyPeriod] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[Action]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
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
/****** Object:  Table [dbo].[ActionPolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Branch]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[BranchTypeId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Desciption] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_BranchType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommodityType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommodityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[ComponentGroup]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ClassName] [varchar](50) NULL,
	[IsTab] [bit] NOT NULL,
	[TabGroup] [varchar](50) NULL,
	[Width] [varchar](50) NOT NULL,
	[Style] [varchar](200) NULL,
	[Column] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[Hidden] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[Order] [int] NULL,
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
/****** Object:  Table [dbo].[Container]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Container](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NOT NULL,
	[ContainerTypeId] [int] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[FreightStateId] [int] NULL,
	[RentDate] [datetime2](7) NULL,
	[EndRentDate] [datetime2](7) NULL,
	[AdvancedPaid] [decimal](20, 5) NULL,
	[NextPayment] [datetime2](7) NULL,
	[ApplyPeriod] [bit] NOT NULL,
	[PeriodPayment] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[InUse] [bit] NULL,
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
/****** Object:  Table [dbo].[ContainerRange]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MinContainer] [int] NOT NULL,
	[MaxContainer] [int] NOT NULL,
	[Note] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ContainerRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Contract]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Coordination]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromId] [int] NULL,
	[ToId] [int] NULL,
	[EmptyContFromId] [int] NULL,
	[EmptyContToId] [int] NULL,
	[TruckTypeId] [int] NULL,
	[CommodityTypeId] [int] NULL,
	[TotalContainer] [int] NULL,
	[IsComposited] [bit] NOT NULL,
	[Weight] [decimal](20, 5) NULL,
	[Volume] [decimal](20, 5) NULL,
	[Distance] [decimal](20, 5) NULL,
	[TimeboxId] [int] NULL,
	[FreightStateId] [int] NULL,
	[TaskStateId] [int] NULL,
	[ContainerTypeId] [int] NULL,
	[Note] [nvarchar](2000) NULL,
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
/****** Object:  Table [dbo].[CoordinationDetail]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoordinationDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[DriverId] [int] NULL,
	[ContainerId] [int] NULL,
	[CoordinationId] [int] NULL,
	[FreightStateId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_CoordinationDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Symbol] [nvarchar](4) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGroupId] [int] NULL,
	[UserId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[DistanceRange]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistanceRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MinDistance] [decimal](18, 2) NOT NULL,
	[MaxDistance] [decimal](18, 2) NOT NULL,
	[UomId] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_DistanceRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[EntityPolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Feature]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Label] [nvarchar](100) NULL,
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
/****** Object:  Table [dbo].[FeaturePolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[FreightProof]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[FreightState]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[StateTypeId] [int] NULL,
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
/****** Object:  Table [dbo].[FuelType]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[GridPolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridPolicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureId] [int] NULL,
	[EntityId] [int] NOT NULL,
	[FieldName] [varchar](50) NULL,
	[ShortDesc] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[ReferenceId] [int] NULL,
	[DataSource] [varchar](500) NULL,
	[GroupName] [nvarchar](50) NULL,
	[FormatCell] [varchar](100) NULL,
	[FormatRow] [varchar](100) NULL,
	[Width] [varchar](20) NULL,
	[MinWidth] [varchar](20) NULL,
	[MaxWidth] [varchar](20) NULL,
	[Precision] [int] NULL,
	[Validation] [nvarchar](1000) NULL,
	[TextAlign] [varchar](10) NULL,
	[Frozen] [bit] NOT NULL,
	[Hidden] [bit] NOT NULL,
	[EditEvent] [varchar](50) NULL,
	[DeleteEvent] [varchar](50) NULL,
	[Order] [int] NULL,
	[HasFilter] [bit] NOT NULL,
	[Editable] [bit] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[Component] [varchar](50) NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_GridPolicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[GroupRole]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Ledger]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[CurencyId] [int] NULL,
	[ObjectiveId] [int] NULL,
	[HasInvoice] [bit] NOT NULL,
	[InvoiceImage] [nvarchar](1500) NULL,
	[OperationTypeId] [int] NULL,
	[EntityId] [int] NULL,
	[TargetId] [int] NULL,
	[Approved] [bit] NULL,
	[ApproverId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NULL,
	[InsertedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Ledger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceTicket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[AccessoryId] [int] NULL,
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](200) NULL,
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
/****** Object:  Table [dbo].[Objective]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[OperationType]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ContactFirstName] [nvarchar](50) NULL,
	[ContactLastName] [nvarchar](100) NULL,
	[ContactNumber] [varchar](50) NULL,
	[ContactSSN] [varchar](50) NULL,
	[ContactPassport] [varchar](50) NULL,
	[ContactAddress] [nvarchar](200) NULL,
	[FromId] [int] NULL,
	[ToId] [int] NULL,
	[TotalContainer] [int] NULL,
	[FreightStateId] [int] NULL,
	[Deadline] [datetime2](7) NULL,
	[AccountableUserId] [int] NULL,
	[AccountableDepartmentId] [int] NULL,
	[AdvancedPaid] [decimal](20, 5) NULL,
	[Paid] [bit] NOT NULL,
	[DiscountMoney] [decimal](20, 5) NULL,
	[DiscountPercentage] [decimal](4, 2) NULL,
	[Vat] [decimal](4, 2) NULL,
	[TotalPriceBeforeDiscount] [decimal](20, 5) NULL,
	[TotalPriceAfterDiscount] [decimal](20, 5) NULL,
	[TotalPriceAfterTax] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[AdvancedPaidDate] [datetime2](7) NULL,
	[PaidDate] [datetime2](7) NULL,
	[Note] [nvarchar](2000) NULL,
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
/****** Object:  Table [dbo].[OrderComposition]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderComposition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinationId] [int] NOT NULL,
	[OrderDetailId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_OrderComposition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[GoodsName] [nvarchar](50) NULL,
	[ExpectedTransportDate] [datetime2](7) NULL,
	[FromId] [int] NULL,
	[ToId] [int] NULL,
	[EmptyContFromId] [int] NULL,
	[EmptyContToId] [int] NULL,
	[ContainerTypeId] [int] NULL,
	[TruckTypeId] [int] NULL,
	[IsContainer] [bit] NOT NULL,
	[CommodityTypeId] [int] NULL,
	[VendorId] [int] NULL,
	[BoxLength] [decimal](18, 2) NULL,
	[BoxWidth] [decimal](18, 2) NULL,
	[BoxHeight] [decimal](18, 2) NULL,
	[BoxVolume] [decimal](18, 2) NULL,
	[BoxWeight] [decimal](18, 2) NULL,
	[TotalWeight] [decimal](18, 2) NULL,
	[TotalVolume] [decimal](18, 2) NULL,
	[TotalBox] [int] NULL,
	[TotalContainer] [int] NULL,
	[StackDirectionId] [int] NULL,
	[MinStack] [int] NULL,
	[MaxStack] [int] NULL,
	[TransportDistance] [decimal](18, 2) NULL,
	[TimeboxId] [int] NULL,
	[QuotationId] [int] NULL,
	[TotalPriceBeforeDiscount] [decimal](18, 2) NULL,
	[DiscountMoney] [decimal](18, 2) NULL,
	[DiscountPercentage] [decimal](18, 2) NULL,
	[TotalPriceAfterDiscount] [decimal](18, 2) NULL,
	[Vat] [decimal](18, 2) NULL,
	[TotalDiscountAfterTax] [decimal](18, 2) NULL,
	[CurrencyId] [int] NULL,
	[Note] [nvarchar](1000) NULL,
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
/****** Object:  Table [dbo].[PaymentPolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Policy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[PriceType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_QuotationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[CustomerGroupId] [int] NULL,
	[ForGroupOnly] [bit] NOT NULL,
	[FromId] [int] NULL,
	[ToId] [int] NULL,
	[EmptyContFromId] [int] NULL,
	[EmptyContToId] [int] NULL,
	[DistanceRangeId] [int] NULL,
	[ContainerTypeId] [int] NULL,
	[TruckTypeId] [int] NULL,
	[IsContainer] [bit] NOT NULL,
	[ContainerRangeId] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NULL,
	[WeightRangeId] [int] NULL,
	[VolumeRangeId] [int] NULL,
	[TimeboxId] [int] NULL,
	[EffectiveDate] [datetime2](7) NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[Price] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[PriceTypeId] [int] NULL,
	[VAT] [decimal](18, 2) NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[StackDirection]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StackDirection](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_StackDirection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatePolicy]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[StateType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_StateType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surcharge]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surcharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderDetailId] [int] NULL,
	[SurchargeTypeId] [int] NULL,
	[PriceTypeId] [int] NULL,
	[UnitPrice] [decimal](20, 5) NULL,
	[Quantity] [decimal](20, 5) NULL,
	[Vat] [decimal](4, 2) NULL,
	[PriceAfterTax] [decimal](20, 5) NULL,
	[Note] [nvarchar](200) NULL,
	[CurrencyId] [int] NULL,
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
/****** Object:  Table [dbo].[SurchargeType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurchargeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitPrice] [decimal](20, 5) NULL,
	[PriceTypeId] [int] NULL,
	[Description] [nvarchar](200) NULL,
	[CurrencyId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_SurchargeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskState]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskState](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TaskState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[TicketState]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[Timebox]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timebox](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeboxStart] [varchar](10) NOT NULL,
	[TimeboxEnd] [varchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[Transition]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[TransitionAction]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransitionAction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransitionId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TransitionAction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truck]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckPlate] [varchar](50) NULL,
	[BranchId] [int] NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [decimal](4, 0) NULL,
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
	[InUse] [bit] NOT NULL,
	[MaxCBM] [float] NULL,
	[VendorId] [int] NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[FreightStateId] [int] NULL,
	[DriverId] [int] NULL,
	[Price] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
	[BoughtDate] [datetime2](7) NULL,
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
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[VendorId] [int] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[AdvancedPaid] [decimal](20, 5) NULL,
	[Paid] [bit] NOT NULL,
	[Total] [float] NULL,
	[CurrencyId] [int] NULL,
	[AccountableUserId] [int] NULL,
	[TicketId] [int] NULL,
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
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenanceDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceId] [int] NULL,
	[AccessoryId] [int] NULL,
	[Detail] [nvarchar](200) NULL,
	[Price] [decimal](20, 5) NULL,
	[CurrencyId] [int] NULL,
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
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[TruckType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
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
/****** Object:  Table [dbo].[UoM]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UoM](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[UomTypeId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UoM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UomType]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UomType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UomType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](100) NULL,
	[FullName]  AS (([FirstName]+' ')+[LastName]),
	[DoB] [datetime2](7) NULL,
	[Ssn] [varchar](50) NULL,
	[Passport] [varchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[PhoneNumber2] [varchar](50) NULL,
	[NationalityId] [int] NULL,
	[ContractId] [int] NULL,
	[DepartmentId] [int] NULL,
	[RoleId] [int] NULL,
	[Avatar] [nvarchar](1000) NULL,
	[SupervisorId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInterface]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInterface](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [varchar](50) NULL,
	[PolicyId] [int] NULL,
	[StateId] [int] NULL,
	[ComponentType] [varchar](50) NOT NULL,
	[ComponentGroupId] [int] NULL,
	[DataSourceFilter] [varchar](500) NULL,
	[ReferenceId] [int] NULL,
	[Format] [varchar](200) NULL,
	[Column] [int] NULL,
	[Row] [int] NULL,
	[Precision] [int] NULL,
	[GroupBy] [varchar](100) NULL,
	[GroupFormat] [nvarchar](500) NULL,
	[Label] [nvarchar](50) NULL,
	[ShowLabel] [bit] NOT NULL,
	[Icon] [varchar](50) NULL,
	[ClassName] [varchar](50) NULL,
	[Style] [varchar](200) NULL,
	[HotKey] [varchar](50) NULL,
	[Renderer] [varchar](200) NULL,
	[Events] [varchar](200) NULL,
	[Disabled] [bit] NOT NULL,
	[Visibility] [bit] NOT NULL,
	[Validation] [nvarchar](1000) NULL,
	[Focus] [bit] NOT NULL,
	[Width] [varchar](20) NULL,
	[MinWidth] [varchar](20) NULL,
	[MaxWidth] [varchar](20) NULL,
	[Order] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UserInterface] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[VendorTypeId] [int] NOT NULL,
	[IsSelf] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[VendorType]    Script Date: 12/2/2019 3:00:31 PM ******/
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
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VolumeStart] [decimal](20, 5) NOT NULL,
	[VolumeEnd] [decimal](20, 5) NULL,
	[UomId] [int] NULL,
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
/****** Object:  Table [dbo].[WeightRange]    Script Date: 12/2/2019 3:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeightRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeightStart] [decimal](20, 5) NOT NULL,
	[WeightEnd] [decimal](20, 5) NULL,
	[UomId] [int] NULL,
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
/****** Object:  Table [dbo].[Workflow]    Script Date: 12/2/2019 3:00:31 PM ******/
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
SET IDENTITY_INSERT [dbo].[Accessory] ON 

INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 5, 4, N'Nhân test post 2 21312', N'Kia', 2, CAST(10000000.00000 AS Decimal(20, 5)), 2, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 1, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-16T17:13:01.5439748' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 5, NULL, N'Steering wheel 2', N'Manufactory', 1, CAST(12500000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-11T09:20:14.3632706' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 5, NULL, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 5, NULL, N'Tire', N'Kia', 1, CAST(10000000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 5, NULL, N'Steering wheel', N'Manufactory', 2, CAST(12500000.00000 AS Decimal(20, 5)), 2, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-10T12:19:21.4940282' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 5, NULL, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 5, NULL, N'Tire', N'Kia', 1, CAST(10000000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 5, NULL, N'Steering wheel', N'Manufactory', 1, CAST(12500000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 5, NULL, N'Oil cap', N'Manufactory', 1, CAST(5700000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2020-10-31T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-01T23:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 5, 2, N'Dashpot', N'1.0', 1, CAST(123.12000 AS Decimal(20, 5)), 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-22T00:00:00.0000000' AS DateTime2), 90720000000000, CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), 1, 1, CAST(N'2019-11-07T23:35:48.1146177' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 24, 2, N'Dashpot', N'aaaa bbb', 1, CAST(12.32000 AS Decimal(20, 5)), 2, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2023-11-18T00:00:00.0000000' AS DateTime2), 83808000000000, CAST(N'2020-02-13T00:00:00.0000000' AS DateTime2), 1, 1, CAST(N'2019-11-08T15:01:21.1580000' AS DateTime2), 1, CAST(N'2019-11-08T15:24:30.2065125' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 24, 2, N'Vô lăng', N'1112345', 2, CAST(122.22000 AS Decimal(20, 5)), 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), -1728000000000, CAST(N'2019-11-13T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2019-11-08T15:29:00.4140000' AS DateTime2), 1, CAST(N'2019-11-08T15:46:15.0814973' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 24, 2, N'Test-abccd', N'asd', 1, CAST(123.22000 AS Decimal(20, 5)), 1, CAST(N'2019-11-06T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-11-06T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2019-11-08T15:42:45.8180000' AS DateTime2), 1, CAST(N'2019-11-08T15:46:31.2848540' AS DateTime2), NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 7, 2, N'Test', N'1111', 1, CAST(0.00000 AS Decimal(20, 5)), 2, CAST(N'2019-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-18T00:00:00.0000000' AS DateTime2), 49248000000000, CAST(N'2020-01-08T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2019-11-11T09:44:47.0181562' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 7, 2, N'sadasd', N'asd', 1, CAST(0.00000 AS Decimal(20, 5)), 2, CAST(N'2019-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-20T00:00:00.0000000' AS DateTime2), 1, 1, CAST(N'2019-11-16T17:10:26.9799441' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Accessory] ([Id], [TruckId], [BranchId], [Name], [Version], [VendorId], [Price], [CurrencyId], [AssembledDate], [ExpiredDate], [MaintenancePeriod], [NextMaintenanceDate], [ApplyPeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 5, 4, N'test', N'test', 1, CAST(1232.22000 AS Decimal(20, 5)), 1, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2019-11-20T00:00:00.0000000' AS DateTime2), 0, 1, CAST(N'2019-11-23T09:21:28.0397669' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accessory] OFF
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Id], [Name], [Description], [BranchTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Honda', N'Good game changer', 2, 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Branch] ([Id], [Name], [Description], [BranchTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Hyundai', N'Famous branch name', 1, 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Branch] ([Id], [Name], [Description], [BranchTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Toyota', N'Not bad', 2, 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Branch] ([Id], [Name], [Description], [BranchTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Nissan', N'Japanese branch', 1, 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[BranchType] ON 

INSERT [dbo].[BranchType] ([Id], [Name], [Desciption], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Accessory', N'Accessory', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[BranchType] ([Id], [Name], [Desciption], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Truck', N'Truck', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[BranchType] ([Id], [Name], [Desciption], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Container', N'Container', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BranchType] OFF
SET IDENTITY_INSERT [dbo].[CommodityType] ON 

INSERT [dbo].[CommodityType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Food', N'Food', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CommodityType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Construction material', N'Construction material', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CommodityType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Electronic Components', N'Electronic Components', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CommodityType] OFF
SET IDENTITY_INSERT [dbo].[ComponentGroup] ON 

INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 9, N'Truck detail', NULL, 0, NULL, N'60%', N'padding: 0.6rem 0;', 4, 0, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 9, N'Image', NULL, 0, NULL, N'calc(40% - 1rem)', N'margin-left: 1rem;', 1, 0, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 9, N'Price', NULL, 0, NULL, N'100%', N'margin-top: 1rem;', 6, 4, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 9, N'Maintenance', NULL, 0, NULL, N'100%', N'margin-top: 1rem;', 6, 4, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 9, N'Truck info', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0; width: 900px; padding-bottom: 0; justify-content: center;', 0, 4, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 9, NULL, N'Button', 0, NULL, N'100%', N'border: 0px; margin-top: 0.4rem; padding-bottom: 0; justify-content: center; width: 150px;', 2, 1, NULL, NULL, 0, 5, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 9, N'Accessory', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0;width: 900px;', 0, 10, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 9, NULL, N'Accessory-list', 0, NULL, N'100%', N'border: 0; padding: 0; margin-top: 1rem;', 4, 4, NULL, NULL, 0, 13, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 9, N'Maintenance', NULL, 1, NULL, N'100%', N'padding-top: 1rem; border: 0;width: 800px;', 4, 4, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, NULL, N'Accessory-search', 0, NULL, N'auto', N'border: 0; padding:0;', 8, 4, NULL, NULL, 0, 13, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 4, NULL, N'TruckList', 0, NULL, N'100%', N'border: 0; padding:0;', 8, 4, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 4, NULL, N'truck-search-box', 0, NULL, N'45%', N'width: auto;border: 0px;padding: 0px;max-width: 400px;', 8, 4, NULL, NULL, 0, 17, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 4, NULL, N'GridView', 0, NULL, N'100%', N'border: 0; padding:0; margin-top: 1rem;', 8, 4, NULL, NULL, 0, 17, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 10, NULL, N'edit-Accessory', 0, NULL, N'100%', N'padding-top: 1rem; border: 0; width: 700px;', 0, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, 10, N'Info', N'info', 0, NULL, N'100%', NULL, 4, 0, NULL, NULL, 0, 20, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 10, N'Maintenance', N'price', 0, NULL, N'100%', N'margin-top: 1rem;', 4, 0, NULL, NULL, 0, 20, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 10, NULL, N'Button', 0, NULL, N'100%', N'border: 0px; margin-top: 0.4rem; padding-bottom: 0; justify-content: center; width: 150px; margin-left: 50%; transform: translateX(-50%); ', 2, 1, NULL, NULL, 0, 20, 1, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 10, NULL, N'info-container', 0, NULL, N'100%', N'border: 0;', 4, 0, NULL, NULL, 0, 21, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 9, NULL, N'MaintenanceSearch', 0, NULL, N'auto', N'border: 0; padding: 0;', 4, 0, NULL, NULL, 0, 15, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 9, NULL, N'MaintenanceList', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 0, NULL, NULL, 0, 15, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 11, NULL, N'edit-maintenance', 0, NULL, N'100%', N'padding-top: 1rem; border: 0; width: 700px;', 0, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 11, N'Info', N'info', 0, NULL, N'100%', NULL, 4, 0, NULL, NULL, 0, 29, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 11, N'Payment', N'payment', 0, NULL, N'100%', N'margin-top: 1rem;', 4, 0, NULL, NULL, 0, 29, 3, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 11, NULL, N'Button', 0, NULL, N'100%', N'border: 0px; margin-top: -1.6rem; padding-left: 0px; justify-content: center; width: 150px; padding-bottom: 10px;', 2, 1, NULL, NULL, 0, 29, 1, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, 11, NULL, N'Maintenance-detail', 0, NULL, N'100%', N'border: 0; padding: 0; margin-top: 1rem;', 0, 0, NULL, NULL, 0, 29, 4, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 5, NULL, N'accessory-container', 0, NULL, N'100%', N'border: 0; padding: 0;', 0, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 5, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; margin-top: 0.4rem; padding: 0px;', 4, 0, NULL, NULL, 0, 34, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 5, NULL, N'Accessory-list', 0, NULL, N'100%', N'border: 0; padding: 0; margin-top: 1rem;', 4, 4, NULL, NULL, 0, 34, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 6, NULL, N'maintenance-container', 0, NULL, N'100%', N'border: 0; padding: 0;', 0, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 6, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; padding: 0px;', 4, 0, NULL, NULL, 0, 37, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 6, NULL, N'maintenance-list', 0, NULL, N'100%', N'border: 0; padding: 0; margin-top: 0.8rem;', 4, 4, NULL, NULL, 0, 37, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 8, NULL, N'maintenance-container', 0, NULL, N'100%', N'border: 0; padding: 0;', 0, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 8, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; margin-top: 0.4rem; padding: 0px;', 4, 0, NULL, NULL, 0, 40, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 8, NULL, N'container-list', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 4, NULL, NULL, 0, 40, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 12, N'Info', N'Container-info', 0, NULL, N'100%', NULL, 4, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, 12, N'Renting', N'Container-renting', 0, NULL, N'100%', N'margin-top: 1rem;', 6, 0, NULL, NULL, 0, NULL, 2, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, 12, N'Payment', N'Container-payment', 0, NULL, N'100%', N'margin-top: 1rem;', 4, 0, NULL, NULL, 0, NULL, 3, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, 12, NULL, N'Container-button', 0, NULL, N'100%', N'width: 100px; border: 0px; margin-top: 0.4rem; padding: 0px; left: 50%;
    transform: translateX(-50%); margin-top: 1rem;', 4, 0, NULL, NULL, 0, NULL, 4, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, 13, NULL, N'maintenance-container', 0, NULL, N'100%', N'border: 0; padding: 0;', 0, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 13, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; margin-top: 0.4rem; padding: 0px;', 4, 0, NULL, NULL, 0, 47, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 13, NULL, N'container-list', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 4, NULL, NULL, 0, 47, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 15, N'Info', N'layout', 0, NULL, N'100%', NULL, 4, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 15, NULL, N'avatar', 0, NULL, N'60%', N'    width: 60%;
    padding: 0;
    border: 0px;', 6, 0, NULL, NULL, 0, 50, 2, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, 15, NULL, N'common', 0, NULL, N'calc(40% - 1rem)', N'border: 0px;
    /* margin-top: 1rem; */
    margin-left: 1rem;
    padding: 0;
    margin-top: 0;', 2, 0, NULL, NULL, 0, 50, 3, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, 15, N'Contact', N'contact', 0, NULL, N'100%', N'margin-top: 1rem;', 4, 0, NULL, NULL, 0, NULL, 3, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, 15, NULL, N'Button', 0, NULL, N'100%', N'    border: 0px;
    margin-top: 0.4rem;
    padding-bottom: 0px;
    width: 150px;
    margin-left: 50%;
    transform: translateX(-50%);
', 4, 0, NULL, NULL, 0, NULL, 3, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, 16, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; margin-top: 0.4rem; padding: 0px;', 4, 0, NULL, NULL, 0, 59, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, 16, NULL, N'quotation-list', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 4, NULL, NULL, 0, 59, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, 16, NULL, N'quotation-tab', 0, NULL, N'100%', N'border: 0; padding: 0;', 4, 4, NULL, NULL, 0, NULL, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, 18, N'Target', N'target', 0, NULL, N'calc(50% - 0.5rem)', NULL, 2, 0, NULL, NULL, 0, 68, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, 18, N'Terminal', NULL, 0, NULL, N'calc(50% - 0.5rem)', N'margin-left: 1rem;', 2, 0, NULL, NULL, 0, 68, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, 18, N'Cont spec', NULL, 0, NULL, N'100%', N'margin-top: 1rem;', 4, 0, NULL, NULL, 0, 67, 3, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, 18, NULL, N'Button', 0, NULL, N'100%', N'width: 100px; border: 0px; margin-top: 0.4rem; padding: 0px; left: 50%;
    transform: translateX(-50%); margin-top: 1rem;', 4, 0, NULL, NULL, 0, 67, 20, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, 18, NULL, N'quotation-detail', 0, NULL, N'auto', N'width: 600px; border: 0; padding: 0;', 4, 4, NULL, NULL, 0, NULL, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, 18, NULL, N'Terminal-target', 0, NULL, N'100%', N'border: 0; padding: 0;', 2, 0, NULL, NULL, 0, 67, 0, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, 18, N'Time', N'time-frame', 0, NULL, N'calc(50% - 0.5rem)', N'margin-top: 1rem;', 2, 0, NULL, NULL, 0, 67, 4, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, 18, N'Price', N'price', 0, NULL, N'calc(50% - 0.5rem)', N'margin-top: 1rem; margin-left: 1rem;', 4, 0, NULL, NULL, 0, 67, 5, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1055, 1016, NULL, N'Button', 0, NULL, N'auto', N'border: 0px; margin-top: 0.4rem; padding: 0px; display: table-row', 4, 0, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1056, 1016, NULL, N'sale-order-list', 0, NULL, N'100%', N'border: 0; padding: 0; margin-top: 1rem;', 4, 4, NULL, NULL, 0, NULL, NULL, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1057, 1017, N'Customer', N'null', 0, NULL, N'100%', N'width: calc(100% - 0.5rem); margin-top: 0.35rem; margin-left: 0.25rem;', 8, 0, NULL, NULL, 0, 1079, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1059, 1017, N'Payment', N'null', 0, NULL, N'100%', N'width: calc(100% - 0.5rem); margin-top: 0.35rem; margin-left: 0.25rem; margin-bottom: 0.24rem;', 8, 0, NULL, NULL, 0, 1080, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1061, 1017, NULL, N'Button', 0, NULL, N'auto', N'width: auto; padding: 0px; border: 0px; display: inline-block; margin-bottom: 0.6rem; position: absolute; left: 50%; z-index: 1; transform: translateX(-50%); bottom: -2px;', 6, 0, NULL, NULL, 0, 1062, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1062, 1017, N'Sale order', NULL, 1, NULL, N'1000px', N'border: 0; padding: 0.7rem 0 0.3rem;', 0, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1063, 1017, N'Order detail', NULL, 1, N'OrderDetail', N'auto', N'border: 0; padding: 0;', 6, 0, NULL, NULL, 0, 1062, 3, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1064, 1017, N'Surcharge', NULL, 1, N'OrderDetail', N'auto', N'border: 0; padding: 0;', 6, 0, NULL, NULL, 0, 1062, 4, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1067, 1019, N'Retail order', N'Order composition', 1, NULL, N'100%', N'border: 0; padding: 0; margin-top: -2px;', 1, 0, NULL, NULL, 0, 1070, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1069, 1019, N'Coordination', N'Coordination', 1, NULL, N'100%', N'border: 0; padding: 0; margin-top: -2px;', 1, 0, NULL, NULL, 0, 1070, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1070, 1019, NULL, N'Coor-Container', 0, NULL, N'100%', N'border: 0px; padding: 0px; display: block;', 1, 0, NULL, NULL, 0, NULL, 0, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1071, 1019, NULL, N'Coor-button', 0, NULL, N'auto', N'width: auto; border: 0px; padding: 0px; position: absolute; top: -30px; left: 30rem;', 4, 0, NULL, NULL, 0, 1069, 0, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1072, 1020, N'Transportation', NULL, 0, NULL, N'calc(450px - 0.5rem)', NULL, 4, 0, NULL, NULL, 0, 1075, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1073, 1020, N'Spec', NULL, 0, NULL, N'900px', N'margin-top: 1rem; margin-bottom: 4rem;', 8, 0, NULL, NULL, 0, NULL, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1074, 1020, N'Note', N'Note', 0, NULL, N'calc(450px - 0.5rem)', N'margin-left: 1rem;', 8, 0, NULL, NULL, 0, 1075, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1075, 1020, NULL, N'box-wrapper', 0, NULL, N'900px', N'border: 0; padding: 0; display: flex;', 8, 0, NULL, NULL, 0, NULL, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1076, 1020, N'Coordination Detail', N'coordination-detail', 1, N'Detail', N'900px', N'border: 0; padding: 0;', 0, 0, NULL, NULL, 0, NULL, 3, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1077, 1020, NULL, N'Button', 0, NULL, N'auto', N'border: 0; padding: 0; display: table; margin-bottom: 1rem;', 0, 0, NULL, NULL, 0, NULL, 0, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1078, 1017, N'Progress & coordination', NULL, 0, NULL, N'auto', N'width: calc(100% - 0.5rem); margin: 0.8rem 0 0.25rem 0.25rem;', 10, 0, NULL, NULL, 0, 1079, 2, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1079, 1017, N'Info', NULL, 1, N'Info', N'auto', N'border-top-width: 1px;', 6, 0, NULL, NULL, 0, 1081, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1080, 1017, N'Payment', NULL, 1, N'Info', N'auto', NULL, 6, 0, NULL, NULL, 0, 1081, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ComponentGroup] ([Id], [FeatureId], [Name], [ClassName], [IsTab], [TabGroup], [Width], [Style], [Column], [Row], [PolicyId], [StateId], [Hidden], [ParentId], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1081, 1017, NULL, NULL, 0, NULL, N'auto', N'border: 0; padding: 0; margin-bottom: 1rem;', 6, 0, NULL, NULL, 0, 1062, 1, 1, CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ComponentGroup] OFF
SET IDENTITY_INSERT [dbo].[Container] ON 

INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 3, 1, N'C0001', N'C0001', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 4, 2, N'C0002', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 4, 1, N'C0003', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 3, 1, N'C0004', N'C0001', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 4, 2, N'C0005', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 3, 1, N'C0006', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 1, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-11T16:32:27.3301261' AS DateTime2), NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 3, 1, N'C0001', N'C0001', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 1, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-11T16:32:32.4055819' AS DateTime2), NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 4, 2, N'C0002', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 1, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 4, 1, N'C0002', N'C0002', 2, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-11T00:00:00.0000000' AS DateTime2), CAST(1000000.00000 AS Decimal(20, 5)), CAST(N'2019-12-11T00:00:00.0000000' AS DateTime2), 0, CAST(3000000.00000 AS Decimal(20, 5)), 1, 0, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-11T16:18:08.7931031' AS DateTime2), NULL)
INSERT [dbo].[Container] ([Id], [VendorId], [ContainerTypeId], [Code], [Description], [FreightStateId], [RentDate], [EndRentDate], [AdvancedPaid], [NextPayment], [ApplyPeriod], [PeriodPayment], [CurrencyId], [InUse], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 3, 2, N'C00012', N'test desc', NULL, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-04T00:00:00.0000000' AS DateTime2), CAST(1232.00000 AS Decimal(20, 5)), CAST(N'2019-12-17T00:00:00.0000000' AS DateTime2), 1, CAST(1222.00000 AS Decimal(20, 5)), NULL, 1, 1, CAST(N'2019-11-11T16:16:22.6090000' AS DateTime2), 1, CAST(N'2019-11-11T16:17:56.4479677' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Container] OFF
SET IDENTITY_INSERT [dbo].[ContainerRange] ON 

INSERT [dbo].[ContainerRange] ([Id], [MinContainer], [MaxContainer], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 0, 1, N'Basic', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ContainerRange] ([Id], [MinContainer], [MaxContainer], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 2, 3, N'Popular package', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ContainerRange] ([Id], [MinContainer], [MaxContainer], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 4, 10, N'Premium', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ContainerRange] OFF
SET IDENTITY_INSERT [dbo].[ContainerType] ON 

INSERT [dbo].[ContainerType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'20ft', N'20ft', 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[ContainerType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'40ft', N'40ft', 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ContainerType] OFF
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([Id], [UserId], [StartDate], [EndDate], [Salary], [Currency], [Allowance], [Details], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2029-10-07T00:00:00.0000000' AS DateTime2), 1000000000, N'USD', 0, N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Contract] OFF
SET IDENTITY_INSERT [dbo].[Coordination] ON 

INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 1, 3, 1, 1, 1, NULL, 57, 0, CAST(26555.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), 1, 4, 1, 1, N'dead note', 1, CAST(N'2019-11-26T10:30:01.1880000' AS DateTime2), 1, CAST(N'2019-11-27T10:33:30.8455453' AS DateTime2), 1)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 1, 2, 1, 2, NULL, 1, 1, 0, CAST(123.22000 AS Decimal(20, 5)), CAST(12.32000 AS Decimal(20, 5)), CAST(0.00000 AS Decimal(20, 5)), 1, 4, 2, NULL, NULL, 1, CAST(N'2019-11-26T14:09:58.2310000' AS DateTime2), 1, CAST(N'2019-11-27T09:45:04.2153252' AS DateTime2), 1)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 1, 2, 2, 2, NULL, 2, 1, 0, CAST(123.33000 AS Decimal(20, 5)), CAST(23.22000 AS Decimal(20, 5)), CAST(122.22000 AS Decimal(20, 5)), 3, 4, 1, NULL, NULL, 1, CAST(N'2019-11-26T14:10:13.2886319' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, 1, 2, NULL, NULL, NULL, 1, 12, 0, NULL, NULL, CAST(123.23000 AS Decimal(20, 5)), 1, 4, 4, 2, NULL, 1, CAST(N'2019-11-27T18:14:19.8038132' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.5017865' AS DateTime2), 1)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, 2, 3, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, CAST(123.23000 AS Decimal(20, 5)), 2, 4, 2, NULL, NULL, 1, CAST(N'2019-11-27T18:14:19.8069158' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, 3, 1, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, CAST(1231.23000 AS Decimal(20, 5)), 3, 4, 4, NULL, NULL, 1, CAST(N'2019-11-27T18:14:19.8069457' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, 1, 1, 2, 2, 2, 2, 12, 0, NULL, NULL, CAST(212.23000 AS Decimal(20, 5)), 1, 4, 2, 1, NULL, 1, CAST(N'2019-11-27T22:39:44.8640476' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, 1, 2, 1, 2, 3, 2, 12, 0, CAST(146.64000 AS Decimal(20, 5)), CAST(146.64000 AS Decimal(20, 5)), CAST(12.22000 AS Decimal(20, 5)), 2, 4, 4, 2, NULL, 1, CAST(N'2019-11-28T08:50:01.3186958' AS DateTime2), 1, CAST(N'2019-11-28T09:57:33.4450718' AS DateTime2), 1)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, 1, 2, 1, 2, 3, 2, 15, 0, CAST(4000000.00000 AS Decimal(20, 5)), CAST(30555.50000 AS Decimal(20, 5)), CAST(0.00000 AS Decimal(20, 5)), 1, 4, 3, 1, N'adding', 1, CAST(N'2019-11-29T09:10:27.9468618' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, 2, 1, 2, 1, 3, 2, 10, 0, CAST(33333.00000 AS Decimal(20, 5)), CAST(0.00000 AS Decimal(20, 5)), CAST(200.11000 AS Decimal(20, 5)), 2, 4, 2, 2, N'Test price', 1, CAST(N'2019-12-01T13:27:49.8468487' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, 2, 1, 2, 1, 3, 2, 12, 0, NULL, NULL, NULL, NULL, 4, 1, 2, N'Test price 2', 1, CAST(N'2019-12-01T13:33:19.2911925' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Coordination] ([Id], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [TruckTypeId], [CommodityTypeId], [TotalContainer], [IsComposited], [Weight], [Volume], [Distance], [TimeboxId], [FreightStateId], [TaskStateId], [ContainerTypeId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, 2, 1, 2, 1, NULL, NULL, 1, 1, CAST(61610.00000 AS Decimal(20, 5)), CAST(6110.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), 2, 4, NULL, NULL, NULL, 1, CAST(N'2019-12-02T14:25:42.5463293' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Coordination] OFF
SET IDENTITY_INSERT [dbo].[CoordinationDetail] ON 

INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 5, 4, 1, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 6, 4, 2, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 7, 5, 3, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 8, 6, 4, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 9, 7, 5, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 10, 8, 6, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 11, 9, 7, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 15, 10, 8, 49, 4, 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 5, 2, NULL, 28, NULL, 0, CAST(N'2019-11-26T22:40:56.0069816' AS DateTime2), 1, CAST(N'2019-11-26T22:42:03.4819374' AS DateTime2), 1)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 6, 2, NULL, 28, NULL, 0, CAST(N'2019-11-26T22:40:56.0128944' AS DateTime2), 1, CAST(N'2019-11-26T22:42:03.4827205' AS DateTime2), 1)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 5, 3, 7, 28, NULL, 1, CAST(N'2019-11-26T22:42:16.1710000' AS DateTime2), 1, CAST(N'2019-11-27T10:33:30.8429347' AS DateTime2), 1)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 6, 3, 5, 28, NULL, 1, CAST(N'2019-11-26T22:42:45.0080000' AS DateTime2), 1, CAST(N'2019-11-27T10:33:30.8450624' AS DateTime2), 1)
INSERT [dbo].[CoordinationDetail] ([Id], [TruckId], [DriverId], [ContainerId], [CoordinationId], [FreightStateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 7, 3, 5, 28, NULL, 1, CAST(N'2019-11-27T10:15:08.0890000' AS DateTime2), 1, CAST(N'2019-11-27T10:33:30.8450714' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[CoordinationDetail] OFF
INSERT [dbo].[Currency] ([Id], [Name], [Symbol], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'USD', N'$', N'United State Dollar', 1, CAST(N'2019-10-25T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Currency] ([Id], [Name], [Symbol], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'VND', N'đ', N'Việt Nam đồng', 1, CAST(N'2019-10-25T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 2, 5, 1, CAST(N'2019-11-14T17:00:08.0233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 7, 1, CAST(N'2019-11-14T17:00:08.0230000' AS DateTime2), 1, CAST(N'2019-11-14T17:50:43.7117079' AS DateTime2), NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 6, 1, CAST(N'2019-11-14T17:00:08.0230000' AS DateTime2), 1, CAST(N'2019-11-16T17:17:22.2482194' AS DateTime2), NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 2, 8, 1, CAST(N'2019-11-14T17:00:08.0233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 1, 9, 1, CAST(N'2019-11-14T17:00:08.0233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 1, 10, 1, CAST(N'2019-11-14T17:00:08.0233333' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, 11, 0, CAST(N'2019-11-14T18:07:34.0480000' AS DateTime2), 1, CAST(N'2019-11-14T22:45:57.1668655' AS DateTime2), NULL)
INSERT [dbo].[Customer] ([Id], [CustomerGroupId], [UserId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 1, 12, 0, CAST(N'2019-11-16T17:17:58.0759842' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerGroup] ON 

INSERT [dbo].[CustomerGroup] ([Id], [GroupName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'VIP', N'VIP - discount', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CustomerGroup] ([Id], [GroupName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Normal', N'Normal', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[CustomerGroup] ([Id], [GroupName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Other', N'Other', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerGroup] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [LeaderId], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'IT', 1, N'Information technology', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[DistanceRange] ON 

INSERT [dbo].[DistanceRange] ([Id], [MinDistance], [MaxDistance], [UomId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 5, N'Basic package', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[DistanceRange] ([Id], [MinDistance], [MaxDistance], [UomId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, CAST(50.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 5, N'Popular package', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[DistanceRange] ([Id], [MinDistance], [MaxDistance], [UomId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, CAST(100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 5, N'Premium', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[DistanceRange] ([Id], [MinDistance], [MaxDistance], [UomId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, CAST(500.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), 5, N'Extra', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DistanceRange] OFF
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
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'Currency', 1, CAST(N'2019-10-21T14:48:51.5366667' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'BranchType', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'Branch', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, N'DistanceRange', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, N'ContainerRange', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'PriceType', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1059, N'SurchargeType', 1, CAST(N'2019-11-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1060, N'UomType', 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1061, N'CoordinationDetail', 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1062, N'StateType', 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1063, N'StackDirection', 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Entity] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1064, N'TaskState', 1, CAST(N'2019-01-02T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Main', N'Main', NULL, NULL, 0, 1, 1, NULL, N'Manage truck detail', 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Dashboard', N'Dashboard', NULL, N'mif-home', 0, 0, 1, N'TMS.UI.Business.Dashboard.Dashboard', N'Statistic', 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Asset', N'Asset', NULL, N'mif-truck', 0, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Truck List', N'Truck', 3, N'mif-truck', 0, 0, 1, N'TMS.UI.Business.Asset.TruckBL', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'AccessoryTab', N'Accessory', 3, N'mif-steam2', 0, 0, 1, N'TMS.UI.Business.Asset.AccessoryBL', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'MaintenanceTab', N'Maintenance', 3, N'mif-calendar', 0, 0, 1, N'TMS.UI.Business.Asset.MaintenanceBL', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, NULL, NULL, 3, NULL, 1, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Container', N'Container', 3, N'fa fa-cube', 0, 0, 1, N'TMS.UI.Business.Asset.ContainerBL', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Truck Detail', N'Truck Detail', NULL, NULL, 0, 0, 0, NULL, N'Add new or edit truck', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Accessory Detail', N'Accessory Detail', NULL, NULL, 0, 0, 0, NULL, N'Add new or edit Accessory', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'TruckMaintenance Detail', N'Maintenance Detail', NULL, NULL, 0, 0, 0, NULL, N'Add new or edit Maintenance', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Container Editor', N'Container Editor', NULL, NULL, 0, 0, 0, NULL, N'Add new or edit a conatainer', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'Customer List', N'Customer', 17, N'fa fa-user-tie', 0, 0, 1, N'TMS.UI.Business.Sale.CustomerBL', N'Customer relationship', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Customer Detail', N'Customer detail', NULL, N'fa fa-user-tie', 0, 0, 0, NULL, N'Add or update customer', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Quotation List', N'Quotation list', 17, N'fa fa-file-contract', 0, 0, 1, N'TMS.UI.Business.Sale.QuotationBL', N'Quotation list', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'Sale', N'Sale', NULL, N'fa fa-chart-pie', 0, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Quotation Detail', N'Quotation', NULL, NULL, 0, 0, 0, NULL, N'Add or update quotation', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1016, N'SaleOrder', N'Order', 17, N'fa fa-shopping-cart', 0, 0, 1, N'TMS.UI.Business.Sale.SaleOrderBL', N'Mange sale order', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1017, N'SaleOrder Editor', N'Sale Order', NULL, N'fa fa-shopping-cart', 0, 0, 0, NULL, N'Create or update', 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1018, N'Freight', N'Freight', NULL, N'fa fa-location-arrow', 0, 0, 1, NULL, NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1019, N'CoordinationManagement', N'Coordination', 1018, N'fa fa-handshake', 0, 0, 1, N'TMS.UI.Business.Freight.CoordinationBL', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Feature] ([Id], [Name], [Label], [ParentId], [Icon], [IsDevider], [IsGroup], [IsMenu], [ViewClass], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1020, N'Coordination Detail', N'Coordination', NULL, NULL, 0, 0, 0, NULL, N'Assign driver, truck and container to a coordination', 1, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[FreightState] ON 

INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Moving', N'Moving with container', NULL, 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Idle', N'Idling', NULL, 1, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'In-Order', N'In Order', NULL, 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'In-Coordination', N'In Coordination', NULL, 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Ready to transit', N'Driver takes the container to deliver', NULL, 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'In-Transit', N'Driver in in his wat', NULL, 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FreightState] ([Id], [Name], [Description], [StateTypeId], [WorkflowId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Delivered', N'Delivered', NULL, 1, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FreightState] OFF
SET IDENTITY_INSERT [dbo].[FuelType] ON 

INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Diesel', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[FuelType] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gas', 1, CAST(N'2019-10-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FuelType] OFF
SET IDENTITY_INSERT [dbo].[GridPolicy] ON 

INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 9, 1, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 9, 1, N'Version', N'Version', N'Version', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 9, 1, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 9, 1, N'Price', N'Price', N'Price', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 9, 1, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 9, 1, N'AssembledDate', N'AssembledDate', N'AssembledDate', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 9, 1, N'ExpiredDate', N'ExpiredDate', N'ExpiredDate', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 9, 1, N'NextMaintenanceDate', N'NextMaintenanceDate', N'NextMaintenanceDate', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, NULL, 18, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, NULL, 18, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, NULL, 46, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, NULL, 46, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, NULL, 37, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, NULL, 37, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, NULL, 21, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, NULL, 21, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, NULL, 19, N'Address', N'Address', N'Address', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, NULL, 19, N'FullName', N'Full Name', N'Full Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, NULL, 56, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, NULL, 56, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 4, 14, N'TruckPlate', N'Truck Plate', N'Truck Plate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 4, 14, N'BranchId', N'Brand Name', N'Brand Name', 58, NULL, N'Branch', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 4, 14, N'Model', N'Model', N'Model', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 4, 14, N'Year', N'Year', N'Year', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 4, 14, N'Color', N'Color', N'Color', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 4, 14, N'Vin', N'Vin', N'Vin', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 4, 14, N'TruckTypeId', N'Truck Type', N'Truck Type', 18, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 4, 14, N'FuelTypeId', N'Fuel Type', N'Fuel Type', 46, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 4, 14, N'KmPerLit', N'Km/Lit', N'Km per Lit', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 4, 14, N'MaxCapacity', N'Max Capacity', N'Max Capacity', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 4, 14, N'PlateRenewal', N'Plate Renewal', N'Plate Renewal', NULL, NULL, N'Info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 4, 14, N'DepartmentId', N'Department', N'Department', 37, NULL, N'Info', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 4, 14, N'Note', N'Note', N'Note', NULL, NULL, N'Info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 4, 14, N'Image', N'Image', N'Image', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 0, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 4, 14, N'InUse', N'In Use', N'In Use', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 4, 14, N'MaxCbm', N'Max CBM', N'Max CBM', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 4, 14, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 4, 14, N'DriverId', N'Driver', N'Driver', 19, N'?$filter=Role/RoleName eq ''Driver''', NULL, N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 4, 14, N'Price', N'Price', N'Price', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, 4, 14, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, 4, 14, N'BoughtDate', N'Bought Date', N'Bought Date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, 4, 14, N'ActiveDate', N'Active Date', N'Active Date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, 4, 14, N'ExpiredDate', N'Expired Date', N'Expired Date', NULL, NULL, N'Maintenance', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 4, 14, N'MaintenanceStart', N'Maintenance Start', N'Maintenance Start', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 4, 14, N'MaintenanceEnd', N'Maintenance End', N'Maintenance End', NULL, NULL, N'Maintenance', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 4, 14, N'NextMaintenanceDate', N'NextMaintenance Date', N'NextMaintenance Date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 4, 14, N'MaintenancePeriod', N'Maintenance Period', N'Maintenance Period', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, NULL, 58, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, NULL, 58, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, NULL, 14, N'TruckPlate', N'Truck Plate', N'Truck Plate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, NULL, 14, N'BrandName', N'Brand Name', N'Brand Name', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, NULL, 14, N'Model', N'Model', N'Model', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, NULL, 14, N'Year', N'Year', N'Year', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, NULL, 14, N'Color', N'Color', N'Color', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, NULL, 14, N'Vin', N'Vin', N'Vin', NULL, NULL, N'Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, NULL, 14, N'TruckTypeId', N'Truck Type', N'Truck Type', 18, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, 9, 15, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, 9, 15, N'StartDate', N'Start date', N'Start date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, 9, 15, N'EndDate', N'End date', N'End date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, 9, 15, N'AdvancedPaid', N'Advanced paid', N'Advanced paid', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, 9, 15, N'Paid', N'Paid', N'Paid', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (68, 9, 15, N'Total', N'Total', N'Total', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, 9, 15, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Payment', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, 9, 15, N'AccountableUserId', N'Accountable', N'Accountable', 19, N'/Office?$filter=Active eq true', NULL, N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, 11, 16, N'AccessoryId', N'Accessory', N'AccessoryId', 1, N'?$filter=Truck/Id eq {TruckId}', NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, 11, 16, N'Detail', N'Detail', N'Detail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, 11, 16, N'Price', N'Price', N'Price', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, 11, 16, N'CurrencyId', N'Currency', N'Currency', 56, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, NULL, 1, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, NULL, 1, N'Version', N'Version', N'Version', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, NULL, 1, N'BranchId', N'Branch name', N'Branch name', 58, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, 5, 1, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (80, 5, 1, N'Version', N'Version', N'Version', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 2, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (81, 5, 1, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, 5, 1, N'Price', N'Price', N'Price', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, 5, 1, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, 5, 1, N'AssembledDate', N'Assembled date', N'Assembled date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, 5, 1, N'ExpiredDate', N'Expired date', N'Expired date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, 5, 1, N'NextMaintenanceDate', N'Next maintenance date', N'Next maintenance date', NULL, NULL, N'Maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, 5, 1, N'TruckId', N'Truck plate', N'Truck plate', 14, N'?$filter=Active eq true', NULL, N'{TruckPlate}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, 6, 15, N'TruckId', N'Truck plate', N'Truck plate', 14, NULL, NULL, N'{TruckPlate}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, 6, 15, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, 6, 15, N'StartDate', N'Start date', N'Start date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, 6, 15, N'EndDate', N'End date', N'End date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, 6, 15, N'AdvancedPaid', N'Advanced paid', N'Advanced paid', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, 6, 15, N'Paid', N'Paid', N'Paid', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, 6, 15, N'Total', N'Total', N'Total', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, 6, 15, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Payment', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, 8, 31, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, 8, 31, N'ContainerTypeId', N'Container type', N'Container type', 32, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, 8, 31, N'Code', N'Code', N'Code', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, 8, 31, N'Description', N'Desciption', N'Desciption', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, 8, 31, N'FreightStateId', N'Status', N'Status', 45, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, 8, 31, N'RentDate', N'Rent date', N'Rent date', NULL, NULL, N'Renting info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, 8, 31, N'EndRentDate', N'End date', N'End date', NULL, NULL, N'Renting info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, 8, 31, N'AdvancedPaid', N'Advanced paid', N'Advanced paid', NULL, NULL, N'Renting info', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (105, 8, 31, N'NextPayment', N'Next payment', N'Next payment', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, 8, 31, N'ApplyPeriod', N'Apply period', N'Apply period', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, 8, 31, N'PeriodPayment', N'Period payment', N'Period payment', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, 8, 31, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Payment', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, 8, 31, N'InUse', N'In use', N'In use', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, NULL, 32, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, NULL, 32, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, 13, 35, N'CustomerGroupId', N'Group', N'Group', 36, NULL, NULL, N'{GroupName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, 2, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, 13, 35, N'User.FullName', N'Full name', N'Full name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, 13, 35, N'User.DoB', N'Date of birth', N'Date of birth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 3, 1, 0, 0, N'Datepicker', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, 13, 35, N'User.Ssn', N'SSN', N'SSN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 4, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, 13, 35, N'User.Passport', N'Passport', N'Passport', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 5, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, 13, 35, N'User.Address', N'Address', N'Address', NULL, NULL, N'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, 13, 35, N'User.Address2', N'Address2', N'Address2', NULL, NULL, N'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, 13, 35, N'User.PhoneNumber', N'Phone number', N'Phone number', NULL, NULL, N'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, 13, 35, N'User.PhoneNumber2', N'Phone number 2', N'Phone number 2', NULL, NULL, N'Contact', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 1, 0, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (121, 13, 35, N'User.NationalityId', N'Nationality', N'Nationality', 51, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 5, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (122, 13, 35, N'User.Avatar', N'Img', N'Img', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 1, 0, NULL, NULL, 0, 0, 0, 0, N'Image', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, NULL, 36, N'GroupName', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, NULL, 36, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, NULL, 51, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, NULL, 51, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, 16, 5, N'CustomerGroupId', N'Customer group', N'Customer group', 36, NULL, N'Target', N'{GroupName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, 16, 5, N'FromId', N'From', N'From', 9, NULL, N'Terminal', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 1, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, 16, 5, N'ToId', N'To', N'To', 9, NULL, N'Terminal', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, 16, 5, N'ContainerTypeId', N'Container type', N'Container type', 32, NULL, N'Container spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, 16, 5, N'IsContainer', N'Is Cont', N'Is Cont', NULL, NULL, N'Container spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, 16, 5, N'ContainerRangeId', N'Container No.', N'Container No.', 60, NULL, N'Container spec', N'{MinContainer} - {MaxContainer}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, 16, 5, N'VendorId', N'Vendor', N'Vendor', 21, NULL, N'Target', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, 16, 5, N'CommodityTypeId', N'Commodity type', N'Commodity type', 29, NULL, N'Commodity spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, 16, 5, N'WeightRangeId', N'Weight range', N'Weight range', 24, N'?$expand=Uom&$filter=true ', N'Commodity spec', N'{WeightStart} - {WeightEnd} {Uom.Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, 16, 5, N'VolumeRangeId', N'Volume range', N'Volume range', 23, N'?$expand=Uom&$filter=true ', N'Commodity spec', N'{VolumeStart} - {VolumeEnd} {Uom.Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, 16, 5, N'TimeboxId', N'Timebox', N'Timebox', 11, NULL, N'Time frame', N'{TimeboxStart} - {TimeboxEnd}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, 16, 5, N'EffectiveDate', N'Effective date', N'Effective date', NULL, NULL, N'Time frame', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, 16, 5, N'ExpiredDate', N'Expiry date', N'Expiry date', NULL, NULL, N'Time frame', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (141, 16, 5, N'Price', N'Price', N'Price', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, 16, 5, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, 16, 5, N'InsertedDate', N'Created date', N'Created date', NULL, NULL, N'Actor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, 16, 5, N'InsertedBy', N'Created by', N'Created by', 19, NULL, N'Actor', N'{FullName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, 16, 5, N'UpdatedDate', N'Updated date', N'Updated date', NULL, NULL, N'Actor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, 16, 5, N'UpdatedBy', N'Updated by', N'Updated by', 19, NULL, N'Actor', N'{FullName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, NULL, 35, N'User.FullName', N'FullName', N'FullName', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, NULL, 35, N'User.PhoneNumber', N'PhoneNumber', N'PhoneNumber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, 16, 5, N'DistanceRangeId', N'Distance', N'Distance', 59, N'?$expand=Uom&$filter=true', N'Terminal', N'{MinDistance} - {MaxDistance} {Uom.Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 5, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, 16, 5, N'TruckTypeId', N'Truck type', N'Truck type', 18, NULL, N'Target', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, 16, 5, N'CustomerId', N'Customer', N'Customer', 35, N'?$expand=User&$filter=true', N'Target', N'{User.FullName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, 16, 5, N'EmptyContFrom', N'Empty cont from', N'Empty cont from', 9, NULL, N'Terminal', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 3, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, 16, 5, N'EmptyContTo', N'Empty cont to', N'Empty cont to', 9, NULL, N'Terminal', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 4, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, 16, 5, N'Vat', N'VAT', N'VAT', NULL, NULL, N'Price', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'right', 0, 0, NULL, NULL, 4, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, 16, 5, N'QuotationTypeId', N'Price by', N'Price by', 61, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'right', 0, 0, NULL, NULL, 4, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, 16, 5, N'ForGroupOnly', N'Group only', N'Group only', NULL, NULL, N'Target', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'center', 1, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, NULL, 9, N'ShortName', N'Short Name', N'Short Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, NULL, 9, N'FullName', N'Full name', N'Full name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, NULL, 9, N'Address', N'Address', N'Address', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, NULL, 11, N'TimeboxStart', N'Start', N'Start', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, NULL, 11, N'TimeboxEnd', N'End', N'End', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, NULL, 61, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, NULL, 61, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (165, NULL, 60, N'MinContainer', N'Min', N'Min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (166, NULL, 60, N'MaxContainer', N'Max', N'Max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (167, NULL, 29, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (168, NULL, 29, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (169, NULL, 24, N'WeightStart', N'Min', N'Min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (170, NULL, 24, N'WeightEnd', N'Max', N'Max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (171, NULL, 24, N'Uom.Name', N'UoM', N'UoM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (172, NULL, 23, N'VolumeStart', N'Min', N'Min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (173, NULL, 23, N'VolumeEnd', N'Max', N'Max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (174, NULL, 23, N'Uom.Name', N'UoM', N'UoM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (175, NULL, 59, N'MinDistance', N'Min', N'Min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (176, NULL, 59, N'MaxDistance', N'Max', N'Max', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (177, NULL, 59, N'Uom.Name', N'UoM', N'UoM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1112, 1016, 54, N'CustomerId', N'Customer', N'Customer', 35, N'?$expand=User&$filter=true', N'Customer', N'{User.FullName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 2, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1113, 1016, 54, N'ContactFirstName', N'Contact', N'Contact', NULL, NULL, N'Customer', NULL, N'{ContactFirstName} {ContactLastName}', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1114, 1016, 54, N'ContactNumber', N'Contact Phone', N'Contact Phone', NULL, NULL, N'Customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 4, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1121, 1016, 54, N'TotalContainer', N'Total Cont', N'Total Cont', NULL, NULL, N'Transportation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1123, 1016, 54, N'AdvancedPaid', N'Advanced paid', N'Advanced paid', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1124, 1016, 54, N'Paid', N'Paid', N'Paid', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1125, 1016, 54, N'DiscountMoney', N'Discount money', N'Discount money', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1126, 1016, 54, N'DiscountPercentage', N'Discount percentage', N'Discount percentage', NULL, NULL, N'Payment', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1127, 1016, 54, N'Vat', N'VAT', N'VAT', NULL, NULL, N'Price', N'{0:n} %', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1128, 1016, 54, N'TotalPriceBeforeDiscount', N'Before discount', N'Before discount', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1129, 1016, 54, N'TotalPriceAfterDiscount', N'After discount', N'After discount', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1130, 1016, 54, N'TotalPriceAfterTax', N'After tax', N'After tax', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1131, 1016, 54, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1132, 1016, 54, N'AdvancedPaidDate', N'Advanced paid date', N'Advanced paid date', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1133, 1016, 54, N'PaidDate', N'Paid date', N'Paid date', NULL, NULL, N'Payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1134, 1016, 54, N'InsertedDate', N'Created date', N'Created date', NULL, NULL, N'Audit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1135, 1016, 54, N'InsertedBy', N'Created by', N'Customer', 19, NULL, N'Audit', N'{FullName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1136, 1016, 54, N'UpdatedDate', N'Updated date', N'Updated date', NULL, NULL, N'Audit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1137, 1016, 54, N'UpdatedBy', N'Updated by', N'Customer', 19, NULL, N'Audit', N'{FullName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1139, 1017, 2, N'FromId', N'From terminal', N'From terminal', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1140, 1017, 2, N'ToId', N'To terminal', N'To terminal', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 3, 0, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1141, 1017, 2, N'EmptyContFromId', N'Empty cont from', N'Empty cont from', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 4, 0, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1142, 1017, 2, N'EmptyContToId', N'Empty cont to', N'Empty cont to', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1143, 1017, 2, N'ContainerTypeId', N'Container type', N'Container type', 32, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 6, 0, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1144, 1017, 2, N'TruckTypeId', N'Truck type', N'Truck type', 18, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 7, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1145, 1017, 2, N'IsContainer', N'Is Cont', N'Is Cont', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 8, 1, 1, 0, N'Checkbox', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1146, 1017, 2, N'TotalContainer', N'Total container', N'Total container', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 9, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1147, 1017, 2, N'VendorId', N'Vendor', N'Vendor', 21, N'?$filter=VendorType/Name eq ''Freight service''', NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1148, 1017, 2, N'CommodityTypeId', N'Commodity type', N'Commodity type', 29, NULL, N'Commodity', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1149, 1017, 2, N'BoxWeight', N'Box weight', N'Weight', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 12, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1166, 1017, 2, N'BoxVolume', N'Box volume', N'Volume', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 13, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1167, 1017, 2, N'TransportDistance', N'Distance', N'Distance', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 14, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1168, 1017, 2, N'TimeboxId', N'Timebox', N'Timebox', 11, NULL, N'Spec', N'{TimeboxStart} - {TimeboxEnd}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1169, 1017, 2, N'QuotationId', N'Quotation', N'Quotation', 5, N'/Customer/{CustomerId}/?$filter=Active eq true', NULL, N'QT{Id:00000}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1170, 1017, 2, N'TotalPriceBeforeDiscount', N'Before discount', N'Before discount', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 16, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1171, 1017, 2, N'DiscountMoney', N'Discount money', N'Discount money', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 17, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1172, 1017, 2, N'DiscountPercentage', N'Discount percentage', N'Discount percentage', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 18, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1173, 1017, 2, N'TotalPriceAfterDiscount', N'After discount', N'After discount', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 19, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1175, 1017, 2, N'TotalDiscountAfterTax', N'After tax', N'After tax', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 0, NULL, NULL, 2, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1176, 1017, 2, N'CurrencyId', N'Currency', N'Currency', 56, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 21, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1177, NULL, 5, N'Id', N'Code', N'Code', NULL, NULL, NULL, N'QT{0:00000}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1178, NULL, 5, N'Price', N'Price', N'Price', NULL, NULL, N'Price', N'{0:n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1179, NULL, 5, N'PriceTypeId', N'Price by', N'Price by', 61, NULL, N'Price', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1180, 1017, 8, N'OrderDetailId', N'Order detail', N'Order detail', 2, N'?$filter=OrderId eq {Id}', NULL, N'OD{Id:00000}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1181, 1017, 8, N'SurchargeTypeId', N'Surcharge type', N'Surcharge type', 1059, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1182, 1017, 8, N'PriceTypeId', N'Price type', N'Price type', 61, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1183, 1017, 8, N'UnitPrice', N'Unit price', N'Unit price', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1184, 1017, 8, N'Quantity', N'Quantity', N'Quantity', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1185, 1017, 8, N'Vat', N'VAT', N'VAT', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1186, 1017, 8, N'PriceAfterTax', N'After tax', N'After tax', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1187, 1017, 8, N'CurrencyId', N'Currency', N'Currency', 56, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1188, 1017, 8, N'Note', N'Note', N'Note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 1, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1189, 1017, 8, N'InsertedDate', N'Created date', N'Created date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1190, 1017, 8, N'InsertedBy', N'Created by', N'Created by', 19, NULL, NULL, N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1191, NULL, 2, N'Id', N'Code', N'Code', NULL, NULL, NULL, N'OD{0:00000}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 1, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1192, NULL, 2, N'Note', N'Note', N'Note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 1, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1193, 1017, 2, N'Note', N'Note', N'Note', NULL, NULL, NULL, NULL, NULL, NULL, N'100px', NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 22, 0, 1, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1194, 1017, 2, N'InsertedDate', N'Created date', N'Created date', NULL, NULL, N'Audit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 22, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1195, 1017, 2, N'InsertedBy', N'Created by', N'Created by', 19, NULL, N'Audit', N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 22, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1196, 1017, 2, N'UpdatedDate', N'Updated date', N'Updated date', NULL, NULL, N'Audit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 22, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1197, 1017, 2, N'UpdatedBy', N'Updated by', N'Updated by', 19, NULL, N'Audit', N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 22, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1198, NULL, 1059, N'Name', N'Name', N'Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1199, NULL, 1059, N'UnitPrice', N'Unit price', N'Unit price', NULL, NULL, NULL, N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1200, NULL, 1059, N'PriceTypeId', N'Price type', N'Price type', 61, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1201, NULL, 1059, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1202, NULL, 1059, N'CurrencyId', N'Currency', N'Currency', 56, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1213, 1019, 2, N'FromId', N'From', N'From', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1214, 1019, 2, N'ToId', N'To', N'To', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 3, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1215, 1019, 2, N'EmptyContFromId', N'Empty cont from', N'Empty cont from', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 4, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1216, 1019, 2, N'EmptyContToId', N'Empty cont to', N'Empty cont to', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1217, 1019, 2, N'ContainerTypeId', N'Container type', N'Container type', 32, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 6, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1218, 1019, 2, N'TruckTypeId', N'Truck type', N'Truck type', 18, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 7, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1220, 1019, 2, N'TotalContainer', N'Container No.', N'Container No.', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 9, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1222, 1019, 2, N'CommodityTypeId', N'Commodity type', N'Commodity type', 29, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 1, 0, NULL, NULL, 11, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1223, 1019, 2, N'Weight', N'Weight', N'Weight', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 12, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1224, 1019, 2, N'Volume', N'Volume', N'Volume', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 13, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1225, 1019, 2, N'Distance', N'Distance', N'Distance', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 14, 1, 0, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1226, 1019, 2, N'TimeboxId', N'Timebox', N'Timebox', 11, NULL, N'Spec', N'{TimeboxStart} - {TimeboxEnd}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1240, 1019, 2, N'Note', N'Note', N'Note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1245, 1019, 34, N'FromId', N'From', N'From', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 2, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1246, 1019, 34, N'ToId', N'To', N'To', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 3, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1247, 1019, 34, N'EmptyContFromId', N'Empty cont from', N'Empty cont from', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 4, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1248, 1019, 34, N'EmptyContToId', N'Empty cont to', N'Empty cont to', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1249, 1019, 34, N'TruckTypeId', N'Truck type', N'Truck type', 18, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1250, 1019, 34, N'TotalContainer', N'Total Cont.', N'Total Cont.', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1251, 1019, 34, N'Weight', N'Weight', N'Weight', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1252, 1019, 34, N'Volume', N'Volume', N'Volume', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 5, 0, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1253, 1019, 34, N'Distance', N'Distance', N'Distance', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1254, 1019, 34, N'TimeboxId', N'Timebox', N'Timebox', 11, NULL, N'Spec', N'{TimeboxStart} - {TimeboxEnd}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1256, 1019, 34, N'ContainerTypeId', N'Container type', N'Container type', 32, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1257, 1019, 34, N'Note', N'Note', N'Note', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1258, 1019, 34, N'CommodityTypeId', N'Commodity type', N'Commodity type', 29, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 15, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1259, 1019, 34, N'IsComposited', N'Composited', N'Composited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 2, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1260, 1020, 1061, N'TruckId', N'Truck plate', N'Truck plate', 14, N'?$filter=Active eq true and FreightStateId eq 4', NULL, N'{TruckPlate}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1261, 1020, 1061, N'DriverId', N'Driver', N'Driver', 19, N'?$filter=Role/RoleName eq ''Driver''', NULL, N'{FirstName} {LastName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1262, 1020, 1061, N'ContainerId', N'Container code', N'Container code', 31, NULL, NULL, N'C{Id:00000}', NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 1, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1263, 1020, 1061, N'FreightStateId', N'State', N'State', 45, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, N'center', 0, 0, NULL, NULL, 1, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1264, NULL, 31, N'Id', N'Code', N'Code', NULL, NULL, NULL, N'C{0:00000}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1265, NULL, 31, N'VendorId', N'Vendor', N'Vendor', 21, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1266, NULL, 31, N'Description', N'Description', N'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1267, 1017, 2, N'GoodsName', N'Name', N'Name', NULL, NULL, N'Commodity', NULL, NULL, NULL, N'80px', NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Input', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1268, 1017, 2, N'ExpectedTransportDate', N'Expected TD', N'Expected transport date', NULL, NULL, N'Transportation', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Datepicker', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1269, 1017, 2, N'BoxLength', N'Box length', N'Box length', NULL, NULL, N'Spec', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1270, 1017, 2, N'BoxHeight', N'Box height', N'Box height', NULL, NULL, N'Spec', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 1, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1271, 1017, 2, N'TotalBox', N'Total box', N'Total box', NULL, NULL, N'Spec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 9, 1, 1, 0, N'Number', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1272, 1017, 2, N'TotalWeight', N'Total weight', N'Total weight', NULL, NULL, N'Spec', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 9, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1273, 1017, 2, N'TotalVolume', N'Total volume', N'Total volume', NULL, NULL, N'Spec', N'{0:n}', NULL, NULL, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, 9, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1274, 1017, 2, N'StackDirectionId', N'Stack direction', N'Stack direction', 1063, NULL, N'Spec', N'{Name}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 0, 0, NULL, NULL, 9, 1, 1, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1275, NULL, 1063, N'Name', N'Direction', N'Direction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'left', 0, 0, NULL, NULL, 9, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1276, 1016, 54, N'Id', N'Code', N'Code', NULL, NULL, N'Progress', N'SO{0:00000}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1277, 1016, 54, N'FreightStateId', N'State', N'State', 45, NULL, N'Progress', N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 2, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1278, 1016, 54, N'FromId', N'From terminal', N'From terminal', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1279, 1016, 54, N'ToId', N'To terminal', N'To terminal', 9, NULL, N'Transportation', N'{ShortName}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1280, 1017, 2, N'Id', N'Code', N'Code', NULL, NULL, NULL, N'OD{0:00000}', NULL, NULL, NULL, NULL, 2, NULL, N'left', 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1282, 1016, 54, N'Deadline', N'Deadline', N'Deadline', NULL, NULL, N'Progress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 3, 1, 0, 0, NULL, 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1283, 1019, 34, N'FreightStateId', N'State', N'State', 45, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[GridPolicy] ([Id], [FeatureId], [EntityId], [FieldName], [ShortDesc], [Description], [ReferenceId], [DataSource], [GroupName], [FormatCell], [FormatRow], [Width], [MinWidth], [MaxWidth], [Precision], [Validation], [TextAlign], [Frozen], [Hidden], [EditEvent], [DeleteEvent], [Order], [HasFilter], [Editable], [Disabled], [Component], [PolicyId], [StateId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1284, 1019, 34, N'TaskStateId', N'Task', N'Task', 1064, NULL, NULL, N'{Name}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 1, 0, 0, N'Dropdown', 10, NULL, 1, CAST(N'2019-11-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GridPolicy] OFF
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

INSERT [dbo].[Nationality] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Vietnamese', N'Vietnamese', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Nationality] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Korean', N'Korean', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Nationality] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Japanese', N'Japanese', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 4, N'Nguyễn', N'Nhân', N'01292xxx99', N'9829xx9220', NULL, N'33 Tân Trào', 2, 1, 2, 4, CAST(N'2018-11-30T00:00:00.0000000' AS DateTime2), NULL, 2, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2021-11-17T00:00:00.0000000' AS DateTime2), N'test', 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T10:35:20.5954973' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 7, N'Đào', N'Bá Lộc', N'08127xx789', N'08127xx789', NULL, N'15 Phạm Ngũ Lão', 2, 1, 2, 4, CAST(N'2019-11-28T00:00:00.0000000' AS DateTime2), NULL, 2, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.2127824' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 3, N'Nguyễn', N'Thành Nhân', N'01292xxx99', N'08127xx789', NULL, N'22 Đông Dương', 2, 1, 2, 4, CAST(N'2020-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(1.19 AS Decimal(4, 2)), CAST(12.00 AS Decimal(4, 2)), CAST(8400000.00000 AS Decimal(20, 5)), CAST(8300000.00000 AS Decimal(20, 5)), CAST(9296000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-12-01T13:33:18.9729205' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 5, N'Đào', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', 1, 2, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-28T18:02:38.5645065' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 10, N'Trần', N'Hữu Phước', N'01292xxx99', N'08127xx789', NULL, N'399/22 Phan Huy Ích', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 7, N'Đào', N'Bá Lộc', N'08127xx789', N'7129xx99', NULL, N'22 Đông Dương', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 8, N'Trần', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 9, N'Đào', N'Hữu Phước', N'01292xxx99', N'08127xx789', NULL, N'33 Tân Trào', 1, 2, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-24T16:21:22.9537077' AS DateTime2), NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 8, N'Trần', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'15 Phạm Ngũ Lão', 1, 1, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-27T22:39:44.5237834' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 7, N'Nguyễn', N'Hữu Phước', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', 1, 2, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-25T19:57:20.8717587' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, N'Đào', N'Hữu Phước', N'08127xx789', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 10, N'Trần', N'Hữu Phước', N'01292xxx99', N'7129xx99', NULL, N'22 Đông Dương', 1, 2, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-28T09:57:32.8062201' AS DateTime2), 1)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 5, N'Nguyễn', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 7, N'Đào', N'Hữu Phước', N'08127xx789', N'7129xx99', NULL, N'15 Phạm Ngũ Lão', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 1, N'Trần', N'Bá Lộc', N'01292xxx99', N'08127xx789', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-23T10:30:09.7178183' AS DateTime2), NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, 5, N'Đào', N'Thành Nhân', N'01292xxx99', N'7129xx99', NULL, N'22 Đông Dương', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, 7, N'Đào', N'Bá Lộc', N'08127xx789', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, 8, N'Trần', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'15 Phạm Ngũ Lão', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 5, N'Đào', N'Thành Nhân', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 5, N'Đào', N'Hữu Phước', N'08127xx789', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 8, N'Trần', N'Bá Lộc', N'01292xxx99', N'08127xx789', NULL, N'15 Phạm Ngũ Lão', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 5, N'Đào', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 7, N'Nguyễn', N'Thành Nhân', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 8, N'Trần', N'Hữu Phước', N'08127xx789', N'7129xx99', NULL, N'22 Đông Dương', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (30, 7, N'Đào', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (31, 10, N'Nguyễn', N'Bá Lộc', N'01292xxx99', N'08127xx789', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (32, 5, N'Đào', N'Hữu Phước', N'08127xx789', N'7129xx99', NULL, N'15 Phạm Ngũ Lão', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, 10, N'Đào', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'33 Tân Trào', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 5, N'Đào', N'Bá Lộc', N'01292xxx99', N'7129xx99', NULL, N'22 Đông Dương', NULL, NULL, 2, 4, NULL, NULL, NULL, CAST(12222.00000 AS Decimal(20, 5)), 0, CAST(100000.00000 AS Decimal(20, 5)), CAST(12.05 AS Decimal(4, 2)), CAST(10.00 AS Decimal(4, 2)), CAST(222222.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), CAST(12312323.00000 AS Decimal(20, 5)), 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), CAST(N'2020-11-17T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, NULL, N'asd', N'asd', NULL, NULL, NULL, N'asd', NULL, NULL, NULL, 4, NULL, NULL, NULL, CAST(123.23000 AS Decimal(20, 5)), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-11-21T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, 3, N'asd', N'asd', N'asd', NULL, NULL, N'asd', NULL, NULL, NULL, 4, NULL, NULL, NULL, CAST(123.23000 AS Decimal(20, 5)), 0, CAST(123.23000 AS Decimal(20, 5)), CAST(12.00 AS Decimal(4, 2)), CAST(12.00 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, CAST(N'2019-11-21T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-28T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-22T17:46:04.1751681' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, 1, N'Nguyễn', N'Hồng Lĩnh', N'09272zxz99', NULL, NULL, NULL, 1, 1, NULL, 4, NULL, NULL, NULL, CAST(2124.23000 AS Decimal(20, 5)), 1, CAST(234.33000 AS Decimal(20, 5)), CAST(3.33 AS Decimal(4, 2)), CAST(23.32 AS Decimal(4, 2)), NULL, NULL, NULL, NULL, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-22T21:54:04.6430000' AS DateTime2), 1, CAST(N'2019-11-22T21:54:42.6647981' AS DateTime2), NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, 3, N'Test', N'last pheonix', N'01338xx849', NULL, NULL, N'43 Hoàn Cầu', NULL, NULL, NULL, 4, NULL, NULL, NULL, CAST(12311111.22000 AS Decimal(20, 5)), 0, CAST(123222.22000 AS Decimal(20, 5)), NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, CAST(N'2019-11-22T22:10:39.8940000' AS DateTime2), 1, CAST(N'2019-11-23T09:06:34.6746402' AS DateTime2), NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, 7, N'test', N'test', N'test', NULL, NULL, N'test', 1, 2, NULL, 4, NULL, NULL, NULL, CAST(1231231.23000 AS Decimal(20, 5)), 0, CAST(1231.23000 AS Decimal(20, 5)), CAST(12.22 AS Decimal(4, 2)), CAST(10.10 AS Decimal(4, 2)), NULL, NULL, NULL, 2, CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-24T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-23T14:43:41.6448835' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Order] ([Id], [CustomerId], [ContactFirstName], [ContactLastName], [ContactNumber], [ContactSSN], [ContactPassport], [ContactAddress], [FromId], [ToId], [TotalContainer], [FreightStateId], [Deadline], [AccountableUserId], [AccountableDepartmentId], [AdvancedPaid], [Paid], [DiscountMoney], [DiscountPercentage], [Vat], [TotalPriceBeforeDiscount], [TotalPriceAfterDiscount], [TotalPriceAfterTax], [CurrencyId], [AdvancedPaidDate], [PaidDate], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, 1, N'test coordination', N'test coordination', N'test coordination', NULL, NULL, N'test coordination', 1, 2, NULL, 4, NULL, NULL, NULL, CAST(12312323.23000 AS Decimal(20, 5)), 0, CAST(1232.32000 AS Decimal(20, 5)), CAST(12.22 AS Decimal(4, 2)), CAST(12.22 AS Decimal(4, 2)), NULL, NULL, NULL, 2, CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-30T00:00:00.0000000' AS DateTime2), NULL, 1, CAST(N'2019-11-25T20:26:00.6806287' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderComposition] ON 

INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 28, 8, 1, CAST(N'2019-11-26T10:30:01.1941022' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, 49, 40, 1, CAST(N'2019-11-26T14:09:58.2313042' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, 51, 41, 1, CAST(N'2019-11-26T14:10:13.2886884' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, 54, 49, 1, CAST(N'2019-11-27T18:14:19.8056651' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, 55, 50, 1, CAST(N'2019-11-27T18:14:19.8069331' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, 56, 51, 1, CAST(N'2019-11-27T18:14:19.8069566' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, 57, 53, 1, CAST(N'2019-11-27T22:39:44.8657986' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, 58, 54, 1, CAST(N'2019-11-28T08:50:01.3204305' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, 59, 55, 1, CAST(N'2019-11-29T09:10:27.9491963' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, 60, 56, 1, CAST(N'2019-12-01T13:27:49.8489897' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, 61, 57, 1, CAST(N'2019-12-01T13:33:19.2930516' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, 62, 2, 1, CAST(N'2019-12-02T14:25:42.5533018' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderComposition] ([Id], [CoordinationId], [OrderDetailId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, 62, 36, 1, CAST(N'2019-12-02T14:25:42.5544501' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderComposition] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, NULL, CAST(N'2019-12-16T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, 1, 2, 0, 1, 5, CAST(222.22 AS Decimal(18, 2)), NULL, CAST(333.33 AS Decimal(18, 2)), CAST(66544.00 AS Decimal(18, 2)), CAST(12366.00 AS Decimal(18, 2)), CAST(136026.00 AS Decimal(18, 2)), CAST(731984.00 AS Decimal(18, 2)), 11, 23, 1, NULL, NULL, CAST(7565.00 AS Decimal(18, 2)), 1, 1, CAST(16100000.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(16099999.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(160999990.00 AS Decimal(18, 2)), 1, N'test note', 1, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T10:35:20.5954852' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, NULL, CAST(N'2020-01-16T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, 2, 1, 0, 1, 5, CAST(222.22 AS Decimal(18, 2)), NULL, CAST(333.33 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(26555.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 2, 2, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, CAST(10.00 AS Decimal(18, 2)), NULL, 1, N'test note', 1, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T10:35:20.5955044' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, NULL, NULL, 3, 1, 2, 2, 1, 2, 1, 1, 6, CAST(222.22 AS Decimal(18, 2)), NULL, CAST(333.33 AS Decimal(18, 2)), CAST(66544.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, 12, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 2, 1, CAST(8400000.00 AS Decimal(18, 2)), CAST(12355.00 AS Decimal(18, 2)), CAST(76.00 AS Decimal(18, 2)), CAST(8387645.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(83876450.00 AS Decimal(18, 2)), 1, N'live note', 1, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T10:35:20.5955104' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, NULL, NULL, 2, 1, 1, 1, 2, 1, 1, 1, 1, CAST(222.22 AS Decimal(18, 2)), NULL, CAST(333.33 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(26555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 1, NULL, NULL, NULL, CAST(7565.00 AS Decimal(18, 2)), 3, 1, CAST(700000.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(699999.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(6999990.00 AS Decimal(18, 2)), 1, N'live note', 1, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T10:35:20.5955161' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 1, NULL, NULL, 3, 3, 1, 1, 1, 1, 0, 1, 2, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(26555.00 AS Decimal(18, 2)), NULL, NULL, NULL, 2, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 1, 2, NULL, CAST(54444.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), NULL, CAST(10.00 AS Decimal(18, 2)), NULL, 1, N'dead note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T09:10:53.8113884' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 1, NULL, NULL, 1, 2, 2, 2, 2, 2, 1, 1, 1, NULL, NULL, NULL, CAST(66544.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 3, 1, CAST(700000.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(699999.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(6999990.00 AS Decimal(18, 2)), 1, N'live note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-29T09:10:53.8114031' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 2, NULL, NULL, 2, 1, 1, 1, 1, 1, 1, 2, 4, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, 5, NULL, NULL, NULL, CAST(7565.00 AS Decimal(18, 2)), 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(12355.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(76.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(54444.00 AS Decimal(18, 2)), 1, N'live note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-26T12:59:05.5084644' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 2, NULL, NULL, 1, 3, 1, 1, 1, 1, 1, 1, 5, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(26555.00 AS Decimal(18, 2)), NULL, NULL, NULL, 57, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 1, 3, CAST(12355.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'dead note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-26T11:53:42.6633597' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, NULL, NULL, 2, 2, 2, 1, 1, 1, 0, 3, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 2, 4, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(12355.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, NULL, 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-26T12:59:05.5091959' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, NULL, NULL, 1, 1, 1, 1, 2, 2, 1, 1, 2, NULL, NULL, NULL, CAST(7565.00 AS Decimal(18, 2)), CAST(66544.00 AS Decimal(18, 2)), NULL, NULL, NULL, 8, NULL, NULL, NULL, CAST(7565.00 AS Decimal(18, 2)), 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(54444.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), CAST(12355.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(234234.00 AS Decimal(18, 2)), 1, N'live note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-26T12:59:05.5092049' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 2, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(1.00 AS Decimal(18, 2)), 1, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'dead note', 0, CAST(N'2019-11-18T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-26T11:49:56.1505143' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 59, NULL, NULL, 1, 1, 1, 1, 1, 3, 1, 1, 1, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)), NULL, NULL, NULL, 123, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), 3, 1, NULL, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), NULL, NULL, N'test note', 1, CAST(N'2019-11-22T21:54:04.6480000' AS DateTime2), 1, CAST(N'2019-11-22T21:54:42.6622980' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 59, NULL, NULL, 2, 3, 1, 1, 1, 2, 1, 1, 2, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)), NULL, NULL, NULL, 12, NULL, NULL, NULL, CAST(0.12 AS Decimal(18, 2)), 2, 3, NULL, NULL, NULL, NULL, CAST(1.22 AS Decimal(18, 2)), NULL, NULL, N'tét note', 1, CAST(N'2019-11-22T21:54:04.6520000' AS DateTime2), 1, CAST(N'2019-11-22T21:54:42.6647734' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-22T22:10:39.9017144' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, 60, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)), NULL, NULL, NULL, 123, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), NULL, NULL, N'test note', 0, CAST(N'2019-11-22T22:10:39.9075790' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', 0, CAST(N'2019-11-22T22:10:39.9076314' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 60, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 2, 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-22T22:12:26.3230000' AS DateTime2), 1, CAST(N'2019-11-22T22:12:59.4905154' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 60, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-22T22:12:26.3230000' AS DateTime2), 1, CAST(N'2019-11-22T22:12:59.4915506' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 2, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T00:45:07.0870000' AS DateTime2), 1, CAST(N'2019-11-23T09:06:34.6746192' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 4, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T00:45:07.0930000' AS DateTime2), 1, CAST(N'2019-11-23T09:06:34.6746325' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T00:45:07.0930000' AS DateTime2), 1, CAST(N'2019-11-23T09:06:34.6746354' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 4, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T00:45:21.6660000' AS DateTime2), 1, CAST(N'2019-11-23T09:06:34.6746379' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, 60, NULL, NULL, 2, 1, 1, 3, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T00:45:49.3700000' AS DateTime2), 1, CAST(N'2019-11-23T00:49:07.5575488' AS DateTime2), NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, 60, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, 0, 2, 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T06:55:28.2732578' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (34, 63, NULL, NULL, 1, 2, 2, 2, 1, 2, 1, 1, 1, NULL, NULL, NULL, CAST(12.32 AS Decimal(18, 2)), CAST(123.11 AS Decimal(18, 2)), NULL, NULL, NULL, 123, NULL, NULL, NULL, CAST(1.23 AS Decimal(18, 2)), 2, 1, NULL, NULL, NULL, NULL, CAST(12.30 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-23T14:43:41.6557629' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, 63, NULL, NULL, 1, 1, 1, 2, 1, 1, 0, 2, 1, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-23T14:43:41.6658616' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, 3, N'Cement', CAST(N'2019-12-30T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, 2, 1, 0, 2, 5, CAST(0.30 AS Decimal(18, 2)), NULL, CAST(0.50 AS Decimal(18, 2)), CAST(12.22 AS Decimal(18, 2)), CAST(123.22 AS Decimal(18, 2)), CAST(61610.00 AS Decimal(18, 2)), CAST(6110.00 AS Decimal(18, 2)), 500, 12, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 2, 1, CAST(8400000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(8400000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(9408000.00 AS Decimal(18, 2)), 1, N'Hợp công', 1, CAST(N'2019-11-24T16:09:56.8580000' AS DateTime2), 1, CAST(N'2019-12-01T13:33:18.9620111' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, 9, NULL, NULL, 1, 2, 1, 3, NULL, NULL, 0, 1, 5, NULL, NULL, NULL, CAST(123.22 AS Decimal(18, 2)), CAST(123.22 AS Decimal(18, 2)), NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'test Hợp công', 1, CAST(N'2019-11-24T16:13:16.9830000' AS DateTime2), 1, CAST(N'2019-11-28T18:02:38.5606198' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, 9, NULL, NULL, 1, 2, 1, 2, NULL, NULL, 0, 2, 5, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(333.33 AS Decimal(18, 2)), NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 1, 2, NULL, NULL, NULL, NULL, CAST(10.00 AS Decimal(18, 2)), NULL, 1, N'Test hợp công', 1, CAST(N'2019-11-24T16:14:24.2110000' AS DateTime2), 1, CAST(N'2019-11-28T18:02:38.5650253' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, 9, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, NULL, NULL, 0, 3, 5, NULL, NULL, NULL, CAST(123.22 AS Decimal(18, 2)), CAST(444.44 AS Decimal(18, 2)), NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, CAST(10.00 AS Decimal(18, 2)), NULL, 1, N'Hợp công', 1, CAST(N'2019-11-24T16:15:42.3210000' AS DateTime2), 1, CAST(N'2019-11-28T18:02:38.5650420' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, 13, NULL, NULL, 1, 2, 1, 2, NULL, NULL, 0, 1, 5, NULL, NULL, NULL, CAST(12.32 AS Decimal(18, 2)), CAST(123.22 AS Decimal(18, 2)), NULL, NULL, NULL, 0, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Hợp công', 1, CAST(N'2019-11-24T16:21:22.9536911' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, 15, NULL, NULL, 1, 2, 2, 2, 1, 2, 0, 2, 5, NULL, NULL, NULL, CAST(23.22 AS Decimal(18, 2)), CAST(123.33 AS Decimal(18, 2)), NULL, NULL, NULL, 12, NULL, NULL, NULL, CAST(122.22 AS Decimal(18, 2)), 3, 2, NULL, NULL, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-25T19:57:20.8605772' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, 64, NULL, NULL, 1, 2, 1, 2, 1, 3, 1, 1, 5, NULL, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), CAST(122.22 AS Decimal(18, 2)), NULL, NULL, NULL, 12, NULL, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-25T20:26:00.6851258' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, 2, NULL, NULL, 1, 2, NULL, NULL, NULL, 4, 1, 3, 5, NULL, NULL, NULL, CAST(23.22 AS Decimal(18, 2)), CAST(123.22 AS Decimal(18, 2)), NULL, NULL, NULL, 12, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 2, 1, NULL, NULL, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), NULL, NULL, N'Test update Coordination', 0, CAST(N'2019-11-26T10:47:21.2850000' AS DateTime2), 1, CAST(N'2019-11-26T11:51:04.7366260' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 5, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-26T12:51:08.1475477' AS DateTime2), 1, CAST(N'2019-11-26T12:59:05.5097685' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, 2, NULL, NULL, 1, 2, NULL, NULL, 2, NULL, 1, 1, 5, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(12.12 AS Decimal(18, 2)), CAST(121.22 AS Decimal(18, 2)), NULL, NULL, 0, 12, 1, NULL, NULL, CAST(123.23 AS Decimal(18, 2)), 1, 1, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-26T12:54:07.6790000' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.2098384' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, 2, NULL, NULL, 2, 3, NULL, NULL, NULL, NULL, 1, 1, 5, CAST(0.00 AS Decimal(18, 2)), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(12.12 AS Decimal(18, 2)), CAST(222.22 AS Decimal(18, 2)), NULL, NULL, 0, 1, NULL, NULL, NULL, CAST(123.23 AS Decimal(18, 2)), 2, 4, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-26T12:56:13.1550000' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.2122450' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, 2, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, CAST(13.13 AS Decimal(18, 2)), CAST(333.33 AS Decimal(18, 2)), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(1231.23 AS Decimal(18, 2)), 3, 2, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-26T12:56:50.7550000' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.2122606' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-27T18:14:19.4240000' AS DateTime2), 1, CAST(N'2019-12-01T10:28:18.2122667' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, 14, N'Cốt thép', CAST(N'2019-11-24T00:00:00.0000000' AS DateTime2), 1, 1, 2, 2, 1, 2, 1, 2, 5, CAST(12.22 AS Decimal(18, 2)), NULL, CAST(12.22 AS Decimal(18, 2)), CAST(122.22 AS Decimal(18, 2)), CAST(122.22 AS Decimal(18, 2)), NULL, NULL, 120, 12, 2, NULL, NULL, CAST(212.23 AS Decimal(18, 2)), 1, 1, NULL, NULL, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), NULL, NULL, NULL, 1, CAST(N'2019-11-27T22:39:44.5144522' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, 17, N'Thép', CAST(N'2019-11-28T00:00:00.0000000' AS DateTime2), 1, 2, 1, 2, 2, 3, 1, 2, 5, CAST(12.32 AS Decimal(18, 2)), NULL, CAST(12.22 AS Decimal(18, 2)), CAST(12.22 AS Decimal(18, 2)), CAST(12.22 AS Decimal(18, 2)), CAST(146.64 AS Decimal(18, 2)), CAST(146.64 AS Decimal(18, 2)), 12, 12, 2, NULL, NULL, CAST(12.22 AS Decimal(18, 2)), 2, 1, CAST(700000.00 AS Decimal(18, 2)), NULL, NULL, CAST(700000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(7000000.00 AS Decimal(18, 2)), 1, NULL, 1, CAST(N'2019-11-28T08:50:00.9660000' AS DateTime2), 1, CAST(N'2019-11-28T09:57:33.4442456' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, 1, N'Thép', CAST(N'2019-11-20T00:00:00.0000000' AS DateTime2), 1, 2, 1, 2, 1, 3, 1, 2, 5, CAST(222.22 AS Decimal(18, 2)), NULL, CAST(444.44 AS Decimal(18, 2)), CAST(1222.22 AS Decimal(18, 2)), CAST(160000.00 AS Decimal(18, 2)), CAST(4000000.00 AS Decimal(18, 2)), CAST(30555.50 AS Decimal(18, 2)), 25, 15, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(10500000.00 AS Decimal(18, 2)), CAST(777777.77 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9722222.23 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(97222222.30 AS Decimal(18, 2)), 1, N'adding', 1, CAST(N'2019-11-29T09:10:27.7857607' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, 3, N'Thép', CAST(N'2019-12-30T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, 2, 3, 1, 2, 5, CAST(33.33 AS Decimal(18, 2)), NULL, CAST(222.22 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(333.33 AS Decimal(18, 2)), CAST(33333.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 100, 10, 1, NULL, NULL, CAST(200.11 AS Decimal(18, 2)), 2, 4, CAST(555555.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, CAST(555555.50 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(622222.16 AS Decimal(18, 2)), 1, N'Test price', 1, CAST(N'2019-12-01T13:27:49.5210000' AS DateTime2), 1, CAST(N'2019-12-01T13:33:18.9648625' AS DateTime2), 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [GoodsName], [ExpectedTransportDate], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [ContainerTypeId], [TruckTypeId], [IsContainer], [CommodityTypeId], [VendorId], [BoxLength], [BoxWidth], [BoxHeight], [BoxVolume], [BoxWeight], [TotalWeight], [TotalVolume], [TotalBox], [TotalContainer], [StackDirectionId], [MinStack], [MaxStack], [TransportDistance], [TimeboxId], [QuotationId], [TotalPriceBeforeDiscount], [DiscountMoney], [DiscountPercentage], [TotalPriceAfterDiscount], [Vat], [TotalDiscountAfterTax], [CurrencyId], [Note], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, 3, N'Gạc', CAST(N'2019-12-30T00:00:00.0000000' AS DateTime2), 2, 1, 2, 1, 2, 3, 1, 2, 5, CAST(33.33 AS Decimal(18, 2)), NULL, CAST(33.33 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, 0, 12, NULL, NULL, NULL, NULL, NULL, 1, CAST(8400000.00 AS Decimal(18, 2)), NULL, NULL, CAST(8400000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(9408000.00 AS Decimal(18, 2)), 1, N'Test price 2', 1, CAST(N'2019-12-01T13:33:18.9650470' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'System', NULL, N'[5]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Admin', NULL, N'[4]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Office', NULL, N'[1]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'None-office', NULL, N'[2]', NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Policy] ([Id], [Name], [IncludeAll], [IncludedGroupRole], [IncludedUser], [ExcludedGroupRole], [ExcludedUserIds], [ExcludeAll], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Public', 1, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Policy] OFF
INSERT [dbo].[PriceType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Per distance', N'Per distance', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[PriceType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Per weight', N'Per weight', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[PriceType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Per container', N'Per container', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[PriceType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Per volume', N'Per volume', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Quotation] ON 

INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 5, 1, 1, 2, 3, 1, 3, 3, 1, 2, 0, 1, 4, 1, 2, 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(700000.00000 AS Decimal(20, 5)), 1, 3, CAST(11.00 AS Decimal(18, 2)), 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-28T09:17:25.0602426' AS DateTime2), 1)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 7, 2, 0, 1, 2, 1, 2, 4, 1, 2, 1, 2, 5, 1, 2, 2, 2, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(500000.00000 AS Decimal(20, 5)), 2, 2, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-28T10:15:11.9142784' AS DateTime2), 1)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 3, 3, 0, 1, 1, NULL, NULL, 2, 1, 4, 0, 3, 5, 1, 2, 1, 3, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(500000.00000 AS Decimal(20, 5)), 2, 4, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-15T21:23:34.8692274' AS DateTime2), NULL)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 8, 1, 0, 1, 1, 1, 3, 4, 1, 3, 1, 2, 5, 1, 2, 2, 2, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(55555.55000 AS Decimal(20, 5)), 2, 3, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-28T10:35:38.1950410' AS DateTime2), 1)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 9, 2, 0, 1, 1, NULL, NULL, 2, 1, 5, 1, 1, 5, 1, 2, 3, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(500000.00000 AS Decimal(20, 5)), 2, 4, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 5, 2, 0, 1, 1, NULL, NULL, 4, 1, 2, 1, 1, 5, 1, 2, 2, 2, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(500000.00000 AS Decimal(20, 5)), 2, 3, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Quotation] ([Id], [CustomerId], [CustomerGroupId], [ForGroupOnly], [FromId], [ToId], [EmptyContFromId], [EmptyContToId], [DistanceRangeId], [ContainerTypeId], [TruckTypeId], [IsContainer], [ContainerRangeId], [VendorId], [CommodityTypeId], [WeightRangeId], [VolumeRangeId], [TimeboxId], [EffectiveDate], [ExpiredDate], [Price], [CurrencyId], [PriceTypeId], [VAT], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, NULL, 1, 0, 1, 1, NULL, NULL, 2, 1, 1, 1, 2, 5, 1, 2, 1, 2, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-12-14T00:00:00.0000000' AS DateTime2), CAST(500000.00000 AS Decimal(20, 5)), 2, 2, NULL, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-15T12:59:37.2284609' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Quotation] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Admin', N'admin', 1, CAST(N'2019-10-07T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Driver', N'driver', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Coordinator', N'Coordinator', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Sale', N'Sale', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Accountant', N'Accountant', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Director', N'Director', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Customer', N'Customer', 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[StackDirection] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Vertical lying', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[StackDirection] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Horizontal lying', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[StackDirection] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Vertical standing', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[StackDirection] ([Id], [Name], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Horizontal standing', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[StateType] ON 

INSERT [dbo].[StateType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Freight state', N'Freight state', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[StateType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Task state', N'Task state', 1, CAST(N'2019-11-27T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[StateType] OFF
SET IDENTITY_INSERT [dbo].[Surcharge] ON 

INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 1, 1, 4, CAST(23452.00000 AS Decimal(20, 5)), CAST(232.00000 AS Decimal(20, 5)), CAST(12.00 AS Decimal(4, 2)), CAST(1256.00000 AS Decimal(20, 5)), N'Phí bảo hiểm', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 2, 2, 2, CAST(5589.00000 AS Decimal(20, 5)), CAST(1222.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(5588.00000 AS Decimal(20, 5)), N'Phí cầu đường', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 1, 3, 3, CAST(23452.00000 AS Decimal(20, 5)), CAST(123.00000 AS Decimal(20, 5)), CAST(7.00 AS Decimal(4, 2)), CAST(1.00000 AS Decimal(20, 5)), N'Nâng hạ', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 1, 1, 1, 2, CAST(23452.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(5588.00000 AS Decimal(20, 5)), N'Phí bảo hiểm', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 1, 3, 2, 2, CAST(5589.00000 AS Decimal(20, 5)), CAST(1222.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(1.00000 AS Decimal(20, 5)), N'Nâng hạ', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 1, 1, 3, 3, CAST(2783.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), CAST(8.00 AS Decimal(4, 2)), CAST(1.00000 AS Decimal(20, 5)), N'Phí bảo hiểm', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 1, 5, 2, 2, CAST(23452.00000 AS Decimal(20, 5)), CAST(232.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(5588.00000 AS Decimal(20, 5)), N'1', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 1, 2, 2, 4, CAST(5589.00000 AS Decimal(20, 5)), CAST(1222.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(1.00000 AS Decimal(20, 5)), N'Phí bảo hiểm', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, NULL, 1, 3, CAST(2783.00000 AS Decimal(20, 5)), CAST(1.00000 AS Decimal(20, 5)), CAST(8.00 AS Decimal(4, 2)), CAST(434.00000 AS Decimal(20, 5)), N'1', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 2, NULL, 3, 2, CAST(2783.00000 AS Decimal(20, 5)), CAST(232.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(5588.00000 AS Decimal(20, 5)), N'Nâng hạ', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 2, NULL, 2, 4, CAST(23452.00000 AS Decimal(20, 5)), CAST(1222.00000 AS Decimal(20, 5)), CAST(1.00 AS Decimal(4, 2)), CAST(434.00000 AS Decimal(20, 5)), N'Phí bảo hiểm', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-23T00:45:07.0966988' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-23T00:45:21.6667998' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-23T00:45:49.3701527' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Surcharge] ([Id], [OrderId], [OrderDetailId], [SurchargeTypeId], [PriceTypeId], [UnitPrice], [Quantity], [Vat], [PriceAfterTax], [Note], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 60, 26, 3, NULL, NULL, CAST(1231.22000 AS Decimal(20, 5)), CAST(12.22 AS Decimal(4, 2)), NULL, N'Test note', NULL, 1, CAST(N'2019-11-23T09:06:29.0303529' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Surcharge] OFF
SET IDENTITY_INSERT [dbo].[SurchargeType] ON 

INSERT [dbo].[SurchargeType] ([Id], [Name], [UnitPrice], [PriceTypeId], [Description], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Phí nâng hạ', CAST(123.00000 AS Decimal(20, 5)), 2, N'Nâng hạ cont', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[SurchargeType] ([Id], [Name], [UnitPrice], [PriceTypeId], [Description], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Phí bốc xếp', CAST(456.00000 AS Decimal(20, 5)), 3, N'Phí bốc xếp', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[SurchargeType] ([Id], [Name], [UnitPrice], [PriceTypeId], [Description], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Phí cầu đường', CAST(678.00000 AS Decimal(20, 5)), 4, N'Phí cầu đường', 1, 1, CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SurchargeType] OFF
INSERT [dbo].[TaskState] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Unread', N'Unread', 1, CAST(N'2019-12-02T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TaskState] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Read', N'Read', 1, CAST(N'2019-12-02T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TaskState] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Processing', N'Processing', 1, CAST(N'2019-12-02T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TaskState] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Done', N'Done', 1, CAST(N'2019-12-02T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Terminal] ON 

INSERT [dbo].[Terminal] ([Id], [FullName], [ShortName], [Address], [NationalityId], [Long], [Lat], [ContactNumber], [ContactFirstName], [ContactLastName], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Cát Lái', N'Cát Lái', N'278 Sông Đà', 1, 10.22, 23.122, N'09122399', N'Nhan', N'Nguyen', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Terminal] ([Id], [FullName], [ShortName], [Address], [NationalityId], [Long], [Lat], [ContactNumber], [ContactFirstName], [ContactLastName], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Tân Cảng', N'Tân Cảng', N'44 Sông Thương', 1, 10.22, 23.122, N'09122399', N'Vuong', N'Nguyen', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Terminal] ([Id], [FullName], [ShortName], [Address], [NationalityId], [Long], [Lat], [ContactNumber], [ContactFirstName], [ContactLastName], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Nhà Bè', N'Nhà Bè', N'72 Bàu Cát', 1, 10.22, 23.122, N'09122399', N'Phu', N'Nguyen', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Terminal] OFF
SET IDENTITY_INSERT [dbo].[Timebox] ON 

INSERT [dbo].[Timebox] ([Id], [TimeboxStart], [TimeboxEnd], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'06:30:00.0', N'09:30:00.0', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Timebox] ([Id], [TimeboxStart], [TimeboxEnd], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'10:30:00.0', N'12:00:00.0', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Timebox] ([Id], [TimeboxStart], [TimeboxEnd], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'13:00:00.0', N'15:00:00.0', 1, CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Timebox] OFF
SET IDENTITY_INSERT [dbo].[Truck] ON 

INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'76K3-9999', 1, N'Nhan', CAST(2019 AS Decimal(4, 0)), N'Blue', NULL, 2, 1, 12312232123, NULL, NULL, 2, NULL, N'upload/download.jfif', 0, NULL, 2, NULL, NULL, 4, 3, CAST(112312.12000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-01-01T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-31T00:00:00.0000000' AS DateTime2), CAST(N'2019-10-30T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, CAST(N'2019-10-21T19:09:54.5310000' AS DateTime2), 1, CAST(N'2019-11-22T15:57:54.7310168' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'23K5 - 1111', 2, N'Everest', CAST(2019 AS Decimal(4, 0)), N'White', NULL, 2, 2, 111, NULL, NULL, NULL, NULL, N'upload/download.jfif', 0, NULL, 1, NULL, NULL, 4, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:37:52.0250000' AS DateTime2), 1, CAST(N'2019-11-13T00:27:03.8713790' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'23K5 - 7777', 3, N'16t', CAST(2019 AS Decimal(4, 0)), N'Black', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 4, 2, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-18T22:41:39.7910000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'23K5 - 5555', 4, N'Everest', CAST(2019 AS Decimal(4, 0)), N'VinYel', NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 4, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, CAST(N'2019-11-08T14:33:56.6792995' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'23K5 - 8288', 2, N'16t', CAST(2019 AS Decimal(4, 0)), N'Blackjet', NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 4, 3, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'23K5 - 8288', 2, N'Everest', CAST(2019 AS Decimal(4, 0)), N'Gold', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'upload/730ba49e936675382c77.jpg', 1, NULL, 1, NULL, NULL, 4, NULL, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'23K5 - 8288', 3, N'16t', CAST(2019 AS Decimal(4, 0)), N'Silver', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, 10.00923, 11.292888, 4, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'23K5 - 8288', 1, N'16t', CAST(2019 AS Decimal(4, 0)), N'Blackjet', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 4, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-07T10:25:28.1030000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'23K5 - 7122', 1, N'Everest', CAST(2019 AS Decimal(4, 0)), N'Gold', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, NULL, NULL, 4, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-06T13:37:49.7520000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'23K5 - 8288', 2, N'16t', CAST(2019 AS Decimal(4, 0)), N'Silver', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 1, 10.00923, 11.292888, 4, 1, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'23:30:00' AS Time), 0, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'asd-123456', 3, N'7777', CAST(2019 AS Decimal(4, 0)), NULL, NULL, 5, 2, NULL, NULL, NULL, 2, NULL, N'/image/sb-bg-1.jpg', 1, NULL, 2, NULL, NULL, NULL, 2, CAST(10000.00000 AS Decimal(20, 5)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1, CAST(N'2019-10-21T19:09:54.5310000' AS DateTime2), 1, CAST(N'2019-11-17T09:14:30.7037510' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'Nhan-1234', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-08T14:27:48.5940000' AS DateTime2), 0, CAST(N'2019-11-08T14:59:53.9654806' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'Nhân cute', NULL, N'Test', CAST(2000 AS Decimal(4, 0)), N'Blackjack', N'999222', 2, 1, 123, 1232, NULL, 2, NULL, NULL, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-13T20:29:26.5950000' AS DateTime2), 1, CAST(N'2019-11-13T20:31:10.2870803' AS DateTime2), NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'Nhân', NULL, N'sss', CAST(1233 AS Decimal(4, 0)), N'asd', NULL, 2, 1, NULL, 45, NULL, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, CAST(222.22000 AS Decimal(20, 5)), 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-13T20:42:28.4338785' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Truck] ([Id], [TruckPlate], [BranchId], [Model], [Year], [Color], [Vin], [TruckTypeId], [FuelTypeId], [KmPerLit], [MaxCapacity], [PlateRenewal], [DepartmentId], [Note], [Image], [InUse], [MaxCBM], [VendorId], [Long], [Lat], [FreightStateId], [DriverId], [Price], [CurrencyId], [BoughtDate], [ActiveDate], [ExpiredDate], [MaintenanceStart], [MaintenanceEnd], [NextMaintenanceDate], [MaintenancePeriod], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1025, N'K12-Ok', NULL, N'20t', CAST(2018 AS Decimal(4, 0)), N'Grey', NULL, NULL, 1, 12, 30, NULL, 2, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2019-11-14T10:21:51.7548329' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Truck] OFF
SET IDENTITY_INSERT [dbo].[TruckMaintenance] ON 

INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 5, 1, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), CAST(10000000.00000 AS Decimal(20, 5)), 0, 20000000, 1, NULL, NULL, 1, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T21:14:09.3292370' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 5, 2, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), CAST(5000000.00000 AS Decimal(20, 5)), 0, 15000000, 1, 1, NULL, 1, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-16T17:16:57.1002249' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 5, 1, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(12232.00000 AS Decimal(20, 5)), 1, 2132222, 2, 6, NULL, 1, CAST(N'2019-11-08T22:02:08.4430000' AS DateTime2), 1, CAST(N'2019-11-17T00:18:43.1194772' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 5, 1, CAST(N'2019-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), CAST(123123123.00000 AS Decimal(20, 5)), 0, 123123, NULL, 2, NULL, 1, CAST(N'2019-11-08T23:41:00.0410000' AS DateTime2), 1, CAST(N'2019-11-08T23:41:42.5337237' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 5, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), CAST(12322222.00000 AS Decimal(20, 5)), 1, 123222, 2, 4, NULL, 1, CAST(N'2019-11-11T11:18:45.5902332' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 6, 1, CAST(N'2019-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-15T00:00:00.0000000' AS DateTime2), CAST(123123.00000 AS Decimal(20, 5)), 1, 123123, 2, 4, NULL, 1, CAST(N'2019-11-11T11:19:22.6570000' AS DateTime2), 1, CAST(N'2019-11-12T08:57:37.6743944' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 24, 1, NULL, CAST(N'2019-11-10T00:00:00.0000000' AS DateTime2), CAST(2227777.00000 AS Decimal(20, 5)), 0, NULL, NULL, 4, NULL, 1, CAST(N'2019-11-12T19:25:10.9050000' AS DateTime2), 1, CAST(N'2019-11-12T19:26:01.4808489' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 1025, 2, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-13T00:00:00.0000000' AS DateTime2), CAST(123.00000 AS Decimal(20, 5)), 0, NULL, NULL, 4, NULL, 1, CAST(N'2019-11-14T10:22:33.7803858' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, NULL, 1, CAST(N'2019-11-13T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(123.00000 AS Decimal(20, 5)), 0, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-14T10:23:15.2583011' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 5, 1, CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-25T00:00:00.0000000' AS DateTime2), CAST(12123.00000 AS Decimal(20, 5)), 0, 121231231, 2, 7, NULL, 1, CAST(N'2019-11-23T11:00:01.4454796' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, 5, 1, CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), CAST(123123.00000 AS Decimal(20, 5)), 0, 123123123123, 2, 8, NULL, 1, CAST(N'2019-11-23T14:24:15.8350370' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, 5, 1, CAST(N'2019-11-04T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-19T00:00:00.0000000' AS DateTime2), CAST(123123.00000 AS Decimal(20, 5)), 0, 123123123123, 2, NULL, NULL, 1, CAST(N'2019-11-23T14:29:10.1038790' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, 5, 1, CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-26T00:00:00.0000000' AS DateTime2), CAST(123123.00000 AS Decimal(20, 5)), 0, 123123123, 2, 7, NULL, 1, CAST(N'2019-11-23T14:58:21.9533347' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, 5, 3, NULL, CAST(N'2019-11-28T00:00:00.0000000' AS DateTime2), CAST(123.00000 AS Decimal(20, 5)), 0, 123123, 2, 5, NULL, 1, CAST(N'2019-11-23T15:17:42.2709246' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenance] ([Id], [TruckId], [VendorId], [StartDate], [EndDate], [AdvancedPaid], [Paid], [Total], [CurrencyId], [AccountableUserId], [TicketId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, 5, 1, CAST(N'2019-11-23T00:00:00.0000000' AS DateTime2), CAST(N'2019-11-28T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, 5, NULL, 1, CAST(N'2019-11-23T16:52:01.3976239' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TruckMaintenance] OFF
SET IDENTITY_INSERT [dbo].[TruckMaintenanceDetail] ON 

INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, 6, N'Nhân đã ở đây', CAST(12322221232.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T20:44:49.4441833' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 1, 5, N'Sửa chữa, test 123', CAST(12500000.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T20:44:49.4468800' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 1, 9, N'Công lắp ráp thay phụ tùng', CAST(12500000.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T20:44:49.4469231' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 1, 7, N'Sửa chữa ahihi', CAST(12500000.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T20:44:49.4469271' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 1, 11, N'Sửa chữa 123333', CAST(12500000.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-17T20:44:49.4469297' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 1, 7, N'Sửa chữa test 6th', CAST(12500000.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-16T16:28:54.6173244' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 2, 6, N'Updated', CAST(2222.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-11T23:03:00.6760000' AS DateTime2), 1, CAST(N'2019-11-16T17:16:57.0970487' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 2, 6, N'Nhân here', CAST(123.00000 AS Decimal(20, 5)), NULL, 0, CAST(N'2019-11-11T23:29:27.9390000' AS DateTime2), 1, CAST(N'2019-11-12T08:45:19.8265069' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, 8, N'aaaaa', CAST(2222.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-11T23:29:27.9460000' AS DateTime2), 1, CAST(N'2019-11-12T08:45:19.8265319' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, 6, N'asdasd', CAST(333444.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-11T23:30:47.2630000' AS DateTime2), 1, CAST(N'2019-11-16T17:16:57.0976160' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 2, 9, N'ahihi', CAST(7777.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-11T23:32:54.3860000' AS DateTime2), 1, CAST(N'2019-11-16T17:16:57.0976270' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, 7, 6, N'NHan here', CAST(23212.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-12T08:31:55.3140000' AS DateTime2), 1, CAST(N'2019-11-12T08:57:37.6642970' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, 7, 7, N'test updated', CAST(7777.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-12T08:39:28.7940000' AS DateTime2), 1, CAST(N'2019-11-12T08:57:37.6668975' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, 7, 8, N'Ahihi', CAST(9999.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-12T08:57:37.6669274' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, 9, 16, N'test', CAST(12322.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-12T19:25:10.9110000' AS DateTime2), 1, CAST(N'2019-11-12T19:26:01.4807214' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, 1, 6, N'test', NULL, NULL, 0, CAST(N'2019-11-13T15:44:53.7490000' AS DateTime2), 1, CAST(N'2019-11-16T16:28:54.6173268' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1017, 2, 5, N'Added', CAST(12.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-16T17:16:57.0978021' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1018, 2, 8, N'Added', CAST(12.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-16T17:16:57.1001899' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1019, 2, 10, N'Added', CAST(12.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-16T17:16:57.1002120' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1020, 4, 5, N'asd', CAST(1231223.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T00:18:43.1127142' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1021, 1, 7, N'BBB', CAST(54321.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-17T09:46:54.9950000' AS DateTime2), 1, CAST(N'2019-11-17T09:59:55.8693923' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1022, 1, 5, N'AAA', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:46:55.0000000' AS DateTime2), 1, CAST(N'2019-11-17T09:59:55.8694113' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1023, 1, 11, N'Test update', CAST(123.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-17T09:55:57.9260000' AS DateTime2), 1, CAST(N'2019-11-17T09:59:55.8694306' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1024, 1, 9, N'Update 2', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:55:57.9330000' AS DateTime2), 1, CAST(N'2019-11-17T09:59:55.8694350' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1025, 1, 5, N'Added', NULL, 1, 1, CAST(N'2019-11-17T09:56:39.0130000' AS DateTime2), 1, CAST(N'2019-11-17T09:59:55.8694391' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1026, 1, 5, N'asdsss', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:58:34.2427940' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1027, 1, 6, N'qweqw', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:58:34.2428259' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1028, 1, 7, N'qweqwwqe', CAST(12333.00000 AS Decimal(20, 5)), NULL, 1, CAST(N'2019-11-17T09:58:34.2428604' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1029, 1, 5, N'asdsss', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:59:23.0709482' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1030, 1, 6, N'qweqw', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T09:59:23.0709664' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1031, 1, 7, N'qweqwwqe', CAST(12333.00000 AS Decimal(20, 5)), NULL, 1, CAST(N'2019-11-17T09:59:23.0700000' AS DateTime2), 1, CAST(N'2019-11-17T21:02:02.0152886' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1032, 1, 5, N'added 3', NULL, NULL, 1, CAST(N'2019-11-17T09:59:55.8690000' AS DateTime2), 1, CAST(N'2019-11-17T21:02:02.0153012' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1033, 1, 5, N'addded 4', NULL, NULL, 1, CAST(N'2019-11-17T09:59:55.8690000' AS DateTime2), 1, CAST(N'2019-11-17T21:02:02.0153038' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1034, 1, 5, N'added 5', NULL, NULL, 1, CAST(N'2019-11-17T09:59:55.8690000' AS DateTime2), 1, CAST(N'2019-11-17T21:02:02.0153059' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1035, 1, 5, N'qwe', NULL, NULL, 1, CAST(N'2019-11-17T10:00:29.2170000' AS DateTime2), 1, CAST(N'2019-11-17T21:02:02.0153080' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1036, 1, 6, N'asd', CAST(123.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-17T10:00:51.9360000' AS DateTime2), 1, CAST(N'2019-11-17T20:46:10.1475116' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1037, 1, 5, N'asd', CAST(213.00000 AS Decimal(20, 5)), NULL, 0, CAST(N'2019-11-17T20:23:20.1770000' AS DateTime2), 1, CAST(N'2019-11-17T20:46:10.1475284' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1038, 1, 5, N'asd', CAST(123.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-17T20:44:49.4470000' AS DateTime2), 1, CAST(N'2019-11-17T20:46:10.1475356' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1039, 1, 7, N'Test pagination', CAST(123.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-17T20:44:49.4540000' AS DateTime2), 1, CAST(N'2019-11-17T20:46:10.1475389' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1040, 1, 10, N'Pagination 2', CAST(123.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-17T20:46:10.1475557' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1041, 1, 7, N'Pagination 3', CAST(123.00000 AS Decimal(20, 5)), 1, 0, CAST(N'2019-11-17T20:46:10.1475708' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1042, 1, 6, N'Pagination', CAST(123.00000 AS Decimal(20, 5)), NULL, 1, CAST(N'2019-11-17T20:58:50.7040000' AS DateTime2), 1, CAST(N'2019-11-17T21:14:09.3187628' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1043, 1, 5, N'123', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T20:58:50.7060000' AS DateTime2), 1, CAST(N'2019-11-17T21:14:09.3217450' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1044, 1, 6, N'Pagination', CAST(123.00000 AS Decimal(20, 5)), NULL, 1, CAST(N'2019-11-17T21:02:02.0150000' AS DateTime2), 1, CAST(N'2019-11-17T21:14:09.3217898' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1045, 1, 5, N'123', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T21:02:02.0150000' AS DateTime2), 1, CAST(N'2019-11-17T21:14:09.3217938' AS DateTime2), NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1046, 1, 5, N'reload grid', CAST(123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-17T21:14:09.3219997' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1047, 1, 7, N'Reload', CAST(123.00000 AS Decimal(20, 5)), NULL, 0, CAST(N'2019-11-17T21:14:09.3291942' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1048, 1, 8, N'Reload', CAST(123.00000 AS Decimal(20, 5)), 2, 0, CAST(N'2019-11-17T21:14:09.3292310' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1050, 17, 5, N'test', CAST(123123123.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-23T11:00:01.4559296' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1051, 18, 7, N'Test create', CAST(12323.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:24:15.8444277' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1052, 18, 9, N'Tét abc', CAST(123123.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:24:15.8537273' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1053, 19, 6, N'test', CAST(12312.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:29:10.1145932' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1054, 19, 7, N'asd', CAST(123123123.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:29:10.1256625' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1055, 20, 6, N'test', CAST(12312.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:58:21.9609427' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1056, 20, 7, N'asd', CAST(123123.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T14:58:21.9696462' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1057, 21, 8, N'123', CAST(1231.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T15:17:42.2812316' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1058, 21, 6, N'123', CAST(123123.00000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T15:17:42.2915327' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1059, 22, 5, N'test', NULL, 2, 1, CAST(N'2019-11-23T16:52:01.4032226' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckMaintenanceDetail] ([Id], [MaintenanceId], [AccessoryId], [Detail], [Price], [CurrencyId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1060, 22, 7, N'asdasd', CAST(123.22000 AS Decimal(20, 5)), 2, 1, CAST(N'2019-11-23T16:52:01.4074762' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TruckMaintenanceDetail] OFF
SET IDENTITY_INSERT [dbo].[TruckType] ON 

INSERT [dbo].[TruckType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'1.5T', N'1.5 tấn', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'2.0T', N'2.0 tấn', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'2.5T', N'2.5 tấn', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Benz', N'Xe Benz', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[TruckType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Mini truck', N'Xe tải nhẹ', 1, CAST(N'2019-10-21T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TruckType] OFF
INSERT [dbo].[UoM] ([Id], [Name], [Description], [UomTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'tấn', N'Tấn - 1000kg', 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UoM] ([Id], [Name], [Description], [UomTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'tạ', N'Tạ - 100kg', 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UoM] ([Id], [Name], [Description], [UomTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'yến', N'yến - 10kg', 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UoM] ([Id], [Name], [Description], [UomTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'm3', N'Mét khối', 2, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UoM] ([Id], [Name], [Description], [UomTypeId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'km', N'Kilomet', 3, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UomType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Weight', N'Weight', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UomType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Volume', N'Volume', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UomType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Distance', N'Distance', 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'sys', N'admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'123123123', N'123123123', N'Abc', N'Abc', N'09202439', N'02923488', 1, 1, 2, 1, NULL, NULL, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Quynh', N'Pham', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'999xxxxx', N'12399xxxxx', N'Tinhte', N'Genk', N'123xxx90', N'123xx8xx', 1, 1, 2, 2, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Nhan', N'Nguyen', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'098809xx', N'123xxx', N'Quang Ngai', N'Tinhte', N'123xxx90', N'123xx8xx', 1, 1, 2, 2, NULL, NULL, 1, CAST(N'2019-10-23T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Lan Anh', N'Nguyen', CAST(N'1990-11-14T00:00:00.0000000' AS DateTime2), N'012399xx22', N'123xxx', N'Chon Thanh', NULL, N'097914xxxx', NULL, 1, 1, 2, 5, NULL, NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Phạm', N'Anh Kiệt', CAST(N'1990-11-14T00:00:00.0000000' AS DateTime2), N'012399xx22', N'12399xxxxx', N'Tư Nghĩa', N'Quận 4', N'097914xxxx', NULL, 1, 1, NULL, 7, NULL, NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Phạm', N'Hương le bella', CAST(N'1989-10-11T00:00:00.0000000' AS DateTime2), N'0999222777', N'xxxnnn222', N'Sài Gòn', N'Quận 69', N'097914xxxx', NULL, 2, 1, NULL, 7, N'upload/chinese.jfif', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-16T17:17:22.2487245' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Phạm', N'Hoài Bảo', CAST(N'1989-10-10T00:00:00.0000000' AS DateTime2), N'0999222777', N'xxxnnn222', N'Tư Nghĩa 2', N'Quảng Ngãi', N'097914xxxx', NULL, 1, 1, NULL, 7, NULL, NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-11-14T17:50:43.7117218' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Phạm', N'Thu Thảo', CAST(N'1989-10-10T00:00:00.0000000' AS DateTime2), N'0999222777', N'xxxnnn222', N'Tư Nghĩa', N'Quảng Ngãi', N'097914xxxx', NULL, 1, 1, NULL, 7, N'image/hotgirl.jfif', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Phạm', N'Trâm Anh', CAST(N'1989-10-10T00:00:00.0000000' AS DateTime2), N'0999222777', N'xxxnnn222', N'Tư Nghĩa', N'Quảng Ngãi', N'097914xxxx', NULL, 1, 1, NULL, 7, N'image/Tram-Anh1.jpg', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'Lê', N'Trung Kiên', CAST(N'1989-10-10T00:00:00.0000000' AS DateTime2), N'0999222777', N'xxxnnn222', N'Tư Nghĩa', N'Quảng Ngãi', N'097914xxxx', NULL, 1, 1, NULL, 7, N'image/hotgirl.jfif', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Nguyễn', N'Nhân - coor', CAST(N'2004-12-28T00:00:00.0000000' AS DateTime2), N'223xxx446', NULL, N'387A Le Van Khuong', NULL, N'+84978532695', NULL, 2, NULL, NULL, 3, NULL, NULL, 1, CAST(N'2019-11-14T18:07:34.0560000' AS DateTime2), 1, CAST(N'2019-11-14T22:45:57.1709737' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [DoB], [Ssn], [Passport], [Address], [Address2], [PhoneNumber], [PhoneNumber2], [NationalityId], [ContractId], [DepartmentId], [RoleId], [Avatar], [SupervisorId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Lê', N'Quốc Hiệp - coor', CAST(N'2000-12-25T00:00:00.0000000' AS DateTime2), N'123123', N'123', N'387A Le Van Khuong', NULL, N'+84978532695', NULL, 1, NULL, NULL, 3, NULL, NULL, 1, CAST(N'2019-11-16T17:17:58.0790409' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserInterface] ON 

INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'TruckPlate', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Truck Plate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'BrandName', 10, NULL, N'Dropdown', 1, N'?$filter=Active eq true', 58, N'{Name}', 2, 1, NULL, NULL, NULL, N'Brand Name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Model', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Model', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Year', 10, NULL, N'Number', 1, NULL, NULL, NULL, 2, 1, 0, NULL, NULL, N'Year', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Color', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Color', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Vin', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Vin', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'TruckTypeId', 10, NULL, N'Dropdown', 1, NULL, 18, N'{Name}', 2, 1, NULL, NULL, NULL, N'Truck Type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'FuelTypeId', 10, NULL, N'Dropdown', 1, NULL, 46, N'{Name}', 2, 1, NULL, NULL, NULL, N'Fuel Type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (10, N'KmPerLit', 10, NULL, N'Number', 1, NULL, NULL, NULL, 2, 1, 0, NULL, NULL, N'Km/Lit', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'MaxCapacity', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Max Capacity', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'PlateRenewal', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Plate Renewal', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (13, N'DepartmentId', 10, NULL, N'Dropdown', 1, NULL, 37, N'{Name}', 2, 1, NULL, NULL, NULL, N'Department', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (14, N'Note', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Note', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Image', 10, NULL, N'Image', 2, NULL, NULL, NULL, 1, 12, NULL, NULL, NULL, N'Image/truck-thumb.jfif', 0, NULL, NULL, N'max-width: 260px;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'InUse', 10, NULL, N'Checkbox', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'In Use', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (17, N'MaxCbm', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Max CBM', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'VendorId', 10, NULL, N'Dropdown', 1, NULL, 21, N'{Name}', 2, 1, NULL, NULL, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (19, N'Long', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Long', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (20, N'Lat', 10, NULL, N'Input', 1, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Lat', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (21, N'DriverId', 10, NULL, N'Dropdown', 2, N'?$filter=Active eq true and Role/RoleName eq ''Driver''', 19, N'{FirstName} {LastName}', 2, 1, NULL, NULL, NULL, N'Driver', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (22, N'Price', 10, NULL, N'Number', 3, NULL, NULL, NULL, 2, 1, 2, NULL, NULL, N'Price', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (23, N'CurrencyId', 10, NULL, N'Dropdown', 3, NULL, 56, N'{Name}', 2, 1, NULL, NULL, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (24, N'BoughtDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Bought Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (25, N'ActiveDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Active Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (26, N'ExpiredDate', 10, NULL, N'Datepicker', 3, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Expired Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (27, N'MaintenanceStart', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Maintenance Start', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (28, N'MaintenanceEnd', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Maintenance End', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (29, N'NextMaintenanceDate', 10, NULL, N'Datepicker', 4, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'NextMaintenance Date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, NULL, 10, NULL, N'Button', 6, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Save', 0, N'mif-floppy-disk', N'button info small', NULL, N'Ctrl-s', NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, NULL, 10, NULL, N'Button', 6, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Accessory', 10, NULL, N'GridView', 14, N'?$filter=Active eq true and TruckId eq {Id}', 1, NULL, 4, 10, NULL, NULL, NULL, N'Accessory', 0, N'mif-search', N'gridview', N'max-width: 0; padding: 0;', NULL, NULL, N'{''dblclick'': ''UpdateAccessory''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (39, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateAccessory', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteAccessory', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, NULL, 10, NULL, N'Input', 16, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, NULL, 10, NULL, N'Button', 16, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateTruck', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteTruck', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, NULL, 10, NULL, N'Input', 18, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, NULL, 10, NULL, N'Button', 18, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'TruckGrid', 10, NULL, N'GridView', 19, N'?$filter=Active eq true', 14, NULL, 8, 15, NULL, NULL, NULL, N'Truck', 0, N'mif-search', N'gridview', N'max-width: 300px; padding: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditTruck''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'Name', 10, NULL, N'Input', 26, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 1, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'Version', 10, NULL, N'Input', 26, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Version', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'VendorId', 10, NULL, N'Dropdown', 26, NULL, 21, N'{Name}', 2, 1, NULL, NULL, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'Price', 10, NULL, N'Number', 26, NULL, NULL, NULL, 2, 1, 2, NULL, NULL, N'Price', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 5, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'CurrencyId', 10, NULL, N'Dropdown', 26, NULL, 56, N'{Name}', 2, 1, 2, NULL, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 6, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'AssembledDate', 10, NULL, N'Datepicker', 24, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Assembled date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'ExpiredDate', 10, NULL, N'Datepicker', 24, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Expired date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'NextMaintenanceDate', 10, NULL, N'Datepicker', 24, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Next maintenance', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'ApplyPeriod', 10, NULL, N'Checkbox', 24, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Apply period', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, NULL, 10, NULL, N'Button', 25, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Save', 0, N'mif-floppy-disk', N'button info small', NULL, N'Ctrl-s', NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, NULL, 10, NULL, N'Button', 25, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'BranchId', 10, NULL, N'Dropdown', 26, N'?$filter=Active eq true and BranchType/Name eq ''Accessory''', 58, N'{Name}', 2, 1, NULL, NULL, NULL, N'Branch', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (62, N'TruckId', 10, NULL, N'Dropdown', 26, N'?$filter=Active eq true and Id eq {TruckId}', 14, N'{TruckPlate} - {Model}', 2, 1, NULL, NULL, NULL, N'Truck plate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, N'MaintenanceGrid', 10, NULL, N'GridView', 28, N'?$filter=Active eq true and TruckId eq {Id}', 15, NULL, 8, 10, NULL, NULL, NULL, N'Truck', 0, N'mif-search', N'gridview', N'max-width: 300px; padding: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditMaintenance''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, NULL, 10, NULL, N'Button', 27, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateMaintenance', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, NULL, 10, NULL, N'Button', 27, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteMaintenance', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (66, NULL, 10, NULL, N'Input', 27, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, NULL, 10, NULL, N'Button', 27, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (69, N'VendorId', 10, NULL, N'Dropdown', 30, NULL, 21, N'{Name}', 2, 1, NULL, NULL, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, N'TruckId', 10, NULL, N'Dropdown', 30, N'?$filter=Id eq {TruckId}', 14, N'{TruckPlate}', 2, 1, NULL, NULL, NULL, N'Truck plate', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, N'StartDate', 10, NULL, N'Datepicker', 30, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Start date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, N'EndDate', 10, NULL, N'Datepicker', 30, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'End date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, N'AdvancedPaid', 10, NULL, N'Number', 31, NULL, NULL, N'{0:n}', 2, 1, 2, NULL, NULL, N'Advanced paid', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (74, N'Paid', 10, NULL, N'Checkbox', 31, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, N'Paid', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (75, N'Total', 10, NULL, N'Number', 31, NULL, NULL, N'{0:n}', 2, 1, 2, NULL, NULL, N'Total', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (76, N'CurrencyId', 10, NULL, N'Dropdown', 31, N'?$filter=Active eq true', 56, N'{Name}', 2, 1, 2, NULL, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 6, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (77, N'AccountableUserId', 10, NULL, N'Dropdown', 30, N'/Office?$filter=Active eq true', 19, N'{FirstName} {LastName}', 2, 1, NULL, NULL, NULL, N'Accountable', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (78, NULL, 10, NULL, N'Button', 32, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Save', 0, N'mif-floppy-disk', N'button info small', NULL, N'Ctrl-s', NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (79, NULL, 10, NULL, N'Button', 32, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (82, N'TruckMaintenanceDetail', 10, NULL, N'GridView', 33, N'?$filter=Active eq true and MaintenanceId eq {Id}', 16, NULL, NULL, 5, NULL, NULL, NULL, NULL, 0, NULL, N'gridview', N'padding: 0; margin-top: 1rem;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-09T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (83, N'Create', 10, NULL, N'Button', 35, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateAccessory', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (84, N'Delete', 10, NULL, N'Button', 35, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteAccessory', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (85, NULL, 10, NULL, N'Input', 35, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (86, NULL, 10, NULL, N'Button', 35, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (87, N'Accessory', 10, NULL, N'GridView', 36, N'?$filter=Active eq true and Truck/Active eq true', 1, NULL, 0, 15, NULL, NULL, NULL, N'Accessory', 0, NULL, N'gridview', N'max-width: 0; padding: 0;', NULL, NULL, N'{''dblclick'': ''UpdateAccessory''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (88, NULL, 10, NULL, N'Button', 38, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateMaintenance', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (89, NULL, 10, NULL, N'Button', 38, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteMaintenance', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (90, NULL, 10, NULL, N'Input', 38, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (91, NULL, 10, NULL, N'Button', 38, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (92, N'Maintenance', 10, NULL, N'GridView', 39, N'?$filter=Active eq true', 15, NULL, 0, 15, NULL, NULL, NULL, N'Maintenance', 0, NULL, N'gridview', N'max-width: 0; padding: 0;', NULL, NULL, N'{''dblclick'': ''EditMaintenance''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (93, N'btnCreate', 10, NULL, N'Button', 41, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateContainer', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (94, N'btnDelete', 10, NULL, N'Button', 41, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteContainer', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (95, N'txtSearch', 10, NULL, N'Input', 41, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (96, N'btnSearch', 10, NULL, N'Button', 41, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (97, N'ContainerGrid', 10, NULL, N'GridView', 42, N'?$filter=Active eq true', 31, NULL, 0, 15, NULL, NULL, NULL, N'Maintenance', 0, NULL, N'gridview', N'max-width: 300px; padding: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditContainer''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (98, N'VendorId', 10, NULL, N'Dropdown', 43, N'?$filter=Active eq true and VendorType/Name eq ''Container''', 21, N'{Name}', 2, 0, NULL, NULL, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (99, N'ContainerTypeId', 10, NULL, N'Dropdown', 43, N'?$filter=Active eq true', 32, N'{Name}', 2, 0, NULL, NULL, NULL, N'Container type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (100, N'Code', 10, NULL, N'Input', 43, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Code', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (101, N'Description', 10, NULL, N'Input', 43, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Description', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (102, N'FrightStateId', 10, NULL, N'Dropdown', 43, N'?$filter=Active eq true', 45, N'{Name}', 2, 0, NULL, NULL, NULL, N'State', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (103, N'RentDate', 10, NULL, N'Datepicker', 44, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Rent date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (104, N'EndRentDate', 10, NULL, N'Datepicker', 44, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'End date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (106, N'AdvancedPaid', 10, NULL, N'Number', 45, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Advanced paid', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (107, N'NextPayment', 10, NULL, N'Datepicker', 45, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Next payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (108, N'ApplyPeriod', 10, NULL, N'Checkbox', 45, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Apply period', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (109, N'PeriodPayment', 10, NULL, N'Number', 45, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Period payment', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (110, N'Save', 10, NULL, N'Button', 46, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Save', 0, N'fa fa-save', N'button info small', NULL, NULL, NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (111, N'Cancel', 10, NULL, N'Button', 46, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (112, N'InUse', 10, NULL, N'Checkbox', 43, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'In use', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 6, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (113, N'btnAdd', 10, NULL, N'Button', 48, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateCustomer', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (114, N'btnDelete', 10, NULL, N'Button', 48, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteCustomer', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (115, N'txtSearch', 10, NULL, N'Input', 48, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (116, N'btnSearch', 10, NULL, N'Button', 48, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (117, N'CustomerGrid', 10, NULL, N'GridView', 49, N'?$expand=User&$filter=User/Active eq true', 35, NULL, 0, 15, NULL, NULL, NULL, N'Customer', 0, NULL, N'gridview', N'max-width: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditCustomer''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (118, N'Save', 10, NULL, N'Button', 56, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Save', 0, N'fa fa-save', N'button info small', NULL, NULL, NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (119, N'Cancel', 10, NULL, N'Button', 56, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (120, N'User.Avatar', 10, NULL, N'Image', 51, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'image/chinese.jfif', 0, NULL, NULL, N'    width: 200px;
    max-height: 200px; padding: 0;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (123, N'CustomerGroupId', 10, NULL, N'Dropdown', 52, N'?$filter=Active eq true', 36, N'{GroupName}', 2, 0, NULL, NULL, NULL, N'Customer group', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (124, N'User.FirstName', 10, NULL, N'Input', 52, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'First name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (125, N'User.LastName', 10, NULL, N'Input', 52, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Last name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (126, N'User.DoB', 10, NULL, N'Datepicker', 52, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Date of birth', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (127, N'User.Ssn', 10, NULL, N'Input', 52, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'SSN', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (128, N'User.Passport', 10, NULL, N'Input', 52, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Passport', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (129, N'User.NationalityId', 10, NULL, N'Dropdown', 52, NULL, 51, N'{Name}', 2, 0, NULL, NULL, NULL, N'Nationality', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (130, N'User.PhoneNumber', 10, NULL, N'Input', 55, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Phone number', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (131, N'User.PhoneNumber', 10, NULL, N'Input', 55, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Phone number 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (132, N'User.Address', 10, NULL, N'Input', 55, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Address', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (133, N'User.Address2', 10, NULL, N'Input', 55, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Address 2', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (134, N'btnCreate', 10, NULL, N'Button', 57, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateQuotation', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (135, N'btnDelete', 10, NULL, N'Button', 57, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteQuotation', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (136, N'txtSearch', 10, NULL, N'Input', 57, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (137, N'btnSearch', 10, NULL, N'Button', 57, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (138, N'QuotationGrid', 10, NULL, N'GridView', 58, N'?$filter=Active eq true', 5, NULL, 0, 15, NULL, NULL, NULL, N'Quotation', 0, NULL, N'gridview', N'max-width: 300px; padding: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditQuotation''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (139, N'Save', 10, NULL, N'Button', 66, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Save', 0, N'fa fa-save', N'button info small', NULL, NULL, NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (140, N'Cancel', 10, NULL, N'Button', 66, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (142, N'CustomerGroupId', 10, NULL, N'Dropdown', 60, NULL, 36, N'{GroupName}', 2, 0, NULL, NULL, NULL, N'Customer group', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (143, N'VendorId', 10, NULL, N'Dropdown', 60, NULL, 21, N'{Name}', 2, 0, NULL, NULL, NULL, N'Vendor', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (144, N'FromId', 10, NULL, N'Dropdown', 61, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'From', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (145, N'ToId', 10, NULL, N'Dropdown', 61, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'To', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (146, N'ContainerTypeId', 10, NULL, N'Dropdown', 62, NULL, 32, N'{Name}', 2, 0, NULL, NULL, NULL, N'Container type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (147, N'IsContainer', 10, NULL, N'Checkbox', 62, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Is Cont', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (148, N'ContainerRangeId', 10, NULL, N'Dropdown', 62, NULL, 60, N'{MinContainer} - {MaxContainer}', 2, 0, NULL, NULL, NULL, N'Container No.', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (149, N'CommodityTypeId', 10, NULL, N'Dropdown', 62, NULL, 29, N'{Name}', 2, 0, NULL, NULL, NULL, N'Commodity type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (150, N'WeightRangeId', 10, NULL, N'Dropdown', 62, N'?$expand=Uom&$filter=true', 24, N'{WeightStart} - {WeightEnd} {Uom.Name}', 2, 0, NULL, NULL, NULL, N'Weight', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (151, N'VolumeRangeId', 10, NULL, N'Dropdown', 62, N'?$expand=Uom&$filter=true', 23, N'{VolumeStart} - {VolumeEnd} {Uom.Name}', 2, 0, NULL, NULL, NULL, N'Volume', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (152, N'TimeboxId', 10, NULL, N'Dropdown', 69, NULL, 11, N'{TimeboxStart} - {TimeboxEnd}', 2, 0, NULL, NULL, NULL, N'Timebox', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (153, N'EffectiveDate', 10, NULL, N'Datepicker', 69, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Effective date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (154, N'ExpiredDate', 10, NULL, N'Datepicker', 69, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Expiry date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (155, N'Price', 10, NULL, N'Number', 70, NULL, NULL, N'{0:n}', 2, 0, 2, NULL, NULL, N'Unit price', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (156, N'CurrencyId', 10, NULL, N'Dropdown', 70, NULL, 56, N'{Name}', 4, 0, NULL, NULL, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (157, N'DistanceRangeId', 10, NULL, N'Dropdown', 61, N'?$expand=Uom&$filter=true', 59, N'{MinDistance} - {MaxDistance} {Uom.Name}', 2, 0, NULL, NULL, NULL, N'Distance', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (158, N'TruckTypeId', 10, NULL, N'Dropdown', 60, NULL, 18, N'{Name}', 2, 0, NULL, NULL, NULL, N'Truck type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (159, N'CustomerId', 10, NULL, N'Dropdown', 60, N'?$expand=User&$filter=true', 35, N'{User.FullName}', 2, 0, NULL, NULL, NULL, N'Customer', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (160, N'EmptyContFromId', 10, NULL, N'Dropdown', 61, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'Empty Cont from', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (161, N'EmptyContToId', 10, NULL, N'Dropdown', 61, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'Empty Cont to', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (162, N'ForGroupOnly', 10, NULL, N'Checkbox', 60, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'For group only', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 5, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (163, N'PriceTypeId', 10, NULL, N'Dropdown', 70, NULL, 61, N'{Name}', 4, 0, NULL, NULL, NULL, N'Price by', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (164, N'Vat', 10, NULL, N'Number', 70, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'VAT(%)', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1118, N'btnCreate', 10, NULL, N'Button', 1055, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Create', 0, N'fa fa-plus', N'button info small', NULL, NULL, NULL, N'CreateSaleOrder', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1119, N'btnDelete', 10, NULL, N'Button', 1055, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Delete', 0, N'fa fa-trash', N'button secondary small', NULL, NULL, NULL, N'DeleteSaleOrder', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1120, N'txtSearch', 10, NULL, N'Input', 1055, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button secondary small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1121, N'btnSearch', 10, NULL, N'Button', 1055, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Search', 0, N'fa fa-search', N'button info small', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1122, N'SaleOrderGrid', 10, NULL, N'GridView', 1056, N'?$filter=Active eq true', 54, NULL, 0, 15, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'max-width: 300px; padding: 0; margin-top: 1rem;', NULL, NULL, N'{''dblclick'': ''EditSaleOrder''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1123, N'CustomerId', 10, NULL, N'Dropdown', 1057, N'?$expand=User&$filter=Active eq true', 35, N'{User.FirstName} {User.LastName}', 2, 0, NULL, NULL, NULL, N'Customer', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1124, N'ContactFirstName', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Contact first name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1125, N'ContactLastName', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Contact last name', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1126, N'ContactNumber', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Contact phone', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1127, N'ContactSSN', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Contact SSN', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1128, N'ContactAddress', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Contact address', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1135, N'AdvancedPaid', 10, NULL, N'Number', 1059, NULL, NULL, N'{0:n}', 2, 0, 2, NULL, NULL, N'Advanced paid', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1136, N'Paid', 10, NULL, N'Checkbox', 1059, NULL, NULL, NULL, 2, 0, 2, NULL, NULL, N'Paid', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1137, N'DiscountMoney', 10, NULL, N'Number', 1059, NULL, NULL, N'{0:n}', 2, 0, 2, NULL, NULL, N'Discount money', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 5, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1138, N'DiscountPercentage', 10, NULL, N'Number', 1059, NULL, NULL, N'{0:n}', 2, 0, 2, NULL, NULL, N'Discount (%)', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 6, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1139, N'AdvancedPaidDate', 10, NULL, N'Datepicker', 1059, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Advanced paid date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1140, N'PaidDate', 10, NULL, N'Datepicker', 1059, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Paid date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1141, N'TotalPriceBeforeDiscount', 10, NULL, N'Number', 1059, NULL, NULL, NULL, 2, 0, 2, NULL, NULL, N'Before discount', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 9, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1142, N'TotalPriceAfterDiscount', 10, NULL, N'Number', 1059, NULL, NULL, NULL, 2, 0, 2, NULL, NULL, N'After discount', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 10, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1143, N'TotalPriceAfterTax', 10, NULL, N'Number', 1059, NULL, NULL, N'{0:n}', 2, 0, 2, NULL, NULL, N'After tax (final)', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 11, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1144, N'Vat', 10, NULL, N'Number', 1059, NULL, NULL, NULL, 2, 0, 2, NULL, NULL, N'VAT (%)', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 7, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1145, N'CurrencyId', 10, NULL, N'Dropdown', 1059, NULL, 56, N'{Name}', 2, 0, NULL, NULL, NULL, N'Currency', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 11, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1146, N'btnSave', 10, NULL, N'Button', 1061, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Save', 0, N'fa fa-save', N'button info small', NULL, NULL, NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1147, N'btnCancel', 10, NULL, N'Button', 1061, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1148, N'OrderDetail', 10, NULL, N'GridView', 1063, N'?$filter=Active eq true and OrderId eq {Id}', 2, NULL, 1, 4, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'max-width: 0; padding: 0; margin-top: -1rem; margin-top: 1rem;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1149, N'Test', 10, NULL, N'Input', 1059, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'VAT (%)', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 8, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1150, N'Surcharge', 10, NULL, N'GridView', 1064, N'?$filter=Active eq true and OrderId eq {Id}', 8, NULL, 0, 4, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'max-width: 0; padding: 0; margin-top: 1rem;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1151, N'btnCreate', 10, NULL, N'Button', 1067, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Link', 0, N'fa fa-link', N'button info small', N'padding: 0px; display: block; position: absolute; top: -30px; left: 30rem;', NULL, NULL, N'Composite', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1155, N'OrderCompositionGrid', 10, NULL, N'GridView', 1067, N'?$expand=From($select=ShortName), To($select=ShortName)&$filter=Active eq true and IsContainer eq false and Vendor/IsSelf eq true and (OrderComposition eq null)', 2, NULL, 1, 15, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'max-width: 300px; padding: 0;', NULL, NULL, N'{''dblclick'': ''EditSaleOrder''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1157, N'Coordination', 10, NULL, N'GridView', 1069, N'?$expand=OrderComposition($expand=OrderDetail($expand=Order))&$filter=Active eq true and FreightStateId eq 4', 34, NULL, 1, 10, NULL, NULL, N'{Key}', NULL, 0, NULL, NULL, N'max-width: 300px; padding: 0;', NULL, NULL, N'{''dblclick'': ''EditCoordination''}', 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1159, N'btnDecomposite', 10, NULL, N'Button', 1071, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Unlink', 0, N'fa fa-unlink', N'button secondary small', NULL, NULL, NULL, N'DecompositeCoordination', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1160, N'FromId', 10, NULL, N'Dropdown', 1072, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'From', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1161, N'ToId', 10, NULL, N'Dropdown', 1072, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'To', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1162, N'EmptyContFromId', 10, NULL, N'Dropdown', 1072, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'Empty Cont. from', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1163, N'EmptyContToId', 10, NULL, N'Dropdown', 1072, NULL, 9, N'{ShortName}', 2, 0, NULL, NULL, NULL, N'Empty Cont. to', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1164, N'TruckTypeId', 10, NULL, N'Dropdown', 1073, NULL, 18, N'{Name}', 2, 0, NULL, NULL, NULL, N'Truck type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1165, N'TotalContainer', 10, NULL, N'Number', 1073, NULL, NULL, N'{0:n}', 2, 0, 0, NULL, NULL, N'Total container', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1166, N'Weight', 10, NULL, N'Number', 1073, NULL, NULL, N'{0:n}', 2, 0, 0, NULL, NULL, N'Weight', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1167, N'Volume', 10, NULL, N'Number', 1073, NULL, NULL, N'{0:n}', 2, 0, 0, NULL, NULL, N'Volume', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1168, N'Distance', 10, NULL, N'Number', 1073, NULL, NULL, N'{0:n}', 2, 0, 0, NULL, NULL, N'Distance', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1169, N'TimeboxId', 10, NULL, N'Dropdown', 1073, NULL, 11, N'{TimeboxStart} - {TimeboxEnd}', 2, 0, NULL, NULL, NULL, N'Timebox', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1170, N'ContainerTypeId', 10, NULL, N'Dropdown', 1073, NULL, 32, N'{Name}', 2, 0, NULL, NULL, NULL, N'Container type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1171, N'CommodityTypeId', 10, NULL, N'Dropdown', 1073, NULL, 29, N'{Name}', 2, 0, NULL, NULL, NULL, N'Commodity type', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1172, N'IsComposited', 10, NULL, N'Checkbox', 1074, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Is composited', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1173, N'Note', 10, NULL, N'Textarea', 1074, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Note', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1174, N'CoordinationDetail', 10, NULL, N'GridView', 1076, N'?$filter=Active eq true and CoordinationId eq {Id}', 1061, NULL, 0, 6, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'padding: 0;', NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1175, N'btnCreate', 10, NULL, N'Button', 1077, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Save', 0, N'fa fa-save', N'button info small', NULL, NULL, NULL, N'Save', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1176, N'btnCancel', 10, NULL, N'Button', 1077, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, N'Cancel', 0, N'mif-exit', N'button secondary small', NULL, NULL, NULL, N'Dispose', 0, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1177, N'FreightStateId', 10, NULL, N'Dropdown', 1078, NULL, 45, N'{Name}', 2, 0, NULL, NULL, NULL, N'State', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 1, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1179, N'Deadline', 10, NULL, N'Datepicker', 1078, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Deadline', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 3, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1180, N'Id', 10, NULL, N'Input', 1057, NULL, NULL, N'SO{0:00000}', 2, 0, NULL, NULL, NULL, N'Code', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 0, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
GO
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1181, N'Note', 10, NULL, N'Input', 1057, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'Note', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 12, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1182, N'AccountableUserId', 10, NULL, N'Dropdown', 1078, N'?$filter=Active eq true and Role/RoleName eq ''Coordinator''', 19, N'{FirstName} {LastName}', 2, 0, NULL, NULL, NULL, N'Coordinator', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 4, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1183, N'AccountableDepartmentId', 10, NULL, N'Dropdown', 1078, NULL, 37, N'{Name}', 2, 0, NULL, NULL, NULL, N'Department', 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, 5, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[UserInterface] ([Id], [FieldName], [PolicyId], [StateId], [ComponentType], [ComponentGroupId], [DataSourceFilter], [ReferenceId], [Format], [Column], [Row], [Precision], [GroupBy], [GroupFormat], [Label], [ShowLabel], [Icon], [ClassName], [Style], [HotKey], [Renderer], [Events], [Disabled], [Visibility], [Validation], [Focus], [Width], [MinWidth], [MaxWidth], [Order], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1184, N'InsertedDate', 10, NULL, N'Datepicker', 1078, NULL, NULL, NULL, 2, 0, NULL, NULL, NULL, N'SO date', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 2, 1, CAST(N'2019-10-19T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInterface] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Mekoong', 1, 0, N'The main provider', N'12031239', N'1231235', N'ABC', NULL, 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Trường Hải', 1, 0, N'Oto lắp ráp', N'123123', N'098098', N'DÈ', NULL, 1, CAST(N'2019-10-20T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Tân cảng', 3, 0, N'Chuyên container', N'12322xxx', N'09122xxxx', N'Cảng cát lát', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Nhà bè', 3, 0, N'Chuyên container', N'12322xxx', N'09122xxxx', N'Cảng cát lát', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Lighting logistic', 4, 1, N'Chuyên vận tải nội thành HCM', N'12322xxx', N'09122xxxx', N'Bến xe miền Đông', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'Hải Vân', 4, 0, N'Chuyên xe cont nội địa', N'12322xxx', N'09122xxxx', N'Bến xe miền Đông', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Vendor] ([Id], [Name], [VendorTypeId], [IsSelf], [Description], [PhoneNumber], [PhoneNumber2], [Address], [Address2], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Giao hàng nhanh', 4, 0, N'Vận tải Đông Nam Á', N'12322xxx', N'09122xxxx', N'Bến xe miền Đông', NULL, 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Truck provider', N'Truck resale', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Gara', N'Maintenace', 1, CAST(N'2019-09-30T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'Container', N'Container', 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VendorType] ([Id], [Name], [Description], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'Freight service', N'Freight service', 1, CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[VolumeRange] ON 

INSERT [dbo].[VolumeRange] ([Id], [VolumeStart], [VolumeEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, CAST(12.00000 AS Decimal(20, 5)), CAST(23.00000 AS Decimal(20, 5)), 4, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VolumeRange] ([Id], [VolumeStart], [VolumeEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, CAST(33.00000 AS Decimal(20, 5)), CAST(44.00000 AS Decimal(20, 5)), 4, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[VolumeRange] ([Id], [VolumeStart], [VolumeEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, CAST(45.00000 AS Decimal(20, 5)), CAST(56.00000 AS Decimal(20, 5)), 4, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[VolumeRange] OFF
SET IDENTITY_INSERT [dbo].[WeightRange] ON 

INSERT [dbo].[WeightRange] ([Id], [WeightStart], [WeightEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, CAST(12.00000 AS Decimal(20, 5)), CAST(25.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[WeightRange] ([Id], [WeightStart], [WeightEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (3, CAST(22.00000 AS Decimal(20, 5)), CAST(35.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[WeightRange] ([Id], [WeightStart], [WeightEnd], [UomId], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (4, CAST(36.00000 AS Decimal(20, 5)), CAST(45.00000 AS Decimal(20, 5)), 1, 1, CAST(N'2019-11-14T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WeightRange] OFF
SET IDENTITY_INSERT [dbo].[Workflow] ON 

INSERT [dbo].[Workflow] ([Id], [Name], [Description], [EffectiveDate], [ExpiredDate], [Active], [InsertedDate], [InsertedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Frieght work flow', N'N/A', NULL, NULL, 1, CAST(N'2019-10-17T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workflow] OFF
/****** Object:  Index [IX_Customer]    Script Date: 12/2/2019 3:00:31 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [IX_Customer] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Feature]    Script Date: 12/2/2019 3:00:31 PM ******/
ALTER TABLE [dbo].[Feature] ADD  CONSTRAINT [UK_Feature] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComponentGroup] ADD  CONSTRAINT [DF_UIGroup_IsTab]  DEFAULT ((0)) FOR [IsTab]
GO
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_IsMaintained]  DEFAULT ((0)) FOR [InUse]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Allowance]  DEFAULT ((0)) FOR [Allowance]
GO
ALTER TABLE [dbo].[Coordination] ADD  CONSTRAINT [DF_Coordination_IsComposited]  DEFAULT ((0)) FOR [IsComposited]
GO
ALTER TABLE [dbo].[Feature] ADD  CONSTRAINT [DF_Feature_IsMenu]  DEFAULT ((0)) FOR [IsMenu]
GO
ALTER TABLE [dbo].[GridPolicy] ADD  CONSTRAINT [DF_GridPolicy_Frozen]  DEFAULT ((0)) FOR [Frozen]
GO
ALTER TABLE [dbo].[GridPolicy] ADD  CONSTRAINT [DF_GridPolicy_Editable]  DEFAULT ((0)) FOR [Editable]
GO
ALTER TABLE [dbo].[GridPolicy] ADD  CONSTRAINT [DF_GridPolicy_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Paid]  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Volume]  DEFAULT ((0)) FOR [BoxVolume]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Weight]  DEFAULT ((0)) FOR [BoxWeight]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_ForGroupOnly]  DEFAULT ((0)) FOR [ForGroupOnly]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_TotalContainer]  DEFAULT ((0)) FOR [ContainerRangeId]
GO
ALTER TABLE [dbo].[Vendor] ADD  CONSTRAINT [DF_Vendor_IsSelf]  DEFAULT ((0)) FOR [IsSelf]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessary_Vendor]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Branch]
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
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_BranchType] FOREIGN KEY([BranchTypeId])
REFERENCES [dbo].[BranchType] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_BranchType]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_UserInserted]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_UserUpdated]
GO
ALTER TABLE [dbo].[BranchType]  WITH CHECK ADD  CONSTRAINT [FK_BranchType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[BranchType] CHECK CONSTRAINT [FK_BranchType_UserInserted]
GO
ALTER TABLE [dbo].[BranchType]  WITH CHECK ADD  CONSTRAINT [FK_BranchType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[BranchType] CHECK CONSTRAINT [FK_BranchType_UserUpdated]
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
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_ComponentGroup] FOREIGN KEY([ParentId])
REFERENCES [dbo].[ComponentGroup] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_ComponentGroup]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_Feature]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_FreightState]
GO
ALTER TABLE [dbo].[ComponentGroup]  WITH CHECK ADD  CONSTRAINT [FK_ComponentGroup_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[ComponentGroup] CHECK CONSTRAINT [FK_ComponentGroup_Policy]
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
ALTER TABLE [dbo].[ContainerRange]  WITH CHECK ADD  CONSTRAINT [FK_ContainerRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerRange] CHECK CONSTRAINT [FK_ContainerRange_UserInserted]
GO
ALTER TABLE [dbo].[ContainerRange]  WITH CHECK ADD  CONSTRAINT [FK_ContainerRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerRange] CHECK CONSTRAINT [FK_ContainerRange_UserUpdated]
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
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_CommodityType]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Container] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Container]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_FreightState]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TaskState] FOREIGN KEY([TaskStateId])
REFERENCES [dbo].[TaskState] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TaskState]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Terminal_EmptyContFrom] FOREIGN KEY([EmptyContFromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Terminal_EmptyContFrom]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Terminal_EmptyContTo] FOREIGN KEY([EmptyContToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Terminal_EmptyContTo]
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
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_Timebox]
GO
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_TruckType] FOREIGN KEY([TruckTypeId])
REFERENCES [dbo].[TruckType] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_TruckType]
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
ALTER TABLE [dbo].[CoordinationDetail]  WITH CHECK ADD  CONSTRAINT [FK_CoordinationDetail_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[CoordinationDetail] CHECK CONSTRAINT [FK_CoordinationDetail_Container]
GO
ALTER TABLE [dbo].[CoordinationDetail]  WITH CHECK ADD  CONSTRAINT [FK_CoordinationDetail_Coordination] FOREIGN KEY([CoordinationId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[CoordinationDetail] CHECK CONSTRAINT [FK_CoordinationDetail_Coordination]
GO
ALTER TABLE [dbo].[CoordinationDetail]  WITH CHECK ADD  CONSTRAINT [FK_CoordinationDetail_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[CoordinationDetail] CHECK CONSTRAINT [FK_CoordinationDetail_Driver]
GO
ALTER TABLE [dbo].[CoordinationDetail]  WITH CHECK ADD  CONSTRAINT [FK_CoordinationDetail_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[CoordinationDetail] CHECK CONSTRAINT [FK_CoordinationDetail_FreightState]
GO
ALTER TABLE [dbo].[CoordinationDetail]  WITH CHECK ADD  CONSTRAINT [FK_CoordinationDetail_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[CoordinationDetail] CHECK CONSTRAINT [FK_CoordinationDetail_Truck]
GO
ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserInserted]
GO
ALTER TABLE [dbo].[Currency]  WITH CHECK ADD  CONSTRAINT [FK_Currency_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Currency] CHECK CONSTRAINT [FK_Currency_UserUpdated]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User]
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
ALTER TABLE [dbo].[DistanceRange]  WITH CHECK ADD  CONSTRAINT [FK_DistanceRange_UoM] FOREIGN KEY([UomId])
REFERENCES [dbo].[UoM] ([Id])
GO
ALTER TABLE [dbo].[DistanceRange] CHECK CONSTRAINT [FK_DistanceRange_UoM]
GO
ALTER TABLE [dbo].[DistanceRange]  WITH CHECK ADD  CONSTRAINT [FK_DistanceRange_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DistanceRange] CHECK CONSTRAINT [FK_DistanceRange_UserInserted]
GO
ALTER TABLE [dbo].[DistanceRange]  WITH CHECK ADD  CONSTRAINT [FK_DistanceRange_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[DistanceRange] CHECK CONSTRAINT [FK_DistanceRange_UserUpdated]
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
ALTER TABLE [dbo].[FreightState]  WITH CHECK ADD  CONSTRAINT [FK_FreightState_StateType] FOREIGN KEY([StateTypeId])
REFERENCES [dbo].[StateType] ([Id])
GO
ALTER TABLE [dbo].[FreightState] CHECK CONSTRAINT [FK_FreightState_StateType]
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
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Entity] FOREIGN KEY([EntityId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Entity]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Feature]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_FreightState] FOREIGN KEY([StateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_FreightState]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_Policy] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policy] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_Policy]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_RefEntity] FOREIGN KEY([ReferenceId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_RefEntity]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_UserInserted]
GO
ALTER TABLE [dbo].[GridPolicy]  WITH CHECK ADD  CONSTRAINT [FK_GridPolicy_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[GridPolicy] CHECK CONSTRAINT [FK_GridPolicy_UserUpdated]
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
ALTER TABLE [dbo].[Ledger]  WITH CHECK ADD  CONSTRAINT [FK_Ledger_Currency] FOREIGN KEY([CurencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Ledger] CHECK CONSTRAINT [FK_Ledger_Currency]
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
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Accessory] FOREIGN KEY([AccessoryId])
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Department_Accountable] FOREIGN KEY([AccountableDepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Department_Accountable]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_FreightState]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_Accountable] FOREIGN KEY([AccountableUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_Accountable]
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
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_UserInserted]
GO
ALTER TABLE [dbo].[OrderComposition]  WITH CHECK ADD  CONSTRAINT [FK_OrderComposition_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderComposition] CHECK CONSTRAINT [FK_OrderComposition_UserUpdated]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_CommodityType]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ContainerType] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ContainerType]
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
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_StackDirection] FOREIGN KEY([StackDirectionId])
REFERENCES [dbo].[StackDirection] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_StackDirection]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Terminal_EmptyContFrom] FOREIGN KEY([EmptyContFromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Terminal_EmptyContFrom]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Terminal_EmptyContTo] FOREIGN KEY([EmptyContToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Terminal_EmptyContTo]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Terminal_From] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Terminal_From]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Terminal_To] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Terminal_To]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Timebox] FOREIGN KEY([TimeboxId])
REFERENCES [dbo].[Timebox] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Timebox]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_TruckType] FOREIGN KEY([TruckTypeId])
REFERENCES [dbo].[TruckType] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_TruckType]
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
ALTER TABLE [dbo].[PriceType]  WITH CHECK ADD  CONSTRAINT [FK_PriceType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PriceType] CHECK CONSTRAINT [FK_PriceType_UserInserted]
GO
ALTER TABLE [dbo].[PriceType]  WITH CHECK ADD  CONSTRAINT [FK_PriceType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PriceType] CHECK CONSTRAINT [FK_PriceType_UserUpdated]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CommodityType] FOREIGN KEY([CommodityTypeId])
REFERENCES [dbo].[CommodityType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CommodityType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_ContainerRange] FOREIGN KEY([ContainerRangeId])
REFERENCES [dbo].[ContainerRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_ContainerRange]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_ContainerType] FOREIGN KEY([ContainerTypeId])
REFERENCES [dbo].[ContainerType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_ContainerType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Currency]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_CustomerGroup]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_DistanceRange] FOREIGN KEY([DistanceRangeId])
REFERENCES [dbo].[DistanceRange] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_DistanceRange]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_PriceType] FOREIGN KEY([PriceTypeId])
REFERENCES [dbo].[PriceType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_PriceType]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalEmptyContFrom] FOREIGN KEY([EmptyContFromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalEmptyContFrom]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TerminalEmptyContTo] FOREIGN KEY([EmptyContToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TerminalEmptyContTo]
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
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_TruckType] FOREIGN KEY([TruckTypeId])
REFERENCES [dbo].[TruckType] ([Id])
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_TruckType]
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
ALTER TABLE [dbo].[StateType]  WITH CHECK ADD  CONSTRAINT [FK_StateType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StateType] CHECK CONSTRAINT [FK_StateType_UserInserted]
GO
ALTER TABLE [dbo].[StateType]  WITH CHECK ADD  CONSTRAINT [FK_StateType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[StateType] CHECK CONSTRAINT [FK_StateType_UserUpdated]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_Currency]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_Order]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_OrderDetail]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_PriceType] FOREIGN KEY([PriceTypeId])
REFERENCES [dbo].[PriceType] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_PriceType]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_SurchargeType] FOREIGN KEY([SurchargeTypeId])
REFERENCES [dbo].[SurchargeType] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_SurchargeType]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserInserted]
GO
ALTER TABLE [dbo].[Surcharge]  WITH CHECK ADD  CONSTRAINT [FK_Surcharge_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Surcharge] CHECK CONSTRAINT [FK_Surcharge_UserUpdated]
GO
ALTER TABLE [dbo].[SurchargeType]  WITH CHECK ADD  CONSTRAINT [FK_SurchargeType_PriceType] FOREIGN KEY([PriceTypeId])
REFERENCES [dbo].[PriceType] ([Id])
GO
ALTER TABLE [dbo].[SurchargeType] CHECK CONSTRAINT [FK_SurchargeType_PriceType]
GO
ALTER TABLE [dbo].[SurchargeType]  WITH CHECK ADD  CONSTRAINT [FK_SurchargeType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SurchargeType] CHECK CONSTRAINT [FK_SurchargeType_UserInserted]
GO
ALTER TABLE [dbo].[SurchargeType]  WITH CHECK ADD  CONSTRAINT [FK_SurchargeType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[SurchargeType] CHECK CONSTRAINT [FK_SurchargeType_UserUpdated]
GO
ALTER TABLE [dbo].[TaskState]  WITH CHECK ADD  CONSTRAINT [FK_TaskState_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskState] CHECK CONSTRAINT [FK_TaskState_UserInserted]
GO
ALTER TABLE [dbo].[TaskState]  WITH CHECK ADD  CONSTRAINT [FK_TaskState_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TaskState] CHECK CONSTRAINT [FK_TaskState_UserUpdated]
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
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_UserInserted]
GO
ALTER TABLE [dbo].[TransitionAction]  WITH CHECK ADD  CONSTRAINT [FK_TransitionAction_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TransitionAction] CHECK CONSTRAINT [FK_TransitionAction_UserUpdated]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_Branch]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_Currency]
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
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_Vendor]
GO
ALTER TABLE [dbo].[TruckMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[TruckMaintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Currency]
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
ALTER TABLE [dbo].[TruckMaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Accessory] FOREIGN KEY([AccessoryId])
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
ALTER TABLE [dbo].[UoM]  WITH CHECK ADD  CONSTRAINT [FK_UoM_UomType] FOREIGN KEY([UomTypeId])
REFERENCES [dbo].[UomType] ([Id])
GO
ALTER TABLE [dbo].[UoM] CHECK CONSTRAINT [FK_UoM_UomType]
GO
ALTER TABLE [dbo].[UoM]  WITH CHECK ADD  CONSTRAINT [FK_UoM_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UoM] CHECK CONSTRAINT [FK_UoM_UserInserted]
GO
ALTER TABLE [dbo].[UoM]  WITH CHECK ADD  CONSTRAINT [FK_UoM_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UoM] CHECK CONSTRAINT [FK_UoM_UserUpdated]
GO
ALTER TABLE [dbo].[UomType]  WITH CHECK ADD  CONSTRAINT [FK_UomType_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UomType] CHECK CONSTRAINT [FK_UomType_UserInserted]
GO
ALTER TABLE [dbo].[UomType]  WITH CHECK ADD  CONSTRAINT [FK_UomType_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UomType] CHECK CONSTRAINT [FK_UomType_UserUpdated]
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
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_ComponentGroup] FOREIGN KEY([ComponentGroupId])
REFERENCES [dbo].[ComponentGroup] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_ComponentGroup]
GO
ALTER TABLE [dbo].[UserInterface]  WITH CHECK ADD  CONSTRAINT [FK_UserInterface_Entity] FOREIGN KEY([ReferenceId])
REFERENCES [dbo].[Entity] ([Id])
GO
ALTER TABLE [dbo].[UserInterface] CHECK CONSTRAINT [FK_UserInterface_Entity]
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
ALTER TABLE [dbo].[VolumeRange]  WITH CHECK ADD  CONSTRAINT [FK_VolumeRange_UoM] FOREIGN KEY([UomId])
REFERENCES [dbo].[UoM] ([Id])
GO
ALTER TABLE [dbo].[VolumeRange] CHECK CONSTRAINT [FK_VolumeRange_UoM]
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
ALTER TABLE [dbo].[WeightRange]  WITH CHECK ADD  CONSTRAINT [FK_WeightRange_UoM] FOREIGN KEY([UomId])
REFERENCES [dbo].[UoM] ([Id])
GO
ALTER TABLE [dbo].[WeightRange] CHECK CONSTRAINT [FK_WeightRange_UoM]
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
