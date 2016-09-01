<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleStudentReportStatus" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
<div id="MainDiv" style=" width:100%">
    <h4><%= ViewData["studentReportStatus"].ToString() %></h4>
    <% using (Html.BeginForm("ChangeStudentReportStatus", "Reports"))
       { %>
       Change status of report for student. &nbsp; &nbsp; 
       
       <% if (ViewData["studentReportStatus"].ToString() == "Currently student report status is enable.")
          { %> 
        <%= Html.CheckBox("Status" , true)%>
       <%} else { %>
        <%= Html.CheckBox("Status" , false)%>
       <%} %>
       <input type="submit" value="Submit" id="Submit" />
       <%} %>
       <br />
       <br />
       <% if (ViewData["result"] != null)
          { %>
         <span style="color:Red"> <%= ViewData["result"].ToString() %> </span>
       <%} %>
        <br />
        <br />
</div>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
</div>
</asp:Content>
