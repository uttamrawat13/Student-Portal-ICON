<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="DiamondD.Web.Helpers" %>
<%@ Register Src="~/Views/Survey/PartialCreateQuestionGroup.ascx" TagPrefix="uc1" TagName="PartialCreateQuestionGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Questions Group
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="TitleAndNewDiv" >
            <span class="MainHeadingSpan"><h1>Select Students</h1></span> 
        </div>
    <form id="formCreatQuetionGroup" method="post" action="<%=Page.ResolveUrl(AppHelper.SurveysUrl("QuestionsGroup/Create")) %>">

        <%if (null != ViewData["ResponseMessage"])
          {%>
        <div class="serverErrorMessage"><%=ViewData["ResponseMessage"] %></div>
        <%} %>
        <uc1:PartialCreateQuestionGroup runat="server" ID="PartialCreateQuestionGroup" />
        <div class="surveyfieldrow">
                <input id="btnSubmit" class="surveySubmit" type="submit" value="Save" />
                <button onclick="window.location.href='<%=Page.ResolveUrl(AppHelper.SurveysUrl("QuestionsGroup/Master"))%>';">Cancel</button>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script src="../../Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript" >
        $(document).ready(function () {
            $("input[type=submit], button,input[type=submit]").button();
        });
        function canceled()
        {
//            var obj = { first: "John", last: "Doe" };
//}
//            Object.keys(obj).forEach(function (key) {
//                console.log(key);
//                console.log(obj[key]);
//            });
        }
    </script>
</asp:Content>

