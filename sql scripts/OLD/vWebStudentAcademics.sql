USE [MIL-FRE]
GO

/****** Object:  View [dbo].[vWebStudentAcademics]    Script Date: 03/24/2011 15:59:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vWebStudentAcademics]
AS
SELECT     COS.StudentNo, S.FirstName + ' ' + S.LastName AS Student, '2' AS SortOrder, CO.TermID, T .TermDescription, T .TermBeginDate, C.TranscriptCode, C.CourseNo, 
                      C.CourseCode, C.CourseDescription, CO.Session, CO.SessionNo, CASE WHEN C.TranscriptCode = NULL 
                      THEN C.CourseCode ELSE C.TranscriptCode END AS TranCourseCode, CO.ClassHours, C.Units, G.Grade, G.NumberGrade, 
                      CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) * G.NumberGrade ELSE 0 END AS StudentGPAValue, CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, 
                      G.GradeWeight) ELSE 0 END AS StudentGPAWeight, CASE WHEN G.UnitsInProgress = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsInProgress, 
                      CASE WHEN G.UnitsAttempted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsAttempted, 
                      CASE WHEN G.UnitsCompleted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsCompleted
FROM         CourseOfferingStudent AS COS INNER JOIN
                      Students AS S ON COS.StudentNo = S.StudentNo INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Term AS T ON CO.TermID = T .TermID INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON COS.GradeNo = G.GradeNo LEFT JOIN
                      CourseOfferingStudentStatus AS COSS ON COS.StatusID = COSS.StatusID
WHERE     COSS.ShowOnTranscript = 'Y'
UNION ALL
SELECT     T .StudentNo, S.FirstName + ' ' + S.LastName AS Student, '1' AS SortOrder, 0 AS TermID, 'Transfer' AS TermDescription, NULL AS TermBeginDate, C.TranscriptCode, 
                      C.CourseNo, C.CourseCode, C.CourseDescription, NULL AS Session, 0 AS SessionNo, CASE WHEN C.TranscriptCode = NULL 
                      THEN C.CourseCode ELSE C.TranscriptCode END AS TranCourseCode, T .TransferHours AS Hours, T .TransferUnits AS Units, G.Grade, G.NumberGrade, 
                      CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, G.GradeWeight) * G.NumberGrade ELSE 0 END AS StudentGPAValue, CASE WHEN G.GPA = 'Y' THEN POWER(C.Units, 
                      G.GradeWeight) ELSE 0 END AS StudentGPAWeight, CASE WHEN G.UnitsInProgress = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsInProgress, 
                      CASE WHEN G.UnitsAttempted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsAttempted, 
                      CASE WHEN G.UnitsCompleted = 'Y' THEN C.Units ELSE 0 END AS StudentUnitsCompleted
FROM         TransferStudentCredit AS T INNER JOIN
                      Students AS S ON T .StudentNo = S.StudentNo INNER JOIN
                      TransferStatus AS TS ON T .TransferStatusID = TS .TransferStatusID INNER JOIN
                      Course AS C ON T .EqvCourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON T .TransferGradeNo = G.GradeNo
WHERE     TS .OnTranscript = 'Y'

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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebStudentAcademics'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWebStudentAcademics'
GO

