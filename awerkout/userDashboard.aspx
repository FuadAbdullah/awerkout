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

        .auto-style12 {
            text-align: left;
            height: 63px;
        }

        .auto-style13 {
            width: 200px;
            text-align: right;
            height: 48px;
        }

        .auto-style15 {
            width: 200px;
            text-align: left;
            height: 27px;
        }

        .auto-style17 {
            width: 200px;
            text-align: left;
            height: 22px;
        }

        .auto-style18 {
            text-align: left;
            height: 22px;
        }

        .auto-style19 {
            width: 200px;
            text-align: right;
            height: 106px;
        }

        .auto-style20 {
            text-align: left;
            width: 100%;
            height: 106px;
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
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">Browse Curated Posts</p>
            <asp:Button ID="ContentPageBtn" class="wrkbtn" runat="server" Text="Go!" OnClick="ContentPageBtn_Click" CausesValidation="False" />
        </div>
        <div id="contentpage2" class="txt workoutplan">
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">Answer Quizzes</p>
            <asp:Button ID="QuizPageBtn" class="wrkbtn" runat="server" Text="Bring it on!" OnClick="QuizPageBtn_Click" CausesValidation="False" />
        </div>
        <div id="contentpage3" class="txt workoutplan">
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">View Quiz Report Card</p>
            <asp:Button ID="ReportCardBtn" class="wrkbtn" runat="server" Text="Go Ahead!" OnClick="ReportCardBtn_Click" CausesValidation="False" />
        </div>
    </div>
    <div id="content">

        <div id="workoutplan1" class="txt workoutplan">
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">Beginner Workout Plan</p>
            <asp:Button ID="BeginnerBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="BeginnerBtn_Click" CausesValidation="False" />
        </div>

        <div id="workoutplan2" class="txt workoutplan">
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">Intermediate Workout Plan</p>
            <asp:Button ID="IntermediateBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="IntermediateBtn_Click" CausesValidation="False" />
        </div>
        <div id="workoutplan3" class="txt workoutplan">
            <p style="position: absolute; text-shadow: 0px 2px 7px black;">Advanced Workout Plan</p>
            <asp:Button ID="AdvancedBtn" class="wrkbtn" runat="server" Text="Learn more" OnClick="AdvancedBtn_Click" CausesValidation="False" />
        </div>

    </div>
    <div id="BMI">
        <h1 style="text-align: center;">Calculate your BMI using this handy calculator!</h1>
        <table class="auto-style3">
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding: 0px 5% 0px 5%">
                    <p style="font-size: small">BMI stands for <strong>Body Mass Index</strong>, which is a measure of body fat based on height and weight. BMI is an important tool that can help individuals determine if they are at a healthy weight for their height. BMI is important because being overweight or obese can increase the risk of many health problems, including diabetes, heart disease, and some cancers.</p>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="height_required" runat="server" ControlToValidate="heightTxtBx" ErrorMessage="Height is required." ForeColor="Red" ValidationGroup="bmivalidator">*</asp:RequiredFieldValidator>
                    <asp:Label ID="heightlbl" class="bmitxt" runat="server" Text="Height (in M): "></asp:Label>
                </td>
                <td class="auto-style8" style="width: 70%; padding: 0px 30% 0px 0%">
                    <asp:TextBox ID="heightTxtBx" class="TxtBx" runat="server" TextMode="Number" Step="any" ToolTip="The value will automatically be converted to M if inserted in CM (3 digits and above)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="weight_required" runat="server" ControlToValidate="weightTxtBx" ErrorMessage="Weight is required." ForeColor="Red" ValidationGroup="bmivalidator">*</asp:RequiredFieldValidator>
                    <asp:Label ID="weightlbl" class="bmitxt" runat="server" Text="Weight (in KG):"></asp:Label>
                </td>
                <td class="auto-style8" style="width: 70%; padding: 0px 30% 0px 0%">
                    <asp:TextBox ID="weightTxtBx" class="TxtBx" runat="server" TextMode="Number" Step="any"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style12">
                    <asp:Button ID="calculate" class="btn" runat="server" Text="Calculate" OnClick="calculate_Click" ValidationGroup="bmivalidator" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style7">
                    <asp:Label ID="ErrMsg" runat="server" Text="[ErrMsg]" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2">
                    <asp:Label ID="calculation" runat="server" Text="[BMI]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2" style="padding: 0 25% 0 25%">
                    <asp:Label ID="category" runat="server" Text="[CAT]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="2" style="text-align: left">
                    <asp:ValidationSummary ID="bmivalidator" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." ValidationGroup="bmivalidator" />
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
                <td class="auto-style8" style="width: 70%; padding: 0px 10% 0px 0%">
                    <asp:TextBox ID="FeedbackSubjectTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style19" style="vertical-align: top;">
                    <asp:RequiredFieldValidator ID="Description_required" runat="server" ControlToValidate="FeedbackDescTxtBx" ErrorMessage="Description is required." ForeColor="Red" ValidationGroup="feedback">*</asp:RequiredFieldValidator>
                    <asp:Label ID="FeedbackDescLbl" class="bmitxt" runat="server" Text="Description:"></asp:Label>
                </td>
                <td class="auto-style20" style="width: 70%; padding: 0px 10% 0px 0%">
                    <asp:TextBox ID="FeedbackDescTxtBx" class="TxtBx" runat="server" Height="100px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" colspan="2" style="width: 100%">
                    <hr />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:RequiredFieldValidator ID="Rating_required" runat="server" ControlToValidate="RatingRadioButtons" ErrorMessage="Rating is required." ForeColor="Red" ValidationGroup="feedback">*</asp:RequiredFieldValidator>
                    <asp:Label ID="FeedbackTitle" class="bmitxt" runat="server" Text="Rate our website and service:"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="RatingRadioButtons" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12" colspan="2">
                    <asp:Button ID="FeedbackSubmitButton" class="btn" runat="server" Text="Submit Feedback" OnClick="FeedbackSubmitButton_Click" ValidationGroup="feedback" />
                </td>
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">
                    <asp:Label ID="ErrMsg2" runat="server" Text="[errMsg]" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." ValidationGroup="feedback" />
                </td>
            </tr>
        </table>


    </div>


</asp:Content>
