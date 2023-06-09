USE [master]
GO
/****** Object:  Database [mid_proj]    Script Date: 2023/2/16 下午 03:58:33 ******/
CREATE DATABASE [mid_proj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test02.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mid_proj] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mid_proj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mid_proj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mid_proj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mid_proj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mid_proj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mid_proj] SET ARITHABORT OFF 
GO
ALTER DATABASE [mid_proj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mid_proj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mid_proj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mid_proj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mid_proj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mid_proj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mid_proj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mid_proj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mid_proj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mid_proj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mid_proj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mid_proj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mid_proj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mid_proj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mid_proj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mid_proj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mid_proj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mid_proj] SET RECOVERY FULL 
GO
ALTER DATABASE [mid_proj] SET  MULTI_USER 
GO
ALTER DATABASE [mid_proj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mid_proj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mid_proj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mid_proj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mid_proj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mid_proj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mid_proj', N'ON'
GO
ALTER DATABASE [mid_proj] SET QUERY_STORE = OFF
GO
USE [mid_proj]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 2023/2/16 下午 03:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[O_ID] [nvarchar](100) NOT NULL,
	[No] [int] NOT NULL,
	[details] [nvarchar](50) NOT NULL,
	[price] [int] NULL,
	[main] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order Details] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC,
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2023/2/16 下午 03:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[O_ID] [nvarchar](100) NOT NULL,
	[No] [smallint] NOT NULL,
	[main] [nvarchar](50) NULL,
	[qty_main] [smallint] NULL,
	[is_mealset] [bit] NULL,
	[beverage] [nvarchar](50) NULL,
	[qty_beverage] [smallint] NULL,
	[sweet] [nvarchar](50) NULL,
	[qty_sweet] [smallint] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC,
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/2/16 下午 03:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[O_ID] [nvarchar](100) NOT NULL,
	[O_datetime] [datetime] NOT NULL,
	[INorOUT] [nchar](10) NOT NULL,
	[Tel] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2023/2/16 下午 03:58:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[P_Name] [nvarchar](50) NOT NULL,
	[P_type] [nvarchar](50) NOT NULL,
	[P_price] [int] NOT NULL,
	[P_image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302161894', 1, N'炒飯 套餐 錫蘭紅茶 冰淇淋鬆餅 ', 250, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302161894', 2, N'微笑布丁 1 杯 ', 85, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302165926', 1, N'內用2 ~ 叉燒拉麵', 190, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302165926', 2, N'內用2 ~ 微笑布丁 1 杯 ', 85, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302165926', 3, N'內用2 ~ 冰淇淋鬆餅 1 杯 ', 80, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302167163', 1, N'烏龍麵', 120, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302167163', 3, N'冰淇淋鬆餅 1 杯 ', 80, NULL)
INSERT [dbo].[Order Details] ([O_ID], [No], [details], [price], [main]) VALUES (N'2302167163', 4, N'綜合聖代 1 杯 ', 95, NULL)
GO
INSERT [dbo].[order_detail] ([O_ID], [No], [main], [qty_main], [is_mealset], [beverage], [qty_beverage], [sweet], [qty_sweet], [total]) VALUES (N'2302162860', 2, NULL, NULL, 0, NULL, NULL, N'冰淇淋鬆餅', 1, 80)
INSERT [dbo].[order_detail] ([O_ID], [No], [main], [qty_main], [is_mealset], [beverage], [qty_beverage], [sweet], [qty_sweet], [total]) VALUES (N'2302162860', 3, NULL, NULL, 0, NULL, NULL, N'綜合聖代', 1, 95)
INSERT [dbo].[order_detail] ([O_ID], [No], [main], [qty_main], [is_mealset], [beverage], [qty_beverage], [sweet], [qty_sweet], [total]) VALUES (N'2302168258', 2, N'海陸披薩', 1, 1, N'莓果冰沙', 1, N'微笑布丁', 1, 320)
INSERT [dbo].[order_detail] ([O_ID], [No], [main], [qty_main], [is_mealset], [beverage], [qty_beverage], [sweet], [qty_sweet], [total]) VALUES (N'2302168258', 3, NULL, NULL, 0, NULL, NULL, N'冰淇淋鬆餅', 3, 240)
INSERT [dbo].[order_detail] ([O_ID], [No], [main], [qty_main], [is_mealset], [beverage], [qty_beverage], [sweet], [qty_sweet], [total]) VALUES (N'2302168258', 4, NULL, NULL, 0, NULL, NULL, N'綜合聖代', 1, 95)
GO
INSERT [dbo].[Orders] ([O_ID], [O_datetime], [INorOUT], [Tel]) VALUES (N'2302161894', CAST(N'2023-02-16T14:11:23.020' AS DateTime), N'內用2       ', N'2223333')
INSERT [dbo].[Orders] ([O_ID], [O_datetime], [INorOUT], [Tel]) VALUES (N'2302162860', CAST(N'2023-02-16T15:49:47.233' AS DateTime), N'內用7       ', N'112222')
INSERT [dbo].[Orders] ([O_ID], [O_datetime], [INorOUT], [Tel]) VALUES (N'2302165926', CAST(N'2023-02-16T09:59:22.253' AS DateTime), N'內用        ', N'09123456')
INSERT [dbo].[Orders] ([O_ID], [O_datetime], [INorOUT], [Tel]) VALUES (N'2302167163', CAST(N'2023-02-16T09:22:39.280' AS DateTime), N'外帶        ', N'12 3335 2')
INSERT [dbo].[Orders] ([O_ID], [O_datetime], [INorOUT], [Tel]) VALUES (N'2302168258', CAST(N'2023-02-16T15:47:16.673' AS DateTime), N'內用2       ', N'111122')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (1, N'炒飯', N'main', 150, N'chaohan.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (2, N'海陸披薩', N'main', 220, N'pizza.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (3, N'叉燒拉麵', N'main', 190, N'ramen.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (4, N'烏龍麵', N'main', 120, N'udon.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (6, N'玫瑰花茶', N'beverage', 90, N'rosetea.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (7, N'錫蘭紅茶', N'beverage', 70, N'redtea.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (8, N'莓果冰沙', N'beverage', 80, N'sorbetti.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (9, N'綜合聖代', N'sweet', 95, N'parfait.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (10, N'微笑布丁', N'sweet', 85, N'pudding.gif')
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_type], [P_price], [P_image]) VALUES (11, N'冰淇淋鬆餅', N'sweet', 80, N'pancake.gif')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order Details]  WITH CHECK ADD  CONSTRAINT [FK_Order Details_Orders] FOREIGN KEY([O_ID])
REFERENCES [dbo].[Orders] ([O_ID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order Details_Orders]
GO
USE [master]
GO
ALTER DATABASE [mid_proj] SET  READ_WRITE 
GO
