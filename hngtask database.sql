USE [master]
GO
/****** Object:  Database [hngtask]    Script Date: 2024-07-29 10:00:27 PM ******/
CREATE DATABASE [hngtask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hngtask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\hngtask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hngtask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\hngtask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [hngtask] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hngtask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hngtask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hngtask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hngtask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hngtask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hngtask] SET ARITHABORT OFF 
GO
ALTER DATABASE [hngtask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hngtask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hngtask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hngtask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hngtask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hngtask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hngtask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hngtask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hngtask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hngtask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hngtask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hngtask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hngtask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hngtask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hngtask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hngtask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hngtask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hngtask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hngtask] SET  MULTI_USER 
GO
ALTER DATABASE [hngtask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hngtask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hngtask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hngtask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hngtask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hngtask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [hngtask] SET QUERY_STORE = ON
GO
ALTER DATABASE [hngtask] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [hngtask]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 2024-07-29 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 2024-07-29 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[InvoiceID] [int] NOT NULL,
	[InvoiceDate] [date] NULL,
	[Subtotal] [float] NULL,
	[SalesTaxRate] [float] NULL,
	[SalesTax] [float] NULL,
	[TotalLabour] [float] NULL,
	[TotalParts] [float] NULL,
	[Total] [float] NULL,
	[CustomerID] [int] NULL,
	[VehicleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job]    Script Date: 2024-07-29 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job](
	[JobID] [int] NOT NULL,
	[VehicleID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[Hours] [float] NULL,
	[Rate] [float] NULL,
	[Amount] [float] NULL,
	[InvoiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parts]    Script Date: 2024-07-29 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parts](
	[PartID] [int] NOT NULL,
	[JobID] [int] NULL,
	[PartNumber] [nvarchar](50) NULL,
	[PartName] [nvarchar](255) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[Amount] [float] NULL,
	[InvoiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 2024-07-29 10:00:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[VIN] [nvarchar](50) NULL,
	[RegNumber] [nvarchar](50) NULL,
	[Mileage] [int] NULL,
	[OwnerName] [nvarchar](255) NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([CustomerID], [Name], [Address], [Phone]) VALUES (1, N'Jennifer Robinson', N'126 Nairn Ave, Winnipeg, MB, R3J 3C4', N'204-771-0784')
INSERT [dbo].[customer] ([CustomerID], [Name], [Address], [Phone]) VALUES (2, N'Michael Smith', N'250 Broadway, Winnipeg, MB, R3C 0R5', N'204-555-1234')
INSERT [dbo].[customer] ([CustomerID], [Name], [Address], [Phone]) VALUES (3, N'Sarah Johnson', N'789 Main St, Winnipeg, MB, R2W 3N2', N'204-666-5678')
INSERT [dbo].[customer] ([CustomerID], [Name], [Address], [Phone]) VALUES (4, N'Emily Brown', N'456 Elm St, Winnipeg, MB, R3M 2S5', N'204-777-9101')
INSERT [dbo].[customer] ([CustomerID], [Name], [Address], [Phone]) VALUES (5, N'David Wilson', N'123 Oak St, Winnipeg, MB, R2J 3C4', N'204-888-1112')
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
INSERT [dbo].[invoice] ([InvoiceID], [InvoiceDate], [Subtotal], [SalesTaxRate], [SalesTax], [TotalLabour], [TotalParts], [Total], [CustomerID], [VehicleID]) VALUES (12345, CAST(N'2023-09-10' AS Date), 969.87, 13, 207.33, 625, 969.87, 1802.2, 1, 1)
INSERT [dbo].[invoice] ([InvoiceID], [InvoiceDate], [Subtotal], [SalesTaxRate], [SalesTax], [TotalLabour], [TotalParts], [Total], [CustomerID], [VehicleID]) VALUES (12346, CAST(N'2023-09-15' AS Date), 325, 13, 42.25, 325, 250, 617.25, 2, 2)
INSERT [dbo].[invoice] ([InvoiceID], [InvoiceDate], [Subtotal], [SalesTaxRate], [SalesTax], [TotalLabour], [TotalParts], [Total], [CustomerID], [VehicleID]) VALUES (12347, CAST(N'2023-09-20' AS Date), 200, 13, 26, 200, 150, 376, 3, 3)
INSERT [dbo].[invoice] ([InvoiceID], [InvoiceDate], [Subtotal], [SalesTaxRate], [SalesTax], [TotalLabour], [TotalParts], [Total], [CustomerID], [VehicleID]) VALUES (12348, CAST(N'2023-09-25' AS Date), 300, 13, 39, 300, 325, 664, 4, 4)
INSERT [dbo].[invoice] ([InvoiceID], [InvoiceDate], [Subtotal], [SalesTaxRate], [SalesTax], [TotalLabour], [TotalParts], [Total], [CustomerID], [VehicleID]) VALUES (12349, CAST(N'2023-09-30' AS Date), 440, 13, 57.2, 440, 340, 837.2, 5, 5)
GO
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (1, 1, N'Diagnose front wheel vibration', 0.5, 125, 62.5, 12345)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (2, 1, N'Replace front CV Axel', 3.5, 125, 437.5, 12345)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (3, 1, N'Balance tires', 1, 125, 125, 12345)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (4, 2, N'Oil change', 1, 75, 75, 12346)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (5, 2, N'Replace brake pads', 2, 125, 250, 12346)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (6, 3, N'Replace battery', 1.5, 100, 150, 12347)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (7, 3, N'Tire rotation', 1, 50, 50, 12347)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (8, 4, N'Transmission check', 2, 150, 300, 12348)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (9, 4, N'Replace air filter', 0.5, 50, 25, 12348)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (10, 5, N'Coolant flush', 1.5, 120, 180, 12349)
INSERT [dbo].[job] ([JobID], [VehicleID], [Description], [Hours], [Rate], [Amount], [InvoiceID]) VALUES (11, 5, N'Replace spark plugs', 2, 130, 260, 12349)
GO
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (1, 2, N'23435', N'CV Axel', 1, 876.87, 876.87, 12345)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (2, 2, N'7777', N'Shop Materials', 1, 45, 45, 12345)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (3, 3, N'W187', N'Wheel Weights', 4, 12, 48, 12345)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (4, 5, N'54321', N'Brake Pads', 1, 200, 200, 12346)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (5, 6, N'67890', N'Battery', 1, 120, 120, 12347)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (6, 7, N'11223', N'Tire Rotation Kit', 1, 30, 30, 12347)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (7, 8, N'33445', N'Transmission Fluid', 1, 100, 100, 12348)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (8, 9, N'99887', N'Air Filter', 1, 25, 25, 12348)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (9, 10, N'77654', N'Coolant', 1, 60, 60, 12349)
INSERT [dbo].[parts] ([PartID], [JobID], [PartNumber], [PartName], [Quantity], [UnitPrice], [Amount], [InvoiceID]) VALUES (10, 11, N'99876', N'Spark Plugs', 4, 20, 80, 12349)
GO
SET IDENTITY_INSERT [dbo].[vehicle] ON 

INSERT [dbo].[vehicle] ([VehicleID], [Make], [Model], [Year], [Color], [VIN], [RegNumber], [Mileage], [OwnerName], [CustomerID]) VALUES (1, N'BMW', N'X5', 2012, N'Black', N'CVS123456789123-115Z', N'BMW 123', 16495, N'Jennifer Robinson', 1)
INSERT [dbo].[vehicle] ([VehicleID], [Make], [Model], [Year], [Color], [VIN], [RegNumber], [Mileage], [OwnerName], [CustomerID]) VALUES (2, N'Toyota', N'Corolla', 2015, N'White', N'TYS678901234567-876Z', N'TOY 456', 45000, N'Michael Smith', 2)
INSERT [dbo].[vehicle] ([VehicleID], [Make], [Model], [Year], [Color], [VIN], [RegNumber], [Mileage], [OwnerName], [CustomerID]) VALUES (3, N'Honda', N'Civic', 2018, N'Blue', N'HCS345678901234-123X', N'HON 789', 30000, N'Sarah Johnson', 3)
INSERT [dbo].[vehicle] ([VehicleID], [Make], [Model], [Year], [Color], [VIN], [RegNumber], [Mileage], [OwnerName], [CustomerID]) VALUES (4, N'Ford', N'Escape', 2020, N'Red', N'FES234567890123-456Y', N'FOR 987', 15000, N'Emily Brown', 4)
INSERT [dbo].[vehicle] ([VehicleID], [Make], [Model], [Year], [Color], [VIN], [RegNumber], [Mileage], [OwnerName], [CustomerID]) VALUES (5, N'Chevrolet', N'Malibu', 2016, N'Silver', N'CMS456789012345-789Z', N'CHE 321', 60000, N'David Wilson', 5)
SET IDENTITY_INSERT [dbo].[vehicle] OFF
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customer] ([CustomerID])
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[job]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[job]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[vehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[parts]  WITH CHECK ADD FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[parts]  WITH CHECK ADD FOREIGN KEY([JobID])
REFERENCES [dbo].[job] ([JobID])
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customer] ([CustomerID])
GO
USE [master]
GO
ALTER DATABASE [hngtask] SET  READ_WRITE 
GO
