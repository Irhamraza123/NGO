USE [master]
GO
/****** Object:  Database [NGO_Foundation]    Script Date: 8/10/2023 8:50:37 PM ******/
CREATE DATABASE [NGO_Foundation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NGO_Foundation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NGO_Foundation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NGO_Foundation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NGO_Foundation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NGO_Foundation] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NGO_Foundation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NGO_Foundation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NGO_Foundation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NGO_Foundation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NGO_Foundation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NGO_Foundation] SET ARITHABORT OFF 
GO
ALTER DATABASE [NGO_Foundation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NGO_Foundation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NGO_Foundation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NGO_Foundation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NGO_Foundation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NGO_Foundation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NGO_Foundation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NGO_Foundation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NGO_Foundation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NGO_Foundation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NGO_Foundation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NGO_Foundation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NGO_Foundation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NGO_Foundation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NGO_Foundation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NGO_Foundation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NGO_Foundation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NGO_Foundation] SET RECOVERY FULL 
GO
ALTER DATABASE [NGO_Foundation] SET  MULTI_USER 
GO
ALTER DATABASE [NGO_Foundation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NGO_Foundation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NGO_Foundation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NGO_Foundation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NGO_Foundation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NGO_Foundation', N'ON'
GO
ALTER DATABASE [NGO_Foundation] SET QUERY_STORE = OFF
GO
USE [NGO_Foundation]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NGO_Foundation]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 8/10/2023 8:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_name] [varchar](50) NOT NULL,
	[a_password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 8/10/2023 8:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](50) NOT NULL,
	[c_email] [varchar](50) NOT NULL,
	[c_phone] [varchar](11) NOT NULL,
	[c_feedback] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[donation]    Script Date: 8/10/2023 8:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donation](
	[d_id] [int] IDENTITY(1,1) NOT NULL,
	[d_amount] [float] NOT NULL,
	[d_cause] [varchar](50) NOT NULL,
	[u_id_fk] [int] NULL,
	[n_id_fk] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foundation]    Script Date: 8/10/2023 8:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foundation](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_name] [varchar](50) NOT NULL,
	[a_id_fk] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/10/2023 8:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [varchar](50) NOT NULL,
	[u_email] [varchar](50) NOT NULL,
	[u_password] [varchar](50) NOT NULL,
	[u_phone] [varchar](11) NOT NULL,
	[u_address] [varchar](max) NOT NULL,
	[u_city] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([a_id], [a_name], [a_password]) VALUES (1, N'Ahmed', N'123')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([c_id], [c_name], [c_email], [c_phone], [c_feedback]) VALUES (1, N'Irham', N'irham@gmail.com', N'03330232798', N'Your website is cool')
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[foundation] ON 

INSERT [dbo].[foundation] ([n_id], [n_name], [a_id_fk]) VALUES (1, N'jdc', 1)
INSERT [dbo].[foundation] ([n_id], [n_name], [a_id_fk]) VALUES (2, N'Edhi', 1)
SET IDENTITY_INSERT [dbo].[foundation] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([u_id], [u_name], [u_email], [u_password], [u_phone], [u_address], [u_city]) VALUES (1, N'Irham', N'irham@gmail.com', N'1122', N'03330232798', N'north nazimabad', N'karachi')
INSERT [dbo].[users] ([u_id], [u_name], [u_email], [u_password], [u_phone], [u_address], [u_city]) VALUES (2, N'irham', N'i@gmail.com', N'111', N'03330232798', N'north nazimabad', N'karachi')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[donation]  WITH CHECK ADD FOREIGN KEY([n_id_fk])
REFERENCES [dbo].[foundation] ([n_id])
GO
ALTER TABLE [dbo].[donation]  WITH CHECK ADD FOREIGN KEY([u_id_fk])
REFERENCES [dbo].[users] ([u_id])
GO
ALTER TABLE [dbo].[foundation]  WITH CHECK ADD FOREIGN KEY([a_id_fk])
REFERENCES [dbo].[admin] ([a_id])
GO
USE [master]
GO
ALTER DATABASE [NGO_Foundation] SET  READ_WRITE 
GO
