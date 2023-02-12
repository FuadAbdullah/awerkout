<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="focusedContentPage.aspx.cs" Inherits="awerkout.content.focusedContentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="../userDashboardstyle.css" />
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }

        .auto-style3 {
            width: 100%;
        }

        .auto-style4 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myProfilelnk" class="nav" runat="server" OnClick="myProfilelnk_Click" CausesValidation="False">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" class="nav" runat="server" OnClick="signOutlnk_Click" CausesValidation="False">Sign Out</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signInlnk" class="nav" runat="server" OnClick="signInlnk_Click" CausesValidation="False">Sign In</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <table class="auto-style3">
        <tr>
            <td>
                <asp:Label ID="focusedContentTitleLbl" runat="server" Text="Post Title"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Image ID="focusedContentImg" runat="server" Width="500px" Height="200px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="focusedContentDescLbl" runat="server" Text="Post Description"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="focusedContentAuthorLbl" runat="server" Text="Author And ID"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="focusedCommentTxtBx" runat="server" Height="72px" TextMode="MultiLine" Width="590px" onfocus="ClearTextUponFocus()">Write something in your mind...</asp:TextBox>
                <asp:Button ID="focusedCommentSubmitBtn" runat="server" OnClick="focusedCommentSubmitBtn_Click" Text="Post Comment" />
            </td>

        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Repeater ID="focusedContentCommentRepeater" runat="server" OnItemCommand="focusedContentCommentRepeater_ItemCommand">
                    <ItemTemplate>
                        <%--<asp:Label ID="focusedContentComment" runat="server" Text='<%# Eval("commentdata") %>'></asp:Label>
                        <br />--%>
                        <asp:Label ID="focusedContentCommentID" runat="server" Text='<%# "Comment #" + Eval("commentID") %>'></asp:Label>
                        <br />
                        <asp:TextBox ID="focusedEditCommentTxtBx" runat="server" Height="72px" TextMode="MultiLine" Width="590px" Visible='<%# Session["userID"] != null && Session["userID"].ToString().Trim() == Eval("userID").ToString() ? true : false%>' Text='<%#Eval("commentdata") %>'></asp:TextBox>
                        <asp:Button ID="focusedEditCommentBtn" runat="server" CommandName="PerformEditComment" CommandArgument='<%# Eval("commentID")%>' Text="Edit Comment" Visible='<%# Session["userID"] != null && Session["userID"].ToString().Trim() == Eval("userID").ToString() ? true : false%>' />
                        <asp:Button ID="focusedDeleteCommentBtn" runat="server" CommandName="PerformDeleteComment" CommandArgument='<%# Eval("commentID")%>' Text="Delete Comment" Visible='<%# Session["userID"] != null && Session["userID"].ToString().Trim() == Eval("userID").ToString() ? true : false%>' />
                        <asp:Label ID="focusedContentCommentLbl" runat="server" Visible='<%# Session["userID"] != null && Session["userID"].ToString().Trim() == Eval("userID").ToString() ? false : true %>' Text='<%#Eval("commentdata") %>' ></asp:Label>
                        <br />
                        <asp:Label ID="focusedContentCommentAuthor" runat="server" Text='<%# "Posted by " + Eval("username") %>'></asp:Label>
                        <br />
                        <asp:Label ID="focusedContentCommentDateTime" runat="server" Text='<%# "Posted on " + Eval("createdAt") + ", last updated on " + Eval("updatedAt")%>'></asp:Label>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>

    <script>
        function ClearTextUponFocus() {
            document.getElementById('<%=focusedCommentTxtBx.ClientID%>').value = "";
        }
    </script>
</asp:Content>
