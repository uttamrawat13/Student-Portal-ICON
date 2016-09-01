<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.Payment.PaymentSchedule>" Culture="auto" UICulture="auto"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitlePaymentSchedule" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="MainDivofPaymentSchedule" style="width:1000px; text-align:center">
<div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
   <h1><asp:Localize ID="lblPaymentSchedule" runat="server" meta:resourceKey="lblPaymentSchedule" /></h1>
   <br />
        <span class="Heading3"><%= Html.Encode(Model.StudentName) %></span>
        <br /><br />
        <table id="PaymentScheduleTable">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:200px">
                    <span class="Heading4"><asp:Localize ID="lblAwards" runat="server" meta:resourceKey="lblSchedule" />  </span>
                </td>
                <td align="left" valign="middle" style="width:330px">
                     <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" />  </span>
                </td>
                <td align="right" valign="middle" style="width:80px">
                    <span class="Heading4"><asp:Localize ID="lblAmount" runat="server" meta:resourceKey="lblAmount" />  </span>
                </td>
                 <td align="right" valign="middle" style="width:200px">
                     <span class="Heading4"><asp:Localize ID="lblDatePaid" runat="server" meta:resourceKey="lblDatePaid" />  </span>
                </td>
            </tr>
            <% foreach (var items in Model.Payments)
               { %>
            <tr align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:200px">
                    <span> <% DateTime dateScheduled = Convert.ToDateTime(items.Scheduled);
                              Response.Write(dateScheduled.ToString("MM/dd/yyyy"));%> </span>
                </td>
                <td align="left" valign="middle" style="width:330px">
                     <span> <%= Html.Encode(items.Description)
                   %> </span>
                </td>
                <td align="right" valign="middle" style="width:80px">
                    <span> <%= Html.Encode(string.Format("{0:c}", items.Amount))%> </span>
                </td>
                <td align="right" valign="middle" style="width:200px">
                     <span><% if (items.DepositDate != null)
                              {
                                  DateTime dateUnPaid = Convert.ToDateTime(items.DepositDate);
                                  Response.Write(dateUnPaid.ToString("MM/dd/yyyy"));
                              }
                                  %> </span>
                </td>
            </tr>   
            <%} %>
            </table>
            <br />
            <br />
            <hr />
            <table id="Table1" style=" text-align:left">
            <tr align="left" valign="middle" style="width:1000px">
                <td align="left" valign="middle" style="width:1000px">
                    <asp:Localize ID="lblTotal" runat="server" meta:resourceKey="lblTotal" />
                    &nbsp;&nbsp;&nbsp;
                    <%= Html.Encode(string.Format("{0:c}", Model.PaymentScheduleTotal))%> 
                </td>
            </tr>   
        </table>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
</div>
</div>
</asp:Content>
