
CREATE VIEW [dbo].[vWebLedger]
AS
SELECT     L.StudentNo, WS.Student, L.TransDate, L.Description AS [Transaction], L.Debit, L.Credit
FROM         dbo.ARLedgerCode AS LC INNER JOIN
                      dbo.ARLedger AS L ON LC.LedgerNo = L.LedgerNo INNER JOIN
                      dbo.WebStudent AS WS ON L.StudentNo = WS.StudentNo
WHERE     (WS.AccountStatus = 'Active')

GO
