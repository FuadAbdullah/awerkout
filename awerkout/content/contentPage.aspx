<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="contentPage.aspx.cs" Inherits="awerkout.content.guidePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="../userDashboardstyle.css" />
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }

        .auto-style3 {
            width: 100%;
        }

        .auto-style4 {
            width: 1470px;
        }

        .auto-style5 {
            width: 2055px;
        }

        .auto-style6 {
            width: 1122px;
        }

        .auto-style7 {
            width: 200px;
            text-align: left;
        }

        .auto-style8 {
            text-align: left;
        }

        .auto-style9 {
            width: 200px;
            text-align: right;
        }

        .auto-style10 {
            text-align: center;
        }

        .auto-style11 {
            width: 200px;
            text-align: left;
            height: 63px;
        }

        .auto-style12 {
            text-align: left;
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click" CausesValidation="False">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signInlnk" class="nav" runat="server" OnClick="signInlnk_Click" CausesValidation="False">Sign In</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <br />
    <br />
    <br />
    <asp:Label ID="noContentLbl" runat="server" Visible="false" Text="Uh-oh, it seems like no post had been made just yet, :'("></asp:Label>
    <asp:Repeater ID="contentRepeater" runat="server">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="contentTitleLbl" runat="server" Text='<%# Eval("postTitle") %>'></asp:Label>
                        <br />
                        <asp:ImageButton ID="contentFocusBtn" runat="server" Height="200px" Width="500px" CommandArgument='<%# Eval("postID") %>' OnClick="contentFocusBtn_Click" ImageUrl='<%# Eval("bannerPath") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
