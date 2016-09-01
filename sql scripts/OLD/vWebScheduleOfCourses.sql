USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebScheduleOfCourses]    Script Date: 03/24/2011 15:59:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebScheduleOfCourses]
AS
SELECT     COS.StudentNo, S.FirstName + ' ' + S.LastName AS Student, T.TermBeginDate, C.CourseCode + '  (' + CO.Session + '-' + CO.SessionNo + ')' AS Course, 
                      C.CourseDescription, R.Room, CASE WHEN E.EmpID IS NULL THEN '' ELSE E.LName + ', ' + E.FName END AS Instructor, C.Units,
                          (SELECT     MIN(ClassDate) AS Expr1
                            FROM          dbo.CourseOfferingSchedule
                            WHERE      (CourseOfferingNo = CO.CourseOfferingNo)) AS FirstClassDate,
                          (SELECT     MAX(ClassDate) AS Expr1
                            FROM          dbo.CourseOfferingSchedule AS CourseOfferingSchedule_1
                            WHERE      (CourseOfferingNo = CO.CourseOfferingNo)) AS LastClassDate
FROM         dbo.CourseOffering AS CO INNER JOIN
                      dbo.Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      dbo.Term AS T ON CO.TermID = T.TermID LEFT OUTER JOIN
                      dbo.Room AS R ON CO.RoomNo = R.RoomNo LEFT OUTER JOIN
                      dbo.Employees AS E ON CO.InstructorID = E.EmpID INNER JOIN
                      dbo.CourseOfferingStudent AS COS ON CO.CourseOfferingNo = COS.CourseOfferingNo INNER JOIN
                      dbo.Students AS S ON COS.StudentNo = S.StudentNo

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
         Begin Table = "CO"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 125
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 524
               Bottom = 125
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 737
               Bottom = 125
               Right = 912
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "COS"
            Begin Extent = 
               Top = 126
               Left = 251
               Bottom = 245
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 126
               Left = 517
               Bottom = 245
               Right = 725
            End
            DisplayFlags = 280
            TopCol' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebScheduleOfCourses'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'umn = 0
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebScheduleOfCourses'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebScheduleOfCourses'
GO

