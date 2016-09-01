<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table class="width100">

<tr valign="top" align="center" class="width100">
        
        <td valign="top" align="left" class="width800px">
        <h1>
            welcome
        </h1>
        </td>
        
        <td valign="top" align="center" class="width200px">
        &nbsp;
        </td>
        
        <td valign="top" align="center" class="width200px">
        &nbsp;
        </td>
    </tr>
    
    <tr>

        <td valign="top" align="left" class="width800px">
        
        
        <% if (ViewData["WelcomeMsg"] != null)
           {
               string welcomeMsg = ViewData["WelcomeMsg"].ToString();
               string remainingString = welcomeMsg.Replace("\r\n", "<br/>");

               Response.Write(remainingString);
           }
           %> 
        
        
        </td>

        <td>
        &nbsp;
        </td>
        
        <td>
        &nbsp;
        </td>
    
    </tr>

</table>

</asp:Content>
