<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="signInPage.aspx.cs" Inherits="awerkout.signInPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="signinstyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    
    <div id="signinbox">

        <h1>SIGN IN</h1>


        <table style="width: 100%">
            <tr>
                <td>
                    <asp:Label ID="usernameLbl" runat="server" Text="Username"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="usernameTxtBx" class="usernameTxtBx" runat="server" placeholder="Enter username" OnTextChanged="usernameTxtBx_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="passwordLbl" runat="server" Text="Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="passwordTxtBx" class="passwordTxtBx" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="signInBtn" class="btn" runat="server" OnClick="signInBtn_Click" Text="LOGIN" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="registerUserlnk" class="registerUserlnk" runat="server" OnClick="registerUserlnk_Click">SIGN UP</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="generalErrorMsg" runat="server" ForeColor="Red" Text="General Error"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
