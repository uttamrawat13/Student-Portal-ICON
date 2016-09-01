<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ MasterType VirtualPath="~/Views/Shared/General.Master" %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>

<%@ Import Namespace="DiamondD.Data.DataAccess.Payment" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Repositories" %>
<%@ Import Namespace="DiamondD.Web.Controllers" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //errorCode=4017&errorName=Time-Out&errorMsg=The request has timed out.  The allotted time to complete the request has ended.  Please try again.
        //if (Request.UrlReferrer != null)
         //{
        if (Request.QueryString.ToString().Length > 0)
        {

            if (Request.QueryString["errorCode"] != null)
            {
                //lblerrorcode.Text = Request.QueryString["errorCode"].ToString();
                lblerrornametxt.Text = "Error: ";
                lblerrorcodetxt.Text = "Error Message: ";
                lblerrorname.Text = Request.QueryString["errorName"].ToString();
                lblerrorcode.Text = Request.QueryString["errorMsg"].ToString();
               



            }

            else
            {
                lblmessagetxt.Text = "Message: ";
                lblmessage.Text = Request.QueryString["ssl_result_message"].ToString();

                lblamounttxt.Text = "Transaction Amount: ";
                lblamount.Text = Request.QueryString["ssl_amount"].ToString();
                
                lbltxnTxt.Text = "Transaction ID: ";
                lbltxn.Text = Request.QueryString["ssl_txn_id"].ToString();

                lbltxnTimetxt.Text = "Transaction Time: ";
                lbltxnTime.Text = Request.QueryString["ssl_txn_time"].ToString();

            }

        }


    }
        
        

     //  else
     // {


      //    lblmessage.Text = "Bad request!";
      //    lblmessage.ForeColor = System.Drawing.Color.Red;
          
           
     // }
        
  // }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Payment Confirmation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        * {
            margin: 0%;
            padding: 0%;
        }

        body {
            width: 100%;
            height: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        .thank-page {
            float: left;
            width: 99%;
            height: auto;
            margin: 0px 0.50% 0px 0.50%;
        }

        .wel-bg {
            float: left;
            width: 100%;
            height: auto;
            background-color: #D1E7FC;
            padding: 0px 0px 220px 0px;
        }

        .thank-img {
            float: left;
            width: 250px;
            height: 250px;
            margin: 0px 0px 0px 100px;
            opacity: 0.8;
        }

        .thank-htext {
            float: left;
            width: 100%;
            height: auto;
            margin-top: 50px;
            font-size: 37px;
            font-weight: bold;
            color: #08c;
            text-align: center;
            font-family: Aparajita;
        }

        .thank-text {
            float: left;
            width: 100%;
            height: auto;
            font-size: 15px;
            color: #000;
           
        }
    </style>
    <% using (Html.BeginForm("PaymentReceipt", "PaymentReceipt"))
       { %>
    <div class="thank-page">

        <div class="wel-bg">

            <div class="thank-htext">Transaction Status</div>
            <br /><br />
             <div class="thank-text">
               </div>
            <div class="thank-text">
               </div>
            
            
            <div class="thank-text">
                
           <table width="85%" border="10" BORDERCOLOR="#539eb5" >
               <tr><td>
                   <asp:Label ID="lblmessagetxt" runat="server"></asp:Label>
                     <asp:Label ID="lblerrornametxt" runat="server"></asp:Label>
                   </td><td><asp:Label ID="lblmessage" runat="server"></asp:Label>
                        <asp:Label ID="lblerrorname" runat="server"></asp:Label>
                        </td></tr>
                <tr><td><asp:Label ID="lblamounttxt" runat="server"></asp:Label>
                     <asp:Label ID="lblerrorcodetxt" runat="server"></asp:Label>
                    </td><td><asp:Label ID="lblamount" runat="server"></asp:Label>
                         <asp:Label ID="lblerrorcode" runat="server"></asp:Label>
                         </td></tr>
               <tr><td><asp:Label ID="lbltxnTxt" runat="server"></asp:Label></td><td><asp:Label ID="lbltxn" runat="server"></asp:Label></td></tr>
                <tr><td><asp:Label ID="lbltxnTimetxt" runat="server"></asp:Label></td><td><asp:Label ID="lbltxnTime" runat="server"></asp:Label></td></tr>
           </table>
                </div>
        </div>

    </div>
    <% 
           Html.EndForm();
       } %>
</asp:Content>
