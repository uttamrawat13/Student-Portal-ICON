<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookLab>"   Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgCosmetologyGradeBookLabs" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
    <h1><asp:Localize ID="lblHeading" runat="server" meta:resourceKey="lblHeading" /></h1>
    <br />
    <span class="Heading3"> <%= Html.Encode(Model.StudentName) %> </span>
    <br /> 
    <br />
     <!-- Cosmetology Grade Book Labs Table Body -->
     <table style="width:100%">
        <tr style="width:810px;">
            <td style="width:105px;">&nbsp;</td>
            <td style="width:600px;">
            
      <table id="CosmetologyGradeBookTestsTable">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                   
                <td align="left" valign="middle" style="width:300px">
                    <span class="Heading4"> <asp:Localize ID="lblLabDescription" runat="server" meta:resourceKey="lblLabDescription" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"> <asp:Localize ID="lblRequiredSessions" runat="server" meta:resourceKey="lblRequiredSessions" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"> <asp:Localize ID="lblCompletedSessions" runat="server" meta:resourceKey="lblCompletedSessions" /> </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"> <asp:Localize ID="lblRemainingSessions" runat="server" meta:resourceKey="lblRemainingSessions" /> </span>
                </td>
               
            </tr>
             <% foreach (var item in Model.cosmetologyGradeBookLabs)
                {
                    double completedSessions = 0.0;
                    int requiredSessions = 0;
                    %>
               <tr align="center" valign="middle" style="width:100%">
                     
                     <td align="left" valign="middle">
                        <span > <%= Html.Encode(item.Description)%> </span>
                    </td>
                    <td align="right" valign="middle">
                        <span > <% if (int.TryParse(item.RequiredSessions.ToString(), out requiredSessions))
                                   {
                                       Response.Write(requiredSessions.ToString());
                                   } 
                                    %></span>
                    </td>
                    <td align="right" valign="middle">
                        <span ><% 
                                if (double.TryParse(item.CompletedSessions.ToString(), out completedSessions))
                                  {
                                      Response.Write(completedSessions.ToString("0"));    
                                  } 
                               %> </span>
                    </td>
                    <td align="right" valign="middle">
                        <span ><%  if (double.TryParse(item.CompletedSessions.ToString(), out completedSessions) && int.TryParse(item.RequiredSessions.ToString(), out requiredSessions))
                                   {
                                       int completeSessions = Convert.ToInt32(completedSessions);
                                       double remainingSessions = requiredSessions - completedSessions;

                                       if (remainingSessions >= 0)
                                       {
                                           Response.Write(remainingSessions.ToString());
                                       }
                                       else
                                       {
                                           Response.Write("-");
                                       }
                                   }
                                   %></span>
                    </td>
                    
               </tr>
                <%} %>
        </table>
        </td>
        <td style="width:105px;">&nbsp;</td>
        </tr>
     </table>
            </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
    </div>

</asp:Content>
