<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterControl.ascx.cs" Inherits="DiamondD.Web.Controls.HeaderControl" %>
<asp:Label ID="lblFooter1" CssClass="Heading5" runat="server" meta:resourceKey="lblFooter1"></asp:Label>
<asp:Label ID="lblAppVersion" CssClass="Heading5" runat="server"><%: ConfigurationManager.AppSettings["AppVersion"].ToString() %></asp:Label>
<asp:Label ID="lblFooter2" CssClass="Heading5" runat="server" meta:resourceKey="lblFooter2"></asp:Label>
