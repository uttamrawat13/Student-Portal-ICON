<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="System.Web.Helpers" %>

<script type="text/javascript">
    $(document).ready(function () {
        var emptyfailureMessage = "Can't be Empty";
        var successMessage = " ";
        var lvGroupCode = new LiveValidation("txtQuestionGroupCode", { validMessage: successMessage });
        lvGroupCode.add(Validate.Presence,
              { failureMessage: emptyfailureMessage, onlyonSubmit: true });
    });
        </script>
<link href="../../Content/CSS/jq-ui/ui-lightness/jquery-ui-1.10.3.custom.min.css"
    rel="stylesheet" type="text/css" />
        <fieldset class="surveyfieldset">
            <legend>Please fill following details</legend>
            <%:Html.Hidden("questionsGroupId", ViewData["id"])%>
            <div class="surveyfieldrow">
                <label id="labelQuestionGroupCode" class="surveyfieldtitle">
                    Questoin Group Code</label>
                    <span class="ui-widget ui-corner-all">
                <input id="txtQuestionGroupCode" name="txtQuestionGroupCode" class="surveyfieldtext ui-corner-all ui-state-default ui-widget" type="text" title="labelQuestionGroupCode" value="<%=ViewData["Code"] %>" />
                </span>
            </div>
            <div class="checkBoxes">
                <div class="surveyfieldrow">
                    <%:Html.CheckBox("cbxAdmission", (bool)ViewData["Admimssion"])%>
                    <%--<input id="cbxAdmission" name="cbxAdmission" class="surveyfieldcheckbox" type="checkbox" />--%>
                    <label id="labelAdmission" class="surveyfieldtitle">
                        Admission</label>
                </div>
                <div class="surveyfieldrow">
                <%:Html.CheckBox("cbxRegister", (bool)ViewData["Register"])%>
                    <%--<input id="cbxRegister" name="cbxRegister" class="surveyfieldcheckbox" type="checkbox" />--%>
                    <label id="labelRegister" class="surveyfieldtitle">
                        Register</label>
                </div>
                <div class="surveyfieldrow">
                <%:Html.CheckBox("cbxFinancialAid", (bool)ViewData["FinancialAid"])%>
                    <%--<input id="cbxFinancialAid" name="cbxFinancialAid" class="surveyfieldcheckbox" type="checkbox" />--%>
                    <label id="labelFinancialAid" class="surveyfieldtitle">
                        Financial Aid</label>
                </div>
                <div class="surveyfieldrow">
                <%:Html.CheckBox("cbxPlacement", (bool)ViewData["Placement"])%>
                    <%--<input id="cbxPlacement" name="cbxPlacement" class="surveyfieldcheckbox" type="checkbox" />--%>
                    <label id="labelPlacement" class="surveyfieldtitle">
                        Placement</label>
                </div>
            </div>
        </fieldset>