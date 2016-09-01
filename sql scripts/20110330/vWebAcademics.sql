USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebAcademics]    Script Date: 03/30/2011 15:27:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebAcademics]
AS
SELECT     COS.StudentNo, WS.Student, '2' AS SortOrder, CO.TermID, T .TermDescription, T .TermBeginDate, C.TranscriptCode, C.CourseNo, C.CourseCode, C.CourseDescription, 
                      CO.Session, CO.SessionNo, CASE WHEN C.TranscriptCode = NULL THEN C.CourseCode ELSE C.TranscriptCode END AS TranCourseCode, CO.ClassHours, C.Units, 
                      G.Grade, G.NumberGrade, CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) * G.NumberGrade ELSE 0 END AS StudentGPAValue, 
                      CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) ELSE 0 END AS StudentGPAWeight, 
                      CASE WHEN G.UnitsInProgress = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsInProgress, 
                      CASE WHEN G.UnitsAttempted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsAttempted, 
                      CASE WHEN G.UnitsCompleted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsCompleted
FROM         CourseOfferingStudent AS COS INNER JOIN
                      WebStudent AS WS ON COS.StudentNo = WS.StudentNo INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Term AS T ON CO.TermID = T .TermID INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON COS.GradeNo = G.GradeNo LEFT JOIN
                      CourseOfferingStudentStatus AS COSS ON COS.StatusID = COSS.StatusID
WHERE     COSS.ShowOnTranscript = 'Y' AND WS.AccountStatus = 'Active'
UNION ALL
SELECT     T .StudentNo, WS.Student, '1' AS SortOrder, 0 AS TermID, 'Transfer' AS TermDescription, NULL AS TermBeginDate, C.TranscriptCode, C.CourseNo, C.CourseCode, 
                      C.CourseDescription, NULL AS Session, 0 AS SessionNo, CASE WHEN C.TranscriptCode = NULL THEN C.CourseCode ELSE C.TranscriptCode END AS TranCourseCode,
                       T .TransferHours AS Hours, T .TransferUnits AS Units, G.Grade, G.NumberGrade, CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) 
                      * G.NumberGrade ELSE 0 END AS StudentGPAValue, CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) ELSE 0 END AS StudentGPAWeight, 
                      CASE WHEN G.UnitsInProgress = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsInProgress, 
                      CASE WHEN G.UnitsAttempted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsAttempted, 
                      CASE WHEN G.UnitsCompleted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsCompleted
FROM         TransferStudentCredit AS T INNER JOIN
                      WebStudent AS WS ON T .StudentNo = WS.StudentNo INNER JOIN
                      TransferStatus AS TS ON T .TransferStatusID = TS .TransferStatusID INNER JOIN
                      Course AS C ON T .EqvCourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON T .TransferGradeNo = G.GradeNo
WHERE     TS .OnTranscript = 'Y' AND WS.AccountStatus = 'Active'

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
      Begin ColumnWidths = 9
         Width = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebAcademics'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebAcademics'
GO

