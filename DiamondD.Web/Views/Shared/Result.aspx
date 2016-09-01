<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="DiamondD.Web.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="ResponseMessage" runat="server" meta:resourceKey="ResponseMessage" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mainDiv" class="valignMiddle"> 
        <center>
        <div id="content" class="DivWidth41Padding">
            <% 
                if (ViewData["response"] != null && ViewData["response"].ToString().Equals(ResponseType.Success.ToString()))
               { %>
            <div class="DivBorderSolidGreen">
                <div class="DivWidth100HeightMiddlePaddingColor">
                    <label class="DivFontMediumGreen"><b><asp:Localize ID="Success" runat="server" meta:resourceKey="Success" /></b></label>
                </div>
                <div>
                    <p class="DivLeftGreen"><asp:Localize ID="SuccessMsg1" runat="server" meta:resourceKey="SuccessMsg1" /></p> 
                    <p class="DivLeftMarginLeft"><br/><asp:Localize ID="SuccessMsg2" runat="server" meta:resourceKey="SuccessMsg2" />
                    <a href="javascript:history.back();"><asp:Localize ID="SuccessMsg3" runat="server" meta:resourceKey="SuccessMsg3" /></a> 
                    <asp:Localize ID="SuccessMsg4" runat="server" meta:resourceKey="SuccessMsg4" />
                    </p>
                </div>
             </div>
             <%}
               else
               { %>
               <div class="DivBorder2pxSolidRed">
                <div class="DivWidth100HeightPaddingCenter">
                    <label class="DivFontMediumColor"><b><asp:Localize ID="ErrorHeading" runat="server" meta:resourceKey="Failure" /></b></label>
                </div>
                <div>
                    <p class="DivLeftMarginColorRed"><asp:Localize ID="FailureMsg1" runat="server" meta:resourceKey="FailureMsg1" /></p> 
                    <p class="DivLeftMarginLeft"><br/><asp:Localize ID="ErrorInfo2" runat="server" meta:resourceKey="FailureMsg2" />
                    <a href="javascript:history.back();"><asp:Localize ID="ErrorInfo3" runat="server" meta:resourceKey="FailureMsg3" /></a>
                    <asp:Localize ID="ErrorInfo4" runat="server" meta:resourceKey="FailureMsg4" /></p>
                </div>
             </div>
               
             <% } 
                %>
                 
        </div> 
        </center>
        </div>
</asp:Content>
