USE [master]
GO
/****** Object:  Database [RestaurantDatabase]    Script Date: 12/12/2018 15:27:34 ******/
CREATE DATABASE [RestaurantDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RestaurantDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestaurantDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RestaurantDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RestaurantDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RestaurantDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RestaurantDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RestaurantDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RestaurantDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RestaurantDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RestaurantDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RestaurantDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RestaurantDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [RestaurantDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RestaurantDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RestaurantDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RestaurantDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RestaurantDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RestaurantDatabase] SET QUERY_STORE = OFF
GO
USE [RestaurantDatabase]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 12/12/2018 15:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipeName] [text] NOT NULL,
	[Duration] [int] NOT NULL,
	[Id_RecipeType] [int] NOT NULL,
	[Price] [int] NULL,
 CONSTRAINT [Recipe_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeType]    Script Date: 12/12/2018 15:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [RecipeType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/12/2018 15:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [Role_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scenario]    Script Date: 12/12/2018 15:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scenario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioName] [varchar](50) NOT NULL,
 CONSTRAINT [Scenario_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScenarioPerRole]    Script Date: 12/12/2018 15:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScenarioPerRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Scenario] [int] NOT NULL,
	[Id_Role] [int] NOT NULL,
 CONSTRAINT [ScenarioPerRole_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScenarioStep]    Script Date: 12/12/2018 15:27:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScenarioStep](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[Id_ScenarioPerRole] [int] NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [ScenarioStep_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [Recipe_RecipeType_FK] FOREIGN KEY([Id_RecipeType])
REFERENCES [dbo].[RecipeType] ([Id])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [Recipe_RecipeType_FK]
GO
ALTER TABLE [dbo].[ScenarioPerRole]  WITH CHECK ADD  CONSTRAINT [ScenarioPerRole_Role0_FK] FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ScenarioPerRole] CHECK CONSTRAINT [ScenarioPerRole_Role0_FK]
GO
ALTER TABLE [dbo].[ScenarioPerRole]  WITH CHECK ADD  CONSTRAINT [ScenarioPerRole_Scenario_FK] FOREIGN KEY([Id_Scenario])
REFERENCES [dbo].[Scenario] ([Id])
GO
ALTER TABLE [dbo].[ScenarioPerRole] CHECK CONSTRAINT [ScenarioPerRole_Scenario_FK]
GO
ALTER TABLE [dbo].[ScenarioStep]  WITH CHECK ADD  CONSTRAINT [ScenarioStep_ScenarioPerRole_FK] FOREIGN KEY([Id_ScenarioPerRole])
REFERENCES [dbo].[ScenarioPerRole] ([Id])
GO
ALTER TABLE [dbo].[ScenarioStep] CHECK CONSTRAINT [ScenarioStep_ScenarioPerRole_FK]
GO
USE [master]
GO
ALTER DATABASE [RestaurantDatabase] SET  READ_WRITE 
GO
