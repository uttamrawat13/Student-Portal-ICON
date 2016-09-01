<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.StudentMenuControl"  %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ Import Namespace="DiamondD.Data.DataAccess.StudentReportStatus" %>

 <div class="displayCellWidth400pxLeft">

      <ul class="menu">

		<li class="top"><a href="<%=Page.ResolveUrl(AppHelper.UsersUrl("Home"))%>" class="top_link"><asp:Localize ID="TopMenuHome" runat="server" meta:resourceKey="TopMenuHome" /></a></li>
        
        <% 
            /// FIXME: Ugly! Should be refactored asap!
            /// 
            /// Reason: Currently this change requires many structural level changes in 
            /// database and on code side as well.             
            foreach (var reportName in enabledReportsList)
            {
                if (reportName.Equals("CourseEnrollment"))
                {
                    %>                    
                        <li class="top"><a class="top_link"><asp:Localize ID="TopMenuEnrollment" runat="server" meta:resourceKey="TopMenuEnrollment" /></a>
			                <ul class="sub"> 
                                <li><a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("Enroll"))%>">
                                <% DiamondD.Data.DataAccess.Report.WebReport report = new DiamondD.Services.Report.ReportsService().GetWebReport(reportName); %>
                                <%=String.IsNullOrEmpty(report.DisplayName)?report.ReportName:report.DisplayName%>
                                </a>
                                </li>
                            </ul>
                        </li>                    
                    <%                    
                    break;
                }
            }
          %>
        

		<li class="top">
            <a class="top_link">
                <asp:Localize ID="TopMenuReports" runat="server" meta:resourceKey="TopMenuReports" />
            </a>
			<ul class="sub">
            
            <%
                foreach (var reportName in enabledReportsList)
                {
                    /// FIXME: Ugly! Should be refactored asap!
                    /// 
                    /// Reason: Currently this change requires many structural level changes in 
                    /// database and on code side as well. 
                    if (reportName.Equals("CourseEnrollment"))
                        continue;
                    
                    var menuEntry = "SubMenuReports" + reportName + ".Text";
            %>
                    
                    <li> <a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl(reportName))%>">
                    <% var report = new DiamondD.Services.Report.ReportsService().GetWebReport(reportName); %>

                            <%=  
                            String.IsNullOrEmpty(report.DisplayName)?report.ReportName:report.DisplayName 
                            %>
                    </a> </li>
             <%
                 }
             %>
			</ul>
		</li>

          <!-- New Menu Added By Uttam -->
          <li class="top"><a href="<%=Page.ResolveUrl(AppHelper.ReportsUrl("PaymentSchedule"))%>" class="top_link"><asp:Localize ID="TopMenuPaymentSchedule" runat="server" meta:resourceKey="TopPaymentSchedule" /></a></li>
       







		<li class="top"><a class="top_link"><asp:Localize ID="topMenuSettings" runat="server" meta:resourceKey="TopMenuSettings" /></a>
			<ul class="sub"> 
				<li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cp")) %>"><asp:Localize ID="SubMenuSettingsChangePassword" runat="server" meta:resourceKey="SubMenuSettingsChangePassword" /></a></li>			
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/csq")) %>"><asp:Localize ID="SubMenuSettingsChangeSecretQuestion" runat="server" meta:resourceKey="SubMenuSettingsChangeSecretQuestion" /></a></li>
	            <li><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("UserSettings/cm")) %>"><asp:Localize ID="SubMenuSettingsChangeEmail" runat="server" meta:resourceKey="SubMenuSettingsChangeEmail" /></a></li>
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