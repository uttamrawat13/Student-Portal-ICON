<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.User.WebUser>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="TitleAdminSetttings" runat="server" meta:resourceKey="TitleAdminSettings" />	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


  <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:150px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:700px; text-align:center;">
    <div id="Heading">
      <h1><asp:Localize ID="Localize1" runat="server" meta:resourceKey="TitleAdminSettings" /></h1>
    </div>
    <span id="SuccessfulMsg" style="display:none; font-size:larger; font-weight:bold; font-style:italic; color:Green">
    <asp:Localize ID="SuccessfulChangeMsg" runat="server" meta:resourceKey="SuccessfulChangeMsg" /></span>
    
    <% if (Session["DD_Role"].ToString().Equals("Admin"))
           {%>
    <!------------   Change Welcome Message   ------------->

	<div id="DivLoginMsg" style="width:700px">
    	        <fieldset id="FieldsetLoginMsg" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
                                             <% using (Html.BeginForm("ChangeLoginMsg", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading">
                                                    <asp:Localize ID="SectionTitleChangeLoginMsg" runat="server" meta:resourceKey="SectionTitleChangeLoginMsg" /></span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnEditChangeLoginMsg" value="Edit" type="button" onclick="javascript: ChangeLoginMsgFieldEnable();" />
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ><asp:Localize ID="Localize3" runat="server" meta:resourceKey="lblLoginMsg" /></td>
				                                    <td></td>
				                                    <td>
                                                          <textarea name="txtChangeLoginMsg" id="txtChangeLoginMsg" disabled="disabled" rows="15" cols="50"><%= Model.LoginMsg %></textarea>  
                                                          <input id="txtHidChangeLoginMsg" name="txtHidChangeLoginMsg" value="<%= Model.LoginMsg %>" type="hidden" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input id="btnSaveChangeLoginMsg" name="btnSaveChangeLoginMsg" value="Save" type="submit" disabled="disabled" />
                                                          <input id="btnCancelChangeLoginMsg" name="btnCancelChangeLoginMsg" value="Cancel" type="button" disabled="disabled" onclick="javascript: ChangeLoginMsgFieldDisable();" />
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

    <!------------   Change Welcome Message   ------------->

	<div id="DivWelcomeMsg" style="width:700px">
    	        <fieldset id="FieldsetwelcomeMsg" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
                                             <% using (Html.BeginForm("ChangeWelcomeMsg", "User"))
                                                { %>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading"><asp:Localize ID="SectionTitleChangeWelcomeMsg" runat="server" meta:resourceKey="SectionTitleChangeWelcomeMsg" /></span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnWelcomeMsgEdit" value="Edit" type="button" onclick="javascript: ChangeWelcomeMsgFieldEnable();" />
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle" ><asp:Localize ID="lblWelcomeMsg" runat="server" meta:resourceKey="lblWelcomeMsg" /></td>
				                                    <td></td>
				                                    <td>
                                                          <textarea name="txtChangeWelcomeMsg" id="txtChangeWelcomeMsg" disabled="disabled" rows="15" cols="50"><%= Model.WelcomeMsg %></textarea>  
                                                          <input id="txtHidChangeWelcomeMsg" name="txtHidChangeWelcomeMsg" value="<%= Model.WelcomeMsg %>" type="hidden" />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input id="btnSaveChangeWelcomeMsg" name="btnSaveChangeWelcomeMsg" value="Save" type="submit" disabled="disabled" />
                                                          <input id="btnCancelChangeWelcomeMsg" name="btnCancelChangeWelcomeMsg" value="Cancel" type="button" disabled="disabled" onclick="javascript: ChangeWelcomeMsgFieldDisable();" />
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

        <!------------   Change Report Rights  ------------->
        
	<div id="ReportRights" style="width:700px; ">
    	        <fieldset id="FieldsetEanbleReports" class="TopDiv" style="text-align:left; border:1px solid Navy; vertical-align:middle;">
                                             <%
               using (Html.BeginForm("ModifyReportRights", "User"))
               {%>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading">
                                                     <asp:Localize ID="SectionTitleReportsRight" runat="server" meta:resourceKey="SectionTitleReportsRight" />
                                                    </span></td>
			                                    </tr>
										        <tr>
				                                    <td align="right" valign="middle" style="width:200px;" ></td>
				                                    <td style="width:10px;"></td>
				                                    <td style="width:340px;">
                                                    </td>
                                                    <td style="width:150px;" align="right" valign="top">
                                                        <input id="btnEditReportRights" name="btnEditReportRights" value="Edit" type="button" onclick="javascript:ReportRightsFieldEnable();"  />
                                                    </td>
			                                    </tr>
                                                <%
                                                   foreach (var item in Model.VisibleReports)
                                                   {
                                                       bool flag = false;
                                                     %>
			                                        <tr>
				                                        <td align="right" valign="middle" ></td>
				                                        <td></td>
				                                        <td>
                                                        <% foreach (var reportName in Model.RoleReportsRights)
                                                            {
                                                                  if(item.Equals(reportName.ToString()))
                                                                  {
                                                                      flag = true;
                                                                      break;
                                                                  }
                                                            }
                                                           if (flag)
                                                           {
                                                            %>
                                                            <input type="checkbox"  value="<%=item.ToString()%>" name="chkReportsRights"  checked="checked" disabled="disabled"/>
                                                            <%
                                                               Response.Write(item);

                                                           }
                                                           else
                                                            {
                                                                %>
                                                            <input type="checkbox"  value="<%=item.ToString()%>" name="chkReportsRights" disabled="disabled" />
                                                            <%
                                                               Response.Write(item);  
                                                            }
                                                           %>
                                                        
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                       <%
                                                    }
                                                    %>
			                                    <tr>
				                                    <td align="right" valign="middle"></td>
				                                    <td></td>
				                                    <td align="right" valign="middle">
                                                          <input type="hidden" value="" id="enableReports" name="enableReports" />
                                                          <input id="btnSubmitReportRights" name="btnSubmitReportRights" value="Save" disabled="disabled" type="submit" onclick="javascript:SetEnableReports();"  />
                                                          <input id="btnCancelReportRights" name="btnCancelReportRights" value="Cancel" type="button" disabled="disabled" onclick="javascript:ReportRightsFieldDisable();"  />
                                                    </td>
                                                    <td>
                                                    </td>
			                                    </tr>
			                                    </table>
										<%
                   Html.EndForm();
               }%>     
									</fieldset>
	</div>
        <!------------   Javacsript Section  ------------->   

    
    <script language="javascript" type="text/javascript">
        function SetEnableReports() {
            var enableReports = "";
            var ChkList = document.getElementsByName("chkReportsRights");

            for (i = 0; i < ChkList.length; i++) {
                if (ChkList[i].checked) {
                    enableReports = enableReports + ChkList[i].value + ",";
                }
            }
            document.getElementById("enableReports").value = enableReports;
        }
        function ReportRightsFieldEnable() {
            var btnSubmitReportRights = document.getElementById("btnSubmitReportRights");
            var btnCancelReportRights = document.getElementById("btnCancelReportRights");
            var divReportRights = document.getElementById("ReportRights");

            var ChkList = document.getElementsByName("chkReportsRights");

            for (i = 0; i < ChkList.length; i++) {
                ChkList[i].disabled = false;
            }


            btnSubmitReportRights.disabled = false;
            btnCancelReportRights.disabled = false;
            btnSubmitReportRights.focus();
        }
        function ReportRightsFieldDisable() {
            var btnSubmitReportRights = document.getElementById("btnSubmitReportRights");
            var btnCancelReportRights = document.getElementById("btnCancelReportRights");
            var divReportRights = document.getElementById("ReportRights");

            var ChkList = document.getElementsByName("chkReportsRights");

            for (i = 0; i < ChkList.length; i++) {
                ChkList[i].disabled = true;
            }


            btnSubmitReportRights.disabled = true;
            btnCancelReportRights.disabled = true;
        }

        function ChangeWelcomeMsgFieldEnable() {
            var txtChangeWelcomeMsg = document.getElementById("txtChangeWelcomeMsg");
            var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveChangeWelcomeMsg");
            var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelChangeWelcomeMsg");
            var btnEditChangeWelcomeMsg = document.getElementById("btnWelcomeMsgEdit");

            txtChangeWelcomeMsg.disabled = false;
            txtChangeWelcomeMsg.focus();

            btnSaveChangeWelcomeMsg.disabled = false;
            btnCancelChangeWelcomeMsg.disabled = false;

            btnEditChangeWelcomeMsg.disabled = true;

        }
        function ChangeWelcomeMsgFieldDisable() {
            var txtChangeWelcomeMsg = document.getElementById("txtChangeWelcomeMsg");
            var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveChangeWelcomeMsg");
            var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelChangeWelcomeMsg");
            var btnEditChangeWelcomeMsg = document.getElementById("btnWelcomeMsgEdit");
            var txtHidChangeWelcomeMsg = document.getElementById("txtHidChangeWelcomeMsg");

            txtChangeWelcomeMsg.disabled = true;
            txtChangeWelcomeMsg.value = txtHidChangeWelcomeMsg.value;
            btnSaveChangeWelcomeMsg.disabled = true;
            btnCancelChangeWelcomeMsg.disabled = true;

            btnEditChangeWelcomeMsg.disabled = false;
        }
        function ChangeLoginMsgFieldEnable() {
            var txtChangeLoginMsg = document.getElementById("txtChangeLoginMsg");
            var btnSaveChangeLoginMsg = document.getElementById("btnSaveChangeLoginMsg");
            var btnCancelChangeLoginMsg = document.getElementById("btnCancelChangeLoginMsg");
            var btnEditChangeLoginMsg = document.getElementById("btnEditChangeLoginMsg");

            txtChangeLoginMsg.disabled = false;
            txtChangeLoginMsg.focus();

            btnSaveChangeLoginMsg.disabled = false;
            btnCancelChangeLoginMsg.disabled = false;

            btnEditChangeLoginMsg.disabled = true;

        }
        function ChangeLoginMsgFieldDisable() {
            var txtChangeLoginMsg = document.getElementById("txtChangeLoginMsg");
            var btnSaveChangeLoginMsg = document.getElementById("btnSaveChangeLoginMsg");
            var btnCancelChangeLoginMsg = document.getElementById("btnCancelChangeLoginMsg");
            var btnEditChangeLoginMsg = document.getElementById("btnEditChangeLoginMsg");
            var txtHidChangeLoginMsg = document.getElementById("txtHidChangeLoginMsg");

            txtChangeLoginMsg.disabled = true;
            txtChangeLoginMsg.value = txtHidChangeLoginMsg.value;
            btnSaveChangeLoginMsg.disabled = true;
            btnCancelChangeLoginMsg.disabled = true;

            btnEditChangeLoginMsg.disabled = false;
        }
</script>

<% if (ViewData["editOption"].ToString() == "cr")
   { %>
<script language="javascript" type="text/javascript">
    ReportRightsFieldEnable();
</script>
<% }
    else if (ViewData["editOption"].ToString() == "wm")
   { %>
<script language="javascript" type="text/javascript">
    ChangeWelcomeMsgFieldEnable();
</script>
<% }
   else if (ViewData["editOption"].ToString() == "lm")
   { %>
<script language="javascript" type="text/javascript">
    ChangeLoginMsgFieldEnable();
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
<% } %>

<%
           }%>

            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>

</asp:Content>
