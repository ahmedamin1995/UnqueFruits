USE [master]
GO
/****** Object:  Database [Sales Database System]    Script Date: 22-Jul-22 11:50:29 PM ******/
CREATE DATABASE [Sales Database System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sales Database System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Sales Database System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sales Database System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Sales Database System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sales Database System] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales Database System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales Database System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales Database System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales Database System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales Database System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales Database System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales Database System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sales Database System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales Database System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales Database System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales Database System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales Database System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales Database System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales Database System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales Database System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales Database System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales Database System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales Database System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales Database System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales Database System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales Database System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales Database System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales Database System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales Database System] SET RECOVERY FULL 
GO
ALTER DATABASE [Sales Database System] SET  MULTI_USER 
GO
ALTER DATABASE [Sales Database System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales Database System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales Database System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales Database System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sales Database System] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sales Database System', N'ON'
GO
ALTER DATABASE [Sales Database System] SET QUERY_STORE = OFF
GO
USE [Sales Database System]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Sales Database System]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22-Jul-22 11:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customers_id] [int] NOT NULL,
	[Customers_Name] [nvarchar](50) NULL,
	[Customers_Code] [nvarchar](50) NULL,
	[Customers_Phone] [nvarchar](50) NULL,
	[Customers_Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 22-Jul-22 11:50:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] NOT NULL,
	[Order_id] [int] NULL,
	[Product_id] [int] NULL,
	[Quantity] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22-Jul-22 11:50:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_id] [int] NOT NULL,
	[Order_Serial] [nvarchar](50) NULL,
	[Order_Date] [datetime] NULL,
	[Order_Customer_id] [int] NULL,
	[Order_SaleRepresentID] [int] NULL,
	[Order_Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 22-Jul-22 11:50:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [int] NOT NULL,
	[Product_Name] [nvarchar](100) NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Product_MaxPrice] [decimal](18, 0) NULL,
	[Product_MinPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesRepresentatives]    Script Date: 22-Jul-22 11:50:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRepresentatives](
	[SalesRep_id] [int] NOT NULL,
	[SalesRep_Name] [nvarchar](50) NULL,
	[SalesRep_Identity] [nvarchar](50) NULL,
	[SalesRep_CommsionRate] [decimal](18, 0) NULL,
	[SalesRep_BaseSalary] [decimal](18, 0) NULL,
	[SalesRep_Phone] [nvarchar](50) NULL,
	[SalesRep_Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_SalesRepresentatives] PRIMARY KEY CLUSTERED 
(
	[SalesRep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IxUniqCustomerCode]    Script Date: 22-Jul-22 11:50:38 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxUniqCustomerCode] ON [dbo].[Customers]
(
	[Customers_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderDetailID])
REFERENCES [dbo].[Orders] ([Order_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products] ([Product_id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Order_Customer_id])
REFERENCES [dbo].[Customers] ([Customers_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SalesRepresentatives] FOREIGN KEY([Order_SaleRepresentID])
REFERENCES [dbo].[SalesRepresentatives] ([SalesRep_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_SalesRepresentatives]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Customers_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Max Product Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product_MaxPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Min Product Price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product_MinPrice'
GO
USE [master]
GO
ALTER DATABASE [Sales Database System] SET  READ_WRITE 
GO
