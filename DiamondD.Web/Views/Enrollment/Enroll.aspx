<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DiamondD.Data.DataAccess.Enrollment.CourseOffering>>" %>
<%@ Import Namespace="DiamondD.Web.Controllers" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ MasterType  virtualPath="~/Views/Shared/General.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%var report = new DiamondD.Services.Report.ReportsService().GetWebReport("CourseEnrollment");
            string reportName = String.IsNullOrEmpty(report.DisplayName) ? report.ReportName : report.DisplayName;%>


	<%=reportName %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1><%var report = new DiamondD.Services.Report.ReportsService().GetWebReport("CourseEnrollment");
            string reportName = String.IsNullOrEmpty(report.DisplayName) ? report.ReportName : report.DisplayName;%>


	<%=reportName %></h1>
    <span id="SuccessfulMsgEnroll" class="SuccessMsgDisplayNone"> <asp:Localize ID="SuccessMsgCourseEnroll" runat="server" meta:resourceKey="SuccessMsgCourseEnroll" /><br /><br /></span>
    <span id="SuccessfulMsgUnEnroll" class="SuccessMsgDisplayNone"><asp:Localize ID="SuccessMsgCourseUnEnroll" runat="server" meta:resourceKey="SuccessMsgCourseUnEnroll" /><br /><br /></span>
    
      <!---------------   Term Date Area  ---------->
         <%             
             using (Html.BeginForm("EnrollmentCourseByTerm", "Enrollment"))
                 {%>
                <asp:Localize ID="lblTermDate" runat="server" meta:resourceKey="lblTermDate" />:
                &nbsp;
                <select id="enrollmentTerms" name="enrollmentTerms" class="enrollmentTermsSelectWidth">
                    <%  
                        var enrollmentTerms = ViewData["enrollmentTerms"] as Dictionary<int, DateTime>;
                        int selectedTerm = Convert.ToInt32(Session[UserController.SessionKeyCourseOfferingTermId]);
                        if (enrollmentTerms != null)
                        {
                            foreach (var term in enrollmentTerms)
                            {
                                if (selectedTerm == term.Key)
                                {
                                    %>    
                                <option value="<%:term.Key.ToString()%>" selected="selected">&nbsp;<%:term.Value.ToString("MM/dd/yyyy")%></option>
                                <%
                                }
                                else
                                {

                                %>    
                                <option value="<%:term.Key.ToString()%>">&nbsp;<%:term.Value.ToString("MM/dd/yyyy")%></option>
                                <%
                                }
                            }
                        } %>
                </select>
                <input id="btnShow" type="submit" value="Show" meta:resourceKey="btnShow" />
                <%
                 }%>
  <br />
    <!--<div class="Width100pLeft"><span class="Heading4"><asp:Localize ID="lblEnrolledCourses" runat="server" meta:resourceKey="lblEnrolledCourses" /> </span></div>-->
