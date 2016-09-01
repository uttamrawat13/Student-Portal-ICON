<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Import Namespace="Lib.Web.Mvc.JQuery.JqGrid" %>
<%@ Import Namespace="DiamondD.Web.ViewModels" %>
<%@ Import Namespace="DiamondD.Web.Common" %>
<%@ Import Namespace="DiamondD.Data.DataAccess.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Select Students
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 1000px; text-align: left;">
        <div class="TitleAndNewDiv" style="width:1000px">
            <span class="MainHeadingSpan"><h1>Select Students</h1></span> 
        </div>   <br /><br />
        <table style="border:none;width:100%;">
            <tr>
                <td><label>Student Status</label></td>
                <td><label>Program</label></td>
                <td><label>First Term</label></td>
                <td><label>Group</label></td>
                <td><label>Session</label></td>
            </tr>
            <tr>
                <td><%=Html.DropDownList("StudentStatusList", new SelectList((List<StudentStatus>)ViewData["StatusList"], "StudentStatusId", "StudentStatusInfo"), new { @class = "ui-widget ui-state-default ui-corner-all" })%>
            </span><span class="studentSelectionComboSpan"></td>
                <td><%=Html.DropDownList("Programs", new SelectList((List<Program>)ViewData["ProgramsList"], "ProgramNo", "ProgramCode"), new { @class = "ui-widget ui-state-default ui-corner-all" })%>
            </span><span class="studentSelectionComboSpan"></td>
                <td> <%=Html.DropDownList("Terms", new SelectList((List<Term>)ViewData["TermsList"], "TermId", "TermBeginDate"), new { @class = "ui-widget ui-state-default ui-corner-all" })%>
            </span><span class="studentSelectionComboSpan"></td>
                <td><%=Html.DropDownList("StudentGroups", new SelectList((List<StudentGroup>)ViewData["StudentGroupsList"], "GroupId", "GroupCode"), new { @class = "ui-widget ui-state-default ui-corner-all" })%>
            </span><span class="studentSelectionComboSpan"></td>
                <td><%=Html.DropDownList("Sessions", new SelectList((List<Session>)ViewData["SessionsList"], "SessionInfo", "Description"), new { @class = "ui-widget ui-state-default ui-corner-all" })%></td>
            </tr>
       </table><br /><br /><%-- 
        <div class="studentSelectionComboDiv">
            <div>
                </div>
            <span class="studentSelectionComboSpan">
                

                
                
               
                
                
            </span>
        </div>--%>
        <div class="studentSelectionGridOuterDiv">
            <form name="frmMain" action='<%=ResolveUrl(AppHelper.SurveysUrl("StudentSelectionSurvey"))%>' method="post">
                <div class="allStudentsGridDiv">
                    <%
                        var grid = new JqGridHelper<SurveyStudentGridViewModel>(
                        "filteredStudents",
                        dataType: GridOptions.DataType,
                        methodType: GridOptions.MethodType,
                        pager: GridOptions.IsPaging,
                        rowsNumber: GridOptions.PageSize,
                        sortingName: "FirstName",
                        sortingOrder: Lib.Web.Mvc.JQuery.JqGrid.JqGridSortingOrders.Desc,
                        url: Page.ResolveUrl(AppHelper.SurveysUrl("ListFilteredStudents")),
                        viewRecords: GridOptions.ViewRecords,
                        width: 550,
                        height: 400,
                        onSelectRow: "function(id){ console.log('Selected row ID ' + id); }",
                            //postData: new { StudentStatusId = "function() { return $('#StudentStatusList').val(); }" },
                        multiSelect: true,
                        loadComplete: @"function(d){
                                    var filas=$('#selectedStudents').getRowData();
                                    console.log('load Completed');
                                    for(i=0;i<filas.length;i++)
                                    {
                                    jQuery('#filteredStudents').delRowData(filas[i].StudentId);
                                    }
                        }"
                    );
                
                    %>
                    <%: grid.GetHtml() %>
                    <script type="text/javascript">
                        $(document).ready(function () {
                    <%: grid.GetJavaScript() %>
                            //$("filteredStudents").
                            reloadData();
                        });
                        $("select").change(function () {
                            reloadData();
                        });
                        function reloadData() {
                            var studentStatusId = $("#StudentStatusList").val();
                            var ProgramsId = $("#Programs").val();
                            var TermsId = $("#Terms").val();
                            var StudentGroupsId = $("#StudentGroups").val();
                            var SessionsId = $("#Sessions").val();
                            var Id = getURLParameter("id");                            
                            $('#filteredStudents').setGridParam({
                                postData: {
                                    surveyId: Id,
                                    StudentStatusId: studentStatusId,
                                    ProgramsId: ProgramsId,
                                    TermsId: TermsId,
                                    StudentGroupId: StudentGroupsId,
                                    SessionsId: SessionsId
                                }
                            });
                            $("#filteredStudents").trigger("reloadGrid");
                        }
                    </script>
                    <div class="buttons">
                        <button onclick="return addSelectedCheckBoxes();">Add</button>
                        <button onclick="addAllGridStudents(); return false;">Add All</button>
                    </div>
                </div>
                <div class="selectedStudentsGridDiv">
                    <%
                        var selectedGrid = new JqGridHelper<SelectedStudentsGridViewModel>(
                        "selectedStudents",
                        dataType: GridOptions.DataType,
                        methodType: GridOptions.MethodType,
                        pager: GridOptions.IsPaging,
                        rowsNumber: GridOptions.PageSize,
                        sortingName: "FirstName",
                        sortingOrder: Lib.Web.Mvc.JQuery.JqGrid.JqGridSortingOrders.Desc,
                        url: Page.ResolveUrl(AppHelper.SurveysUrl("ListSelectedStudents")),
                        viewRecords: GridOptions.ViewRecords,
                        width: 300,
                        height: 400,
                        onSelectRow: "function(id){ console.log('Selected row ID ' + id); }",
                            //postData: new { id="1"},
                        multiSelect: true,
                        loadComplete: @"function(d){                                                    
                                                    if(typeof(d.rows[0])!==undefined&&d.rows.length>0)
                                                        {
                                                        selectedStudentsArray=new Array();
                                                        console.log(d.rows[1].cell[0]);
                                                        for(var i=0;i<d.rows.length;i++)
                                                        {                                                            
                                                            selectedStudentsArray[i]=[d.rows[i].cell[0],                                                                                      
                                                                                      d.rows[i].cell[2],
                                                                                      d.rows[i].cell[3],d.rows[i].cell[1],];
                                                        }
                                                        }
                                                    }"
                    );
        

                    %>
                    <%: selectedGrid.GetHtml() %>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            <%: selectedGrid.GetJavaScript() %>
                            reloadSelectedStudentsGridData();                            
                        });

                        function reloadSelectedStudentsGridData() {
                            var Id = getURLParameter("id");

                            $('#selectedStudents').setGridParam({
                                postData: {
                                    id: Id
                                }
                            });
                            $("#selectedStudents").trigger("reloadGrid");
                        }
                    </script>
                    <script src="../../Scripts/jquery.jqGrid.columnFormaters.js" type="text/javascript"></script>
                    <div class="buttons" style="margin-left:0px;">
                        <button onclick="return removeSelectedStudents();">Remove</button>
                        <button onclick="removeAllSelectedStudents(); return false;">Remove All</button>
                    </div>
                </div>
                <button onclick="submitForm(); return false;" style="margin-left:50px;width:100px;height:40px;">Save</button>                
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .buttons {
            margin: 5px 5px 5px 40px;
        }

        .studentSelectionComboSpan select {
            width: 100px;
        }

        .studentSelectionComboSpan {
            margin: 5px;
        }

        .studentSelectionComboDiv {
            padding-left: 20px;
        }

        .studentSelectionGridOuterDiv {
            width: 900px;
        }

        .allStudentsGridDiv {
            float: left;
            margin: 10px;
            width: 70%;
        }

        .selectedStudentsGridDiv {
            float: left;
            margin: 10px;
            width: 25%;
        }

        .btnSave {
            height: 30px;
            font-size: 14px;
        }

        .hidden {
            display: none;
        }
    </style>
    <link href="../../Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/CSS/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link href="../../Content/CSS/Survey.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="../../Scripts/grid.locale-en.js" type="text/javascript"></script>
    <script type="text/javascript">
        var selectedStudentsArray = new Array();
        function addSelectedCheckBoxes() {
            var IdColIndex = 1;
            var LastNameColIndex = 2;
            var FirstNameColIndex = 3;
            var EnrolmentIdColIndex = 4
            var selectedIndex = selectedStudentsArray.length;
            for (var rowNo = 1; rowNo < filteredStudents.rows.length; rowNo++) {
                var checkBox = filteredStudents.rows[rowNo].cells[0].children[0];
                if (checkBox.checked == true) {
                    var StudentId = filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML;
                    var EnrollmentId = filteredStudents.rows[rowNo].cells[EnrolmentIdColIndex].innerHTML;
                    var existed = false;
                    for (var i = 0; i < selectedStudentsArray.length; i++) {
                        if (StudentId != selectedStudentsArray[i][0] && EnrollmentId == selectedStudentsArray[i][3]) {
                            existed = true;
                            break;
                        }
                    }
                    
                    if (!existed) {
                        selectedStudentsArray[selectedIndex] = [
                            filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML,
                            filteredStudents.rows[rowNo].cells[LastNameColIndex].innerHTML,
                            filteredStudents.rows[rowNo].cells[FirstNameColIndex].innerHTML,
                            filteredStudents.rows[rowNo].cells[EnrolmentIdColIndex].innerHTML];


                        jQuery("#selectedStudents").jqGrid('addRow',
                    parameters = {
                        rowID: filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML,
                        initdata: [{ StudentId: filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML, EnrollmentId: filteredStudents.rows[rowNo].cells[EnrolmentIdColIndex].innerHTML, LastName: filteredStudents.rows[rowNo].cells[LastNameColIndex].innerHTML, FirstName: filteredStudents.rows[rowNo].cells[FirstNameColIndex].innerHTML }],
                        position: "first"
                    });

                        ++selectedIndex;
                    }
                }
            }

            //$("#selectedStudents").clearGridData()
            console.log(selectedStudentsArray.length);
            var filas = jQuery("#filteredStudents").getGridParam('selarrrow');
            if (filas == null) {
                return false;
            }
            for (var i = filas.length - 1; i >= 0; i--) {
                console.log("deleteing rows " + '(length=' + filas.length + ') current: ' + filas[i]);
                jQuery("#filteredStudents").delRowData(filas[i]);
                jQuery("#filteredStudents").setSelection(filas[i]);
            }
            
            return false;
        }

        function addAllGridStudents() {
            var IdColIndex = 1
            var LastNameColIndex = 2;
            var FirstNameColIndex = 3;
            var EnrolmentColIndex = 4;
            var selectedIndex = selectedStudentsArray.length;
            for (var rowNo = 1; rowNo < filteredStudents.rows.length; rowNo++) {
                selectedStudentsArray[selectedIndex] = [
                        filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML,
                        filteredStudents.rows[rowNo].cells[LastNameColIndex].innerHTML,
                        filteredStudents.rows[rowNo].cells[FirstNameColIndex].innerHTML,
                        filteredStudents.rows[rowNo].cells[EnrolmentColIndex].innerHTML
                ];
                ++selectedIndex;

                console.log("rowId" + filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML);

                jQuery("#selectedStudents").jqGrid('addRow',
                    parameters = {
                        rowID: filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML,
                        initdata: [{
                            StudentId: filteredStudents.rows[rowNo].cells[IdColIndex].innerHTML,
                            LastName: filteredStudents.rows[rowNo].cells[LastNameColIndex].innerHTML,
                            FirstName: filteredStudents.rows[rowNo].cells[LastNameColIndex].innerHTML,
                            EnrollmentId: filteredStudents.rows[rowNo].cells[EnrolmentColIndex].innerHTML
                        }],
                        position: "first"
                    });

            }
            jQuery("#filteredStudents").clearGridData();
        }

        function removeAllSelectedStudents() {

            var filas = $("#selectedStudents").getRowData();
            if (filas == null) {
                return false;
            }
            for (var i = filas.length - 1; i >= 0; i--) {
                var startDate = $("#Terms option:selected").text();
                var program = $("#Programs option:selected").text();
                var status = $("#StudentStatusList option:selected").text();
                var enrollmentId = filas[i].EnrollmentId;
                var studentId = filas[i].StudentId;
                var firstName = filas[i].FirstName;
                var lastName = filas[i].LastName;



                jQuery("#filteredStudents").jqGrid('addRow',
                    parameters = {
                        rowID: studentId,
                        initdata: [{
                            SurveyStudentId: studentId,
                            LastName: lastName,
                            FirstName: firstName,
                            EnrollmentId: enrollmentId,
                            StartDate: startDate,
                            Program: program,
                            Status: status
                        }],
                        position: "first"
                    });
                selectedStudentsArray = null;
                jQuery("#selectedStudents").clearGridData();
            }
        }

            function removeSelectedStudents() {
                var filas = jQuery("#selectedStudents").getGridParam('selarrrow');
                if (filas == null) {
                    return false;
                }
                for (var i = filas.length - 1; i >= 0; i--) {
                    var startDate = $("#Terms option:selected").text();
                    var program = $("#Programs option:selected").text();
                    var status = $("#StudentStatusList option:selected").text();
                    var enrollmentId = jQuery("#selectedStudents ").getRowData(filas[i]).EnrollmentId;
                    var studentId = jQuery("#selectedStudents").getRowData(filas[i]).StudentId;
                    var firstName = jQuery("#selectedStudents").getRowData(filas[i]).FirstName;
                    var lastName = jQuery("#selectedStudents").getRowData(filas[i]).LastName;



                    jQuery("#filteredStudents").jqGrid('addRow',
                        parameters = {
                            rowID: studentId,
                            initdata: [{
                                SurveyStudentId: studentId,
                                LastName: lastName,
                                FirstName: firstName,
                                EnrollmentId: enrollmentId,
                                StartDate: startDate,
                                Program: program,
                                Status: status
                            }],
                            position: "first"
                        });
                    for (var j = 0; j < selectedStudentsArray.length; j++) {
                        if (selectedStudentsArray[j][0]==studentId && selectedStudentsArray[j][3]==enrollmentId)
                        {
                            selectedStudentsArray.splice(j, 1);
                        }
                    }

                    console.log("deleteing rows " + '(length=' + filas.length + ') current: ' + filas[i]);
                    jQuery("#selectedStudents").delRowData(filas[i]);
                    jQuery("#selectedStudents").setSelection(filas[i]);


                }
                return false;
            }

            function submitForm() {
                var action = document.forms['frmMain'].action;
                var StudentStatusList = document.getElementById("StudentStatusList").value;
                var Programs = document.getElementById("Programs").value;
                var Terms = document.getElementById("Terms").value;
                var StudentGroups = document.getElementById("StudentGroups").value;
                var Sessions = document.getElementById("Sessions").value;

                $.post(action, {
                    studentsArray: JSON.stringify(selectedStudentsArray),
                    id: getURLParameter("id"),
                    name: getURLParameter("name"),
                    groupId: getURLParameter("groupId"),
                    startDate: getURLParameter("startDate"),
                    daysToOpen: getURLParameter("daysToOpen"),
                    active: getURLParameter("active"),
                    StudentStatusList: StudentStatusList,
                    Programs: Programs,
                    Terms: Terms,
                    StudentGroups: StudentGroups,
                    Sessions: Sessions
                }, function (result) {
                    window.location.href = result.redirectToUrl;
                });
            }

            function getURLParameter(name) {
                return decodeURIComponent(
                    (RegExp('[?|&]' + name + '=' + '(.*?)(&|$)').exec(location.search) || [, null])[1]
                );
            }
        
    </script>
</asp:Content>
