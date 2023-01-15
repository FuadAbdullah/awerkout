<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Intermediate.aspx.cs" Inherits="awerkout.Intermediate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: large;
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
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <div class="header">
        <img src="Images/Intermediate header.PNG" id="imgheader"/>
        <div id="txt"> 
            <span style="white-space:pre-wrap;">Intermediate Workout Routine for Men</span><br />
            <br />
            <div class="auto-style1">
                If you are already hitting the gym for some time and 
                are well-acquainted with various workout programs for
                men, then you should follow this intermediate workout routine.
            <br />
            <br />
                Following this fitness regimen would help you burn fat steadily 
                without putting too much pressure on your body. The five-day 
                split is aimed at helping you gain impressive muscle gain. 
                It is one of the best workout routines for intermediates.</div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="content daytxt">
        <meta charset="utf-8" />
        <span style="white-space: pre-wrap;">Day 1: Chest, Shoulders and Triceps</span></div>

    <div class="content daytxt">
        <meta charset="utf-8" />
        <span style="white-space: pre-wrap;">Day 2: Back and Biceps</span></div>
    <div class="content daytxt">
        <meta charset="utf-8" />
        <span style="white-space: pre-wrap;">Day 3: Legs</span></div><div class="content daytxt">
        <meta charset="utf-8" />
        <span style="white-space: pre-wrap;">Day 4: Shoulders, chest, and Triceps</span></div>
</asp:Content>
