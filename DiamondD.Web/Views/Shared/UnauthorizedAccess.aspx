<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblTitle" runat="server" meta:resourceKey="lblTitle" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="mainDiv" class="DivMiddleWidth"> 
        <center>
        <div class="div-table">
    <div  class="DivRowwidth1000">
        <div class="DivWidth250pxRight">
            &nbsp;
        </div>
        <div class="DivWidth810Center">
        <div class=" DivWidth100Left">
    <table class="width100">
        <tr class="width500px">
            <td class="width500px">
             <div id="Div1" class="DivWidth100PaddingCenter">
               <div class="DivBorder2pxSolidRed">
                <div class="DivWidth100HeightPaddingCenter">
                    <label class="DivFontMediumColor"><b>
                    <asp:Localize ID="lblHeading" runat="server" meta:resourceKey="lblHeading" /></b></label>
                    
                </div>
                <div>
                    <p class="DivLeftMarginColor">
                    <asp:Localize ID="lblErrorDetail" runat="server" meta:resourceKey="lblErrorDetail" />
                    <br />
                    <br />
                    <asp:Localize ID="FailureMsg" runat="server" meta:resourceKey="FailureMsg" />
                    </p>  
                </div>
             </div>
        </div> 
            </td>
        </tr>
     </table>
    </div>
       </div>
        <div class="DivWidth250pxRight">
            &nbsp;
        </div>

    </div>
    </div>
        </center>
        </div>

</asp:Content>

