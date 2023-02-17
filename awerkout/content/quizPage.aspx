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
        let answeredObj = {};
        let buttonClicked = false;

        function initAnsweredObj() {
            $.ajax({
                type: 'GET',
                url: 'quizPage.aspx/GetCurrentAnswerObj',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                    answeredObj["Question1"] = response.d["Question1"];
                    answeredObj["Question2"] = response.d["Question2"];
                    answeredObj["Question3"] = response.d["Question3"];
                    answeredObj["Question4"] = response.d["Question4"];
                    answeredObj["Question5"] = response.d["Question5"];
                    answeredObj["Question6"] = response.d["Question6"];
                    answeredObj["Question7"] = response.d["Question7"];
                    answeredObj["Question8"] = response.d["Question8"];
                    answeredObj["Question9"] = response.d["Question9"];
                    answeredObj["Question10"] = response.d["Question10"];
                    console.log(answeredObj);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error: ' + jqXHR.responseText);
                }
            });
        }

        function registerAnswer(index) {
            answeredObj["Question" + index] = true;

            var count = 0;
            for (var key in answeredObj) {
                if (answeredObj.hasOwnProperty(key) && answeredObj[key]) {
                    count++;
                }
            }
            sendAnsweredQuestions();
            initAnsweredObj();
        }

        function submitAnswer() {
            buttonClicked = true;
            console.log(buttonClicked);
            sendAnsweredQuestions();
            __doPostBack('<%= quizSubmitBtn.ID %>', '');
        }

        function sendAnsweredQuestions() {
            $.ajax({
                type: 'POST',
                url: 'quizPage.aspx/SetCurrentAnswerObj',
                data: JSON.stringify({ answeredObj: answeredObj }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    console.log('Data sent to server successfully.');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error: ' + jqXHR.responseText);
                }
            });
        }

        function destroyQuizSession() {
            if (!buttonClicked) {
                $.ajax({
                    type: 'POST',
                    url: 'quizPage.aspx/DestroyHttpContextSession',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        console.log('Session ended');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error: ' + jqXHR.responseText);
                    }
                });
            }
        }

        function refreshPage() {
            window.location.reload();
        }

        window.onload = function () {
            console.log(buttonClicked);

            initAnsweredObj();
        }
        window.onbeforeunload = function () {
            destroyQuizSession();
        }

        window.onre
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <br />
    <br />
    <div style="margin: auto auto 5% auto; width: 50%; text-align: center;">
        <asp:Label ID="instructionLbl" runat="server" Text="You must answer all of the 10 questions below" Font-Bold="True"></asp:Label>
        <hr />
    </div>
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
            </table>
        </ItemTemplate>
    </asp:Repeater>
    <table id="submit">
        <tr>
            <td style="margin: 5% auto 5% auto; width: 50%; text-align: center;">
                <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="quizSubmitBtn" class="btn" runat="server" Text="Finish Quiz" OnClick="quizSubmitBtn_Click" OnClientClick="submitAnswer();" />
            </td>
        </tr>
    </table>
</asp:Content>
