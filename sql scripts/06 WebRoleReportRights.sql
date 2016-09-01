

CREATE TABLE [dbo].[WebRoleReportRights](
	[RoleId] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_WebRoleReportRights] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WebRoleReportRights]  WITH CHECK ADD  CONSTRAINT [FK_WebRoleReportRights_WebReport] FOREIGN KEY([ReportId])
REFERENCES [dbo].[WebReport] ([ReportId])
GO

ALTER TABLE [dbo].[WebRoleReportRights] CHECK CONSTRAINT [FK_WebRoleReportRights_WebReport]
GO

ALTER TABLE [dbo].[WebRoleReportRights]  WITH CHECK ADD  CONSTRAINT [FK_WebRoleReportRights_WebUserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[WebUserRole] ([RoleId])
GO

ALTER TABLE [dbo].[WebRoleReportRights] CHECK CONSTRAINT [FK_WebRoleReportRights_WebUserRole]
GO

