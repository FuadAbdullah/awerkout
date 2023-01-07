<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="awerkout.userDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: right;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
        <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myProfilelnk" runat="server" OnClick="myProfilelnk_Click">My Profile</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <table class="auto-style1">
        <tr>
            <td>
                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
    </table>
</asp:Content>
