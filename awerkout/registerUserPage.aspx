<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="registerUserPage.aspx.cs" Inherits="awerkout.registerUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 29px;
        }

        .align-right {
            text-align: right;
        }
        .auto-style3 {
            text-align: right;
            height: 29px;
        }
        .auto-style6 {
            text-align: right;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    <h1>Create a User Account</h1>

    <table class="auto-style1">
        <tr>
            <td class="align-right">
                <asp:Label ID="userUsernameLbl" runat="server" Text="Username:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userUsernameTxtBx" runat="server" AutoPostBack="True" OnTextChanged="userUsernameTxtBx_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="userUsernameErrMsgLbl" runat="server" Text="[Username Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="userFirstNameLbl" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="userFirstNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="userFirstNameErrMsgLbl" runat="server" Text="[First Name Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="userLastNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="userLastNameErrMsgLbl" runat="server" Text="[Last Name Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="userEmailLbl" runat="server" Text="Email Address:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userEmailTxtBx" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="userEmailErrMsgLbl" runat="server" Text="[Email Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="userPasswordLbl" runat="server" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="userPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="userPasswordErrMsgLbl" runat="server" Text="[Password Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
            </td>
            <td class="auto-style7" colspan="2">
                <asp:Label ID="userPasswordHintLbl" runat="server" Text="*Must contain at least 8 alphanumeric characters"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="userRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="userRPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="userRPasswordErrMsgLbl" runat="server" Text="[Password Repeat Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="userRegisterBtn" runat="server" Text="Create an Account" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
