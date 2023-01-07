<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="awerkout.userProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            width: 517px;
        }
        .auto-style5 {
            height: 26px;
            width: 517px;
        }
        .auto-style6 {
            width: 517px;
            height: 29px;
        }
        .auto-style7 {
            height: 29px;
        }
        .auto-style8 {
            width: 517px;
            height: 28px;
        }
        .auto-style9 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myDashboardlnk" runat="server" OnClick="myDashboardlnk_Click">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="4" class="align-center">
                <asp:Image ID="userPPImg" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
            </td>
        </tr>
        <tr>
            <td class="align-center" colspan="4">
                <asp:FileUpload ID="userPPUpload" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="4">
                <asp:Label ID="userIDLbl" runat="server" Font-Bold="True" Text="USERID"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="userFirstNameLbl" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="userFirstNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style7" colspan="2">
                <asp:Label ID="userFirstNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userLastNameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userLastNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userGenderLbl" runat="server" Text="Gender:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="userGenderDropDown" runat="server">
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:Label ID="userGenderErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="userDoBLbl" runat="server" Text="Date of Birth:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="userDoBTxtBx" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td colspan="2" class="auto-style7">
                <asp:Label ID="userDoBErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="userEmailLbl" runat="server" Text="Email Address:"></asp:Label>
            </td>
            <td class="auto-style9">
                <asp:TextBox ID="userEmailTxtBx" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td colspan="2" class="auto-style9">
                <asp:Label ID="userEmailErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userUsernameLbl" runat="server" Text="Username:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userUsernameTxtBx" runat="server"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userUsernameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="userPasswordLbl" runat="server" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="userPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="userPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="userRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="userRPasswordTxtBx" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td colspan="2" class="auto-style7">
                <asp:Label ID="userRPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="userLocationLbl" runat="server" Text="Location:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="userLocationTxtBx" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style7" colspan="2">
                <asp:Label ID="userLocationErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userAboutMeLbl" runat="server" Text="About Me:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userAboutMeTxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userAboutMeErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userLikesLbl" runat="server" Text="Likes:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userLikesTxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userLikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userDislikesLbl" runat="server" Text="Dislikes:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userDislikesTxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userDislikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="userPhoneNumberLbl" runat="server" Text="Phone Number:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="userPhoneNumberTxtBx" runat="server"></asp:TextBox>
            </td>
            <td colspan="2" class="auto-style7">
                <asp:Label ID="userPhoneNumberErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="userWeightLbl" runat="server" Text="Weight:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="userWeightTxtBx" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Label ID="userWeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="userHeightLbl" runat="server" Text="Height:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="userHeightTxtBx" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="userHeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="userUpdateProfileBtn" runat="server" Text="Apply Changes" OnClick="userUpdateProfileBtn_Click" />
            </td>
            <td>
                <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
