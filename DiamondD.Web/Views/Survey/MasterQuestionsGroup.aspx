<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Import Namespace="Lib.Web.Mvc.JQuery.JqGrid" %>
<%@ Import Namespace="DiamondD.Web.ViewModels" %>
<%@ Import Namespace="DiamondD.Web.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Questions Group Master
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pageContent">
        <div class="TitleAndNewDiv">
            <span class="MainHeadingSpan"><h1>Question Groups</h1></span> 
        </div>
        
        <div class="GridDiv">
        <span class="NewLinkSpan">
            <a href="<%=Page.ResolveUrl(AppHelper.SurveysUrl("QuestionsGroup/Create")) %>">New</a></span>
            <%
                var grid = new JqGridHelper<QuestionGroupsGridViewModel>(
                "questionsGroup",
                dataType: GridOptions.DataType,
                methodType: GridOptions.MethodType,
                pager: GridOptions.IsPaging,
                rowsNumber: GridOptions.PageSize,
                sortingName: "Active", 
                sortingOrder: Lib.Web.Mvc.JQuery.JqGrid.JqGridSortingOrders.Desc,
                url:Page.ResolveUrl(AppHelper.SurveysUrl("ListQuestionsGroup")),
                viewRecords: GridOptions.ViewRecords,
                width:600
            );

            %>
            <%: grid.GetHtml() %>

            <script type="text/javascript">
                $(document).ready(function () {
                    <%: grid.GetJavaScript() %>
                });
            </script>
            <script src="../../Scripts/jquery.jqGrid.columnFormaters.js" type="text/javascript"></script>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<link href="../../Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../Content/CSS/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<link href="../../Content/CSS/Survey.css" rel="stylesheet" type="text/css" />

<script src="../../Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../../Scripts/grid.locale-en.js" type="text/javascript"></script>   
</asp:Content>
