/****** Object:  ForeignKey [FK_WebLog_WebUser]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLog_WebUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLog]'))
ALTER TABLE [dbo].[WebLog] DROP CONSTRAINT [FK_WebLog_WebUser]
GO
/****** Object:  ForeignKey [FK_WebUser_WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebUser_WebUserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebUser]'))
ALTER TABLE [dbo].[WebUser] DROP CONSTRAINT [FK_WebUser_WebUserRole]
GO
/****** Object:  ForeignKey [FK_WebRoleReportRights_WebReport]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebRoleReportRights_WebReport]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]'))
ALTER TABLE [dbo].[WebRoleReportRights] DROP CONSTRAINT [FK_WebRoleReportRights_WebReport]
GO
/****** Object:  ForeignKey [FK_WebRoleReportRights_WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebRoleReportRights_WebUserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]'))
ALTER TABLE [dbo].[WebRoleReportRights] DROP CONSTRAINT [FK_WebRoleReportRights_WebUserRole]
GO
/****** Object:  Default [DF__WebLog__StudentN__2F10007B]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__WebLog__StudentN__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLog]'))
Begin
ALTER TABLE [dbo].[WebLog] DROP CONSTRAINT [DF__WebLog__StudentN__2F10007B]

End
GO
/****** Object:  Default [DF__WebStuden__Stude__276EDEB3]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__WebStuden__Stude__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebUser]'))
Begin
ALTER TABLE [dbo].[WebUser] DROP CONSTRAINT [DF__WebStuden__Stude__276EDEB3]

End
GO
/****** Object:  Table [dbo].[WebRoleReportRights]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]') AND type in (N'U'))
DROP TABLE [dbo].[WebRoleReportRights]
GO
/****** Object:  Table [dbo].[WebLog]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLog]') AND type in (N'U'))
DROP TABLE [dbo].[WebLog]
GO
/****** Object:  Table [dbo].[WebUser]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUser]') AND type in (N'U'))
DROP TABLE [dbo].[WebUser]
GO
/****** Object:  Table [dbo].[WebReport]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebReport]') AND type in (N'U'))
DROP TABLE [dbo].[WebReport]
GO
/****** Object:  Table [dbo].[WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[WebUserRole]
GO
/****** Object:  Table [dbo].[WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebUserRole](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_WebUserRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[WebUserRole] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[WebUserRole] ([RoleId], [RoleName]) VALUES (2, N'Student')
/****** Object:  Table [dbo].[WebReport]    Script Date: 04/01/2011 12:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebReport]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebReport](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Active] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [aaaaaWebReport_PK] PRIMARY KEY NONCLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WebReport]') AND name = N'ID')
CREATE NONCLUSTERED INDEX [ID] ON [dbo].[WebReport] 
(
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'盼�䜴䞖᡿䔚똺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebReport' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportId'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3570' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'꠵섋ꋆ䋝←䛈㛷缌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebReport' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'ReportName'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'ReportName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'705' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㓭춃䣕䀾垺ᇈ鉖祗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebReport' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DateCreated' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'2/15/2011 4:07:58 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'LastUpdated' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'2/24/2011 3:43:51 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DefaultView' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebReport' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrderByOn' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Orientation' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'RecordCount' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Updatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebReport', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebReport'
GO
SET IDENTITY_INSERT [dbo].[WebReport] ON
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (1, N'Academic Review', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (2, N'Academic Review by Term', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (3, N'Payment Schedule', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (4, N'Ledger', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (5, N'Program Course Progress', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (6, N'Schedule of Courses', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (7, N'Attendance Review', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (8, N'Attendance Summary', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (9, N'Cosmetology Grade Book Summary', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (10, N'Cosmetology Grade Book Labs', N'Y')
INSERT [dbo].[WebReport] ([ReportId], [ReportName], [Active]) VALUES (11, N'Cosmetology Grade Book Tests', N'Y')
SET IDENTITY_INSERT [dbo].[WebReport] OFF
/****** Object:  Table [dbo].[WebUser]    Script Date: 04/01/2011 12:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebUser](
	[WebUserId] [int] NOT NULL,
	[WebUserName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebPassword] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountStatus] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordQuestion] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordAnswer] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [aaaaaWebStudent_PK] PRIMARY KEY NONCLUSTERED 
(
	[WebUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DefaultValue' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DecimalPlaces' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains StudentNo in case of students' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StudentNo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StudentNo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'WebID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebUserName'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebUserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebPassword' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'WebPassword' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'WebPassword'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'WebPassword'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StudentEmail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StudentEmail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'Email'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AccountStatus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AccountStatus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'AccountStatus'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PasswordQuestion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PasswordQuestion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordQuestion'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordQuestion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PasswordAnswer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PasswordAnswer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', N'COLUMN',N'PasswordAnswer'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser', @level2type=N'COLUMN',@level2name=N'PasswordAnswer'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DateCreated' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'1/26/2010 4:52:58 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'LastUpdated' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'1/26/2010 5:04:44 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DefaultView' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebStudent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrderByOn' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Orientation' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'RecordCount' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Updatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebUser', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebUser'
GO
INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (1, N'student', N'student', N'student@sportal.com', N'Active', N'What''s your favourite pet?', N'Dog', 2)
INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (3889, N'admin', N'admin', N'admin@sportal.com', N'Active', N'What''s your favourite pet?', N'Cat', 1)
INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (12, N'Test', N'123', N'abc@test.com', N'InActive', N'what is your name?', N'abc', 2)
/****** Object:  Table [dbo].[WebLog]    Script Date: 04/01/2011 12:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebLog](
	[WebLogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NULL,
	[WebUserId] [int] NULL,
	[LogAction] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LogNote] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [aaaaaWebLog_PK] PRIMARY KEY NONCLUSTERED 
(
	[WebLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�焀겹䵮馐졫�硯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebLogID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'WebLogID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebLogID'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebLogID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'桯桔螹䠔窎壗뚼￩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'LogDateTime' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'LogDateTime' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogDateTime'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogDateTime'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DefaultValue' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'ఏ测䛢䶗聹뻃' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DecimalPlaces' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'StudentNo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'StudentNo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'WebUserId'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'WebUserId'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'GUID' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㉯헅临䧬➉쬇ᘬ川' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'LogAction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'LogAction' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogAction'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogAction'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'AllowZeroLength' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'CollatingOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnHidden' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnOrder' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'ColumnWidth' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DataUpdatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DisplayControl' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMEMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_IMESentMode' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'LogNote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrdinalPosition' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Required' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Size' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'250' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceField' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'LogNote' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'SourceTable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Type' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'UnicodeCompression' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', N'COLUMN',N'LogNote'))
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog', @level2type=N'COLUMN',@level2name=N'LogNote'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Attributes' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'DateCreated' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'1/26/2010 5:02:17 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'LastUpdated' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'1/26/2010 5:05:26 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DefaultView' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Name' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'WebLog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'OrderByOn' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Orientation' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'RecordCount' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'Updatable' , N'SCHEMA',N'dbo', N'TABLE',N'WebLog', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLog'
GO
SET IDENTITY_INSERT [dbo].[WebLog] ON
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (509, CAST(0x00009EB400F79D10 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (530, CAST(0x00009EB500C39330 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (531, CAST(0x00009EB500C3E2E0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (532, CAST(0x00009EB500C4CD40 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (533, CAST(0x00009EB500C5E1D0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (534, CAST(0x00009EB500C60750 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (535, CAST(0x00009EB500C71E38 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (536, CAST(0x00009EB500C73CB0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (537, CAST(0x00009EB500C8D228 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (538, CAST(0x00009EB500C8FFDC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (539, CAST(0x00009EB500C99A8C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (540, CAST(0x00009EB500C9AAF4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (541, CAST(0x00009EB500CA7CB8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (542, CAST(0x00009EB500CA91D0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (543, CAST(0x00009EB500CE8B00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (544, CAST(0x00009EB500CEDD08 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (545, CAST(0x00009EB500CF1C50 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (546, CAST(0x00009EB500CF40A4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (547, CAST(0x00009EB500D27044 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (548, CAST(0x00009EB500D2AF8C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (549, CAST(0x00009EB500D2B43C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (550, CAST(0x00009EB500D2C24C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (551, CAST(0x00009EB500D39C44 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (552, CAST(0x00009EB500D54A58 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (553, CAST(0x00009EB500D5ACC8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (554, CAST(0x00009EB500D5EF94 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (555, CAST(0x00009EB500D68C9C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (556, CAST(0x00009EB500D6A2E0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (557, CAST(0x00009EB500D6B924 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (558, CAST(0x00009EB500D6D8C8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (559, CAST(0x00009EB500D73A0C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (560, CAST(0x00009EB500D75ADC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (561, CAST(0x00009EB700B45F64 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (562, CAST(0x00009EB700B47A58 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (609, CAST(0x00009EB800B970A8 AS DateTime), 1, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (610, CAST(0x00009EB800B97B34 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (143, CAST(0x00009E9C00C1E06C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (144, CAST(0x00009E9C00C25B78 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (145, CAST(0x00009E9C00C4E5DC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (146, CAST(0x00009E9C00C582E4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (147, CAST(0x00009E9C00C6249C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (149, CAST(0x00009E9C00C6E4CC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (150, CAST(0x00009E9C00C71154 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (151, CAST(0x00009E9C00C7AAD8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (152, CAST(0x00009E9C00C82008 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (153, CAST(0x00009E9F00CAB750 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (154, CAST(0x00009E9F00D1B4C4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (156, CAST(0x00009E9F00D33C2C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (157, CAST(0x00009E9F00D42FEC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (158, CAST(0x00009E9F00D650D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (159, CAST(0x00009E9F00D69728 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (160, CAST(0x00009E9F00D75050 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (161, CAST(0x00009E9F00D7B194 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (162, CAST(0x00009E9F00D8A8D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (163, CAST(0x00009E9F00D8CC00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (164, CAST(0x00009E9F00D93ED8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (165, CAST(0x00009E9F00E26FF8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (166, CAST(0x00009E9F00E4B088 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (167, CAST(0x00009E9F00E4C5A0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (168, CAST(0x00009E9F00E4D98C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (169, CAST(0x00009E9F00E56F8C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (170, CAST(0x00009E9F00E75388 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (171, CAST(0x00009E9F00E83938 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (172, CAST(0x00009E9F00E94210 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (173, CAST(0x00009E9F00E95D04 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (174, CAST(0x00009E9F00E9A354 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (175, CAST(0x00009E9F00EA5B50 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (176, CAST(0x00009E9F00EA8454 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (177, CAST(0x00009E9F00F3429C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (178, CAST(0x00009E9F00F84828 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (179, CAST(0x00009E9F00FA251C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (180, CAST(0x00009EA700D9B2DC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (181, CAST(0x00009EA700E408F4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (148, CAST(0x00009E9C00C639B4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (155, CAST(0x00009E9F00D2D2B4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (182, CAST(0x00009EA700E4519C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (183, CAST(0x00009EA700E490E4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (184, CAST(0x00009EA700E5581C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (185, CAST(0x00009EA700E58120 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (186, CAST(0x00009EA700E733E4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (187, CAST(0x00009EA700E747D0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (188, CAST(0x00009EAD00F94B24 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (189, CAST(0x00009EAD00F994F8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (190, CAST(0x00009EAD00F9BDFC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (191, CAST(0x00009EAD00FA8D68 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (192, CAST(0x00009EAD00FABEA0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (193, CAST(0x00009EAD00FBDA38 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (194, CAST(0x00009EAD01008588 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (195, CAST(0x00009EAD0100CAAC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (196, CAST(0x00009EAD0101D12C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (197, CAST(0x00009EAD0101E2C0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (198, CAST(0x00009EAD01020840 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (199, CAST(0x00009EAD01036B54 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (200, CAST(0x00009EAD010403AC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (201, CAST(0x00009EAD01053C90 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (202, CAST(0x00009EAD01067C7C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (203, CAST(0x00009EAD0106F530 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (204, CAST(0x00009EAD01071150 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (205, CAST(0x00009EAD01073B80 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (206, CAST(0x00009EAD0107B7B8 AS DateTime), 3889, N'Logged out.', N'')
GO
print 'Processed 100 total records'
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (207, CAST(0x00009EAD0107E56C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (208, CAST(0x00009EAD01081DAC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (209, CAST(0x00009EAD0108513C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (210, CAST(0x00009EAD01093818 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (211, CAST(0x00009EAD010A5AB8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (212, CAST(0x00009EAD010A7CB4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (213, CAST(0x00009EAD010AD5C4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (214, CAST(0x00009EAD010B3834 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (215, CAST(0x00009EAD010BCE34 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (216, CAST(0x00009EAD010C9B48 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (217, CAST(0x00009EAD010D4C3C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (218, CAST(0x00009EAD010D8B84 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (219, CAST(0x00009EAD010DEA70 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (220, CAST(0x00009EAD010DFE5C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (221, CAST(0x00009EAD010E5D48 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (222, CAST(0x00009EAD010ECEF4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (223, CAST(0x00009EAD010FFC20 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (224, CAST(0x00009EAD01101A98 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (225, CAST(0x00009EAD0110BFD4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (226, CAST(0x00009EAD0110CDE4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (227, CAST(0x00009EAD0110EFE0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (228, CAST(0x00009EAD0110FCC4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (229, CAST(0x00009EAD01111434 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (230, CAST(0x00009EAD011259FC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (231, CAST(0x00009EAD0112E444 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (232, CAST(0x00009EAD0112FCE0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (233, CAST(0x00009EAD011332C8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (234, CAST(0x00009EAD0113571C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (235, CAST(0x00009EAD01137B70 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (236, CAST(0x00009EAD0113A474 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (237, CAST(0x00009EAD0113C1C0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (238, CAST(0x00009EAD0113D5AC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (239, CAST(0x00009EAD0113DB88 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (240, CAST(0x00009EAD01141170 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (241, CAST(0x00009EAD01145D9C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (242, CAST(0x00009EAD0114A2C0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (243, CAST(0x00009EAD0114BA30 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (245, CAST(0x00009EB000BAC804 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (246, CAST(0x00009EB000C2DFE4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (247, CAST(0x00009EB000C2F3D0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (248, CAST(0x00009EB000CED858 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (249, CAST(0x00009EB000D104FC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (250, CAST(0x00009EB000D126F8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (251, CAST(0x00009EB000D14570 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (252, CAST(0x00009EB000D1C784 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (253, CAST(0x00009EB000D23480 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (254, CAST(0x00009EB000D34910 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (255, CAST(0x00009EB000D451E8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (256, CAST(0x00009EB000D4D8AC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (257, CAST(0x00009EB000D4E914 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (258, CAST(0x00009EB000D55160 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (259, CAST(0x00009EB000D56FD8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (260, CAST(0x00009EB000D5EE68 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (261, CAST(0x00009EB000D70424 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (262, CAST(0x00009EB000D791F0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (263, CAST(0x00009EB000D97268 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (264, CAST(0x00009EB000DA3748 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (265, CAST(0x00009EB000DA4C60 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (266, CAST(0x00009EB000E5A1F0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (267, CAST(0x00009EB000E6FF28 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (268, CAST(0x00009EB000E98E3C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (270, CAST(0x00009EB000F37E60 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (271, CAST(0x00009EB000F39378 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (286, CAST(0x00009EB000F77538 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (287, CAST(0x00009EB000F793B0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (288, CAST(0x00009EB000FD9B0C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (289, CAST(0x00009EB000FDBD08 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (290, CAST(0x00009EB00109B57C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (292, CAST(0x00009EB001250868 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (293, CAST(0x00009EB00125442C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (294, CAST(0x00009EB001268EA4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (295, CAST(0x00009EB00126CA68 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (296, CAST(0x00009EB00126F948 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (297, CAST(0x00009EB001271694 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (298, CAST(0x00009EB001271D9C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (299, CAST(0x00009EB00127E4D4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (300, CAST(0x00009EB00127E72C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (301, CAST(0x00009EB00127EF60 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (302, CAST(0x00009EB0012800F4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (303, CAST(0x00009EB001283F10 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (304, CAST(0x00009EB001288560 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (305, CAST(0x00009EB00128E0C8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (306, CAST(0x00009EB001295850 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (307, CAST(0x00009EB00129AB84 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (337, CAST(0x00009EB00133DFA0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (351, CAST(0x00009EB100AD5E6C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (352, CAST(0x00009EB100AF89E4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (353, CAST(0x00009EB100B05A7C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (354, CAST(0x00009EB100B06634 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (355, CAST(0x00009EB100B0CE80 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (356, CAST(0x00009EB100B3AC18 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (357, CAST(0x00009EB100B3B6A4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (358, CAST(0x00009EB100BA1E18 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (397, CAST(0x00009EB10114DB00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (398, CAST(0x00009EB1011DC378 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (399, CAST(0x00009EB1011DC6FC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (400, CAST(0x00009EB1011DD9BC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (401, CAST(0x00009EB1011DF12C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (402, CAST(0x00009EB1011E0D4C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (403, CAST(0x00009EB1011E69E0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (404, CAST(0x00009EB1011EC674 AS DateTime), 3889, N'Logged out.', N'')
GO
print 'Processed 200 total records'
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (405, CAST(0x00009EB10120D248 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (406, CAST(0x00009EB10121B5A0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (407, CAST(0x00009EB10122C1FC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (408, CAST(0x00009EB10122CDB4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (448, CAST(0x00009EB1012F36A8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (449, CAST(0x00009EB1012F4968 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (450, CAST(0x00009EB10133A634 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (451, CAST(0x00009EB10133C830 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (452, CAST(0x00009EB10133FE18 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (453, CAST(0x00009EB101340FAC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (454, CAST(0x00009EB1013521E4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (455, CAST(0x00009EB101357644 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (456, CAST(0x00009EB101361928 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (457, CAST(0x00009EB101365618 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (458, CAST(0x00009EB10136887C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (459, CAST(0x00009EB10136A370 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (460, CAST(0x00009EB101375EF0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (461, CAST(0x00009EB101376F58 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (462, CAST(0x00009EB10137BA58 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (463, CAST(0x00009EB10137C610 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (464, CAST(0x00009EB10137ECBC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (465, CAST(0x00009EB10137FACC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (466, CAST(0x00009EB400C31F2C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (611, CAST(0x00009EB800C89664 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (269, CAST(0x00009EB000E9F1D8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (359, CAST(0x00009EB100BD4B60 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (244, CAST(0x00009EAD011B7028 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (366, CAST(0x00009EB100CD1400 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (372, CAST(0x00009EB100CE043C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (373, CAST(0x00009EB100CE1120 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (376, CAST(0x00009EB100CF9054 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (377, CAST(0x00009EB100CF9888 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (378, CAST(0x00009EB100CFB37C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (379, CAST(0x00009EB100CFE388 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (380, CAST(0x00009EB100D04850 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (381, CAST(0x00009EB100D08414 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (382, CAST(0x00009EB100D0B7A4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (385, CAST(0x00009EB100D2EDA8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (395, CAST(0x00009EB100D7B89C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (396, CAST(0x00009EB100EC5EF0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (272, CAST(0x00009EB000F3EEE0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (273, CAST(0x00009EB000F45AB0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (274, CAST(0x00009EB000F4B99C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (275, CAST(0x00009EB000F4EE58 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (276, CAST(0x00009EB000F5544C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (277, CAST(0x00009EB000F5751C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (278, CAST(0x00009EB000F61A58 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (279, CAST(0x00009EB000F6228C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (280, CAST(0x00009EB000F64B90 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (281, CAST(0x00009EB000F65298 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (282, CAST(0x00009EB000F66A08 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (283, CAST(0x00009EB000F67B9C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (284, CAST(0x00009EB000F6930C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (285, CAST(0x00009EB000F6ABA8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (291, CAST(0x00009EB001181400 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (308, CAST(0x00009EB0012B5038 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (309, CAST(0x00009EB0012BAF24 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (310, CAST(0x00009EB0012BFA24 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (311, CAST(0x00009EB0012C0CE4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (312, CAST(0x00009EB0012C3CF0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (313, CAST(0x00009EB0012C7404 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (314, CAST(0x00009EB0012CD7A0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (409, CAST(0x00009EB10122FA3C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (410, CAST(0x00009EB101238358 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (411, CAST(0x00009EB10123E49C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (412, CAST(0x00009EB1012422B8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (413, CAST(0x00009EB101244A90 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (414, CAST(0x00009EB101247F4C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (415, CAST(0x00009EB101248D5C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (416, CAST(0x00009EB10124B408 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (417, CAST(0x00009EB10124BB10 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (418, CAST(0x00009EB10124F800 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (419, CAST(0x00009EB1012525B4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (420, CAST(0x00009EB1012534F0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (421, CAST(0x00009EB10125B5D8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (422, CAST(0x00009EB101260EE8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (423, CAST(0x00009EB101263EF4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (424, CAST(0x00009EB101274448 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (425, CAST(0x00009EB1012754B0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (426, CAST(0x00009EB101277328 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (427, CAST(0x00009EB1012784BC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (428, CAST(0x00009EB1012865BC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (429, CAST(0x00009EB1012880B0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (430, CAST(0x00009EB1012924C0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (431, CAST(0x00009EB1012933FC AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (432, CAST(0x00009EB1012A1E5C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (433, CAST(0x00009EB1012A36F8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (434, CAST(0x00009EB1012A7C1C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (435, CAST(0x00009EB1012A8C84 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (436, CAST(0x00009EB1012B7234 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (437, CAST(0x00009EB1012BC694 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (438, CAST(0x00009EB1012C4D58 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (439, CAST(0x00009EB1012C6144 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (440, CAST(0x00009EB1012D0B30 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (441, CAST(0x00009EB1012D1B98 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (442, CAST(0x00009EB1012D3C68 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (443, CAST(0x00009EB1012D494C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (444, CAST(0x00009EB1012DF464 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (445, CAST(0x00009EB1012E05F8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (446, CAST(0x00009EB1012E9E50 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (447, CAST(0x00009EB1012EC754 AS DateTime), 3889, N'Logged out.', N'')
GO
print 'Processed 300 total records'
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (563, CAST(0x00009EB700E9E29C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (334, CAST(0x00009EB0013380B4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (335, CAST(0x00009EB001338564 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (336, CAST(0x00009EB001338EC4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (338, CAST(0x00009EB001341C90 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (339, CAST(0x00009EB001343D60 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (340, CAST(0x00009EB001347A50 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (341, CAST(0x00009EB00134ACB4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (342, CAST(0x00009EB00134CA00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (343, CAST(0x00009EB00134D5B8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (344, CAST(0x00009EB001355574 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (345, CAST(0x00009EB0013580D0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (346, CAST(0x00009EB00135D080 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (347, CAST(0x00009EB00135E340 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (564, CAST(0x00009EB700EAEB74 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (565, CAST(0x00009EB700EB6B30 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (566, CAST(0x00009EB700EBB180 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (567, CAST(0x00009EB700F351D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (595, CAST(0x00009EB70105A98C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (596, CAST(0x00009EB70105BD78 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (608, CAST(0x00009EB7010A8AC4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (360, CAST(0x00009EB100C33FFC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (361, CAST(0x00009EB100C353E8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (362, CAST(0x00009EB100C426D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (363, CAST(0x00009EB100C47B38 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (364, CAST(0x00009EB100C59478 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (365, CAST(0x00009EB100C73B84 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (467, CAST(0x00009EB400CCC324 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (468, CAST(0x00009EB400CF11C4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (469, CAST(0x00009EB400CFE838 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (470, CAST(0x00009EB400D02D5C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (471, CAST(0x00009EB400D0D748 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (472, CAST(0x00009EB400D1BF50 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (473, CAST(0x00009EB400D29498 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (474, CAST(0x00009EB400D29DF8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (475, CAST(0x00009EB400D40238 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (476, CAST(0x00009EB400D495E0 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (477, CAST(0x00009EB400D49F40 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (478, CAST(0x00009EB400D4E6BC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (479, CAST(0x00009EB400D4FD00 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (480, CAST(0x00009EB400D5A6EC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (481, CAST(0x00009EB400D5C8E8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (482, CAST(0x00009EB400D63F44 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (483, CAST(0x00009EB400D67658 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (484, CAST(0x00009EB400D6C98C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (485, CAST(0x00009EB400D7436C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (486, CAST(0x00009EB400D774A4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (487, CAST(0x00009EB400D7B518 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (488, CAST(0x00009EB400D7D00C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (489, CAST(0x00009EB400D7EB00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (490, CAST(0x00009EB400D82340 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (491, CAST(0x00009EB400D8453C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (492, CAST(0x00009EB400D88DE4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (493, CAST(0x00009EB400D8B364 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (494, CAST(0x00009EB400D8EDFC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (495, CAST(0x00009EB400D9A4CC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (496, CAST(0x00009EB400E3ECD4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (497, CAST(0x00009EB400E400C0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (498, CAST(0x00009EB400E71440 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (499, CAST(0x00009EB400E732B8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (500, CAST(0x00009EB400E74DAC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (501, CAST(0x00009EB400E81610 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (502, CAST(0x00009EB400E827A4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (503, CAST(0x00009EB400EF7E28 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (504, CAST(0x00009EB400EFA984 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (505, CAST(0x00009EB400F09060 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (506, CAST(0x00009EB400F0FFB4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (507, CAST(0x00009EB400F13CA4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (508, CAST(0x00009EB400F705E4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (510, CAST(0x00009EB400FBA324 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (511, CAST(0x00009EB400FDDF04 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (512, CAST(0x00009EB400FE06DC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (513, CAST(0x00009EB400FEBED8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (514, CAST(0x00009EB401006A94 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (515, CAST(0x00009EB401033440 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (516, CAST(0x00009EB401051710 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (517, CAST(0x00009EB40105D164 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (518, CAST(0x00009EB40107253C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (519, CAST(0x00009EB4010A6EA4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (520, CAST(0x00009EB4010F6F80 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (521, CAST(0x00009EB4010F8240 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (522, CAST(0x00009EB4010FDA24 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (523, CAST(0x00009EB401105530 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (524, CAST(0x00009EB40110B1C4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (525, CAST(0x00009EB40110D3C0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (526, CAST(0x00009EB401128FE4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (527, CAST(0x00009EB40112B1E0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (528, CAST(0x00009EB40112BC6C AS DateTime), 1, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (529, CAST(0x00009EB40112CA7C AS DateTime), 1, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (367, CAST(0x00009EB100CDC9A4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (368, CAST(0x00009EB100CDDB38 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (568, CAST(0x00009EB700F40B00 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (383, CAST(0x00009EB100D24998 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (384, CAST(0x00009EB100D2B694 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (386, CAST(0x00009EB100D317D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (387, CAST(0x00009EB100D41AD4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (388, CAST(0x00009EB100D44F90 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (389, CAST(0x00009EB100D47E70 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (390, CAST(0x00009EB100D59684 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (391, CAST(0x00009EB100D5D824 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (392, CAST(0x00009EB100D626A8 AS DateTime), 3889, N'Logged in.', N'')
GO
print 'Processed 400 total records'
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (393, CAST(0x00009EB100D67E8C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (394, CAST(0x00009EB100D6B348 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (569, CAST(0x00009EB700F425F4 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (570, CAST(0x00009EB700F846FC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (571, CAST(0x00009EB700F86C7C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (572, CAST(0x00009EB700F896AC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (573, CAST(0x00009EB700F8A714 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (574, CAST(0x00009EB700F941C4 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (575, CAST(0x00009EB700F955B0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (576, CAST(0x00009EB700FA3458 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (577, CAST(0x00009EB700FA4BC8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (578, CAST(0x00009EB700FB7570 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (579, CAST(0x00009EB700FB9E74 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (580, CAST(0x00009EB7010013DC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (581, CAST(0x00009EB701004E74 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (582, CAST(0x00009EB701011930 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (583, CAST(0x00009EB70101367C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (584, CAST(0x00009EB70101F7D8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (585, CAST(0x00009EB701027E9C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (586, CAST(0x00009EB70102B22C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (587, CAST(0x00009EB70102E940 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (588, CAST(0x00009EB701030A10 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (589, CAST(0x00009EB70104580C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (590, CAST(0x00009EB7010477B0 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (591, CAST(0x00009EB70104AC6C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (592, CAST(0x00009EB70104CC10 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (593, CAST(0x00009EB70104FC1C AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (594, CAST(0x00009EB70105138C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (597, CAST(0x00009EB70105E550 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (598, CAST(0x00009EB701060620 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (599, CAST(0x00009EB701061FE8 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (600, CAST(0x00009EB701063ADC AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (601, CAST(0x00009EB701064694 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (602, CAST(0x00009EB701067A24 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (603, CAST(0x00009EB701085BC8 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (604, CAST(0x00009EB701088274 AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (605, CAST(0x00009EB70109EA38 AS DateTime), 3889, N'Logged in.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (606, CAST(0x00009EB7010A052C AS DateTime), 3889, N'Logged out.', N'')
INSERT [dbo].[WebLog] ([WebLogID], [LogDateTime], [WebUserId], [LogAction], [LogNote]) VALUES (607, CAST(0x00009EB7010A421C AS DateTime), 3889, N'Logged in.', N'')
SET IDENTITY_INSERT [dbo].[WebLog] OFF
/****** Object:  Table [dbo].[WebRoleReportRights]    Script Date: 04/01/2011 12:54:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebRoleReportRights](
	[RoleId] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_WebRoleReportRights] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 1)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 2)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 3)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 4)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 5)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 6)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 7)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 8)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 9)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 10)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (1, 11)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (2, 3)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (2, 5)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (2, 6)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (2, 8)
INSERT [dbo].[WebRoleReportRights] ([RoleId], [ReportId]) VALUES (2, 9)
/****** Object:  Default [DF__WebLog__StudentN__2F10007B]    Script Date: 04/01/2011 12:54:19 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__WebLog__StudentN__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLog]'))
Begin
ALTER TABLE [dbo].[WebLog] ADD  CONSTRAINT [DF__WebLog__StudentN__2F10007B]  DEFAULT ((0)) FOR [WebUserId]

End
GO
/****** Object:  Default [DF__WebStuden__Stude__276EDEB3]    Script Date: 04/01/2011 12:54:19 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__WebStuden__Stude__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebUser]'))
Begin
ALTER TABLE [dbo].[WebUser] ADD  CONSTRAINT [DF__WebStuden__Stude__276EDEB3]  DEFAULT ((0)) FOR [WebUserId]

End
GO
/****** Object:  ForeignKey [FK_WebLog_WebUser]    Script Date: 04/01/2011 12:54:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebLog_WebUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebLog]'))
ALTER TABLE [dbo].[WebLog]  WITH CHECK ADD  CONSTRAINT [FK_WebLog_WebUser] FOREIGN KEY([WebUserId])
REFERENCES [dbo].[WebUser] ([WebUserId])
GO
ALTER TABLE [dbo].[WebLog] CHECK CONSTRAINT [FK_WebLog_WebUser]
GO
/****** Object:  ForeignKey [FK_WebUser_WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebUser_WebUserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebUser]'))
ALTER TABLE [dbo].[WebUser]  WITH CHECK ADD  CONSTRAINT [FK_WebUser_WebUserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[WebUserRole] ([RoleId])
GO
ALTER TABLE [dbo].[WebUser] CHECK CONSTRAINT [FK_WebUser_WebUserRole]
GO
/****** Object:  ForeignKey [FK_WebRoleReportRights_WebReport]    Script Date: 04/01/2011 12:54:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebRoleReportRights_WebReport]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]'))
ALTER TABLE [dbo].[WebRoleReportRights]  WITH CHECK ADD  CONSTRAINT [FK_WebRoleReportRights_WebReport] FOREIGN KEY([ReportId])
REFERENCES [dbo].[WebReport] ([ReportId])
GO
ALTER TABLE [dbo].[WebRoleReportRights] CHECK CONSTRAINT [FK_WebRoleReportRights_WebReport]
GO
/****** Object:  ForeignKey [FK_WebRoleReportRights_WebUserRole]    Script Date: 04/01/2011 12:54:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WebRoleReportRights_WebUserRole]') AND parent_object_id = OBJECT_ID(N'[dbo].[WebRoleReportRights]'))
ALTER TABLE [dbo].[WebRoleReportRights]  WITH CHECK ADD  CONSTRAINT [FK_WebRoleReportRights_WebUserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[WebUserRole] ([RoleId])
GO
ALTER TABLE [dbo].[WebRoleReportRights] CHECK CONSTRAINT [FK_WebRoleReportRights_WebUserRole]
GO




/*********************** Script 06/04/2011 **********************************************/

