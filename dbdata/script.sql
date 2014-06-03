USE [ujianonline]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[DegreeID] [int] NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeID] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [varchar](50) NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [varchar](50) NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](30) NULL,
	[TestDescription] [varchar](100) NULL,
	[CategoryID] [int] NULL,
	[LevelID] [int] NULL,
	[AccessType] [int] NULL,
	[UserID] [int] NULL,
	[PublishStartDate] [datetime] NULL,
	[PublishEndDate] [datetime] NULL,
	[UploadTutorial] [varchar](100) NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestDetail]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestDetail](
	[TestDetailID] [int] IDENTITY(1,1) NOT NULL,
	[TestQuestion] [varchar](200) NULL,
	[TestURL] [varchar](100) NULL,
	[TestID] [int] NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestDetailAnswer]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestDetailAnswer](
	[TestDetailAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[TestDetailAnswerName] [varchar](100) NULL,
	[TestDetailURL] [varchar](100) NULL,
	[isAnswer] [int] NULL,
	[TestDetailID] [int] NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestDetailAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[FullName] [varchar](100) NULL,
	[UserPhoto] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[UserType] [varchar](10) NULL,
	[Role] [varchar](10) NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAnswer]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAnswer](
	[UserAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NULL,
	[isInvited] [int] NULL,
	[UserID] [int] NULL,
	[UserEmail] [varchar](100) NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAnswerDetail]    Script Date: 6/3/2014 5:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAnswerDetail](
	[UserAnswerDetailID] [int] IDENTITY(1,1) NOT NULL,
	[UserAnswerID] [int] NULL,
	[TestDetailID] [int] NULL,
	[TestDetailAnswerID] [int] NULL,
	[AuditedUser] [varchar](20) NULL,
	[AuditedActivity] [char](1) NULL,
	[AuditedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAnswerDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [DegreeID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, N'Web Database', 2, N'admin', N'A', CAST(0x0000A33B00CFA3BE AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Degree] ON 

INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, N'Elementary', N'Angela', N'A', CAST(0x0000A32D00000000 AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, N'Junior', N'Angela', N'A', CAST(0x0000A32D011BBCE4 AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, N'Playground', N'Angela', N'E', CAST(0x0000A32D011F8C4A AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, N'High School', N'Angela', N'A', CAST(0x0000A32D011C327E AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (5, N'General Knowledge', N'Angela', N'A', CAST(0x0000A32D011C8489 AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (6, N'Company', N'Angela', N'A', CAST(0x0000A32D011CA60B AS DateTime))
INSERT [dbo].[Degree] ([DegreeID], [DegreeName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (7, N'Master', N'Angela', N'D', CAST(0x0000A32D01208C9E AS DateTime))
SET IDENTITY_INSERT [dbo].[Degree] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, N'Easy', N'Angela', N'A', CAST(0x0000A32200000000 AS DateTime))
INSERT [dbo].[Level] ([LevelID], [LevelName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, N'Medium', N'Angela', N'A', CAST(0x0000A32200000000 AS DateTime))
INSERT [dbo].[Level] ([LevelID], [LevelName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, N'Hard', N'Angela', N'A', CAST(0x0000A32200000000 AS DateTime))
INSERT [dbo].[Level] ([LevelID], [LevelName], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, N'', N'admin', N'D', CAST(0x0000A33B01040FAC AS DateTime))
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, N'Test 1', N'asdfasdfasd', 1, 2, 1, 5, CAST(0x0000A2AA00000000 AS DateTime), CAST(0x0000A34200000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E00C547DA AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, N'sdafasdfasd', N'fasdfsadfs', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E00C5D256 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (5, N'sdafdfasdf', N'asdfasdfasdf', 1, 1, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E00C5FBC5 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (6, N'brian testing', N'safsds', 1, 1, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E00C632BD AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (7, N'asdfasdf', N'asdfadfasd', 1, 1, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E010F6FEB AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (8, N'sadfasd', N'fasdfasd', 1, 3, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E011EA3D2 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (9, N'asdfsad', N'fasdfasdfasdf', 1, 1, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E011EF220 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (10, N'asdfasdfas', N'dfasdfasdf', 1, 1, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E011F8744 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (11, N'asfsdfasdf', N'sadfasdfasdf', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E0120053B AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (12, N'asfsdfasdf', N'sadfasdfasdf', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E0121097F AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (13, N'bbbb', N'bbbbbbb', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E012328F2 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (14, N'bbbb', N'bbbbbbb', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E0123C26F AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (15, N'bbbb', N'bbbbbbb', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E01241488 AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (16, N'SEMANTIC ANALYZER', N'SDFASDF', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33E01244D2F AS DateTime))
INSERT [dbo].[Test] ([TestID], [TestName], [TestDescription], [CategoryID], [LevelID], [AccessType], [UserID], [PublishStartDate], [PublishEndDate], [UploadTutorial], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (17, N'TEST TEKKOM', N'TEKKOM TEST', 1, 2, 1, 5, CAST(0x0000A12500000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'', N'admin', N'A', CAST(0x0000A33F00C951DB AS DateTime))
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestDetail] ON 

INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, N'SADFASDFASDF', N'N/A', 11, N'admin', N'A', CAST(0x0000A33E01201AD2 AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, N'', N'N/A', 12, N'admin', N'A', CAST(0x0000A33E0121207B AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, N'beroh MASUK', N'N/A', 13, N'admin', N'A', CAST(0x0000A33E01233BE5 AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, N'', N'N/A', 14, N'admin', N'A', CAST(0x0000A33E0123D2AD AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (5, N'DSFASDFASDF', N'N/A', 15, N'admin', N'A', CAST(0x0000A33E01241C8B AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (6, N'QUESTION 1', N'N/A', 16, N'admin', N'A', CAST(0x0000A33E012497F7 AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (7, N'QUESTION 2', N'N/A', 16, N'admin', N'A', CAST(0x0000A33E012497FC AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (8, N'QUESTION 3', N'N/A', 16, N'admin', N'A', CAST(0x0000A33E01249801 AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (10, N'ANGELA TESTING', N'N/A', 3, N'admin', N'A', CAST(0x0000A33F00CA8801 AS DateTime))
INSERT [dbo].[TestDetail] ([TestDetailID], [TestQuestion], [TestURL], [TestID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (11, N'BRIAN TESTING', N'N/A', 3, N'admin', N'A', CAST(0x0000A33F00CA880C AS DateTime))
SET IDENTITY_INSERT [dbo].[TestDetail] OFF
SET IDENTITY_INSERT [dbo].[TestDetailAnswer] ON 

INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, NULL, NULL, NULL, 2, N'admin', N'A', CAST(0x0000A33E01212086 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, NULL, NULL, NULL, 2, N'admin', N'A', CAST(0x0000A33E0121208A AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, NULL, NULL, NULL, 2, N'admin', N'A', CAST(0x0000A33E0121208B AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, NULL, NULL, NULL, 2, N'admin', N'A', CAST(0x0000A33E0121208D AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (5, N'AAAAA', N'N/A', 1, 3, N'admin', N'A', CAST(0x0000A33E01233BEE AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (6, N'BBBBB', N'N/A', 0, 3, N'admin', N'A', CAST(0x0000A33E01233BF0 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (7, N'CCCC', N'N/A', 0, 3, N'admin', N'A', CAST(0x0000A33E01233BF3 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (8, N'DDDDD', N'N/A', 0, 3, N'admin', N'A', CAST(0x0000A33E01233BF5 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (9, N'ADFASDFSAD', N'N/A', 0, 4, N'admin', N'A', CAST(0x0000A33E0123D2B0 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (10, N'SDFSDFSAD', N'N/A', 0, 4, N'admin', N'A', CAST(0x0000A33E0123D2B1 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (11, N'FSADFASD', N'N/A', 1, 4, N'admin', N'A', CAST(0x0000A33E0123D2B3 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (12, N'FSDAFASDFSADF', N'N/A', 0, 4, N'admin', N'A', CAST(0x0000A33E0123D2B3 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (13, N'ASDFSDFSA', N'N/A', 1, 5, N'admin', N'A', CAST(0x0000A33E01241C8D AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (14, N'SDAFASDF', N'N/A', 0, 5, N'admin', N'A', CAST(0x0000A33E01241C8E AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (15, N'DFASDF', N'N/A', 0, 5, N'admin', N'A', CAST(0x0000A33E01241C8F AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (16, N'ASDFASDF', N'N/A', 0, 5, N'admin', N'A', CAST(0x0000A33E01241C90 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (17, N'AAA1', N'N/A', 0, 6, N'admin', N'A', CAST(0x0000A33E012497F8 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (18, N'BBB1', N'N/A', 1, 6, N'admin', N'A', CAST(0x0000A33E012497F9 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (19, N'CC1', N'N/A', 0, 6, N'admin', N'A', CAST(0x0000A33E012497FA AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (20, N'DD1', N'N/A', 0, 6, N'admin', N'A', CAST(0x0000A33E012497FB AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (21, N'AA2', N'N/A', 0, 7, N'admin', N'A', CAST(0x0000A33E012497FD AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (22, N'BB2', N'N/A', 0, 7, N'admin', N'A', CAST(0x0000A33E012497FE AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (23, N'CC2', N'N/A', 1, 7, N'admin', N'A', CAST(0x0000A33E012497FF AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (24, N'DD2', N'N/A', 0, 7, N'admin', N'A', CAST(0x0000A33E01249800 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (25, N'AA3', N'N/A', 0, 8, N'admin', N'A', CAST(0x0000A33E01249803 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (26, N'BBB3', N'N/A', 0, 8, N'admin', N'A', CAST(0x0000A33E01249803 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (27, N'CC3', N'N/A', 0, 8, N'admin', N'A', CAST(0x0000A33E01249805 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (28, N'DD3', N'N/A', 1, 8, N'admin', N'A', CAST(0x0000A33E01249806 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (29, N'ini jawaban A', N'N/A', 1, 10, N'admin', N'A', CAST(0x0000A33F00CA8803 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (30, N'ini jawaban A', N'N/A', 0, 10, N'admin', N'A', CAST(0x0000A33F00CA880A AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (31, N'ini jawaban A', N'N/A', 0, 10, N'admin', N'A', CAST(0x0000A33F00CA880B AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (32, N'ini jawaban A', N'N/A', 0, 10, N'admin', N'A', CAST(0x0000A33F00CA880B AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (33, N'ini jawaban A', N'N/A', 1, 11, N'admin', N'A', CAST(0x0000A33F00CA880F AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (34, N'ini jawaban A', N'N/A', 0, 11, N'admin', N'A', CAST(0x0000A33F00CA8810 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (35, N'ini jawaban A', N'N/A', 0, 11, N'admin', N'A', CAST(0x0000A33F00CA8810 AS DateTime))
INSERT [dbo].[TestDetailAnswer] ([TestDetailAnswerID], [TestDetailAnswerName], [TestDetailURL], [isAnswer], [TestDetailID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (36, N'ini jawaban A', N'N/A', 0, 11, N'admin', N'A', CAST(0x0000A33F00CA8811 AS DateTime))
SET IDENTITY_INSERT [dbo].[TestDetailAnswer] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [FullName], [UserPhoto], [Password], [Email], [UserType], [Role], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (5, N'admin', N'admin ujian online', N'admin.png', N'd033e22ae348aeb5660fc2140aec35850c4da997', N'admin@ujianonline.com', N'individu', N'1', N'Angela', N'A', CAST(0x0000A33200FD8975 AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [FullName], [UserPhoto], [Password], [Email], [UserType], [Role], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (13, N'alexandrobrian', N'Brian Alexandro', N'alexandrobrian.jpg', N'd033e22ae348aeb5660fc2140aec35850c4da997', N'alexandrobrian15@gmail.com', N'individu', N'0', N'Angela', N'A', CAST(0x0000A334011D0104 AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [FullName], [UserPhoto], [Password], [Email], [UserType], [Role], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (14, N'amuliawan', N'Angela Muliawan', N'image_53880b1c3f0862.18034901.jpg', N'1d5a2aa82756ce3d3b480f7a8d48b36f016fa368', N'amuliawan93@gmail.com', N'individu', N'0', N'Guest', N'A', CAST(0x0000A33B00D049A8 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserAnswer] ON 

INSERT [dbo].[UserAnswer] ([UserAnswerID], [TestID], [isInvited], [UserID], [UserEmail], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, 3, 1, 13, NULL, N'alexandrobrian', N'A', CAST(0x0000A33F00C8EC2D AS DateTime))
INSERT [dbo].[UserAnswer] ([UserAnswerID], [TestID], [isInvited], [UserID], [UserEmail], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, 3, 1, NULL, N'someone@gmail.com', N'admin', N'A', CAST(0x0000A33F00F39300 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserAnswer] OFF
SET IDENTITY_INSERT [dbo].[UserAnswerDetail] ON 

INSERT [dbo].[UserAnswerDetail] ([UserAnswerDetailID], [UserAnswerID], [TestDetailID], [TestDetailAnswerID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (1, 1, 10, 29, N'admin', N'A', CAST(0x0000A33F00F4F32D AS DateTime))
INSERT [dbo].[UserAnswerDetail] ([UserAnswerDetailID], [UserAnswerID], [TestDetailID], [TestDetailAnswerID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (2, 1, 11, 34, N'admin', N'A', CAST(0x0000A33F00F4F32D AS DateTime))
INSERT [dbo].[UserAnswerDetail] ([UserAnswerDetailID], [UserAnswerID], [TestDetailID], [TestDetailAnswerID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (3, 2, 10, 29, N'admin', N'A', CAST(0x0000A33F00F528E7 AS DateTime))
INSERT [dbo].[UserAnswerDetail] ([UserAnswerDetailID], [UserAnswerID], [TestDetailID], [TestDetailAnswerID], [AuditedUser], [AuditedActivity], [AuditedTime]) VALUES (4, 2, 11, 33, N'admin', N'A', CAST(0x0000A33F00F528E7 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserAnswerDetail] OFF
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [fkDegree] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degree] ([DegreeID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [fkDegree]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [fkCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [fkCategory]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [fkLevel] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [fkLevel]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [fkUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [fkUser]
GO
ALTER TABLE [dbo].[TestDetail]  WITH CHECK ADD  CONSTRAINT [fkTestDetail] FOREIGN KEY([TestID])
REFERENCES [dbo].[Test] ([TestID])
GO
ALTER TABLE [dbo].[TestDetail] CHECK CONSTRAINT [fkTestDetail]
GO
ALTER TABLE [dbo].[TestDetailAnswer]  WITH CHECK ADD  CONSTRAINT [fkTestDetailAnswer] FOREIGN KEY([TestDetailID])
REFERENCES [dbo].[TestDetail] ([TestDetailID])
GO
ALTER TABLE [dbo].[TestDetailAnswer] CHECK CONSTRAINT [fkTestDetailAnswer]
GO
ALTER TABLE [dbo].[UserAnswerDetail]  WITH CHECK ADD  CONSTRAINT [fkTestDetailA] FOREIGN KEY([TestDetailID])
REFERENCES [dbo].[TestDetail] ([TestDetailID])
GO
ALTER TABLE [dbo].[UserAnswerDetail] CHECK CONSTRAINT [fkTestDetailA]
GO
ALTER TABLE [dbo].[UserAnswerDetail]  WITH CHECK ADD  CONSTRAINT [fkTestDetailAnswerA] FOREIGN KEY([TestDetailAnswerID])
REFERENCES [dbo].[TestDetailAnswer] ([TestDetailAnswerID])
GO
ALTER TABLE [dbo].[UserAnswerDetail] CHECK CONSTRAINT [fkTestDetailAnswerA]
GO
ALTER TABLE [dbo].[UserAnswerDetail]  WITH CHECK ADD  CONSTRAINT [fkUserAnswerA] FOREIGN KEY([UserAnswerID])
REFERENCES [dbo].[UserAnswer] ([UserAnswerID])
GO
ALTER TABLE [dbo].[UserAnswerDetail] CHECK CONSTRAINT [fkUserAnswerA]
GO
