USE [master]
GO
/****** Object:  Database [IIBOOK] ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'IIBOOK')
BEGIN
	ALTER DATABASE [IIBOOK] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [IIBOOK] SET ONLINE;
	DROP DATABASE [IIBOOK];
END
GO
CREATE DATABASE [IIBOOK]

ALTER DATABASE [IIBOOK] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IIBOOK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IIBOOK] SET ANSI_NULL_DEFAULT OFF 
ALTER DATABASE [IIBOOK] SET ANSI_NULLS OFF 
ALTER DATABASE [IIBOOK] SET ANSI_PADDING OFF 
ALTER DATABASE [IIBOOK] SET ANSI_WARNINGS OFF 
ALTER DATABASE [IIBOOK] SET ARITHABORT OFF 
ALTER DATABASE [IIBOOK] SET AUTO_CLOSE OFF 
ALTER DATABASE [IIBOOK] SET AUTO_SHRINK OFF 
ALTER DATABASE [IIBOOK] SET AUTO_UPDATE_STATISTICS ON 
ALTER DATABASE [IIBOOK] SET CURSOR_CLOSE_ON_COMMIT OFF 
ALTER DATABASE [IIBOOK] SET CURSOR_DEFAULT  GLOBAL 
ALTER DATABASE [IIBOOK] SET CONCAT_NULL_YIELDS_NULL OFF 
ALTER DATABASE [IIBOOK] SET NUMERIC_ROUNDABORT OFF 
ALTER DATABASE [IIBOOK] SET QUOTED_IDENTIFIER OFF 
ALTER DATABASE [IIBOOK] SET RECURSIVE_TRIGGERS OFF 
ALTER DATABASE [IIBOOK] SET  ENABLE_BROKER 
ALTER DATABASE [IIBOOK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ALTER DATABASE [IIBOOK] SET DATE_CORRELATION_OPTIMIZATION OFF 
ALTER DATABASE [IIBOOK] SET TRUSTWORTHY OFF 
ALTER DATABASE [IIBOOK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
ALTER DATABASE [IIBOOK] SET PARAMETERIZATION SIMPLE 
ALTER DATABASE [IIBOOK] SET READ_COMMITTED_SNAPSHOT OFF 
ALTER DATABASE [IIBOOK] SET HONOR_BROKER_PRIORITY OFF 
ALTER DATABASE [IIBOOK] SET RECOVERY FULL 
ALTER DATABASE [IIBOOK] SET  MULTI_USER 
ALTER DATABASE [IIBOOK] SET PAGE_VERIFY CHECKSUM  
ALTER DATABASE [IIBOOK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IIBOOK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IIBOOK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IIBOOK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IIBOOK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IIBOOK', N'ON'
GO
ALTER DATABASE [IIBOOK] SET QUERY_STORE = OFF
GO
USE [IIBOOK]
GO
/****** Object:  Table [dbo].[book]    IIBOOK ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] int IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](80),
	[author] [nvarchar](80),
	[categoryid] int,
	[quantity] smallint,
	[price] decimal(10,2),
	[is_sale] bit,
	[discount] smallint,
	[image] [varchar](500),
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    IIBOOK ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] int identity(1,1) not null,
	[name] [nvarchar](100),
	 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] int IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50),
	[gender] [bit],
	[dob] [date],
	[email] [varchar](50) NULL,
	[phone] [varchar](11) NULL,
	[address] [nvarchar](200) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[is_super] [bit] NOT NULL
CONSTRAINT [PK_customer] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[order]    IIBOOK ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] int IDENTITY(1,1) NOT NULL,
	[userid] int NOT NULL,
	[orderdate] [date],
	[subtotal] decimal(10,2) ,
	[shipping] decimal(10,2) ,
	[total] decimal(10,2),
	[shipper] [nvarchar](50),
	[status] [nvarchar](50)
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItem]    IIBOOK ******/
SET ANSI_PADDING ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[orderid] int NOT NULL,
	[bookid] int NOT NULL,
	quantity [smallint] ,
	price decimal(10,2) ,
)
GO

