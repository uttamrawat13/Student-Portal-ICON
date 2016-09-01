<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Login
</asp:Content>

<asp:Content ID="loginBody" ContentPlaceHolderID="MainContent" runat="server">

<div id="main">
    <div style="display:table-cell; text-align:left; width:650px; vertical-align:top;">
                <p>
                Diamond D, Inc was founded in 2001 with a vision of our 
                School Management Database System as a diamond. 
                It has many brilliant facets that all fit together and become 
                one high quality gem.
                <br />
                <br />
                The system provides clarity into the direction of the school. 
                Among the facets, we consider the quality of our software, 
                the support provided by our staff, and our setup and 
                end-user training services to be most critical.
                <br />
                <br />
                Our software is easy to use and easy to install. 
                It manages student careers from leads through graduation. 
                Admissions, registration, financial aid, accounting, placement, 
                default management, administration and reports are all 
                managed areas.
                <br />
                <br />
                Our customer service oriented staff helps to ensure 
                that set-up, training, and results are seamless.
                <br />
                <br />
                Support is just a phone call away.
                </p>
            
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
										
										<h1>Student Login</h1>
										
									<fieldset id="Legend" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
									        <% if( ViewData["ErrorMessage"] != null ){ %>
                                             <p><span style="color:Red;"><% =ViewData["ErrorMessage"] %></span></p>
                                             <% } %>
                                             <% using(Html.BeginForm( "Authenticate", "Login" )){ %>
										<table cellpadding="0" border="0" >
			                                    <tr >
				                                    <td align="right" ><label for="UserName">User Name</label></td>
				                                    <td >
                                                          <% =Html.TextBox( "UserName" ) %><% =Html.ValidationMessage("UserName","*") %></td>
			                                    </tr>
			                                    <tr >
			                                    
				                                    <td align="right" > <label for="password">Password&nbsp;&nbsp;</label></td>
				                                    <td >
                                                       <% =Html.Password( "password") %> <% =Html.ValidationMessage("password", "*")%></td>
                                                        
			                                    </tr>
			                                    <tr >
                                                        <td  align="right" colspan="2"> <input type="submit" value="Login" /></td>
                                                        
			                                    </tr>
		                                    </table>
		                                    
										<br />
										<a id="ForgetPassword" href="#" class="NormalBold" style="text-decoration:underline;">Forget Password</a>&nbsp; |&nbsp;
										<a id="SignUp" href="#" class="NormalBold" style="text-decoration:underline;">Registration</a>
										<br />
										<br />
										<a id="SignUp" href="#" class="NormalBold" style="text-decoration:underline;">Resend activation information</a>
										
										<% Html.EndForm();
                                        } %>     
									</fieldset>
									
								</div>	
								
								</td>
							</tr>
						
						</table>

                </div>
</div>

</asp:Content>
