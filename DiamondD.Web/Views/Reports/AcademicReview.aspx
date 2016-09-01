<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.StudentTranscript.Transcript>" Culture="auto" UICulture="auto" %>

<%@ MasterType  virtualPath="~/Views/Shared/General.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	
     
    <%= Master.ReportName %>
                    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    double? unitsAttempted = 0.0;
    double? unitsCompleted = 0.0;
    double? unitsInProgress = 0.0;
    double? gpa = 0.0;

    Model.GetCummulativeTotals(out unitsAttempted, out unitsCompleted, out unitsInProgress, out gpa);
 %>
 <div class="div-table">
    <div  class="DivRowwidth1000">
        <div class="DivWidth95pxRight">
            &nbsp;
        </div>
        <div class="DivWidth810Center">
    <h1><%=Master.ReportName %></h1>
    <br />
    <span class="Heading3"><%= Html.Encode(Model.StudentName) %></span>
    <br /><br />
       <table id="TranscriptTable" class="TranscriptTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width150px">
                    <span class="Heading4"><asp:Localize ID="lblTerm" runat="server" meta:resourceKey="lblTerm" />  </span>
                </td>
                <td align="left" valign="middle" class="width150px">
                     <span class="Heading4"><asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" />  </span>
                </td>
                <td align="left" valign="middle" class="width210px">
                    <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" />  </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblGrade" runat="server" meta:resourceKey="lblGrade" />  </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                   <span class="Heading4"> <asp:Localize ID="lblUnitsAttempted" runat="server" meta:resourceKey="lblUnitsAttempted" />  </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4">
                    <asp:Localize ID="lblUnitsCompleted" runat="server" meta:resourceKey="lblUnitsCompleted" />  </span>
                </td>
            </tr>
            <% 
                foreach (var term in Model.Terms) 
                {
                    foreach (var course in term.Courses)
                    {

                    %>
               <tr align="left" valign="middle">
                <td align="left" valign="middle">
                    <span> <%= Html.Encode(term.Description)%> </span>
                </td>
                <td align="left" valign="middle">
                     <span> <%= Html.Encode(course.Code)%> </span>
                </td>
                <td align="left" valign="middle">
                    <span> <%= Html.Encode(course.Description)%> </span>
                </td>
                <td align="right" valign="middle">
                    <span> <%= Html.Encode(course.Grade)%> </span>
                </td>
                <td align="right" valign="middle">
                    <span> <%= Html.Encode(course.UnitsAttempted)%> </span>
                </td>
                <td align="right" valign="middle">
                    <span> <%= Html.Encode(course.UnitsCompleted)%> </span>
                </td>
            </tr>
            <%
                    }
                }
                
                %>
            
       </table>
       <hr />
        <table>
        <tr align="left" valign="middle" >
                <td align="left" valign="middle" class="width150px">
                </td>
                <td align="left" valign="middle" class="width150px">
                </td>
                <td align="left" valign="middle" class="width210px">
                </td>
                <td align="center" valign="middle" class="width100px">
                </td>
                <td align="right" valign="middle" class="width100px">
                <span class="LastTableRow"><%= unitsAttempted %></span>
                </td>
                <td align="right" valign="middle" class="width100px">
                <span class="LastTableRow"><%= unitsCompleted %></span>
                </td>
            </tr>
            <tr align="left" valign="middle">
                <td align="left" valign="middle">
                </td>
                <td align="left" valign="middle">
                </td>
                <td align="center" valign="middle">
                </td>
                <td align="center" valign="middle">
                </td>
                <td align="right" valign="middle">
                <br />
                <span class="LastTableRow">GPA:</span>
                </td>
                <td align="right" valign="middle" class="width100px">
                <br />
                <span class="LastTableRow">
                <%
                    if (gpa.HasValue && !double.IsNaN(gpa.Value))
                        Response.Write(string.Format("{0:0.00}", gpa));
                    else
                        Response.Write("-");
                %>
                </span>
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
