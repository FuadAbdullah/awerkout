<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="createContent.aspx.cs" Inherits="awerkout.createContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="userprofilestyle.css" />
    <link rel="stylesheet" href="createContentstyle.css" />
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
        .auto-style6 {
            width: 93px;
            height: 29px;
            text-align: right;
        }
        .auto-style7 {
            height: 29px;
        }
        .auto-style10 {
            text-align: center;
            height: 26px;
        }
        .auto-style15 {
            width: 93px;
            vertical-align:top;
            text-align: right;
            height: 359px;
        }
        .auto-style16 {
            height: 359px;
        }
        .auto-style17 {
            height: 29px;
            width: 93px;
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
    <div id="profilebox">
        <table style="width: 100%">
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="userIDLbl" runat="server" Font-Bold="True" Text="USERID"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="contentTitleErrMsg" runat="server" ForeColor="Red" ControlToValidate="contentTitleTxtBx" ErrorMessage="Title is required." >*</asp:RequiredFieldValidator>
                    <asp:Label ID="contentTitleLbl" runat="server" Text="Title:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="contentTitleTxtBx" class="contentTxtBx" runat="server" Font-Size="Small"></asp:TextBox>
                    <%--<asp:Label ID="userFirstNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="contentTextErrMsg" runat="server" ForeColor="Red" ControlToValidate="contentTextTxtBx" ErrorMessage="Text is required." >*</asp:RequiredFieldValidator>
                    <asp:Label ID="contentTextLbl" runat="server" Text="Text:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="contentTextTxtBx"  class="contentTxtBx"  runat="server" Height="100%" TextMode="MultiLine" Font-Size="Small"></asp:TextBox>
                    <%--<asp:Label ID="userLastNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%><%--<asp:RequiredFieldValidator ID="userLastNameErrMsg" runat="server" ForeColor="Red">Last Name required.</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="contentBannerLbl" runat="server" Text="Banner:"></asp:Label>
                </td>
                <td class="auto-style10" colspan="2">
                    <asp:FileUpload ID="contentBannerFileUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="contentCreatePostBtn" class="btn" runat="server" Text="Create Post" OnClick="contentCreatePostBtn_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
