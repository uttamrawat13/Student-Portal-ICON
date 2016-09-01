<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomGrid.ascx.cs" Inherits="DiamondD.Web.Views.Shared.CustomGrid" %>
<%@ Import Namespace="System.Reflection" %>

<% dynamic data = ViewData["GridData"];
   %>
<%
    List<string> ColumnsTitles=new List<string>(); 
   foreach (var prop in data[0].GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public))
   {
       ColumnsTitles.Add(prop.Name);
   }
    %>
<table class="grid">
    <%foreach (var row in data)
      {
          %>
    <tr>
       <%
          foreach (var column in ColumnsTitles)
          {
                            
          }
            %>
    </tr>
    <%          
      } %>    
</table>