<!-- Now, this control not use in this project.  Feb 02 2011-->

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.ReportMenuControl" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<div class="div-table" style="width:175px; height:273px;">

    <div id="TopDiv" style="width:100%; height:15px">
        <img src="<%= Page.ResolveUrl(AppHelper.ImageUrl("TopImage.png")) %>" /> 
    </div>
    <div id="MiddleDiv" style="width:100%; height:300px">
        <div class="div-table">
            <div  class="div-table-row" style="width:100%">
                <div class="div-table-col" style=" width:1px; background-image:url(../Content/Images/Line.png);">
                &nbsp;
                </div>
                <div class="div-table-col" style="width:170px; text-align:left;">
                    <div class="container" style="width:170px;  height:300px">
                        <asp:Label ID="lblHead" runat="server" ForeColor="Black" Text="Heading"></asp:Label>
                        <hr />
                         &nbsp;<a href="#"><asp:Localize ID="lblProgramCourseProgress" runat="server" meta:resourceKey="lblProgramCourseProgress" /></a> 
                         <br /><br />
                         &nbsp;<a href="#"><asp:Localize ID="lblFutureCourseOfferings" runat="server" meta:resourceKey="lblFutureCourseOfferings" /></a> 
                         <br /><br />
                         &nbsp;<a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("AttendanceReview")) %>"><asp:Localize ID="lblAttendanceReview" runat="server" meta:resourceKey="lblAttendanceReview" /></a> 
                         <br /><br />
                         &nbsp;<a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("GradeHistory")) %>"><asp:Localize ID="lblGradeHistory" runat="server" meta:resourceKey="lblGradeHistory" /></a> 
                         <br /><br />
                         &nbsp;<a href="  <%= Page.ResolveUrl(AppHelper.ReportsUrl("Transcript")) %>"><asp:Localize ID="lblnofficialTranscript" runat="server" meta:resourceKey="lblUnofficialTranscript" /></a> 
                         <br /><br />
                         &nbsp;<a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("StudentDetail")) %>"><asp:Localize ID="lblScheduleOfCourses" runat="server" meta:resourceKey="lblScheduleOfCourses" /></a>
                         <br /><br />
                         &nbsp;<a href="<%= Page.ResolveUrl(AppHelper.ReportsUrl("PaymentSchedule")) %>"><asp:Localize ID="lblPaymentSchedule" runat="server" meta:resourceKey="lblPaymentSchedule" /></a> 
                         <br /><br />
                         &nbsp;<a href="#"><asp:Localize ID="lblStudentLedger" runat="server" meta:resourceKey="lblStudentLedger" /></a> 
                         <br /><br />
                         &nbsp;<a href="#"><asp:Localize ID="lblAwards" runat="server" meta:resourceKey="lblAwards" /></a> 
                         <br /><br />
                         &nbsp;<a href="#"><asp:Localize ID="lblStudentNotices" runat="server" meta:resourceKey="lblStudentNotices" /></a> 
                         
                         </div>
                </div>
                <div class="div-table-col" style=" width:1px; background-image:url(../Content/Images/Line.png);">
                &nbsp;
                </div>
             </div>
         </div>
        
    </div>
    <div id="ButtomDiv" style="width:175px; height:15px">
        <img src="<%= Page.ResolveUrl(AppHelper.ImageUrl("ButtomImage.png")) %>" /> 
    </div>

</div>

       
