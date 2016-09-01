<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.User.WebUser>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="Localize2" runat="server" meta:resourceKey="TitleRRSettings" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div  class="DivRowwidth1000">
        <div class="DivColumnWidth150Right">
            &nbsp;
        </div>
        <div class="DivCulomnwidth700Center">
    <div id="Heading">
      <h1><asp:Localize ID="Localize1" runat="server" meta:resourceKey="TitleRRSettings" /></h1>
    </div>
    <span id="SuccessfulMsg" class="SuccessMsgDisplayNone">
    <asp:Localize ID="SuccessfulChangeMsg" runat="server" meta:resourceKey="SuccessfulChangeMsg" /></span>
    
    <% if (Session["DD_Role"].ToString().Equals("Admin"))
       {%>
        <!------------   Change Report Rights  ------------->
        
    	<div id="ReportRights" class="width700px">
    	        <fieldset id="FieldsetEanbleReports">
                                             <%
           using (Html.BeginForm("ModifyReportRights", "User"))
           {%>
										<table cellpadding="0" border="0" >
										        <tr>
				                                    <td colspan="4" align="center"><span class="BlueHeading">
                                                     <asp:Localize ID="SectionTitleReportsRight" runat="server" meta:resourceKey="SectionTitleReportsRight" />
                                                    </span></td>
			                                    </tr>
                                                
										        
                                                <%
               foreach (var item in Model.VisibleReports)
               {
                   bool flag = false;
%>
			                                        <tr>
				                                        <td align="right" valign="middle" class="width200px" ></td>
				                                        <td class="width10px"></td>
				                                        <td class="width340px">
                                                        <%
                   foreach (var reportName in Model.RoleReportsRights)
                   {
                       if (item.Equals(reportName.ToString()))
                       {
                           flag = true;
                           break;
                       }
                   }
                   if (flag)
                   {
%>
                                                            <input type="checkbox"  value="<%=item.ToString()%>" name="chkReportsRights"  checked="checked" />
                                                            <%
                                                                var menuEntry = "SubMenuReports" + item + ".Text";
                                                                %>
                                                                <%=  GetLocalResourceObject(menuEntry)%> 
                                                                <%

                   }
                   else
                   {
%>
                                                            <input type="checkbox"  value="<%=item.ToString()%>" name="chkReportsRights" />
                                                            <%
                                                                var menuEntry = "SubMenuReports" + item + ".Text";
                                                                %>
                                                                <%=  GetLocalResourceObject(menuEntry)%> 
                                                                <%
                   }
%>
                                                        
                                                    </td>
                                                    <td class="width150px" align="right" valign="top">
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
                                                          <input id="btnSubmitReportRights" name="btnSubmitReportRights" value="Change"  type="submit" onclick="javascript:SetEnableReports();"  />
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
    <%
       }%>
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

</script>
<%    if (ViewData["successMsg"] != null && ViewData["successMsg"].ToString() == "1")
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

         </div>
        <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>

</asp:Content>
