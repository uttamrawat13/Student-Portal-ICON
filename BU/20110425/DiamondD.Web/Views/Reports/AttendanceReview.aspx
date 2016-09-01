<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.Attendance.StudentAttendance>" Culture="auto" UICulture="auto"%>
<%@ Register Assembly="jQueryDatePicker" Namespace="Westwind.Web.Controls" TagPrefix="ww" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgAttendanceReview" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" language="javascript">
    function SetDates() {
        var dateFrom = document.getElementById('ctl00_MainContent_txtDateFrom');
        var dateTo = document.getElementById('ctl00_MainContent_txtDateTo');

        if (dateTo.value == "" || dateFrom.value == "") {
            document.getElementById('requireDate').style.display = "";
            return false;
        }
        document.getElementById('requireDate').style.display = "none";
        document.getElementById('dateTo').value = dateTo.value;
        document.getElementById('dateFrom').value = dateFrom.value;

        return true;
    }
</script>

<div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
        <center>
    <h1><asp:Localize ID="lblHeading" runat="server" meta:resourceKey="lblHeading" /></h1>
    <br />
    <span class="Heading3"> <%= Html.Encode(Model.StudentName) %> </span>
    <br /> 
    <!--  Here Code Date Picker -->
    <br />
    
       <form id="searchOnDate" action="/Views/Reports.mvc/AttendanceReview" method="post" runat="server">
        <asp:Localize ID="lblDateFrom" runat="server" meta:resourceKey="lblDateFrom" />
        <input type="hidden" id="dateFrom" name="dateFrom"  />
        <ww:jQueryDatePicker ID="txtDateFrom" runat="server" 
         DisplayMode="ImageButton" ReadOnly="true" >
        </ww:jQueryDatePicker>
        &nbsp;&nbsp;
        
       <asp:Localize ID="lblDateTo" runat="server" meta:resourceKey="lblDateTo" /> 
        <input type="hidden" id="dateTo"  name="dateTo"/>
         <ww:jQueryDatePicker ID="txtDateTo" runat="server" 
         DisplayMode="ImageButton" ReadOnly="true" Text="">
         </ww:jQueryDatePicker>
        &nbsp;&nbsp;
        
        <input id="btnSearch" type="submit" value="Search" meta:resourceKey="btnSearchCaption"  onclick="javascript:return SetDates();" />
        </form>                       
    <!--  End Code Date Picker -->
    <div id="requireDate" style="display:none;">
        <span class="error"><asp:Localize ID="lblDateErrorMsg" runat="server" meta:resourceKey="lblDateErrorMsg" />
        </span>
    </div>
    <br />
    <div style="text-align:left; width:810px">
         <table id="TableCount">
         <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:300px" >
                <span style=" font-weight:bold;">
                <asp:Localize ID="lblDateRange" runat="server" meta:resourceKey="lblDateRange" />
                <%= Html.Encode(Model.DateRange)%>
                </span>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <span style=" font-weight:bold;">
                <asp:Localize ID="lblCompleteAttendanceRecord" runat="server" meta:resourceKey="lblCompleteAttendanceRecord" />
                </span>
                </td>
            </tr>
            <tr align="center" valign="middle">
                <td align="left" valign="middle" >
                <asp:Localize ID="lblTotalScheduledHours" runat="server" meta:resourceKey="lblTotalScheduledHours" />
                 <%= Model.TotalScheduledHours.ToString("0.00") %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="Localize5" runat="server" meta:resourceKey="lblTotalScheduledHours" />
                 <%= Model.TotalScheduledComplete.ToString("0.00") %>
                </td>
            </tr>
            <tr align="center" valign="middle" >
                <td align="left" valign="middle">
                <asp:Localize ID="lblTotalAttendedHours" runat="server" meta:resourceKey="lblTotalAttendedHours" />
                 <%= Model.TotalCompletedHours.ToString("0.00") %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="Localize6" runat="server" meta:resourceKey="lblTotalAttendedHours" />
                 <%= Model.TotalScheduledAttended.ToString("0.00") %>
                </td>
            </tr>
            <tr align="center" valign="middle" >
                <td align="left" valign="middle">
                <asp:Localize ID="lblAttendedPercentage" runat="server" meta:resourceKey="lblAttendedPercentage" />
                 <%
                     double attendedPercentage = 0.00;
                     if (Model.TotalScheduledHours > 0)
                     {
                         attendedPercentage = (Model.TotalCompletedHours / Model.TotalScheduledHours) * 100;
                     
                        if (attendedPercentage >= 0)
                            Response.Write(attendedPercentage.ToString("0.00") + "%");
                     }
                     else                     
                     {
                        Response.Write("0.00%"); 
                     }
                  %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="lblAttendedPercentages" runat="server" meta:resourceKey="lblAttendedPercentage" />
                 <%  
                     attendedPercentage = 0.00;

                     if (Model.TotalScheduledComplete > 0)
                     {
                         attendedPercentage = (Model.TotalScheduledAttended / Model.TotalScheduledComplete) * 100;
    
                         if (attendedPercentage >= 0)
                            Response.Write(attendedPercentage.ToString("0.00") + "%");
                     }
                     else
                     {
                        Response.Write("0.00%");
                     }
                  %>
                </td>
            </tr>
        </table>
    <br />    
    </div>

        <table id="AttendenceReview">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:200px">
                    <span class="Heading4"> <asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /> </span>
                </td>
                <td align="left" valign="middle" style="width:210px">
                    <span class="Heading4"> <asp:Localize ID="lblClassDate" runat="server" meta:resourceKey="lblClassDate" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="lblStart" /></span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"><asp:Localize ID="lblStart" runat="server" meta:resourceKey="lblEnd" /></span>
                </td>
                 <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"><asp:Localize ID="lblScheduledHours" runat="server" meta:resourceKey="lblScheduledHours" />  </span>
                </td>
                <td align="right" valign="middle" style="width:50px">
                    <span class="Heading4"><asp:Localize ID="lblCode" runat="server" meta:resourceKey="lblCode" />  </span>
                </td>
                 <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"><asp:Localize ID="lblAttendedHours" runat="server" meta:resourceKey="lblAttendedHours" />  </span>
                </td>
            </tr>
            <% foreach (var item in Model.AttendanceEntries)
               { %>
               <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle">
                    <span > <%= Html.Encode(item.Course)%> </span>
                </td>
                <td align="left" valign="middle">
                    <span > <% if (item.ClassDate != null)
                               {
                                   DateTime date = Convert.ToDateTime(item.ClassDate);
                                   Response.Write(date.ToString("MM/dd/yyyy") + " &nbsp;" + date.DayOfWeek.ToString().Remove(3));
                               }
                    %>  </span>
                </td>
                <td align="right" valign="middle">
                    <span ><% if (item.ClassStartTime != null)
                              {
                                  DateTime StartTime = Convert.ToDateTime(item.ClassStartTime);
                                  Response.Write("&nbsp;" + StartTime.ToString("hh:mm") + " " + StartTime.ToString().Substring(StartTime.ToString().Length - 2));
                              }
                    %></span>
                </td>
                 <td align="right" valign="middle">
                    <span ><% if (item.ClassEndTime != null)
                              {
                                  DateTime EndTime = Convert.ToDateTime(item.ClassEndTime);
                                  Response.Write("&nbsp;" + EndTime.ToString("hh:mm") + " " + EndTime.ToString().Substring(EndTime.ToString().Length - 2));
                              }
                    %></span>
                </td>
                 <td align="right" valign="middle">
                    <span > <% double ClassHours=Convert.ToDouble(item.ClassHours);
                               Response.Write(ClassHours.ToString("0.00"));%> </span>
                </td>
                 <td align="right" valign="middle">
                    <span > <%= Html.Encode(item.AttendanceCode)%> </span>
                </td>
                 <td align="right" valign="middle">
                    <span > <%  double AttendedAdj=Convert.ToDouble(item.AttendedAdj);
                                Response.Write(AttendedAdj.ToString("0.00"));%> </span>
                </td>
            </tr>
            <%} %>
         </table>
         <br />
         <div style="text-align:left; width:810px">
         <table id="Table1">
         <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:300px" >
                <span style=" font-weight:bold;">
                <asp:Localize ID="Localize2" runat="server" meta:resourceKey="lblDateRange" />
                <%= Html.Encode(Model.DateRange)%>
                </span>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <span style=" font-weight:bold;">
                <asp:Localize ID="Localize3" runat="server" meta:resourceKey="lblCompleteAttendanceRecord" />
                </span>
                </td>
            </tr>
            <tr align="center" valign="middle">
                <td align="left" valign="middle" >
                <asp:Localize ID="Localize4" runat="server" meta:resourceKey="lblTotalScheduledHours" />
                 <%= Model.TotalScheduledHours.ToString("0.00") %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="Localize7" runat="server" meta:resourceKey="lblTotalScheduledHours" />
                 <%= Model.TotalScheduledComplete.ToString("0.00") %>
                </td>
            </tr>
            <tr align="center" valign="middle" >
                <td align="left" valign="middle">
                <asp:Localize ID="Localize8" runat="server" meta:resourceKey="lblTotalAttendedHours" />
                 <%= Model.TotalCompletedHours.ToString("0.00") %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="Localize9" runat="server" meta:resourceKey="lblTotalAttendedHours" />
                 <%= Model.TotalScheduledAttended.ToString("0.00") %>
                </td>
            </tr>
            <tr align="center" valign="middle" >
                <td align="left" valign="middle">
                <asp:Localize ID="Localize10" runat="server" meta:resourceKey="lblAttendedPercentage" />
                  <%
                     attendedPercentage = 0.00;
                     if (Model.TotalScheduledHours > 0)
                     {
                         attendedPercentage = (Model.TotalCompletedHours / Model.TotalScheduledHours) * 100;
                     
                        if (attendedPercentage >= 0)
                            Response.Write(attendedPercentage.ToString("0.00") + "%");
                     }
                     else                     
                     {
                        Response.Write("0.00%"); 
                     }
                  %>
                </td>
                <td align="left" valign="middle" style="width:50px" >
                </td>
                <td align="left" valign="middle" style="width:300px" >
                <asp:Localize ID="Localize11" runat="server" meta:resourceKey="lblAttendedPercentage" />
                 <%  
                     attendedPercentage = 0.00;

                     if (Model.TotalScheduledComplete > 0)
                     {
                         attendedPercentage = (Model.TotalScheduledAttended / Model.TotalScheduledComplete) * 100;
    
                         if (attendedPercentage >= 0)
                            Response.Write(attendedPercentage.ToString("0.00") + "%");
                     }
                     else
                     {
                        Response.Write("0.00%");
                     }
                  %>
                </td>
            </tr>
            <tr align="left" valign="middle">
                <td colspan="3">
                    <br />
                    <br />
                    <asp:Localize ID="lbNoteMsg" runat="server" meta:resourceKey="lbNoteMsg" />
                </td>
            </tr>
        </table>
    </div>
</center>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
    </div>

</asp:Content>
