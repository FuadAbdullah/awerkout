<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="focusedContentPage.aspx.cs" Inherits="awerkout.content.focusedContentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../mainstyle.css" />
    <link rel="stylesheet" href="focusedContentPage.css" />
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


        .multi-line {
            white-space: pre-line;
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
    <div style="margin: auto; width: 80%;">
        <table class="auto-style3">
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <% if (Session["userID"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
                        { %>
                    <asp:TextBox ID="focusedEditTitleTxtBx" runat="server" class="TxtBx" Height="25px" Width="100%" Text="Post Title" Font-Size="Medium"></asp:TextBox>

                    <% }
                        else
                        { %>
                    <asp:Label ID="focusedContentTitleLbl" runat="server" Text="Post Title" Font-Bold="True" Font-Size="Larger" Font-Underline="True"></asp:Label>
                    <% } %>

                </td>
            </tr>
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <div class="postImg">
                        <asp:Image ID="focusedContentImg" runat="server" Width="100%" Height="100%" />
                        <% if (Session["userID"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
                            { %>
                    </div>
                    <br />
                    <asp:FileUpload ID="focusedEditPicReupload" runat="server" />
                    <% }%>
                </td>
            </tr>
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <% if (Session["userID"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
                        { %>
                    <asp:TextBox ID="focusedEditDescTxtBx" class="TxtBx" runat="server" Height="75px" Width="100%" Text="Post Description" Font-Size="Medium" TextMode="MultiLine"></asp:TextBox>

                    <% }
                        else
                        { %>
                    <asp:Label ID="focusedContentDescLbl" class="multi-line" runat="server" Text="Post Description" Font-Size="Medium"></asp:Label>
                    <% } %>

                </td>
            </tr>
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="focusedContentAuthorLbl" runat="server" Text="Author And ID" Font-Size="Small" Font-Italic="True"></asp:Label>
                    <br />
                    <asp:Label ID="focusedContentUpdateLbl" runat="server" Text="Updated Date Time" Font-Size="Small" Font-Italic="True"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <% if (Session["userID"] != null && Session["usertype"].ToString().Trim() == "ADMIN")
                { %>
            <tr>
                <td>

                    <asp:Button ID="focusedEditPostSubmitBtn" class="applybtn" runat="server" OnClick="focusedEditPostSubmitBtn_Click" Text="Finalize Changes" />
                    <asp:Button ID="focusedDeletePostBtn" class="deletebtn" runat="server" OnClick="focusedDeletePostBtn_Click" Text="Delete Post" />



                </td>
            </tr>
            <tr>
                <td>
                    <!-- Empty row -->
                    &nbsp;
                </td>
            </tr>
            <%  } %>
            <tr>
                <td>
                    <asp:TextBox ID="focusedCommentTxtBx" runat="server" class="TxtBx" Height="75px" TextMode="MultiLine" Width="100%" onfocus="ClearTextUponFocus()" Font-Size="Medium">Write something in your mind...</asp:TextBox>
                    <asp:Button ID="focusedCommentSubmitBtn" class="applybtn" runat="server" OnClick="focusedCommentSubmitBtn_Click" Text="Post Comment" Font-Size="Small" />
                </td>

            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Repeater ID="focusedContentCommentRepeater" runat="server" OnItemCommand="focusedContentCommentRepeater_ItemCommand">
                        <ItemTemplate>
                            <%--<asp:Label ID="focusedContentComment" runat="server" Text='<%# Eval("commentdata") %>'></asp:Label>
                        <br />--%>
                            <asp:Label ID="focusedContentCommentID" runat="server" Text='<%# "Comment #" + Eval("commentID") %>' Font-Size="Smaller"></asp:Label>
                            <br />
                            <div>
                                <asp:TextBox ID="focusedEditCommentTxtBx" runat="server" class="TxtBx" Height="10%" TextMode="MultiLine" Width="100%" Visible='<%# Session["userID"] != null 
                                && (Session["usertype"].ToString().Trim() == "ADMIN" 
                                || Session["userID"].ToString().Trim() == Eval("userID").ToString()) 
                                ? true : false%>'
                                    Text='<%# Server.HtmlDecode(Eval("commentdata").ToString()) %>' Font-Size="Larger"></asp:TextBox>
                                <asp:Button ID="focusedEditCommentBtn" runat="server" CommandName="PerformEditComment" CommandArgument='<%# Eval("commentID")%>' Text="Edit Comment" Visible='<%# Session["userID"] != null 
                                && (Session["usertype"].ToString().Trim() == "ADMIN" 
                                || Session["userID"].ToString().Trim() == Eval("userID").ToString()) 
                                ? true : false%>'
                                    Font-Size="Small"
                                    class="applybtn" />
                                <asp:Button ID="focusedDeleteCommentBtn" runat="server" CommandName="PerformDeleteComment" CommandArgument='<%# Eval("commentID")%>' Text="Delete Comment" Visible='<%# Session["userID"] != null 
                                && (Session["usertype"].ToString().Trim() == "ADMIN" 
                                || Session["userID"].ToString().Trim() == Eval("userID").ToString()) 
                                ? true : false%>'
                                    Font-Size="Small"
                                    class="deletebtn" />
                                <asp:CheckBox ID="permaDeleteCommentChkBx" runat="server" Text="Delete Permanently" Visible='<%# Session["userID"] != null 
                                && (Session["usertype"].ToString().Trim() == "ADMIN" 
                                || Session["userID"].ToString().Trim() == Eval("userID").ToString()) 
                                ? true : false%>' />
                            </div>
                            <asp:Label ID="focusedContentCommentLbl" runat="server" Visible='<%# Session["userID"] != null 
                                && (Session["usertype"].ToString().Trim() == "ADMIN" 
                                || Session["userID"].ToString().Trim() == Eval("userID").ToString())
                                ? false : true %>'
                                Text='<%# Server.HtmlDecode(Eval("commentdata").ToString()) %>' Font-Size="Large"></asp:Label>
                            <br />
                            <asp:Label ID="focusedContentCommentAuthorAndCreation" runat="server"
                                Text='<%# "Posted by " + Eval("username") + " on " + Eval("createdAt")%>' Font-Size="Smaller" Font-Italic="False" Font-Bold="True"></asp:Label>
                            <br />
                            <asp:Label ID="focusedContentCommentDateTimeUpdated" runat="server"
                                Text='<%# "Last updated on " + Eval("updatedAt")%>' Font-Size="Smaller" Font-Italic="False" Font-Bold="True"></asp:Label>
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </div>
    <script>
        function ClearTextUponFocus() {
            document.getElementById('<%=focusedCommentTxtBx.ClientID%>').value = "";
        }

    </script>
</asp:Content>
