
CREATE VIEW [dbo].[vWebAttendanceReview]
AS
SELECT     COAS.StudentNo, WS.Student, C.CourseCode + '  (' + CO.[Session] + '-' + CAST(CO.SessionNo AS char(3)) + ')' AS Course, T .TermBeginDate, COS.ClassDate, 
                      COS.ClassStartTime, COS.ClassEndTime, COS.ClassHours, COS.Complete, COAS.AttendanceHours, COAS.AttendanceCode, C.CourseDescription, 
                      ISNULL(COAS.AttendanceHours, 0) * AC.Present AS AttendedAdj, COS.ClassHours * AC.Scheduled AS ScheduledAdj
FROM         CourseOfferingAttendanceScheduled AS COAS INNER JOIN
                      WebStudent AS WS ON COAS.StudentNo = WS.StudentNo INNER JOIN
                      AttendanceCode AS AC ON COAS.AttendanceCode = AC.AttendanceCode INNER JOIN
                      CourseOfferingSchedule AS COS ON COAS.ScheduleID = COS.ScheduleID INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Term AS T ON CO.TermID = T .TermID
WHERE     WS.AccountStatus = 'Active' AND COS.Complete = 'Y'
UNION ALL
SELECT     COAS.StudentNo, WS.Student, C.CourseCode + '  (' + CO.[Session] + '-' + CAST(CO.SessionNo AS char(3)) + ')' AS Course, T .TermBeginDate, COS.ClassDate, 
                      COS.ClassStartTime, COS.ClassEndTime, COS.ClassHours, COS.Complete, COAS.AttendanceHours, '-' AS AttendanceCode, C.CourseDescription, 0.00 AS AttendedAdj, 0.00 AS ScheduledAdj
FROM         CourseOfferingAttendanceScheduled AS COAS INNER JOIN
                      WebStudent AS WS ON COAS.StudentNo = WS.StudentNo INNER JOIN
                      CourseOfferingSchedule AS COS ON COAS.ScheduleID = COS.ScheduleID INNER JOIN
                      CourseOffering AS CO ON COS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Term AS T ON CO.TermID = T .TermID
WHERE     WS.AccountStatus = 'Active' AND COS.Complete = 'N'
UNION ALL
SELECT     COANS.StudentNo, WS.Student, C.CourseCode + '  (' + CO.[Session] + '-' + CAST(CO.SessionNo AS char(3)) + ')' AS Course, T .TermBeginDate, COANS.ClassDate, 
                      COANS.ClassStartTime, COANS.ClassEndTime, ISNULL(COANS.ScheduledHours, 0) AS ClassHours, '' AS Complete, COANS.AttendanceHours, COANS.AttendanceCode, 
                      C.CourseDescription, ISNULL(COANS.AttendanceHours, 0) * AC.Present AS AttendedAdj, ISNULL(COANS.ScheduledHours, 0) * AC.Scheduled AS ScheduledAdj
FROM         CourseOfferingAttendanceNotScheduled AS COANS INNER JOIN
                      WebStudent AS WS ON COANS.StudentNo = WS.StudentNo INNER JOIN
                      AttendanceCode AS AC ON COANS.AttendanceCode = AC.AttendanceCode INNER JOIN
                      CourseOffering AS CO ON COANS.CourseOfferingNo = CO.CourseOfferingNo INNER JOIN
                      Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      Term AS T ON CO.TermID = T .TermID
WHERE     WS.AccountStatus = 'Active'

GO
