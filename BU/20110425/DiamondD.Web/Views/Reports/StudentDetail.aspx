<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage" Culture="auto" UICulture="auto" %>
<%@ Import Namespace="DiamondD.Web.Helpers"%>
<%@ Register TagPrefix="LeftSide" TagName="Report" Src="~/Controls/ReportMenuControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <asp:Localize ID="lblTitleMsg" runat="server" meta:resourceKey="lblTitleStudentDetail" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form id="studentDetail" runat="server">
    <h1><asp:Localize ID="lblHeading" runat="server" meta:resourceKey="lblHeading" /></h1>
    <span class="Heading3"><asp:Localize ID="lblSubHeading" runat="server" meta:resourceKey="lblSubHeading" /></span>
    <br />
    <br />
    <hr />
    <div class="div-table">
    <div  class="div-table-row" style="width:100%">
        <div class="div-table-col" style="width:500px; text-align:left;">
        <span class="Heading1"><asp:Localize ID="lblStudentDetial" runat="server" meta:resourceKey="lblTitleStudentDetail" /></span>
        <br />
        </div>
        <div class="div-table-col" style="width:390px; text-align:right;">
            <span class="Heading4">Your School Name</span>
            <br />
            &nbsp;123 Some Place Woodlake, HI 99999
            <br />
            &nbsp;Phone &nbsp;&nbsp;(555) 555 - 5555
        </div>
    </div>
    </div>
    <div id="StudentDetailDiv" style="width:100%">
        <span class="Heading4">Achille, Crystal</span>
        <br />
        &nbsp;7040 Colonial Rd. Apt#4-B Anaheim, HI 99999
	    <br />
	    <hr />
	    <div class="div-table">
            <div  class="div-table-row" style="width:100%">
                <div class="div-table-col" style="width:12%; text-align:left;">
                    <span class="Heading6"><asp:Localize ID="lblID" runat="server" meta:resourceKey="lblID" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                2006B964
                </div>
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"><asp:Localize ID="lblGroup" runat="server" meta:resourceKey="lblGroup" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                MOAD
                </div>
                
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"><asp:Localize ID="lblPhone" runat="server" meta:resourceKey="lblPhone" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                (555) 555 - 5555
                </div>
            </div>
            <div  class="div-table-row" style="width:100%">
                <div class="div-table-col" style="width:12%; text-align:left;">
                    <span class="Heading6"><asp:Localize ID="lblFirstTerm" runat="server" meta:resourceKey="lblFirstTerm" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                11/29/2007
                </div>
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"><asp:Localize ID="lblDateofBirth" runat="server" meta:resourceKey="lblDateofBirth" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                3/27/1968
                </div>
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"><asp:Localize ID="lblProgram" runat="server" meta:resourceKey="lblProgram" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                Medical Office Assistant
                </div>
            </div>
            <div  class="div-table-row" style="width:100%">
                <div class="div-table-col" style="width:12%; text-align:left;">
                    <span class="Heading6"><asp:Localize ID="lblExpectedGrad" runat="server" meta:resourceKey="lblExpectedGrad" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                2/10/2009
                </div>
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"><asp:Localize ID="lblStudentStatus" runat="server" meta:resourceKey="lblStudentStatus" /></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                Active - In School Now
                </div>
                <div class="div-table-col" style="width:12%; text-align:left;">
                <span class="Heading6"></span>
                </div>
                <div class="div-table-col" style="width:20%; text-align:left;">
                
                </div>
            </div>
        
        </div>
        <hr />
        <div id="SelectTermDiv">
        <br />
            <span class="Heading2"><asp:Localize ID="lblScheduleDetail" runat="server" meta:resourceKey="lblScheduleDetail" /></span>
            <br /><br />
            <span class="Heading6"><asp:Localize ID="lblSelectTerm" runat="server" meta:resourceKey="lblSelectTerm" /> &nbsp;</span>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListSelectTerm" runat="server">
                <asp:ListItem Selected="True" Text="12/06/2009"></asp:ListItem>
                <asp:ListItem Text="01/01/2009"></asp:ListItem>
                <asp:ListItem Text="12/06/2008"></asp:ListItem>
                <asp:ListItem Text="01/01/2008"></asp:ListItem>
                <asp:ListItem Text="12/06/2007"></asp:ListItem>
                <asp:ListItem Text="01/01/2007"></asp:ListItem>
            </asp:DropDownList>
            <input id="btnSubmit" type="button" value="GO" />
           <hr />
        </div>
    </div>
    </form>
</asp:Content>
