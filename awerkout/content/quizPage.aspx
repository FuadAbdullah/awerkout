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
            // SetQuizAnswerObj(count);
            // console.log("Count:" + count);
        }

        function submitAnswer() {
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
            $.ajax({
                type: 'POST',
                url: 'quizPage.aspx/DestroyHttpContextSession',
                success: function () {
                    console.log('Session ended');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error: ' + jqXHR.responseText);
                }
            });
        }

        function testJSONSerializer() {

            let testData = {
                name: "Fuad",
                age: "22",
                gender: "Male"
            }

            let stringified = JSON.stringify(testData)
            console.log(stringified);

            $.ajax({
                type: 'POST',
                url: 'quizPage.aspx/TestJSONDeserializer',
                data: JSON.stringify({ person: testData }),
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

        window.onload = function () {

            initAnsweredObj();

            // Set the countdown start time (in seconds)
            var countdownSeconds = 90;

            // Get the countdownLabel element
            var countdownLabel = document.getElementById('<%= timerLbl.ClientID %>');

            // Set an interval to update the countdown every second
            var countdownInterval = setInterval(function () {
                // Calculate the minutes and seconds remaining
                var minutes = Math.floor(countdownSeconds / 60);
                var seconds = countdownSeconds % 60;

                // Pad the minutes and seconds with leading zeros if necessary
                var minutesString = ("0" + minutes).slice(-2);
                var secondsString = ("0" + seconds).slice(-2);

                // Update the countdownLabel text
                countdownLabel.innerHTML = "Time left: " + minutesString + ":" + secondsString;

                // console.log("Time left: " + minutesString + ":" + secondsString);

                // Decrement the countdownSeconds variable
                countdownSeconds--;

                // If the countdown is finished, clear the interval and update the countdownLabel text
                if (countdownSeconds < 0) {
                    clearInterval(countdownInterval);
                    countdownLabel.innerHTML = "Time's up!";
                }
            }, 1000);

        }
        window.onbeforeunload = function () {
            destroyQuizSession();
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <br />
    <br />
    <div style="margin: auto auto 5% auto; width: 50%; text-align: center;">
        <asp:Label ID="instructionLbl" runat="server" Text="You are given 1 minute 30 seconds to perform this quiz. You must answer all of the 10 questions below" Font-Bold="True"></asp:Label>
        <hr />
        <asp:Label ID="timerLbl" runat="server" Text="Time left: 01:30" Font-Bold="True" ClientIDMode="Static"></asp:Label>
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
