<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.AdminMenuControl" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ Import Namespace="DiamondD.Data.DataAccess.StudentReportStatus"%>
<%@ Import Namespace="DiamondD.Data.DataAccess.Report" %>

 <div class="displayCellWidth400pxLeft">

      <ul class="menu">
		<li class="top"><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Home")) %>" class="top_link"><asp:Localize ID="TopMenuHome" runat="server" meta:resourceKey="TopMenuHome" /></a></li>
		<li class="top"><a class="top_link"><asp:Localize ID="TopMenuReports" runat="server" meta:resourceKey="TopMenuReports" /></a>
			<ul class="sub">
            <%IList<WebReport> reports = new DiamondD.Services.Report.ReportsService().GetAllWebReports(false); %>
            <%foreach (WebReport report in reports)
              {%>
                <li>
                    <%if (report.ReportName.Equals("CourseEnrollment"))
                      {%>
                          <a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("Enroll"))%>"><%=String.IsNullOrEmpty(report.DisplayName)?report.ReportName:report.DisplayName%></a>
                      <%}else{ %>
                    <a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl(report.ReportName))%>"><%=String.IsNullOrEmpty(report.DisplayName)?report.ReportName:report.DisplayName%></a>
                    <%} %>
                
                </li>                    
              <%} %>
				<%--<li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("AcademicReview"))%>"><asp:Localize ID="SubMenuReportsGradeHistory" runat="server" meta:resourceKey="SubMenuReportsGradeHistory"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("AcademicReviewByTerm"))%>"><asp:Localize ID="SubMenuReportsUnofficialTranscript" runat="server" meta:resourceKey="SubMenuReportsUnofficialTranscript"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("AttendanceReview"))%>"><asp:Localize ID="SubMenuReportsAttendanceReview" runat="server" meta:resourceKey="SubMenuReportsAttendanceReview"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("AttendanceSummary"))%>"><asp:Localize ID="SubMenuReportsAttendanceSummary" runat="server" meta:resourceKey="SubMenuReportsAttendanceSummary"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookLabs"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookLabs" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookLabs" /></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookSummary"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookSummary" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookSummary" /></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookTests"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookTests" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookTests" /></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("StudentLedger"))%>"><asp:Localize ID="SubMenuReportsStudentLedger" runat="server" meta:resourceKey="SubMenuReportsStudentLedger" /></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("PaymentSchedule"))%>"><asp:Localize ID="SubMenuReportsPaymentSchedule" runat="server" meta:resourceKey="SubMenuReportsPaymentSchedule"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("ProgramCourseProgress"))%>"><asp:Localize ID="SubMenuReportsProgramCourseProgress" runat="server" meta:resourceKey="SubMenuReportsProgramCourseProgress" /></a></li>
	            <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("ScheduleOfCourses"))%>"><asp:Localize ID="SubMenuReportsScheduleOfCourses" runat="server" meta:resourceKey="SubMenuReportsScheduleOfCourses"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("FinancialAidAwards"))%>"><asp:Localize ID="SubMenuReportsFinancialAidAwards" runat="server" meta:resourceKey="SubMenuReportsFinancialAidAwards"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("GradeBook"))%>"><asp:Localize ID="SubMenuReportsGradeBook" runat="server" meta:resourceKey="SubMenuReportsGradeBook"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("Student1098TPdf"))%>"><asp:Localize ID="SubMenuReportsStudent1098TPDF" runat="server" meta:resourceKey="SubMenuReportsStudent1098TPDF"/></a></li>
                --%>
			</ul>
		</li>
		<li class="top"><a class="top_link"><asp:Localize ID="topMenuSettings" runat="server" meta:resourceKey="TopMenuSettings" /></a>
			<ul class="sub"> 
				<li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cp"))%>"><asp:Localize ID="SubMenuSettingsChangePassword" runat="server" meta:resourceKey="SubMenuSettingsChangePassword" /></a></li>			
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/csq"))%>"><asp:Localize ID="SubMenuSettingsChangeSecretQuestion" runat="server" meta:resourceKey="SubMenuSettingsChangeSecretQuestion" /></a></li>
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cm"))%>"><asp:Localize ID="SubMenuSettingsChangeEmail" runat="server" meta:resourceKey="SubMenuSettingsChangeEmail" /></a></li>
                <% if (Session["DD_Role"].ToString().Equals("Admin"))
                   {%>
                   <hr />
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("AdminSettings/ul"))%>"><asp:Localize ID="SubMenuSettingsChangeUploadLogo" runat="server" meta:resourceKey="SubMenuSettingsChangeUploadLogo" /></a></li>
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("AdminSettings/ct"))%>"><asp:Localize ID="SubMenuSettingsChangeTitleMsg" runat="server" meta:resourceKey="SubMenuSettingsChangeTitleMsg" /></a></li>
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("AdminSettings/lm"))%>"><asp:Localize ID="SubMenuSettingsChangeLoginMsg" runat="server" meta:resourceKey="SubMenuSettingsChangeLoginMsg" /></a></li>
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("AdminSettings/wm"))%>"><asp:Localize ID="SubMenuSettingsChangeWelcomeMsg" runat="server" meta:resourceKey="SubMenuSettingsChangeWelcomeMsg" /></a></li>
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("AdminSettings/es"))%>"><asp:Localize ID="SubMenuSettingsForgotUserName" runat="server" meta:resourceKey="SubMenuSettingsForgotUserName" /></a></li>
                   <hr />
                   <li><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("Rights"))%>"><asp:Localize ID="SubMenuSettingsChangeReportRights" runat="server" meta:resourceKey="SubMenuSettingsChangeReportRights" /></a></li>
                   <%
                   }%>
			</ul>
		</li>
	  </ul>
</div>
<div class="menuBKColorWidth560px">
</div>
 <div class="displayCellWidth40px">
    <ul class="menu">
        <li class="top"><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Logout")) %>" class="top_link"><asp:Localize ID="TopMenuLogout" runat="server" meta:resourceKey="TopMenuLogout" /></a></li>
    </ul>
</div>