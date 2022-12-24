<%@ Page Title="" Language="C#" MasterPageFile="~/SiteFrame.Master" AutoEventWireup="true" CodeBehind="profilePage.aspx.cs" Inherits="awerkout.profilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdditionalNavOption1" runat="server">



    <td>



    <asp:LinkButton ID="profilelnk" runat="server" OnClick="profilelnk_Click">Username</asp:LinkButton>

</td>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentBlock" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
