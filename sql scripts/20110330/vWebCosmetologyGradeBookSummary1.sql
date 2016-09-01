USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebCosmetologyGradeBookSummary1]    Script Date: 03/30/2011 15:28:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebCosmetologyGradeBookSummary1]
AS
SELECT     WS.StudentNo, WS.Student, 0.00 AS GradeBookGPA, 0.00 AS TotalScheduled, 0.00 AS TotalAttended, 0.00 AS AttendancePercentage, 
                      P.HoursRequired AS TotalRequiredHours, 0.00 AS TotalTransferHours, 0.00 AS TotalHoursRemaining
FROM         dbo.WebStudent AS WS INNER JOIN
                      dbo.Program AS P ON WS.ProgramNo = P.ProgramNo
WHERE     (WS.AccountStatus = 'Active')
UNION ALL
SELECT     TSC.StudentNo, WS.Student, 0.00 AS GradeBookGPA, 0.00 AS TotalScheduled, 0.00 AS TotalAttended, 0.00 AS AttendancePercentage, 0.00 AS TotalRequiredHours, 
                      SUM(TSC.TransferHours) AS TotalTransferHours, 0.00 AS TotalHoursRemaining
FROM         dbo.TransferStudentCredit AS TSC INNER JOIN
                      dbo.WebStudent AS WS ON TSC.StudentNo = WS.StudentNo
WHERE     (WS.AccountStatus = 'Active')
GROUP BY TSC.StudentNo, WS.Student
UNION ALL
SELECT     WS.StudentNo, WS.Student, AVG(vWGBT.CompletedPoints) AS GradeBookGPA, 0.00 AS TotalScheduled, 0.00 AS TotalAttended, 0.00 AS AttendancePercentage, 
                      0.00 AS TotalRequiredHours, 0.00 AS TotalTransferHours, 0.00 AS TotalHoursRemaining
FROM         dbo.WebStudent AS WS INNER JOIN
                      dbo.vWebCosmetologyGradeBookTest AS vWGBT ON WS.StudentNo = vWGBT.StudentNo
WHERE     (WS.AccountStatus = 'Active')
GROUP BY WS.StudentNo, WS.Student
UNION ALL
SELECT     WS.StudentNo, WS.Student, 0.00 AS GradeBookGPA, SUM(vWAR.ScheduledAdj) AS TotalScheduled, SUM(vWAR.AttendedAdj) AS TotalAttended, 
                      SUM(vWAR.AttendedAdj) / SUM(vWAR.ScheduledAdj) AS AttendancePercentage, 0.00 AS TotalRequiredHours, 0.00 AS TotalTransferHours, 
                      0.00 AS TotalHoursRemaining
FROM         dbo.WebStudent AS WS INNER JOIN
                      dbo.vWebAttendanceReview AS vWAR ON WS.StudentNo = vWAR.StudentNo
WHERE     (WS.AccountStatus = 'Active')
GROUP BY WS.StudentNo, WS.Student
UNION ALL
SELECT     WS.StudentNo, WS.Student, AVG(vWGBT.CompletedPoints) AS GradeBookGPA, 0.00 AS TotalScheduled, 0.00 AS TotalAttended, 0.00 AS AttendancePercentage, 
                      0.00 TotalRequiredHours, 0.00 AS TotalTransferHours, 0.00 AS TotalHoursRemaining
FROM         dbo.WebStudent AS WS INNER JOIN
                      dbo.vWebCosmetologyGradeBookTest AS vWGBT ON WS.StudentNo = vWGBT.StudentNo
WHERE     (WS.AccountStatus = 'Active')
GROUP BY WS.StudentNo, WS.Student

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebCosmetologyGradeBookSummary1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebCosmetologyGradeBookSummary1'
GO

