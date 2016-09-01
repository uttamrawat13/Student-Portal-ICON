USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebGradeBookSummary]    Script Date: 03/24/2011 15:58:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebGradeBookSummary]
AS
SELECT     S.StudentNo, S.FirstName + ' ' + S.LastName AS Student, AVG(vWGBT.CompletedPoints) AS GradeBookGPA, SUM(vWAR.ScheduledAdj) AS TotalScheduled, 
                      SUM(vWAR.AttendedAdj) AS TotalAttended, SUM(vWAR.AttendedAdj) / SUM(vWAR.ScheduledAdj) AS AttendancePercentage, P.HoursRequired AS TotalRequiredHours, 
                      vWGBTC.TransferHours AS TotalTransferHours, P.HoursRequired - SUM(vWAR.AttendedAdj) - vWGBTC.TransferHours AS TotalHoursRemaining
FROM         dbo.Students AS S LEFT OUTER JOIN
                      dbo.vWebAttendanceReview AS vWAR ON S.StudentNo = vWAR.StudentNo LEFT OUTER JOIN
                      dbo.vWebGradeBookTest AS vWGBT ON S.StudentNo = vWGBT.StudentNo INNER JOIN
                      dbo.Program AS P ON S.ProgramNo = P.ProgramNo LEFT OUTER JOIN
                      dbo.vWebGradeBookSummaryTransferCredit AS vWGBTC ON S.StudentNo = vWGBTC.StudentNo
GROUP BY S.StudentNo, S.FirstName, S.LastName, P.HoursRequired, vWGBTC.TransferHours

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
         Configuration = "(H (2 [66] 3))"
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
      ActivePaneConfig = 14
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vWAR"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 125
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vWGBT"
            Begin Extent = 
               Top = 6
               Left = 530
               Bottom = 125
               Right = 715
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 753
               Bottom = 125
               Right = 978
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vWGBTC"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 215
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
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
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookSummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookSummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookSummary'
GO

