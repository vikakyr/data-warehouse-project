USE [master]
GO
/****** Object:  Database [projectkm2]    Script Date: 11.06.2024 00:39:49 ******/
CREATE DATABASE [projectkm2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectkm2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectkm2.mdf' , SIZE = 860160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectkm2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectkm2_log.ldf' , SIZE = 4923392KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectkm2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectkm2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectkm2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectkm2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectkm2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectkm2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectkm2] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectkm2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectkm2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectkm2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectkm2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectkm2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectkm2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectkm2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectkm2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectkm2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectkm2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projectkm2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectkm2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectkm2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectkm2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectkm2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectkm2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectkm2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectkm2] SET RECOVERY FULL 
GO
ALTER DATABASE [projectkm2] SET  MULTI_USER 
GO
ALTER DATABASE [projectkm2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectkm2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectkm2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectkm2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectkm2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectkm2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'projectkm2', N'ON'
GO
ALTER DATABASE [projectkm2] SET QUERY_STORE = OFF
GO
USE [projectkm2]
GO
/****** Object:  Table [dbo].[bridge_Book]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bridge_Book](
	[Book_Code] [int] NOT NULL,
	[Subject_Code] [int] NOT NULL,
 CONSTRAINT [PK_bridge_Book] PRIMARY KEY CLUSTERED 
(
	[Book_Code] ASC,
	[Subject_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Book]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Book](
	[Book_Code] [int] NOT NULL,
	[BibNum] [int] NOT NULL,
	[Title] [nchar](100) NOT NULL,
	[Author] [nchar](100) NOT NULL,
	[ISBN] [nchar](10) NOT NULL,
	[PublicationYear] [nchar](100) NOT NULL,
	[Publisher] [nchar](100) NOT NULL,
	[AgeGroup] [nchar](20) NOT NULL,
	[CategoryGroup] [nchar](20) NOT NULL,
 CONSTRAINT [PK_dim_Book] PRIMARY KEY CLUSTERED 
(
	[Book_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Book_Detail]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Book_Detail](
	[Book_Detail_Code] [int] NOT NULL,
	[Book_Code] [int] NOT NULL,
	[average_rating] [nchar](53) NOT NULL,
	[rating_count] [int] NOT NULL,
	[text_reviews_count] [int] NOT NULL,
	[bestseler_sales_count] [int] NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_dim_Book_Detail] PRIMARY KEY CLUSTERED 
(
	[Book_Detail_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Checkout_Detail]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Checkout_Detail](
	[Checkout_Detail_Code] [int] NOT NULL,
	[usage_class] [nchar](20) NOT NULL,
	[checkout_type] [nchar](20) NOT NULL,
	[material_type] [nchar](50) NOT NULL,
 CONSTRAINT [PK_dim_Checkout_Detail] PRIMARY KEY CLUSTERED 
(
	[Checkout_Detail_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Date]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Date](
	[DateKey] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[DayNumber] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[WeekDayNumber] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekendFlag] [char](3) NOT NULL,
	[HolidayText] [nvarchar](100) NOT NULL,
	[HolidayFlag] [char](3) NOT NULL,
	[MonthNumber] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[QuarterNumber] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[YearNumber] [int] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Location_Detail]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Location_Detail](
	[item_location_name] [nchar](50) NOT NULL,
	[item_location_latitude] [float] NOT NULL,
	[item_location_longitude] [float] NOT NULL,
 CONSTRAINT [PK_dim_Location_Detail] PRIMARY KEY CLUSTERED 
(
	[item_location_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_Subject]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_Subject](
	[Subject_Code] [int] NOT NULL,
	[subject_name] [nchar](255) NOT NULL,
 CONSTRAINT [PK_dim_Subject] PRIMARY KEY CLUSTERED 
(
	[Subject_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_Checkouts]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_Checkouts](
	[Book_Code] [int] NOT NULL,
	[Checkout_Detail_Code] [int] NOT NULL,
	[checkout_month] [int] NOT NULL,
	[checkout_year] [int] NOT NULL,
	[checkout_count] [int] NOT NULL,
	[report_checkout_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_Inventory]    Script Date: 11.06.2024 00:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_Inventory](
	[Book_Code] [int] NOT NULL,
	[item_location_name] [nchar](50) NOT NULL,
	[report_date] [date] NOT NULL,
	[item_count] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bridge_Book]  WITH CHECK ADD  CONSTRAINT [FK_bridge_Book_dim_Book] FOREIGN KEY([Book_Code])
REFERENCES [dbo].[dim_Book] ([Book_Code])
GO
ALTER TABLE [dbo].[bridge_Book] CHECK CONSTRAINT [FK_bridge_Book_dim_Book]
GO
ALTER TABLE [dbo].[bridge_Book]  WITH CHECK ADD  CONSTRAINT [FK_bridge_Book_dim_Subject] FOREIGN KEY([Subject_Code])
REFERENCES [dbo].[dim_Subject] ([Subject_Code])
GO
ALTER TABLE [dbo].[bridge_Book] CHECK CONSTRAINT [FK_bridge_Book_dim_Subject]
GO
ALTER TABLE [dbo].[dim_Book_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dim_Book_Detail_dim_Book] FOREIGN KEY([Book_Code])
REFERENCES [dbo].[dim_Book] ([Book_Code])
GO
ALTER TABLE [dbo].[dim_Book_Detail] CHECK CONSTRAINT [FK_dim_Book_Detail_dim_Book]
GO
ALTER TABLE [dbo].[dim_Book_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dim_Book_Detail_DimDate] FOREIGN KEY([valid_from])
REFERENCES [dbo].[dim_Date] ([Date])
GO
ALTER TABLE [dbo].[dim_Book_Detail] CHECK CONSTRAINT [FK_dim_Book_Detail_DimDate]
GO
ALTER TABLE [dbo].[dim_Book_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dim_Book_Detail_DimDate1] FOREIGN KEY([valid_to])
REFERENCES [dbo].[dim_Date] ([Date])
GO
ALTER TABLE [dbo].[dim_Book_Detail] CHECK CONSTRAINT [FK_dim_Book_Detail_DimDate1]
GO
ALTER TABLE [dbo].[fact_Checkouts]  WITH CHECK ADD  CONSTRAINT [FK_fact_Checkouts_dim_Book] FOREIGN KEY([Book_Code])
REFERENCES [dbo].[dim_Book] ([Book_Code])
GO
ALTER TABLE [dbo].[fact_Checkouts] CHECK CONSTRAINT [FK_fact_Checkouts_dim_Book]
GO
ALTER TABLE [dbo].[fact_Checkouts]  WITH CHECK ADD  CONSTRAINT [FK_fact_Checkouts_dim_Checkout_Detail] FOREIGN KEY([Checkout_Detail_Code])
REFERENCES [dbo].[dim_Checkout_Detail] ([Checkout_Detail_Code])
GO
ALTER TABLE [dbo].[fact_Checkouts] CHECK CONSTRAINT [FK_fact_Checkouts_dim_Checkout_Detail]
GO
ALTER TABLE [dbo].[fact_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_fact_Inventory_dim_Book] FOREIGN KEY([Book_Code])
REFERENCES [dbo].[dim_Book] ([Book_Code])
GO
ALTER TABLE [dbo].[fact_Inventory] CHECK CONSTRAINT [FK_fact_Inventory_dim_Book]
GO
ALTER TABLE [dbo].[fact_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_fact_Inventory_dim_Location_Detail] FOREIGN KEY([item_location_name])
REFERENCES [dbo].[dim_Location_Detail] ([item_location_name])
GO
ALTER TABLE [dbo].[fact_Inventory] CHECK CONSTRAINT [FK_fact_Inventory_dim_Location_Detail]
GO
ALTER TABLE [dbo].[fact_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_fact_Inventory_DimDate] FOREIGN KEY([report_date])
REFERENCES [dbo].[dim_Date] ([Date])
GO
ALTER TABLE [dbo].[fact_Inventory] CHECK CONSTRAINT [FK_fact_Inventory_DimDate]
GO
USE [master]
GO
ALTER DATABASE [projectkm2] SET  READ_WRITE 
GO
