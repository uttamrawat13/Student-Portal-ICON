

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

