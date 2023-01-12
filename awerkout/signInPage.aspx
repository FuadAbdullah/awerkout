<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="signInPage.aspx.cs" Inherits="awerkout.signInPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="signinstyle.css" />
    <style type="text/css">
        
        .align-right {
            text-align: right;
        }
        .auto-style8 {
            width: 337px;
            text-align: left;
        }
        .auto-style9 {
            height: 26px;
            width: 337px;
            text-align: left;
        }
        .auto-style10 {
            width: 337px;
            text-align: left;
            height: 22px;
        }
        .auto-style11 {
            height: 26px;
            text-align: left;
        }
        .auto-style13 {
            text-align: left;
            height: 8px;
        }
        .auto-style14 {
            height: 26px;
            width: 337px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    
    <div id="signinbox">

        <h1>SIGN IN</h1>

        <table class="auto-style1">
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="usernameLbl" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13" colspan="2">
                    <asp:TextBox ID="usernameTxtBx" class="usernameTxtBx" runat="server" placeholder="Enter username" OnTextChanged="usernameTxtBx_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    </td>
                <td class="auto-style10">
                    </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="passwordLbl" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11" colspan="2">
                    <asp:TextBox ID="passwordTxtBx" class="passwordTxtBx" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11" colspan="2">
                    <asp:Button ID="signInBtn" class="btn" runat="server" OnClick="signInBtn_Click" Text="LOGIN" />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:LinkButton ID="registerUserlnk" class="registerUserlnk" runat="server" OnClick="registerUserlnk_Click">SIGN UP</asp:LinkButton>
                </td>
                <td class="auto-style14">
                    <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
