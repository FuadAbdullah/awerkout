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

        .auto-style13 {
            width: 200px;
            text-align: right;
            height: 48px;
        }

        .auto-style14 {
            text-align: left;
            height: 48px;
        }

        .auto-style15 {
            width: 200px;
            text-align: left;
            height: 27px;
        }

        .auto-style16 {
            text-align: left;
            height: 27px;
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

            <asp:Button ID="ContentPageBtn" class="wrkbtn" runat="server" Text="Go!" OnClick="ContentPageBtn_Click" CausesValidation="False" />
        </div>
        <div id="contentpage2" class="txt workoutplan">
            Answer Quizzes

            <asp:Button ID="QuizPageBtn" class="wrkbtn" runat="server" Text="Bring it on!" OnClick="QuizPageBtn_Click" CausesValidation="False" />
        </div>
        <div id="contentpage3" class="txt workoutplan">
            View Quiz Report Card

            <asp:Button ID="ReportCardBtn" class="wrkbtn" runat="server" Text="Go Ahead!" OnClick="ReportCardBtn_Click" CausesValidation="False" />
        </div>
    </div>
    <div id="content">

        <div id="workoutplan1" class="txt workoutplan">
            Beginner Workout plan

            <asp:Button ID="BeginnerBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="BeginnerBtn_Click" CausesValidation="False" />
        </div>

        <div id="workoutplan2" class="txt workoutplan">
            Intermediate Workout Plan
            <asp:Button ID="IntermediateBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="IntermediateBtn_Click" CausesValidation="False" />
        </div>
        <div id="workoutplan3" class="txt workoutplan">
            Advanced Workout Plan
            <asp:Button ID="AdvancedBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="AdvancedBtn_Click" CausesValidation="False" />
        </div>

    </div>
    <div id="BMI">
        <h1 style="text-align: center;">BMI</h1>
        <table class="auto-style3">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
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
                <td class="auto-style7">
                    <asp:Label ID="ErrMsg" runat="server" Text="[ErrMsg]" ForeColor="red"></asp:Label>
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
    <div id="Feedback">
        <h1 style="text-align: center;">We'd love to hear your feedback!</h1>
        <table class="auto-style3">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:RequiredFieldValidator ID="Subject_required" runat="server" ControlToValidate="FeedbackSubjectTxtBx" ErrorMessage="Subject is required." ForeColor="Red" ValidationGroup="feedback">*</asp:RequiredFieldValidator>
                    <asp:Label ID="FeedbackSubjectLbl" class="bmitxt" runat="server" Text="Subject:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="FeedbackSubjectTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="Description_required" runat="server" ControlToValidate="FeedbackDescTxtBx" ErrorMessage="Description is required." ForeColor="Red" ValidationGroup="feedback">*</asp:RequiredFieldValidator>
                    <asp:Label ID="FeedbackDescLbl" class="bmitxt" runat="server" Text="Description:"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="FeedbackDescTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" class="bmitxt" runat="server" Text="Rate our website and service:"></asp:Label>
                    <br />
                    <asp:RadioButton ID="r1" runat="server" Text="1" GroupName="RatingGroup" AutoPostBack="true" onclick="RadioButton_CheckedChanged" />
                    <asp:RadioButton ID="r2" runat="server" Text="2" GroupName="RatingGroup" AutoPostBack="true" onclick="RadioButton_CheckedChanged" />
                    <asp:RadioButton ID="r3" runat="server" Text="3" GroupName="RatingGroup" AutoPostBack="true" onclick="RadioButton_CheckedChanged" />
                    <asp:RadioButton ID="r4" runat="server" Text="4" GroupName="RatingGroup" AutoPostBack="true" onclick="RadioButton_CheckedChanged" />
                    <asp:RadioButton ID="r5" runat="server" Text="5" GroupName="RatingGroup" AutoPostBack="true" onclick="RadioButton_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12" colspan="2">
                    <asp:Button ID="FeedbackSubmitButton" class="btn" runat="server" Text="Submit Feedback" OnClick="FeedbackSubmitButton_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="[errMsg]" ForeColor="red"></asp:Label>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." ValidationGroup="feedback" />
                </td>
            </tr>
        </table>


    </div>
    <script type="text/javascript">
        function RadioButton_CheckedChanged(sender, args) {
            var group = document.getElementsByName(sender.name);
            for (var i = 0; i < group.length; i++) {
                group[i].checked = false;
            }
            sender.checked = true;
        }
    </script>


</asp:Content>
