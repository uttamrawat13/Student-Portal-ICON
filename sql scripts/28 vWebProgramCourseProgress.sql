
CREATE VIEW [dbo].[vWebProgramCourseProgress]
AS
SELECT v1.StudentNo, WS.Student, MIN(v1.ReportGroup) AS ReportGroup, v1.CourseNo, v1.CourseCode, v1.CourseDescription, MAX(v1.Units) AS Units
FROM dbo.vWebProgramCourseProgress1 AS v1
INNER JOIN dbo.WebStudent AS WS ON v1.StudentNo = WS.StudentNo
GROUP BY v1.StudentNo, WS.Student, v1.CourseNo, v1.CourseCode, v1.CourseDescription
ORDER BY ReportGroup

GO
