USE [FMS]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 9/30/2019 2:19:16 PM ******/
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
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[CommodityType]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Container]    Script Date: 9/30/2019 2:19:17 PM ******/
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
	[UsedDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NOT NULL,
	[MaintenancePeriod] [time](7) NOT NULL,
	[NextMaintenanceDate] [datetime2](7) NOT NULL,
	[IsMaintaining] [bit] NOT NULL,
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
/****** Object:  Table [dbo].[ContainerMaintenance]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerMaintenance](
	[Id] [int] NOT NULL,
	[ContainerId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[AdvancedPaid] [float] NOT NULL,
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
 CONSTRAINT [PK_ContainerMaintenance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainerMonitorConfig]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerMonitorConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContainerId] [int] NOT NULL,
	[AssigneeId] [int] NULL,
	[RoleId] [int] NULL,
	[GroupRoleId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ContainerMonitor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainerType]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Coordination]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Customer]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Feature]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[FreightBalance]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinationId] [int] NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[Curency] [varchar](50) NOT NULL,
	[ObjectiveId] [int] NOT NULL,
	[RefferenceId] [int] NULL,
	[Entity] [varchar](30) NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_FreightBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinatorId] [int] NOT NULL,
	[FreightStateId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[FreightProof]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[FreightState]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreightState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
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
/****** Object:  Table [dbo].[GroupRole]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Objective]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[IsContainer] [bit] NOT NULL,
	[TotalContainer] [int] NULL,
	[ContainerTypeId] [int] NULL,
	[VendorId] [int] NULL,
	[CommodityTypeId] [int] NOT NULL,
	[Weight] [float] NULL,
	[Volume] [float] NULL,
	[TimeboxId] [int] NULL,
	[QuotationId] [int] NULL,
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[PaymentApproval]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentApproval](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApproverId] [int] NOT NULL,
	[AdvancePaymentId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[PaymentApprovalConfig]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentApprovalConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[GroupRoleId] [int] NULL,
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 9/30/2019 2:19:17 PM ******/
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
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[RightByGroup]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightByGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanWrite] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_RightByGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RightByRole]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightByRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanWrite] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_RightByRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RightByUser]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RightByUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanWrite] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_RightByUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[GroupId] [int] NULL,
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
/****** Object:  Table [dbo].[Surcharge]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surcharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[Terminal]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[TicketState]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Timebox]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[Truck]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckPlate] [varchar](50) NOT NULL,
	[FreightStateId] [int] NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[VendorId] [int] NOT NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[DriverId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[BoughtDate] [datetime2](7) NOT NULL,
	[ActiveDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [datetime2](7) NULL,
	[MaintenanceStart] [datetime2](7) NULL,
	[MaintenanceEnd] [datetime2](7) NULL,
	[NextMaintenanceDate] [datetime2](7) NOT NULL,
	[MaintenancePeriod] [time](7) NOT NULL,
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
/****** Object:  Table [dbo].[TruckMaintenance]    Script Date: 9/30/2019 2:19:17 PM ******/
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
	[AdvancedPaid] [float] NOT NULL,
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
/****** Object:  Table [dbo].[TruckMaintenanceDetail]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMaintenanceDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceId] [int] NOT NULL,
	[AccessaryId] [int] NULL,
	[Detail] [nvarchar](200) NOT NULL,
	[Price] [float] NOT NULL,
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
/****** Object:  Table [dbo].[TruckMonitorConfig]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMonitorConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NOT NULL,
	[AccessaryId] [int] NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
	[GroupRoleId] [int] NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 9/30/2019 2:19:17 PM ******/
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
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBalance]    Script Date: 9/30/2019 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBalance](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[Currency] [varchar](50) NOT NULL,
	[HasInvoice] [int] NOT NULL,
	[InvoiceImage] [nvarchar](1000) NULL,
	[PaymentObjectiveId] [int] NOT NULL,
	[ShouldCountToSalary] [bit] NOT NULL,
	[CoordinatorId] [int] NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UserBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[VendorType]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 9/30/2019 2:19:17 PM ******/
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
/****** Object:  Table [dbo].[WeightRange]    Script Date: 9/30/2019 2:19:17 PM ******/
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
ALTER TABLE [dbo].[Container] ADD  CONSTRAINT [DF_Container_IsMaintained]  DEFAULT ((0)) FOR [IsMaintaining]
GO
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Allowance]  DEFAULT ((0)) FOR [Allowance]
GO
ALTER TABLE [dbo].[FreightBalance] ADD  CONSTRAINT [DF_FreightBalance_Debit]  DEFAULT ((0)) FOR [Debit]
GO
ALTER TABLE [dbo].[FreightBalance] ADD  CONSTRAINT [DF_FreightBalance_Credit]  DEFAULT ((0)) FOR [Credit]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_TotalContainer]  DEFAULT ((0)) FOR [TotalContainer]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Weight]  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Volume]  DEFAULT ((0)) FOR [Volume]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_TotalContainer]  DEFAULT ((0)) FOR [TotalContainer]
GO
ALTER TABLE [dbo].[Quotation] ADD  CONSTRAINT [DF_Quotation_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[UserBalance] ADD  CONSTRAINT [DF_UserBalance_Debit]  DEFAULT ((0)) FOR [Debit]
GO
ALTER TABLE [dbo].[UserBalance] ADD  CONSTRAINT [DF_UserBalance_Credit]  DEFAULT ((0)) FOR [Credit]
GO
ALTER TABLE [dbo].[UserBalance] ADD  CONSTRAINT [DF_UserBalance_HasInvoice]  DEFAULT ((0)) FOR [HasInvoice]
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
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Assignee] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_Assignee]
GO
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_Container]
GO
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_GroupRole]
GO
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_Role]
GO
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_UserInserted]
GO
ALTER TABLE [dbo].[ContainerMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitorConfig] CHECK CONSTRAINT [FK_ContainerMonitor_UserUpdated]
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
ALTER TABLE [dbo].[Coordination]  WITH CHECK ADD  CONSTRAINT [FK_Coordination_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Coordination] CHECK CONSTRAINT [FK_Coordination_OrderDetail]
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
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_Feature_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_Feature_UserInserted]
GO
ALTER TABLE [dbo].[FreightBalance]  WITH CHECK ADD  CONSTRAINT [FK_FreightBalance_Coordination] FOREIGN KEY([CoordinationId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[FreightBalance] CHECK CONSTRAINT [FK_FreightBalance_Coordination]
GO
ALTER TABLE [dbo].[FreightBalance]  WITH CHECK ADD  CONSTRAINT [FK_FreightBalance_Objective] FOREIGN KEY([ObjectiveId])
REFERENCES [dbo].[Objective] ([Id])
GO
ALTER TABLE [dbo].[FreightBalance] CHECK CONSTRAINT [FK_FreightBalance_Objective]
GO
ALTER TABLE [dbo].[FreightBalance]  WITH CHECK ADD  CONSTRAINT [FK_FreightBalance_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightBalance] CHECK CONSTRAINT [FK_FreightBalance_UserInserted]
GO
ALTER TABLE [dbo].[FreightBalance]  WITH CHECK ADD  CONSTRAINT [FK_FreightBalance_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[FreightBalance] CHECK CONSTRAINT [FK_FreightBalance_UserUpdated]
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
ALTER TABLE [dbo].[PaymentApprovalConfig]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[PaymentApprovalConfig] CHECK CONSTRAINT [FK_ApprovalConfig_GroupRole]
GO
ALTER TABLE [dbo].[PaymentApprovalConfig]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[PaymentApprovalConfig] CHECK CONSTRAINT [FK_ApprovalConfig_Role]
GO
ALTER TABLE [dbo].[PaymentApprovalConfig]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserApprover] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentApprovalConfig] CHECK CONSTRAINT [FK_ApprovalConfig_UserApprover]
GO
ALTER TABLE [dbo].[PaymentApprovalConfig]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentApprovalConfig] CHECK CONSTRAINT [FK_ApprovalConfig_UserInserted]
GO
ALTER TABLE [dbo].[PaymentApprovalConfig]  WITH CHECK ADD  CONSTRAINT [FK_ApprovalConfig_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[PaymentApprovalConfig] CHECK CONSTRAINT [FK_ApprovalConfig_UserUpdated]
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
ALTER TABLE [dbo].[RightByGroup]  WITH CHECK ADD  CONSTRAINT [FK_RightByGroup_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[RightByGroup] CHECK CONSTRAINT [FK_RightByGroup_Feature]
GO
ALTER TABLE [dbo].[RightByGroup]  WITH CHECK ADD  CONSTRAINT [FK_RightByGroup_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByGroup] CHECK CONSTRAINT [FK_RightByGroup_UserInserted]
GO
ALTER TABLE [dbo].[RightByGroup]  WITH CHECK ADD  CONSTRAINT [FK_RightByGroup_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByGroup] CHECK CONSTRAINT [FK_RightByGroup_UserUpdated]
GO
ALTER TABLE [dbo].[RightByRole]  WITH CHECK ADD  CONSTRAINT [FK_RightByRole_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[RightByRole] CHECK CONSTRAINT [FK_RightByRole_Feature]
GO
ALTER TABLE [dbo].[RightByRole]  WITH CHECK ADD  CONSTRAINT [FK_RightByRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RightByRole] CHECK CONSTRAINT [FK_RightByRole_Role]
GO
ALTER TABLE [dbo].[RightByRole]  WITH CHECK ADD  CONSTRAINT [FK_RightByRole_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByRole] CHECK CONSTRAINT [FK_RightByRole_UserInserted]
GO
ALTER TABLE [dbo].[RightByRole]  WITH CHECK ADD  CONSTRAINT [FK_RightByRole_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByRole] CHECK CONSTRAINT [FK_RightByRole_UserUpdated]
GO
ALTER TABLE [dbo].[RightByUser]  WITH CHECK ADD  CONSTRAINT [FK_Feature_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByUser] CHECK CONSTRAINT [FK_Feature_UserUpdated]
GO
ALTER TABLE [dbo].[RightByUser]  WITH CHECK ADD  CONSTRAINT [FK_RightByUser_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByUser] CHECK CONSTRAINT [FK_RightByUser_User]
GO
ALTER TABLE [dbo].[RightByUser]  WITH CHECK ADD  CONSTRAINT [FK_RightByUser_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByUser] CHECK CONSTRAINT [FK_RightByUser_UserInserted]
GO
ALTER TABLE [dbo].[RightByUser]  WITH CHECK ADD  CONSTRAINT [FK_RightByUser_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[RightByUser] CHECK CONSTRAINT [FK_RightByUser_UserUpdated]
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
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_FreightState]
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
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Accessory] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessory] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Accessory]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_GroupRole]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Role]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_Truck]
GO
ALTER TABLE [dbo].[TruckMonitorConfig]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitorConfig] CHECK CONSTRAINT [FK_TruckMonitor_User]
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
ALTER TABLE [dbo].[UserBalance]  WITH CHECK ADD  CONSTRAINT [FK_UserBalance_Coordination] FOREIGN KEY([CoordinatorId])
REFERENCES [dbo].[Coordination] ([Id])
GO
ALTER TABLE [dbo].[UserBalance] CHECK CONSTRAINT [FK_UserBalance_Coordination]
GO
ALTER TABLE [dbo].[UserBalance]  WITH CHECK ADD  CONSTRAINT [FK_UserBalance_Objective] FOREIGN KEY([PaymentObjectiveId])
REFERENCES [dbo].[Objective] ([Id])
GO
ALTER TABLE [dbo].[UserBalance] CHECK CONSTRAINT [FK_UserBalance_Objective]
GO
ALTER TABLE [dbo].[UserBalance]  WITH CHECK ADD  CONSTRAINT [FK_UserBalance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserBalance] CHECK CONSTRAINT [FK_UserBalance_User]
GO
ALTER TABLE [dbo].[UserBalance]  WITH CHECK ADD  CONSTRAINT [FK_UserBalance_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserBalance] CHECK CONSTRAINT [FK_UserBalance_UserInserted]
GO
ALTER TABLE [dbo].[UserBalance]  WITH CHECK ADD  CONSTRAINT [FK_UserBalance_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserBalance] CHECK CONSTRAINT [FK_UserBalance_UserUpdated]
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
