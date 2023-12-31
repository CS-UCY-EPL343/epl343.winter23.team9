USE [DB]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 29/11/2023 8:35:22 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[Total_Amount] [int] NOT NULL,
	[Cart_ID] [int] NOT NULL,
	[UserName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CART_PRODUCT]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART_PRODUCT](
	[Cart_Quantity] [int] NOT NULL,
	[Cart_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
 CONSTRAINT [PK_CART_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Cart_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[Email] [varchar](30) NOT NULL,
	[Phone_Number] [varchar](8) NOT NULL,
	[First_Name] [varchar](30) NOT NULL,
	[Last_Name] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Passwd] [char](256) NOT NULL,
	[Birth_Date] [date] NOT NULL,
	[Loyalty_Points] [int] NOT NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_PRODUCT]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_PRODUCT](
	[Order_Quantity] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
 CONSTRAINT [PK_ORDER_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[Order_ID] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Date] [date] NOT NULL,
	[UserName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[Product_Name] [varchar](50) NOT NULL,
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Stock] [int] NOT NULL,
	[Category] [varchar](30) NOT NULL,
	[Image_path] [varchar](200) NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'admin@admin.com', N'99999999', N'ADMIN', N'ADMIN', N'administrator', N'admin                                                                                                                                                                                                                                                           ', CAST(N'1965-01-01' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'afilippo0@zimbio.com', N'99245776', N'Alysia', N'Filippo', N'afilippo0', N'MLdUMm8e                                                                                                                                                                                                                                                        ', CAST(N'1981-03-31' AS Date), 51)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'afillon8@admin.ch', N'99541689', N'Adeline', N'Fillon', N'afillon8', N'StSEIopS                                                                                                                                                                                                                                                        ', CAST(N'1973-01-21' AS Date), 152)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'aklaus9@cloudflare.com', N'99766355', N'Axel', N'Klaus', N'aklaus9', N'xSykNWIU                                                                                                                                                                                                                                                        ', CAST(N'1969-11-03' AS Date), 146)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'asruttonp@telegraph.co.uk', N'99832471', N'Ada', N'Srutton', N'asruttonp', N'H8jGkBZW                                                                                                                                                                                                                                                        ', CAST(N'1973-09-01' AS Date), 127)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'bmattiussi2@webs.com', N'99593010', N'Bernie', N'Mattiussi', N'bmattiussi2', N'z3LQGpsQ                                                                                                                                                                                                                                                        ', CAST(N'1997-03-23' AS Date), 2)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'bomurtagh3@globo.com', N'99606252', N'Benjy', N'O''Murtagh', N'bomurtagh3', N'Nn5CVh6J                                                                                                                                                                                                                                                        ', CAST(N'1987-12-02' AS Date), 159)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'bvigours1c@redcross.org', N'99220486', N'Blanch', N'Vigours', N'bvigours1c', N'7qWEm6bg                                                                                                                                                                                                                                                        ', CAST(N'1998-10-24' AS Date), 27)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'bwoollettn@ifeng.com', N'99937340', N'Bella', N'Woollett', N'bwoollettn', N'GbxipWzy                                                                                                                                                                                                                                                        ', CAST(N'1972-12-31' AS Date), 186)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'cesteq@eventbrite.com', N'99975043', N'Cari', N'Este', N'cesteq', N'11yKijJ1                                                                                                                                                                                                                                                        ', CAST(N'1978-01-21' AS Date), 98)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'cpactat6@webmd.com', N'99037435', N'Cazzie', N'Pactat', N'cpactat6', N'psFcQXMn                                                                                                                                                                                                                                                        ', CAST(N'1970-06-13' AS Date), 137)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'dbirchett1@about.com', N'99486332', N'Dreddy', N'Birchett', N'dbirchett1', N'J4XBIiwi                                                                                                                                                                                                                                                        ', CAST(N'1960-05-09' AS Date), 82)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'dcardisy@globo.com', N'99967824', N'Dede', N'Cardis', N'dcardisy', N'yOd7Mt01                                                                                                                                                                                                                                                        ', CAST(N'1962-04-14' AS Date), 184)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'dchampnessv@disqus.com', N'99506060', N'Deeyn', N'Champness', N'dchampnessv', N'sxc8IpRW                                                                                                                                                                                                                                                        ', CAST(N'1985-11-14' AS Date), 159)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'ecristofvaoc@twitter.com', N'99158718', N'Elsinore', N'Cristofvao', N'ecristofvaoc', N'NtKjFgS1                                                                                                                                                                                                                                                        ', CAST(N'1962-10-30' AS Date), 54)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'eoquin16@shutterfly.com', N'99001878', N'Enrika', N'O''Quin', N'eoquin16', N'qnO4uQ8t                                                                                                                                                                                                                                                        ', CAST(N'1997-02-12' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'evindenh@rambler.ru', N'99316700', N'Ewan', N'Vinden', N'evindenh', N'skcMfd26                                                                                                                                                                                                                                                        ', CAST(N'1995-07-24' AS Date), 44)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'fmcreedyz@oaic.gov.au', N'99533549', N'Ferdinande', N'McReedy', N'fmcreedyz', N'LIpxJMYs                                                                                                                                                                                                                                                        ', CAST(N'2003-08-12' AS Date), 48)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'gallsebrookj@mozilla.com', N'99522616', N'Gabbie', N'Allsebrook', N'gallsebrookj', N'KFhBzNyL                                                                                                                                                                                                                                                        ', CAST(N'1991-12-04' AS Date), 162)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'gdurradr@ftc.gov', N'99587734', N'Gertruda', N'Durrad', N'gdurradr', N'PF1Qz3mB                                                                                                                                                                                                                                                        ', CAST(N'1968-05-22' AS Date), 55)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'gmaylame@flickr.com', N'99624142', N'Gerhard', N'Maylam', N'gmaylame', N'uTDJfr5p                                                                                                                                                                                                                                                        ', CAST(N'1997-09-13' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'gvoice4@imageshack.us', N'99342814', N'Gayle', N'Voice', N'gvoice4', N'Y5ojus7L                                                                                                                                                                                                                                                        ', CAST(N'1980-02-11' AS Date), 28)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'hbottomers@ycombinator.com', N'99400436', N'Hillie', N'Bottomer', N'hbottomers', N'1PPBFv1Z                                                                                                                                                                                                                                                        ', CAST(N'1992-06-16' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'hgregol1a@elegantthemes.com', N'99154443', N'Homere', N'Gregol', N'hgregol1a', N'9Pbhp7C4                                                                                                                                                                                                                                                        ', CAST(N'1988-04-20' AS Date), 135)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'jbaloguna@yandex.ru', N'99836975', N'Jillana', N'Balogun', N'jbaloguna', N'zGUtMUOm                                                                                                                                                                                                                                                        ', CAST(N'1984-04-14' AS Date), 42)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'jcrankshaw12@deliciousdays.com', N'99963716', N'Jerrilyn', N'Crankshaw', N'jcrankshaw12', N'43jEDGuI                                                                                                                                                                                                                                                        ', CAST(N'1997-10-23' AS Date), 81)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'kgyrgorwicx18@imageshack.us', N'99312863', N'Korey', N'Gyrgorwicx', N'kgyrgorwicx18', N'bUcAVb6z                                                                                                                                                                                                                                                        ', CAST(N'2000-09-13' AS Date), 84)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'kmactrustam10@netvibes.com', N'99085919', N'Kelsey', N'MacTrustam', N'kmactrustam10', N'8EXLnNXo                                                                                                                                                                                                                                                        ', CAST(N'1991-09-01' AS Date), 51)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'leadonu@csmonitor.com', N'99069988', N'Lisle', N'Eadon', N'leadonu', N'Iev7liy4                                                                                                                                                                                                                                                        ', CAST(N'1992-07-26' AS Date), 139)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'lfarmiloed@imgur.com', N'99403947', N'Lucretia', N'Farmiloe', N'lfarmiloed', N'gbtMpxNa                                                                                                                                                                                                                                                        ', CAST(N'1993-10-01' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'lparsonson14@java.com', N'99593483', N'Lela', N'Parsonson', N'lparsonson14', N'ovaJgDtj                                                                                                                                                                                                                                                        ', CAST(N'1972-08-06' AS Date), 14)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'mblucko@sohu.com', N'99937016', N'Margy', N'Bluck', N'mblucko', N'xdu1bX7G                                                                                                                                                                                                                                                        ', CAST(N'1976-11-29' AS Date), 27)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'mvannoort1b@va.gov', N'99199787', N'Murry', N'Vannoort', N'mvannoort1b', N'OdxidSr8                                                                                                                                                                                                                                                        ', CAST(N'1987-08-17' AS Date), 26)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'ngilvaryk@github.com', N'99242060', N'Nettle', N'Gilvary', N'ngilvaryk', N'4n8DA2Rp                                                                                                                                                                                                                                                        ', CAST(N'1972-02-02' AS Date), 48)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'oantushevb@ustream.tv', N'99008032', N'Ollie', N'Antushev', N'oantushevb', N'hv2KZ8t5                                                                                                                                                                                                                                                        ', CAST(N'1971-10-03' AS Date), 119)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'pborell17@rambler.ru', N'99502114', N'Pat', N'Borell', N'pborell17', N'vhVlO4BM                                                                                                                                                                                                                                                        ', CAST(N'1980-04-12' AS Date), 44)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'pzavattiero13@weibo.com', N'99599587', N'Papageno', N'Zavattiero', N'pzavattiero13', N'z777mV2E                                                                                                                                                                                                                                                        ', CAST(N'2002-12-27' AS Date), 25)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'rcommuccix@acquirethisname.com', N'99154169', N'Ring', N'Commucci', N'rcommuccix', N'fJPCzhUH                                                                                                                                                                                                                                                        ', CAST(N'1967-08-11' AS Date), 102)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'rhaliburni@scribd.com', N'99182066', N'Rolland', N'Haliburn', N'rhaliburni', N'34FZcPzb                                                                                                                                                                                                                                                        ', CAST(N'1996-10-09' AS Date), 57)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'rkembley1d@imageshack.us', N'99004164', N'Rosanna', N'Kembley', N'rkembley1d', N'iLkFTRlC                                                                                                                                                                                                                                                        ', CAST(N'1965-12-20' AS Date), 64)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'rmarte15@usatoday.com', N'99618128', N'Robb', N'Marte', N'rmarte15', N'sxespR0S                                                                                                                                                                                                                                                        ', CAST(N'1986-04-25' AS Date), 34)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'scarn11@bbb.org', N'99799804', N'Sam', N'Carn', N'scarn11', N'XewLzbWK                                                                                                                                                                                                                                                        ', CAST(N'1963-05-07' AS Date), 112)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'scorradini19@hostgator.com', N'99552693', N'Shanna', N'Corradini', N'scorradini19', N'3guRz8EB                                                                                                                                                                                                                                                        ', CAST(N'1964-06-14' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'sjacson7@youtu.be', N'99972078', N'Stephan', N'Jacson', N'sjacson7', N'VTbD2Q5n                                                                                                                                                                                                                                                        ', CAST(N'1986-09-04' AS Date), 8)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'slunnl@nature.com', N'99826992', N'Siana', N'Lunn', N'slunnl', N'ATtbx2TU                                                                                                                                                                                                                                                        ', CAST(N'1964-05-26' AS Date), 4)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'smaultbyg@bigcartel.com', N'99034583', N'Starlin', N'Maultby', N'smaultbyg', N'tW7ATQAL                                                                                                                                                                                                                                                        ', CAST(N'1973-01-06' AS Date), 25)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'swebbe5@mail.ru', N'99141321', N'Sibilla', N'Webbe', N'swebbe5', N'FUKgyjKI                                                                                                                                                                                                                                                        ', CAST(N'1978-04-07' AS Date), 0)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'tlivenm@soup.io', N'99526606', N'Travis', N'Liven', N'tlivenm', N'f0c59bxh                                                                                                                                                                                                                                                        ', CAST(N'1969-10-12' AS Date), 150)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'tmuggletonf@digg.com', N'99654680', N'Terrye', N'Muggleton', N'tmuggletonf', N'TGJuLoHF                                                                                                                                                                                                                                                        ', CAST(N'1982-09-09' AS Date), 52)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'tsmallmant@ucla.edu', N'99343472', N'Tildy', N'Smallman', N'tsmallmant', N'Ho5nwIpV                                                                                                                                                                                                                                                        ', CAST(N'1960-10-30' AS Date), 78)
