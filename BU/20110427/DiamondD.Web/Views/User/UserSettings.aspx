<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.User.WebUser>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="TitleUserSetttings" runat="server" meta:resourceKey="TitleUserSettings" />	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:150px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:700px; text-align:center;">
    <div id="Heading">
      <h1>User Settings</h1>
    </div>
    <span id="SuccessfulMsg" style="display:none; font-size:larger; font-weight:bold; font-style:italic; color:Green"><asp:Localize ID="SuccessfulChangeMsg" runat="server" meta:resourceKey="SuccessfulChangeMsg" /></span>
    
    <!------------   Change Password   ------------->
    
    <div id="changePasswordDiv" style="width:700px">
    	        <fieldset id="changePasswordLegend" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
    	                               
                                             <% using (Html.BeginForm("ChangePassword", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading"><asp:Localize ID="SectionTitleChangePassword" runat="server" meta:resourceKey="SectionTitleChangePassword" /></span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnEditChangePassword" value="Edit" type="button" onclick="javascript: ChangePasswordFieldEnable();" />
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"><asp:Localize ID="lblOldPassword" runat="server" meta:resourceKey="lblOldPassword" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtOldPassword" name="txtOldPassword" type="password" value="" maxlength="25" disabled="disabled" />
                                                          <span id="enterOldPasswordErr" style="display:none;" class="error"><asp:Localize ID="EnterOldPasswordErrorMsg" runat="server" meta:resourceKey="EnterOldPasswordErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"><asp:Localize ID="lblNewPassword" runat="server" meta:resourceKey="lblNewPassword" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtNewPassword" name="txtNewPassword" value="" type="password" maxlength="25" disabled="disabled" />
                                                          <span id="enterNewPasswordErr" style="display:none;" class="error"><asp:Localize ID="EnterNewPasswordErrorMsg" runat="server" meta:resourceKey="EnterNewPasswordErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                     <tr>
				                                    <td align="right" valign="middle"><asp:Localize ID="lblConfirmPassword" runat="server" meta:resourceKey="lblConfirmPassword" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtConfirmPassword" name="txtConfirmPassword" value="" type="password" maxlength="25" disabled="disabled" />
                                                          <span id="enterConfirmPasswordErr" style="display:none;" class="error"><asp:Localize ID="EnterConfirmPasswordErrorMsg" runat="server" meta:resourceKey="EnterConfirmPasswordErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td>
                                                          <span id="compareBothPasswordSameErr" style="display:none;" class="error"><asp:Localize ID="PasswordsMismatchErrorMsg" runat="server" meta:resourceKey="PasswordsMismatchErrorMsg" /></span>
                                                          <span id="oldPasswordNotMatch" style="display:none;" class="error"><asp:Localize ID="oldPasswordNotMatchMsg" runat="server" meta:resourceKey="oldPasswordNotMatchMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input id="btnSaveChangePassword" name="btnSaveChangePassword" value="Save" type="submit" disabled="disabled" onclick="javascript:return ValidationChangePassword();" />
                                                          <input id="btnCancelChangePassword" name="btnCancelChangePassword" value="Cancel" type="button" disabled="disabled" onclick="javascript: ChangePasswordFieldDisable();" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    </table>
										<% 
                                                    Html.EndForm();
                                        } %>     
									</fieldset>
	</div>

    <!------------   Change Secret Question Answer  ------------->

	<div id="ChangeScretQuestionDiv" style="width:700px">
    	        <fieldset id="ChangeSecretQuestionLegend" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
                                             <% using (Html.BeginForm("ChangeSecretQuestion", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading"><asp:Localize ID="SectionTitleChangeSecretQuestion" runat="server" meta:resourceKey="SectionTitleChangeSecretQuestion" /></span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnEditChangeSecretQuestion" value="Edit" type="button" onclick="javascript: ChangeSecretQuestionFieldEnable();" />
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ><asp:Localize ID="lblSecretQuestion" runat="server" meta:resourceKey="lblSecretQuestion" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtSecretQuestion" name="txtSecretQuestion" value="<%= Model.SecretQuestion %>" type="text" maxlength="200" disabled="disabled" style="width:360px;" />
                                                          <input id="txtHidSecretQuestion" name="txtHidSecretQuestion" value="<%= Model.SecretQuestion %>" type="hidden" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                     <tr>
				                                    <td align="right" valign="middle" ></td>
				                                    <td></td>
				                                    <td>
                                                          <span id="enterSecretQuestionErr" class="error" style="display:none;"><asp:Localize ID="EnterSecretQuestionErrorMsg" runat="server" meta:resourceKey="EnterSecretQuestionErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"><asp:Localize ID="lblSecretAnswer" runat="server" meta:resourceKey="lblSecretAnswer" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtSecretAnswer" name="txtSecretAnswer" value="<%= Model.SecretAnswer %>" type="text" maxlength="200" disabled="disabled"  style="width:360px;"/>
                                                          <input id="txtHidSecretAnswer" name="txtHidSecretAnswer" value="<%= Model.SecretAnswer %>" type="hidden" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ></td>
				                                    <td></td>
				                                    <td>
                                                          <span id="enterSecretAnswerErr" class="error" style="display:none;"><asp:Localize ID="EnterSecretAnswerErrorMsg" runat="server" meta:resourceKey="EnterSecretAnswerErrorMsg" /></span>
                                                          
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input id="btnSaveChangeSecretQuestion" name="btnSaveChangeSecretQuestion" value="Save" type="submit" disabled="disabled" onclick="javascript:return ValidationSecretQuestion();" />
                                                          <input id="btnCancelChangeSecretQuestion" name="btnCancelChangeSecretQuestion" value="Cancel" type="button" disabled="disabled" onclick="javascript: ChangeSecretQuestionFieldDisable();" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    </table>
										<% 
                                                    Html.EndForm();
                                        } %>     
									</fieldset>
	</div>

    <!------------   Change Email   ------------->

	<div id="ChangeEmailDiv" style="width:700px">
    	        <fieldset id="ChangeEmailLegend" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
                                             <% using (Html.BeginForm("ChangeEmail", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading"><asp:Localize ID="SectionTitleChangeEmail" runat="server" meta:resourceKey="SectionTitleChangeEmail" /></span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnEditChangeEmail" value="Edit" type="button" onclick="javascript: ChangeEmailFieldEnable();" />
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ><asp:Localize ID="lblEmail" runat="server" meta:resourceKey="lblEmail" /></td>
				                                    <td></td>
				                                    <td>
                                                          <input id="txtChangeEmail" name="txtChangeEmail" value="<%= Model.Email %>" type="text" maxlength="200" disabled="disabled" style="width:360px;" />
                                                          <input id="txtHidChangeEmail" name="txtHidChangeEmail" value="<%= Model.Email %>" type="hidden" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ></td>
				                                    <td></td>
				                                    <td>
                                                          <span id="enterEmailErr" class="error" style="display:none;"><asp:Localize ID="EnterEmailAddressErrorMsg" runat="server" meta:resourceKey="EnterEmailAddressErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                     <tr>
				                                    <td align="right" valign="middle" ></td>
				                                    <td></td>
				                                    <td>
                                                          <span id="invalidEmailErr" class="error" style="display:none;"><asp:Localize ID="InvalidEmailAddressErrorMsg" runat="server" meta:resourceKey="InvalidEmailAddressErrorMsg" /></span>
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input id="btnSaveChangeEmail" name="btnSaveChangeEmail" value="Save" type="submit" disabled="disabled" onclick="javasrcipt:return ValidationEmailAddress();" />
                                                          <input id="btnCancelChangeEmail" name="btnCancelChangeEmail" value="Cancel" type="button" disabled="disabled" onclick="javascript: ChangeEmailFieldDisable();" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    </table>
										<% 
                                                    Html.EndForm();
                                        } %>     
									</fieldset>
	</div>

    <!------------   Javacsript Section  ------------->   

    <script language="javascript" type="text/javascript">
        
    function ValidationEmailAddress() {
        var txtChangeEmail = document.getElementById("txtChangeEmail");
        var enterEmailErr = document.getElementById("enterEmailErr");
        var invalidEmailErr = document.getElementById("invalidEmailErr");

        if (txtChangeEmail.value != "" || txtChangeEmail.value != null) {
            enterEmailErr.style.display = "none";
        }

        if (txtChangeEmail.value == "" || txtChangeEmail.value == null) {
            enterEmailErr.style.display = "inline";
            txtChangeEmail.focus();
            return false;
        }
        else if (txtChangeEmail.value != "" || txtChangeEmail.value != null) {
            var str = txtChangeEmail.value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(str)) {
                invalidEmailErr.style.display = "inline";
                txtChangeEmail.focus();
                return false;
            }

        }
        return true;
        
    }
    function ValidationSecretQuestion() {
        var txtSecretQuestion = document.getElementById("txtSecretQuestion");
        var txtSecretAnswer = document.getElementById("txtSecretAnswer");
        var enterSecretQuestionErr = document.getElementById("enterSecretQuestionErr");
        var enterSecretAnswerErr = document.getElementById("enterSecretAnswerErr");

        if (txtSecretQuestion.value != "" || txtSecretQuestion.value != null) {
            enterSecretQuestionErr.style.display = "none";
        }
        if (txtSecretAnswer.value != "" || txtSecretAnswer.value != null) {
            enterSecretAnswerErr.style.display = "none";
        }

        if (txtSecretQuestion.value == "" || txtSecretQuestion.value == null) {
            enterSecretQuestionErr.style.display = "inline";
            txtSecretQuestion.focus();
            return false;
        }
        else if (txtSecretAnswer.value == "" || txtSecretAnswer.value == null) {
            enterSecretAnswerErr.style.display = "inline";
            txtSecretAnswer.focus();
            return false;
        }
        return true;
    }
    
    function ValidationChangePassword() {
        var txtOldPassword = document.getElementById("txtOldPassword");
        var txtNewPassword = document.getElementById("txtNewPassword");
        var txtConfirmPassword = document.getElementById("txtConfirmPassword");
        var enterOldPasswordErr = document.getElementById("enterOldPasswordErr");
        var enterNewPasswordErr = document.getElementById("enterNewPasswordErr");
        var enterConfirmPasswordErr = document.getElementById("enterConfirmPasswordErr");
        var compareBothPasswordSameErr = document.getElementById("compareBothPasswordSameErr");

        if (txtOldPassword.value != "" || txtOldPassword.value != null) {
            enterOldPasswordErr.style.display = "none";
        }
        if (txtNewPassword.value != "" || txtNewPassword.value != null) {
            enterNewPasswordErr.style.display = "none";
        }
        if (txtConfirmPassword.value != "" || txtConfirmPassword.value != null) {
            enterConfirmPasswordErr.style.display = "none";
        }
        if (txtConfirmPassword.value == enterNewPasswordErr.value) {
            compareBothPasswordSameErr.style.display = "none";
        }
            
            
        if (txtOldPassword.value == "" || txtOldPassword.value == null) {
            enterOldPasswordErr.style.display = "inline";
            txtOldPassword.focus();
            return false;
        }
        else if (txtNewPassword.value == "" || txtNewPassword.value == null) {
            enterNewPasswordErr.style.display = "inline";
            txtNewPassword.focus();
            return false;
        }
        else if (txtConfirmPassword.value == "" || txtConfirmPassword.value == null) {
            enterConfirmPasswordErr.style.display = "inline";
            txtConfirmPassword.focus();
            return false;
        }
        else if (txtConfirmPassword.value != txtNewPassword.value) {
            compareBothPasswordSameErr.style.display = "inline";
            return false;
        }
        return true;
    }

    function ChangePasswordFieldEnable() {
        var txtOldPassword = document.getElementById("txtOldPassword");
        var txtNewPassword = document.getElementById("txtNewPassword");
        var txtConfirmPassword = document.getElementById("txtConfirmPassword");
        var btnSaveChangePassword = document.getElementById("btnSaveChangePassword");
        var btnCancelChangePassword = document.getElementById("btnCancelChangePassword");
        var btnEditChangePassword = document.getElementById("btnEditChangePassword");

        txtOldPassword.disabled = false;
        txtOldPassword.focus();

        txtNewPassword.disabled = false;
        txtConfirmPassword.disabled = false;
        btnSaveChangePassword.disabled = false;
        btnCancelChangePassword.disabled = false;
        btnEditChangePassword.disabled = true;

    }

    function ChangePasswordFieldDisable() {
        var txtOldPassword = document.getElementById("txtOldPassword");
        var txtNewPassword = document.getElementById("txtNewPassword");
        var txtConfirmPassword = document.getElementById("txtConfirmPassword");
        var btnSaveChangePassword = document.getElementById("btnSaveChangePassword");
        var btnCancelChangePassword = document.getElementById("btnCancelChangePassword");
        var btnEditChangePassword = document.getElementById("btnEditChangePassword");
        var enterOldPasswordErr = document.getElementById("enterOldPasswordErr");
        var enterNewPasswordErr = document.getElementById("enterNewPasswordErr");
        var enterConfirmPasswordErr = document.getElementById("enterConfirmPasswordErr");
        var compareBothPasswordSameErr = document.getElementById("compareBothPasswordSameErr");

        txtOldPassword.disabled = true;
        txtOldPassword.value = "";
        txtNewPassword.disabled = true;
        txtNewPassword.value = "";
        txtConfirmPassword.disabled = true;
        txtConfirmPassword.value = "";
        btnSaveChangePassword.disabled = true;
        btnCancelChangePassword.disabled = true;
        
        enterOldPasswordErr.style.display = "none";
        enterNewPasswordErr.style.display = "none";
        enterConfirmPasswordErr.style.display = "none";
        compareBothPasswordSameErr.style.display = "none";
        
        btnEditChangePassword.disabled = false;

    }
    function ChangeSecretQuestionFieldEnable() {
        
        var txtSecretQuestion = document.getElementById("txtSecretQuestion");
        var txtSecretAnswer = document.getElementById("txtSecretAnswer");
        var btnEditChangeSecretQuestion = document.getElementById("btnEditChangeSecretQuestion");
        var btnSaveChangeSecretQuestion = document.getElementById("btnSaveChangeSecretQuestion");
        var btnCancelChangeSecretQuestion = document.getElementById("btnCancelChangeSecretQuestion");

        txtSecretQuestion.disabled = false;
        txtSecretQuestion.focus();

        txtSecretAnswer.disabled = false;
        btnSaveChangeSecretQuestion.disabled = false;
        btnCancelChangeSecretQuestion.disabled = false;

        btnEditChangeSecretQuestion.disabled = true;
    }
    function ChangeSecretQuestionFieldDisable() {
        var txtSecretQuestion = document.getElementById("txtSecretQuestion");
        var txtSecretAnswer = document.getElementById("txtSecretAnswer");
        var btnEditChangeSecretQuestion = document.getElementById("btnEditChangeSecretQuestion");
        var btnSaveChangeSecretQuestion = document.getElementById("btnSaveChangeSecretQuestion");
        var btnCancelChangeSecretQuestion = document.getElementById("btnCancelChangeSecretQuestion");
        var enterSecretQuestionErr = document.getElementById("enterSecretQuestionErr");
        var enterSecretAnswerErr = document.getElementById("enterSecretAnswerErr");
        var txtHidSecretQuestion = document.getElementById("txtHidSecretQuestion");
        var txtHidSecretAnswer = document.getElementById("txtHidSecretAnswer");

        txtSecretQuestion.disabled = true;
        txtSecretAnswer.disabled = true;
        txtSecretQuestion.value = txtHidSecretQuestion.value;
        txtSecretAnswer.value = txtHidSecretAnswer.value;
        btnSaveChangeSecretQuestion.disabled = true;
        btnCancelChangeSecretQuestion.disabled = true;
        enterSecretQuestionErr.style.display = "none";
        enterSecretAnswerErr.style.display = "none";

        btnEditChangeSecretQuestion.disabled = false;
    }
   
   
    function ChangeEmailFieldEnable() {
        var txtChangeEmail = document.getElementById("txtChangeEmail");
        var btnSaveChangeEmail = document.getElementById("btnSaveChangeEmail");
        var btnCancelChangeEmail = document.getElementById("btnCancelChangeEmail");
        var btnEditChangeEmail = document.getElementById("btnEditChangeEmail");


        txtChangeEmail.disabled = false;
        txtChangeEmail.focus();

        btnSaveChangeEmail.disabled = false;
        btnCancelChangeEmail.disabled = false;

        btnEditChangeEmail.disabled = true;
    }
    function ChangeEmailFieldDisable() {
        var txtChangeEmail = document.getElementById("txtChangeEmail");
        var btnSaveChangeEmail = document.getElementById("btnSaveChangeEmail");
        var btnCancelChangeEmail = document.getElementById("btnCancelChangeEmail");
        var btnEditChangeEmail = document.getElementById("btnEditChangeEmail");
        var enterEmailErr = document.getElementById("enterEmailErr");
        var invalidEmailErr = document.getElementById("invalidEmailErr");
        var txtHidChangeEmail = document.getElementById("txtHidChangeEmail");
        
        txtChangeEmail.disabled = true;
        txtChangeEmail.value = txtHidChangeEmail.value;
        btnSaveChangeEmail.disabled = true;
        btnCancelChangeEmail.disabled = true;

        enterEmailErr.style.display = "none";
        invalidEmailErr.style.display = "none";
            
        
        btnEditChangeEmail.disabled = false;
    }
</script>


<% if (ViewData["editOption"].ToString() == "cp")
   { %>
<script language="javascript" type="text/javascript">
    ChangePasswordFieldEnable();
</script>
<% }
   else if (ViewData["editOption"].ToString() == "csq")
   { %>
<script language="javascript" type="text/javascript">
    ChangeSecretQuestionFieldEnable();
</script>
<% }
   else if (ViewData["editOption"].ToString() == "cm")
   { %>
<script language="javascript" type="text/javascript">
    ChangeEmailFieldEnable();
</script>
<% }
   if (ViewData["successMsg"] != null && ViewData["successMsg"].ToString() == "1")
   { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsg").style.display = "inline";
</script>
<% }
   else { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsg").style.display = "none";
</script>
<% } if(ViewData["oldPassword"] == null) { %>
<script language="javascript" type="text/javascript">
    document.getElementById("oldPasswordNotMatch").style.display = "none";
</script>
<% } else {%>
<script language="javascript" type="text/javascript">
    document.getElementById("oldPasswordNotMatch").style.display = "inline";
</script>
<% }%>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
</asp:Content>
