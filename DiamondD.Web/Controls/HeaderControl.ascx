<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderControl.ascx.cs" Inherits="DiamondD.Web.Controls.HeaderControl" %>
                <div class="Height60pxMiddle">
                    <br />
                    <span class="h1_GreenShad">&nbsp;&nbsp;
                      <%   if(ViewState["TitleMsg"] !=null)
                        {%>
                     <%= ViewState["TitleMsg"].ToString() %></span>
                     <% }%>
                </div>
              
