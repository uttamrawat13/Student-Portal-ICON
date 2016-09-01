<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.CosmetologyGradeBook.StudentCosmetologyGradeBookSummary>" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleMsgCosmetologyGradeBookSummary" />
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
    <div style=" text-align:left; width:100%">
    <table style="width:100%">
        <tr style="width:810px;">
            <td style="width:265px;">&nbsp;</td>
            <td style="width:230px;">
     <!-- Cosmetology Grade Book Summary Table Body -->
     <% foreach (var item in Model.cosmetologyGradeBookSummaries)
     { %>
     <table id="AccumulativeGPA" border="1px solid black" cellspacing="0" cellpadding="0">
            <tr  align="right" valign="middle" style="width:280px">
                <td align="left" valign="middle" style="width:200px" class="TablePadding">
                      <asp:Localize ID="lblAccumulativeGPA" runat="server" meta:resourceKey="lblAccumulativeGPA" />
                </td>
                <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
            <tr  align="right" valign="middle" style="width:280px">
                 <td align="left" valign="middle" style="width:200px" class="TablePadding">
                      <asp:Localize ID="lblScheduledHours" runat="server" meta:resourceKey="lblScheduledHours" />
                </td>
                <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
            <tr  align="right" valign="middle" style="width:280px">
                 <td align="left" valign="middle" style="width:200px" class="TablePadding">
                      <asp:Localize ID="lblAttendedHours" runat="server" meta:resourceKey="lblAttendedHours" />
                </td>
                <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
            <tr  align="right" valign="middle" style="width:280px">
                 <td align="left" valign="middle" style="width:200px" class="TablePadding">
                      <asp:Localize ID="lblAttendancePercentage" runat="server" meta:resourceKey="lblAttendancePercentage" />
                </td>
                <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
        <tr  align="right" valign="middle" style="width:280px">
                 <td align="left" valign="middle" style="width:200px" class="TablePadding">
                      <asp:Localize ID="lblTransferHours" runat="server" meta:resourceKey="lblTransferHours" />
                </td>
                <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
        <tr  align="right" valign="middle" style="width:280px">
             <td align="left" valign="middle" style="width:200px" class="TablePadding">
                  <asp:Localize ID="lblTotalRequiredHours" runat="server" meta:resourceKey="lblTotalRequiredHours" />
            </td>
            <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
        <tr  align="right" valign="middle" style="width:280px">
             <td align="left" valign="middle" style="width:200px" class="TablePadding">
                  <asp:Localize ID="lblTotalHoursRemaining" runat="server" meta:resourceKey="lblTotalHoursRemaining" />
            </td>
            <td align="right" valign="middle" style="width:80px" class="TablePadding">
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
        <td style="width:265px;">&nbsp;</td>
        </tr>
     </table>
    </div>
                </div>
        <div class="div-table-col" style="width:96px; text-align:right;">
            &nbsp;
        </div>

    </div>
    </div>
</asp:Content>
