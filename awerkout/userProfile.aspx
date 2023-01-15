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
            width: 177px;
        }
        .auto-style5 {
            height: 26px;
            width: 177px;
            text-align: right;
        }
        .auto-style6 {
            width: 177px;
            height: 29px;
            text-align: right;
        }
        .auto-style7 {
            height: 29px;
        }
        .auto-style8 {
            width: 177px;
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
        .auto-style12 {
            width: 477px;
        }
        .auto-style15 {
            width: 177px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdditionalNavOption1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:LinkButton ID="myDashboardlnk" runat="server" OnClick="myDashboardlnk_Click" class="nav">My Dashboard</asp:LinkButton>
            </td>
            <td class="auto-style2">
                <asp:LinkButton ID="signOutlnk" runat="server" OnClick="signOutlnk_Click" class="nav">Sign Out</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentBlock" runat="server">
    <div id="profilebox">
        <table style="width: 100%">
            <tr>
                <td colspan="3" class="align-center">
                    <asp:Image ID="userPPImg" class="img" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
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
                    <asp:RequiredFieldValidator ID="userFirstNameErrMsg" runat="server" ForeColor="Red" ControlToValidate="userFirstNameTxtBx" ErrorMessage="First name is required." >*</asp:RequiredFieldValidator>
                    <asp:Label ID="userFirstNameLbl" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userFirstNameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                    <%--<asp:Label ID="userFirstNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="userLastNameErrMsg" runat="server" ForeColor="Red" ControlToValidate="userLastNameTxtBx" ErrorMessage="Last name is required." >*</asp:RequiredFieldValidator>
                    <asp:Label ID="userLastNameLbl" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userLastNameTxtBx"  class="TxtBx"  runat="server"></asp:TextBox>
                    <%--<asp:Label ID="userLastNameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                    <%--<asp:RequiredFieldValidator ID="userLastNameErrMsg" runat="server" ForeColor="Red">Last Name required.</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="userGenderErrMsg" runat="server" ForeColor="Red" ErrorMessage="Gender is required." ControlToValidate="userGenderDropDown">*</asp:RequiredFieldValidator>
                    <asp:Label ID="userGenderLbl" runat="server" Text="Gender:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="userGenderDropDown" class="TxtBx" runat="server">
                    </asp:DropDownList>
                    <%--<asp:Label ID="userGenderErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="userDoBErrMsg" runat="server" ForeColor="Red" ErrorMessage="Date of Birth is required." ControlToValidate="userDoBTxtBx">*</asp:RequiredFieldValidator>
                    <asp:Label ID="userDoBLbl" runat="server" Text="Date of Birth:"></asp:Label>
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userDoBTxtBx"  class="TxtBx" runat="server" TextMode="Date"></asp:TextBox>
                    <%--<asp:Label ID="userDoBErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="userEmailErrMsg" runat="server" ForeColor="Red" ErrorMessage="Email address is required." ControlToValidate="userEmailTxtBx">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="EmailFormatValidate"
                        runat="server" 
                        ErrorMessage="Email format is invalid."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="userEmailTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RegularExpressionValidator>
                    <asp:Label ID="userEmailLbl" runat="server" Text="Email Address:"></asp:Label>
                </td>
                <td class="auto-style9" colspan="2">
                    <asp:TextBox ID="userEmailTxtBx"  class="TxtBx" runat="server" TextMode="Email"></asp:TextBox>
                    <%--<asp:Label ID="userEmailErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator 
                        ID="userUsernameErrMsg" 
                        runat="server" 
                        ErrorMessage="Username is required." 
                        ControlToValidate="userUsernameTxtBx"
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:Label ID="userUsernameLbl" runat="server" Text="Username:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userUsernameTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                    <%--<asp:Label ID="userUsernameErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator 
                        ID="userPasswordErrMsg" 
                        runat="server" 
                        ControlToValidate="userPasswordTxtBx" 
                        ErrorMessage="Password is required." 
                        ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="PasswordFormatValidate" runat="server"
                        ControlToValidate="userPasswordTxtBx"
                        ErrorMessage="Password should have eight or more alphanumerical characters!"
                        OnServerValidate="PasswordFormat"
                        ForeColor="Red">
                        *
                    </asp:CustomValidator>
                    <asp:Label ID="userPasswordLbl" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style3" colspan="2">
                    <asp:TextBox ID="userPasswordTxtBx"  class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                    <%--<asp:Label ID="userPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="userRPasswordErrMsg" runat="server" ControlToValidate="userRPasswordTxtBx" ErrorMessage="Password re-type is required." ForeColor="Red">
                        *
                    </asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="ComparePasswordValidate"
                        runat="server"
                        ControlToCompare="userPasswordTxtBx"
                        ControlToValidate="userRPasswordTxtBx"
                        EnableClientScript="False"
                        ErrorMessage="Re-typed password is not the same as password."
                        ForeColor="Red">
                        *
                    </asp:CompareValidator>
                    <asp:Label ID="userRPasswordLbl" runat="server" Text="Repeat Password:"></asp:Label>
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userRPasswordTxtBx" class="TxtBx" runat="server" TextMode="Password"></asp:TextBox>
                    <%--<asp:Label ID="userRPasswordErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="userLocationLbl" runat="server" Text="Location:"></asp:Label>
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userLocationTxtBx" class="TxtBx" runat="server"></asp:TextBox>
                    <%--<asp:Label ID="userLocationErrMsg" runat="server" Text="Error Message" ForeColor="Red"></asp:Label>--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userAboutMeLbl" runat="server" Text="About Me:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userAboutMeTxtBx" class="TxtBx" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userLikesLbl" runat="server" Text="Likes:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userLikesTxtBx" class="TxtBx"  runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="userDislikesLbl" runat="server" Text="Dislikes:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userDislikesTxtBx" class="TxtBx"  runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:RegularExpressionValidator ID="userPhoneNumberErrMsg" runat="server" ControlToValidate="userPhoneNumberTxtBx" ErrorMessage="Phone number format is invalid." ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$">
                        *
                    </asp:RegularExpressionValidator>
                    <asp:Label ID="userPhoneNumberLbl" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userPhoneNumberTxtBx" class="TxtBx"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <asp:CompareValidator ID="userWeightErrMsg" runat="server" ErrorMessage="Weight invalid. Enter an integer." Operator="DataTypeCheck" Type="Integer" ForeColor="Red" ControlToValidate="userWeightTxtBx">*</asp:CompareValidator>
                    <asp:Label ID="userWeightLbl" runat="server" Text="Weight:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="userWeightTxtBx"  class="TxtBx" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:CompareValidator ID="userHeightErrMsg" runat="server" ErrorMessage="Height invalid. Enter an integer." Operator="DataTypeCheck" Type="Integer" ForeColor="Red" ControlToValidate="userHeightTxtBx">*</asp:CompareValidator>
                    <asp:Label ID="userHeightLbl" runat="server" Text="Height:"></asp:Label>
                </td>
                <td class="auto-style3" colspan="2">
                    <asp:TextBox ID="userHeightTxtBx" class="TxtBx"  runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
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
            <tr>
                <td colspan="3">
                    <asp:Label ID="generalErrorMsg" runat="server" Text="General Error" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" HeaderText="One or more fields were entered incorrectly." />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
