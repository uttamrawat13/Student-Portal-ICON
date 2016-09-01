
CREATE VIEW [dbo].[vWebScheduleOfCourses]
AS
SELECT     COS.StudentNo, WS.Student, T.TermBeginDate, C.CourseCode + '  (' + CO.Session + '-' + CAST(CO.SessionNo AS char(3)) + ')' AS Course, C.CourseDescription, 
                      R.Room, CASE WHEN E.EmpID = NULL THEN '' ELSE E.LName + ', ' + E.FName END AS Instructor, C.Units,
                          (SELECT     MIN(ClassDate) AS Expr1
                            FROM          dbo.CourseOfferingSchedule AS s1
                            WHERE      (CourseOfferingNo = CO.CourseOfferingNo)) AS FirstClassDate,
                          (SELECT     MAX(ClassDate) AS Expr1
                            FROM          dbo.CourseOfferingSchedule AS s2
                            WHERE      (CourseOfferingNo = CO.CourseOfferingNo)) AS LastClassDate
FROM         dbo.CourseOffering AS CO INNER JOIN
                      dbo.Course AS C ON CO.CourseNo = C.CourseNo INNER JOIN
                      dbo.Term AS T ON CO.TermID = T.TermID LEFT OUTER JOIN
                      dbo.Room AS R ON CO.RoomNo = R.RoomNo LEFT OUTER JOIN
                      dbo.Employees AS E ON CO.InstructorID = E.EmpID INNER JOIN
                      dbo.CourseOfferingStudent AS COS ON CO.CourseOfferingNo = COS.CourseOfferingNo INNER JOIN
                      dbo.WebStudent AS WS ON COS.StudentNo = WS.StudentNo
WHERE     (WS.AccountStatus = 'Active')

GO
