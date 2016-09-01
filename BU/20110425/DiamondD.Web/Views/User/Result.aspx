<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="ResponseMessage" runat="server" meta:resourceKey="ResponseMessage" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mainDiv" style="vertical-align:middle"> 
        <center>
        <div id="content" style="width:41%;padding:10em 0 10em 0;">
            <% 
                if (ViewData["response"] != null && ViewData["response"].ToString() == "success")
               { %>
            <div style="border:2px solid green">
                <div style="padding:1em 0 1em 0;vertical-align:middle;width:100%;background-color:#ddeedd;height:1.5em;">
                    <label style="font-size:medium; color:Green"><b><asp:Localize ID="Success" runat="server" meta:resourceKey="Success" /></b></label>
                </div>
                <div>
                    <p style="text-align:left;margin-left:25px; color:Green"><asp:Localize ID="SuccessMsg1" runat="server" meta:resourceKey="SuccessMsg1" /></p> 
                    <p style="text-align:left;margin-left:25px;"><br/><asp:Localize ID="SuccessMsg2" runat="server" meta:resourceKey="SuccessMsg2" />
                    <a href="javascript:history.back();"><asp:Localize ID="SuccessMsg3" runat="server" meta:resourceKey="SuccessMsg3" /></a> 
                    <asp:Localize ID="SuccessMsg4" runat="server" meta:resourceKey="SuccessMsg4" />
                    </p>
                </div>
             </div>
             <%}
               else
               { %>
               <div style="border:2px solid Red ">
                <div style="padding:1em 0 1em 0;vertical-align:middle;width:100%;background-color:#FFaaaa;height:1.5em;">
                    <label style="font-size:medium; color:#FF033E"><b><asp:Localize ID="ErrorHeading" runat="server" meta:resourceKey="Failure" /></b></label>
                </div>
                <div>
                    <p style="text-align:left;margin-left:25px; color:Red"><asp:Localize ID="FailureMsg1" runat="server" meta:resourceKey="FailureMsg1" /></p> 
                    <p style="text-align:left;margin-left:25px;"><br/><asp:Localize ID="ErrorInfo2" runat="server" meta:resourceKey="FailureMsg2" />
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