/****** Object:  Table [dbo].[Discount] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	id int IDENTITY(1,1) not null,
	discounttype varchar(40) not null,
	flag smallint ,
	notes nvarchar(200),
	discount decimal(4,2) not null
CONSTRAINT [PK_discount] PRIMARY KEY NONCLUSTERED 
(
	[discounttype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[BookIntro] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIntro](
	bookid int not null,
	intro nvarchar(1000) not null
CONSTRAINT [PK_bookintro] PRIMARY KEY NONCLUSTERED 
(
	bookid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[Cart]    Script Date: 7/1/2022 1:29:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[bookid] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([bookid])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
------
ALTER TABLE [dbo].[User] ADD  DEFAULT (0) FOR [is_super]
GO
--ALTER TABLE [dbo].[Book] ADD  DEFAULT ('UNDECIDED') FOR [type]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([orderid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY(bookid)
REFERENCES [dbo].Book (id)
GO
ALTER TABLE [dbo].[BookIntro]  WITH CHECK ADD FOREIGN KEY(bookid)
REFERENCES [dbo].[Book] (id)
GO
--ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY(did)
--REFERENCES [dbo].[Discount] (id)
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY(categoryid)
REFERENCES [dbo].[Category] (id)
GO

--ALTER TABLE [dbo].[authors]  WITH CHECK ADD CHECK  (([au_id] like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO

--ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [CK_user_id] CHECK  (([user_id] like '[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]' OR [user_id] like '[A-Z]-[A-Z][1-9][0-9][0-9][0-9][0-9][FM]'))
GO

INSERT [dbo].[User] ([fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super]) VALUES ( N'Vinh Nguyen', 1, CAST(N'2002-12-25' AS Date), N'vinhvn102@gmail.com', N'0382132025', N'FBT University ', N'admin', N'admin',1)
INSERT [dbo].[User] ([fullname], [gender], [dob], [email], [phone], [address], [username], [password], [is_super]) VALUES ( N'Vinh Nguyen', 1, CAST(N'2002-12-25' AS Date), N'vinhvn102@gmail.com', N'0382132025', N'FBT University ', N'vinh', N'2002',0)
GO
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'NewBook', NULL, N'Brand new spice', CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'Bronze', NULL, N'Non-prime', CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'Silver', NULL, N'Mediocre', CAST(15.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'Gold', NULL, N'Top-tier', CAST(20.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'Ruby', NULL, N'PRIME', CAST(25.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'GoodDeal', 3, N'Rising Star', CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Discount] ([discounttype], [flag], [notes], [discount]) VALUES (N'BigDeal', 10, N'Meteor', CAST(20.00 AS Decimal(4, 2)))
GO
Insert [dbo].[Category] ([name]) values (N'Crime, Thriller & Mystery'),(N'Fantasy, Horror'),(N'Science/Historical Fiction'),(N'Manga&LN')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price],[is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Book] ( [title], [author], [categoryid],[quantity], [price], [is_sale], [discount], [image]) VALUES ( N'Classroom Of The Elite', N'Kinugasa', 4,200, CAST(27.00 AS Decimal(10, 2)), 1, 10, N'https://cdn.novelupdates.com/images/2017/02/cover00219.jpeg')
GO
INSERT [dbo].[Order] ( [userid], [orderdate], [subtotal], [shipping], [total], [shipper], [status]) VALUES ( 1, CAST(N'2022-06-26' AS Date), NULL, NUll, NULL, N'Fast Deliver', N'Processing')
GO
INSERT [dbo].[OrderItem] ([orderid], [bookid], [quantity], [price]) VALUES (1, 1, 3, NULL)
GO
INSERT [dbo].[BookIntro] ([bookid], [intro]) VALUES (1, N'Kōdo Ikusei Senior High School, a leading prestigious school with state-of-the-art facilities where nearly 100% of students go on to university or find employment. The students there have the freedom to wear any hairstyle and bring any personal effects they desire. Kōdo Ikusei is a paradise-like school, but the truth is that only the most superior of students receive favorable treatment.\nThe protagonist Kiyotaka Ayanokōji is a student of D-class, which is where the school dumps its “inferior” students in order to ridicule them. For a certain reason, Kiyotaka was careless on his entrance examination, and was put in D-class. After meeting Suzune Horikita and Kikyō Kushida, two other students in his class, Kiyotaka’s situation begins to change.')
GO
USE [master]
GO
ALTER DATABASE [IIBOOK] SET  READ_WRITE 
GO
