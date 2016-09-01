<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.StudentMenuControl"  %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>

 <div style="display:table-cell; width:400px; text-align:left">

      <ul class="menu"  style="text-align:Left;padding:0">
		<li class="top" style="display:inline;white-space:nowrap;float:left"><a href="<%=Page.ResolveUrl(AppHelper.HomeUrl("Home"))%>" class="top_link"><asp:Localize ID="TopMenuHome" runat="server" meta:resourceKey="TopMenuHome" /></a></li>
		<li class="top"><a class="top_link"><asp:Localize ID="TopMenuReports" runat="server" meta:resourceKey="TopMenuReports" /></a>
			<ul class="sub">
            <% //for (int i = 0; i < enabledReportsList.Count; i++)
                //{
                //  string reportName = enabledReportsList[1];

                //if(enabledReportsList[1].ToString().Equals("")

                foreach (var reportName in enabledReportsList)
                {
                    if (reportName.Equals("Academic Review by Term"))
                    {
%>
				<li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("GradeHistory"))%>"><asp:Localize ID="SubMenuReportsGradeHistory" runat="server" meta:resourceKey="SubMenuReportsGradeHistory"/></a></li>
                
                    <%
                    }
                    else if (reportName.Equals("Academic Review"))
                    {

%>
                    <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("Transcript"))%>"><asp:Localize ID="SubMenuReportsUnofficialTranscript" runat="server" meta:resourceKey="SubMenuReportsUnofficialTranscript"/></a></li>
                <%
                    }
                    else if (reportName.Equals("Attendance Review"))
                    {
%>  
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("AttendanceReview"))%>"><asp:Localize ID="SubMenuReportsAttendanceReview" runat="server" meta:resourceKey="SubMenuReportsAttendanceReview"/></a></li>
                <%
                    }
                    else if (reportName.Equals("Attendance Summary"))
                    {
%> 
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("AttendanceSummary"))%>"><asp:Localize ID="SubMenuReportsAttendanceSummary" runat="server" meta:resourceKey="SubMenuReportsAttendanceSummary"/></a></li>
                <%
                    }
                    else if (reportName.Equals("Cosmetology Grade Book Labs"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookLabs"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookLabs" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookLabs" /></a></li>
                                <%
                    }
                    else if (reportName.Equals("Cosmetology Grade Book Summary"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookSummary"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookSummary" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookSummary" /></a></li>
                                <%
                    }
                    else if (reportName.Equals("Cosmetology Grade Book Tests"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("CosmetologyGradeBookTests"))%>"><asp:Localize ID="SubMenuReportsCosmetologyGradeBookTests" runat="server" meta:resourceKey="SubMenuReportsCosmetologyGradeBookTests" /></a></li>
                                <%
                    }
                    else if (reportName.Equals("Ledger"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("StudentLedger"))%>"><asp:Localize ID="SubMenuReportsStudentLedger" runat="server" meta:resourceKey="SubMenuReportsStudentLedger" /></a></li>
                                <%
                    }
                    else if (reportName.Equals("Payment Schedule"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("PaymentSchedule"))%>"><asp:Localize ID="SubMenuReportsPaymentSchedule" runat="server" meta:resourceKey="SubMenuReportsPaymentSchedule"/></a></li>
                                <%
                    }
                    else if (reportName.Equals("Program Course Progress"))
                    {
                    %>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("ProgramCourseProgress"))%>"><asp:Localize ID="SubMenuReportsProgramCourseProgress" runat="server" meta:resourceKey="SubMenuReportsProgramCourseProgress" /></a></li>
	                            <%
                    }
                    else if (reportName.Equals("Schedule of Courses"))
                    {
%>
                <li><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("ScheduleOfCourses"))%>"><asp:Localize ID="SubMenuReportsScheduleOfCourses" runat="server" meta:resourceKey="SubMenuReportsScheduleOfCourses"/></a></li>
                <%
                    }
                }%>
			</ul>
		</li>
		<li class="top"><a class="top_link"><asp:Localize ID="topMenuSettings" runat="server" meta:resourceKey="TopMenuSettings" /></a>
			<ul class="sub"> 
				<li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cp")) %>"><asp:Localize ID="SubMenuSettingsChangePassword" runat="server" meta:resourceKey="SubMenuSettingsChangePassword" /></a></li>			
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/csq")) %>"><asp:Localize ID="SubMenuSettingsChangeSecretQuestion" runat="server" meta:resourceKey="SubMenuSettingsChangeSecretQuestion" /></a></li>
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cm")) %>"><asp:Localize ID="SubMenuSettingsChangeEmail" runat="server" meta:resourceKey="SubMenuSettingsChangeEmail" /></a></li>
			</ul>
		</li>
	  </ul>
</div>
<div style="display:table-cell; width:560px; background:#e8eef4;">
</div>
 <div style="display:table-cell; width:40px;">
    <ul class="menu">
        <li class="top"><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Logout")) %>" class="top_link"><asp:Localize ID="TopMenuLogout" runat="server" meta:resourceKey="TopMenuLogout" /></a></li>
    </ul>
</div>