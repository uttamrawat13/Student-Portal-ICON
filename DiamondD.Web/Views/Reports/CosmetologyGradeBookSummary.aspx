<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookSummary>" Culture="auto" UICulture="auto" %>
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
    <div class="DivWidth100Left">
    <table class="width100">
        <tr class="width810px">
            <td class="width265px">&nbsp;</td>
            <td class="width230px">
     <!-- Cosmetology Grade Book Summary Table Body -->
     <% foreach (var item in Model.CosmetologyGradeBookSummaries)
     { %>
     <table id="AccumulativeGPA" border="1px solid black" cellspacing="0" cellpadding="0">
            <tr  align="right" valign="middle" class="width280px">
                <td align="left" valign="middle" class="TablePaddingWidth200px">
                      <asp:Localize ID="lblAccumulativeGPA" runat="server" meta:resourceKey="lblAccumulativeGPA" />
                </td>
                <td align="right" valign="middle" class="TablePaddingWidth80px">
                    <% double accumulaticeGPA = 0.0; 
                              if(double.TryParse(item.GradeBookGPA.ToString(),out accumulaticeGPA))
                              {
                                  Response.Write(accumulaticeGPA.ToString("0.00") + "%");
                              }
                              else
                              {
                                  Response.Write("-");
                              }
                           %>
                </td>
            </tr>
        </table>
        <br />
     <table id="Table2" border="1px solid black" cellspacing="0" cellpadding="0" >
            <tr  align="right" valign="middle" class="width280px">
                 <td align="left" valign="middle" class="TablePaddingWidth200px">
                      <asp:Localize ID="lblScheduledHours" runat="server" meta:resourceKey="lblScheduledHours" />
                </td>
                <td align="right" valign="middle" class="TablePaddingWidth80px">
                    <% double scheduledHours = 0.0;
                       if (double.TryParse(item.TotalScheduled.ToString(), out scheduledHours))
                              {
                                  Response.Write(scheduledHours.ToString("0.00"));
                              }
                            else
                            {
                                Response.Write("-");
                            }
                           %> 
                </td>
            </tr>
            <tr  align="right" valign="middle" class="width280px">
                 <td align="left" valign="middle" class="TablePaddingWidth200px">
                      <asp:Localize ID="lblAttendedHours" runat="server" meta:resourceKey="lblAttendedHours" />
                </td>
                <td align="right" valign="middle" class="TablePaddingWidth80px">
                    <% double attendedHours = 0.0;
                       if (double.TryParse(item.TotalAttended.ToString(), out attendedHours))
                              {
                                  Response.Write(attendedHours.ToString("0.00"));
                              }
                           else
                           {
                               Response.Write("-");
                           }
                           %> 
                </td>
            </tr>
            <tr  align="right" valign="middle" class="width280px">
                 <td align="left" valign="middle" class="TablePaddingWidth200px">
                      <asp:Localize ID="lblAttendancePercentage" runat="server" meta:resourceKey="lblAttendancePercentage" />
                </td>
                <td align="right" valign="middle" class="TablePaddingWidth80px">
                    <% double attendancePercentage = 0.0;
                       if (double.TryParse(item.AttendancePercentage.ToString(), out attendancePercentage))
                              {
                                  Response.Write((attendancePercentage * 100).ToString("0.00") + "%");
                              }
                           else
                           {
                               Response.Write("-");
                           }
                           %> 
                </td>
            </tr>
        </table>
        <br />
    <table id="Table1" border="1px solid black" cellspacing="0" cellpadding="0" >
        <tr  align="right" valign="middle" class="width280px">
                 <td align="left" valign="middle" class="width200px" class="TablePadding">
                      <asp:Localize ID="lblTransferHours" runat="server" meta:resourceKey="lblTransferHours" />
                </td>
                <td align="right" valign="middle" class="TablePaddingWidth80px">
                    <% double transferHours = 0.0;
                       if (double.TryParse(item.TotalTransferHours.ToString(), out transferHours))
                              {
                                  Response.Write(transferHours.ToString("0.00"));
                              }
                           else
                           {
                               Response.Write("-");
                           }
                           %> 
                </td>
            </tr>
        <tr  align="right" valign="middle" class="width280px">
             <td align="left" valign="middle" class="width200px" class="TablePadding">
                  <asp:Localize ID="lblTotalRequiredHours" runat="server" meta:resourceKey="lblTotalRequiredHours" />
            </td>
            <td align="right" valign="middle" class="TablePaddingWidth80px">
                <% double totalRequiredHours = 0.0;
                   if (double.TryParse(item.TotalRequiredHours.ToString(), out totalRequiredHours))
                            {
                                Response.Write(totalRequiredHours.ToString("0.00"));
                            }
                       else
                       {
                           Response.Write("-");
                       }
                        %> 
            </td>
        </tr>
        <tr  align="right" valign="middle" class="width280px">
             <td align="left" valign="middle" class="width200px" class="TablePadding">
                  <asp:Localize ID="lblTotalHoursRemaining" runat="server" meta:resourceKey="lblTotalHoursRemaining" />
            </td>
            <td align="right" valign="middle" class="TablePaddingWidth80px">
                <% double totalHoursRemaining = 0.0;
                   if (double.TryParse(item.TotalHoursRemaining.ToString(), out totalHoursRemaining))
                   {
                       Response.Write(totalHoursRemaining.ToString("0.00"));
                   }
                   else
                   {
                       Response.Write("-");
                   }
                        %> 
            </td>
        </tr>
    </table>
    <%} %>
    </td>
        <td class="width265px">&nbsp;</td>
        </tr>
     </table>
    </div>
                </div>
        <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
    </div>
</asp:Content>
