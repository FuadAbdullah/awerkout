<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="awerkout.adminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="mainstyle.css" />
        <link rel="stylesheet" href="adminDashboardstyle.css" />
        <style type="text/css">
        .auto-style2 {
            text-align: right;
            height: 26px;
        }
            .auto-style3 {
                width: 100%;
            }
            .auto-style4 {
                height: 22px;
            }
            .auto-style5 {
                width: 95px;
            }
            .auto-style6 {
                height: 22px;
                width: 95px;
            }
            .auto-style7 {
                width: 960px;
            }
            .auto-style8 {
                height: 22px;
                width: 960px;
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
                <asp:LinkButton ID="manageUserlnk" runat="server" OnClick="manageUserlnk_Click">Manage Users</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="adminCreateAdminAcclnk" runat="server" OnClick="adminCreateAdminAcclnk_Click">Register Admin</asp:LinkButton>
            </td>
        </tr>
        </table>
    <br />

    <div id="quiz">
        <h1 style="text-align: center;">QUIZ</h1>


        <table class="auto-style3">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">

        <asp:Label ID="question" runat="server" Text="Question: "></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="questionTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="quizCreationDateLbl" runat="server" Font-Size="Smaller" Text="Created On"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="quizUpdateDateLbl" runat="server" Font-Size="Smaller" Text="Updated On"></asp:Label>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
