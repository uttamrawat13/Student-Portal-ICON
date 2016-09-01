<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="lblHeading" ContentPlaceHolderID="TitleContent" runat="server" meta:resourceKey="lblHeading" />

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <h2><asp:Localize ID="lblErrorDetail" runat="server" meta:resourceKey="lblErrorDetail" /></h2>
    <input type="button" value="Go Back" onclick="history.back();" />
    <br />
    <br />
    </center>
</asp:Content>
