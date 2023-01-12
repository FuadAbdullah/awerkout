<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="registerAdminPage.aspx.cs" Inherits="awerkout.registerAdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="registerstyle.css" />
    <style type="text/css">
        .auto-style2 {
            height: 29px;
            text-align: left;
        }
        .auto-style3 {
            height: 28px;
            text-align: left;
        }

        .align-right {
            text-align: right;
        }
        .auto-style7 {
            height: 26px;
            text-align: left;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            text-align: left;
            height: 47px;
        }
        .auto-style10 {
            height: 28px;
            text-align: left;
            width: 164px;
        }
        .auto-style11 {
            height: 29px;
            text-align: left;
            width: 164px;
        }
        .auto-style12 {
            text-align: left;
            width: 164px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    <div id="registerbox">
        <h1>CREATE AN ADMIN ACCOUNT</h1>

        <table class="auto-style1">
            <tr>
                <td colspan="3" class="auto-style8">
                    <asp:Label ID="adminRegistrationStatusLbl" runat="server" Text="Registration Status"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminUsernameLbl" runat="server" Text="Username"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="UsernameValidate" 
                        runat="server" 
                        ErrorMessage="Username is required." 
                        ControlToValidate="adminUsernameTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Label ID="adminUsernameErrMsgLbl" runat="server" Text="[Username Err]" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="3">
                    <asp:TextBox ID="adminUsernameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminFirstNameLbl" runat="server" Text="First Name"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="FirstNameValidate" 
                        runat="server" 
                        ControlToValidate="adminFirstNameTxtBx" 
                        ErrorMessage="First name is required"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:TextBox ID="adminFirstNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminLastNameLbl" runat="server" Text="Last Name"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="LastNameValidate" 
                        runat="server" 
                        ControlToValidate="adminLastNameTxtBx" 
                        ErrorMessage="Last name is required."
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">
                    <asp:TextBox ID="adminLastNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminEmailLbl" runat="server" Text="Email Address"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="EmailAddressValidate" 
                        runat="server" 
                        ControlToValidate="adminEmailTxtBx" 
                        ErrorMessage="Email address is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="EmailFormatValidate"
                        runat="server" 
                        ErrorMessage="Email format is invalid."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="adminEmailTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RegularExpressionValidator>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:TextBox ID="adminEmailTxtBx" class="TxtBx" runat="server" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminPasswordLbl" runat="server" Text="Password"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="PasswordValidate" 
                        runat="server" 
                        ControlToValidate="adminPasswordTxtBx" 
                        ErrorMessage="Password is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="AdminPasswordFormatValidate" runat="server"
                        ControlToValidate="adminPasswordTxtBx"
                        ErrorMessage="Password should have eight or more alphanumerical characters!"
                        OnServerValidate="AdminPasswordFormat"
                        ForeColor="Red">
                        *
                    </asp:CustomValidator>
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="adminPasswordHintLbl" runat="server" Text="*Must contain at least 8 alphanumeric characters"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="3">
                    <asp:TextBox ID="adminPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                </td>
                <td class="auto-style7" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="adminRPasswordLbl" runat="server" Text="Repeat Password"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="RPaswordValidate" 
                        runat="server" 
                        ControlToValidate="adminRPasswordTxtBx" 
                        ErrorMessage="Password re-type is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="ComparePasswordValidate"
                        runat="server"
                        ControlToCompare="adminPasswordTxtBx"
                        ControlToValidate="adminRPasswordTxtBx"
                        EnableClientScript="False"
                        ErrorMessage="Re-typed password is not the same as password."
                        ForeColor="Red">
                        *
                    </asp:CompareValidator>
                </td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:TextBox ID="adminRPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:Button ID="adminRegisterBtn"  class="btn" runat="server" Text="Create admin Account" OnClick="adminRegisterBtn_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." />
                </td>
            </tr>
            </table>

    </asp:Content>
    <asp:Content ID="Content3" runat="server" contentplaceholderid="AdditionalNavOption1">
                    <table class="auto-style1">
            <tr>
                <td class="align-right">
                    <asp:LinkButton ID="myDashboardlnk" runat="server" OnClick="myDashboardlnk_Click">My Dashboard</asp:LinkButton>
                </td>
                <td class="align-right">
                    <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
                </td>
            </tr>
        </table>
    <div>
</asp:Content>

