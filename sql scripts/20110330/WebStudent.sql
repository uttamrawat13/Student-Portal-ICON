USE [MIL-FRE]
GO

/****** Object:  Table [dbo].[WebStudent]    Script Date: 03/30/2011 16:11:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WebStudent](
	[StudentNo] [int] NOT NULL,
	[WebID] [nvarchar](50) NULL,
	[WebPassword] [nvarchar](50) NULL,
	[StudentEmail] [nvarchar](100) NULL,
	[AccountStatus] [nvarchar](50) NULL,
	[PasswordQuestion] [nvarchar](200) NULL,
	[PasswordAnswer] [nvarchar](200) NULL,
	[Student] [nvarchar](200) NULL,
	[ProgramNo] [int] NULL,
 CONSTRAINT [aaaaaWebStudent_PK] PRIMARY KEY NONCLUSTERED 
(
	[StudentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

