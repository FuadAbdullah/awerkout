<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="contentPage.aspx.cs" Inherits="awerkout.content.guidePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="contentPagestyle.css" />
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
    <div class="centerdiv">
        <asp:Label ID="noContentLbl" runat="server" Visible="false" Text="Uh-oh, it seems like no post had been made just yet, :'("></asp:Label>
    </div>
    <asp:Repeater ID="contentRepeater" runat="server">
        <ItemTemplate>
            <table id="contentRepeat">
                <tr>
                    <td>
                        <asp:Label ID="contentTitleLbl" runat="server" Text='<%# Eval("postTitle") %>' Font-Size="Large" Font-Bold="True" Font-Underline="True"></asp:Label>
                        <br />
                        <br />
                        <div class="centerdiv">
                            <asp:ImageButton ID="contentFocusBtn" runat="server" Height="300px" Width="500px" CommandArgument='<%# Eval("postID") %>' OnClick="contentFocusBtn_Click" ImageUrl='<%# Eval("bannerPath") %>' />
                        </div>
                        <br />
                        <asp:Label ID="contentAuthorLbl" runat="server" Text='<%# "Posted by " + (
                            Eval("accstatus").ToString().Trim().Equals("A") 
                            ? Eval("username").ToString().Trim() 
                            : "[DELETED USER]" ) +
                            "#" + Eval("userID").ToString().Trim() +
                            " on " + Eval("createdAt").ToString().Trim() %>'
                            Font-Size="Small" Font-Bold="False"></asp:Label>
                        <br />
                        <asp:Label ID="contentDateLbl" runat="server" Text='<%# "Last updated on " + Eval("updatedAt").ToString().Trim() %>' Font-Bold="False" Font-Size="Small"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
