USE [master]
GO
/****** Object:  Database [BeverageStage]    Script Date: 26-Feb-24 4:52:57 PM ******/
CREATE DATABASE [BeverageStage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AmazonStage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AmazonStage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AmazonStage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AmazonStage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BeverageStage] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeverageStage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeverageStage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeverageStage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeverageStage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeverageStage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeverageStage] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeverageStage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeverageStage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeverageStage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeverageStage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeverageStage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeverageStage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeverageStage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeverageStage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeverageStage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeverageStage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeverageStage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeverageStage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeverageStage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeverageStage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeverageStage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeverageStage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeverageStage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeverageStage] SET RECOVERY FULL 
GO
ALTER DATABASE [BeverageStage] SET  MULTI_USER 
GO
ALTER DATABASE [BeverageStage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeverageStage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeverageStage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeverageStage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeverageStage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeverageStage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeverageStage', N'ON'
GO
ALTER DATABASE [BeverageStage] SET QUERY_STORE = ON
GO
ALTER DATABASE [BeverageStage] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BeverageStage]
GO
/****** Object:  Table [dbo].[StageCategoryMaster]    Script Date: 26-Feb-24 4:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageCategoryMaster](
	[CategoryID] [smallint] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageCustomerMaster]    Script Date: 26-Feb-24 4:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageCustomerMaster](
	[CID] [int] NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[City] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageProductMaster]    Script Date: 26-Feb-24 4:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageProductMaster](
	[PID] [int] NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[Price] [money] NOT NULL,
	[CategoryID] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageSales]    Script Date: 26-Feb-24 4:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageSales](
	[PID] [int] NOT NULL,
	[CID] [int] NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[QtySold] [int] NOT NULL,
	[SalesAmount] [money] NOT NULL,
	[DeliveryDate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[StageCategoryMaster] ([CategoryID], [CategoryName]) VALUES (101, N'Soft drink')
INSERT [dbo].[StageCategoryMaster] ([CategoryID], [CategoryName]) VALUES (102, N'Beer')
INSERT [dbo].[StageCategoryMaster] ([CategoryID], [CategoryName]) VALUES (103, N'Pure water')
INSERT [dbo].[StageCategoryMaster] ([CategoryID], [CategoryName]) VALUES (104, N'Others')
GO
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (1, N'Praveen T', N'Bangalore')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (2, N'John Kennedy', N'Dallas')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (3, N'Suneetha K', N'Hyderabad')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (4, N'Bhuvan Gite', N'Mysore')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (5, N'Prakash Sanjay', N'Chennai')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (6, N'Vimala Roy', N'Baltimore')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (7, N'Kiran Shetty', N'Ooty')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (8, N'Jyothi M', N'Chatham')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (9, N'Amar Kutti', N'Dayton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (10, N'Mohit Syed', N'Newark')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (11, N'Javed Ahmed', N'Towson')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (12, N'Priya Raghavan', N'Trenton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (13, N'Thulasi Ayyar', N'Providence')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (14, N'Meena Krishnan', N'Trenton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (15, N'Malathy Srinivasan', N'Warwick')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (16, N'Yashenfal', N'Dayton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (17, N'Akash Veri', N'Towson')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (18, N'Raghu Raghavan', N'Trenton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (19, N'Priya Ayyar', N'Providence')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (20, N'Meenakshi khanna', N'Trenton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (21, N'Srinivasan Raj', N'Warwick')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (22, N'Yashe Bewe', N'Dayton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (23, N'Uvan Gitee', N'Mysore')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (24, N'Keerthi Reddy', N'Chennai')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (25, N'Prakash Raj', N'Chennai')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (26, N'Vimala Reddy', N'Baltimore')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (27, N'Shilpa Shetty', N'Ooty')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (28, N'Jyothi Makak', N'Chatham')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (29, N'Amaritha Vem', N'Dayton')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (30, N'Mohit Jain', N'Newark')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (31, N'Rajpal Chaoudary', N'Hollywood')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (32, N'Ya Bewe', N'Melbourne city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (33, N'Van Gitee', N'Pembroke Park')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (34, N'Anu Gangru', N'Oakland Park city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (35, N'Shilpa Nair', N'Plantation')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (36, N'Jyothi Mathi', N'Southwest Ranches')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (37, N'Amritha Mitha', N'Pembroke Pines')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (38, N'Modi Jain', N'Satellite Beach city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (39, N'Kamal Raj', N'Waldo city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (40, N'Modi bewe', N'Newberry city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (41, N'Van Train', N'Brooker town')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (42, N'Prakash Koda', N'Balance of Bradford')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (43, N'Anand Amala', N'Cocoa Beach city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (44, N'Shila kalpa', N'Newberry city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (45, N'Jyo Mathi', N'Chennai')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (46, N'Ritha Mitha', N'Brooker town')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (47, N'Mori Kllu', N'Hampton city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (48, N'Raghu van', N'Balance of Bradford')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (49, N'Riya Ayyar', N'Cape Canaveral city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (50, N'Meena  khanan', N'Cocoa city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (51, N'Srini Raj', N'IndianHarbourBeach')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (52, N'She Bewe', N'Palm Bay city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (53, N'Yvan Datee', N'Palm Shores town')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (54, N'Latha Lali', N'Starke city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (55, N'Rakash Raj', N'Rockledge city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (56, N'Aimala Varun', N'Satellite Beach city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (57, N'Papa Shetty', N'Davie town')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (58, N'Kyothi Maak', N'Hollywood')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (59, N'James Wadi', N'Coconut Creek city')
INSERT [dbo].[StageCustomerMaster] ([CID], [Name], [City]) VALUES (60, N'Moit Lallu', N'Coral Springs city')
GO
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (1, N'Coca cola', 15.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (2, N'Mirinda sarsi', 15.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (3, N'Fanta sarsi', 10.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (4, N'Sarsi Chuong Duong', 5.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (5, N'Mirinda orange', 25.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (6, N'Fanta orange', 50.0000, 101)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (7, N'Heniken green', 20.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (8, N'Heniken crystal', 50.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (9, N'Sai Gon silver', 25.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (10, N'Sai Gon green', 30.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (11, N'Beer 333', 60.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (12, N'Tiger tradition', 35.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (13, N'Tiger crystal', 35.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (14, N'Tiger silver', 110.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (15, N'Tiger brown', 80.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (16, N'Budweiser', 60.0000, 102)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (17, N'Aquafina small', 60.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (18, N'Aquafina big', 200.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (19, N'Lavie big', 300.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (20, N'Lavie small', 50.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (21, N'Dasani small', 30.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (22, N'Dasani big', 150.0000, 103)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (23, N'Bird nest drink', 10.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (24, N'Apple juice', 30.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (25, N'Lemonade', 50.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (26, N'Da Lat strawberry juice', 100.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (27, N'strawberry juice', 30.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (28, N'Pineapple juice', 20.0000, 104)
INSERT [dbo].[StageProductMaster] ([PID], [Name], [Price], [CategoryID]) VALUES (29, N'Sugar cane juice', 15.0000, 104)
GO
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 10, CAST(N'2019-01-03T00:00:00.000' AS DateTime), 30, 6000.0000, CAST(N'2019-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (15, 12, CAST(N'2019-01-04T00:00:00.000' AS DateTime), 300, 24000.0000, CAST(N'2019-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (17, 22, CAST(N'2019-01-15T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2019-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (21, 26, CAST(N'2019-01-16T00:00:00.000' AS DateTime), 80, 2400.0000, CAST(N'2019-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (28, 30, CAST(N'2019-01-17T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2019-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (29, 36, CAST(N'2019-01-18T00:00:00.000' AS DateTime), 150, 450000.0000, CAST(N'2019-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (20, 33, CAST(N'2019-01-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2019-01-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (11, 10, CAST(N'2019-01-24T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2019-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 60, CAST(N'2019-01-25T00:00:00.000' AS DateTime), 30, 18000.0000, CAST(N'2019-01-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (2, 10, CAST(N'2019-01-26T00:00:00.000' AS DateTime), 30, 300.0000, CAST(N'2019-01-29T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (4, 10, CAST(N'2019-02-03T00:00:00.000' AS DateTime), 30, 810000.0000, CAST(N'2019-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 12, CAST(N'2019-02-04T00:00:00.000' AS DateTime), 100, 10000.0000, CAST(N'2019-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (12, 22, CAST(N'2019-02-15T00:00:00.000' AS DateTime), 30, 1050.0000, CAST(N'2019-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (8, 26, CAST(N'2019-02-16T00:00:00.000' AS DateTime), 80, 8000.0000, CAST(N'2019-02-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 30, CAST(N'2019-02-17T00:00:00.000' AS DateTime), 300, 30000.0000, CAST(N'2019-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 36, CAST(N'2019-02-18T00:00:00.000' AS DateTime), 150, 1800000.0000, CAST(N'2019-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2019-02-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2019-02-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 10, CAST(N'2019-02-24T00:00:00.000' AS DateTime), 50, 5000.0000, CAST(N'2019-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2019-02-25T00:00:00.000' AS DateTime), 100, 20000.0000, CAST(N'2019-02-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2019-02-26T00:00:00.000' AS DateTime), 90, 900.0000, CAST(N'2019-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 10, CAST(N'2020-03-03T00:00:00.000' AS DateTime), 30, 3000.0000, CAST(N'2020-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 12, CAST(N'2020-03-04T00:00:00.000' AS DateTime), 300, 9000.0000, CAST(N'2020-03-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 22, CAST(N'2020-03-15T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2020-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (26, 26, CAST(N'2020-03-16T00:00:00.000' AS DateTime), 80, 8000.0000, CAST(N'2020-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (28, 30, CAST(N'2020-03-17T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2020-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 36, CAST(N'2020-03-18T00:00:00.000' AS DateTime), 150, 4500.0000, CAST(N'2020-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (8, 33, CAST(N'2020-03-23T00:00:00.000' AS DateTime), 30, 2250.0000, CAST(N'2020-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2020-03-24T00:00:00.000' AS DateTime), 30, 300.0000, CAST(N'2020-03-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 60, CAST(N'2020-03-25T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2020-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2020-03-26T00:00:00.000' AS DateTime), 30, 15000.0000, CAST(N'2020-03-29T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 56, CAST(N'2020-04-03T00:00:00.000' AS DateTime), 300, 7500.0000, CAST(N'2020-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 12, CAST(N'2020-04-04T00:00:00.000' AS DateTime), 100, 50000.0000, CAST(N'2020-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 46, CAST(N'2020-04-15T00:00:00.000' AS DateTime), 30, 1050.0000, CAST(N'2020-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 26, CAST(N'2020-04-16T00:00:00.000' AS DateTime), 80, 5600000.0000, CAST(N'2020-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 39, CAST(N'2020-04-17T00:00:00.000' AS DateTime), 300, 300000.0000, CAST(N'2020-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 36, CAST(N'2020-04-18T00:00:00.000' AS DateTime), 150, 450000.0000, CAST(N'2020-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2020-04-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2020-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 30, CAST(N'2020-04-24T00:00:00.000' AS DateTime), 50, 15000.0000, CAST(N'2020-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2020-04-25T00:00:00.000' AS DateTime), 10, 25000.0000, CAST(N'2020-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (16, 12, CAST(N'2020-04-26T00:00:00.000' AS DateTime), 90, 5400.0000, CAST(N'2020-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 10, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 30, 45000.0000, CAST(N'2021-05-04T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 12, CAST(N'2021-05-04T00:00:00.000' AS DateTime), 30, 300000.0000, CAST(N'2021-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 32, CAST(N'2021-05-15T00:00:00.000' AS DateTime), 30, 36000.0000, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (14, 26, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 80, 8800.0000, CAST(N'2021-05-16T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (22, 45, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 300, 45000.0000, CAST(N'2021-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (29, 36, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 150, 450000.0000, CAST(N'2021-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2021-05-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2021-05-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 56, CAST(N'2021-05-24T00:00:00.000' AS DateTime), 30, 90000.0000, CAST(N'2021-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 60, CAST(N'2021-05-25T00:00:00.000' AS DateTime), 30, 18000.0000, CAST(N'2021-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (4, 1, CAST(N'2021-05-29T00:00:00.000' AS DateTime), 130, 130000.0000, CAST(N'2021-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 11, CAST(N'2021-06-03T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2021-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 49, CAST(N'2021-06-04T00:00:00.000' AS DateTime), 100, 2500.0000, CAST(N'2021-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 34, CAST(N'2021-06-15T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2021-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 26, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 80, 4000000.0000, CAST(N'2021-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 44, CAST(N'2021-06-17T00:00:00.000' AS DateTime), 150, 150000.0000, CAST(N'2021-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (19, 36, CAST(N'2021-06-18T00:00:00.000' AS DateTime), 150, 45000.0000, CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2021-06-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2021-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 10, CAST(N'2021-06-24T00:00:00.000' AS DateTime), 50, 5000.0000, CAST(N'2021-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2021-06-25T00:00:00.000' AS DateTime), 100, 1200.0000, CAST(N'2021-06-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2021-06-26T00:00:00.000' AS DateTime), 90, 900.0000, CAST(N'2021-06-29T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (29, 10, CAST(N'2022-07-03T00:00:00.000' AS DateTime), 30, 900.0000, CAST(N'2022-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (20, 12, CAST(N'2022-07-04T00:00:00.000' AS DateTime), 300, 45000.0000, CAST(N'2022-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (16, 22, CAST(N'2022-07-05T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2022-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (15, 26, CAST(N'2022-07-06T00:00:00.000' AS DateTime), 800, 24000.0000, CAST(N'2022-07-09T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (21, 30, CAST(N'2022-07-07T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2022-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (29, 36, CAST(N'2022-07-24T00:00:00.000' AS DateTime), 150, 450000.0000, CAST(N'2022-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (22, 33, CAST(N'2022-07-24T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2022-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 10, CAST(N'2022-07-24T00:00:00.000' AS DateTime), 60, 180000.0000, CAST(N'2022-07-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2022-07-25T00:00:00.000' AS DateTime), 30, 6000.0000, CAST(N'2022-07-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (16, 10, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 300, 18000.0000, CAST(N'2022-07-31T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 10, CAST(N'2022-08-03T00:00:00.000' AS DateTime), 30, 810000.0000, CAST(N'2022-08-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (12, 12, CAST(N'2022-08-04T00:00:00.000' AS DateTime), 100, 10000.0000, CAST(N'2022-08-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (12, 22, CAST(N'2022-08-15T00:00:00.000' AS DateTime), 30, 1050.0000, CAST(N'2022-08-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 26, CAST(N'2022-08-16T00:00:00.000' AS DateTime), 80, 8000.0000, CAST(N'2022-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 30, CAST(N'2022-08-17T00:00:00.000' AS DateTime), 300, 30000.0000, CAST(N'2022-08-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 36, CAST(N'2022-08-18T00:00:00.000' AS DateTime), 150, 1800000.0000, CAST(N'2022-08-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2022-08-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2022-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 10, CAST(N'2022-08-24T00:00:00.000' AS DateTime), 50, 5000.0000, CAST(N'2022-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2022-08-25T00:00:00.000' AS DateTime), 10, 2000.0000, CAST(N'2022-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2022-08-26T00:00:00.000' AS DateTime), 23, 230.0000, CAST(N'2022-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 10, CAST(N'2023-09-03T00:00:00.000' AS DateTime), 30, 3000.0000, CAST(N'2023-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 12, CAST(N'2023-09-04T00:00:00.000' AS DateTime), 300, 9000.0000, CAST(N'2023-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (11, 22, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2023-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (26, 26, CAST(N'2023-09-16T00:00:00.000' AS DateTime), 80, 8000.0000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (28, 30, CAST(N'2023-09-17T00:00:00.000' AS DateTime), 300, 6000.0000, CAST(N'2023-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 36, CAST(N'2023-09-18T00:00:00.000' AS DateTime), 150, 4500.0000, CAST(N'2023-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (4, 33, CAST(N'2023-09-23T00:00:00.000' AS DateTime), 30, 2250.0000, CAST(N'2023-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2023-09-24T00:00:00.000' AS DateTime), 30, 300.0000, CAST(N'2023-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (10, 60, CAST(N'2023-09-25T00:00:00.000' AS DateTime), 30, 1800.0000, CAST(N'2023-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (7, 10, CAST(N'2023-09-29T00:00:00.000' AS DateTime), 30, 15000.0000, CAST(N'2023-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 56, CAST(N'2023-10-03T00:00:00.000' AS DateTime), 300, 7500.0000, CAST(N'2023-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 12, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 100, 50000.0000, CAST(N'2023-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (5, 46, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 30, 1050.0000, CAST(N'2023-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 26, CAST(N'2023-10-16T00:00:00.000' AS DateTime), 8, 560000.0000, CAST(N'2023-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (9, 39, CAST(N'2023-10-17T00:00:00.000' AS DateTime), 300, 300000.0000, CAST(N'2023-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 36, CAST(N'2023-10-18T00:00:00.000' AS DateTime), 150, 450000.0000, CAST(N'2023-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (1, 33, CAST(N'2023-10-23T00:00:00.000' AS DateTime), 30, 750000.0000, CAST(N'2023-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (6, 30, CAST(N'2023-10-24T00:00:00.000' AS DateTime), 50, 15000.0000, CAST(N'2023-10-27T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (3, 60, CAST(N'2023-10-25T00:00:00.000' AS DateTime), 10, 25000.0000, CAST(N'2023-10-28T00:00:00.000' AS DateTime))
INSERT [dbo].[StageSales] ([PID], [CID], [SaleDate], [QtySold], [SalesAmount], [DeliveryDate]) VALUES (16, 12, CAST(N'2023-10-26T00:00:00.000' AS DateTime), 90, 5400.0000, CAST(N'2023-10-29T00:00:00.000' AS DateTime))
GO
USE [master]
GO
ALTER DATABASE [BeverageStage] SET  READ_WRITE 
GO
