<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="Awerkout.aspx.cs" Inherits="awerkout.Awerkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="awerkoutstyle.css" />
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
    <div class="workout txt">
        Workout
        For Beginner<br />
        <asp:Button ID="WorkoutPlanBtn" class="btn" style="float: right" runat ="server" Text="Learn more" />
    </div>
    <%--<div class="content2">
        <div class="guides">
            Guides
            <asp:Button ID="GuidesBtn" class="btn" runat="server" Text="Learn more" />
        </div>
        <div class="signin">
            Become a member today
            <asp:Button ID="SigninBtn" class="signupbtn" runat="server" Text="SIGN UP NOW" />
        </div>
        <div class="nutrition">
            Nutrition
            <asp:Button ID="NutritionBtn" class="btn" runat="server" Text="Learn more" />
        </div>    
    </div>--%>
    <div class="container">
        <div id="guides" class="txt">
            Guides<br />
            <asp:Button ID="GuidesBtn" class="btn" style="float: right" runat="server" Text="Learn more" />
        </div>
        
        <div id="nutrition" class="txt">
            Nutrition<br />
            <asp:Button ID="NutritionBtn" class="btn" style="float: right" runat="server" Text="Learn more" />
        </div>
        <div id="signin"  class="txt">
            Become a member today
            <asp:Button ID="SigninBtn" class="signupbtn" runat="server" Text="SIGN UP NOW" />
    </div>
    </div>
        <%--<div class="content2">
            <div class="guides txt">
                Guides<br />
            <asp:Button ID="GuidesBtn" class="btn" style="float: right" runat="server" Text="Learn more" />
            </div>
            <div class="nutrition txt">
                Nutrition<br />
            <asp:Button ID="NutritionBtn" class="btn" style="float: right" runat="server" Text="Learn more" />
            </div>  
        </div>
        <div class="content3">
            <div class="signin txt">
                Become a member today
                <asp:Button ID="SigninBtn" class="signupbtn" runat="server" Text="SIGN UP NOW" />
            </div>
        </div>--%>
        
            <%--<div class="nutrition txt">
                Nutrition<br />
            <asp:Button ID="NutritionBtn" class="btn" style="float: right" runat="server" Text="Learn more" />
            </div>  --%>
</asp:Content>
