<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsg" />
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= ViewData["ErrorMessage"] %>
        <br />
        <br />
       <asp:Localize ID="lblErrorMsg" runat="server" meta:resourceKey="lblErrorMsg" />
    </h2>
</asp:Content>
