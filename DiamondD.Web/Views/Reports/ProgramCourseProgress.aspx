<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.ProgramCourseStatus.StudentProgramCourseProgress>"   Culture="auto" UICulture="auto" %>
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
    <span class="Heading3"> <%= Html.Encode(Model.StudentName) %> </span>
    <br /> 
    <br />
     <!-- Program Course Progress Table Body -->
     <table class="width100">
        <tr class="width810px">
            <td class="width130px">&nbsp;</td>
            <td class="width550px">
     <table id="ProgramCourseProgressTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width150px">
                    <span class="Heading4"> <asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /> </span>
                </td>
                <td align="left" valign="middle" class="width300px">
                    <span class="Heading4"> <asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"> <asp:Localize ID="lblUnits" runat="server" meta:resourceKey="lblUnits" /> </span>
                </td>
            </tr>
            <tr class="width100">
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
            <tr align="center" valign="middle" class="width100">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4Italic"> <asp:Localize ID="lblCompleted" runat="server" meta:resourceKey="lblCompleted" /> </span>
                    <br />
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" class="width100">
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
             <tr class="width100">
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
            <tr align="center" valign="middle" class="width100">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4Italic"> <asp:Localize ID="lblCompletedTransfer" runat="server" meta:resourceKey="lblCompletedTransfer" /> </span>
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" class="width100">
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
             <tr class="width100">
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
            <tr align="center" valign="middle" class="width100">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4Italic"> <asp:Localize ID="lblInProgress" runat="server" meta:resourceKey="lblInProgress" /> </span>
                    <br />
                </td>
            </tr>
            
                    <%} %>
             <tr align="center" valign="middle" class="width100">
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
             <tr class="width100">
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
            <tr align="center" valign="middle" class="width100">
                <td align="left" valign="middle" colspan="3">
                    <span class="Heading4Italic"> <asp:Localize ID="lblRequired" runat="server" meta:resourceKey="lblRequired" /> </span>
                    <br />
                </td>
            </tr>
            
                        <%} %>
             <tr align="center" valign="middle" class="width100">
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
        <td class="width265px">&nbsp;</td>
        </tr>
     </table>
            </div>
        <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
</div>
</asp:Content>
