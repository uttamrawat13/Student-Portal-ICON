<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.FinancialAid.FinancialAidList>"   Culture="auto" UICulture="auto" %>
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
     <!-- Financial Aid Awards Table Body -->
     <table class="width100">
        <tr class="width500px" align="left">
            <td class="width500px" align="left">
            <%
                double totalAwards = 0.00;
                foreach (var academicYear in Model.AidDetails)
                {
                    totalAwards = 0.00;
                    %>
                    <b><asp:Localize ID="lblStudentAcademicYear" runat="server" meta:resourceKey="lblStudentAcademicYear" /></b>
                    &nbsp;&nbsp;
                    <%= Html.Encode(academicYear.Key)%>
                    <hr />
                    <table class="width100">
                    <tr class="width500px" align="left">
                        <td class="width350px" align="left">
                           <b> <asp:Localize ID="lblAward" runat="server" meta:resourceKey="lblAward" /> </b>
                        </td>
                        <td class="width150px" align="right">
                            <b><asp:Localize ID="lblAmount" runat="server" meta:resourceKey="lblAmount" /></b>
                        </td>
                    </tr>
                    
                    <%
                    foreach (var item in academicYear.Value)
                    {
                        totalAwards += item.Amount;
                        %>
                        <tr class="width500px" align="left">
                            <td class="width350px" align="left">
                               <%= Html.Encode(item.AidTitle) %>
                            </td>
                            <td class="width150px" align="right">
                                <%= Html.Encode(String.Format("{0:C}", item.Amount)) %>
                            </td>
                        </tr>
                        <%
                    } 
                    %>
                    </table>
                    <hr />
                    <table class="width100">
                    <tr class="width500px" align="left">
                        <td class="width350px" align="left">
                           <asp:Localize ID="lblTotalAwards" runat="server" meta:resourceKey="lblTotalAwards" /> 
                        </td>
                        <td class="width150px" align="right">
                            <%= Html.Encode(String.Format("{0:C}", totalAwards))%>
                            
                        </td>
                    </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <%              
                } %>
            
         </td>
         <td class="width310px" align="left"></td>
        </tr>
        <tr align="left">
            <td colspan="2" align="left">
            <br />
            <br />
            <br />
                <asp:Localize ID="lblDetailTxt" runat="server" meta:resourceKey="lblDetailTxt" /> 
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
