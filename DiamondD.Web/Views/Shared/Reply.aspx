<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<asp:Localize ID="lblResponseMessageHeading" runat="server" meta:resourceKey="lblResponseMessageHeading" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <center>
    
<div class="div-table">
    <div  class="DivRowwidth1000">
        <div class="DivColumnWidth150Right">
            &nbsp;
        </div>
        <div class="DivWidth810Center">
        <div class="DivWidth100Left">
    <table class="width100">
        <tr class="width700px">
            <td class="width700px">
             <div id="content" class="DivWidth100PaddingCenter">
               <div class="DivBorder2pxSolidRed">
                <div class="DivWidth100HeightPaddingCenter">
                    <label class="DivFontMediumColor"><b>
                    <asp:Localize ID="lblErrorHeading" runat="server" meta:resourceKey="lblErrorHeading" /></b></label>
                    
                </div>
                <div>
                    <p class="DivLeftMarginColor">
                    <asp:Localize ID="lblErrorMsg1" runat="server" meta:resourceKey="lblErrorMsg1" />
                    <br />
                    <br />
                    <asp:Localize ID="lblErrorMsg2" runat="server" meta:resourceKey="lblErrorMsg2" />
                    </p>  
                </div>
             </div>
        </div> 
            </td>
        </tr>
     </table>
    </div>
       </div>
        <div class="DivColumnWidth150Right">
            &nbsp;
        </div>

    </div>
    </div>
       
</center>
</asp:Content>
