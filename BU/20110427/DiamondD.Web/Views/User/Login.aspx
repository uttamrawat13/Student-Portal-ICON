<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Login</asp:Content>

<asp:Content ID="loginBody" ContentPlaceHolderID="MainContent" runat="server">
<div id="main">
    <div style="display:table-cell; text-align:left; width:650px; vertical-align:top;">
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
            <div style="display:table-cell; width:25px; text-align:center;">
                <br />
                <br />
               
                <img alt="" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("CenterLine.jpg")) %>" border="0px" />
            </div>
            <div style="display:table-cell; width:325px; vertical-align:top">
            
                <table style="height:100%; width:100%" >
							<tr align="left"  valign="top">
								<td  align="left">
								  
									<div id="loginDiv" style="margin-left:auto; margin-right:auto; width:260px; text-align:center">
										
										<h1><asp:Localize ID="PageHeading" runat="server" meta:resourcekey="StudentLoginMessage" ></asp:Localize></h1>
										
										<fieldset id="Legend" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
									        <% if( ViewData["ErrorMessage"] != null ){ %>
                                             <p><span style="color:Red;"><% =ViewData["ErrorMessage"] %></span></p><% } %>
                                             <% using (Html.BeginForm("Authenticate", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
			                                    <tr >
				                                    <td align="right" valign="middle" style="width:80px;" ><asp:Localize runat="server" 
                                                            meta:resourcekey="lblUserName" /></td><td style="width:5px;"></td>
				                                    <td >
                                                          <input id="UserName" name="UserName"  value="" type="text" />
                                                          <script language="javascript" type="text/javascript">
                                                              document.getElementById("UserName").focus();
                                                          </script>
                                                    </td>
			                                    </tr>
			                                    <tr >
			                                        <td></td>
			                                        <td style="width:5px;"></td>
				                                    <td>
				                                         <div  id="checkUsername" style="display:none;"><span style="color:Red;">
                                                             <asp:Localize runat="server" ID="BlankUserNameErrorMsg" 
                                                                 meta:resourcekey="BlankUserNameErrorMsg"  /></span></div></td></tr><tr>
				                                    <td align="right" valign="middle" ><asp:Localize runat="server" Text="Password" 
                                                            meta:resourcekey="lblPassword" /></td><td style="width:5px;"></td>
				                                    <td>
                                                       <input id="Password" name="Password" value="" type="password"   />
                                                    </td>
                                                        
			                                    </tr>
			                                     <tr >
			                                        <td></td>
			                                        <td style="width:5px;"></td>
				                                    <td>
				                                         <div  id="checkPassword" style="display:none;"><span style="color:Red;" >
                                                             <asp:Localize runat="server" ID="BlankPasswordErrorMsg" 
                                                                 meta:resourcekey="BlankPasswordErrorMsg" /></span>
				                                    </td>
                                                     
			                                    </tr>
			                                    <tr>
                                                        <td  align="right" colspan="3"> <input type="submit" runat="server" meta:resourceKey="btnSubmitCaption" onclick="javascript:return checkTextboxNotEmpty();" /></td></tr></table><br />
										<a id="ForgetPassword" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("ResetPassword")) %>" class="NormalBold" style="text-decoration:underline;"><asp:Localize ID="ForgetPasswordMsg" runat="server" meta:resourceKey="ForgetPasswordMsg" /></a>&nbsp; |&nbsp;
										<a id="disco" href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Register")) %>" class="NormalBold" style="text-decoration:underline;"><asp:Localize ID="RegistrationMsg" runat="server" meta:resourceKey="RegistrationMsg" /></a>
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
									</script></div></td></tr></table></div></div></asp:Content>