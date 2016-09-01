
CREATE VIEW [dbo].[vWebGradeBookSummaryTransferCredit]
AS
SELECT     TSC.StudentNo, SUM(TSC.TransferHours) AS TransferHours
FROM         dbo.TransferStudentCredit AS TSC INNER JOIN
                      dbo.WebStudent AS WS ON TSC.StudentNo = WS.StudentNo
WHERE     (WS.AccountStatus = 'Active')
GROUP BY TSC.StudentNo

GO
