
CREATE VIEW [dbo].[vWebCosmetologyGradeBookLab]
AS
SELECT     GBS.StudentNo, WS.Student, GBC.Description, SUM(GBS.CompletedSessions) AS CompletedSessions, GBSR.RequiredSessions
FROM         dbo.GradeBookStudent AS GBS INNER JOIN
                      dbo.GradeBookCode AS GBC ON GBS.GradeBookCodeID = GBC.GradeBookCodeID INNER JOIN
                      dbo.GradeBookType AS GBT ON GBC.TypeID = GBT.GradeBookTypeID LEFT OUTER JOIN
                      dbo.GradeBookStudentRequirements AS GBSR ON GBS.GradeBookCodeID = GBSR.GradeBookCodeID AND GBS.StudentNo = GBSR.StudentNo INNER JOIN
                      dbo.WebStudent AS WS ON GBS.StudentNo = WS.StudentNo
WHERE     (GBT.GradeBookType = 'Lab') AND (WS.AccountStatus = 'Active')
GROUP BY GBS.StudentNo, WS.Student, GBC.Description, GBSR.RequiredSessions

GO
