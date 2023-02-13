<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="awerkout.userDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="userDashboardstyle.css" />
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
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click" CausesValidation="False">My Profile</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>

     <div id="content2">

        <div id="contentpage" class="txt workoutplan">


            Browse Curated Posts

            <asp:Button ID="ContentPageBtn" class="wrkbtn" runat="server" Text="Go!" OnClick="ContentPageBtn_Click"/>
        </div>
         <div id="contentpage2" class="txt workoutplan">


            Answer Some Quizzes

            <asp:Button ID="QuizPageBtn" class="wrkbtn" runat="server" Text="Bring it on!" OnClick="QuizPageBtn_Click"/>
        </div><div id="contentpage3" class="txt workoutplan">


            View Quiz Report Card

            <asp:Button ID="ReportCardBtn" class="wrkbtn" runat="server" Text="Go Ahead!" OnClick="ReportCardBtn_Click"/>
        </div>
    </div>
    <div id="content">

        <div id="workoutplan1" class="txt workoutplan">


            Beginner Workout plan

            <asp:Button ID="BeginnerBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="BeginnerBtn_Click"/>
        </div>

        <div id="workoutplan2" class="txt workoutplan">


            Intermediate Workout Plan
            <asp:Button ID="IntermediateBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="IntermediateBtn_Click"/>
        </div>
        <div id="workoutplan3" class="txt workoutplan">


            Advanced Workout Plan
            <asp:Button ID="AdvancedBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="AdvancedBtn_Click"/>
        </div>

    </div>
    <div id="BMI">
        <h1 style="text-align: center;">BMI</h1>
            <table class="auto-style3">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="heightlbl" class="bmitxt" runat="server" Text="Height: (in M)"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="heightTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Label ID="weightlbl" class="bmitxt" runat="server" Text="Weight: (in KG)"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="weightTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12">
                    <asp:Button ID="calculate" class="btn" runat="server" Text="Calculate" OnClick="calculate_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="ErrMsg" runat="server" Text="[errMsg]" ForeColor="red"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2">
                    <asp:Label ID="calculation" runat="server" Text="[BMI]"></asp:Label>
                </td>
            </tr>
            </table>


    </div>

</asp:Content>
