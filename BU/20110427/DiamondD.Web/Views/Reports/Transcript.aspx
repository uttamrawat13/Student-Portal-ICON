<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.StudentTranscript.Transcript>" Culture="auto" UICulture="auto"%>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleTranscript" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
   <div class="div-table">
    <div  class="div-table-row" style="width:1000px">
        <div class="div-table-col" style="width:95px; text-align:right;">
            &nbsp;
        </div>
        <div class="div-table-col" style="width:810px; text-align:center;">
        
          <h1><asp:Localize ID="lblStudentAcademics" runat="server" meta:resourceKey="lblStudentAcademics" /></h1>
        <br />
        <div style="text-align:center;">
        <span class="Heading3"><%= Html.Encode(Model.StudentName) %></span>
        </div>
        <br />
       <br />
       <table id="TranscriptTable" class="TranscriptTable">
            <tr class="HeadRow" align="center" valign="middle" style="width:100%">
                <td align="left" valign="middle" style="width:150px">
                    <span class="Heading4"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="lblCourse" />  </span>
                </td>
                <td align="left" valign="middle" style="width:230px">
                    <span class="Heading4"><asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" />  </span>
                </td>
                <td align="right" valign="middle" style="width:100px">
                    <span class="Heading4"><asp:Localize ID="lblGrade" runat="server" meta:resourceKey="lblGrade" />  </span>
                </td>
                <td align="right" valign="middle" style="width:80px">
                    <span class="Heading4"><asp:Localize ID="lblUnitsAttempted" runat="server" meta:resourceKey="lblUnitsAttempted" />  </span>
                </td>
                <td align="right" valign="middle" style="width:80px">
                    <span class="Heading4"><asp:Localize ID="lblUnitsCompleted" runat="server" meta:resourceKey="lblUnitsCompleted" />  </span>
                </td>
                <td align="right" valign="middle" style="width:70px">
                    <span class="Heading4" style=" font-style:italic;"><asp:Localize ID="lblGPA" runat="server" meta:resourceKey="lblGPA" />  </span>
                </td>
            </tr>
            <% 
                var cumulativeUnitsAttempted = 0.0;
                var cumulativeUnitsCompleted = 0.0;
                var gpaValue = 0.0;
                var gpaWeight = 0.0;
                var gpa = "";
                
                foreach (var term in Model.Terms)
                { 
             %>
               <tr align="left" id="Term" valign="middle" style="width:100%">
                <td align="left" valign="middle" colspan="2">
                    <span class="Heading4"><asp:Localize ID="lblTerm" runat="server" meta:resourceKey="lblTerm" />  
                    &nbsp;<%= Html.Encode(string.Format("{0:MM/dd/yyyy}", term.StartDate))%> </span>
                </td>
                
                <td align="center" valign="middle">
                    &nbsp;
                </td>
                <td align="center" valign="middle">
                    &nbsp;
                </td>
                <td align="center" valign="middle">
                    &nbsp;
                </td>
                <td align="center" valign="middle">
                    &nbsp;
                </td>
            </tr>
                <%foreach(var course in term.Courses)
                  {               
                %>
                  <tr align="center" valign="middle" style="width:100%">
                    <td align="left" valign="top">
                         <span>&nbsp; <%= Html.Encode(course.Code)%> </span>
                    </td>
                    <td align="left" valign="top" >
                        <span> <%= Html.Encode(course.Description)%>  </span>
                    </td>
                    <td align="right" valign="top" >
                        <span> <%= Html.Encode(course.Grade)%>  </span>
                    </td>
                   
                    <td align="right" valign="top" >
                        <span> <% Response.Write(string.Format("{0:0.00}", course.UnitsAttempted));%>  </span>
                    </td>
                    <td align="right" valign="top">
                        <span> <% Response.Write(string.Format("{0:0.00}", course.UnitsCompleted));%>  </span>
                    </td>
                    <td align="left" valign="top" >
                        <span> &nbsp;  </span>
                    </td>
                  </tr>
                  
                  <%
                        gpaValue += course.GpaValue;
                        gpaWeight += course.GpaWeight;
                  } 
                  %>
                  <tr align="center" valign="middle" style="width:100%">
                    <td align="right" valign="top" colspan="3"> 
                         <span><asp:Localize ID="lblTermTotals" runat="server" meta:resourceKey="lblTermTotals" />  </span>
                    </td>
                   
                    <td align="right" valign="top" >
                        <span> <% 
                                Response.Write(string.Format("{0:0.00}", term.UnitsAttempted));
                                cumulativeUnitsAttempted += term.UnitsAttempted;
                               %>  </span>
                    </td>
                    <td align="right" valign="top" >
                        <span> <% 
                                Response.Write(string.Format("{0:0.00}",term.UnitsCompleted));
                                cumulativeUnitsCompleted += term.UnitsCompleted;
                               %> </span>
                    </td>
                    <td align="right" valign="top" >
                        <span> <% var termGpa = term.Gpa;
                                  if (!double.IsNaN(termGpa))
                                  {
                                      Response.Write(string.Format("{0:0.00}", termGpa));
                                  }
                                  else
                                      Response.Write("-");
                                    %>  </span>
                                      
                    </td>
                  </tr>
                  <tr align="center" valign="middle" style="width:100%">
                    <td align="right" valign="top" colspan="3"> 
                         <span><asp:Localize ID="lblCumulativeTotals" runat="server" meta:resourceKey="lblCumulativeTotals" />  </span>
                    </td>
                   
                    <td align="right" valign="top">
                        <span><% Response.Write(string.Format("{0:0.00}", cumulativeUnitsAttempted)); %>   </span>
                    </td>
                    <td align="right" valign="top">
                        <span> <% Response.Write(string.Format("{0:0.00}", cumulativeUnitsCompleted)); %> </span>
                    </td>
                    <td align="right" valign="top">
                        <span> <%                     
                    if (gpaWeight != 0)
                    {
                        gpa = string.Format("{0:0.00}", gpaValue / gpaWeight);
                    }
                    else
                    {
                        gpa = "-";
                    }
                    Response.Write(gpa);                    
                    %>  
                        </span>
                    </td>
                  </tr>
            <%} %>
            <tr>
                <td colspan="4">
                    <br />
                    <br />
                </td>
            </tr>
            <tr align="left" valign="middle" style="width:100%">
                <td align="right" valign="top" colspan="3">
                <span class="Heading4"><asp:Localize ID="lblStudentAcademicsTotal" runat="server" meta:resourceKey="lblStudentAcademicsTotal" /></span>
                </td>
                <td align="right" valign="top">
                <span class="Heading4"> <%= cumulativeUnitsAttempted.ToString("0.00") %></span>
                </td>
                <td align="right" valign="top">
                <span class="Heading4"><%= cumulativeUnitsCompleted.ToString("0.00")%></span>
                </td>
                <td align="right" valign="top">
                    <span class="Heading4"><%= gpa%></span>
                </td>
            </tr>
       </table>
    
            </div>
        <div class="div-table-col" style="width:180px; text-align:right;">
            &nbsp;
        </div>

    </div>
    </div>
</asp:Content>
