<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ForgotUserName
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="forgotUserNameWizard">
        <% using (Html.BeginForm("ForgotUserName", "User"))
           { %>
        <%
               int step = (int)(ViewData["step"]);
               Int16 EmailORID=Convert.ToInt16(ViewData["EmailORID"]);
               string rollNumber = ViewData["RollNumber"] as string;
               string Email = ViewData["Email"] as string;
        %>
        <label class="error">
            <%=ViewData["errormessage"]%></label>
        <input id="step" name="step" type="hidden" value="<%=step%>" />
        <input id="rollNumber" name="RollNumber" type="hidden" value="<%=rollNumber%>" />
        <input id="Email" name="Email" type="hidden" value="<%=Email%>" />
        <input type="hidden" value="<%=EmailORID%>" name="EmailORID" />
        <h1>
            Forgot Username</h1>
        <%if (step < 3)
          {%>
        <p class="topMargin0">
            Please enter the following information.</p>
        <%} %>
        <%
               if (step == 1)
               {%>
        <%--        <h2 class="wizardStepHeading">
            Step 1 of 2:</h2>
        --%>
        <%
            /*If EmailORID=1 It means Email will be asked by client for User Name.
             *If EmailORID=2 It means ID will be asked by client for User Name.
             *If EmailORID=3 It means option will be given to client to choose from both Email and ID 
             */    
                   if (EmailORID == 2 || EmailORID == 3)
                   {%>
        <div class="wizardContent">
            <div class="itemrow">
                <div class="wizardformitemlable">
                    <label id="lblRollNumber" class="Heading6">
                        Student ID&nbsp;</label>
                </div>
                <div class="wizardformiteminput">
                    <input name="RollNumber" class="wizardTextBox" />
                    <span class="RedStar">*</span>
                </div>
            </div>
        </div>
        <%} %>
        <%if (EmailORID == 3)
          { %>
          <div class="OR">OR</div>
          <%} %>
        <%if (EmailORID == 1 || EmailORID == 3)
          { %>
          <div class="wizardContent">
            <div class="itemrow">
                <div class="wizardformitemlable">
                    <label id="Label3" class="Heading6">
                        Student Email&nbsp;</label>
                </div>
                <div class="wizardformiteminput">
                    <input name="Email" class="wizardTextBox" />
                    <span class="RedStar">*</span>
                </div>
            </div>
        </div>
        <%} %>
        <%}
               else if (step == 2)
               { %>
        <%--        <h2 class="wizardStepHeading">
            Step 2 of 2:</h2>
        --%>
        <div class="wizardContent">
            <div class="itemrow">
                <div class="wizardformitemlable">
                    <label id="Label1" class="Heading6">
                        Security Question&nbsp;</label>
                </div>
                <div class="wizardformiteminput">
                    <label id="Security_Question" class="wizardTextBox">
                        <%=ViewData["Security_Question"]%></label>
                </div>
            </div>
            <div class="itemrow">
                <div class="wizardformitemlable">
                    <label id="Label2" class="Heading6">
                        Security Answer&nbsp;</label>
                </div>
                <div class="wizardformiteminput">
                    <input name="Security_Answer" class="wizardTextBox" />
                    <span class="RedStar">*</span>
                </div>
            </div>
        </div>
        <%}
               else if (step == 3) %>
        <%{ %>
        <p class="wizardFinalMsg">
            Your User Id has been sent to your email address. Check your email address and try
            <a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Login")) %>">Login</a></p>
        <%} %>
        <%if (step < 3)
          {%>
        <input type="submit" value="Next" class="wizardNext" />
        &nbsp;
        <input type="button" value="Back" class="wizardNext" onclick="javascript:history.back(); return true;" />
        <%} %>
        <%} %>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
