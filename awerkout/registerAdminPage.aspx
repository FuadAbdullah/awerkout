<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="registerAdminPage.aspx.cs" Inherits="awerkout.registerAdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            height: 28px;
        }

        .align-right {
            text-align: right;
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
    <h1>Create an Admin Account</h1>

    <table class="auto-style1">
        <tr>
            <td colspan="3">
                <asp:Label ID="adminRegistrationStatusLbl" runat="server" Text="Registration Status"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminUsernameLbl" runat="server" Text="Username:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="adminUsernameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:Label ID="adminUsernameErrMsgLbl" runat="server" Text="[Username Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminFirstNameLbl" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="adminFirstNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="adminFirstNameErrMsgLbl" runat="server" Text="[First Name Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="adminLastNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="adminLastNameErrMsgLbl" runat="server" Text="[Last Name Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminEmailLbl" runat="server" Text="Email Address:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="adminEmailTxtBx" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="adminEmailErrMsgLbl" runat="server" Text="[Email Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminPasswordLbl" runat="server" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="adminPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="adminPasswordErrMsgLbl" runat="server" Text="[Password Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
            </td>
            <td class="auto-style7" colspan="2">
                <asp:Label ID="adminPasswordHintLbl" runat="server" Text="*Must contain at least 8 alphanumeric characters"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="adminRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="adminRPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="adminRPasswordErrMsgLbl" runat="server" Text="[Password Repeat Err]" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="adminRegisterBtn" runat="server" Text="Create an Account" OnClick="adminRegisterBtn_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
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
</asp:Content>

