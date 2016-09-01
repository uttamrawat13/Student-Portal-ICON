

CREATE VIEW [dbo].[vWebAttendanceSummary]
AS
SELECT     StudentNo, Student, Course, CourseDescription, TermBeginDate, SUM(ClassHours) AS ScheduledTotal, SUM(ScheduledAdj) AS ScheduledToDate, SUM(AttendedAdj) 
                      AS AttendedToDate
FROM         dbo.vWebAttendanceReview AS vWAR
GROUP BY StudentNo, Student, Course, CourseDescription, TermBeginDate

GO
