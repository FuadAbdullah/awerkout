<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="manageUsers.aspx.cs" Inherits="awerkout.manageUsers" %>
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
        .auto-style5 {
            height: 26px;
            width: 159px;
            text-align: right;
        }
        .auto-style6 {
            width: 159px;
            height: 29px;
            text-align: right;
        }
        .auto-style7 {
            height: 29px;
        }
        .auto-style8 {
            width: 159px;
            height: 28px;
            text-align: right;
        }
        .auto-style9 {
            height: 28px;
        }
                .auto-style10 {
                    width: 159px;
                    height: 48px;
            text-align: right;
        }
                .auto-style11 {
                    height: 48px;
                }
        .auto-style13 {
            width: 159px;
            text-align: right;
        }
        .auto-style14 {
            height: 29px;
            width: 393px;
        }
        .auto-style15 {
            width: 393px;
        }
        .auto-style16 {
            height: 28px;
            width: 393px;
        }
        .auto-style17 {
            height: 26px;
            width: 393px;
        }
        .auto-style18 {
            height: 48px;
            width: 393px;
        }
        .auto-style19 {
            width: 100%;
        }
        .auto-style21 {
            width: 359px;
        }
        .auto-style22 {
            width: 359px;
            height: 22px;
        }
        .auto-style24 {
            height: 22px;
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
        <table class="auto-style19">
            <tr>
                <td class="align-center">
                    <asp:Label ID="userSearchLbl" runat="server" Text="Search:"></asp:Label>
                    <asp:TextBox ID="userSearchTxtBx" runat="server"></asp:TextBox>
                    <asp:Button ID="userSearchBtn" runat="server" OnClick="userSearchBtn_Click" Text="Go" />
                    </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td colspan="3" class="align-center">
                    <asp:Label ID="userSearchErrMsg" runat="server" Text="Search Error" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="align-center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" class="align-center">
                    <asp:Image ID="userPPImg" class="img" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
                </td>
            </tr>
            <tr>
                <td class="align-center" colspan="3">
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
                <td class="auto-style14">
                    <asp:TextBox ID="userFirstNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userFirstNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="userLastNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userLastNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="userGenderLbl" runat="server" Text="Gender:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="userGenderDropDown" class="TxtBx" runat="server">
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
                <td class="auto-style14">
                    <asp:TextBox ID="userDoBTxtBx" class="TxtBx" runat="server" TextMode="Date"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userDoBErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="userEmailLbl" runat="server" Text="Email Address:"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="userEmailTxtBx" class="TxtBx" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="userEmailErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="userUsernameLbl" runat="server" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style15">
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
                <td class="auto-style17">
                    <asp:TextBox ID="userPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="userPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userRPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userRPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userUsertypeLbl" runat="server" Text="User Type:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:DropDownList ID="userUsertypeDropDown" class="TxtBx" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userUsertypeErrMsg" runat="server" ForeColor="Red" Text="Error Message"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userLocationLbl" runat="server" Text="Location:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userLocationTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userLocationErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="userAboutMeLbl" runat="server" Text="About Me:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="userAboutMeTxtBx" class="TxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userAboutMeErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="userLikesLbl" runat="server" Text="Likes:"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="userLikesTxtBx" class="TxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="userLikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="userDislikesLbl" runat="server" Text="Dislikes:"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="userDislikesTxtBx" class="TxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="userDislikesErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userPhoneNumberLbl" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userPhoneNumberTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userPhoneNumberErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userWeightLbl" runat="server" Text="Weight:"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="userWeightTxtBx" runat="server" class="TxtBx" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="userWeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="userHeightLbl" runat="server" Text="Height:"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="userHeightTxtBx" class="TxtBx" runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="userHeightErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="userAccountStatusLbl" runat="server" Text="Account Status:"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:DropDownList ID="userAccountStatusDropDown" class="TxtBx" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="userAccountStatusErrMsg" runat="server" ForeColor="Red" Text="Error Message"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
        <table class="auto-style19">
            <tr>
                <td colspan="2">
                    <asp:Button ID="userUpdateProfileBtn" class="applybtn" runat="server" Text="Apply Changes" OnClick="userUpdateProfileBtn_Click" />
                    <asp:Button ID="userDeleteProfileBtn" class="deletebtn" runat="server" ForeColor="red" OnClick="userDeleteProfileBtn_Click" Text="Delete Account" />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style24">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="userCreationDateLbl" runat="server" Font-Size="Smaller" Text="Created On"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="userUpdatedOnLbl" runat="server" Font-Size="Smaller" Text="Updated On"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
