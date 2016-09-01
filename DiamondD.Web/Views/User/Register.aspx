<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto" UICulture="auto" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Verify Student
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="mainDiv" class="valignMiddle">
<center>
    <h1>Account Signup</h1>    
    <br />
        <%
        if (!string.IsNullOrEmpty(ViewData["UserNameDuplicated"] as string))
       {
           %><br />
            <span id="UserNameDuplicated" class="ErrorMsg">
           <%
           Response.Write(ViewData["UserNameDuplicated"].ToString());
             %>
               </span><br />
               <%
       } %>

     <% if( ViewData["errorMessage"] != null ){ %>
     <p><span class="error"><% =ViewData["errorMessage"] %></span></p>
    <% } %>
    <br />
    
    <% using (Html.BeginForm("Register", "User"))
       { %>
    <div class="div-table">
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblUserName" runat="server" meta:resourceKey="lblUserName" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv4">
            <input id="userName" name="userName" value="" type="text" maxlength="30" onkeypress="javascript:return checkname();" />
            <span class="RedStar">*</span>
        </div>
    </div>
    <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblSignUpPassword" runat="server" meta:resourceKey="lblSignUpPassword" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv4">
            <input id="newPassword" name="newPassword" maxlength="15" value="" type="password" />
            <span class="RedStar">*</span>
        </div>
    </div>
    <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblConfirmPassword" runat="server" meta:resourceKey="lblConfirmPassword" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv4">
            <input id="confirmPassword" name="confirmPassword" maxlength="15" value="" type="password" />
            <span class="RedStar">*</span>
        </div>
        <div class="RegisterDiv5">
            <div id="checkPassword" class="RegisterDiv6">
                <span class="RedStar">Passwords not match.</span>
            </div>
        </div>
    </div>
    
    
    
    <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblStudentId" runat="server" meta:resourceKey="lblStudentId" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv4">
            <input id="studentID" name="studentID" value=""  type="text" maxlength="50" onkeypress="javascript:return alphaNumericOnly(event);"/>
            <span class="RedStar">*</span>
        </div>

    </div>
    
    <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblDateOfBirth" runat="server" meta:resourceKey="lblDateOfBirth" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv4">
            <input id="dateofBirth" name="dateofBirth" value=""  type="text" maxlength="10" />
            <span class="RedStar">*</span>
            MM/DD/YYYY
        </div>
       
    </div>
    
    <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblEmail" runat="server" meta:resourceKey="lblEmail" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv7">
            <input id="Email" name="Email" value=""  type="text" class="RegisterInput" maxlength="50" />
            <span class="RedStar">*</span>
        </div>
        <div>
            <span id="EmailErrMsg" class="RegisterEmailErrMsg">Invalid Email.</span>
        </div>
    </div>
    
    
     <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblSecretQuestion" runat="server" meta:resourceKey="lblSecretQuestion" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv7">
            <input id="secretQuestion" name="secretQuestion" value=""  type="text" class="RegisterInput" maxlength="150" />
            <span class="RedStar">*</span>
        </div>
    </div>
    
     <br />
    <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
            <span class="Heading6"><asp:Localize ID="lblSecretAnswer" runat="server" meta:resourceKey="lblSecretAnswer" /></span>
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv7">
            <input id="SecretAnswer" name="SecretAnswer" value=""  type="text" class="RegisterInput" maxlength="150" />
            <span class="RedStar">*</span>
        </div>
    </div>
   <br />
       <div  class="RegisterDiv1">
        <div class="RegisterDiv2">
        </div>
        <div class="RegisterDiv3">
        </div>
        <div class="RegisterDiv14">
           <input id="btnSubmit" name="btnSubmit" runat="server" type="submit" meta:resourceKey="btnSubmit" onclick="javascript:return checkValidation();" />
           &nbsp;
           <input type="button" value="Back" onclick="javascript:history.back(); return true;" />
        </div>
        <div class="RegisterDiv8">
        </div>
        <div class="RegisterDiv4">
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
    function checkname(op) {
        if ((event.keyCode > 32 && event.keyCode <= 38) || (event.keyCode > 41 && event.keyCode < 44) || (event.keyCode > 46 && event.keyCode < 65) || (event.keyCode > 90 && event.keyCode < 97) || (event.keyCode > 122 && event.keyCode < 127) || event.keyCode == 40 || event.keyCode == 41)
            event.returnValue = false;
    }


    function checkValidation() {
        var newPassword = document.getElementById("newPassword");
        var confirmPassword = document.getElementById("confirmPassword");
        var studentID = document.getElementById("studentID");
        var dateofBirth = document.getElementById("dateofBirth");
        var matchPasswordErrMsg = document.getElementById("checkPassword");
        var userName = document.getElementById("userName");
        var secretQuestion = document.getElementById("secretQuestion");
        var SecretAnswer = document.getElementById("SecretAnswer");
        var Email = document.getElementById("Email");
        var EmailErrMsg = document.getElementById("EmailErrMsg");
        var InvalidUserNameMsgDiv = document.getElementById("InvalidUserNameMsgDiv");


        if (confirmPassword.value == newPassword.value) {
            matchPasswordErrMsg.style.display = "none";
        }


        if (Email.value != null || Email.value != "") {
            var str = Email.value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (filter.test(str)) {
                EmailErrMsg.style.display = "none";
            }
        }




        if (userName.value == null || userName.value == "") {
            userName.focus();
            return false;
        }
        else if (newPassword.value == null || newPassword.value == "") {
            newPassword.focus();
            return false;
        }
        else if (confirmPassword.value == null || confirmPassword.value == "") {
            confirmPassword.focus();
            return false;
        }
        else if (confirmPassword.value != newPassword.value) {
            matchPasswordErrMsg.style.display = "inline";
            return false;
        }
        else if (studentID.value == null || studentID.value == "") {
            studentID.focus();
            return false;
        }
        else if (dateofBirth.value == null || dateofBirth.value == "") {
            dateofBirth.focus();
            return false;
        }
        else if (Email.value == null || Email.value == "") {
            Email.focus();
            return false;
        }
        
        else if (secretQuestion.value == null || secretQuestion.value == "") {
            secretQuestion.focus();
            return false;
        }
        else if (SecretAnswer.value == null || SecretAnswer.value == "") {
            SecretAnswer.focus();
            return false;
        }

        if (Email.value != null || Email.value != "") {
            var str = Email.value;
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(str)) {
                EmailErrMsg.style.display = "inline";
                Email.focus();
                return false;
            }
        }
        
        return true;
    
    }


    function numbersonly(e) {
        var unicode = e.charCode ? e.charCode : e.keyCode
        if (unicode != 8) { //if the key isn't the backspace key (which we should allow)
            if (unicode < 48 || unicode > 57) //if not a number
                return false //disable key press
        }
    }

    function alphaNumericOnly(e) {
        var unicode = e.charCode ? e.charCode : e.keyCode
       
        if (unicode != 8) { //if the key isn't the backspace key (which we should allow)
           
            if (unicode >= 48 && unicode <= 57) //if not a number
                return true; //disable key press
            else if (unicode >= 65 && unicode <= 90 || unicode >= 97 && unicode <= 122)
                return true;
            else
                return false;
        }
    
    }

</script>
</asp:Content>
