<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="awerkout.adminDashboard" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myProfilelnk" runat="server" OnClick="myProfilelnk_Click" class="nav" CausesValidation="False">My Profile</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click" class="nav" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="greetLbl" runat="server" Text="Hello there!" Font-Bold="True"></asp:Label>
    <table class="nav2">
        <tr>
            <td>
                <asp:LinkButton ID="manageUserlnk" class="nav2" runat="server" OnClick="manageUserlnk_Click" Style="margin-right: 25px;" CausesValidation="False">Manage Users</asp:LinkButton>
                <asp:LinkButton ID="adminCreateAdminAcclnk" class="nav2" runat="server" OnClick="adminCreateAdminAcclnk_Click" Style="margin-right: 25px;" CausesValidation="False">Register Admin</asp:LinkButton>
                <asp:LinkButton ID="createContent" class="nav2" runat="server" OnClick="adminCreateContentlnk_Click" Style="margin-right: 25px;" CausesValidation="False">Create Content</asp:LinkButton>
                <asp:LinkButton ID="manageQuizzes" class="nav2" runat="server" OnClick="adminManageQuizlnk_Click" Style="margin-right: 25px;" CausesValidation="False">Manage Quizzes</asp:LinkButton>
            </td>
        </tr>
    </table>
    <%--    <div style="padding-left: 15%;">


        <asp:Button ID="manageUser" class="btn" runat="server" Text="Manage User" OnClick="manageUserlnk_Click"/>
        <asp:Button ID="CreateAdmin" class="btn" runat="server" Text="Register Admin" OnClick="adminCreateAdminAcclnk_Click" />

    </div>--%>

    <div id="Feedback">
        <h1 style="text-align: center;">Users' Feedbacks</h1>
        <table class="auto-style3">
            <tr>
                <td class="auto-style7">
                    <asp:CheckBox ID="FeedbackShowReviewedChkBx" runat="server" 
                        AutoPostBack="True"
                        Text="Show Reviewed Feedbacks"
                        OnCheckedChanged="FeedbackShowReviewedChkBx_CheckedChanged"/>
                    <br />
                    <asp:Label ID="noContentLbl" runat="server" Visible="false" Text="Hooray, no feedbacks to be reviewed! <(^.^)>"></asp:Label>
                    
                    <br />
                    <br />
                    <asp:Repeater ID="FeedbackRepeater" runat="server" OnItemCommand="FeedbackRepeater_ItemCommand">
                        <ItemTemplate>
                            <table style="width: 75%">
                                <tr>
                                    <td>
                                        <asp:Label ID="FeedbackIDLbl" runat="server" Text='<%# "FID: " + Eval("feedbackID") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackSubjectLbl" runat="server" Text='<%# "Subject: " + Eval("feedbacktitle") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackDescriptionLbl" runat="server" Text='<%# "Description: " + Eval("feedbackdesc") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackRatingLbl" runat="server" Text='<%# "Rating given: " + Eval("feedbackrating").ToString() + "/5.0 points" %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackAuthorLbl" runat="server" Text='<%# "Username: " + Eval("username") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackCreationLbl" runat="server" Text='<%# "Date : " + Eval("updatedAt") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="FeedbackIsReviewedLbl" runat="server" 
                                            Text="Reviewed"
                                            Visible='<%# bool.Parse(Eval("isReviewed").ToString().Trim()) %>'></asp:Label>
                                        <br />
                                        <asp:Button ID="FeedbackSetReviewedBtn" class="btn" runat="server" Text="Set Reviewed" 
                                            CommandName="PerformReviewed" 
                                            CommandArgument='<%# Eval("feedbackID") %>'
                                            Visible='<%# !bool.Parse(Eval("isReviewed").ToString().Trim()) %>'/>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>

        </table>


    </div>

</asp:Content>
