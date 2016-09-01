<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.Ledger.StudentLedger>" Culture="auto" UICulture="auto" %>
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
    <!-- Student Ledger Table Body -->
    <table id="StudentLedger">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width200px">
                    <span class="Heading4"> <asp:Localize ID="lblTerm" runat="server" meta:resourceKey="lblTransDate" /> </span>
                </td>
                <td align="left" valign="middle" class="width350px">
                    <span class="Heading4"> <asp:Localize ID="lblTransaction" runat="server" meta:resourceKey="lblTransaction" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblDebit" runat="server" meta:resourceKey="lblDebit" /></span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblCredit" runat="server" meta:resourceKey="lblCredit" /></span>
                </td>
            </tr>
            <% foreach (var item in Model.ledgerList)
               { %>
               <tr align="center" valign="middle" class="width100">
                 <td align="left" valign="middle">
                    <span > <%if (item.TransDate != null)
                               {
                                   DateTime date = Convert.ToDateTime(item.TransDate);
                                   Response.Write(date.ToString("MM/dd/yyyy"));
                               }%> </span>
                </td>
                <td align="left" valign="middle">
                    <span ><%= Html.Encode(item.Transaction)%></span>
                </td>
                 <td align="right" valign="middle">
                    <span ><% Response.Write(string.Format("{0:c}", item.Debit));
                               %></span>
                </td>
                 <td align="right" valign="middle">
                    <span ><% Response.Write(string.Format("{0:c}", item.Credit));%></span>
                </td>
                
            </tr>
            <%} %>
            <tr align="center" valign="middle" class="width100">
                <td colspan="4">
                    <hr />
                </td>
            </tr>
            <tr align="right" valign="middle" class="width100Italic">
                <td align="left">
                <asp:Localize ID="lblBalance" runat="server" meta:resourceKey="lblBalance" />
                    <% double balance = Model.TotalDebit - Model.TotalCredit;
                       Response.Write(string.Format("{0:c}", balance)); %>
                </td>
                <td align="right">
                   <asp:Localize ID="lblTotal" runat="server" meta:resourceKey="lblTotal" />
                </td>
                <td align="right">
                    <%= Html.Encode(string.Format("{0:c}", Model.TotalDebit))%>
                </td>
                <td align="right">
                    <%= Html.Encode(string.Format("{0:c}", Model.TotalCredit))%>
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
