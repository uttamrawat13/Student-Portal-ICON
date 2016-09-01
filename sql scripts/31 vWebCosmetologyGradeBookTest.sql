
CREATE VIEW [dbo].[vWebCosmetologyGradeBookTest]
AS
SELECT     GBS.StudentNo, WS.Student, GBCode.Description, AVG(GBS.CompletedPoints) AS CompletedPoints
FROM         dbo.GradeBookStudent AS GBS LEFT OUTER JOIN
                      dbo.GradeBookCode AS GBCode ON GBS.GradeBookCodeID = GBCode.GradeBookCodeID LEFT OUTER JOIN
                      dbo.GradeBookStudentRequirements AS GBSRequirements ON GBS.GradeBookCodeID = GBSRequirements.GradeBookCodeID AND 
                      GBS.StudentNo = GBSRequirements.StudentNo LEFT OUTER JOIN
                      dbo.GradeBookType AS GBType ON GBCode.TypeID = GBType.GradeBookTypeID INNER JOIN
                      dbo.WebStudent AS WS ON GBS.StudentNo = WS.StudentNo
WHERE     (GBType.GradeBookType = 'test') AND (WS.AccountStatus = 'Active')
GROUP BY GBS.StudentNo, WS.Student, GBCode.Description, GBSRequirements.RequiredHours, GBSRequirements.RequiredSessions, GBSRequirements.RequiredPoints

GO
