<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage"
    Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    Login</asp:Content>
<asp:Content ID="loginBody" ContentPlaceHolderID="MainContent" runat="server">

   
    <div id="main">
        <div class="LoginDiv1">
            <br />
            <br />
            <% if (ViewData["CustomMsg"] != null)
               {
                   string welcomeMsg = ViewData["CustomMsg"].ToString();
                   welcomeMsg = welcomeMsg.Replace("\r\n", "<br/>");

                   Response.Write(welcomeMsg);
               }
            %>
        </div>
        <div class="LoginDiv2">
            <br />
            <br />
            <img alt="" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("CenterLine.jpg")) %>" class="zeroBorder" />
        </div>
        <div class="LoginDiv3">
            <table class="fullWidthHeight">
                <tr align="left" valign="top">
                    <td align="left">
                        <div id="loginDiv" class="LoginDiv4">
                            <h1>
                                <asp:Localize ID="PageHeading" runat="server" meta:resourcekey="StudentLoginMessage"></asp:Localize></h1>
                            <fieldset id="Legend">
                                <% if (ViewData["ErrorMessage"] != null)
                                   { %>
                                <p>
                                    <span class="error">
                                        <% =ViewData["ErrorMessage"] %></span></p>
                                <% } %>
                                <% using (Html.BeginForm("Login", "User"))
                                   { %>
                                <table cellpadding="0" border="0">
                                    <tr>
                                        <td align="right" valign="middle" class="LoginTD1">
                                            <asp:Localize runat="server" meta:resourcekey="lblUserName" />
                                        </td>
                                        <td class="LoginTD2">
                                        </td>
                                        <td>
                                            <input id="UserName" name="UserName" value="" type="text" />
                                            <script language="javascript" type="text/javascript">
                                                document.getElementById("UserName").focus();
                                            </script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="LoginTD2">
                                        </td>
                                        <td>
                                            <div id="checkUsername" class="DisplayNone">
                                                <span class="RedStar">
                                                    <asp:Localize runat="server" ID="BlankUserNameErrorMsg" meta:resourcekey="BlankUserNameErrorMsg" /></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="middle">
                                            <asp:Localize runat="server" Text="Password" meta:resourcekey="lblPassword" />
                                        </td>
                                        <td class="LoginTD2">
                                        </td>
                                        <td>
                                            <input id="Password" name="Password" value="" type="password" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="LoginTD2">
                                        </td>
                                        <td>
                                            <div id="checkPassword" class="DisplayNone">
                                                <span class="RedStar">
                                                    <asp:Localize runat="server" ID="BlankPasswordErrorMsg" meta:resourcekey="BlankPasswordErrorMsg" /></span></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="3">
                                            <input type="submit" runat="server" meta:resourcekey="btnSubmitCaption" onclick="javascript:return checkTextboxNotEmpty();" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <a id="ForgetPassword" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("ResetPassword")) %>"
                                    class="LoginUnderlineBold">
                                    <asp:Localize ID="ForgetPasswordMsg" runat="server" meta:resourceKey="ForgetPasswordMsg" /></a>&nbsp;
                                |&nbsp; <a id="disco" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Register")) %>"
                                    class="LoginUnderlineBold">
                                    <asp:Localize ID="RegistrationMsg" runat="server" meta:resourceKey="RegistrationMsg" /></a>
                                |&nbsp; <a id="ForgotUserName" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("ForgotUserName")) %>"
                                    class="LoginUnderlineBold">Forgot Username
                                    <%--<asp:Localize ID="Localize1" runat="server" meta:resourceKey="ForgotUserName" />--%></a>
                                <br />
                                <br />
                                <!--<a id="Register" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("ResendActivateAccount")) %>" class="NormalBold" style="text-decoration:underline;"><asp:Localize ID="ResendActivationMsg" runat="server" meta:resourceKey="ResendActivationMsg" /></a>-->
                                <% 
                                                    //Html.EndForm();
                                                } %>
                            </fieldset>
                            &nbsp;<script language="javascript" type="text/javascript">

                                      function checkTextboxNotEmpty() {
                                          var userName = document.getElementById("UserName");
                                          var userNameErrorMsg = document.getElementById("checkUsername").style;

                                          var password = document.getElementById("Password");
                                          var passwordErrorMsg = document.getElementById("checkPassword").style;

                                          if (userName.value != null || userName.value != "") {
                                              userNameErrorMsg.display = "none";
                                          }
                                          if (password.value != null || password.value != "") {
                                              passwordErrorMsg.display = "none";
                                          }

                                          if (userName.value == null || userName.value == "") {
                                              userNameErrorMsg.display = "inline";
                                              userName.focus();
                                              return false;
                                          }
                                          else if (password.value == null || password.value == "") {
                                              passwordErrorMsg.display = "inline";
                                              password.focus();
                                              return false;
                                          }

                                          return true;
                                      }
                            </script></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
