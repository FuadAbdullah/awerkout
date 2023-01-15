<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Beginner.aspx.cs" Inherits="awerkout.Beginner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutplandetailstyle.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
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
        <img src="Images/Beginner header.PNG" id="imgheader"/>
        <div id="txt"> 
            Beginner Full Body Workout Routine for Men 
            <br />
            <br />
            <div class="auto-style2">
            We shall begin with a workout routine that 
            is best suited for people who are new to the 
            fitness domain. So, you may consider this as 
            a beginner-level workout routine for men. </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="content daytxt">
        Day 1: Chest, Back, Shoulders, Legs, Biceps, Triceps Gym Workout Plan



    </div>

    <div class="content daytxt">
        Day 2: Legs, Triceps, Biceps, Chest, Back, Shoulder Gym Routine for Men



    </div>
    <div class="content daytxt">
        Day 3: Shoulders, Back, Chest, Legs, Triceps, Biceps



    </div>
</asp:Content>
