
CREATE VIEW [dbo].[vWebPaymentSchedule]
AS
SELECT     D.StudentNo, WS.Student, LC.InvoiceDescription AS Description, D.DisbursementAmount AS Amount, CASE WHEN IsDate(D .DepositDate) 
                      = 0 THEN 0 ELSE D .DisbursementAmount END AS AmountUnpaid, D.DisbursementDate AS Scheduled, D.DepositDate
FROM         dbo.AwardsDisbursement AS D INNER JOIN
                      dbo.ARLedgerCode AS LC ON D.LedgerNo = LC.LedgerNo INNER JOIN
                      dbo.WebStudent AS WS ON D.StudentNo = WS.StudentNo
WHERE     (LC.Statement = 'Y') AND (WS.AccountStatus = 'Active')

GO
