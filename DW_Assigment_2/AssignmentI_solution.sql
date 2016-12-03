USE [master]
GO
/****** Object:  Database [Assignment_solutionI]    Script Date: 06-11-16 13:19:30 ******/
CREATE DATABASE [Assignment_solutionI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_solutionI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Assignment_solutionI.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment_solutionI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Assignment_solutionI_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment_solutionI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_solutionI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_solutionI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_solutionI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_solutionI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_solutionI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_solutionI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment_solutionI] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_solutionI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_solutionI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_solutionI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_solutionI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment_solutionI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment_solutionI', N'ON'
GO
USE [Assignment_solutionI]
GO
/****** Object:  UserDefinedDataType [dbo].[year]    Script Date: 06-11-16 13:19:30 ******/
CREATE TYPE [dbo].[year] FROM [int] NULL
GO
/****** Object:  Table [dbo].[actor]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actor](
	[actor_id] [int] IDENTITY(201,1) NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [actor_pkey] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[address]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[address_id] [int] IDENTITY(606,1) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[address2] [varchar](50) NULL,
	[district] [varchar](20) NOT NULL,
	[city_id] [int] NOT NULL,
	[postal_code] [varchar](10) NULL,
	[phone] [varchar](20) NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [address_pkey] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(17,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [category_pkey] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(601,1) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [city_pkey] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[country_id] [int] IDENTITY(110,1) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [country_pkey] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
[CID] [int] IDENTITY(600,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[storeID] [int] NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[email] [varchar](50) NULL,
	[address_id] [int] NOT NULL,
	[activebool] [bit] NOT NULL CONSTRAINT [DF__customer__active__1FCDBCEB]  DEFAULT ((1)),
	[start_date] [int] NOT NULL,
	[end_update] [int] NULL,
	[valide] [bit] Not NULL,
 CONSTRAINT [customer_pkey] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[film]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[film](
	[film_id] [int] IDENTITY(1001,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [varchar](max) NULL,
	[release_year] [int] NULL,
	[language_id] [int] NOT NULL,
	[rental_duration] [smallint] NOT NULL DEFAULT ((3)),
	[rental_rate] [numeric](4, 2) NOT NULL DEFAULT ((4.99)),
	[length] [smallint] NULL,
	[replacement_cost] [numeric](5, 2) NOT NULL DEFAULT ((19.99)),
	[rating] [varchar](255) NULL DEFAULT ('G'),
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
	[special_features] [varchar](255) NULL,
	[fulltext] [varchar](255) NOT NULL,
 CONSTRAINT [film_pkey] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[film_actor]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_actor](
	[actor_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [film_actor_pkey] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC,
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[film_category]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film_category](
	[film_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [film_category_pkey] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventory]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[inventory_id] [int] IDENTITY(4582,1) NOT NULL,
	[film_id] [int] NOT NULL,
	[storeID] [int] NOT NULL,
	[last_update] [datetime2](6) NOT NULL CONSTRAINT [DF__inventory__last___398D8EEE]  DEFAULT (getdate()),
 CONSTRAINT [inventory_pkey] PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[language]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[language](
	[language_id] [int] IDENTITY(7,1) NOT NULL,
	[name] [char](20) NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [language_pkey] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RentalPayment]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalPayment](
	
	[CID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[rental_id] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DateKey]           [int] NOT NULL,
	[film_id] [int]  NOT NULL,
	[payment_status] [bit] NOT NULL,
	[amount] [numeric](5, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
  Primary Key (CID, StaffID, rental_id, StoreID, DateKey, film_id))
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Date]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dbo.Date
(
  DateKey             INT         NOT NULL PRIMARY KEY,
  [Date]              DATE        NOT NULL,
  [Day]               TINYINT     NOT NULL,
  [Month]             TINYINT     NOT NULL,
  [MonthName]         VARCHAR(10) NOT NULL,
  [Quarter]           TINYINT     NOT NULL,
  QuarterName         VARCHAR(6)  NOT NULL,
  [Year]              INT         NOT NULL,
  
);

GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[rental]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rental](
	[rental_id] [int] IDENTITY(16050,1) NOT NULL,
	[rental_date] [datetime2](6) NOT NULL,
	[inventory_id] [int] NOT NULL,
	[return_date] [datetime2](6) NULL,
	[StaffID] [int] NOT NULL,
	[last_update] [datetime2](6) NOT NULL DEFAULT (getdate()),
 CONSTRAINT [rental_pkey] PRIMARY KEY CLUSTERED 
(
	[rental_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staff](
	[StaffID] [int] IDENTITY(3,1) NOT NULL,
	[staff_id] [int]  NOT NULL,
	[first_name] [varchar](45) NOT NULL,
	[last_name] [varchar](45) NOT NULL,
	[address_id] [int] NOT NULL,
	[email] [varchar](50) NULL,
	[storeID] [int] NOT NULL,
	[active] [bit] NOT NULL CONSTRAINT [DF__staff__active__3D5E1FD2]  DEFAULT ((1)),
	[username] [varchar](16) NOT NULL,
	[password] [varchar](40) NULL,
	[picture] [varbinary](max) NULL,
	[start_date] [int] NOT NULL,
	[end_update] [int] NULL,
	[valide] [bit] Not NULL,
	
 CONSTRAINT [StaffID] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[store]    Script Date: 06-11-16 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store](
[storeID] [int] IDENTITY(3,1) NOT NULL,
	[store_id] [int]  NOT NULL,
	[manager_staff_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[start_date] [int] NOT NULL,
	[end_update] [int] NULL,
	[valide] [bit] Not NULL,
 CONSTRAINT [storeID] PRIMARY KEY CLUSTERED 
(
	[storeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_actor_last_name]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_actor_last_name] ON [dbo].[actor]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_city_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_city_id] ON [dbo].[address]
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_country_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_country_id] ON [dbo].[city]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_address_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_address_id] ON [dbo].[customer]
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_storeID]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_storeID] ON [dbo].[customer]
(
	[storeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_last_name]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_last_name] ON [dbo].[customer]
(
	[last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [film_fulltext_idx]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [film_fulltext_idx] ON [dbo].[film]
(
	[fulltext] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_language_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_language_id] ON [dbo].[film]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_title]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_title] ON [dbo].[film]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_film_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_id] ON [dbo].[film_actor]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_storeID_film_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_storeID_film_id] ON [dbo].[inventory]
(
	[storeID] ASC,
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



	
	
	
	
	/****** Object:  Index [idx_fk_DateKey]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_DateKey] ON [dbo].[RentalPayment]
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [idx_fk_StoreID]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_StoreID] ON [dbo].[RentalPayment]
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

	/****** Object:  Index [idx_fk_film_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_film_id] ON [dbo].[RentalPayment]
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_CID]    Script Date: 06-11-16 13:19:30 ******/


