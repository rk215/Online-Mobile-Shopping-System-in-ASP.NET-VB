<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false"
    CodeFile="Login.aspx.vb" Inherits="User_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="logincontainer">
            <div class="loginHeader">
                <asp:Label ID="Lbloginheader" CssClass="Lbloginheader" runat="server" Text="Login"></asp:Label>
            </div>
            <div class="logincontrols">
                <asp:Label ID="lbloginusername" CssClass="lbloginusername" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="txtloginusername" CssClass="txtloginusername" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldLoginEmail" runat="server" CssClass="LoginValidation"
                    ErrorMessage="Please Enter Your Email ID"
                    ControlToValidate="txtloginusername"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    CssClass="LoginValidation" ErrorMessage="Please Enter Valid Email Address"
                    ControlToValidate="txtloginusername"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="lbloginpassword" CssClass="lbloginpassword" runat="server" Text="Password"></asp:Label><br />
                <asp:TextBox ID="txtloginpassword" TextMode="Password" CssClass="txtloginpassword"
                    runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldLoginPassword" CssClass="LoginValidation"
                    runat="server" ErrorMessage="Please Enter Your Password"
                    ControlToValidate="txtloginpassword"></asp:RequiredFieldValidator>
                <br />

                <asp:Button ID="btLogin" CssClass="btlogin" runat="server" Text="Login" />
            </div>
            <div>
                <asp:LinkButton ID="LinkNewUser" CssClass="linkbtnewuser" runat="server" 
                    CausesValidation="False">New User</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

