USE [master]
GO
/****** Object:  Database [Persondb]    Script Date: 14.12.2020 1:11:59 ******/
CREATE DATABASE [Persondb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Persondb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persondb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Persondb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persondb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Persondb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Persondb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Persondb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Persondb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Persondb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Persondb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Persondb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Persondb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Persondb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Persondb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Persondb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Persondb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Persondb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Persondb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Persondb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Persondb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Persondb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Persondb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Persondb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Persondb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Persondb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Persondb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Persondb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Persondb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Persondb] SET RECOVERY FULL 
GO
ALTER DATABASE [Persondb] SET  MULTI_USER 
GO
ALTER DATABASE [Persondb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Persondb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Persondb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Persondb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Persondb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Persondb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Persondb', N'ON'
GO
ALTER DATABASE [Persondb] SET QUERY_STORE = OFF
GO
USE [Persondb]
GO
/****** Object:  User [PersonUser]    Script Date: 14.12.2020 1:11:59 ******/
CREATE USER [PersonUser] FOR LOGIN [PersonUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Person]    Script Date: 14.12.2020 1:11:59 ******/
CREATE USER [Person] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [PersonUser]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14.12.2020 1:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Департамент] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14.12.2020 1:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](150) NOT NULL,
	[Дата рождения] [datetime] NULL,
	[E-mail] [nvarchar](50) NULL,
	[Департамент] [int] NOT NULL,
	[Телефон] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
USE [master]
GO
ALTER DATABASE [Persondb] SET  READ_WRITE 
GO

use Persondb;
INSERT INTO Department (Департамент) VALUES ('Первый');
INSERT INTO Department (Департамент) VALUES ('Второй');
INSERT INTO Department (Департамент) VALUES ('Третий');
INSERT INTO Department (Департамент) VALUES ('Четвёртый');

INSERT INTO Employee (ФИО, [Дата рождения], [E-mail], Департамент, Телефон) VALUES ('Иванов Иван Иванович', 2010-05-12, 'ivan@ivanov', 1, '123456789');
INSERT INTO Employee (ФИО, [Дата рождения], [E-mail], Департамент, Телефон) VALUES ('Смирнов Николай Николаевич', 2010-09-21, 'niko@smirnov', 2, '12587546');
INSERT INTO Employee (ФИО, [Дата рождения], [E-mail], Департамент, Телефон) VALUES ('Савин Олег Юрьевич', 1987-07-02, 'oleg@savin.ru', 3, '125844694');
INSERT INTO Employee (ФИО, [Дата рождения], [E-mail], Департамент, Телефон) VALUES ('Петров Сергей Миронович', 1997-07-02, 'oleg@savin.ru', 3, '125844694');