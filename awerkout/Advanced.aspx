<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Advanced.aspx.cs" Inherits="awerkout.Advanced" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style2 {
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
        <img src="Images/Advanced header.PNG" id="imgheader"/>
        <div id="txt"> 
            Advanced Workout Routine for Men
            <div class="auto-style2">
            <br />
            <br />
            Evidently, those who are already gym buffs and would like 
            to reach the next level of fitness routine must follow 
            this advanced level workout for men. <br /><br />
            This high-intensity 
            regimen is meant for men and not boys. It would include 
            heavy weight-lifting with minimal rests in between sets. 
            <br /><br />
            Since this routine is more rigorous, the training is set 
            for 6 days per week. You will get one day’s rest for recovery. 
            The goal of this routine is to gift you with an incredible physique.
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="content daytxt">
        Day 1: Chest &amp; Back Workout</div>

    <div class="content daytxt">
        Day 2: Legs Workout</div>

    <div class="content daytxt">
        Day 3: Shoulders and Arms Workout</div>

    <div class="content daytxt">
        Day 4: Rest</div>

    <div class="content daytxt">
        Day 5: Chest, Shoulders, and Triceps Workout</div>

    <div class="content daytxt">
        Day 6: Back and Biceps Workout</div>

    <div class="content daytxt">
        Day 7: Legs Workout</div>
        </span>
</asp:Content>
