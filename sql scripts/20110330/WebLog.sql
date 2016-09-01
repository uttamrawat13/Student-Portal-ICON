USE [MIL-FRE]
GO

/****** Object:  Table [dbo].[WebLog]    Script Date: 03/30/2011 16:10:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WebLog](
	[WebLogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NULL,
	[StudentNo] [int] NULL,
	[LogAction] [nvarchar](50) NULL,
	[LogNote] [nvarchar](250) NULL,
 CONSTRAINT [aaaaaWebLog_PK] PRIMARY KEY NONCLUSTERED 
(
	[WebLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

