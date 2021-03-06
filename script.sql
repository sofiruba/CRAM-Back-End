USE [master]
GO
/****** Object:  Database [CRAM]    Script Date: 21/6/2022 12:10:41 ******/
CREATE DATABASE [CRAM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRAM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRAM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRAM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CRAM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRAM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRAM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRAM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRAM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRAM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRAM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRAM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRAM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRAM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRAM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRAM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRAM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRAM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRAM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRAM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRAM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRAM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRAM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRAM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRAM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRAM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRAM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRAM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRAM] SET RECOVERY FULL 
GO
ALTER DATABASE [CRAM] SET  MULTI_USER 
GO
ALTER DATABASE [CRAM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRAM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRAM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRAM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRAM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRAM', N'ON'
GO
ALTER DATABASE [CRAM] SET QUERY_STORE = OFF
GO
USE [CRAM]
GO
/****** Object:  User [alumno]    Script Date: 21/6/2022 12:10:41 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Lista]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lista](
	[IdLista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [text] NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Lista] PRIMARY KEY CLUSTERED 
(
	[IdLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lugar]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lugar](
	[IdLugar] [varchar](max) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LugaresXLista]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LugaresXLista](
	[IdLugar] [varchar](max) NOT NULL,
	[IdLista] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[IdReview] [int] IDENTITY(1,1) NOT NULL,
	[Destacar] [varchar](80) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Comentarios] [varchar](max) NULL,
	[IdUsuario] [int] NOT NULL,
	[IdLugar] [text] NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Titulo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[IdReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seguido]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguido](
	[IdSeguido] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Seguido] PRIMARY KEY CLUSTERED 
(
	[IdSeguido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/6/2022 12:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Foto] [text] NOT NULL,
	[Nombre] [text] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Mail] [text] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Descripcion]) VALUES (N'aaa123', N'Las Violetas', N'Confiteria')
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Descripcion]) VALUES (N'abc456', N'Ocaña', N'Bar')
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Descripcion]) VALUES (N'bcd', N'Starbucks', N'Cafeteria')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Foto], [Nombre], [Password], [Username], [Mail]) VALUES (2, N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/62RD5SEZIFDTXCNYM5VENI43ZY.jpg', N'Clara ', N'Cygiel', N'claracygiel', N'claracyg@gmail.com')
INSERT [dbo].[Usuario] ([IdUsuario], [Foto], [Nombre], [Password], [Username], [Mail]) VALUES (3, N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/62RD5SEZIFDTXCNYM5VENI43ZY.jpg', N'delfina', N'munich', N'delfimhg', N'delfimhg@gmail.com')
INSERT [dbo].[Usuario] ([IdUsuario], [Foto], [Nombre], [Password], [Username], [Mail]) VALUES (4, N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/62RD5SEZIFDTXCNYM5VENI43ZY.jpg', N'prueba', N'prueba', N'probando', N'prueba@prueba.com')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Lista]  WITH CHECK ADD  CONSTRAINT [FK_Lista_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Lista] CHECK CONSTRAINT [FK_Lista_Usuario]
GO
ALTER TABLE [dbo].[LugaresXLista]  WITH CHECK ADD  CONSTRAINT [FK_LugaresXLista_Lista] FOREIGN KEY([IdLista])
REFERENCES [dbo].[Lista] ([IdLista])
GO
ALTER TABLE [dbo].[LugaresXLista] CHECK CONSTRAINT [FK_LugaresXLista_Lista]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Usuario1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Reseña_Usuario1]
GO
ALTER TABLE [dbo].[Seguido]  WITH CHECK ADD  CONSTRAINT [FK_Seguido_Usuario1] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Seguido] CHECK CONSTRAINT [FK_Seguido_Usuario1]
GO
USE [master]
GO
ALTER DATABASE [CRAM] SET  READ_WRITE 
GO
