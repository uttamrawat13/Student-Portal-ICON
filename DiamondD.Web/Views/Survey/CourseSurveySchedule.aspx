<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Common" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Schedule a Course Survey
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="TitleAndNewDiv">
            <span class="MainHeadingSpan"><h1>Schedule a Course Survey</h1></span> 
        </div>
    <div class="pageContent">
        <form id="formCreatQuetionGroup" method="post" action="<%=Page.ResolveUrl(AppHelper.SurveysUrl("CourseSurveySchedule")) %>" >
        <%if (null != ViewData["ResponseMessage"])
          {%>
        <div class="serverErrorMessage">
            <%=ViewData["ResponseMessage"] %></div>
        <%} %>
        <fieldset class="surveyfieldset">
            <input id="hiddenStatuses" type="hidden" />
            <div class="surveyfieldrow">
                <label id="labelCourse" class="inlinelabel">
                    Course</label>
                <%=Html.DropDownList("Course", new SelectList((List<Course>)ViewData["CoursesList"],"CourseNo","Code"), new { @class="ui-widget ui-state-default ui-corner-all", @style="width:157px;"})%>
                <label id="labelSession" class="inlinelabel">
                    Session</label><%=Html.DropDownList("Session", new SelectList((List<Session>)ViewData["SessionsList"],"SessionInfo","Description"), new { @class = "ui-widget ui-state-default ui-corner-all", @style="width:157px;" })%>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelDaysToOpen">
                        No of Days to open</label>
                </span>
                <input id="inputDaysToOpen" name="DaysToOpen" style="width:238px;"/>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelDaysOpen" class="surveyfieldtitle">
                        No of Days open</label>
                </span>
                <input id="inputDaysOpen" name="DaysOpen" style="width:238px;" />
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="label3" class="surveyfieldtitle">
                        Student Status</label></span>
                <%=Html.DropDownList("inputSelectStudentStatuses", new SelectList((List<StudentStatus>)ViewData["StatusList"],"StudentStatusId","StudentStatusInfo"), new { id = "inputSelectStudentStatuses", @style="width:238px",@multiple="multiple",@size=5 })%>
                <%--<span class="comment">(hold control for select multiple status code.)</span>--%>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="label1">
                        Question Group</label></span>
                <%=Html.DropDownList("Question Group", new SelectList((List<QuestionGroup>)ViewData["GroupsList"],"QuestionGroupID","QuestionGroupCode"), new { @class="ui-widget ui-state-default ui-corner-all", @style="width:242px;"})%>
            </div>
            <div class="surveyfieldrow">
                <span class="surveyfieldtitle">
                    <label id="labelActive">
                        Active</label>
                </span>
                <%=Html.CheckBox("chkBoxActive") %>
                <%--<input type="checkbox" id="chkBoxActive" name="chkBoxActive" />--%>
            </div>
        </fieldset>
        <div class="surveyfieldrow">
            <input id="btnSubmit" class="surveySubmit" type="submit" value="Save" onclick="setStudentStatusValues()" />
            <button onclick="return false;">Cancel</button>
        </div>
        </form>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Content/CSS/Survey.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/CSS/jq-ui/ui-lightness/jquery-ui-1.10.3.custom.min.css"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/CSS/jquery.multiselect.css" rel="stylesheet" type="text/css" />

    <script src="../../Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.multiselect.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var DaysToOpen = $("#inputDaysToOpen").spinner({ min: 0, incremental: false });
            var DaysOpen = $("#inputDaysOpen").spinner({ min: 0, incremental: false });
            $("input[type=submit], button,input[type=submit]").button();
            var SelectStudents = $("#inputSelectStudentStatuses").multiselect({
                selectedText: function (numChecked, numTotal, checkedItems) {
                    return numChecked + ' of ' + numTotal + ' checked';
                }
            });
        });

        function setStudentStatusValues() {
            var studentStatuses = $("#inputSelectStudentStatuses").val();
            var statusListString=studentStatuses.join(',');
            $("#hiddenStatuses").val(statusListString);
        }
    </script>
</asp:Content>
