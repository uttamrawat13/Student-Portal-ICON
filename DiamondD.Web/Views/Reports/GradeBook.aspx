<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.GradeBook.StudentGradeBook>"  Culture="auto" UICulture="auto" %>
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
        <span class="Heading3"> <%=Model.StudentName%></span>
        <br /> 
        <br />
        
        <!---------------   Term Date Area  ---------->
         <%             
                 using (Html.BeginForm(/*"StudentGradeBookByTerm", "Reports"*/))
                 {%>
                <asp:Localize ID="lblTermDate" runat="server" meta:resourceKey="lblTermDate" />:
                &nbsp;
                <%
                     if (ViewData["TermsDateList"] == null)
                     {%>
                       <select>
                        <option><asp:Localize ID="lblNoDataFound" runat="server" meta:resourceKey="lblNoDataFound" /></option>
                       </select>  
                     <%
                     }
                     else
                     {%>
                         <%=Html.DropDownList("listTermDate", (SelectList) ViewData["TermsDateList"],
                                           new {style = "width: 150px;"})%>
                    <% }%>
                <input id="btnShow" type="submit" value="Show" meta:resourceKey="btnShow" />
                <%
                 }%>
    <br />
    <!-- Grade Book Table Body -->
    <table id="GradeBook">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width160px">
                    <span class="Heading4"> <asp:Localize ID="lblTerms" runat="server" meta:resourceKey="lblTerms" /> </span>
                </td>
                <td align="left" valign="middle" class="width200px">
                    <span class="Heading4"><asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" /></span>
                </td>
                <td align="left" valign="middle" class="width270px">
                    <span class="Heading4"><asp:Localize ID="lblDescription" runat="server" meta:resourceKey="lblDescription" /></span>
                </td>
                 <td align="right" valign="middle" class="width90px">
                    <span class="Heading4"><asp:Localize ID="lblStudentPoints" runat="server" meta:resourceKey="lblStudentPoints" />  </span>
                </td>
                <td align="right" valign="middle" class="width90px">
                    <span class="Heading4"><asp:Localize ID="lblTotalPoints" runat="server" meta:resourceKey="lblTotalPoints" />  </span>
                </td>
            </tr>

            <%
                if (ViewData["TermsDateList"] != null)
                {
                    //bool firstRow = true;
                    //string courseDescription = "";
                    double  percentageToDisplay = 0.0;
                    string message = "";
                    
                    double sumStudentPoints = 0.0;
                    double sumTotalPoints = 0.0;
                    double percentage = 0.0;
                    
                    double sumCurrentWeightedStudentPoints = 0.0;
                    double sumCurrentWeightedTotalPoints = 0.0;
                    double percentageTotalPoints = 0.0;
                    foreach (var item in Model.studentGradeBook)
                    {
                        /*
                        if (!firstRow && courseDescription != item.CourseOfferingDescription)
                        {
                            firstRow = true;
                            courseDescription = item.CourseOfferingDescription;

                            // Here code of percentage

                            if (sumCurrentWeightedTotalPoints > 0)
                            {
                                percentageTotalPoints = (sumCurrentWeightedStudentPoints/sumCurrentWeightedTotalPoints)*
                                                        100;
                            }

                        <tr class="width100">
                            <td colspan="5">
                                  <hr />   
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" colspan="5">
                            <div class="DivMarginTop8px" >
                                  <%
                            Response.Write(percentageTotalPoints + "%"); </div>
                                 <br /><br />
                            </td>
                        </tr> 

                            <%
                            percentageTotalPoints = 0.0;
                            sumCurrentWeightedStudentPoints = 0.0;
                            sumCurrentWeightedTotalPoints = 0.0;
                        }*/
                        sumStudentPoints += item.StudentPoints;
                        sumTotalPoints += item.Totalpoints;
                        sumCurrentWeightedStudentPoints += item.CurrentWeightedStudentPoints;
                        sumCurrentWeightedTotalPoints += item.CurrentWeightedTotalPoints;
%>
            <tr>
                <td align="left" valign="middle">
                   <%
                        string termDate = string.Format("{0:MM/dd/yyyy}", item.TermBeginDate);
                        Response.Write(termDate);%>
                </td>
                <td align="left" valign="middle">
                    <%=Html.Encode(item.CourseOfferingDescription)%>
                </td>
                <td align="left" valign="middle">
                    <%=Html.Encode(item.GradeItem)%>
                </td>
                 <td align="right" valign="middle">
                    <%=Html.Encode(item.StudentPoints)%>
                </td>
                <td align="right" valign="middle">
                    <%=Html.Encode(item.Totalpoints)%>
                </td>
            </tr>
                           <%
                        //if (firstRow)
                        //{
                        //    firstRow = false;
                        //    courseDescription = item.CourseOfferingDescription;

                        //}
                    }

                    //if (!firstRow)
                    //{
                        //firstRow = true;
                        // Here code of percentage

                        if (sumCurrentWeightedTotalPoints > 0)
                        {
                            percentageTotalPoints = (sumCurrentWeightedStudentPoints / sumCurrentWeightedTotalPoints)*100;
                        }

                        if (sumTotalPoints > 0)
                        {
                            percentage = (sumStudentPoints / sumTotalPoints) * 100;
                        }

                        if ((bool)ViewData["IsGradeBookWeighted"] == true)
                        {
                            percentageToDisplay = percentage;
                            message = "<i>(Percentage is based on weighted grades)</i>  ";
                        }
                        else
                        {
                            percentageToDisplay = percentageTotalPoints;
                        }
%>
                        <tr>
                            <td colspan="5">
                                  <hr />   
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle" colspan="5"><div class="DivMarginTop8px" >
                                  <%
                                    Response.Write(message + percentageToDisplay + "%<br/>");%> </div>
                                  <br />
                            </td>
                        </tr> 

                            <%
                    //}

%>
           
             <tr>
                <td align="left" colspan="5">
                <br />
                   <span class="italic">  
                   <!-- Total Percentage -->
                   </span>
                </td>
            </tr>
        <%
        } // Model empty check
        %>

         </table>

         <br />
         <br />
         <br />
         <br />
         <br />
        <div class="width100Left">
        <%
            if (ViewData["TermsDateList"] != null)
                Response.Write(DateTime.Now);
        %>
        </div>
        </div>
            <div class="DivColumnWidth96Right">
            &nbsp;
        </div>

    </div>
    </div>
    
</asp:Content>

