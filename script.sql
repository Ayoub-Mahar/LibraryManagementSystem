USE [master]
GO
/****** Object:  Database [LibraryManagementSystemDB1]    Script Date: 17/02/2023 11:11:49 pm ******/
CREATE DATABASE [LibraryManagementSystemDB1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementSystemDB1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\LibraryManagementSystemDB1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementSystemDB1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\LibraryManagementSystemDB1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementSystemDB1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagementSystemDB1', N'ON'
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET QUERY_STORE = OFF
GO
USE [LibraryManagementSystemDB1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookMainCategory]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookMainCategory](
	[PK_MainCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BookMainCategory] PRIMARY KEY CLUSTERED 
(
	[PK_MainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[PK_BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookTitle] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[Edition] [nvarchar](max) NOT NULL,
	[AutherName] [nvarchar](max) NOT NULL,
	[Availability] [bit] NOT NULL,
	[ISBN] [bit] NOT NULL,
	[FK_MainCategoryID] [int] NULL,
	[FK_SubCategoryID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookSubCategory]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookSubCategory](
	[PK_SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](max) NOT NULL,
	[FK_MainCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_BookSubCategory] PRIMARY KEY CLUSTERED 
(
	[PK_SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230216064649_Initial', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[BookMainCategory] ON 

INSERT [dbo].[BookMainCategory] ([PK_MainCategoryID], [MainCategoryName]) VALUES (1, N'Computer')
INSERT [dbo].[BookMainCategory] ([PK_MainCategoryID], [MainCategoryName]) VALUES (2, N'Programming')
INSERT [dbo].[BookMainCategory] ([PK_MainCategoryID], [MainCategoryName]) VALUES (4, N'Accounts')
SET IDENTITY_INSERT [dbo].[BookMainCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([PK_BookID], [BookTitle], [Price], [Edition], [AutherName], [Availability], [ISBN], [FK_MainCategoryID], [FK_SubCategoryID]) VALUES (1, N'Beginning Programming with Java For Dummies', 1200, N'2nd', N'Richerds', 1, 1, 2, 1)
INSERT [dbo].[Books] ([PK_BookID], [BookTitle], [Price], [Edition], [AutherName], [Availability], [ISBN], [FK_MainCategoryID], [FK_SubCategoryID]) VALUES (2, N'Head First Java', 12000, N'1st', N'Daud', 1, 1, 2, 1)
INSERT [dbo].[Books] ([PK_BookID], [BookTitle], [Price], [Edition], [AutherName], [Availability], [ISBN], [FK_MainCategoryID], [FK_SubCategoryID]) VALUES (6, N'Core Java Volume I', 1233, N'3rd', N'Karim', 1, 1, 2, 1)
INSERT [dbo].[Books] ([PK_BookID], [BookTitle], [Price], [Edition], [AutherName], [Availability], [ISBN], [FK_MainCategoryID], [FK_SubCategoryID]) VALUES (7, N'C# in Depth', 3423, N'2nd', N'Jon Skeet', 1, 1, 2, 2)
INSERT [dbo].[Books] ([PK_BookID], [BookTitle], [Price], [Edition], [AutherName], [Availability], [ISBN], [FK_MainCategoryID], [FK_SubCategoryID]) VALUES (8, N'Learn C# in One Day and Learn It Well', 2132, N'5th', N'Jamie Chan', 1, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BookSubCategory] ON 

INSERT [dbo].[BookSubCategory] ([PK_SubCategoryID], [SubCategoryName], [FK_MainCategoryID]) VALUES (1, N'Java', 2)
INSERT [dbo].[BookSubCategory] ([PK_SubCategoryID], [SubCategoryName], [FK_MainCategoryID]) VALUES (2, N'C#', 2)
INSERT [dbo].[BookSubCategory] ([PK_SubCategoryID], [SubCategoryName], [FK_MainCategoryID]) VALUES (3, N'PHP', 2)
SET IDENTITY_INSERT [dbo].[BookSubCategory] OFF
GO
/****** Object:  Index [IX_Books_FK_MainCategoryID]    Script Date: 17/02/2023 11:11:49 pm ******/
CREATE NONCLUSTERED INDEX [IX_Books_FK_MainCategoryID] ON [dbo].[Books]
(
	[FK_MainCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_FK_SubCategoryID]    Script Date: 17/02/2023 11:11:49 pm ******/
CREATE NONCLUSTERED INDEX [IX_Books_FK_SubCategoryID] ON [dbo].[Books]
(
	[FK_SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetBookByCategoryID]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetBookByCategoryID]
@FK_MainCategoryID int,
@FK_SubCategoryID int
AS
BEGIN
	SELECT b.PK_BookID, 
	b.BookTitle,
	b.Price,
	b.AutherName,
	b.Availability,
	b.Edition,
	b.ISBN,
	ISNULL(b.FK_MainCategoryID,1) as FK_MainCategoryID,
	ISNULL(b.FK_SubCategoryID,1) as FK_SubCategoryID 
	FROM dbo.Books b
	inner join BookMainCategory mc on b.FK_MainCategoryID =mc.PK_MainCategoryID
	where b.FK_MainCategoryID = @FK_MainCategoryID and b.FK_SubCategoryID = @FK_SubCategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookList]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBookList]
AS
BEGIN
	SELECT b.PK_BookID, b.BookTitle,b.Price,b.AutherName,b.Availability,b.Edition,b.ISBN,ISNULL(b.FK_MainCategoryID,1) as FK_MainCategoryID,ISNULL(b.FK_SubCategoryID,1) as FK_SubCategoryID FROM dbo.Books b
end
GO
/****** Object:  StoredProcedure [dbo].[GetBookListBYCategoryID]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetBookListBYCategoryID]
@FK_MainCategoryID int
AS
BEGIN
	SELECT b.PK_BookID, 
	b.BookTitle,
	b.Price,
	b.AutherName,
	b.Availability,
	b.Edition,
	b.ISBN,
	ISNULL(b.FK_MainCategoryID,1) as FK_MainCategoryID,
	ISNULL(b.FK_SubCategoryID,1) as FK_SubCategoryID 
	FROM dbo.Books b
	inner join BookMainCategory mc on b.FK_MainCategoryID =mc.PK_MainCategoryID
	where b.FK_MainCategoryID = @FK_MainCategoryID
end
GO
/****** Object:  StoredProcedure [dbo].[spBookMainCategory]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spBookMainCategory]
AS
BEGIN
	select * from [dbo].[BookMainCategory]
end
GO
/****** Object:  StoredProcedure [dbo].[spGetSubCategoryByMainCategoryID]    Script Date: 17/02/2023 11:11:49 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetSubCategoryByMainCategoryID]
@FK_MainCategoryID int
AS
BEGIN
	SELECT sc.PK_SubCategoryID,sc.SubCategoryName,sc.FK_MainCategoryID from BookSubCategory sc
	where FK_MainCategoryID =  @FK_MainCategoryID
end
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementSystemDB1] SET  READ_WRITE 
GO
