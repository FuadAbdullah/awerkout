<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="reportCardPage.aspx.cs" Inherits="awerkout.content.reportCardPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="../userprofilestyle.css" />
    <style type="text/css">
        .align-right {
            text-align: right;
        }

        .align-center {
            text-align: center;
        }

        .auto-style2 {
            text-align: right;
            height: 26px;
        }

        .auto-style3 {
            height: 26px;
        }

        .auto-style4 {
            width: 177px;
        }

        .auto-style5 {
            height: 26px;
            width: 177px;
            text-align: right;
        }

        .auto-style6 {
            width: 177px;
            height: 29px;
            text-align: right;
        }

        .auto-style7 {
            height: 29px;
        }

        .auto-style8 {
            width: 177px;
            height: 28px;
            text-align: right;
        }

        .auto-style9 {
            height: 28px;
        }

        .auto-style10 {
            text-align: center;
            height: 26px;
        }

        .auto-style12 {
            width: 477px;
        }

        .auto-style15 {
            width: 177px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myDashboardlnk" runat="server" OnClick="myDashboardlnk_Click" class="nav" CausesValidation="False">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click" class="nav" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <br />
    <br />
    <asp:Label ID="quizGreeterLbl" runat="server" Text="Below is the most recent result of your quiz session:"></asp:Label>
    <br />
    <br />
    <asp:Label ID="noContentLbl" runat="server" Visible="false" Text="Uh-oh, it seems like you had never sat for a quiz yet, :'("></asp:Label>
    <asp:Repeater ID="quizRepeater" runat="server">
        <ItemTemplate>
            <script type="text/javascript">
                function RadioButton_CheckedChanged(sender, args) {
                    var group = document.getElementsByName(sender.name);
                    for (var i = 0; i < group.length; i++) {
                        group[i].checked = false;
                    }
                    sender.checked = true;
                }
            </script>
            <table class="auto-style1" style="width: 100%">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="quizTitleLbl" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                        <br />
                        <asp:RadioButton ID="Option1" runat="server"
                            Checked='<%# Eval("answer").ToString().Trim().Equals("Option1") ? true : false %>'
                            Text='<%# Eval("Answer1") %>'
                            GroupName='<%# Eval("quizID") %>'
                            AutoPostBack="true"
                            onclick="RadioButton_CheckedChanged" />
                        <br />
                        <asp:RadioButton ID="Option2" runat="server"
                            Checked='<%# Eval("answer").ToString().Trim().Equals("Option2") ? true : false %>'
                            Text='<%# Eval("Answer2") %>'
                            GroupName='<%# Eval("quizID") %>'
                            AutoPostBack="true"
                            onclick="RadioButton_CheckedChanged" />
                        <br />
                        <asp:RadioButton ID="Option3" runat="server"
                            Checked='<%# Eval("answer").ToString().Trim().Equals("Option3") ? true : false %>'
                            Text='<%# Eval("Answer3") %>'
                            GroupName='<%# Eval("quizID") %>'
                            AutoPostBack="true"
                            onclick="RadioButton_CheckedChanged" />
                        <br />
                        <asp:RadioButton ID="Option4" runat="server"
                            Checked='<%# Eval("answer").ToString().Trim().Equals("Option4") ? true : false %>'
                            Text='<%# Eval("Answer4") %>'
                            GroupName='<%# Eval("quizID") %>'
                            AutoPostBack="true"
                            onclick="RadioButton_CheckedChanged" />
                        <br />
                        <asp:Label ID="quizCorrectnessLbl" runat="server" Text='<%# "Answer is " + (Eval("answer").ToString().Trim().Equals(Eval("correctans").ToString().Trim()) ? "correct" : "incorrect") %>'></asp:Label>
                        <br />
                        <asp:Label ID="quizTakenDateLbl" runat="server" Text='<%# "Question was answered on " + Eval("updatedAt").ToString().Trim() %>'></asp:Label>
                        <br />
                        <asp:Label ID="quizReviseDateLbl" runat="server" Text='<%# "Question was revised on " + Eval("RevisionDate").ToString().Trim() %>'></asp:Label>
                        <br />
                        <asp:Label ID="quizAvailabilityLbl" runat="server" Text='<%# bool.Parse(Eval("NoLongerAvailable").ToString().Trim()) == true ? "No longer available for retake": "Available for retake"%>'></asp:Label>
                        <br />
                        <br />
                    </td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
            <br />
            <tr>
                <td>
                    <br />
                    <asp:Label ID="quizSummaryLbl" runat="server" Text="Summary of your last quiz session:"></asp:Label>
                    <br />
                    <asp:Label ID="quizTotalAnsweredLbl" runat="server" Text='<%# "Total answered: " + Session["totalQuizAnswered"] %>'></asp:Label>
                    <br />
                    <asp:Label ID="quizTotalCorrectLbl" runat="server" Text='<%# "Total correct: " + Session["totalQuizCorrect"] %>'></asp:Label>
                    <br />
                    <asp:Label ID="quizTotalWrongLbl" runat="server" Text='<%# "Total wrong: " + Session["totalQuizWrong"] %>'></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