/****** Object:  Table [dbo].[WebCustomMessages]    Script Date: 04/06/2011 15:50:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebCustomMessages]') AND type in (N'U'))
DROP TABLE [dbo].[WebCustomMessages]
GO
/****** Object:  Table [dbo].[WebCustomMessages]    Script Date: 04/06/2011 15:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebCustomMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebCustomMessages](
	[MsgId] [int] IDENTITY(1,1) NOT NULL,
	[MsgName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MsgText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_WebCustomMessages] PRIMARY KEY CLUSTERED 
(
	[MsgName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[WebCustomMessages] ON
INSERT [dbo].[WebCustomMessages] ([MsgId], [MsgName], [MsgText]) VALUES (1, N'WelcomeMsg', N'Diamond D, Inc was founded in 2001 with a vision of our School Management Database System as a diamond. It has many brilliant facets that all fit together and become one high quality gem. 




The system provides clarity into the direction of the school. Among the facets, we consider the quality of our software, end-user training services to be most critical. 



Our customer service oriented staff helps to ensure that set-up, training, and results are seamless. 

Support is just a phone call away. 
')
INSERT [dbo].[WebCustomMessages] ([MsgId], [MsgName], [MsgText]) VALUES (2, N'LoginMsg', N'Diamond D, Inc was founded in 2001 with a vision of our School Management Database System as a diamond. It has many brilliant facets that all fit together and become one high quality gem. 




The system provides clarity into the direction of the school. Among the facets, we consider the quality of our software, end-user training services to be most critical. 



Our customer service oriented staff helps to ensure that set-up, training, and results are seamless. 

Support is just a phone call away. 
')
SET IDENTITY_INSERT [dbo].[WebCustomMessages] OFF
