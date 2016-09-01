<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master"  %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.UrlReferrer != null)
        {


        }
               else
        {

            Response.Redirect(AppHelper.SharedUrl("Result/Error"));
           
        }
        
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
 
    Payment Process
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link href="<%=Page.ResolveUrl(AppHelper.CssUrl("creditly.css")) %>"  rel="stylesheet" type="text/css" />
 
    <script src='<%=ResolveUrl("../../Scripts/non-empty.js") %>' type="text/javascript"></script>
  
    





    

   <form id="form1" name="form1" action="<%= Request["PaymentAPI"] %>"  method="post">


      
<input type="hidden" name="ssl_merchant_id" value="<%= Request["ssl_merchant_id"]%>" />
<input type="hidden" name="ssl_user_id" value="<%= Request["ssl_user_id"]%>" />
<input type="hidden" name="ssl_pin" value="<%= Request["ssl_pin"]%>" />
<input type="hidden"  name="ssl_amount" value="<%= Request["ssl_amount"]%>"  />
<input type="hidden" name="StudentID" value="<%= Request["StudentID"]%>" />
<input type="hidden" name="ssl_first_name" value="<%= Request["ssl_first_name"]%>" />
<input type="hidden" name="ssl_last_name" value="<%= Request["ssl_last_name"] %>" />
    
<input type="hidden" name="ssl_error_url" value="<%= Request["ssl_error_url"] %>" />
<input type="hidden" name="ssl_receipt_decl_method" value="REDG" />
<input type="hidden" name="ssl_receipt_decl_get_url" value="<%= Request["ssl_receipt_decl_get_url"] %>" />
<input type="hidden" name="ssl_receipt_apprvl_method" value="REDG" />
<input type="hidden" name="ssl_receipt_apprvl_get_url" value="<%= Request["ssl_receipt_apprvl_get_url"] %>" />


    
<input type="hidden" id="ssl_transaction_type" name="ssl_transaction_type" value="ccsale"  />
<input type="hidden" name="ssl_get_token" value="Y" />
<input type="hidden" name="ssl_result_format" value="HTML" />
<input type="hidden" name="ssl_show_form" value="true" />


       <div align="center" style="padding-top:10px; padding-bottom:40px;">
       
    <section class="creditly-wrapper" style="padding-top:15px;"  >
        <label class="control-label">Please choose atleast one source to make payment</label>
    <hr />
<div class="credit-card-wrapper">

<div class="first-row form-group">
<div class="col-sm-8 controls">
<label class="control-label">Credit Card Transactions:</label>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
<label><input name="myradio" id="myradio" checked="checked"   onclick="document.getElementById('ssl_transaction_type').value = this.value"  type="radio" value="ccsale" /> </label>

</div>

</div>
   <% if (Request["IsVisibleACHMode"].ToString()!="0") { %>
<div class="second-row form-group">
<div class="col-sm-8 controls">
<label class="control-label">Electronic Check Transactions: </label>&nbsp; &nbsp;
<label><input name="myradio" id="myradio1"  type="radio" onclick="document.getElementById('ssl_transaction_type').value = this.value" value="ecspurchase" /> </label>
</div>

<div class="card-type"></div>
</div>
     <% } %></div>
</section>
    <br />
   
    <input type="button"  onclick="history.go(-1);"   style="width:90px;  height:28px; background-color:#002561; color:white;cursor:pointer;" runat="server"  value="Cancel" />     
    <input type="submit"     style="width:120px;  height:28px; background-color:#002561; color:white;cursor:pointer;" runat="server"  value="Begin Payment" />
</div>


   
   </form>
<script type="text/javascript">
    // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.

    function SetValue() {

        var x = document.getElementById("myradio").value;
        var y = document.getElementById("myradio1").value;

        if (x == 0) {
          
            document.getElementById("ssl_transaction_type").value = "ccsale";
        }

        if (y == 1) {
           
            document.getElementById("ssl_transaction_type").value = "ecspurchase";
        }

        return true;

    }

 
    
</script>
</asp:Content>
