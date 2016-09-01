<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenuControl.ascx.cs" Inherits="DiamondD.Web.Controls.MainMenuControl" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ Register TagPrefix="AdminMenu" TagName="Menu" Src="~/Controls/AdminMenuControl.ascx" %>
<%@ Register TagPrefix="StuMenu" TagName="Menu" Src="~/Controls/StudentMenuControl.ascx" %>

        <% 
            object role = Session[DiamondD.Web.Controllers.UserController.SessionKeyRole];
            if (null != role && role.ToString().Equals("Student"))
            {
                %>
               <StuMenu:Menu ID="studentMenu" runat="server" />
            <%}
            else if (null != role && role.ToString().Equals("Admin"))
            {
                %>
                <AdminMenu:Menu ID="AdminMenu" runat="server" />
            <%
                }
                %>
