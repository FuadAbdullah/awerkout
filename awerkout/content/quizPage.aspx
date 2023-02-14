<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="quizPage.aspx.cs" Inherits="awerkout.content.quizPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="../userprofilestyle.css" />
    <link rel="stylesheet" href="quizstyle.css" />
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
    <script type="text/javascript">
        let answeredObj = {
            'Question1': false,
            'Question2': false,
            'Question3': false,
            'Question4': false,
            'Question5': false,
            'Question6': false,
            'Question7': false,
            'Question8': false,
            'Question9': false,
            'Question10': false,
        };

        function registerAnswer(index) {
            answeredObj["Question" + index] = true;

            var count = 0;
            for (var key in answeredObj) {
                if (answeredObj.hasOwnProperty(key) && answeredObj[key]) {
                    count++;
                }
            }
            SetQuizAnswerObj(count);
            console.log("Count:" + count);
        }

        function SetQuizAnswerObj(value) {

            $.ajax({
                type: 'POST',
                url: 'quizPage.aspx/SetSessionData',
                data: JSON.stringify({ value: value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    console.log('Data sent to server successfully.');
                },
                error: function () {
                    console.log('Error sending data to server.');
                }
            });
        }

        function refreshPage() {
            window.location.reload();
        }

                //function RadioButton_CheckedChanged(sender, args) {
                //    var group = document.getElementsByName(sender.name);
                //    for (var i = 0; i < group.length; i++) {
                //        group[i].checked = false;
                //    }
                //    sender.checked = true;
                //}

    </script>
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
    <br />
    <asp:Repeater ID="quizRepeater" runat="server">
        <ItemTemplate>
            <table id="quiz">
                <tr>
                    <td class="auto-style4 txt">
                        <asp:Label ID="quizTitleLbl" class="questiontxt" runat="server" Text='<%# Eval("question") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:RadioButton ID="Option1" runat="server"
                            Text='<%# Eval("Answer1") %>'
                            GroupName='<%# Eval("quizID") %>'
                            onclick='<%# "registerAnswer(" + ( Container.ItemIndex + 1 ) + ")" %>' />
                        <br />
                        <asp:RadioButton ID="Option2" runat="server"
                            Text='<%# Eval("Answer2") %>'
                            GroupName='<%# Eval("quizID") %>'
                            onclick='<%# "registerAnswer(" + ( Container.ItemIndex + 1 ) + ")" %>' />
                        <br />
                        <asp:RadioButton ID="Option3" runat="server"
                            Text='<%# Eval("Answer3") %>'
                            GroupName='<%# Eval("quizID") %>'
                            onclick='<%# "registerAnswer(" + ( Container.ItemIndex + 1 ) + ")" %>' />
                        <br />
                        <asp:RadioButton ID="Option4" runat="server"
                            Text='<%# Eval("Answer4") %>'
                            GroupName='<%# Eval("quizID") %>'
                            onclick='<%# "registerAnswer(" + ( Container.ItemIndex + 1 ) + ")" %>' />
                        <br />
                        <br />
                    </td>
                </tr>
                
        </ItemTemplate>
        <FooterTemplate>
            <tr>
                <td>
                    <asp:Button ID="quizSubmitBtn" class="btn" runat="server" Text="Finish Quiz" OnClick="quizSubmitBtn_Click" />
                </td>
            </tr>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
