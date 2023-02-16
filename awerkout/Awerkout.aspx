<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Awerkout.aspx.cs" Inherits="awerkout.Awerkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="awerkoutstyle.css" />
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
    <div class="workout txt" style="color: #ff8c00; font-size: 60px; font-style: italic">
        Browse Curated Posts<br />
        <asp:Button ID="WorkoutPlanBtn" class="btn" style="float: right" runat ="server" Text="Go!" OnClick="contentPageBtn_Click" />
    </div>
    <div class="container" style="float: left">
        <div id="guides" class="txt" style="color: #ff6700; font-style: italic; font-size: 55px;">
            Guides
            <asp:Button ID="GuidesBtn" class="gbtn" runat="server" Text="Learn more" OnClick="GuidesBtn_Click"/>
        </div>
        <div id="nutrition" class="txt" style="color: #2e8b57; font-style: italic; font-size: 55px;">
            Nutrition
            <asp:Button ID="NutritionBtn" class="gbtn" runat="server" Text="Learn more" OnClick="NutritionBtn_Click" />
        </div>

    </div>
    <div class="container2" style="float: right">
        <div id="signup" class="txt" style="color: #9400d3; font-style: italic; font-size: 65px">
            Become a Member Today !
            <asp:Button ID="SignupBtn" class="sbtn" runat="server" Text="Learn more" OnClick="SignupBtn_Click" />
        </div>

    </div>


    </div>

</asp:Content>
  