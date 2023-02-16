<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="guide.aspx.cs" Inherits="awerkout.guide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="guidestyle.css" />
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

    <div>
        <div class="video">
            <center>
                <iframe width="960" height="540" src="https://www.youtube.com/embed/3p8EBPVZ2Iw" 
                title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
                </iframe>
            </center>
            <div class="txt"> 
                6 PACK ABS For Beginners You Can Do Anywhere
            </div>
        </div>
        <div class="video">
            <center>
                <iframe width="960" height="540" src="https://www.youtube.com/embed/BkS1-El_WlE" 
                title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
                </iframe>
            </center>
            <div class="txt"> 
                The BEST HOME CHEST WORKOUT (NO EQUIPMENT NEEDED)
            </div>
        </div>
        <div class="video">
            <center>
                <iframe width="960" height="540" src="https://www.youtube.com/embed/tB3X4TjTIes" 
                title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
                </iframe>
            </center>
            <div class="txt"> 
                How To Start Calisthenics - PULL UPS | THENX
            </div>
        </div>
        <div class="video">
            <center>
                <iframe width="960" height="540" src="https://www.youtube.com/embed/E8SLO3JgUbQ" 
                title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
                </iframe>
            </center>
            <div class="txt"> 
                Lose Stubborn Belly Fat - 5 Minute Home Ab Workout
            </div>
        </div>
        <div class="video">
            <center>
                <iframe width="960" height="540" src="https://www.youtube.com/embed/XNTj8RZVcrE" 
                title="YouTube video player" frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
                </iframe>
            </center>
            <div class="txt"> 
                Bigger Arms Workout (Dumbbells Only)
            </div>
        </div>

    </div>



</asp:Content>
