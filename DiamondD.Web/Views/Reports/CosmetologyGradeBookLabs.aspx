<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookLab>"   Culture="auto" UICulture="auto" %>
<%@ MasterType  virtualPath="~/Views/Shared/General.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%=Master.ReportName %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="div-table">
    <div  class="DivRowwidth1000">
        <div class="DivWidth95pxRight">
            &nbsp;
        </div>
        <div class="DivWidth810Center">
    <h1><%=Master.ReportName %></h1>
    <br />
    <span class="Heading3"> <%= Html.Encode(Model.StudentName) %> </span>
    <br /> 
    <br />
     <!-- Cosmetology Grade Book Labs Table Body -->
     <table class="width100">
        <tr class="width810px">
            <td class="width105px">&nbsp;</td>
            <td class="width600px">
            
      <table id="CosmetologyGradeBookTestsTable">
            <tr class="HeadRow" align="center" valign="middle">
                   
                <td align="left" valign="middle" class="width300px">
                    <span class="Heading4"> <asp:Localize ID="lblLabDescription" runat="server" meta:resourceKey="lblLabDescription" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"> <asp:Localize ID="lblRequiredSessions" runat="server" meta:resourceKey="lblRequiredSessions" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"> <asp:Localize ID="lblCompletedSessions" runat="server" meta:resourceKey="lblCompletedSessions" /> </span>
                </td>
                <td align="right" valign="middle" class="width100px">
                    <span class="Heading4"> <asp:Localize ID="lblRemainingSessions" runat="server" meta:resourceKey="lblRemainingSessions" /> </span>
                </td>
               
            </tr>
             <% foreach (var item in Model.CosmetologyGradeBookLabs)
                {
                    double completedSessions = 0.0;
                    int requiredSessions = 0;
                    %>
               <tr align="center" valign="middle" class="width100">
                     
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
        <td class="width105px">&nbsp;</td>
        </tr>
     </table>
            </div>
        <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
    </div>

</asp:Content>
