<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="signInPage.aspx.cs" Inherits="awerkout.signInPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 26px;
        }

        .align-right {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    
    <h1>Sign in to your Account</h1>

    <table class="auto-style1">
        <tr>
            <td class="align-right">
                <asp:Label ID="usernameLbl" runat="server" Text="Username:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="usernameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="align-right">
                <asp:Label ID="passwordLbl" runat="server" Text="Password:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="passwordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="signInBtn" runat="server" OnClick="signInBtn_Click" Text="Sign In" />
            </td>
            <td>
                <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
        </tr>
    </table>


</asp:Content>
