<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.Attendance.StudentAttendanceSummary>" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgAttendanceSummary" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
    <h1><asp:Localize ID="lblHeading" runat="server" meta:resourceKey="lblHeading" /></h1>
    <br />
    <span class="Heading3"> <%= Html.Encode(Model.StudentName) %> </span>
    <br /> 
    <br />
    <!-- Attendence Summary Table Body -->
    <table id="AttendanceSummary">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:150px">
                    <span class="Heading4"> <asp:Localize ID="lblTerm" runat="server" meta:resourceKey="lblTerm" /> </span>
                </td>
                <td align="left" valign="middle" style="width:150px">
                    <span class="Heading4"> <asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /> </span>
                </td>
                <td align="left" valign="middle" style="width:250px">
                    <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" /></span>
                </td>
                <td align="right" valign="middle" style="width:90px">
                    <span class="Heading4"><asp:Localize ID="lblScheduleTotal" runat="server" meta:resourceKey="lblScheduleTotal" /></span>
                </td>
                 <td align="right" valign="middle" style="width:90px">
                    <span class="Heading4"><asp:Localize ID="lblScheduleToDate" runat="server" meta:resourceKey="lblScheduleToDate" />  </span>
                </td>
                <td align="right" valign="middle" style="width:90px">
                    <span class="Heading4"><asp:Localize ID="lblAttendedToDate" runat="server" meta:resourceKey="lblAttendedToDate" />  </span>
                </td>
                 <td align="right" valign="middle" style="width:90px">
                    <span class="Heading4"><asp:Localize ID="lblAttendedPercentage" runat="server" meta:resourceKey="lblAttendedPercentage" />  </span>
                </td>
            </tr>
            <% foreach (var item in Model.AttendanceSummaries)
               { %>
               <tr align="center" valign="middle" style="width:100%">
                 <td align="left" valign="middle">
                    <span > <%if (item.TermBeginDate != null)
                               {
                                   DateTime date = Convert.ToDateTime(item.TermBeginDate);
                                   Response.Write(date.ToString("MM/dd/yyyy"));
                               }%> </span>
                </td>
                <td align="left" valign="middle">
                    <span ><%= Html.Encode(item.Course)%></span>
                </td>
                 <td align="left" valign="middle">
                    <span ><%= Html.Encode(item.CourseDescription)%></span>
                </td>
                 <td align="right" valign="middle">
                    <span > <%= Html.Encode(item.ScheduledTotal.ToString())%> </span>
                </td>
                 <td align="right" valign="middle">
                    <span > <%= Html.Encode(item.ScheduledToDate.ToString())%> </span>
                </td>
                 <td align="right" valign="middle">
                    <span > <%  double attendedToDate = Convert.ToDouble(item.AttendedToDate);
                                Response.Write(attendedToDate.ToString("0.00"));
                             %> </span>
                </td>
                
                <td align="right" valign="middle">
                    <span > <% double attendedPercentage = 0.00;
                                attendedPercentage = Convert.ToDouble(item.AttendedPercentage);
                                Response.Write(attendedPercentage.ToString("0.00") + "%");
                                %>  </span>
                </td>
            </tr>
            <%} %>
            <tr align="center" valign="middle" style="width:100%">
                <td colspan="7">
                    <hr />
                </td>
            </tr>
            <tr align="right" valign="middle" style="width:100%; font-style:italic; font-size:medium">
                <td colspan="4" align="right">
                    <%= Html.Encode(Model.CalculateTotalScheduled.ToString()) %>
                </td>
                <td align="right">
                    <%= Html.Encode(Model.CalculateTotalScheduledToDate.ToString()) %>
                </td>
                <td align="right">
                    <% 
                        double CalculateTotalattendentToDate = Model.CalculateTotalattendentToDate;
                        Response.Write(CalculateTotalattendentToDate.ToString("0.00"));
                    %>
                </td>
                <td align="right">
                    <% double totalAttendedPercentage = 0.0;
                         totalAttendedPercentage  = (Model.CalculateTotalattendentToDate * 100) / Model.CalculateTotalScheduledToDate;
                       Response.Write(totalAttendedPercentage.ToString("0.00")+"%");
                    %>
                </td>
            </tr>
         </table>

            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
    </div>

</asp:Content>
