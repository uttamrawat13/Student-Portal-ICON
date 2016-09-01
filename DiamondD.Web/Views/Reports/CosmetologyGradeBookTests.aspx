<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookTest>"  Culture="auto" UICulture="auto" %>
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
     <!-- Cosmetology Grade Book Tests Table Body -->
       <table class="width100">
        <tr class="width810px">
            <td class="width205px">&nbsp;</td>
            <td class="width400px">
     <table id="CosmetologyGradeBookTestsTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width300px">
                    <span class="Heading4"> <asp:Localize ID="lblTestDescription" runat="server" meta:resourceKey="lblTestDescription" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"> <asp:Localize ID="lblAverageGrade" runat="server" meta:resourceKey="lblAverageGrade" /> </span>
                </td>
            </tr>
             <% foreach (var item in Model.CosmetologyGradeBookTests)
                { %>
               <tr align="center" valign="middle" class="width100">
                 <td align="left" valign="middle">
                    <span > <%= Html.Encode(item.Description)%> </span>
                </td>
                <td align="right" valign="middle">
                    <span ><% double completedPoints = 0.0; 
                              if(double.TryParse(item.CompletedPoints.ToString(),out completedPoints))
                              {
                                  Response.Write(completedPoints.ToString("0.00"));
                              } 
                           %></span>
                </td>
                </tr>
                <%} %>
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
