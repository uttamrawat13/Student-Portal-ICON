<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Reset Password
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="mainDiv" class="valignMiddle">
<center>
    <h1><asp:Localize ID="lblSecretQuestionHeading" runat="server" meta:resourceKey="lblSecretQuestionHeading" /> </h1>
    <asp:Localize ID="lblSecretQuestionPageDesc" runat="server" meta:resourceKey="lblSecretQuestionPageDesc" />
    <br />
    <%         
        if (!string.IsNullOrEmpty(ViewData["SecretAnswerSuccessMessage"] as string))
       {
           %><br />
            <span id="SuccessfulMsg" class="AskSecretQuestionSuccessMsg">
           <%   
                            
                Response.Write(ViewData["SecretAnswerSuccessMessage"].ToString());
             %>
               </span><br />
               <%
       }%>
       <%
        string errorMessage = "";
        if ((!string.IsNullOrEmpty(TempData["SecretAnswerErrorMessage"] as string)))
        {
            errorMessage = TempData["SecretAnswerErrorMessage"] as string;
           
        %><br />
            <span id="Span1" class="AskSecretQuestionErrorMsg">
           <%
                Response.Write(errorMessage);
           %>
               </span><br />
    <%
       }
    %>
    <br />
    <% using (Html.BeginForm("AskSecretQuestion"))
       { %>
    <div  id="controlsDiv" class="div-table">
    <% if (string.IsNullOrEmpty(ViewData["SecretAnswerSuccessMessage"] as string))
{
%>
    <div  class="DivRowWidth100">
        <div class="DivColumnWidth100pxLeft">
            <span class="Heading6"><asp:Localize ID="lblSecretQuestion" runat="server" meta:resourceKey="lblSecretQuestion" /></span>
        </div>
        <div class="DivColumnWidth5pxright">
        </div>
        <div class="DivColumnWidth280pxleft">
            <label id="secretQuestion" name="secretQuestion"><%=ViewData["SecretQuestion"]%></label>
        </div>

    </div>
    <br />
    <div class="DivRowWidth100">
        <div class="div-table-col" >
            <span class="Heading6"><asp:Localize ID="lblSecretAnswer" runat="server" meta:resourceKey="lblSecretAnswer" /></span>
        </div>
        <div class="div-table-col" >
        </div>
        <div class="DivColumnWidth280pxleft">
            <input id="secretAnswer" name="secretAnswer" value="" type="text" class="width250px" />
            <span class="RedStar">*</span>
            <div id="requiredFieldErrorMsg" class="displayNoneLeft"><span class="RedStar">(Required)</span></div>
        </div>
    </div>
    <br />
        <div  class="DivRowWidth100">
        <div class="div-table-col" >
        </div>
        <div class="div-table-col" >
        </div>
        <div class="div-table-col" >
            <input id="btnSubmit" runat="server" name="btnSubmit" meta:resourceKey="btnSubmitCaption" type="submit" onclick="javascript:return checkValidation();" />
            &nbsp;
            <input type="button" value="Back" onclick="javascript:history.back(); return true;" />
        </div>
    </div>
            <%
            } 
            else
            { %>              
        <div class="DivColumnWidth180pxcenter">
            <input type="button" value="Home" onclick="javascript:window.location='/Default.aspx'; return true;" />
        </div>
            <%
                }
            %>
    
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
        var secretAnswer = document.getElementById("secretAnswer");

        if (secretAnswer.value == null || secretAnswer.value == "") {
            secretAnswer.focus();
            document.getElementById("requiredFieldErrorMsg").style.display = "";
            return false;
        }
        return true;
    }

</script>
</asp:Content>
