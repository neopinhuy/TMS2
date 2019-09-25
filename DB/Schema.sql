USE [master]
GO
/****** Object:  Database [FMS]    Script Date: 9/26/2019 12:26:14 AM ******/
CREATE DATABASE [FMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [FMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FMS] SET RECOVERY FULL 
GO
ALTER DATABASE [FMS] SET  MULTI_USER 
GO
ALTER DATABASE [FMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FMS', N'ON'
GO
ALTER DATABASE [FMS] SET QUERY_STORE = OFF
GO
USE [FMS]
GO
/****** Object:  Table [dbo].[Accessary]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessary](
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
/****** Object:  Table [dbo].[AdvancePayment]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvancePayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverId] [int] NOT NULL,
	[AdvancedMoney] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[PaymentObjectiveId] [int] NOT NULL,
	[HasInvoice] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[ShouldCountToSalary] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_AdvancePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvancePaymentProof]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvancePaymentProof](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdvancePaymentId] [int] NOT NULL,
	[Image] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_AdvancePaymentProof] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommodityType]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Container]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[ContainerMaintenance]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[ContainerMonitor]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainerMonitor](
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
/****** Object:  Table [dbo].[ContainerType]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Contract]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Coordinator]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordinator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [int] NOT NULL,
	[TruckId] [int] NOT NULL,
	[DriverId] [int] NOT NULL,
	[FromId] [int] NOT NULL,
	[ToId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Customer]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Feature]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[FreightHistory]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[FreightProof]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[FreightState]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[GroupRole]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Maintenance]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TruckId] [int] NULL,
	[ContainerId] [int] NULL,
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
/****** Object:  Table [dbo].[MaintenanceDetail]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceDetail](
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
/****** Object:  Table [dbo].[MaintenanceTicket]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[PaymentObjective]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentObjective](
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
/****** Object:  Table [dbo].[Quotation]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[RightByGroup]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[RightByRole]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[RightByUser]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Surcharge]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Terminal]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[TicketState]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Timebox]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[Truck]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[TruckPlate] [varchar](50) NOT NULL,
	[BrandName] [nvarchar](100) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
	[TruckVendorId] [int] NOT NULL,
	[Long] [float] NULL,
	[Lat] [float] NULL,
	[DriverId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](50) NOT NULL,
	[BoughtDate] [datetime2](7) NOT NULL,
	[ActiveDate] [datetime2](7) NOT NULL,
	[ExpiredDate] [nchar](10) NULL,
	[IsMaintained] [bit] NOT NULL,
	[GaraId] [int] NULL,
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
/****** Object:  Table [dbo].[TruckMonitor]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckMonitor](
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
/****** Object:  Table [dbo].[TruckState]    Script Date: 9/26/2019 12:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruckState](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[InsertedDate] [datetime2](7) NOT NULL,
	[InsertedBy] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_TruckState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/26/2019 12:26:14 AM ******/
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
	[NationalityId] [int] NOT NULL,
	[ContractId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[VendorType]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[VolumeRange]    Script Date: 9/26/2019 12:26:14 AM ******/
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
/****** Object:  Table [dbo].[WeightRange]    Script Date: 9/26/2019 12:26:14 AM ******/
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
ALTER TABLE [dbo].[Accessary]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Accessary] CHECK CONSTRAINT [FK_Accessary_Truck]
GO
ALTER TABLE [dbo].[Accessary]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessary] CHECK CONSTRAINT [FK_Accessary_UserInserted]
GO
ALTER TABLE [dbo].[Accessary]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Accessary] CHECK CONSTRAINT [FK_Accessary_UserUpdated]
GO
ALTER TABLE [dbo].[Accessary]  WITH CHECK ADD  CONSTRAINT [FK_Accessary_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Accessary] CHECK CONSTRAINT [FK_Accessary_Vendor]
GO
ALTER TABLE [dbo].[AdvancePayment]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePayment_PaymentObjective] FOREIGN KEY([PaymentObjectiveId])
REFERENCES [dbo].[PaymentObjective] ([Id])
GO
ALTER TABLE [dbo].[AdvancePayment] CHECK CONSTRAINT [FK_AdvancePayment_PaymentObjective]
GO
ALTER TABLE [dbo].[AdvancePayment]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePayment_UserDriver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AdvancePayment] CHECK CONSTRAINT [FK_AdvancePayment_UserDriver]
GO
ALTER TABLE [dbo].[AdvancePayment]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePayment_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AdvancePayment] CHECK CONSTRAINT [FK_AdvancePayment_UserInserted]
GO
ALTER TABLE [dbo].[AdvancePayment]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePayment_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AdvancePayment] CHECK CONSTRAINT [FK_AdvancePayment_UserUpdated]
GO
ALTER TABLE [dbo].[AdvancePaymentProof]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePaymentProof_AdvancePayment] FOREIGN KEY([AdvancePaymentId])
REFERENCES [dbo].[AdvancePayment] ([Id])
GO
ALTER TABLE [dbo].[AdvancePaymentProof] CHECK CONSTRAINT [FK_AdvancePaymentProof_AdvancePayment]
GO
ALTER TABLE [dbo].[AdvancePaymentProof]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePaymentProof_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AdvancePaymentProof] CHECK CONSTRAINT [FK_AdvancePaymentProof_UserInserted]
GO
ALTER TABLE [dbo].[AdvancePaymentProof]  WITH CHECK ADD  CONSTRAINT [FK_AdvancePaymentProof_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[AdvancePaymentProof] CHECK CONSTRAINT [FK_AdvancePaymentProof_UserUpdated]
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
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Assignee] FOREIGN KEY([AssigneeId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_Assignee]
GO
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_Container]
GO
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_GroupRole]
GO
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_Role]
GO
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_UserInserted]
GO
ALTER TABLE [dbo].[ContainerMonitor]  WITH CHECK ADD  CONSTRAINT [FK_ContainerMonitor_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ContainerMonitor] CHECK CONSTRAINT [FK_ContainerMonitor_UserUpdated]
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
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_Container]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_FreightState] FOREIGN KEY([FreightStateId])
REFERENCES [dbo].[FreightState] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_FreightState]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_OrderDetail] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_OrderDetail]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_TerminalFrom] FOREIGN KEY([FromId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_TerminalFrom]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_TerminalTo] FOREIGN KEY([ToId])
REFERENCES [dbo].[Terminal] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_TerminalTo]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_Truck]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_UserDriver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_UserDriver]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_UserInserted]
GO
ALTER TABLE [dbo].[Coordinator]  WITH CHECK ADD  CONSTRAINT [FK_Coordinator_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coordinator] CHECK CONSTRAINT [FK_Coordinator_UserUpdated]
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
ALTER TABLE [dbo].[FreightHistory]  WITH CHECK ADD  CONSTRAINT [FK_FreightHistory_Coordinator] FOREIGN KEY([CoordinatorId])
REFERENCES [dbo].[Coordinator] ([Id])
GO
ALTER TABLE [dbo].[FreightHistory] CHECK CONSTRAINT [FK_FreightHistory_Coordinator]
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
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Container] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Container]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[MaintenanceTicket] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_MaintenanceTicket]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Truck]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_TruckMaintenance] FOREIGN KEY([Id])
REFERENCES [dbo].[Maintenance] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_TruckMaintenance]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserAccountable] FOREIGN KEY([AccountableUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserAccountable]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserInserted]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_UserUpdated]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_TruckMaintenance_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_TruckMaintenance_Vendor]
GO
ALTER TABLE [dbo].[MaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Accessary] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessary] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Accessary]
GO
ALTER TABLE [dbo].[MaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_Maintenance] FOREIGN KEY([MaintenanceId])
REFERENCES [dbo].[Maintenance] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_Maintenance]
GO
ALTER TABLE [dbo].[MaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserInserted]
GO
ALTER TABLE [dbo].[MaintenanceDetail]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceDetail_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceDetail] CHECK CONSTRAINT [FK_MaintenanceDetail_UserUpdated]
GO
ALTER TABLE [dbo].[MaintenanceTicket]  WITH CHECK ADD  CONSTRAINT [FK_MaintenanceTicket_Accessary] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessary] ([Id])
GO
ALTER TABLE [dbo].[MaintenanceTicket] CHECK CONSTRAINT [FK_MaintenanceTicket_Accessary]
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
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Accessary] FOREIGN KEY([AccessaryId])
REFERENCES [dbo].[Accessary] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_Accessary]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_GroupRole] FOREIGN KEY([GroupRoleId])
REFERENCES [dbo].[GroupRole] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_GroupRole]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_Role]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_Truck] FOREIGN KEY([TruckId])
REFERENCES [dbo].[Truck] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_Truck]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_User]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserInserted] FOREIGN KEY([InsertedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_UserInserted]
GO
ALTER TABLE [dbo].[TruckMonitor]  WITH CHECK ADD  CONSTRAINT [FK_TruckMonitor_UserUpdated] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TruckMonitor] CHECK CONSTRAINT [FK_TruckMonitor_UserUpdated]
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
USE [master]
GO
ALTER DATABASE [FMS] SET  READ_WRITE 
GO
