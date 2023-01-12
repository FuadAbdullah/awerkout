<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="awerkout.userProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="mainstyle.css" />
    <link rel="stylesheet" href="userprofilestyle.css" />
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
            width: 148px;
        }
        .auto-style5 {
            height: 26px;
            width: 148px;
            text-align: right;
        }
        .auto-style6 {
            width: 148px;
            height: 29px;
            text-align: right;
        }
        .auto-style7 {
            height: 29px;
        }
        .auto-style8 {
            width: 148px;
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
        .auto-style11 {
            height: 29px;
            width: 379px;
        }
        .auto-style12 {
            width: 379px;
        }
        .auto-style13 {
            height: 28px;
            width: 379px;
        }
        .auto-style14 {
            height: 26px;
            width: 379px;
        }
        .auto-style15 {
            width: 148px;
            text-align: right;
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
    <div id="profilebox">
        <table class="auto-style1">
            <tr>
                <td colspan="3" class="align-center">
                    <asp:Image ID="userPPImg" CssClass="img" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style10" colspan="3">
                    <asp:FileUpload ID="userPPUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="3">
                    <asp:Label ID="userIDLbl" runat="server" Font-Bold="True" Text="USERID"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userFirstNameLbl" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="userFirstNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userFirstNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userLastNameTxtBx"  class="TxtBx"  runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userLastNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userGenderLbl" runat="server" Text="Gender:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="userGenderDropDown" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="userGenderErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userDoBLbl" runat="server" Text="Date of Birth:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="userDoBTxtBx"  class="TxtBx" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userDoBErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="userEmailLbl" runat="server" Text="Email Address:"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:TextBox ID="userEmailTxtBx"  class="TxtBx" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="userEmailErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userUsernameLbl" runat="server" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userUsernameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userUsernameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="userPasswordLbl" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userPasswordTxtBx"  class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="userPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="userRPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userRPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userLocationLbl" runat="server" Text="Location:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="userLocationTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userLocationErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userAboutMeLbl" runat="server" Text="About Me:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userAboutMeTxtBx" class="TxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userAboutMeErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userLikesLbl" runat="server" Text="Likes:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userLikesTxtBx" class="TxtBx"  runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userLikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userDislikesLbl" runat="server" Text="Dislikes:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userDislikesTxtBx" class="TxtBx"  runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userDislikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userPhoneNumberLbl" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="userPhoneNumberTxtBx" class="TxtBx"  runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userPhoneNumberErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userWeightLbl" runat="server" Text="Weight:"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="userWeightTxtBx"  class="TxtBx" runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userWeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="userHeightLbl" runat="server" Text="Height:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userHeightTxtBx" class="TxtBx"  runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="userHeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="userUpdateProfileBtn" class="btn" runat="server" Text="Apply Changes" OnClick="userUpdateProfileBtn_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="userCreationDateLbl" runat="server" Font-Size="Smaller" Text="Created On"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="userUpdatedOnLbl" runat="server" Font-Size="Smaller" Text="Updated On"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
