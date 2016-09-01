<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/General.Master" Inherits="System.Web.Mvc.ViewPage<DiamondD.Data.DataAccess.User.WebUser>" %>

<%@ Import Namespace="DiamondD.Services.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <asp:Localize ID="TitleAdminSetttings" runat="server" meta:resourceKey="TitleAdminSettings" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../../Scripts/jquery-1.3.2.min.js"></script>
    <% if (Session["DD_Role"].ToString().Equals("Admin"))
       {%>
    <div id="Heading">
        <h1>
            <asp:Localize ID="Localize1" runat="server" meta:resourceKey="TitleAdminSettings" /></h1>
    </div>
    <span id="SuccessfulMsg" class="SuccessMsgDisplayNone">
        <asp:Localize ID="SuccessfulChangeMsg" runat="server" meta:resourceKey="SuccessfulChangeMsg" /></span>
    <div class="AdminSettingDiv8">
        <div class="AdminSettingDiv6">
            <!------------   Change Logo Image   ------------->
            <div id="divUploadLogo" class="width490px">
                <fieldset id="Fieldset1">
                    <% 
               ISettingsService settingsService = new SettingsService();
               //IWebUserService userService = new WebUserService();
               string path = ConfigurationManager.AppSettings["logoPath"];

               string imagesPath = ResolveClientUrl("~" + path) + settingsService.GetLogoFileName();
               ViewData["LogoFilePath"] = imagesPath;
                    %>
                    <% using (Html.BeginForm("ChangeLogo", "User", FormMethod.Post, new { enctype = "multipart/form-data" }))
                       {%>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <span class="BlueHeading">
                                    <asp:Localize ID="SectionTitleChangeUploadLogo" runat="server" meta:resourceKey="SectionTitleChangeUploadLogo" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="width80px">
                            </td>
                            <td class="width400px" align="right" valign="top">
                                <input id="btnEditUploadLogo" value="Edit" type="button" onclick="javascript:ChangeUploadLogoFieldEnable();" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="width80px">
                                <img src="<%= ViewData["LogoFilePath"] %>" height="60px" width="60px" alt="Logo" />
                            </td>
                            <td align="right" valign="middle">
                                <input type="file" id="uploadLogo" name="uploadLogo" class="width375px" />
                                <span id="LogoRequired" class="DisplayNoneErrorMsg">*</span>
                                <% if (ViewData["ImageType"] != null && ViewData["ImageType"].ToString().Equals("0"))
                                   {%>
                                <div id="Div1" class="AdminSettingDiv1">
                                    <span id="Span3" class="error">
                                        <%= ViewData["ErrorMessage"] %>
                                    </span>
                                </div>
                                <% }
                                   else
                                   {%>
                                <div id="validLogoExtenssion" class="AdminSettingDiv1">
                                    <span id="Span2" class="colorGreen">
                                        <asp:Localize ID="Localize4" runat="server" meta:resourceKey="lblvalidLogoExtenssion" />
                                    </span>
                                </div>
                                <div id="invalidLogoExtenssion" class="AdminSettingDiv9">
                                    <span id="Span1" class="error">
                                        <asp:Localize ID="Localize3" runat="server" meta:resourceKey="lblinvalidLogoExtenssion" /></span>
                                </div>
                                <%
                                                        }%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" valign="middle">
                                <input id="btnSaveUploadLogo" name="btnSaveUploadLogo" value="Save" type="submit"
                                    disabled="disabled" onclick="javascript:return ValidationLogoImage();" />
                                <input id="btnCancelUploadLogo" name="btnCancelUploadLogo" value="Cancel" type="button"
                                    disabled="disabled" onclick="javascript:ChangeUploadLogoFieldDisable();" />
                            </td>
                        </tr>
                    </table>
                    <%
    //Html.EndForm();
}%>
                    <%--</form>--%>
                </fieldset>
            </div>
        </div>
        <div class="AdminSettingDiv3">
            &nbsp;
        </div>
        <div class="AdminSettingDiv4">
            <!------------   Change Title Message   ------------->
            <div id="DivTitleMsg" class="width490px">
                <fieldset id="Fieldset2">
                    <% using (Html.BeginForm("ChangeTitleMsg", "User"))
                       { %>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <span class="BlueHeading">
                                    <asp:Localize ID="SectionTitleChangeTitleMsg" runat="server" meta:resourceKey="SectionTitleChangeTitleMsg" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="width400px">
                            </td>
                            <td class="width80px" align="right" valign="top">
                                <input id="btnEditTitleMsg" value="Edit" type="button" onclick="javascript: ChangeTitleMsgFieldEnable();" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" valign="middle">
                                <br />
                                <br />
                                <input name="txtChangeTitleMsg" id="txtChangeTitleMsg" maxlength="45" disabled="disabled"
                                    type="text" value="<%= Model.TitleMsg %>" maxlength="500" class="width350px" />
                                <input id="txtHidChangeTitleMsg" name="txtHidChangeTitleMsg" value="<%= Model.TitleMsg %>"
                                    type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" valign="middle">
                                <br />
                                <input id="btnSaveChangeTitleMsg" name="btnSaveChangeTitleMsg" value="Save" type="submit"
                                    disabled="disabled" onclick="javascript:return ValidationTitleMessage();" />
                                <input id="btnCancelChangeTitleMsg" name="btnCancelChangeTitleMsg" value="Cancel"
                                    type="button" disabled="disabled" onclick="javascript: ChangeTitleMsgFieldDisable();" />
                            </td>
                        </tr>
                    </table>
                    <% 
                                                    Html.EndForm();
                                                } %>
                </fieldset>
            </div>
        </div>
        <div class="AdminSettingDiv5">
            &nbsp;
        </div>
    </div>
    <div class="AdminSettingDiv8">
        <div class="AdminSettingDiv6">
            <!------------   Change Login Message   ------------->
            <div id="DivLoginMsg" class="width490px">
                <fieldset id="FieldsetLoginMsg">
                    <% using (Html.BeginForm("ChangeLoginMsg", "User"))
                       { %>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <span class="BlueHeading">
                                    <asp:Localize ID="SectionTitleChangeLoginMsg" runat="server" meta:resourceKey="SectionTitleChangeLoginMsg" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="width400px">
                            </td>
                            <td class="width80px" align="right" valign="top">
                                <input id="btnEditChangeLoginMsg" value="Edit" type="button" onclick="javascript: ChangeLoginMsgFieldEnable();" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="txtChangeLoginMsg" id="txtChangeLoginMsg" disabled="disabled" rows="12"
                                    cols="55"><%= Model.LoginMsg %></textarea>
                                <input id="txtHidChangeLoginMsg" name="txtHidChangeLoginMsg" value="<%= Model.LoginMsg %>"
                                    type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="middle">
                                <input id="btnSaveChangeLoginMsg" name="btnSaveChangeLoginMsg" value="Save" type="submit"
                                    disabled="disabled" />
                                <input id="btnCancelChangeLoginMsg" name="btnCancelChangeLoginMsg" value="Cancel"
                                    type="button" disabled="disabled" onclick="javascript: ChangeLoginMsgFieldDisable();" />
                            </td>
                        </tr>
                    </table>
                    <% 
                                                    Html.EndForm();
                                                } %>
                </fieldset>
            </div>
        </div>
        <div class="AdminSettingDiv3">
            &nbsp;
        </div>
        <div class="AdminSettingDiv4">
            <!------------   Change Welcome Message   ------------->
            <div id="DivWelcomeMsg" class="width490px">
                <fieldset id="FieldsetwelcomeMsg">
                    <% using (Html.BeginForm("ChangeWelcomeMsg", "User"))
                       { %>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <span class="BlueHeading">
                                    <asp:Localize ID="SectionTitleChangeWelcomeMsg" runat="server" meta:resourceKey="SectionTitleChangeWelcomeMsg" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="width400px">
                            </td>
                            <td class="width90px" align="right" valign="top">
                                <input id="btnWelcomeMsgEdit" value="Edit" type="button" onclick="javascript: ChangeWelcomeMsgFieldEnable();" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="txtChangeWelcomeMsg" id="txtChangeWelcomeMsg" disabled="disabled"
                                    rows="12" cols="55"><%= Model.WelcomeMsg %></textarea>
                                <input id="txtHidChangeWelcomeMsg" name="txtHidChangeWelcomeMsg" value="<%= Model.WelcomeMsg %>"
                                    type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" valign="middle">
                                <input id="btnSaveChangeWelcomeMsg" name="btnSaveChangeWelcomeMsg" value="Save" type="submit"
                                    disabled="disabled" />
                                <input id="btnCancelChangeWelcomeMsg" name="btnCancelChangeWelcomeMsg" value="Cancel"
                                    type="button" disabled="disabled" onclick="javascript: ChangeWelcomeMsgFieldDisable();" />
                            </td>
                        </tr>
                    </table>
                    <% 
                                                    Html.EndForm();
                                                } %>
                </fieldset>
            </div>
            
        </div>
        <div class="AdminSettingDiv5">
            &nbsp;
        </div>
    </div>
    <div class="AdminSettingDiv8">
    <div class="AdminSettingDiv6">
            <!------------   Set Email OR Student ID   ------------->
            <div id="Div2" >
                <fieldset id="Fieldset3">
                    <% using (Html.BeginForm("SetEmailOrStudentID", "User"))
                       { %>
                    <table cellpadding="0" border="0">
                        <tr>
                            <td colspan="2" align="center">
                                <span class="BlueHeading">
                                    <asp:Localize ID="Localize2" runat="server" meta:resourceKey="SectionTitleSetEmailOrStudentID" /></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="width400px">
                            </td>
                            <td class="width80px" align="right" valign="top">
                                <input id="btnEditEmailOrStudentId" value="Edit" type="button" onclick="javascript: SetEmailOrStudentFieldEnable(true);" />
                            </td>
                        </tr>
                        <tr class="formDataEmailOrStudentId">
                            <td colspan="2">
                            <input name="radEmailOrStudentId" value="1" type="radio" disabled="disabled" /> Email
                            <br />
                            <input name="radEmailOrStudentId" value="2" type="radio" disabled="disabled" /> Student ID
                            <%--<select name="cmbEmailOrStudentId">
                            <option selected="selected">Email</option>
                            <option>Student ID</option>
                            </select>--%>
                                <input id="Hidden1" name="txtHidEmailOrStudentIdMsg" value="<%= Model.EmailOrStudentId %>"
                                    type="hidden" />
                            </td>
                        </tr>
                        <tr class="formDataEmailOrStudentId">
                            <td align="right" valign="middle">
                                <input id="btnSaveEmailOrStudentId" name="btnSaveEmailOrStudentIdMsg" value="Save" type="submit"
                                    disabled="disabled" />
                                <input id="btnCancelEmailOrStudentId" name="btnCancelEmailOrStudentIdMsg" value="Cancel"
                                    type="button" disabled="disabled" onclick="javascript: SetEmailOrStudentFieldEnable(false);" />
                            </td>
                        </tr>
                    </table>
                    <% 
                                                    Html.EndForm();
                                                } %>
                </fieldset>
            </div>
        </div>
    </div>

    <!------------   Javacsript Section  ------------->
            <script language="javascript" type="text/javascript">
                function SetEmailOrStudentFieldEnable(IsEnable) {
                    $('input[name="radEmailOrStudentId"]').attr('disabled', !IsEnable);

                    var btnEditEmailOrStudentId = document.getElementById("btnEditEmailOrStudentId");
                    var btnSaveEmailOrStudentId = document.getElementById("btnSaveEmailOrStudentId");
                    var btnCancelEmailOrStudentId = document.getElementById("btnCancelEmailOrStudentId");
                    btnSaveEmailOrStudentId.disabled = !IsEnable;
                    btnCancelEmailOrStudentId.disabled = !IsEnable;
                    btnEditEmailOrStudentId.disabled = IsEnable;
                }
                function ValidationTitleMessage() {
                    var txtChangeTitleMsg = document.getElementById("txtChangeTitleMsg");
                    txtChangeTitleMsg.value = txtChangeTitleMsg.value.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    if (txtChangeTitleMsg.value.length > 35) {
                        txtChangeTitleMsg.value = toTitleCase(txtChangeTitleMsg.value);
                    }
                    return true;
                }

                function toTitleCase(str) {
                    return str.replace(/\w\S*/g, function (txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
                }

                function ValidationLogoImage() {

                    var logoPath = document.getElementById("uploadLogo");
                    var LogoRequired = document.getElementById("LogoRequired");

                    if (logoPath.value != null && logoPath.value == '') {
                        LogoRequired.style.display = "";
                        return false;
                    }
                    else {
                        var str = logoPath.value.toString();
                        var ext = str.substring(str.lastIndexOf('.'), str.length);
                        ext = ext.toLowerCase();

                        if (ext != '.png' && ext != '.jpg' & ext != '.jpeg' && ext != '.gif') {
                            document.getElementById("invalidLogoExtenssion").style.display = "";
                            document.getElementById("validLogoExtenssion").style.display = "none";
                            return false;
                        }
                    }

                    return true;

                }

                function ChangeUploadLogoFieldEnable() {
                    var uploadLogo = document.getElementById("uploadLogo");
                    var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveUploadLogo");
                    var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelUploadLogo");
                    var btnEditChangeWelcomeMsg = document.getElementById("btnEditUploadLogo");

                    uploadLogo.disabled = false;
                    uploadLogo.focus();

                    btnSaveChangeWelcomeMsg.disabled = false;
                    btnCancelChangeWelcomeMsg.disabled = false;

                    btnEditChangeWelcomeMsg.disabled = true;

                }
                function ChangeUploadLogoFieldDisable() {
                    var uploadLogo = document.getElementById("uploadLogo");
                    var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveUploadLogo");
                    var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelUploadLogo");
                    var btnEditChangeWelcomeMsg = document.getElementById("btnEditUploadLogo");

                    uploadLogo.disabled = true;
                    btnSaveChangeWelcomeMsg.disabled = true;
                    btnCancelChangeWelcomeMsg.disabled = true;

                    btnEditChangeWelcomeMsg.disabled = false;
                }
                function ChangeWelcomeMsgFieldEnable() {
                    var txtChangeWelcomeMsg = document.getElementById("txtChangeWelcomeMsg");
                    var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveChangeWelcomeMsg");
                    var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelChangeWelcomeMsg");
                    var btnEditChangeWelcomeMsg = document.getElementById("btnWelcomeMsgEdit");

                    txtChangeWelcomeMsg.disabled = false;
                    txtChangeWelcomeMsg.focus();

                    btnSaveChangeWelcomeMsg.disabled = false;
                    btnCancelChangeWelcomeMsg.disabled = false;

                    btnEditChangeWelcomeMsg.disabled = true;

                }
                function ChangeWelcomeMsgFieldDisable() {
                    var txtChangeWelcomeMsg = document.getElementById("txtChangeWelcomeMsg");
                    var btnSaveChangeWelcomeMsg = document.getElementById("btnSaveChangeWelcomeMsg");
                    var btnCancelChangeWelcomeMsg = document.getElementById("btnCancelChangeWelcomeMsg");
                    var btnEditChangeWelcomeMsg = document.getElementById("btnWelcomeMsgEdit");
                    var txtHidChangeWelcomeMsg = document.getElementById("txtHidChangeWelcomeMsg");

                    txtChangeWelcomeMsg.disabled = true;
                    txtChangeWelcomeMsg.value = txtHidChangeWelcomeMsg.value;
                    btnSaveChangeWelcomeMsg.disabled = true;
                    btnCancelChangeWelcomeMsg.disabled = true;

                    btnEditChangeWelcomeMsg.disabled = false;
                }
                function ChangeLoginMsgFieldEnable() {
                    var txtChangeLoginMsg = document.getElementById("txtChangeLoginMsg");
                    var btnSaveChangeLoginMsg = document.getElementById("btnSaveChangeLoginMsg");
                    var btnCancelChangeLoginMsg = document.getElementById("btnCancelChangeLoginMsg");
                    var btnEditChangeLoginMsg = document.getElementById("btnEditChangeLoginMsg");

                    txtChangeLoginMsg.disabled = false;
                    txtChangeLoginMsg.focus();

                    btnSaveChangeLoginMsg.disabled = false;
                    btnCancelChangeLoginMsg.disabled = false;

                    btnEditChangeLoginMsg.disabled = true;

                }
                function ChangeLoginMsgFieldDisable() {
                    var txtChangeLoginMsg = document.getElementById("txtChangeLoginMsg");
                    var btnSaveChangeLoginMsg = document.getElementById("btnSaveChangeLoginMsg");
                    var btnCancelChangeLoginMsg = document.getElementById("btnCancelChangeLoginMsg");
                    var btnEditChangeLoginMsg = document.getElementById("btnEditChangeLoginMsg");
                    var txtHidChangeLoginMsg = document.getElementById("txtHidChangeLoginMsg");

                    txtChangeLoginMsg.disabled = true;
                    txtChangeLoginMsg.value = txtHidChangeLoginMsg.value;
                    btnSaveChangeLoginMsg.disabled = true;
                    btnCancelChangeLoginMsg.disabled = true;

                    btnEditChangeLoginMsg.disabled = false;
                }
                function ChangeTitleMsgFieldEnable() {
                    var txtChangeTitleMsg = document.getElementById("txtChangeTitleMsg");
                    var btnSaveChangeTitleMsg = document.getElementById("btnSaveChangeTitleMsg");
                    var btnCancelChangeTitleMsg = document.getElementById("btnCancelChangeTitleMsg");
                    var btnEditTitleMsg = document.getElementById("btnEditTitleMsg");

                    txtChangeTitleMsg.disabled = false;
                    txtChangeTitleMsg.focus();

                    btnSaveChangeTitleMsg.disabled = false;
                    btnCancelChangeTitleMsg.disabled = false;

                    btnEditTitleMsg.disabled = true;

                }
                function ChangeTitleMsgFieldDisable() {
                    var txtChangeTitleMsg = document.getElementById("txtChangeTitleMsg");
                    var btnSaveChangeTitleMsg = document.getElementById("btnSaveChangeTitleMsg");
                    var btnCancelChangeTitleMsg = document.getElementById("btnCancelChangeTitleMsg");
                    var btnEditTitleMsg = document.getElementById("btnEditTitleMsg");
                    var txtHidChangeTitleMsg = document.getElementById("txtHidChangeTitleMsg");

                    txtChangeTitleMsg.disabled = true;
                    txtChangeTitleMsg.value = txtHidChangeTitleMsg.value;
                    btnSaveChangeTitleMsg.disabled = true;
                    btnCancelChangeTitleMsg.disabled = true;

                    btnEditTitleMsg.disabled = false;
                }
            </script>
            <script language="javascript" type="text/javascript">
            var index=<%=Model.EmailOrStudentId-1 %>               
            $('input:radio[name=radEmailOrStudentId]:nth('+index+')').attr('checked', true);
            </script>

            <% if (ViewData["editOption"].ToString() == "wm")
               { %>
            <script language="javascript" type="text/javascript">
                ChangeWelcomeMsgFieldEnable();
                ChangeUploadLogoFieldDisable();
            </script>
            <% }
               else if (ViewData["editOption"].ToString() == "lm")
               { %>
            <script language="javascript" type="text/javascript">
                ChangeLoginMsgFieldEnable();
                ChangeUploadLogoFieldDisable();
            </script>
            <% }
               else if (ViewData["editOption"].ToString() == "ul")
               { %>
            <script language="javascript" type="text/javascript">
                ChangeUploadLogoFieldEnable();
            </script>
            <% }
               else if (ViewData["editOption"].ToString() == "ct")
               { %>
            <script language="javascript" type="text/javascript">
                ChangeTitleMsgFieldEnable();
                ChangeUploadLogoFieldDisable();
            </script>
            <% }
               else if (ViewData["editOption"].ToString() == "es")
               { %>
               <script language="javascript" type="text/javascript">
               SetEmailOrStudentFieldEnable(true);
               </script>
               <%
               }
               if (ViewData["successMsg"] != null && ViewData["successMsg"].ToString() == "1")
               { %>
            <script language="javascript" type="text/javascript">
                document.getElementById("SuccessfulMsg").style.display = "inline";
            </script>
            <% }
   else
   { %>
            <script language="javascript" type="text/javascript">
                document.getElementById("SuccessfulMsg").style.display = "none";
            </script>
            <% } %>
            <%
           }%>
</asp:Content>
