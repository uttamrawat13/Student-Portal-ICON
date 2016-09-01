<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.MainMenuControl" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ Register TagPrefix="StuMenu" TagName="Menu" Src="~/Controls/StudentMenuControl.ascx" %>
<%@ Register TagPrefix="AdminMenu" TagName="Menu" Src="~/Controls/AdminMenuControl.ascx" %>

        <% if (Session[DiamondD.Web.Controllers.UserController.SessionKeyRole].Equals("Student"))
            {%>
               <StuMenu:Menu ID="studentMenu" runat="server" />
            <%} 
                else
            {%>
                <AdminMenu:Menu ID="AdminMenu" runat="server" />
            <%}%>
