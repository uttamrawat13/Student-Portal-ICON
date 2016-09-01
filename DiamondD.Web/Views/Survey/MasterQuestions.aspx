<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Register Src="~/Views/Survey/PartialCreateQuestionGroup.ascx" TagPrefix="uc1" TagName="PartialCreateQuestionGroup" %>
<%@ Import Namespace="DiamondD.Web.Common" %>
<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Import Namespace="Lib.Web.Mvc.JQuery.JqGrid" %>
<%@ Import Namespace="DiamondD.Web.ViewModels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Master Questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="TitleAndNewDiv" style="width:1000px;">
            <span class="MainHeadingSpan"><h1>Survey Group Questions</h1></span> 
        </div>
    <form id="formCreatQuetionGroup" method="post" action="<%=Page.ResolveUrl(DiamondD.Web.Helpers.AppHelper.SurveysUrl("QuestionsGroup/Create")) %>">

        <%if (null != ViewData["ResponseMessage"])
          {%>
        <div class="serverErrorMessage"><%=ViewData["ResponseMessage"] %></div>
        <%} %>
        <uc1:PartialCreateQuestionGroup runat="server" ID="PartialCreateQuestionGroup" />
        <%--<input type="submit" value="Update Question Group" style="display: block;margin-bottom: 20px;" onclick="$.post(document.forms['formCreatQuetionGroup'].action,$.post(document.forms['formCreatQuetionGroup'].serialize(), function (response) { console.log(response); });return false;" />--%>
        <hr />
    </form>
    <form id="formQuestion" action="<%=Page.ResolveUrl(DiamondD.Web.Helpers.AppHelper.SurveysUrl("Questions/Master")) %>">
        <fieldset class="surveyfieldset" style="margin-left:130px;">
            <legend></legend>
           <div id="questionfields">
               <div class="surveyfieldrow">
                   <label id="lblQuestion" class="title" >Question</label>
                   <input id="txtQuestion" type="text" class="edit" style="width:400px" /> 
               </div>
               <div class="surveyfieldrow">
                   <label id="lblOrder" class="title" >Order</label>
                   <input id="txtOrder" type="text" class="edit" style="width:50px" /> 
               </div>
               <div class="surveyfieldrow">
                   <label id="lblNumeric" class="title" >Numeric</label>
                   <input id="chkBoxNumeric" type="checkbox" class="edit" /> 
               </div>
               <div class="surveyfieldrow">
                   <label id="lblActive" class="title" >Active</label>
                   <input id="chkBoxActive" type="checkbox" class="edit" /> 
               </div>
               <input type="submit" value="Add" style="float: left;margin-left: 25px;margin-top: 30px;" onclick="return addQuestionLocally()"/>
           </div>
        </fieldset>
        
    </form>
    <div>
    <%
        var grid = new JqGridHelper<QuestionsGridViewModel>(
                "questions",
                dataType: GridOptions.DataType,

                methodType: GridOptions.MethodType,
                pager: GridOptions.IsPaging,
                rowsNumber: GridOptions.PageSize,
                cellEditingEnabled: true,
                cellEditingSubmitMode: JqGridCellEditingSubmitModes.ClientArray,
                cellEditingUrl: "clientArray",
                editingUrl: "clientArray",
                height: 300,
                sortingName: "Active",
                sortingOrder: Lib.Web.Mvc.JQuery.JqGrid.JqGridSortingOrders.Desc,
                url: Page.ResolveUrl(AppHelper.SurveysUrl("ListQuestions")), //Url.Action("ListSurvey"),
                viewRecords: GridOptions.ViewRecords,
                width: 730,
                altClass: "questions-grid",
                beforeRequest: @"function(){
                                            var questionsGroupId = getURLParameter('questionsGroupId');
                                            $('#questions').setGridParam({
                                            postData: {
                                            questionsGroupId: questionsGroupId
                                            }});
                                          }"
            ).AddActionsColumn("actions", position: 5, width: 70, deleteButton: true, inlineEditingOptions: new Lib.Web.Mvc.JQuery.JqGrid.JqGridInlineNavigatorActionOptions() { }, deleteOptions: new JqGridNavigatorDeleteActionOptions { 
                BeforeSubmit = "function(d){ $('#questions').delRowData(d);$('#eData').click();return false;}", Url = "clientArray" });
            //.Navigator(new Lib.Web.Mvc.JQuery.JqGrid.JqGridNavigatorOptions() { Add = false, Edit = false, Delete = false, Search = false })
            //.InlineNavigator(new Lib.Web.Mvc.JQuery.JqGrid.JqGridInlineNavigatorOptions() { Edit = false, AddActionOptions = new Lib.Web.Mvc.JQuery.JqGrid.JqGridInlineNavigatorAddActionOptions() { RowId = "_empty" }, ActionOptions = new Lib.Web.Mvc.JQuery.JqGrid.JqGridInlineNavigatorActionOptions() { Url = Url.Action("InsertProduct") } }); ;%>
    <%: grid.GetHtml() %>
    <script type="text/javascript">
        $(document).ready(function () {            
            <%: grid.GetJavaScript() %>
        });

        function getURLParameter(name) {
            return decodeURIComponent(
                (RegExp('[?|&]' + name + '=' + '(.*?)(&|$)').exec(location.search) || [, null])[1]
            );
        }
            </script>  
        <script src="../../Scripts/jquery.jqGrid.columnFormaters.js" type="text/javascript"></script>  
        <div style="margin-left: 140px; margin-top: 10px; text-align: left;"><button id="btnSubmit" onclick="SaveGroupQuestions()" style="height:40px;width:100px">Save</button></div>
    </div>
    
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".surveyfieldrow").addClass("leftOrientation");
        });

        function addQuestionLocally()
        {            
            var question = $("#txtQuestion").val();
            var order = $("#txtOrder").val();
            var numeric = $("#chkBoxNumeric")[0].checked;
            var active = $("#chkBoxActive")[0].checked;
            if (question != "" && question != null) {

                jQuery("#questions").jqGrid("addRow",
                parameters = {
                    rowID: undefined,
                    initdata: [{
                        QuestionId: 0,
                        Quetion: question,
                        Order: order,
                        Numeric: numeric,
                        Active: active
                    }],
                    position: "first"
                });
                
                $("#formQuestion")[0].reset();
                $(".serverErrorMessage")[0].innerHTML = "";
            }
            else {
                $(".serverErrorMessage")[0].innerHTML = "Question Text is Required.";
                $("#txtQuestion").focus();
            }
            return false;
        }

        function SaveGroupQuestions()
        {
            var formQuetionGroup = $("#formCreatQuetionGroup")[0];
            var groupId = formCreatQuetionGroup[1].value;
            var groupCode = formCreatQuetionGroup[2].value;

            var groupAdmissions = formCreatQuetionGroup[3].checked;
            var groupRegister = formCreatQuetionGroup[5].checked;
            var groupFinancialAid = formCreatQuetionGroup[7].checked;
            var groupPlacement = formCreatQuetionGroup[9].checked;

            var questionsData = $("#questions").getRowData();

      //      $.getJSON('<%--=Page.ResolveUrl(AppHelper.SurveysUrl("Questions/Master"))--%>', {
      //          groupId: groupId,
      //          groupCode: groupCode,
      //          groupAdmissions: groupAdmissions,
      //          groupRegister: groupRegister,
      //          groupFinancialAid: groupFinancialAid,
      //          groupPlacement: groupPlacement,
      //          questions: questionsData
      //      });
            var data={
                groupId: groupId,
                groupCode: groupCode,
                groupAdmissions: groupAdmissions,
                groupRegister: groupRegister,
                groupFinancialAid: groupFinancialAid,
                groupPlacement: groupPlacement,
                questions:questionsData,
                dataType:'json'
            };
            $.ajax({
                type: "POST",
              url: '<%=Page.ResolveUrl(AppHelper.SurveysUrl("Questions/Master"))%>',
                data: JSON.stringify(data),
                dataType: 'json',
                contentType:'application/json'
            });
        }
        </script>
    <link href="../../Content/CSS/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-ui-1.8.20.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link href="../../Content/CSS/Survey.css" rel="stylesheet" type="text/css" />
    <%--<script src="../../Scripts/jquery.jqGrid-4.1.2.min.js" type="text/javascript"></script>--%>
    <%--<script src="../../Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/jquery.jqGrid-4.4.1.js" type="text/javascript"></script>
    
    <script src="../../Scripts/grid.locale-en.js" type="text/javascript"></script>
    <style type="text/css">
        .questions-grid {
            float:left;
        }
        fieldset {
            margin-left:140px;
        }
            fieldset div.checkBoxes  div.surveyfieldrow label {
                width: 150px;
            }
    </style>  
</asp:Content>