INSERT [dbo].[CUSTOMER] ([Email], [Phone_Number], [First_Name], [Last_Name], [UserName], [Passwd], [Birth_Date], [Loyalty_Points]) VALUES (N'umurrthumw@usa.gov', N'99261281', N'Ulric', N'Murrthum', N'umurrthumw', N'3fwcQEFl                                                                                                                                                                                                                                                        ', CAST(N'2002-12-28' AS Date), 155)
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Rhea Dual New Color', 1, 60, N'200W output power. Dual 18650 batteries (not included). Dimensions: 89*47*38mm Resistant covering: Combination of leather and alcantara. Compatible with atomizers up to 28mm. Chipset developed by Aspire ASP', 5, N'Mod', N'images\image1.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Riva 200', 2, 59, N'No item description', 5, N'Mod', N'images\image2.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Aegis Legend 2', 3, 55, N'Say hello to the Geekvape L200 Mod . Aegis Tri-proof Technology upgrades to the second generation. A-Lock. A new way to protect from accident. And the Geekvape L200 Mod adopts new 1.08-inch full screen for better Visual experience. Coupled with some small designs. Such as a flip cover on the charging port. It will make you feel happy in an instant. Powered by external Dual 18650 Battery. The Geekvape L200 Mod can bring 200W max output.', 5, N'Mod', N'images\image3.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Aegis Touch (T200)', 4, 75, N'A futuristic mod with a huge touch screen. The sumum for a mod . Up to 200W powered by dual 18650 batteries; 2.4? screen. A 100% customizable touch interface! IP68 certification guaranteeing perfect solidity.', 5, N'Mod', N'images\image4.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Z200', 5, 50, N'"Zeus" a legendary name inherited by Geekvape''s new Z200 kit. Works with two 18650 batteries (not included). Silicone to protect the micro-USB port. Large informative 2.4? display. Maximum power of 200 watts. Smart AS-Chip 3.0 chipset. Comes with: 1 x Box Z200. 1 x Micro-USB Cable. 1 x User Manual. Caracteristics: Dual 18650 batteries. 200 watt max power. 2.4? screen. AS-Chip 3.0', 5, N'Mod', N'images\image5.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Hell200', 6, 65, N'Hellvape returns to the front of the stage with the new Hell200 kit. 200 watts of maximum power for a very compact format and a featherweight (86g)! Works with 2 x 18650 batteries (not included). New TLC tank (5ml & 6.5ml). Taking up the ingenious system of the Wirice. The coil of the TLC is changed from the top of the tank. Simply by unscrewing the drip tip. Informative 0.96? color display. Fast charging via USB type-C (1.5A).', 5, N'Mod', N'images\image6.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Centaurus M200', 7, 70, N'The Centaurus series returns with a colorful mod. Sublime engravings adorn this box. A power of 200 watts maximum adjustable via a wheel at the switch. Works with 2 x 18650 batteries (not included). Chipset: Quest 2.0. Interchangeable panels. Fast charging via USB type-C.', 5, N'Mod', N'images\image7.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Mod Thelema Quest 200W', 8, 57, N'Delivered with: 1 Box Thelema Quest 200W. 1 USB cable. 1 USB adapter. 3 Battery holders. 1 Manual. Characteristics: Material: Aluminum alloy / Carbon fiber. Modes: Variable Wattage. Temperature Control. Size: 92mm * 55mm * 28mm. Battery: two high current 18650 batteries (not included). Wattage Range: 1-200W. Resistance range: 0.1-3.0ohm. Temperature output range: 200-600F. Screen: 0.96 -TFT. Chipset: Quest 2.0. Connection: 510', 5, N'Mod', N'images\image8.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'G Class V2 200W', 9, 175, N'Battery: 18650/20700/. Supports atomizers up to 30mm', 5, N'Mod', N'images\image9.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Odin V2', 10, 99, N'A massive box with a legendary name and unparalleled performance. Works with two 21700/18650 batteries (not included). Maximum power of 200 watts. Highly customizable mod. New extremely powerful chipset and excellent battery life management. New informative color TFT display. -Flush with atomizers with a diameter of 30mm max.', 5, N'Mod', N'images\image10.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Box Gen 200 220W', 11, 47, N'A versatile Mod all in efficiency. Dimensions: 86 x 44 x 29mm.  Firm grip with good grip. Power: 220W Information screen Axon chipsets Accepts atos of 28mm max. Batteries: 2´+¢18650 It charges super fast using a USB-C cable.', 5, N'Mod', N'images\image11.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'DRAG 4 Box Mod', 12, 55, N'177 watts of maximum power. Ultra-fast 3A charging via USB-C. Here is the new Drag version 4! Sublime design combining wood and metal. Works with 2 x 18650 batteries (not included). ECO mode to extend autonomy. New TC mode. Very easy to use thanks to the 4 differents buttons.', 5, N'Mod', N'images\image12.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Marvos X Pro', 13, 45, N'A colorful and modern 100 Watt box. Works with an 18650 battery (not included). Fast charging via USB-C (2A). Transparent and front panel with leds. Output power range: 5-100W. OLED display screen. Accepts atomizers up to 28mm. Magnetic battery door. Switch to lock the box. Multiple protections for a safe vape.', 5, N'Mod', N'images\image13.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Aegis Mini 2 M100', 14, 55, N'Elegant and light. Informative screen. Power: 100W. Battery: 2500mAh', 5, N'Mod', N'images\image14.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Mod Target 100', 15, 50, N'Firm grip with good grip. Dimensions: 87.8 x 28.6 x 35.1mm. Single 18650/21700 battery not provided. Power of 100W. Informative screen', 5, N'Mod', N'images\image15.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Nautilus XS 0.7', 16, 4, N'Replacement Aspire Nautilus XS Mesh Coil compatible with the Nautilus XS tank and Nautilus X tank. The brand new 0.7ohm XS Mesh Coil rated 18W - 22W used for either a full flavour MTL hit or a restrictive DTL experience. Constructed using Japanese Organic cotton. The Aspire Nautilus XS mesh coils provide enhanced flavour and vapour production.', 5, N'Coil', N'images\image16.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'PockeX Coil 0.6', 17, 3.9, N'The Aspire Pockex Coils are specifically designed and manufactured by Aspire for the Aspire PockeX AIO featuring their innovative U-Tech Coil Technology by diverting the flow of air past the coil twice. The double-pass causes packed vapor and awesome flavor. Recommended for 18 to 23 watts. These Aspire Pocket X Coils are made of SS316L and are particularly mouth-to-lung-friendly.', 5, N'Coil', N'images\image17.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Z 0.15 ohm XM', 18, 4, N'Z series : Z 0.15 XM. New coil with improved life time.Compatible Tank Zeus sub ohm/SE 2022.Range of use: 70-85W.', 5, N'Coil', N'images\image18.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'M COIL Z2 0.2ohm', 19, 4, N'Mesh Z2 Coil 0.2? (70W - 80W)', 5, N'Coil', N'images\image19.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Chilled Strawberries', 20, 9, N'Hijacker will seduce you in an instant with the taste of freshly-picked strawberries with a frosty finish! A spectacular e-liquid that you have to try!', 5, N'Liquid', N'images\image20.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Ice Grapes & Green Apple', 21, 9, N'Sweet and highly addictive fruity flavor of frozen grapes combined with green crisp apples gives this liquid an unrealistic substance that will fascinate you! Addictively good!', 5, N'Liquid', N'images\image21.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Grapes & Aloe Vera', 22, 9, N'Fresh pieces of Aloe Vera with a slightly sweet taste of grape juice! Served iced cold on hot summer days.', 5, N'Liquid', N'images\image22.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Butter Caramels', 23, 9, N'Gourmet artisan soft and chewy butter caramels. Creamy and smooth old-fashioned caramel treats! Goodness in every bite.', 5, N'Liquid', N'images\image23.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'American Blend Tobacco', 24, 9, N'Experience the pinnacle of vaping pleasure with our new TOBACCO artisanal e-liquid. Crafted from premium organic tobacco. Our AMERICAN BLEND flavor encapsulates the essence of traditional tobacco offering a smooth and robust vaping experience. Indulge in the rich authentic taste of meticulously selected tobacco leaves with every puff. Our unwavering dedication to premium ingredients guarantees an excellent vaping experience tailored to the discerning palate of tobacco connoisseurs.', 5, N'Liquid', N'images\image24.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'VTC5A 18650', 25, 12.5, N'Sony VTC5A Battery for Electronic Cigarette is the best on the market and in the world of vaping. The Sony Vtc5 A battery developed with the best cells of the highest quality with high discharge up to 35A with a maximum cell temperature of 80 - C or 25A continuous. Battery Flat Top 35A with flat pole and a discharge ranging from 1W to 90W. These Sony Lithium Ion batteries continue to be the most used for their reliability and operation.', 5, N'Battery', N'images\image25.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'VTC6 18650', 26, 12, N'Sony VTC6 Battery for Electronic Cigarette is the best on the market and in the world of vaping. The VTC6 are IMR lithium-ion batteries with a maximum capacity of 3000mAh and a voltage of 3.6V unprotected; with a high current up to 20A. These batteries are perfect for use on single battery electronic box mods up to 65w. Double batteries up to 130W and triple batteries up to 195W.', 5, N'Battery', N'images\image26.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'VTC6A 21700', 27, 13, N'Specifications: Capacity: 3000mAh. Positive pin type: flat top. Max discharge current: 25A.', 5, N'Battery', N'images\image27.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Nicotine', 28, 3.5, N'No item description', 5, N'Booster', N'images\image28.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Zeus Sub Ohm Tank', 29, 30, N'Parameters: Size: 26x 42.5mm. Drip tip type: 810. Juice capacity: 5.0ml. Filling method: Top fill. Mesh Z1 coil: 0.4ohm 60- 70W. Mesh Z2 coil: 0.2ohm 70- 80W (Pre-installed). Features: Quick slide coil design. High grade KA1 Mesh coil. Upgraded fill port design. Direct top airflow and top-to-bottom airflow.', 5, N'Atomizer', N'images\image29.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Dead Rabbit Max', 30, 35, N'7mm wide bowl. Diameter 28mm. Bottom feeding. Double coil postless chainring.', 5, N'Atomizer', N'images\image30.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Dead Rabbit V3 RDA 24mm', 31, 35, N'Characteristics: Height 37.35mm. Weight 42g. Stainless Steel Compositions. Air inlet On the sides. Direct inhalation. 24mm diameter.', 5, N'Atomizer', N'images\image31.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Z Max Sub Ohm Tank', 32, 30, N'Geekvape Z Max Sub Ohm Tank. The new member of Z(Zeus) series inherits the classic top-to-bottom airflow and combines adjustable top airflow system and Z-level leakproof design for zero leakage. Geekvape Z Max Tank maintains 810 drip tip and 4ml bubble glass tube(2ml spare tube included) with top filling design. And Geekvape Zeus Max Tank is only compatible with Geekvape M Series Coil to offer massive clouds boundlessly for cloud-chasing max.', 5, N'Atomizer', N'images\image32.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Pockex AIO', 33, 29, N'Aspire PockeX is an All-in-One (AIO) compact e-cig with a 2ml easy to fill tank. Powered by 1500mAh battery it can fire a maximum output wattage of 23W. Aspire PockeX AIO is designed to produce rich flavours and dense vapour production with its U-Tech Nautilus X 0.6ohm 316L SS coil. The Aspire PockeX has a compact size of 11.77cm by 1.97cm. Being just a little bit shorter than your average smartphone. The PockeX is one of the shortest tube-shaped pocket All-in-One (AIO) device.', 5, N'Pod', N'images\image33.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'KIWI - STARTER KIT', 34, 75.9, N'Size: 110 x 21 x 38 mm. Battery: 1450mAh + 400mAh. Recharge time: 1 hour and 30 minutes. Pod capacity: 1.8 ml. Aerosol voltage: 10W ~ 13W. Material: ABS + Polycarbonate.', 5, N'Pod', N'images\image34.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Kit Pod Wenax Q 1000mAh', 35, 25, N'Everything you need in the palm of your hand. Here is the Wenax Q pod. A small e-cigarette easy to handle! Built-in 1000mAh battery charges via USB-C. Power adjustable from 5 to 25 watts maximum. Cartridge with a capacity of 2ml with built-in coil. Very precise adjustable airflow perfect for an MTL to RDL draw. Automatic activation by inhalation or by button. Clear and readable informative OLED display.', 5, N'Pod', N'images\image35.png')
INSERT [dbo].[PRODUCT] ([Product_Name], [Product_ID], [Price], [Description], [Stock], [Category], [Image_path]) VALUES (N'Klypse Pod Kit', 36, 15, N'Magnetic cap. Dimensions: 94mm*29mm*15.2mm. Built-in 700mAh battery. 16W maximum output. LED light. 2ml Mesh cartridge. Aluminum alloy material. Removable top dust cap.', 5, N'Pod', N'images\image36.png')
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT ((0)) FOR [Loyalty_Points]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT ('No item description') FOR [Description]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_CUSTOMER] FOREIGN KEY([UserName])
REFERENCES [dbo].[CUSTOMER] ([UserName])
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_CUSTOMER]
GO
ALTER TABLE [dbo].[CART_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_CART_PRODUCT_CART] FOREIGN KEY([Cart_ID])
REFERENCES [dbo].[CART] ([Cart_ID])
GO
ALTER TABLE [dbo].[CART_PRODUCT] CHECK CONSTRAINT [FK_CART_PRODUCT_CART]
GO
ALTER TABLE [dbo].[CART_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_CART_PRODUCT_PRODUCT] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[PRODUCT] ([Product_ID])
GO
ALTER TABLE [dbo].[CART_PRODUCT] CHECK CONSTRAINT [FK_CART_PRODUCT_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PRODUCT_ORDER] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[ORDERS] ([Order_ID])
GO
ALTER TABLE [dbo].[ORDER_PRODUCT] CHECK CONSTRAINT [FK_ORDER_PRODUCT_ORDER]
GO
ALTER TABLE [dbo].[ORDER_PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PRODUCT_PRODUCT] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[PRODUCT] ([Product_ID])
GO
ALTER TABLE [dbo].[ORDER_PRODUCT] CHECK CONSTRAINT [FK_ORDER_PRODUCT_PRODUCT]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMER] FOREIGN KEY([UserName])
REFERENCES [dbo].[CUSTOMER] ([UserName])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH NOCHECK ADD CHECK  (([Email] like '%@%.com'))
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH NOCHECK ADD CHECK  (([Loyalty_Points]>=(0)))
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH NOCHECK ADD CHECK  (([Phone_Number] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD CHECK  (([Status]='In progress' OR [Status]='Cancelled' OR [Status]='Completed' OR [Status]='Ready for pickup' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH NOCHECK ADD CHECK  (([Category]='Pod' OR [Category]='Coil' OR [Category]='Booster' OR [Category]='Liquid' OR [Category]='Battery' OR [Category]='Atomizer' OR [Category]='Mod'))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH NOCHECK ADD CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH NOCHECK ADD CHECK  (([Stock]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[spAddProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddProduct]
  @Product_Name VARCHAR(50),
  @Price FLOAT,
  @Description VARCHAR(500),
  @Stock INT,
  @Category VARCHAR(30),
  @Image_path VARCHAR(200)
  AS 
  BEGIN
IF @Stock < 0 BEGIN PRINT 'Error: Stock cannot be negative' RETURN
END
IF @Price < 0 BEGIN PRINT 'Error: Price cannot be negative' RETURN
END
IF NOT (@Category='Mod' OR @Category='Atomizer' OR @Category='Battery' OR @Category='Liquid' OR @Category='Booster' OR @Category='Coil' OR @Category='Pod')
BEGIN PRINT 'Error: Invalid category' RETURN
END
BEGIN
INSERT INTO [dbo].PRODUCT
VALUES (
    RTRIM(@Product_Name),
    @Price,
    RTRIM(@Description),
    @Stock,
    @Category,
    RTRIM(@Image_path)
  );
  PRINT 'Success: Product added/updated.'
END
END
GO
/****** Object:  StoredProcedure [dbo].[spADMINLOGIN]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spADMINLOGIN] @UserName VARCHAR(30),
  @Passwd VARCHAR(20) 
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].CUSTOMER
    WHERE [UserName] = @UserName AND @UserName = 'administrator'
      AND [Passwd] = @Passwd
  )  BEGIN PRINT 'Error: Invalid username or password' PRINT HASHBYTES('SHA2_256', @Passwd)
END
END
GO
/****** Object:  StoredProcedure [dbo].[spAllProducts]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAllProducts]
AS
BEGIN
SELECT P.*
FROM [dbo].[PRODUCT] P
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAccount]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteAccount] 
@UserName VARCHAR(30)
AS
BEGIN 
IF NOT EXISTS (
    SELECT *
    FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @UserName    
  ) BEGIN PRINT 'Error: Username does not exist.' RETURN
END
DELETE FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @UserName
PRINT 'Success: Account deleted'
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteProduct] @Product_ID INT
AS
BEGIN
IF NOT EXISTS (
    SELECT *
    FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @Product_ID
  ) BEGIN PRINT 'Error: Product ID does not exist.' RETURN
END
DELETE FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @Product_ID
PRINT 'Success: Product deleted'
END
GO
/****** Object:  StoredProcedure [dbo].[spEditAccount]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEditAccount]
 @c_Email VARCHAR(30),
 @c_Phone_Number VARCHAR(8),
 @c_First_Name VARCHAR(30),
 @c_Last_Name VARCHAR(30),
 @c_UserName VARCHAR(30), --php stores the current username and send it to the stored procedure
 @c_newUserName VARCHAR(30), --new username from customer
 @c_Passwd VARCHAR(256),
 @c_Birth_Date DATE
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].[CUSTOMER]
    WHERE [UserName] = @c_UserName
  ) BEGIN PRINT 'Error: Account does not exist' RETURN
END
  EXEC spDeleteAccount @Username=@c_UserName;
  EXEC spSIGNUP @Email=@c_Email, @Phone_Number=@c_Phone_Number, @First_Name=@c_First_Name, @Last_Name=@c_Last_Name, @UserName=@c_newUserName, @Passwd=@c_Passwd, @Birth_Date=@c_Birth_Date;
END
GO
/****** Object:  StoredProcedure [dbo].[spEditProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEditProduct]
  @p_Name VARCHAR(50),
  @p_ID INT,
  @p_Price FLOAT,
  @p_Description VARCHAR(500),
  @p_Stock INT,
  @p_Category VARCHAR(30),
  @p_Image_path VARCHAR(200)
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].[PRODUCT]
    WHERE [Product_ID] = @p_ID
  ) BEGIN PRINT 'Error: Product does not exist' RETURN
END
  EXEC spDeleteProduct @Product_ID=@p_ID;
  EXEC spAddProduct @Product_Name=@p_Name, @Price=@p_Price, @Description=@p_Description, @Stock=@p_Stock, @Category=@p_Category, @Image_path=@p_Image_path;

END
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomer]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCustomer]
@UserName VARCHAR(30)
AS 
BEGIN
SELECT *
FROM [dbo].[CUSTOMER]
WHERE [Username] = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[spGetProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetProduct] 
@Product_ID INT
AS 
BEGIN
SELECT *
FROM [dbo].[PRODUCT]
WHERE [Product_ID] = @Product_ID
END
GO
/****** Object:  StoredProcedure [dbo].[spLOGIN]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLOGIN] @UserName VARCHAR(30),
  @Passwd VARCHAR(20) 
  AS 
  BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM [dbo].CUSTOMER
    WHERE [UserName] = @UserName
      AND [Passwd] = @Passwd
  )  BEGIN PRINT 'Error: Invalid username or password' PRINT HASHBYTES('SHA2_256', @Passwd)
END
END
GO
/****** Object:  StoredProcedure [dbo].[spProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spProduct] (@ProductArg CHAR(50) = NULL) 
AS 
BEGIN
SELECT [Product_Name],
  [Price],
  [Image_path]
FROM [dbo].[PRODUCT]
WHERE Category = @ProductArg
END
GO
/****** Object:  StoredProcedure [dbo].[spProducts]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spProducts] 
AS 
BEGIN
SELECT [Product_Name],
  [Price],
  [Image_path]
FROM [dbo].[PRODUCT]
WHERE Category = 'Mod'
  OR Category = 'Atomizer'
  OR Category = 'Battery'
  OR Category = 'Coil'
END
GO
/****** Object:  StoredProcedure [dbo].[spSIGNUP]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSIGNUP] 
@Email VARCHAR(30),
@Phone_Number VARCHAR(8),
@First_Name VARCHAR(30),
@Last_Name VARCHAR(30),
@UserName VARCHAR(30),
@Passwd VARCHAR(256),
@Birth_Date DATE
AS 
BEGIN
IF EXISTS (
  SELECT *
  FROM [dbo].CUSTOMER
  WHERE [UserName] = @UserName
) BEGIN PRINT 'Error: Username already exists'
END
ELSE BEGIN
INSERT INTO [dbo].CUSTOMER
VALUES (
    RTRIM(@Email),
    RTRIM(@Phone_Number),
    RTRIM(@First_Name),
    RTRIM(@Last_Name),
    RTRIM(@UserName),
    RTRIM(@Passwd),
    @Birth_Date,
    CONVERT(INT, '0')
  );
END
END
GO
/****** Object:  StoredProcedure [dbo].[spViewProduct]    Script Date: 29/11/2023 8:35:23 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spViewProduct]
@Product_Name VARCHAR(50)
AS
BEGIN
SELECT *
FROM [dbo].[PRODUCT]
WHERE [Product_Name] = @Product_Name
END
GO
