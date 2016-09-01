<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.ProgramCourseStatus.StudentProgramCourseProgress>"   Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgProgramCourseProgress" />
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
     <!-- Program Course Progress Table Body -->
     <table style="width:100%">
        <tr style="width:810px;">
            <td style="width:130px;">&nbsp;</td>
            <td style="width:550px;">
     <table id="ProgramCourseProgressTable">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:150px">
                    <span class="Heading4"> <asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /> </span>
                </td>
                <td align="left" valign="middle" style="width:300px">
                    <span class="Heading4"> <asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"> <asp:Localize ID="lblUnits" runat="server" meta:resourceKey="lblUnits" /> </span>
                </td>
            </tr>
            <tr style="width:100%">
                <td colspan="3">
                <br />
                </td>
            </tr>
             <% 
                 bool flag = false;
                 foreach (var item in Model.programCoursePrograss)
                {
                    if (item.ReportGroup == "Completed")
                    {
                        if (!flag)
                        {
                            flag = true; %>
            <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4" style=" font-style:italic;"> <asp:Localize ID="lblCompleted" runat="server" meta:resourceKey="lblCompleted" /> </span>
                    <br />
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" style="width:100%">
                 <td align="left" valign="middle">
                 <%= Html.Encode(item.CourseCode) %>
                </td>
                <td align="left" valign="middle">
                <%= Html.Encode(item.CourseDescription) %>
                </td>
                <td align="right" valign="middle">
                <% double units = 0.0;
                   if (double.TryParse(item.Units.ToString(), out units))
                                   {
                                       Response.Write(units.ToString("0.00"));
                                   }  %>
                </td>
            </tr>
                <%}
             } %>
             <tr style="width:100%">
                <td colspan="3">
                <br />
                </td>
            </tr>
              <% 
                  flag = false;
                  foreach (var item in Model.programCoursePrograss)
                {
                    if (item.ReportGroup == "Completed (Transfer)")
                    {
                        if (!flag)
                        {
                            flag = true; %>
            <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4" style=" font-style:italic;"> <asp:Localize ID="lblCompletedTransfer" runat="server" meta:resourceKey="lblCompletedTransfer" /> </span>
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" style="width:100%">
                 <td align="left" valign="middle">
                 <%= Html.Encode(item.CourseCode) %>
                </td>
                <td align="left" valign="middle">
                <%= Html.Encode(item.CourseDescription) %>
                </td>
                <td align="right" valign="middle">
                <% double units = 0.0;
                   if (double.TryParse(item.Units.ToString(), out units))
                                   {
                                       Response.Write(units.ToString("0.00"));
                                   }  %>
                </td>
            </tr>
                <%}
             } %>
             <tr style="width:100%">
                <td colspan="3">
                <br />
                </td>
            </tr>
              <% 
                  flag = false;
                  foreach (var item in Model.programCoursePrograss)
                {
                    if (item.ReportGroup == "In Progress")
                    {
                        if (!flag)
                        {
                            flag = true; 
                        %>
            <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4" style=" font-style:italic;"> <asp:Localize ID="lblInProgress" runat="server" meta:resourceKey="lblInProgress" /> </span>
                    <br />
                </td>
            </tr>
            
                    <%} %>
             <tr align="center" valign="middle" style="width:100%">
                 <td align="left" valign="middle">
                 <%= Html.Encode(item.CourseCode) %>
                </td>
                <td align="left" valign="middle">
                <%= Html.Encode(item.CourseDescription) %>
                </td>
                <td align="right" valign="middle">
                <% double units = 0.0;
                   if (double.TryParse(item.Units.ToString(), out units))
                                   {
                                       Response.Write(units.ToString("0.00"));
                                   }  %>
                </td>
            </tr>
           
                    
                <%}
             } %>
             <tr style="width:100%">
                <td colspan="3">
                <br />
                </td>
            </tr>
              <% 
                  flag = false;
                  foreach (var item in Model.programCoursePrograss)
                {
                    if (item.ReportGroup == "Required")
                    {
                        if (!flag)
                        {
                            flag = true; 
                        %>
            <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4" style=" font-style:italic;"> <asp:Localize ID="lblRequired" runat="server" meta:resourceKey="lblRequired" /> </span>
                    <br />
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" style="width:100%">
                 <td align="left" valign="middle">
                 <%= Html.Encode(item.CourseCode) %>
                </td>
                <td align="left" valign="middle">
                <%= Html.Encode(item.CourseDescription) %>
                </td>
                <td align="right" valign="middle">
                <% double units = 0.0;
                   if (double.TryParse(item.Units.ToString(), out units))
                                   {
                                       Response.Write(units.ToString("0.00"));
                                   }  %>
                </td>
            </tr>
           
                    
                <%}
             } %>
        </table>
         </td>
        <td style="width:265px;">&nbsp;</td>
        </tr>
     </table>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
</div>
</asp:Content>
