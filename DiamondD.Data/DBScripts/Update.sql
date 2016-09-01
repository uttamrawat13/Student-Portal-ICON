-- Insert FinancialAidAwards in Menu
INSERT INTO WebReport (ReportName, Active) VALUES ('FinancialAidAwards', 'Y');

-- Give FinancialAidAwards Report Right to Admin
INSERT INTO WebRoleReportRights (RoleId, ReportId)  
SELECT WebUserRole.RoleId, WebReport.ReportId FROM WebUserRole,WebReport 
WHERE WebUserRole.RoleName = 'Admin' AND  WebReport.ReportName = 'FinancialAidAwards'