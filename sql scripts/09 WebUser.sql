
CREATE TABLE [dbo].[WebUser](
	[WebUserId] [int] NOT NULL,
	[WebUserName] [nvarchar](50) NULL,
	[WebPassword] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[AccountStatus] [nvarchar](50) NULL,
	[PasswordQuestion] [nvarchar](200) NULL,
	[PasswordAnswer] [nvarchar](200) NULL,
	[RoleId] [int] NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [aWebStudent_PK] PRIMARY KEY NONCLUSTERED 
(
	[WebUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

