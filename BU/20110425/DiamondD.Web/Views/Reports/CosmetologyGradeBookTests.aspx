<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookTest>"  Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgCosmetologyGradeBookTests" />
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
     <!-- Cosmetology Grade Book Tests Table Body -->
       <table style="width:100%">
        <tr style="width:810px;">
            <td style="width:205px;">&nbsp;</td>
            <td style="width:400px;">
     <table id="CosmetologyGradeBookTestsTable">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:300px">
                    <span class="Heading4"> <asp:Localize ID="lblTestDescription" runat="server" meta:resourceKey="lblTestDescription" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"> <asp:Localize ID="lblAverageGrade" runat="server" meta:resourceKey="lblAverageGrade" /> </span>
                </td>
            </tr>
             <% foreach (var item in Model.cosmetologyGradeBookTests)
                { %>
               <tr align="center" valign="middle" style="width:100%">
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
