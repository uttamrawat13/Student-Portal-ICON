
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

