<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="registerUserPage.aspx.cs" Inherits="awerkout.registerUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <appSettings>
      <add key="ValidationSettings:UnobtrusiveValidationMode" value="None" />
    </appSettings>
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="registerstyle.css" />
    <style type="text/css">
        .auto-style2 {
            height: 29px;
            text-align: left;
        }

        .align-right {
            text-align: right;
        }
        .auto-style7 {
            height: 26px;
            text-align: left;
        }
        .auto-style9 {
            height: 31px;
            text-align: left;
        }
        .auto-style10 {
            text-align: justify;
        }
        .auto-style11 {
            text-align: left;
            width: 165px;
        }
        .auto-style13 {
            height: 29px;
            text-align: left;
            width: 165px;
        }
        .auto-style15 {
            text-align: left;
            width: 165px;
            height: 20px;
        }
        .auto-style16 {
            text-align: left;
            height: 20px;
        }
        .auto-style17 {
            text-align: left;
            height: 48px;
        }
        .auto-style18 {
            text-align: justify;
            width: 84px;
        }
        .auto-style19 {
            text-align: left;
            height: 20px;
            width: 84px;
        }
        .auto-style20 {
            height: 29px;
            text-align: left;
            width: 84px;
        }
        .auto-style21 {
            height: 29px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    <div id="registerbox">

        <h1>SIGN UP</h1>

        <table style="width: 100%">
            <tr>
                <td class="auto-style10" colspan="3">
                    Sign up to become a member of Awerkout and get exclusive information!</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2">
                    <asp:Label ID="userUsernameLbl" runat="server" Text="Username"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="UsernameValidate" 
                        runat="server" 
                        ErrorMessage="Username is required." 
                        ControlToValidate="userUsernameTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td class="align-right">
                    <asp:Label ID="userUsernameErrMsgLbl" runat="server" Text="[Username Err]" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:TextBox ID="userUsernameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style19">
                    </td>
                <td class="auto-style15">
                    </td>
                <td class="auto-style16">
                    </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Label ID="userFirstNameLbl" runat="server" Text="First Name"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="FirstNameValidate" 
                        runat="server" 
                        ControlToValidate="userFirstNameTxtBx" 
                        ErrorMessage="First name is required"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="3">
                    <asp:TextBox ID="userFirstNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="LastNameValidate" 
                        runat="server" 
                        ControlToValidate="userLastNameTxtBx" 
                        ErrorMessage="Last name is required."
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:TextBox ID="userLastNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Label ID="userEmailLbl" runat="server" Text="Email Address"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="EmailAddressValidate" 
                        runat="server" 
                        ControlToValidate="userEmailTxtBx" 
                        ErrorMessage="Email address is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="EmailFormatValidate"
                        runat="server" 
                        ErrorMessage="Email format is invalid."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="userEmailTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:TextBox ID="userEmailTxtBx" class="TxtBx" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    </td>
                <td class="auto-style13">
                    </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="userPasswordLbl" runat="server" Text="Password"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="PasswordValidate" 
                        runat="server" 
                        ControlToValidate="userPasswordTxtBx" 
                        ErrorMessage="Password is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="PasswordFormatValidate" runat="server"
                        ControlToValidate="userPasswordTxtBx"
                        ErrorMessage="Password should have eight or more alphanumerical characters!"
                        OnServerValidate="PasswordFormat"
                        ForeColor="Red">
                        *
                    </asp:CustomValidator>
                </td>
                <td class="auto-style21">
                    <asp:Label ID="userPasswordHintLbl" runat="server" Text="*Must contain at least 8 alphanumeric characters"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="userPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:Label ID="userRPasswordLbl" runat="server" Text="Confirm password"></asp:Label>
                    <asp:CustomValidator ID="PasswordInsertedValidate" 
                        runat="server"
                        ControlToValidate="userPasswordTxtBx"
                        ErrorMessage="Re-typed password is not the same as password."
                        OnServerValidate="PasswordInserted"
                        ForeColor="Red">
                        *
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17" colspan="3">
                    <asp:TextBox ID="userRPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Button ID="userRegisterBtn" class="btn" runat="server" Text="SIGN UP" OnClick="userRegisterBtn_Click"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:LinkButton ID="signInlnk" runat="server" class="SignInlnk" OnClick="SignInlnk_Click" CausesValidation="False">LOGIN</asp:LinkButton>
                </td>
                <td colspan="2" class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="One or more fields were entered incorrectly." ForeColor="Red" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
