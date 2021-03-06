USE [DDStudentPortal]
GO
/****** Object:  Table [dbo].[SurveyCourseSchedule]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SurveyCourseSchedule](
	[CourseSurveyScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[CourseNo] [int] NOT NULL,
	[Session] [nvarchar](1) NOT NULL,
	[DaysToStart] [int] NOT NULL,
	[DaysOpen] [int] NOT NULL,
	[StudentStatusIds] [varchar](max) NOT NULL,
	[QuestionGroupID] [int] NOT NULL,
	[Active] [nvarchar](1) NULL,
 CONSTRAINT [PK_SurveyCourseSchedule_1] PRIMARY KEY CLUSTERED 
(
	[CourseNo] ASC,
	[Session] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SurveyQuestionAnswers]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestionAnswers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[SurveyID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[StudentNo] [int] NOT NULL,
	[EnrollmentID] [int] NOT NULL,
	[CommentAnswer] [nvarchar](200) NULL,
	[NumericAnswer] [int] NULL,
 CONSTRAINT [PK_SurveyQuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurveyQuestionGroupMaster]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestionGroupMaster](
	[QuestionGroupID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionGroupCode] [nvarchar](100) NOT NULL,
	[Admissions] [nvarchar](1) NOT NULL,
	[Registrar] [nvarchar](1) NOT NULL,
	[FinancialAid] [nvarchar](1) NOT NULL,
	[Placement] [nvarchar](1) NOT NULL,
	[Active] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_SurveyQuestionGroupMaster] PRIMARY KEY CLUSTERED 
(
	[QuestionGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SurveyQuestionGroupMaster] UNIQUE NONCLUSTERED 
(
	[QuestionGroupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurveyQuestionMaster]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestionMaster](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionGroupID] [int] NOT NULL,
	[Question] [nvarchar](100) NOT NULL,
	[Order] [int] NOT NULL,
	[Numeric] [nvarchar](1) NOT NULL,
	[Active] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_SurveyQuestionMaster] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SurveyQuestionMaster] UNIQUE NONCLUSTERED 
(
	[Question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[SurveyID] [int] IDENTITY(1,1) NOT NULL,
	[SurveyName] [nvarchar](50) NOT NULL,
	[QuestionGroupID] [int] NOT NULL,
	[OpenDate] [datetime] NULL,
	[DaysOpen] [int] NULL,
	[Active] [nvarchar](1) NOT NULL,
	[CourseOfferingNo] [int] NULL,
	[Submitted] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurveyStudents]    Script Date: 9/10/2013 9:04:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyStudents](
	[SurveyStudentID] [int] IDENTITY(1,1) NOT NULL,
	[SurveyID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[EnrolmentID] [int] NULL,
 CONSTRAINT [PK_SurveyStudents] PRIMARY KEY CLUSTERED 
(
	[SurveyStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
