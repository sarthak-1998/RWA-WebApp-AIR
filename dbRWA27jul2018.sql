USE [master]
GO
/****** Object:  Database [rwa]    Script Date: 27-07-2018 05:42:18 ******/
CREATE DATABASE [rwa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rwa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\rwa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rwa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\rwa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [rwa] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rwa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rwa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rwa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rwa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rwa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rwa] SET ARITHABORT OFF 
GO
ALTER DATABASE [rwa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rwa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rwa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rwa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rwa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rwa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rwa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rwa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rwa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rwa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rwa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rwa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rwa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rwa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rwa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rwa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rwa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rwa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rwa] SET  MULTI_USER 
GO
ALTER DATABASE [rwa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rwa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rwa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rwa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [rwa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'rwa', N'ON'
GO
ALTER DATABASE [rwa] SET QUERY_STORE = OFF
GO
USE [rwa]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [rwa]
GO
/****** Object:  Table [dbo].[comp_status_type]    Script Date: 27-07-2018 05:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comp_status_type](
	[comp_status_id] [int] IDENTITY(1,1) NOT NULL,
	[comp_status_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_comp_status_type] PRIMARY KEY CLUSTERED 
(
	[comp_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[complaint]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complaint](
	[comp_id] [int] IDENTITY(1,1) NOT NULL,
	[ctype_id] [int] NOT NULL,
	[r_id] [int] NOT NULL,
	[c_des] [nvarchar](350) NOT NULL,
	[comp_dt_create] [datetime] NOT NULL,
	[resolved_flag] [int] NULL,
	[resolvedon] [datetime] NULL,
	[resolvedby_offid] [int] NULL,
 CONSTRAINT [PK_complaint] PRIMARY KEY CLUSTERED 
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[complaint_type]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complaint_type](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_complaint_type] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Officer]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Officer](
	[officerid] [int] IDENTITY(1,1) NOT NULL,
	[Officer] [nvarchar](50) NOT NULL,
	[usertypeid] [int] NOT NULL,
	[srno] [int] NOT NULL,
 CONSTRAINT [PK_Officer] PRIMARY KEY CLUSTERED 
(
	[officerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[R_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Date_Of_Birth] [varchar](20) NOT NULL,
	[Mobile] [numeric](10, 0) NOT NULL,
	[mob_flag] [bit] NOT NULL,
	[Email_ID] [nvarchar](30) NOT NULL,
	[em_flag] [bit] NULL,
	[Office] [nvarchar](150) NOT NULL,
	[Designation] [nvarchar](100) NULL,
	[Blood_Group] [nvarchar](4) NULL,
	[Flat_type] [char](2) NOT NULL,
	[Block_no] [varchar](5) NOT NULL,
	[Flat_no] [int] NOT NULL,
	[no_family] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
	[Uploadfilename] [nvarchar](50) NULL,
	[verifyuserflag] [bit] NULL,
	[ccwUsertype] [int] NULL,
	[officer_id] [int] NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[R_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trn_complaint]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trn_complaint](
	[tr_com_id] [int] IDENTITY(1,1) NOT NULL,
	[comp_id] [int] NOT NULL,
	[officerid] [int] NOT NULL,
	[statusflag] [int] NOT NULL,
	[forwardtowhom] [int] NULL,
	[remarks] [nvarchar](500) NULL,
	[serialno] [int] NOT NULL,
	[DateStamp] [datetime] NOT NULL,
	[finalstatus] [bit] NULL,
	[forwardedon] [datetime] NULL,
	[resolvedon] [datetime] NULL,
	[resolvedby_offid] [int] NULL,
 CONSTRAINT [PK_trn_complaint] PRIMARY KEY CLUSTERED 
(
	[tr_com_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usertype]    Script Date: 27-07-2018 05:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usertype](
	[ccwuserid] [int] IDENTITY(1,1) NOT NULL,
	[type] [char](5) NOT NULL,
	[createdon] [datetime] NOT NULL,
	[createdby] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ccwUsertype] PRIMARY KEY CLUSTERED 
(
	[ccwuserid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[comp_status_type] ON 

INSERT [dbo].[comp_status_type] ([comp_status_id], [comp_status_type]) VALUES (1, N'Resolved')
INSERT [dbo].[comp_status_type] ([comp_status_id], [comp_status_type]) VALUES (2, N'Pending')
INSERT [dbo].[comp_status_type] ([comp_status_id], [comp_status_type]) VALUES (3, N'Forwarded')
SET IDENTITY_INSERT [dbo].[comp_status_type] OFF
SET IDENTITY_INSERT [dbo].[complaint] ON 

INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (9, 2, 1, N'hgiuyiyuyfddfhjgkjituytujkhk', CAST(N'2018-07-10T17:30:36.113' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (10, 1, 0, N'sdasd', CAST(N'2018-07-10T17:30:54.120' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (11, 1, 0, N'as', CAST(N'2018-07-11T11:23:43.110' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (12, 1, 0, N'as', CAST(N'2018-07-11T11:25:14.017' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (13, 1, 1, N'asds', CAST(N'2018-07-11T11:26:16.817' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (14, 1, 1, N'fan ', CAST(N'2018-07-11T11:33:38.307' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (15, 1, 1, N'gg', CAST(N'2018-07-11T11:35:28.087' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (16, 1, 1, N'das', CAST(N'2018-07-11T11:36:41.990' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (17, 1, 0, N'fa', CAST(N'2018-07-11T11:37:31.340' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (18, 1, 0, N'dd', CAST(N'2018-07-11T11:39:56.943' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (19, 1, 0, N'dd', CAST(N'2018-07-11T11:40:08.180' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (20, 1, 0, N'bmhmjh', CAST(N'2018-07-11T11:40:58.490' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (21, 1, 0, N'joiuouo', CAST(N'2018-07-11T11:54:43.033' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (22, 1, 0, N'yufyfuyutyyutui', CAST(N'2018-07-11T11:57:07.300' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (23, 1, 0, N'yufyfuyutyyutui', CAST(N'2018-07-11T11:58:35.630' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (24, 1, 0, N'ytututuiyiuyiu', CAST(N'2018-07-11T11:59:59.403' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (25, 1, 0, N'jkhkhkjhk', CAST(N'2018-07-11T12:00:35.337' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (26, 1, 0, N'ohhyiyuyrtyyugh', CAST(N'2018-07-11T12:05:48.773' AS DateTime), 2, NULL, NULL)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (27, 2, 1, N'testing for civil', CAST(N'2018-07-11T14:01:22.423' AS DateTime), 1, CAST(N'2018-07-25T16:21:08.800' AS DateTime), 6)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (28, 2, 1, N'sdsds', CAST(N'2018-07-12T12:51:56.723' AS DateTime), 1, CAST(N'2018-07-25T16:39:51.073' AS DateTime), 6)
INSERT [dbo].[complaint] ([comp_id], [ctype_id], [r_id], [c_des], [comp_dt_create], [resolved_flag], [resolvedon], [resolvedby_offid]) VALUES (29, 1, 1, N'test', CAST(N'2018-07-27T15:52:37.123' AS DateTime), 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[complaint] OFF
SET IDENTITY_INSERT [dbo].[complaint_type] ON 

INSERT [dbo].[complaint_type] ([c_id], [c_type]) VALUES (1, N'Electrical')
INSERT [dbo].[complaint_type] ([c_id], [c_type]) VALUES (2, N'Civil')
SET IDENTITY_INSERT [dbo].[complaint_type] OFF
SET IDENTITY_INSERT [dbo].[Officer] ON 

INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (1, N'JE(E)', 1, 1)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (2, N'AE(E)', 1, 2)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (3, N'EE(E)', 1, 3)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (4, N'CE(E)', 1, 4)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (5, N'JE(C)', 2, 1)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (6, N'AE(C)', 2, 2)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (7, N'EE(C)', 2, 3)
INSERT [dbo].[Officer] ([officerid], [Officer], [usertypeid], [srno]) VALUES (8, N'CE(C)', 2, 4)
SET IDENTITY_INSERT [dbo].[Officer] OFF
SET IDENTITY_INSERT [dbo].[registration] ON 

INSERT [dbo].[registration] ([R_id], [Name], [Date_Of_Birth], [Mobile], [mob_flag], [Email_ID], [em_flag], [Office], [Designation], [Blood_Group], [Flat_type], [Block_no], [Flat_no], [no_family], [password], [Uploadfilename], [verifyuserflag], [ccwUsertype], [officer_id]) VALUES (1, N'Sarthak', N'23/02/1997', CAST(8920583321 AS Numeric(10, 0)), 0, N's', 0, N'A', N'E', N'O', N'A ', N'A', 23, 4, N'p', NULL, 1, 0, NULL)
INSERT [dbo].[registration] ([R_id], [Name], [Date_Of_Birth], [Mobile], [mob_flag], [Email_ID], [em_flag], [Office], [Designation], [Blood_Group], [Flat_type], [Block_no], [Flat_no], [no_family], [password], [Uploadfilename], [verifyuserflag], [ccwUsertype], [officer_id]) VALUES (2, N'Priyank Saxena', N'23/02/1987', CAST(9887555622 AS Numeric(10, 0)), 0, N'priyankglb2012@gmail.com', 0, N'Akashwani Bhawan', N'JE', N'O', N'D ', N'D', 12, 4, N'priyank', NULL, 1, 1, 1)
INSERT [dbo].[registration] ([R_id], [Name], [Date_Of_Birth], [Mobile], [mob_flag], [Email_ID], [em_flag], [Office], [Designation], [Blood_Group], [Flat_type], [Block_no], [Flat_no], [no_family], [password], [Uploadfilename], [verifyuserflag], [ccwUsertype], [officer_id]) VALUES (3, N'Shweta Tyagi', N'17/09/1998', CAST(9876566566 AS Numeric(10, 0)), 0, N'shweta@gmail.com', 0, N'Akashwani Bhawna', N'JE', N'AB+', N'C ', N'C', 5, 5, N'shweta', NULL, 1, 2, 5)
INSERT [dbo].[registration] ([R_id], [Name], [Date_Of_Birth], [Mobile], [mob_flag], [Email_ID], [em_flag], [Office], [Designation], [Blood_Group], [Flat_type], [Block_no], [Flat_no], [no_family], [password], [Uploadfilename], [verifyuserflag], [ccwUsertype], [officer_id]) VALUES (5, N'pritam', N'17/08/1998', CAST(1236547896 AS Numeric(10, 0)), 0, N'p@gmail.com', 0, N'abc', N'AE', N'A', N'A ', N'A', 12, 4, N'p', NULL, 1, 2, 6)
INSERT [dbo].[registration] ([R_id], [Name], [Date_Of_Birth], [Mobile], [mob_flag], [Email_ID], [em_flag], [Office], [Designation], [Blood_Group], [Flat_type], [Block_no], [Flat_no], [no_family], [password], [Uploadfilename], [verifyuserflag], [ccwUsertype], [officer_id]) VALUES (7, N'r3r23', N'23/02/1988', CAST(9868677300 AS Numeric(10, 0)), 0, N'pri@gmail.com', 0, N'e', N'fsfs', N'd', N'we', N'2', 22, 3, N'ffee', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[registration] OFF
SET IDENTITY_INSERT [dbo].[trn_complaint] ON 

INSERT [dbo].[trn_complaint] ([tr_com_id], [comp_id], [officerid], [statusflag], [forwardtowhom], [remarks], [serialno], [DateStamp], [finalstatus], [forwardedon], [resolvedon], [resolvedby_offid]) VALUES (1, 27, 5, 3, 6, N'fhdhg', 1, CAST(N'2018-07-11T14:01:22.427' AS DateTime), 1, CAST(N'2018-07-25T15:17:14.540' AS DateTime), CAST(N'2018-07-25T16:21:08.800' AS DateTime), 6)
INSERT [dbo].[trn_complaint] ([tr_com_id], [comp_id], [officerid], [statusflag], [forwardtowhom], [remarks], [serialno], [DateStamp], [finalstatus], [forwardedon], [resolvedon], [resolvedby_offid]) VALUES (2, 28, 5, 3, 6, N'test', 1, CAST(N'2018-07-12T12:51:56.727' AS DateTime), 1, CAST(N'2018-07-25T16:38:06.460' AS DateTime), CAST(N'2018-07-25T16:39:51.073' AS DateTime), 6)
INSERT [dbo].[trn_complaint] ([tr_com_id], [comp_id], [officerid], [statusflag], [forwardtowhom], [remarks], [serialno], [DateStamp], [finalstatus], [forwardedon], [resolvedon], [resolvedby_offid]) VALUES (10, 27, 6, 1, NULL, NULL, 2, CAST(N'2018-07-25T15:17:14.540' AS DateTime), 1, NULL, CAST(N'2018-07-25T16:21:08.800' AS DateTime), 6)
INSERT [dbo].[trn_complaint] ([tr_com_id], [comp_id], [officerid], [statusflag], [forwardtowhom], [remarks], [serialno], [DateStamp], [finalstatus], [forwardedon], [resolvedon], [resolvedby_offid]) VALUES (11, 28, 6, 1, NULL, NULL, 2, CAST(N'2018-07-25T16:38:06.523' AS DateTime), 1, NULL, CAST(N'2018-07-25T16:39:51.073' AS DateTime), 6)
INSERT [dbo].[trn_complaint] ([tr_com_id], [comp_id], [officerid], [statusflag], [forwardtowhom], [remarks], [serialno], [DateStamp], [finalstatus], [forwardedon], [resolvedon], [resolvedby_offid]) VALUES (12, 29, 1, 2, NULL, NULL, 1, CAST(N'2018-07-27T15:52:37.400' AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[trn_complaint] OFF
SET IDENTITY_INSERT [dbo].[Usertype] ON 

INSERT [dbo].[Usertype] ([ccwuserid], [type], [createdon], [createdby]) VALUES (1, N'E    ', CAST(N'2018-07-06T15:36:29.647' AS DateTime), N'IT')
INSERT [dbo].[Usertype] ([ccwuserid], [type], [createdon], [createdby]) VALUES (2, N'C    ', CAST(N'2018-07-06T15:36:38.083' AS DateTime), N'IT')
INSERT [dbo].[Usertype] ([ccwuserid], [type], [createdon], [createdby]) VALUES (3, N'Admin', CAST(N'2018-07-06T16:01:13.197' AS DateTime), N'IT')
SET IDENTITY_INSERT [dbo].[Usertype] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__registra__B795559E6F4CA634]    Script Date: 27-07-2018 05:42:20 ******/
ALTER TABLE [dbo].[registration] ADD UNIQUE NONCLUSTERED 
(
	[Email_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[complaint] ADD  CONSTRAINT [DF_complaint_resolved_flag]  DEFAULT ((2)) FOR [resolved_flag]
GO
ALTER TABLE [dbo].[registration] ADD  CONSTRAINT [DF_registration_mob_flag]  DEFAULT ((0)) FOR [mob_flag]
GO
ALTER TABLE [dbo].[registration] ADD  CONSTRAINT [DF_registration_em_flag]  DEFAULT ((0)) FOR [em_flag]
GO
ALTER TABLE [dbo].[registration] ADD  CONSTRAINT [DF_registration_verifyuserflag]  DEFAULT ((0)) FOR [verifyuserflag]
GO
ALTER TABLE [dbo].[trn_complaint] ADD  CONSTRAINT [DF_trn_complaint_srno]  DEFAULT ((1)) FOR [serialno]
GO
ALTER TABLE [dbo].[trn_complaint] ADD  CONSTRAINT [DF_trn_complaint_finalstatus]  DEFAULT ((0)) FOR [finalstatus]
GO
ALTER TABLE [dbo].[Usertype] ADD  CONSTRAINT [DF_ccwUsertype_createdon]  DEFAULT (getdate()) FOR [createdon]
GO
/****** Object:  StoredProcedure [dbo].[examplefrOut]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[examplefrOut]
(
@comidout int out,
@rid int
)
as 
begin
Select @comidout=max(comp_id) from complaint where r_id=@rid

end
GO
/****** Object:  StoredProcedure [dbo].[sp_complaint_status]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_complaint_status]
(
@statusid int=null,
@compid varchar(50)=null,
@flag int
)
as
begin
if(@flag=1)
begin
Select * from complaint_type
end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_complaint_status_type]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_complaint_status_type]
(
@comp_status_id int=null,
@comp_status_type varchar(50)=null,
@flag int
)
as
begin
if(@flag=1)
begin
Select * from comp_status_type
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_complaint_type]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_complaint_type]
(
@c_id int=null,
@c_type varchar(50)=null,
@flag int
)
as
begin
if(@flag=1)
begin
Select * from complaint_type
end
end



GO
/****** Object:  StoredProcedure [dbo].[SP_Officer]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_Officer]
(
	  @officerid int=null,
	  @Officer nvarchar(500)=null,
	  @usertypeid int=null,
	  @srno int=null,
	  @flag int
)
as
if(@flag=1)
begin

begin
select * from Officer where usertypeid=@usertypeid
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_reg_comp1]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_reg_comp1]
(
@compid int =null,
@ctypeid int=null,
@rid int=null,
@c_des nvarchar(350)=null,
@comp_dt_create datetime=null,
@resolved_flag int=null,
@je_comp_status int=null,
@remark_by_je nvarchar(50)=null,
@ae_comp_status int=null,
@remark_by_ae nvarchar(50)=null,
@ee_comp_status int=null,
@remark_by_ee nvarchar(50)=null,
@ce_comp_status int=null,
@remark_by_ce nvarchar(50)=null,


@flag int
)
as
begin
if(@flag=1)
begin
Insert into complaint (ctype_id,r_id,c_des,comp_dt_create,resolved_flag,je_comp_status,remark_by_je,ae_comp_status,remark_by_ae,ee_comp_status,remark_by_ee,ce_comp_status,remark_by_ce) values (@ctypeid,@rid,@c_des,getdate(),@resolved_flag,@je_comp_status,@remark_by_je,@ae_comp_status,@remark_by_ae,@ee_comp_status,@remark_by_ee,@ce_comp_status,@remark_by_ce)
end
if(@flag=1)
begin
Select * from complaint where r_id=@rid
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_reg_complaint]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_reg_complaint]
(
@compid int=null,
@ctypeid int=null,
@r_id int=null,
@c_des nvarchar(350)=null,
@regdt datetime=null,
@compidout int=null output,

@flag int
)
as
begin
if(@flag=1)
begin
Declare @officerid int,
@c_typeid int;

begin try
   begin transaction
      
Insert into complaint (ctype_id,r_id,c_des,comp_dt_create) values (@ctypeid,@r_id,@c_des,getdate())
select @compidout=SCOPE_IDENTITY()
select @c_typeid=ctype_id from complaint where comp_id=@compidout
if(@c_typeid=1)
begin
select @officerid=1
end
else
begin
select @officerid=5
end
insert into trn_complaint (comp_id,officerid,statusflag,serialno,DateStamp) values (@compidout,@officerid,2,1,getdate())
Commit
 end try
 begin catch
 if @@TRANCOUNT>0
 RollBack
 end catch
 end

if(@flag=2)
begin
Select * from complaint where r_id=@r_id
end
if(@flag=3)
begin
Select @compidout=max(comp_id) from complaint where r_id=@r_id
end
if (@flag =4)
begin
insert into trn_complaint (comp_id,officerid,statusflag,serialno,DateStamp) values (@compidout,@officerid,3,1,getdate()) 

end
if(@flag=5)
begin
Select cmp.comp_id,cmp.ctype_id,ut.[type] as compfor,cmp.r_id,(reg.[Name]+'-'+reg.Designation)as r_name,cmp.c_des,comp_dt_create,cmp.resolved_flag,st.comp_status_type
 from complaint as cmp
left join Usertype ut on ut.ccwuserid=cmp.ctype_id
left join registration as reg on reg.R_id=cmp.r_id
left join comp_status_type as st on st.comp_status_id=cmp.resolved_flag
where cmp.r_id=@r_id
order by comp_dt_create desc

end
if (@flag=6)
begin
Select tc.tr_com_id,tc.comp_id,tc.officerid,ofc.Officer as officername,tc.statusflag,st.comp_status_type,forwardtowhom,
tc.remarks,tc.serialno,tc.DateStamp from trn_complaint as tc
left join Officer as ofc on ofc.officerid=tc.officerid
left join comp_status_type as st on st.comp_status_id=tc.statusflag
where tc.comp_id=@compid
order by tc.DateStamp desc
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_registration]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_registration]
(
@name nvarchar(50)=null,
@dob varchar(20) =null,
@mob numeric(10,0)=null,
@mob_flag bit =null,
@Email_ID nvarchar(30) =null,
@em_flag bit =null,
@Office nvarchar(150) =null,
@Designation nvarchar(100) =null,
@Blood_Group nvarchar(4) =null,
@Flat_type char(2) =null,
@Block_no varchar(5) =null,
@Flat_no int =null,
@no_family int =null,
@password varchar(50) =null,
@Uploadfilename nvarchar(50) =null,

@flag int

)
as
begin
if(@flag=1)--insert
begin
Insert into registration ([Name],Date_Of_Birth,Mobile,Email_ID,Office,Designation,Blood_Group,Flat_type,Block_no,Flat_no,no_family,[password],
Uploadfilename) values(@name,@dob,@mob,@Email_ID,@Office,@Designation,@Blood_Group,@Flat_type,@Block_no,@Flat_no,@no_family,@password,@Uploadfilename)
end
If(@flag=2)
begin
Select Email_ID,[password],verifyuserflag,R_id,ccwUsertype,officer_id from registration where Email_ID=@Email_ID and verifyuserflag=1
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_trn_complaint]    Script Date: 27-07-2018 05:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_trn_complaint]
(
      @tr_com_id int=null,
      @comp_id int=null,
	  @officerid int=null,
	  @statusflag int=null,
	  @forwardtowhom int=null,
	  @remarks nvarchar(500)=null,
	  @srno int=null,
	  @DateStamp datetime=null,
	  
	  @flag int
)
as
begin
if(@flag=1)
begin
insert into trn_complaint (comp_id,officerid,statusflag,forwardtowhom,remarks,serialno,DateStamp) values(@comp_id,@officerid,@statusflag,@forwardtowhom,@remarks,@srno,@DateStamp)
end
if (@flag=2)
begin
select trn.comp_id,cmp.c_des,trn.DateStamp,trn.forwardtowhom,trn.officerid,ofc.Officer,trn.remarks,trn.serialno,trn.statusflag,typ.comp_status_type , trn.tr_com_id
,trn.finalstatus,iif(trn.finalstatus=0,'Pending','Resolved')as final,trn.resolvedon,trn.resolvedby_offid
from trn_complaint as trn
left join complaint as cmp on trn.comp_id=cmp.comp_id
left join Officer as ofc on ofc.officerid= trn.officerid
left join comp_status_type  as typ on typ.comp_status_id=trn.statusflag
where trn.officerid= @officerid
order by trn.DateStamp,comp_status_type
end
if (@flag=3)
begin
select trn.comp_id,cmp.c_des,trn.DateStamp,trn.forwardtowhom,trn.officerid,ofc.Officer,trn.remarks,trn.serialno,trn.statusflag,typ.comp_status_type , trn.tr_com_id
,trn.finalstatus,iif(trn.finalstatus=0,'Pending','Resolved')as final,trn.resolvedon,trn.resolvedby_offid
from trn_complaint as trn
left join complaint as cmp on trn.comp_id=cmp.comp_id
left join Officer as ofc on ofc.officerid= trn.officerid
left join comp_status_type  as typ on typ.comp_status_id=trn.statusflag
where trn.officerid= @officerid and trn.statusflag=@statusflag
order by trn.DateStamp,comp_status_type
end
if(@flag=4)
begin
declare @srn int

begin try
begin transaction   
  Select @srn = serialno from trn_complaint where tr_com_id=@tr_com_id  
  set @srn=@srn+1
Update trn_complaint set statusflag=3,forwardtowhom=@forwardtowhom,remarks=@remarks,forwardedon=getdate() where tr_com_id=@tr_com_id
insert into trn_complaint (comp_id,officerid,statusflag,serialno,DateStamp) 
values(@comp_id,@forwardtowhom,2,@srn,getdate())--new row insertion in transaction table

Commit
 end try
 begin catch
 if @@TRANCOUNT>0
 RollBack
 end catch
 end

 if (@flag=5)
begin
begin try
begin transaction   
Update trn_complaint set statusflag=1,remarks=@remarks where tr_com_id=@tr_com_id
Update trn_complaint set finalstatus=1,resolvedon=getdate(),resolvedby_offid=@officerid where comp_id= @comp_id

update complaint set resolved_flag=1,resolvedon=getdate(),resolvedby_offid=@officerid where comp_id= @comp_id

Commit
 end try
 begin catch
 if @@TRANCOUNT>0
 RollBack
 end catch
 end
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'residential id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'registration', @level2type=N'COLUMN',@level2name=N'R_id'
GO
USE [master]
GO
ALTER DATABASE [rwa] SET  READ_WRITE 
GO
