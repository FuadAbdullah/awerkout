﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="WorkoutPlan.aspx.cs" Inherits="awerkout.WorkoutPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="workoutstyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;" class="table">
        <tr>
            <td>
                <asp:LinkButton ID="myDashboardlnk" class="nav" runat="server" OnClick="myDashboardlnk_Click">My Dashboard</asp:LinkButton>
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
    <div class="main txt" style="text-align: left; font-size: 45px; color: #FFFFFF; font-style: italic;">
        Split by goals:<br />
        Aesthetics<br />
        Shredded<br />
        Powerlifting<br />
        Exercising  
    </div>

    <div class="container">
        <div id="plan1" class="txt" style="font-style: italic; color: #3cd716">
                <p style="position:absolute;text-shadow: 0px 2px 7px black;">Beginner</p>
            <asp:Button ID="BeginnerBtn" class="btn" runat="server" Text="Learn more" OnClick="BeginnerBtn_Click" />
        </div>
        <div id="plan2" class="txt" style="font-style: italic; font-size:35px; color: #ffa500;">
                <p style="position:absolute;text-shadow: 0px 2px 7px black;">Intermediate</p>
            <asp:Button ID="IntermediateBtn" class="btn" runat="server" Text="Learn more" OnClick="IntermediateBtn_Click" />
        </div>
        <div id="plan3" class="txt" style="font-style: italic; color: #e25822">
                <p style="position:absolute;text-shadow: 0px 2px 7px black;">Advanced</p>
             <asp:Button ID="AdvancedBtn" class="btn" runat="server" Text="Learn more" OnClick="AdvancedBtn_Click" />
        </div>

    </div>


</asp:Content>