<!--
    <table id="Table1" class="TranscriptTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="lblTerm" />  </span>
                </td>
                <td align="left" valign="middle" class="width165px">
                     <span class="Heading4"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="lblCourse" />  </span>
                </td>
                <td align="left" valign="middle" class="width285px">
                    <span class="Heading4"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="lblCourseInfo" />  </span>
                </td>
                <td align="left" valign="middle" class="width220px">
                    <span class="Heading4"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="lblRegistrationMessage" />  </span>
                </td>
                <td align="center" valign="middle" class="width50px">
                   <span class="Heading4"> <asp:Localize ID="Localize5" runat="server" meta:resourceKey="lblAction" />  </span>
                </td>
                
            </tr>

    <%
              
             bool IsEnrolled = false;
        if (Model != null)
        {
            var isEvenRow = false;
            foreach (var item in Model)
            {%>
    <%             if (item.EnrollmentStatus == 1)
                {
                IsEnrolled = true;
                       using (Html.BeginForm("UnEnroll", "Enrollment", FormMethod.Post))
                       {
                           if (isEvenRow)
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="evenRowStyle">
                           <%}
                           else
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="oddRowStyle">
                           <%} %>
                                                <td align="left" valign="middle">
                                                    <%:String.Format("{0:MM/dd/yyyy}", item.Term)%>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.Course); %><br />
                                                    <input type="hidden" value=" <%:item.CourseOfferingNo%>" id="Hidden1" name="CourseOfferingNo" />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.CourseInfo); %><br />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <%:item.RegistrationMessage%>
                                                </td>
                                                <td align="center" valign="middle">
                                                    <%--<%:Html.ActionLink("Enroll", "Enroll", new { id = item.CourseInfo })%> --%>
                                                    <%
                                                        var curDateTime = DateTime.Now;
                                                        var enrolledTime = item.CourseEnrolledDateTime;
                                                        if (enrolledTime == null || (curDateTime - enrolledTime.Value).TotalHours >= 1)
                                                        {%>
                                                            <input id="btnUnEnroll" type="submit" disabled="disabled" value="Un-Enroll" meta:resourceKey="btnUnEnroll"/>
                                                     <% }
                                                        else
                                                        {%>
                                                            <input id="Submit1" type="submit" value="Un-Enroll" meta:resourceKey="btnUnEnroll"/>
                                                        <%} %>
                                                </td>
                                            </tr>
                                             <%
                       }
                   }%>
    <%
            }
        }
        if(!IsEnrolled)
        {
        %>
        <tr><td colspan="5" align="left"><asp:Localize ID="NotEnrolledMsg" runat="server" meta:resourceKey="NotEnrolledMsg" /></td></tr> 
        <%
        }%>
    </table>

    <br />
    <br />
    -->

    <!--<div class="Width100pLeft"><span class="Heading4"><asp:Localize ID="lblAvailableCourses" runat="server" meta:resourceKey="lblAvailableCourses" /> </span></div>-->
    
    <table id="enrollTable" class="TranscriptTable">
            <tr class="HeadRow" align="center" valign="middle">
                <td align="left" valign="middle" class="width100px">
                    <span class="Heading4"><asp:Localize ID="lblTerm" runat="server" meta:resourceKey="lblTerm" />  </span>
                </td>
                <td align="left" valign="middle" class="width165px">
                     <span class="Heading4"><asp:Localize ID="lblCourse" runat="server" meta:resourceKey="lblCourse" />  </span>
                </td>
                <td align="left" valign="middle" class="width285px">
                    <span class="Heading4"><asp:Localize ID="lblCourseInfo" runat="server" meta:resourceKey="lblCourseInfo" />  </span>
                </td>
                <td align="left" valign="middle" class="width220px">
                    <span class="Heading4"><asp:Localize ID="lblRegistrationMessage" runat="server" meta:resourceKey="lblRegistrationMessage" />  </span>
                </td>
                <td align="center" valign="middle" class="width50px">
                   <span class="Heading4"> <asp:Localize ID="lblAction" runat="server" meta:resourceKey="lblAction" />  </span>
                </td>
                <td class="width50px"></td>
            </tr>

    <%
        bool IsCourseAvailable = false;
        if (Model != null)
        {
            var isEvenRow = false;
            foreach (var item in Model)
            {%>
    <%
                if (item.EnrollmentStatus == 0)
                {
                    IsCourseAvailable = true;
                    using (Html.BeginForm("Enroll", "Enrollment", FormMethod.Post))
                    {
                           if (isEvenRow)
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="evenRowStyle">
                           <%}
                           else
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="oddRowStyle">
                           <%} %>
                                                <td align="left" valign="middle">
                                                    <%:String.Format("{0:MM/dd/yyyy}", item.Term)%>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.Course); %><br />
                                                    <input type="hidden" value=" <%:item.CourseOfferingNo%>" id="Course" name="CourseOfferingNo" />
                                                    <input type="hidden" value=" <%:ViewData["pageNumberCurrent"]%>" id="pageNumber" name="pageNumber" />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.CourseInfo); %><br />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <%:item.RegistrationMessage%>
                                                </td>
                                                <td align="center" valign="middle">
                                                    <%--<%:Html.ActionLink("Enroll", "Enroll", new { id = item.CourseInfo })%> --%>
                                                    <%                                                        
                                                        if (item.RegistrationAllowed == 1)
                                                        {%>
                                                            <input id="btnEnroll" type="submit" class="width80px" value="Enroll" meta:resourceKey="btnEnroll" />
                                                     <% }
                                                        else
                                                        {%>
                                                            <input id="Submit2" type="submit" class="width80px" disabled="disabled" value="Enroll" meta:resourceKey="btnEnroll" />
                                                        <%} %>
                                                </td>
                                                <td>

                                                </td>
                                            </tr>
                                             <%
                    }
                }
                else
                {
                  IsEnrolled = true;
                       using (Html.BeginForm("UnEnroll", "Enrollment", FormMethod.Post))
                       {
                           if (isEvenRow)
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="evenRowStyle">
                           <%}
                           else
                           {
                               isEvenRow = !isEvenRow;
                           %>
                                            <tr class="oddRowStyle">
                           <%} %>
                                                <td align="left" valign="middle">
                                                    <%:String.Format("{0:MM/dd/yyyy}", item.Term)%>
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.Course); %><br />
                                                    <input type="hidden" value=" <%:item.CourseOfferingNo%>" id="Hidden1" name="CourseOfferingNo" />
                                                    <input type="hidden" value=" <%:ViewData["pageNumberCurrent"]%>" id="Hidden2" name="pageNumber" />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <% Response.Write(item.CourseInfo); %><br />
                                                </td>
                                                <td align="left" valign="middle">
                                                    <%:item.RegistrationMessage%>
                                                </td>
                                                <td align="center" valign="middle">
                                                    <%--<%:Html.ActionLink("Enroll", "Enroll", new { id = item.CourseInfo })%> --%>
                                                    <%
                                                        var curDateTime = DateTime.Now;
                                                        var enrolledTime = item.CourseEnrolledDateTime;
                                                        if (enrolledTime == null || (curDateTime - enrolledTime.Value).TotalHours >= 1)
                                                        {%>
                                                            <input id="btnUnEnroll" type="submit" disabled="disabled" value="Un-Enroll" meta:resourceKey="btnUnEnroll"/>
                                                     <% }
                                                        else
                                                        {%>
                                                            <input id="Submit1" type="submit" value="Un-Enroll" meta:resourceKey="btnUnEnroll"/>
                                                        <%} %>
                                                </td>
                                                <td>
                                                <% 
                                                        if (item.EnrollmentStatus == 1)
                                                        { %>
                                                            <img src="<%=Page.ResolveUrl(AppHelper.ImageUrl("check.png")) %>" alt="Enrolled" />
                                                        <%}
                                                %>                                                
                                                </td>
                                            </tr>
                                             <%
                       }
                   }  
                }%>
    <%
            
        }
        if (!IsCourseAvailable)
            {
%>
           <tr><td colspan="5" align="left"><asp:Localize ID="NotCourseAvailabeMsg" runat="server" meta:resourceKey="NotCourseAvailabeMsg" /></td></tr> 
        <%
            }
        %>

    </table>
    <div class="EnrollmentHeadRow">&nbsp;
                <!--<input type="submit" value="" style="background-image:url(../../Content/Images/first.png); " />-->

                <a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("List/Page/1")) %>"> <img class="pagingNavigation" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("first.png")) %>" /></a>
                <a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("List/Page/"+ViewData["pageNumberPrev"])) %>"> <img class="pagingNavigation" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("prev.png")) %>" /></a>
                <a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("List/Page/"+ViewData["pageNumberNext"])) %>"> <img class="pagingNavigation" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("next.png")) %>" /></a>
                <a href="<%= Page.ResolveUrl(AppHelper.EnrollmentUrl("List/Page/"+ViewData["pageNumberLast"])) %>"><img class="pagingNavigation" src="<%=Page.ResolveUrl(AppHelper.ImageUrl("last.png")) %>" /></a>
                <div class="divAlignVertical"><% Response.Write("  Page <b>" + ViewData["pageNumberCurrent"] + "</b> of <b>" + ViewData["pageNumberLast"] + "</b>  "); %></div>
    </div>
        
<% 
    if (ViewData["successMsgEnroll"] != null && ViewData["successMsgEnroll"].ToString() == "1")
   { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsgEnroll").style.display = "inline";
</script>
<%
       ViewData["successMsgEnroll"] = "0";
   }
   else { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsgEnroll").style.display = "none";
</script>
<% } %>


<% if (ViewData["successMsgUnEnroll"] != null && ViewData["successMsgUnEnroll"].ToString() == "1")
   { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsgUnEnroll").style.display = "inline";
</script>
<%
       ViewData["successMsgUnEnroll"] = "0";
   }
   else { %>
<script language="javascript" type="text/javascript">
    document.getElementById("SuccessfulMsgUnEnroll").style.display = "none";
</script>
<% } %>
</asp:Content>

