<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.Payment.PaymentSchedule>" Culture="auto" UICulture="auto"%>
<%@ MasterType  virtualPath="~/Views/Shared/General.Master"%>

<%@ Import Namespace="DiamondD.Services.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Master.ReportName %>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <script src='<%=ResolveUrl("../../Scripts/query-1.9.1.js") %>' type="text/javascript"></script>
  

    <div id="MainDivofPaymentSchedule" class="DivWidth1000pxCenterMiddle">  
       <form id="form1"   method="post">
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
        <table id="PaymentScheduleTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width200px">
                    <span class="Heading4"><asp:Localize ID="lblAwards" runat="server" meta:resourceKey="lblSchedule" />  </span>
                </td>
                <td align="left" valign="middle" class="width330px">
                     <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" />  </span>
                </td>
                
                <td align="right" valign="middle" class="width80px">
                    <span class="Heading4"><asp:Localize ID="lblAmount" runat="server" meta:resourceKey="lblAmount" />  </span>
                </td>
                 <td align="right" valign="middle" class="width200px">
                     <span class="Heading4"><asp:Localize ID="lblDatePaid" runat="server" meta:resourceKey="lblDatePaid" />  </span>
                </td>
                 <td align="right" valign="middle" class="width200px">
                     <span class="Heading4"> Deposit Status  </span>
                </td>
            </tr>
            <% foreach (var items in Model.Payments)
               { %>
            <tr align="center" valign="middle" class="width100">
                <td align="left" valign="middle" class="width200px">
                    <span> <% DateTime dateScheduled = Convert.ToDateTime(items.Scheduled);
                              Response.Write(dateScheduled.ToString("MM/dd/yyyy"));%> </span>
                </td>
                <td align="left" valign="middle" class="width330px">
                     <span> <%= Html.Encode(items.Description)
                   %> </span>
                </td>
                <td align="right" valign="middle" class="itemCadaPreco"  >
                     <%= Html.Encode(string.Format("{0:c}", items.Amount))%>
                    
                </td>
                <td align="center" valign="middle" class="width200px">
                     <span><% if (items.DepositDate != null)
                              {
                                  DateTime dateUnPaid = Convert.ToDateTime(items.DepositDate);
                                  Response.Write(dateUnPaid.ToString("MM/dd/yyyy"));
                              }
                              

                                  %> 
                         <% else { %>
                        
                                

                              
   
                         <% } %>
                     </span>
                </td>


                  <td align="right" valign="middle" class="width200px">
                     <span><% if (items.ARPaymentStatus == "Deposit" || items.ARPaymentStatus == "Paid")
                              {
                                  
                                  Response.Write("Paid");
                              }
                              

                                  %> 



                         <% if (items.ARPaymentStatus == "Ready")
                              {
                                  
                                  Response.Write("Pending");
                              }
                              

                                  %> 





                         <% if (items.ARPaymentStatus == "Unpaid")
                            { %>
                        
                                

                             <%--  <a href="http://dd10.diamondd.biz/DSIS/PaymentPortal/default.aspx?Campus=ABTU&MiscID=0&PaymentID=<%= items.AwardDisbursementNo %>">Make Payment</a>--%>
                           <a href="http://10.10.10.10/DSIS/PaymentPortal/default.aspx?Campus=MICRO&MiscID=0&PaymentID=<%= items.AwardDisbursementNo %>"><img src="../../Content/Images/pay_now.gif" alt="Pay Now" /></a>
   
                         <% } %>





                     </span>
                </td>
            </tr>   
            <% 
               } %>
            </table>
            <br />
            <br />
            <hr />
              
            <table id="Table1" class="alignLeft">
            <tr align="left" valign="middle" class="1000px">
                <td align="left" valign="middle" class="1000px" style="width:900px">
                    <asp:Localize ID="lblTotal" runat="server" meta:resourceKey="lblTotal" />
                    &nbsp;&nbsp;&nbsp;
                    <%= Html.Encode(string.Format("{0:c}", Model.PaymentScheduleTotal))%> 
                    <input type="hidden" id="temp" name="temp"  value="<%= Model.PaymentScheduleTotal %> " />
                </td>
                <td align="left" style="width:441px" valign="middle">  
                    <asp:Localize ID="lblCuurentBalanceDue"  runat="server" Text="Current Balance Due:   " /> 
                                     
                        <%= Html.Encode(string.Format("{0:c}", Model.PaymentDue))%> </td>
                <td align="right"  valign="middle" >   
                    <!-- <input type="submit" class="btnRemover"  onclick="setvalue();" runat="server"  value="Pay Now" />-->
                   <%-- <% if (ViewState["IsVisiblePayNow"].ToString()=="1")
                       {
                            %>--%>

                    <!--<input type="submit" id="btnPay" runat="server" style="width:90px;    height:28px; background-color:#002561; color:white;cursor:pointer;"  value="Pay Now" />-->
                    
              
                   <%-- <% } %>--%>
                </td>
                
            </tr>   
                <tr><td colspan="4"></td></tr>
                <tr><td colspan="4"></td></tr>
                <tr><td colspan="4"></td></tr>
                <tr><td colspan="4"></td></tr>

                <tr align="center">
                    <% if(Model.PendingPaymentForApproval !=0.00) 
                       {  %>
                    <td colspan="4"> <span style="font-weight:600;">Pending payments for approval:   </span> <b> <%= Html.Encode(string.Format("{0:c}", Model.PendingPaymentForApproval))%></b>  </td>
                    <% } %>
                </tr>
                
        </table>
          
            </div>
        <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
</div>
  </form>
</div>
   
    <script type="text/javascript" language="javascript">
        $(document).read(function () {
            alert();
           
        });

    </script>
</asp:Content>
