<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false" CodeFile="userProfile.aspx.vb" Inherits="User_userProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="userprofileContainer">
        <div class="userprofileHeader">
            <asp:Label ID="Label3" CssClass="userprofileheaderTitle" runat="server" Text="User Information"></asp:Label>
        </div>
        <div class="userprofilecontrols">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" CssClass="userprofilelbfname" runat="server" Text="First Name :"></asp:Label><br />
                        <asp:TextBox ID="txtfname" CssClass="userprofiletxtfname" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label2" CssClass="userprofilelblname" runat="server" Text="Last Name :"></asp:Label><br />
                        <asp:TextBox ID="txtlname" CssClass="userprofiletxtlname" runat="server"></asp:TextBox></td>
                </tr>                
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label4" CssClass="userprofilelbemail" runat="server" Text="Your Email Address :"></asp:Label><br />
                        <asp:TextBox ID="txtemail" CssClass="userprofiletxtemail" runat="server"></asp:TextBox></td>
                </tr>            
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label5" CssClass="userprofilelbaddress" runat="server" Text="Address :"></asp:Label>
                        <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="userprofiletxtaddress" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="1">
                        <asp:Label ID="Label6" runat="server" CssClass="userprofilelbstate" Text="State :"></asp:Label><br />
                        <asp:TextBox ID="txtstate"  CssClass="userprofiletxtstate" runat="server"></asp:TextBox></td>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" CssClass="userprofilelbcity" Text="City :"></asp:Label><br />
                        <asp:TextBox ID="txtcity" CssClass="userprofiletxtcity" runat="server"></asp:TextBox></td>
                    <td colspan="1">
                        <asp:Label ID="Label8" runat="server" CssClass="userprofilelbzip" Text="Zip Code :"></asp:Label><br />
                        <asp:TextBox ID="txtzip" CssClass="userprofiletxtzip" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="Label9" runat="server" CssClass="userprofilelbphone" Text="Phone Number :"></asp:Label>
                        <asp:TextBox CssClass="userprofiletxtphone" ID="txtphone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" CssClass="userprofilelbcard" Text="Credit/Debit Card Number :"></asp:Label>
                        <asp:TextBox CssClass="userprofiletxtcard" ID="txtcard" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr><td>
                    <asp:Button ID="btupdate" CssClass="userprofilebtupdate" runat="server" Text="Update" />
                    <asp:Button ID="btCancel" CssClass="userprofilebtcancel" runat="server" Text="Cancel" /></td></tr>
            </table>
        </div>
    </div>    
</asp:Content>

