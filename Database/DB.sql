USE [TestTask]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](128) NULL,
	[PostalCode] [nvarchar](16) NULL,
	[CountryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](128) NULL,
	[Email] [nvarchar](128) NULL,
	[Mobile] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelCategory]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelFacilities]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelFacilities](
	[FacilityId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[Breakfast] [bit] NULL,
	[Wifi] [bit] NULL,
	[Parking] [bit] NULL,
	[Spa] [bit] NULL,
	[SmokingRooms] [bit] NULL,
	[NonSmokingRooms] [bit] NULL,
	[FamilyRooms] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelPics]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelPics](
	[PicId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[PicURL] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](500) NULL,
	[CityId] [int] NULL,
	[CategoryId] [int] NULL,
	[MapLocation] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[Rating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceGuest]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceGuest](
	[InvoiceGuestId] [int] IDENTITY(1,1) NOT NULL,
	[GuestId] [int] NULL,
	[ReservationId] [int] NULL,
	[InvoiceAmount] [decimal](18, 0) NULL,
	[IssuedOn] [date] NULL,
	[PaidOn] [date] NULL,
	[CancelledOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceGuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[GuestId] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[DiscountPercentage] [decimal](18, 0) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[ReservationNo] [nvarchar](50) NULL,
	[CreatedOn] [date] NULL,
	[RoomId] [int] NULL,
	[PriceAfterDiscount] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](128) NULL,
	[Description] [nvarchar](max) NULL,
	[RoomTypeId] [int] NULL,
	[CurrentPrice] [decimal](18, 0) NULL,
	[HotelId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomPics]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPics](
	[PicId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[PicURL] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 13/11/2022 17:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (1, N'Dubai', N'00123', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (2, N'Abu Dhabi', N'00124', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (3, N'Sharjah', N'00125', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (4, N'Ajman', N'00126', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (5, N'Umm Al Quwain', N'00127', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (6, N'Fujairah', N'00128', 1)
GO
INSERT [dbo].[City] ([CityId], [CityName], [PostalCode], [CountryId]) VALUES (7, N'Ras Al Khaimah', N'00129', 1)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'United Arab Emirates')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'India')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'Pakistan')
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'Saudi Arabia')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelCategory] ON 
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (1, N'Chain Hotel')
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (2, N'Motel')
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (3, N'Resort')
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (4, N'Inns')
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (5, N'All-suits')
GO
INSERT [dbo].[HotelCategory] ([CategoryId], [CategoryName]) VALUES (6, N'Boutique Hotel')
GO
SET IDENTITY_INSERT [dbo].[HotelCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelFacilities] ON 
GO
INSERT [dbo].[HotelFacilities] ([FacilityId], [HotelId], [Breakfast], [Wifi], [Parking], [Spa], [SmokingRooms], [NonSmokingRooms], [FamilyRooms]) VALUES (1, 1, 1, 1, 1, 0, 0, 1, 1)
GO
INSERT [dbo].[HotelFacilities] ([FacilityId], [HotelId], [Breakfast], [Wifi], [Parking], [Spa], [SmokingRooms], [NonSmokingRooms], [FamilyRooms]) VALUES (2, 2, 0, 1, 1, 1, 1, 0, 0)
GO
INSERT [dbo].[HotelFacilities] ([FacilityId], [HotelId], [Breakfast], [Wifi], [Parking], [Spa], [SmokingRooms], [NonSmokingRooms], [FamilyRooms]) VALUES (3, 3, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[HotelFacilities] ([FacilityId], [HotelId], [Breakfast], [Wifi], [Parking], [Spa], [SmokingRooms], [NonSmokingRooms], [FamilyRooms]) VALUES (4, 4, 1, 1, 0, 0, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[HotelFacilities] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelPics] ON 
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (1, 1, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (2, 2, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (3, 1, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (4, 1, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (5, 1, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (6, 2, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (7, 2, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (8, 3, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (9, 3, N'..//HotelImages/abc.jpg')
GO
INSERT [dbo].[HotelPics] ([PicId], [HotelId], [PicURL]) VALUES (10, 3, N'..//HotelImages/abc.jpg')
GO
SET IDENTITY_INSERT [dbo].[HotelPics] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 
GO
INSERT [dbo].[Hotels] ([HotelId], [Name], [Description], [Address], [CityId], [CategoryId], [MapLocation], [IsActive], [Rating]) VALUES (1, N'Al Waleed Holiday HomesOpens in new window', N'Located in the heart of Dubai’s new residential and business center and near the American Hospital, Al Waleed Holiday Homes offers units with panoramic views of the city, free Wi-Fi and an outdoor pool.

The air-conditioned apartments at Al Waleed Holiday Homes have a flat-screen TV with a DVD player, a kitchen with a microwave, and a bathroom with luxurious toiletries. All apartments feature a modern décor and free cable internet.

Guests can work out at Al Waleed Holiday Homesspacious gym, which overlooks the pool and the sun terrace. The 24-hour reception can help arrange trips to Dubai’s main attractions. Free Wi-Fi is available in the hotel’s public areas.

À la carte restaurant Biryani 2020 offers traditional and international cuisine in an intimate setting. Room service is available 24/7.

Linked to the Dubai-Abu Dhabi express highway, the hotel is set on the renowned Oud Metha Road, opposite old Lamcy Plaza Building near Al Nasr Sports Club. The nearest beach is just a 15-minute drive from the hotel, and the Dubai International World Trade Center and Exhibition Halls are just a short drive away.

Al Waleed Holiday Homes has been welcoming Booking.com guests since Apr 12, 2008', N'Oud Metha, Bur Dubai, Dubai, United Arab Emirates', 1, 1, N'https://www.google.com/maps/place/Al+Waleed+Holiday+Home/@25.2355653,55.3065035,15z/data=!4m8!3m7!1s0x0:0xb41acedaf1febb77!5m2!4m1!1i2!8m2!3d25.2355653!4d55.3065035', 1, 3.5)
GO
INSERT [dbo].[Hotels] ([HotelId], [Name], [Description], [Address], [CityId], [CategoryId], [MapLocation], [IsActive], [Rating]) VALUES (2, N'Queen Elizabeth 2 HotelOpens in new window
', N'Docked permanently at the Mina Rashid marina, The Queen Elizabeth 2 offers passengers culinary and nightlife experiences, an events center and a heritage site showcasing a glimpse into maritime history.

Queen Elizabeth 2 Hotel provides accommodations with a restaurant, free private parking and a bar. Among the facilities at this property are a concierge service and free WiFi throughout the property. The accommodations features room service, an ATM and currency exchange for guests.

A continental breakfast is available daily at the hotel.

The property is in close proximity to some of Dubai’s attractions including the Burj Khalifa, Dubai Mall, Dubai International Financial Center (DIFC) and the Dubai World Trade Center. The Queen Elizabeth 2 shares a neighborhood with some of Dubai’s other cultural gems including the Gold Souk, Dubai Creek and the Etihad Museum. The nearest airport is Dubai International Airport, 5 mi from the accommodations.

Families in particular like the location – they rated it 8.2 for a stay with kids.', N'Port Rashid, Al Mina, Bur Dubai, Dubai, United Arab Emirates ', 1, 1, N'https://www.google.com/maps/place/Al+Waleed+Holiday+Home/@25.2355653,55.3065035,15z/data=!4m8!3m7!1s0x0:0xb41acedaf1febb77!5m2!4m1!1i2!8m2!3d25.2355653!4d55.3065035', 1, 4.5)
GO
INSERT [dbo].[Hotels] ([HotelId], [Name], [Description], [Address], [CityId], [CategoryId], [MapLocation], [IsActive], [Rating]) VALUES (3, N'Golden Sands Hotel CreekOpens in new window', N'Featuring a rooftop pool and bar with panoramic views of Dubai Creek, city and Arabian Sea, the 5-star Golden Sands Hotel Creek is located on the busy Dubai Creek. Its a 10 minute drive to many of Dubai''s attractions such as Gold & textile market as well as to Dubai International Airport.

Golden Sands Hotel Creek''s rooms feature contemporary decor and marble bathrooms. All rooms are equipped with a Serenity Bed and deluxe bedding. The rooms are modern with flat screen TV and offer creek or city skyline views.

Golden Sands Hotel Creek offers a variety of International cuisine at The Great Oaks, a great start your day at Frenchie Cafe. Experience the savory of Mediterranean cuisine at Bounissimo Restaurant in the ground floor.

Guests can enjoy international cuisine at the casual-chic bistro Table 9 or poolside barbecue at The Edge Pool & Bar. Business guests can make use of the meeting spaces with room for 20 delegates or stay connected in the fully serviced business center.

Dubai International Airport is 5 kms away and can be reached easily either by metro or taxi. An airport shuttle is available upon request. Complimentary valet parking is available at the property.

Families in particular like the location – they rated it 8.6 for a stay with kids.', N'Banyas Street, Dubai, United Arab Emirates ', 1, 1, N'https://www.google.com/maps/place/Al+Waleed+Holiday+Home/@25.2355653,55.3065035,15z/data=!4m8!3m7!1s0x0:0xb41acedaf1febb77!5m2!4m1!1i2!8m2!3d25.2355653!4d55.3065035', 1, 3)
GO
INSERT [dbo].[Hotels] ([HotelId], [Name], [Description], [Address], [CityId], [CategoryId], [MapLocation], [IsActive], [Rating]) VALUES (4, N'Sarai Apartments on the BeachOpens in new window', N'Located in Dubai, 1.9 km from Aquaventure Beach and 2.7 km from Aquaventure Waterpark, Sarai Apartments on the Beach has accommodations with free WiFi, a garden with an outdoor swimming pool, and access to a fitness room.

The air-conditioned units feature a living room with a flat-screen TV, a kitchen with a dishwasher and a microwave, a washing machine, a safety deposit box, and a private bathroom with slippers and a hairdryer. There''s a seating and/or dining area in some units.

The apartment conveniently has both a private beach area and a sun terrace.

The Walk at JBR is 14.6 km from Sarai Apartments on the Beach, while Montgomery Golf Club Dubai is 14.6 km from the property. The nearest airport is Dubai International Airport, 38.6 km from the accommodation.

Sarai Apartments on the Beach has been welcoming Booking.com guests since Aug 17, 2022

Distance in property description is calculated using © OpenStreetMap', N'Crescent Road, Palm Jumeirah, Dubai, United Arab Emirates ', 1, 1, N'https://www.google.com/maps/place/Al+Waleed+Holiday+Home/@25.2355653,55.3065035,15z/data=!4m8!3m7!1s0x0:0xb41acedaf1febb77!5m2!4m1!1i2!8m2!3d25.2355653!4d55.3065035', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([RoomId], [RoomName], [Description], [RoomTypeId], [CurrentPrice], [HotelId]) VALUES (1, N'103', N'ABC Room Descripiton', 1, CAST(200 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Room] ([RoomId], [RoomName], [Description], [RoomTypeId], [CurrentPrice], [HotelId]) VALUES (2, N'204', N'ABC Room Descripiton', 3, CAST(150 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[Room] ([RoomId], [RoomName], [Description], [RoomTypeId], [CurrentPrice], [HotelId]) VALUES (3, N'101', N'ABC Room Descripiton', 2, CAST(500 AS Decimal(18, 0)), 2)
GO
INSERT [dbo].[Room] ([RoomId], [RoomName], [Description], [RoomTypeId], [CurrentPrice], [HotelId]) VALUES (4, N'40', N'ABC Room Descripiton', 3, CAST(340 AS Decimal(18, 0)), NULL)
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomPics] ON 
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (1, 1, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (2, 1, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (3, 2, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (4, 1, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (5, 2, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (6, 3, N'..//RoomImages/abc.jpg')
GO
INSERT [dbo].[RoomPics] ([PicId], [RoomId], [PicURL]) VALUES (7, 3, N'..//RoomImages/abc.jpg')
GO
SET IDENTITY_INSERT [dbo].[RoomPics] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (1, N'Single')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (2, N'Double')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (3, N'Triple')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (4, N'Quad')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (5, N'Queen')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (6, N'King')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (7, N'Twin')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (8, N'Hollywood Twin Room')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (9, N'Double-double')
GO
INSERT [dbo].[RoomType] ([RoomTypeId], [TypeName]) VALUES (10, N'Studio')
GO
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
