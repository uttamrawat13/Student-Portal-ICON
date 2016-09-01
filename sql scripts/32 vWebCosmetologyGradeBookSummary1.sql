

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

GO
