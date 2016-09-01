<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Reset Password
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="mainDiv" style="vertical-align:middle">
<center>
    <h1><asp:Localize ID="lblSecretQuestionHeading" runat="server" meta:resourceKey="lblSecretQuestionHeading" /> </h1>
    <asp:Localize ID="lblSecretQuestionPageDesc" runat="server" meta:resourceKey="lblSecretQuestionPageDesc" />
    <br />
    <% 
        if (!string.IsNullOrEmpty(ViewData["SecretAnswerSuccessMessage"] as string))
       {
           %><br />
            <span id="SuccessfulMsg" style="font-size:larger; font-weight:bold; font-style:italic; color:Green">
           <%   
                            
                Response.Write(ViewData["SecretAnswerSuccessMessage"].ToString());
             %>
               </span><br />
               <%
       }%>
       <% 
           if (!string.IsNullOrEmpty(ViewData["SecretAnswerErrorMessage"] as string))
       {
           %><br />
            <span id="Span1" style="font-size:larger; font-weight:bold; font-style:italic; color:Red">
           <%
           Response.Write(ViewData["SecretAnswerErrorMessage"].ToString());
             %>
               </span><br />
               <%
       }%>
    <br />
    <% using (Html.BeginForm("SecretQuestionAuthentication/" + ViewData["UserName"], "User"))
       { %>
    <div  id="controlsDiv" class="div-table">
    <% if (ViewData["SecretAnswerSuccessMessage"] == null)
{
%>
    <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
            <span class="Heading6"><asp:Localize ID="lblSecretQuestion" runat="server" meta:resourceKey="lblSecretQuestion" /></span>
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:left; ">
            <span style="padding-left:15px"><label id="secretQuestion" name="secretQuestion"><%=ViewData["SecretQuestion"]%></label></span>
        </div>

    </div>
    <br />
    <div class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
            <span class="Heading6"><asp:Localize ID="lblSecretAnswer" runat="server" meta:resourceKey="lblSecretAnswer" /></span>
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:right;">
            <input id="secretAnswer" name="secretAnswer" value="" type="text" />
            <span class="RedStar">*</span>
            <div id="requiredFieldErrorMsg" style="display:none;text-align:right"><span class="RedStar">(Required)</span></div>
        </div>
    </div>
    <br />
        <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:200px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:5px; text-align:right;">
        </div>
        <div class="div-table-col" style="width:180px; text-align:center;">
            <input id="btnSubmit" runat="server" name="btnSubmit" meta:resourceKey="btnSubmitCaption" type="submit" onclick="javascript:return checkValidation();" />
            &nbsp;
            <input type="button" value="Back" onclick="javascript:history.back(); return true;" />
        </div>
    </div>
            <%
            } 
            else
            { %>              
        <div class="div-table-col" style="width:180px; text-align:center;">
            <input type="button" value="Back" onclick="javascript:window.location='/Default.aspx'; return true;" />
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
