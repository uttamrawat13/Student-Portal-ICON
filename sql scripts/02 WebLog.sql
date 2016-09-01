

CREATE TABLE [dbo].[WebLog](
	[WebLogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NULL,
	[WebUserId] [int] NULL,
	[LogAction] [nvarchar](50) NULL,
	[LogNote] [nvarchar](250) NULL,
 CONSTRAINT [aaaaaWebLog_PK] PRIMARY KEY NONCLUSTERED 
(
	[WebLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WebLog] ADD  CONSTRAINT [DF__WebLog__StudentN__2F10007B]  DEFAULT ((0)) FOR [WebUserId]
GO