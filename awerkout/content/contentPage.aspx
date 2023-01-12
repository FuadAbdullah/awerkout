<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="contentPage.aspx.cs" Inherits="awerkout.content.guidePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .align-right {
            text-align: right;
        }
        .align-center {
            text-align: center;
        }

        .auto-style2 {
            text-align: right;
            height: 26px;
        }
            .auto-style3 {
                text-align: center;
                height: 26px;
            }
            .auto-style4 {
                text-align: center;
                height: 226px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
            <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myDashboardlnk" runat="server" OnClick="myDashboardlnk_Click">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="200px" Width="500px" />
                <br />
                <asp:Label ID="contentTitleLbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="align-center">&nbsp;</td>
        </tr>
        <tr>
            <td class="align-center">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="align-center">&nbsp;</td>
        </tr>
        <tr>
            <td class="align-center">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