CREATE NONCLUSTERED INDEX [idx_fk_CID] ON [dbo].[RentalPayment]
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_rental_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_rental_id] ON [dbo].[RentalPayment]
(
	[rental_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_staff_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_StaffID] ON [dbo].[RentalPayment]
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_fk_inventory_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE NONCLUSTERED INDEX [idx_fk_inventory_id] ON [dbo].[rental]
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_unq_rental_rental_date_inventory_id_CID]    Script Date: 06-11-16 13:19:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_unq_rental_rental_date_inventory_id_CID] ON [dbo].[rental]
(
	[rental_date] ASC,
	[inventory_id] ASC,
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_unq_manager_staff_id]    Script Date: 06-11-16 13:19:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_unq_manager_staff_id] ON [dbo].[store]
(
	[manager_staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH NOCHECK ADD  CONSTRAINT [fk_address_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [fk_address_city]
GO
ALTER TABLE [dbo].[city]  WITH NOCHECK ADD  CONSTRAINT [fk_city] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([country_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_city]
GO
ALTER TABLE [dbo].[customer]  WITH NOCHECK ADD  CONSTRAINT [customer_address_id_fkey] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [customer_address_id_fkey]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_store] FOREIGN KEY([storeID])
REFERENCES [dbo].[store] ([storeID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_store]
GO
ALTER TABLE [dbo].[film]  WITH NOCHECK ADD  CONSTRAINT [film_language_id_fkey] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([language_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [film_language_id_fkey]
GO
ALTER TABLE [dbo].[film_actor]  WITH NOCHECK ADD  CONSTRAINT [film_actor_actor_id_fkey] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actor] ([actor_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [film_actor_actor_id_fkey]
GO
ALTER TABLE [dbo].[film_actor]  WITH NOCHECK ADD  CONSTRAINT [film_actor_film_id_fkey] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_actor] CHECK CONSTRAINT [film_actor_film_id_fkey]
GO
ALTER TABLE [dbo].[film_category]  WITH NOCHECK ADD  CONSTRAINT [film_category_category_id_fkey] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_category] CHECK CONSTRAINT [film_category_category_id_fkey]
GO
ALTER TABLE [dbo].[film_category]  WITH NOCHECK ADD  CONSTRAINT [film_category_film_id_fkey] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[film_category] CHECK CONSTRAINT [film_category_film_id_fkey]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_store] FOREIGN KEY([storeID])
REFERENCES [dbo].[store] ([storeID])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_store]
GO
ALTER TABLE [dbo].[inventory]  WITH NOCHECK ADD  CONSTRAINT [inventory_film_id_fkey] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [inventory_film_id_fkey]
GO


	
	
	
	

	
	ALTER TABLE [dbo].[RentalPayment]  WITH CHECK ADD  CONSTRAINT [FK_RentalPayment_film] FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([film_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [FK_RentalPayment_film]
GO
	ALTER TABLE [dbo].[RentalPayment]  WITH CHECK ADD  CONSTRAINT [FK_RentalPayment_date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[date] ([DateKey])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [FK_RentalPayment_date]
GO

ALTER TABLE [dbo].[RentalPayment]  WITH CHECK ADD  CONSTRAINT [FK_RentalPayment_store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[store] ([StoreID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [FK_RentalPayment_store]
GO

ALTER TABLE [dbo].[RentalPayment]  WITH CHECK ADD  CONSTRAINT [FK_RentalPayment_rental] FOREIGN KEY([rental_id])
REFERENCES [dbo].[rental] ([rental_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [FK_RentalPayment_rental]
GO
ALTER TABLE [dbo].[RentalPayment]  WITH CHECK ADD  CONSTRAINT [FK_RentalPayment_staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [FK_RentalPayment_staff]
GO

ALTER TABLE [dbo].[RentalPayment]  WITH NOCHECK ADD  CONSTRAINT [RentalPayment_CID_fkey] FOREIGN KEY([CID])
REFERENCES [dbo].[customer] ([CID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RentalPayment] CHECK CONSTRAINT [RentalPayment_CID_fkey]
GO



ALTER TABLE [dbo].[rental]  WITH NOCHECK ADD  CONSTRAINT [rental_inventory_id_fkey] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[inventory] ([inventory_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [rental_inventory_id_fkey]
GO
ALTER TABLE [dbo].[rental]  WITH NOCHECK ADD  CONSTRAINT [rental_staff_id_key] FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[rental] CHECK CONSTRAINT [rental_staff_id_key]
GO
ALTER TABLE [dbo].[staff]  WITH NOCHECK ADD  CONSTRAINT [staff_address_id_fkey] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [staff_address_id_fkey]
GO
ALTER TABLE [dbo].[store]  WITH CHECK ADD  CONSTRAINT [FK_store_staff] FOREIGN KEY([manager_staff_id])
REFERENCES [dbo].[staff] ([staff_id])
GO
ALTER TABLE [dbo].[store] CHECK CONSTRAINT [FK_store_staff]
GO
ALTER TABLE [dbo].[store]  WITH NOCHECK ADD  CONSTRAINT [store_address_id_fkey] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[store] CHECK CONSTRAINT [store_address_id_fkey]
GO
USE [master]
GO
ALTER DATABASE [Assignment_solutionI] SET  READ_WRITE 
GO
