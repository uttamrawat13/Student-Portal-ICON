USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebGradeBookTest]    Script Date: 03/24/2011 15:58:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebGradeBookTest]
AS
SELECT     GBS.StudentNo, S.FirstName + ' ' + S.LastName AS Student, GBCode.Description, AVG(GBS.CompletedPoints) AS CompletedPoints
FROM         dbo.GradeBookStudent AS GBS LEFT OUTER JOIN
                      dbo.GradeBookCode AS GBCode ON GBS.GradeBookCodeID = GBCode.GradeBookCodeID LEFT OUTER JOIN
                      dbo.GradeBookStudentRequirements AS GBSRequirements ON GBS.GradeBookCodeID = GBSRequirements.GradeBookCodeID AND 
                      GBS.StudentNo = GBSRequirements.StudentNo LEFT OUTER JOIN
                      dbo.GradeBookType AS GBType ON GBCode.TypeID = GBType.GradeBookTypeID INNER JOIN
                      dbo.Students AS S ON GBS.StudentNo = S.StudentNo
WHERE     (GBType.GradeBookType = 'test')
GROUP BY GBS.StudentNo, S.FirstName, S.LastName, GBCode.Description, GBSRequirements.RequiredHours, GBSRequirements.RequiredSessions, 
                      GBSRequirements.RequiredPoints

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
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GBS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GBCode"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 125
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GBSRequirements"
            Begin Extent = 
               Top = 6
               Left = 504
               Bottom = 125
               Right = 697
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GBType"
            Begin Extent = 
               Top = 6
               Left = 735
               Bottom = 95
               Right = 927
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 96
               Left = 735
               Bottom = 215
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
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
         Or = 1350
         Or = 1350
         Or = 1350
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookTest'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookTest'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebGradeBookTest'
GO

