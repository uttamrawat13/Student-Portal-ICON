
CREATE VIEW [dbo].[vWebProgramCourseProgress1]
AS
SELECT     COS.StudentNo, 'Completed' AS ReportGroup, C.CourseNo, C.CourseCode, C.CourseDescription, C.Units
FROM         CourseOfferingStudent AS COS INNER JOIN
                      WebStudent AS WS ON COS.StudentNo = WS.StudentNo INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON COS.GradeNo = G.GradeNo
WHERE     G.UnitsCompleted = 'Y' AND (WS.AccountStatus = 'Active')
UNION ALL
SELECT     T .StudentNo, 'Completed (Transfer)' AS ReportGroup, C.CourseNo, C.CourseCode, C.CourseDescription, T .TransferUnits AS Units
FROM         TransferStudentCredit AS T INNER JOIN
                      WebStudent AS WS ON T .StudentNo = WS.StudentNo INNER JOIN
                      Course AS C ON T .EqvCourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON T .TransferGradeNo = G.GradeNo
WHERE     G.UnitsCompleted = 'Y' AND (WS.AccountStatus = 'Active')
UNION ALL
SELECT     COS.StudentNo, 'In Progress' AS ReportGroup, C.CourseNo, C.CourseCode, C.CourseDescription, C.Units
FROM         CourseOfferingStudent AS COS INNER JOIN
                      WebStudent AS WS ON COS.StudentNo = WS.StudentNo INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Grade AS G ON COS.GradeNo = G.GradeNo
WHERE     G.UnitsInProgress = 'Y' AND (WS.AccountStatus = 'Active')
UNION ALL
SELECT     WS.StudentNo, 'Required' AS ReportGroup, C.CourseNo, C.CourseCode, C.CourseDescription, C.Units
FROM         WebStudent AS WS INNER JOIN
                      ProgramCourse AS PC ON WS.ProgramNo = PC.ProgramNo INNER JOIN
                      Course AS C ON PC.CourseNo = C.CourseNo AND (WS.AccountStatus = 'Active')

GO
