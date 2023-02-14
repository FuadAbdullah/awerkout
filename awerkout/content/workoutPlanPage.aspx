<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="workoutPlanPage.aspx.cs" Inherits="awerkout.content.contentPage" %>
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
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
        <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click">My Profile</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
    <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="signinlnk" class="nav" runat="server" OnClick="signInlnk_Click">Sign In</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="align-center" colspan="3">
                <asp:LinkButton ID="splitGoalslnk" runat="server">By Goals</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="align-center">
                <asp:LinkButton ID="beginnerPlanlnk" runat="server">Beginner</asp:LinkButton>
            </td>
            <td class="align-center">
                <asp:LinkButton ID="intermediatePlanlnk" runat="server">Intermediate</asp:LinkButton>
            </td>
            <td class="align-center">
                <asp:LinkButton ID="advancedPlanlnk" runat="server">Advanced</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
