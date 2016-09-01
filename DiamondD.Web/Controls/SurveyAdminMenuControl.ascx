<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SurveyAdminMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.SurveyAdminMenuControl" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<div class="displayCellWidth400pxLeft">
      <ul class="menu">
		<li class="top"><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Home")) %>" class="top_link"><asp:Localize ID="TopMenuHome" runat="server" meta:resourceKey="TopMenuHome" /></a></li>
		<li class="top"><a class="top_link"><asp:Localize ID="TopMenuQuestionsGroup" runat="server" meta:resourceKey="TopMenuQuestionsGroup" /></a>
			<ul class="sub">
				<li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("QuestionsGroup/Master"))%>"><asp:Localize ID="SubMenuMasterQuestionsGroup" runat="server" meta:resourceKey="SubMenuMasterQuestionsGroup"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("Questions/Master"))%>"><asp:Localize ID="SubMenuMasterQuestions" runat="server" meta:resourceKey="SubMenuMasterQuestions"/></a></li>
                <li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("QuestionsGroup/Create"))%>"><asp:Localize ID="SubMenuCreateQuestionsGroup" runat="server" meta:resourceKey="SubMenuCreateQuestionsGroup"/></a></li>
                <%--<li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("Questions/Create"))%>"><asp:Localize ID="SubMenuCreateQuestions" runat="server" meta:resourceKey="SubMenuCreateQuestions"/></a></li>--%>
			</ul>
		</li>
        <li class="top">
        <a class="top_link"><asp:Localize ID="TopMenuSurvey" runat="server" meta:resourceKey="TopMenuSurvey" /></a>
        <ul class="sub">
        <li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("MasterSurvey"))%>"><asp:Localize ID="SubMenuMasterSurvey" runat="server" meta:resourceKey="SubMenuMasterSurvey"/></a></li>
        <li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("CreateSurvey"))%>"><asp:Localize ID="SubMenuCreateSurvey" runat="server" meta:resourceKey="SubMenuCreateSurvey"/></a></li>
        <li><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("StudentSelectionSurvey"))%>"><asp:Localize ID="SubMenuStudentSelectionSurvey" runat="server" meta:resourceKey="SubMenuStudentSelectionSurvey"/></a></li>
        </ul>
        </li>
        <li class="top"><a href="<%= Page.ResolveUrl(AppHelper.SurveysUrl("CourseSurveySchedule"))%>" class="top_link"><asp:Localize ID="TopMenuSchedualSurvey" runat="server" meta:resourceKey="TopMenuSchedualSurvey" /></a>
        </li>
	  </ul>
</div>
<div class="menuBKColorWidth560px">
</div>
 <div class="displayCellWidth40px">
    <ul class="menu">
        <li class="top"><a href="<%= Page.ResolveUrl(AppHelper.UsersUrl("Logout")) %>" class="top_link"><asp:Localize ID="TopMenuLogout" runat="server" meta:resourceKey="TopMenuLogout" /></a></li>
    </ul>
</div>