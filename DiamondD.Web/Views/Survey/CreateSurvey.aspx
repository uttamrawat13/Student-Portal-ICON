<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                 <div class="TitleAndNewDiv">
            <span class="MainHeadingSpan"><h1>Create a Survey</h1></span> 
        </div>   <div class="pageContent">

        <form id="formCreatSurvey" method="post" action="<%=Page.ResolveUrl(AppHelper.SurveysUrl("CreateSurvey")) %>">
            <input name="id" type="hidden" value="<%=ViewData["id"] %>" />
        <%if (null != ViewData["ResponseMessage"])
          {%>
        <div class="serverErrorMessage">
            <%:ViewData["ResponseMessage"] %></div>
        <%} %>
        <fieldset class="surveyfieldset">
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelSurveyName">
                        Survey Name</label>
                </span>
                <span class="ui-widget">
                    <input id="txtSurveyName" name="txtSurveyName" class="ui-corner-all ui-state-default ui-widget" style="width:200px;"
                        type="text" title="labelQuestionGroupCode" value="<%:ViewData["Name"] %>" />
                </span>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="label1">
                        Survey Question Group</label></span>
                <%=Html.DropDownList("ddlSurveyQuestionGroup", (SelectList)ViewData["QuestionGroupsList"], new { @class = "ui-widget ui-state-default ui-corner-all",  @style="width:200px;"})%>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="label2">
                        Survey Start Date</label>
                </span>
                <span class="ui-widget">
                    <input id="txtSurveyStartDate" name="txtSurveyStartDate" class="ui-corner-all ui-state-default ui-widget"  style="width:200px;"
                        type="text" title="labelQuestionGroupCode" value="<%:ViewData["OpenDate"] %>" />
                </span>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelDaysToOpen">
                        No of Days to open</label>
                </span>
                <input id="inputDaysToOpen" name="DaysToOpen" value="<%:ViewData["DaysOpen"]%>"  style="width:195px;" />
            </div>

            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="label3" class="surveyfieldtitle">
                        Selected Students</label></span>
                        <button id="btnSelectStudents">Select Students</button>
                <%if (ViewData["No_of_Selected_Students"]!=null)
                  {%>
                    <i><span>(Currently selected: <%=ViewData["No_of_Selected_Students"] %>)</span></i>
                  <%} %>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelActive">
                        Active</label>
                </span>
                <%:Html.CheckBox("chkBoxActive",(bool)ViewData["Active"]) %>
                <%--<input type="checkbox" id="chkBoxActive" name="chkBoxActive" value="<%:ViewData["Active"] %>" />--%>
            </div>
        </fieldset>
        <div class="surveyfieldrow">
            <input id="btnSubmit" class="surveySubmit" type="submit" value="Save"  style="width:67px;"/>            
            <button onclick="window.location.href='<%=Page.ResolveUrl(AppHelper.SurveysUrl("MasterSurvey"))%>';">Cancel</button>
        </div>
        </form>
    </div>
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Content/CSS/Survey.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/CSS/jq-ui/ui-lightness/jquery-ui-1.10.3.custom.min.css"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/CSS/jquery.multiselect.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.multiselect.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var emptyfailureMessage = "Can't be Empty";
            var successMessage = " ";
            var lvSurveyName = new LiveValidation("txtSurveyName", { validMessage: successMessage });
            lvSurveyName.add(Validate.Presence,
              { failureMessage: emptyfailureMessage, onlyonSubmit: true });
            document.forms["formCreatSurvey"].action = document.forms["formCreatSurvey"].action + "?id=" + getURLParameter("id");
        });

        $(function () {
            var DaysToOpen = $("#inputDaysToOpen").spinner({ min: 0, incremental: false });
            var DaysOpen = $("#inputDaysOpen").spinner({ min: 0, incremental: false });
            var SelectStudents = $("#inputSelectStudents").multiselect();
            $("input[type=submit], button,input[type=submit]").button();
            $("#txtSurveyStartDate").datepicker();
            $("#btnSelectStudents").click(function () {
                //alert("http://" + document.location.host + '<%=ResolveUrl(AppHelper.SurveysUrl("StudentSelectionSurvey"))%>');
                var name = document.getElementById("txtSurveyName").value;
                var groupId = document.getElementById("ddlSurveyQuestionGroup").value;
                var startDate = document.getElementById("txtSurveyStartDate").value;
                var daysToOpen = document.getElementById("inputDaysToOpen").value;
                var active = document.getElementById("chkBoxActive").value;

                window.open("http://"
                    + document.location.host +
                    '<%=ResolveUrl(AppHelper.SurveysUrl("StudentSelectionSurvey"))%>' +
                    "?id=" + getURLParameter("id") +
                    "&name=" + name +
                    "&groupId=" + groupId +
                    "&startDate=" + startDate +
                    "&daysToOpen=" + daysToOpen +
                    "&active=" + active, "_self");
                return false;
                //window.location.href = document.location.host+'<%=ResolveUrl(AppHelper.SurveysUrl("StudentSelectionSurvey"))%>';
            });
        });

        function getURLParameter(name) {
            return decodeURIComponent(
                (RegExp('[?|&]' + name + '=' + '(.*?)(&|$)').exec(location.search) || [, null])[1]
            );
        }
    </script>
    
</asp:Content>
