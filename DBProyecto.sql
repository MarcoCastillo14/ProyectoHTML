USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 22/3/2025 21:58:14 ******/
CREATE DATABASE [Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Proyecto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Proyecto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Proyecto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE = ON
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Proyecto]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesReparacion](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[Descripcion] [varchar](50) NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[TipoEquipo] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[FechaSolicitud] [date] NOT NULL,
	[Estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sesion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sesion](
	[SesionID] [varchar](25) NOT NULL,
	[Contrasena] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SesionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnicos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Especialidad] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] ON 
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (1, 2, 1, CAST(N'2025-02-06' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (2, 3, 1, CAST(N'2025-02-09' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (3, 5, 4, CAST(N'2025-02-15' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (4, 6, 4, CAST(N'2025-02-18' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (5, 8, 2, CAST(N'2025-02-24' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (6, 9, 2, CAST(N'2025-02-26' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (7, 11, 3, CAST(N'2025-03-03' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (8, 12, 3, CAST(N'2025-03-06' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (9, 14, 5, CAST(N'2025-03-11' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (10, 15, 5, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (11, 16, 3, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (12, 17, 3, CAST(N'2025-03-19' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (13, 18, 2, CAST(N'2025-03-20' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (14, 19, 1, CAST(N'2025-03-21' AS Date))
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (15, 20, 4, CAST(N'2025-03-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesReparacion] ON 
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (41, 1, N'Pantalla rota', CAST(N'2025-02-04' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (51, 2, N'Batería dañada', CAST(N'2025-02-06' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (52, 3, N'No enciende', CAST(N'2025-02-09' AS Date), CAST(N'2025-02-12' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (53, 4, N'Botones no funcionan', CAST(N'2025-02-11' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (54, 5, N'Carga defectuosa', CAST(N'2025-02-15' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (55, 6, N'Fallo en el software', CAST(N'2025-02-18' AS Date), CAST(N'2025-02-22' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (56, 7, N'Pantalla negra', CAST(N'2025-02-21' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (57, 8, N'Sin sonido', CAST(N'2025-02-24' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (58, 9, N'Imagen distorsionada', CAST(N'2025-02-26' AS Date), CAST(N'2025-02-28' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (62, 10, N'No reconoce USB', CAST(N'2025-02-28' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (63, 11, N'Fallo en la red', CAST(N'2025-03-03' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (64, 12, N'Problema con drivers', CAST(N'2025-03-06' AS Date), CAST(N'2025-03-09' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (65, 13, N'Teclas no responden', CAST(N'2025-03-09' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (66, 14, N'Altavoces dañados', CAST(N'2025-03-11' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (67, 15, N'Fallo en la GPU', CAST(N'2025-03-14' AS Date), CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (68, 16, N'No enciende', CAST(N'2025-03-17' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (69, 17, N'Carga intermitente', CAST(N'2025-03-19' AS Date), CAST(N'2025-03-21' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (70, 18, N'Se apaga solo', CAST(N'2025-03-20' AS Date), NULL)
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (71, 19, N'prueba', CAST(N'2025-03-21' AS Date), CAST(N'2025-03-23' AS Date))
GO
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (72, 20, N'Problema de conexión HDMI', CAST(N'2025-03-22' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[DetallesReparacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipos] ON 
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (1, 1, N'Celulares', N'Samsung Galaxy S23')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (2, 2, N'Celulares', N'iPhone 14')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (3, 3, N'Celulares', N'Xiaomi Redmi Note 12')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (4, 4, N'Celulares', N'Google Pixel 7')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (5, 5, N'Celulares', N'OnePlus 11')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (6, 6, N'Televisores', N'LG OLED C2')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (7, 7, N'Televisores', N'Samsung QLED Q80B')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (8, 8, N'Televisores', N'Sony Bravia XR')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (9, 9, N'Televisores', N'Hisense U8H')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (10, 10, N'Televisores', N'TCL 6-Series')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (11, 11, N'Computadoras', N'Dell XPS 15')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (12, 12, N'Computadoras', N'MacBook Pro 16')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (13, 13, N'Computadoras', N'Lenovo ThinkPad X1')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (14, 14, N'Computadoras', N'HP Spectre x360')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (15, 15, N'Computadoras', N'Asus ROG Zephyrus G15')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (16, 1, N'Otros', N'Mouse Razer')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (17, 3, N'Otros', N'Teclado Logitech')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (18, 5, N'Otros', N'Monitor Samsung 27"')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (19, 7, N'Otros', N'Router TP-Link')
GO
INSERT [dbo].[Equipos] ([EquipoID], [UsuarioID], [TipoEquipo], [Modelo]) VALUES (20, 9, N'Otros', N'Webcam Logitech C920')
GO
SET IDENTITY_INSERT [dbo].[Equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Reparaciones] ON 
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (1, 1, CAST(N'2025-02-03' AS Date), N'Por Asignar')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (2, 2, CAST(N'2025-02-05' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (3, 3, CAST(N'2025-02-08' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (4, 4, CAST(N'2025-02-10' AS Date), N'Por Asignar')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (5, 5, CAST(N'2025-02-14' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (6, 6, CAST(N'2025-02-17' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (7, 7, CAST(N'2025-02-20' AS Date), N'Por Asignar')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (8, 8, CAST(N'2025-02-23' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (9, 9, CAST(N'2025-02-25' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (10, 10, CAST(N'2025-02-28' AS Date), N'Por Asignar')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (11, 11, CAST(N'2025-03-02' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (12, 12, CAST(N'2025-03-05' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (13, 13, CAST(N'2025-03-08' AS Date), N'Por Asignar')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (14, 14, CAST(N'2025-03-10' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (15, 15, CAST(N'2025-03-13' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (16, 16, CAST(N'2025-03-16' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (17, 17, CAST(N'2025-03-18' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (18, 18, CAST(N'2025-03-20' AS Date), N'Pendiente')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (19, 19, CAST(N'2025-03-21' AS Date), N'Completada')
GO
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (20, 20, CAST(N'2025-03-22' AS Date), N'Pendiente')
GO
SET IDENTITY_INSERT [dbo].[Reparaciones] OFF
GO
INSERT [dbo].[sesion] ([SesionID], [Contrasena]) VALUES (N'ProyectoHTML', N'PrograII2025')
GO
SET IDENTITY_INSERT [dbo].[Tecnicos] ON 
GO
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (1, N'Sergio Rodríguez', N'Celulares')
GO
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (2, N'Alberto Vázquez', N'Televisores')
GO
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (3, N'Fernanda Castillo', N'Computadoras')
GO
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (4, N'Gabriel Pérez', N'Celulares')
GO
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (5, N'Lucía Ramírez', N'Computadoras')
GO
SET IDENTITY_INSERT [dbo].[Tecnicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (1, N'Carlos López', N'carlos.lopez@email.com', N'12345678')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (2, N'María Fernández', N'maria.fernandez@email.com', N'23456789')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (3, N'José Martínez', N'jose.martinez@email.com', N'34567890')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (4, N'Laura Sánchez', N'laura.sanchez@email.com', N'45678901')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (5, N'Pedro Ramírez', N'pedro.ramirez@email.com', N'56789012')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (6, N'Ana Torres', N'ana.torres@email.com', N'67890123')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (7, N'Luis Gómez', N'luis.gomez@email.com', N'78901234')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (8, N'Carmen Díaz', N'carmen.diaz@email.com', N'89012345')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (9, N'Jorge Herrera', N'jorge.herrera@email.com', N'90123456')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (10, N'Elena Castro', N'elena.castro@email.com', N'12345098')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (11, N'Roberto Ruiz', N'roberto.ruiz@email.com', N'23456098')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (12, N'Patricia Jiménez', N'patricia.jimenez@email.com', N'34567098')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (13, N'Diego Morales', N'diego.morales@email.com', N'45678098')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (14, N'Andrea Vargas', N'andrea.vargas@email.com', N'56789098')
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Telefono]) VALUES (15, N'Francisco Mendoza', N'francisco.mendoza@email.com', N'67890198')
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_Asignaciones_Reparaciones] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [FK_Asignaciones_Reparaciones]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD  CONSTRAINT [FK_Asignaciones_Tecnicos] FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaciones] CHECK CONSTRAINT [FK_Asignaciones_Tecnicos]
GO
ALTER TABLE [dbo].[DetallesReparacion]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[DetallesReparacion]  WITH CHECK ADD  CONSTRAINT [FK_DetallesReparacion_Reparaciones] FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetallesReparacion] CHECK CONSTRAINT [FK_DetallesReparacion_Reparaciones]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Usuarios] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [FK_Equipos_Usuarios]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [FK_Reparaciones_Equipos] FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [FK_Reparaciones_Equipos]
GO
/****** Object:  StoredProcedure [dbo].[AdiAsignacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiAsignacion]
    @ReparacionID INT,
    @TecnicoID INT,
    @FechaAsignacion DATE
AS
BEGIN
    INSERT INTO Asignaciones (ReparacionID, TecnicoID, FechaAsignacion)
    VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion);
	UPDATE Reparaciones
	SET Estado='Pendiente' 
	WHERE ReparacionID=@ReparacionID AND Estado='Por Asignar'
END;
GO
/****** Object:  StoredProcedure [dbo].[AdiDetalle]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiDetalle]
    @ReparacionID INT,
    @Descripcion VARCHAR(50) = NULL,
    @FechaInicio DATE,
    @FechaFin DATE = NULL
AS
BEGIN
    INSERT INTO DetallesReparacion (ReparacionID, Descripcion, FechaInicio, FechaFin)
    VALUES (@ReparacionID, @Descripcion, @FechaInicio, @FechaFin);
END;
GO
/****** Object:  StoredProcedure [dbo].[AdiEquipo]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiEquipo]
    @UsuarioID INT,
    @TipoEquipo VARCHAR(50),
    @Modelo VARCHAR(50) = NULL
AS
BEGIN
    INSERT INTO Equipos (UsuarioID, TipoEquipo, Modelo)
    VALUES (@UsuarioID, @TipoEquipo, @Modelo);
END;
GO
/****** Object:  StoredProcedure [dbo].[AdiReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiReparacion]
    @EquipoID INT,
    @FechaSolicitud DATE,
    @Estado VARCHAR(20)
AS
BEGIN
    INSERT INTO Reparaciones (EquipoID, FechaSolicitud, Estado)
    VALUES (@EquipoID, @FechaSolicitud, @Estado);
END;
GO
/****** Object:  StoredProcedure [dbo].[AdiTecnico]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiTecnico]
    @Nombre VARCHAR(25),
    @Especialidad VARCHAR(25) = NULL
AS
BEGIN
    INSERT INTO Tecnicos (Nombre, Especialidad)
    VALUES (@Nombre, @Especialidad);
END;
GO
/****** Object:  StoredProcedure [dbo].[AdiUser]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdiUser]
    @Nombre VARCHAR(25),
    @Correo VARCHAR(50) = NULL,
    @Telefono CHAR(8) = NULL
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Correo, Telefono)
    VALUES (@Nombre, @Correo, @Telefono);
END;
GO
/****** Object:  StoredProcedure [dbo].[BAsignacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BAsignacion]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Asignaciones
    WHERE ReparacionID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[BDetalle]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BDetalle]
    @ID int
AS
BEGIN
    SELECT * 
    FROM DetallesReparacion
    WHERE ReparacionID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[BEquipos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BEquipos]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Equipos
    WHERE UsuarioID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[BReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BReparacion]
    @Estado varchar(20)
AS
BEGIN
    SELECT * 
    FROM Reparaciones
    WHERE Estado = @Estado ;
END;
GO
/****** Object:  StoredProcedure [dbo].[BTecnico]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BTecnico]
    @Nombre varchar(25)
AS
BEGIN
    SELECT * 
    FROM Tecnicos
    WHERE Nombre LIKE '%' + @Nombre + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[BUser]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BUser]
    @Nombre varchar(25)
AS
BEGIN
    SELECT * 
    FROM Usuarios
    WHERE Nombre LIKE '%' + @Nombre + '%';
END;
GO
/****** Object:  StoredProcedure [dbo].[Completada]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Completada]
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Completada';
END;
GO
/****** Object:  StoredProcedure [dbo].[DelAsignacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelAsignacion]
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones WHERE AsignacionID = @AsignacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelDetalle]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelDetalle]
    @DetalleID INT
AS
BEGIN
    DELETE FROM DetallesReparacion WHERE DetalleID = @DetalleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelEquipo]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelEquipo]
    @EquipoID INT
AS
BEGIN
    DELETE FROM Equipos WHERE EquipoID = @EquipoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelReparacion]
    @ReparacionID INT
AS
BEGIN
    DELETE FROM Reparaciones WHERE ReparacionID = @ReparacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelTecnico]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelTecnico]
    @TecnicoID INT
AS
BEGIN
    DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelUsuario]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelUsuario]
    @UsuarioID INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DLEquipo]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLEquipo]
AS
BEGIN
select EquipoID from Equipos
END;
GO
/****** Object:  StoredProcedure [dbo].[DLReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DLReparacion]
AS
BEGIN
select ReparacionID from Reparaciones
END;
GO
/****** Object:  StoredProcedure [dbo].[DLTecnicos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLTecnicos]
AS
BEGIN
select TecnicoID from Tecnicos
END;
GO
/****** Object:  StoredProcedure [dbo].[DLUser]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLUser]
AS
BEGIN
select UsuarioID from Usuarios
END;

GO
/****** Object:  StoredProcedure [dbo].[GridAsignaciones]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridAsignaciones]
AS
BEGIN
    SELECT * FROM Asignaciones;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridDetalles]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridDetalles]
AS
BEGIN
    SELECT * FROM DetallesReparacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridEquipos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridEquipos]
AS
BEGIN
    SELECT * FROM Equipos;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridEquiposID]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridEquiposID]
AS
BEGIN
select
E.EquipoID As EquipoID,
U.Nombre AS Usuario,
E.TipoEquipo AS Tipo,
E.Modelo AS Modelo
FROM 
Equipos E
Join Usuarios U ON E.UsuarioID = U.UsuarioID
END;
GO
/****** Object:  StoredProcedure [dbo].[GridReparaciones]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridReparaciones]
AS
BEGIN
    SELECT * FROM Reparaciones;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridReparacionID]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridReparacionID]
AS
BEGIN
select 
R.ReparacionID AS ReparacionID,
R.EquipoID AS EquipoID,
E.TipoEquipo AS Equipo,
U.Nombre AS Usuario,
R.Estado AS Estado
FROM
Reparaciones R
JOIN Equipos E ON R.EquipoID=E.EquipoID
JOIN Usuarios U ON E.UsuarioID= U.UsuarioID
END;
GO
/****** Object:  StoredProcedure [dbo].[GridTecnicos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridTecnicos]
AS
BEGIN
    SELECT * FROM Tecnicos;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridUsuarios]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridUsuarios]
AS
BEGIN
    SELECT * FROM Usuarios;
END;
GO
/****** Object:  StoredProcedure [dbo].[GridUsuariosID]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GridUsuariosID]
AS
BEGIN
select UsuarioID, Nombre from Usuarios
END;
GO
/****** Object:  StoredProcedure [dbo].[logins]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[logins]
    @SesionID VARCHAR(25),
    @Contrasena VARCHAR(25)
AS
BEGIN
    SELECT SesionID, Contrasena
    FROM sesion
    WHERE SesionID = @SesionID AND Contrasena = @Contrasena;
END;

GO
/****** Object:  StoredProcedure [dbo].[MAsignacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAsignacion]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Asignaciones
    WHERE AsignacionID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[MDetalles]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MDetalles]
    @ID int
AS
BEGIN
    SELECT * 
    FROM DetallesReparacion
    WHERE DetalleID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[MEquipos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MEquipos]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Equipos
    WHERE EquipoID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[MReparaciones]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MReparaciones]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Reparaciones
    WHERE ReparacionID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[MTecnicos]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTecnicos]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Tecnicos
    WHERE TecnicoID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[MUser]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MUser]
    @ID int
AS
BEGIN
    SELECT * 
    FROM Usuarios
    WHERE UsuarioID = @ID ;
END;
GO
/****** Object:  StoredProcedure [dbo].[Pendientes]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pendientes]
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Pendiente';
END;
GO
/****** Object:  StoredProcedure [dbo].[PorAsignar]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PorAsignar]
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
WHERE r.Estado = 'Por Asignar';
END;
GO
/****** Object:  StoredProcedure [dbo].[Solicitudes]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Solicitudes]
AS
BEGIN
SELECT 
    r.ReparacionID AS Reparacion,
	a.AsignacionID AS Asignacion,
    u.Nombre AS Nombre, 
    COALESCE(t.Nombre, 'No asignado') AS Tecnico,
    r.FechaSolicitud AS Fecha,
    r.Estado AS Estado
FROM Reparaciones r
JOIN 
    Equipos E ON R.EquipoID = E.EquipoID
JOIN 
    Usuarios U ON E.UsuarioID = U.UsuarioID
LEFT JOIN Asignaciones a ON r.ReparacionID = a.ReparacionID
LEFT JOIN Tecnicos t ON a.TecnicoID = t.TecnicoID
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAsignacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAsignacion]
    @AsignacionID INT,
    @ReparacionID INT = NULL,
    @TecnicoID INT = NULL,
    @FechaAsignacion DATE = NULL
AS
BEGIN
    UPDATE Asignaciones
    SET ReparacionID = COALESCE(@ReparacionID, ReparacionID),
        TecnicoID = COALESCE(@TecnicoID, TecnicoID),
        FechaAsignacion = COALESCE(@FechaAsignacion, FechaAsignacion)
    WHERE AsignacionID = @AsignacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDetalle]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDetalle]
    @DetalleID INT,
    @ReparacionID INT = NULL,
    @Descripcion VARCHAR(50) = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
AS
BEGIN
    UPDATE DetallesReparacion
    SET ReparacionID = COALESCE(@ReparacionID, ReparacionID),
        Descripcion = COALESCE(@Descripcion, Descripcion),
        FechaInicio = COALESCE(@FechaInicio, FechaInicio),
        FechaFin = COALESCE(@FechaFin, FechaFin)
    WHERE DetalleID = @DetalleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEquipo]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEquipo]
    @EquipoID INT,
    @UsuarioID INT = NULL,
    @TipoEquipo VARCHAR(50) = NULL,
    @Modelo VARCHAR(50) = NULL
AS
BEGIN
    UPDATE Equipos
    SET UsuarioID = COALESCE(@UsuarioID, UsuarioID),
        TipoEquipo = COALESCE(@TipoEquipo, TipoEquipo),
        Modelo = COALESCE(@Modelo, Modelo)
    WHERE EquipoID = @EquipoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateReparacion]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReparacion]
    @ReparacionID INT,
    @EquipoID INT = NULL,
    @FechaSolicitud DATE = NULL,
    @Estado VARCHAR(20) = NULL
AS
BEGIN
    UPDATE Reparaciones
    SET EquipoID = COALESCE(@EquipoID, EquipoID),
        FechaSolicitud = COALESCE(@FechaSolicitud, FechaSolicitud),
        Estado = COALESCE(@Estado, Estado)
    WHERE ReparacionID = @ReparacionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTecnico]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTecnico]
    @TecnicoID INT,
    @Nombre VARCHAR(25) = NULL,
    @Especialidad VARCHAR(25) = NULL
AS
BEGIN
    UPDATE Tecnicos
    SET Nombre = COALESCE(@Nombre, Nombre),
        Especialidad = COALESCE(@Especialidad, Especialidad)
    WHERE TecnicoID = @TecnicoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateUsuario]    Script Date: 22/3/2025 21:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUsuario]
    @UsuarioID INT,
    @Nombre VARCHAR(25) = NULL,
    @Correo VARCHAR(50) = NULL,
    @Telefono CHAR(8) = NULL
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = COALESCE(@Nombre, Nombre),
	Correo = COALESCE(@Correo, Correo),
    Telefono = COALESCE(@Telefono, Telefono)
    WHERE UsuarioID = @UsuarioID;
END;
GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
