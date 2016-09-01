
CREATE VIEW [dbo].[vWebCosmetologyGradeBookSummary]
AS
SELECT     StudentNo, Student, SUM(GradeBookGPA) AS GradeBookGPA, SUM(TotalScheduled) AS TotalScheduled, SUM(TotalAttended) AS TotalAttended, SUM(TotalAttended) 
                      / SUM(TotalScheduled) AS AttendancePercentage, SUM(TotalRequiredHours) AS TotalRequiredHours, SUM(TotalTransferHours) AS TotalTransferHours, 
                      SUM(TotalRequiredHours) - SUM(TotalAttended) - SUM(TotalTransferHours) AS TotalHoursRemaining
FROM         dbo.vWebCosmetologyGradeBookSummary1 AS v1
GROUP BY StudentNo, Student

GO
