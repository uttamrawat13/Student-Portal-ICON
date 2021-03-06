
INSERT [dbo].[WebUserRole] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[WebUserRole] ([RoleId], [RoleName]) VALUES (2, N'Student')

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

INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (1, N'student', N'student', N'student@sportal.com', N'Active', N'What''s your favourite pet?', N'Dog', 2)
INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (3889, N'admin', N'admin', N'admin@sportal.com', N'Active', N'What''s your favourite pet?', N'Cat', 1)
INSERT [dbo].[WebUser] ([WebUserId], [WebUserName], [WebPassword], [Email], [AccountStatus], [PasswordQuestion], [PasswordAnswer], [RoleId]) VALUES (12, N'Test', N'123', N'abc@test.com', N'InActive', N'what is your name?', N'abc', 2)

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

SET IDENTITY_INSERT [dbo].[WebCustomMessages] ON
INSERT [dbo].[WebCustomMessages] ([MsgId], [MsgName], [MsgText]) VALUES (1, N'WelcomeMsg', N'Edit this Welcome message from the Administrator login')
INSERT [dbo].[WebCustomMessages] ([MsgId], [MsgName], [MsgText]) VALUES (2, N'LoginMsg', N'Edit this Login message from the Administrator login')
SET IDENTITY_INSERT [dbo].[WebCustomMessages] OFF