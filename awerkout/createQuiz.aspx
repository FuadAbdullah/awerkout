<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="createQuiz.aspx.cs" Inherits="awerkout.createQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="createquizstyle.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 574px;
        }
        .auto-style2 {
            width: 174px;
        }
        .auto-style3 {
            width: 174px;
            height: 22px;
        }
        .auto-style4 {
            height: 22px;
        }
        .auto-style5 {
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
            <tr>
                <td class="align-right">
                    <asp:LinkButton ID="myDashboardlnk" class="nav" runat="server" OnClick="myDashboardlnk_Click" CausesValidation="false">My Dashboard</asp:LinkButton>
                </td>
                <td class="align-right">
                    <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click" CausesValidation="false">Sign Out</asp:LinkButton>
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <div id="quizbox">
        <h1 style="text-align:center">Create Quiz</h1>
            <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="QuizQuestion" runat="server" Text="Question: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="QuestionErrMsg" 
                        runat="server" 
                        ErrorMessage="Question is required"
                        ForeColor="Red" 
                        ControlToValidate="questionTxtBx">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="questionTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Option1" runat="server" Text="Option 1: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="Option1ErrMsg" 
                        runat="server" 
                        ErrorMessage="Option1 is required." 
                        ControlToValidate="option1TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="option1TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Option2" runat="server" Text="Option2: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="Option2ErrMsg" 
                        runat="server" 
                        ErrorMessage="Option2 is required." 
                        ControlToValidate="option2TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="option2TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Option3" runat="server" Text="Option3: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="Option3ErrMsg" 
                        runat="server" 
                        ErrorMessage="Option3 is required." 
                        ControlToValidate="option3TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="option3TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Option4" runat="server" Text="Option4: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="Option4ErrMsg" 
                        runat="server" 
                        ErrorMessage="Option4 is required." 
                        ControlToValidate="option4TxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="option4TxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Answer" runat="server" Text="Answer: "></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="AnswerErrMsg" 
                        runat="server" 
                        ErrorMessage="Answer is required." 
                        ControlToValidate="AnswerDropDown"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:DropDownList ID="AnswerDropDown" class="TxtBx" runat="server">
                        <asp:ListItem>Option1</asp:ListItem>
                        <asp:ListItem>Option2</asp:ListItem>
                        <asp:ListItem>Option3</asp:ListItem>
                        <asp:ListItem>Option4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">
                    <asp:Button ID="CreateBtn" class="btn" runat="server" Text="Create" OnClick="CreateBtn_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="One or more fields were not filled." />
                </td>
            </tr>
            </table>

    </div>
</asp:Content>
