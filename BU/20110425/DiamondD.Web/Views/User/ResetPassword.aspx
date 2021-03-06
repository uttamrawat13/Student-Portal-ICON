<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Reset Password
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="mainDiv" style="vertical-align:middle">
<center>
    <h1><asp:Localize ID="lblResetPassword" runat="server" meta:resourceKey="lblResetPassword" /> </h1>
    <asp:Localize ID="lblResetInstructionMsg" runat="server" meta:resourceKey="lblResetInstructionMsg" />
    <br />
    <br />
    <% using (Html.BeginForm("ResetPasswordAuthentication", "User"))
       { %>
    <div class="div-table">
    <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
            <span class="Heading6"><asp:Localize ID="lblUserName" runat="server" meta:resourceKey="lblUserName" /></span>
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:right;">
            <input id="userName" name="userName" value="" type="text" />
            <span class="RedStar">*</span>
        </div>

    </div>
    <br />
    <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
            <span class="Heading6"><asp:Localize ID="lblEmail" runat="server" meta:resourceKey="lblEmail" /></span>
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:right;">
            <input id="accountEmail" name="accountEmail" value="" type="text" />
            <span class="RedStar">*</span>
        </div>
        <div>
            <span id="EmailErrMsg" style="display:none;" class="RedStar">Invalid Email.</span>
        </div>
    </div>
    <br />
        <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:center;">
            <input id="btnSubmit" name="btnSubmit" meta:resourceKey="btnSubmitCaption" type="submit" onclick="javascript:return checkValidation();" />
            &nbsp;
           <input type="button" value="Back" onclick="javascript:history.back(); return true;" />
        </div>
    </div>
    
    </div>
            <% 
            //Html.EndForm();
            } %>
<br />
<br />
</center>
</div>
<script language="javascript" type="text/javascript">

    function checkValidation() {
        var userName = document.getElementById("userName");
        var accountEmail = document.getElementById("accountEmail");
        var EmailErrMsg = document.getElementById("EmailErrMsg");

        if (accountEmail.value != null || accountEmail.value != "") {
            var str = accountEmail.value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (filter.test(str)) {
                EmailErrMsg.style.display = "none";
            }
        }

        if (userName.value == null || userName.value == "") {
            userName.focus();
            return false;
        }
        else if (accountEmail.value == null || accountEmail.value == "") {
            accountEmail.focus();
            return false;
        }
        else if (accountEmail.value != null || accountEmail.value != "") {
            
            var str = accountEmail.value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(str)) {
                EmailErrMsg.style.display = "inline";
                accountEmail.focus();
                return false;
            }
            
        }
        return true;
    }

</script>
</asp:Content>
