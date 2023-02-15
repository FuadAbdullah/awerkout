<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="manageQuizzes.aspx.cs" Inherits="awerkout.manageQuizzes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="adminDashboardstyle.css" />
    <style type="text/css">
        .auto-style2 {
            text-align: right;
            height: 26px;
        }

        .auto-style3 {
            width: 100%;
        }

        .auto-style4 {
            height: 22px;
        }

        .auto-style5 {
            width: 95px;
        }

        .auto-style6 {
            height: 22px;
            width: 214px;
        }

        .auto-style9 {
            width: 770px;
        }

        .auto-style10 {
            height: 22px;
            width: 770px;
        }

        .auto-style11 {
            text-align: right;
            height: 26px;
            width: 214px;
        }

        .auto-style12 {
            width: 214px;
        }
        .auto-style13 {
            text-align: right;
            height: 25px;
            width: 214px;
        }
        .auto-style14 {
            width: 770px;
            height: 25px;
        }
        .auto-style17 {
            height: 27px;
        }
        .auto-style18 {
            width: 770px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myDashboardlnk" class="nav" runat="server" OnClick="myDashboardlnk_Click" CausesValidation="false">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click" class="nav" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <br />

    <div id="quiz">
        <h1 style="text-align: center;">MANAGE QUIZ</h1>


        <table class="auto-style3">
            <tr>
                <td class="auto-style11">
                </td>
                <td class="auto-style18">
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="QuestionIDErrMsg"
                        runat="server"
                        ErrorMessage="Question is required"
                        ForeColor="Red"
                        ControlToValidate="questionDropDown">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="QuizQuestionID" runat="server" Text="Question ID: "></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="QuestionDropDown" class="TxtBx" runat="server" OnSelectedIndexChanged="QuestionDropDown_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="QuestionErrMsg"
                        runat="server"
                        ErrorMessage="Question is required."
                        ControlToValidate="QuestionTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="QuizQuestionTitle" runat="server" Text="Question:"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="QuestionTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style18"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="Option1ErrMsg"
                        runat="server"
                        ErrorMessage="Option1 is required."
                        ControlToValidate="option1TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="Option1" runat="server" Text="Option 1: "></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="option1TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="Option2ErrMsg"
                        runat="server"
                        ErrorMessage="Option2 is required."
                        ControlToValidate="option2TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="Option2" runat="server" Text="Option 2: "></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="option2TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="Option3ErrMsg"
                        runat="server"
                        ErrorMessage="Option3 is required."
                        ControlToValidate="option3TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="Option3" runat="server" Text="Option 3: "></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="option3TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="Option4ErrMsg"
                        runat="server"
                        ErrorMessage="Option4 is required."
                        ControlToValidate="option4TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="Option4" runat="server" Text="Option 4: "></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="option4TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator
                        ID="AnswerErrMsg"
                        runat="server"
                        ErrorMessage="Answer is required."
                        ControlToValidate="AnswerDropDown"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="Answer" runat="server" Text="Answer: "></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="AnswerDropDown" class="TxtBx" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">

                    <asp:Button ID="Update" class="btn" style="width:30%" runat="server" Text="Update" OnClick="Update_Click" />
                    <asp:Button ID="Delete" class="btn" style="width:30%" runat="server" Text="Delete" OnClick="Delete_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="2">
                    <asp:Label ID="quizAuthorLbl" runat="server" Font-Size="Smaller" Text="Created By"></asp:Label>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="quizCreationDateLbl" runat="server" Font-Size="Smaller" Text="Created On"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17" colspan="2">
                    <asp:Label ID="quizUpdateDateLbl" runat="server" Font-Size="Smaller" Text="Updated On"></asp:Label>
                </td>
                <td class="auto-style17"></td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    <asp:Button ID="CreateQuizBtn" class="btn" runat="server" Text="Create New" OnClick="CreateQuizBtn_Click" CausesValidation="false" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
