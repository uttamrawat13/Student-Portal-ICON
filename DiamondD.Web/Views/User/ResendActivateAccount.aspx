<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblActivateAccount" runat="server" meta:resourceKey="lblActivateAccount" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mainDiv" class="valignMiddle">
<center>
    <h1><asp:Localize ID="lblAccountActivation" runat="server" meta:resourceKey="lblAccountActivation" /></h1>
    <asp:Localize ID="lblAccountActivationInstructionMsg" runat="server" meta:resourceKey="lblAccountActivationInstructionMsg" />
    <br />
    <br />
    <% using (Html.BeginForm("ResendActivateAccountAuthentication", "User"))
       { %>
    <div class="div-table">
    <div  class="DivRowWidth100">
        <div class="DivCulomnwidth200Right">
            <span class="Heading6"><asp:Localize ID="lblUserName" runat="server" meta:resourceKey="lblUserName" /></span>
        </div>
        <div class="DivCulomnwidth5Right">
        </div>
        <div class="DivCulomnwidth180Right">
            <input id="userName" name="userName" value="" type="text" />
             <span class="RedStar">*</span>
        </div>
    </div>
    <br />
    <div  class="DivRowWidth100">
        <div class="DivCulomnwidth200Right">
            <span class="Heading6">    <asp:Localize ID="lblEmail" runat="server" meta:resourceKey="lblEmail" />
</span>
        </div>
        <div class="DivCulomnwidth5Right">
        </div>
        <div class="DivCulomnwidth180Right">
            <input id="accountEmail" name="accountEmail" value="" type="text" />
            <span class="RedStar">*</span>
        </div>
          <div>
            <span id="EmailErrMsg" class="DisplayNoneErrorMsg"><asp:Localize ID="lblInvalidEmailMsg" runat="server" meta:resourceKey="lblInavlidEmailMsg" /></span>
        </div>
    </div>
    <br />
        <div  class="DivRowWidth100">
        <div class="DivCulomnwidth200Right">
        </div>
        <div class="DivCulomnwidth5Right">
        </div>
        <div class="DivColumnWidth180pxcenter">
            <input id="btnSubmit" name="btnSubmit" type="submit" runat="server" meta:resourceKey="btnSubmitCaption" onclick="javascript:return checkValidation();" />
            &nbsp;
           <input type="button" value="Back" onclick="javascript:history.back(); return true;" />
        </div>
    </div>
    
    </div>
            <% 
            Html.EndForm();
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
