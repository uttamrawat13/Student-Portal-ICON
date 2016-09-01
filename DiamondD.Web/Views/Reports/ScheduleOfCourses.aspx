<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.ScheduleOfCourses.StudentScheduleOfCourses>"  Culture="auto" UICulture="auto" %>
<%@ MasterType  virtualPath="~/Views/Shared/General.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Master.ReportName %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="div-table">
    <div  class="DivRowwidth1000">
        <div class="DivWidth95pxRight">
            &nbsp;
        </div>
        <div class="DivWidth810Center">
        <h1><%=Master.ReportName %></h1>
        <br />
        <span class="Heading3"> <%=Model.StudentName%></span>
        <br /> 
        <br />
        
        <!---------------   Term Date Area  ---------->
         <%             
                 using (Html.BeginForm(/*"ScheduleOfCoursesByTerm", "Reports"*/))
                 {%>
                <asp:Localize ID="lblTermDate" runat="server" meta:resourceKey="lblTermDate" />:
                &nbsp;
                <%
                     if (ViewData["TermsDateList"] == null)
                     {%>
                       <select>
                        <option>No data found.</option>
                       </select>  
                     <%}
                     else
                     {%>
                         <%=Html.DropDownList("listTermDate", (SelectList) ViewData["TermsDateList"],
                                           new {style = "width: 150px;"})%>
                    <% }%>
                <input id="btnShow" type="submit" value="Show" meta:resourceKey="btnShow" />
                <%
                 }%>
    <br />
    <!-- Attendence Summary Table Body -->
    <table id="AttendanceSummary">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width120px">
                    <span class="Heading4"> <asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /> </span>
                </td>
                <td align="left" valign="middle" class="width265px">
                    <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" /></span>
                </td>
                <td align="left" valign="middle" class="width165px">
                    <span class="Heading4"><asp:Localize ID="lblClassDates" runat="server" meta:resourceKey="lblClassDates" /></span>
                </td>
                 <td align="left" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblRoom" runat="server" meta:resourceKey="lblRoom" />  </span>
                </td>
                <td align="left" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblInstructor" runat="server" meta:resourceKey="lblInstructor" />  </span>
                </td>
                 <td align="right" valign="middle" class="width60px">
                    <span class="Heading4"><asp:Localize ID="lblUnits" runat="server" meta:resourceKey="lblUnits" />  </span>
                </td>
            </tr>

            <% 
                foreach (var item in Model.ScheduleOfCourses )
                    {
                           %>
            <tr>
                <td align="left" valign="middle">
                    <%= Html.Encode(item.Course) %>
                </td>
                <td align="left" valign="middle">
                    <%= Html.Encode(item.CourseDescription) %>
                </td>
                <td align="left" valign="middle">
                    <%
                        //Response.Write(item.FirstClassDate + " - " + item.LastClassDate); 
                        string firstDate = string.Format("{0:MM/dd/yyyy}", item.FirstClassDate);
                        string lastDate = string.Format("{0:MM/dd/yyyy}", item.LastClassDate);
                            
                        Response.Write(firstDate + " - " + lastDate); %>
                </td>
                 <td align="left" valign="middle">
                    <%= Html.Encode(item.Room) %>
                </td>
                <td align="left" valign="middle">
                    <%= Html.Encode(item.Instructor) %>
                </td>
                 <td align="right" valign="middle">
                    <%
                        if(item.Units != null)
                        {
                        double units = Convert.ToDouble(item.Units);
                        Response.Write(units.ToString("0.00"));
                        }
                    %>
                </td>
            </tr>
                           <%
                    } %>
            <tr>
                <td colspan="6">
                <br />
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="4">
                &nbsp;
                </td>
                 <td align="right" valign="middle">
                   <span class="italic"> <asp:Localize ID="Localize1" runat="server" meta:resourceKey="lblTotalUnits" /> : </span>
                </td>
                 <td align="right" valign="middle">
                 <span class="italic">
                    <%
                        Response.Write(Model.PaymentScheduleTotal.ToString("0.00"));
                    %>
                    </span>
                </td>
            </tr>
             <tr>
                <td align="left" colspan="6">
                <br />
                   <span class="italic">  <asp:Localize ID="lblReviewMsg" runat="server" meta:resourceKey="lblReviewMsg" /></span>
                </td>
            </tr>
         </table>
        </div>
            <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
    </div>

</asp:Content>
