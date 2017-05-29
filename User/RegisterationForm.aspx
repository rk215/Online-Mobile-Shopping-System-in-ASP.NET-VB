<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false" CodeFile="RegisterationForm.aspx.vb" Inherits="User_RegisterationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .txtregistrationaddress{
            font-family:Arial, Helvetica, sans-serif;
        }
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="registercontainer">
        <div class="loginHeader">
            <asp:Label ID="Lbloginheader" CssClass="Lbloginheader" runat="server" Text="Registration"></asp:Label>
        </div>
        <div class="logincontrols">
            <%-- First Name --%>
            <asp:Label ID="lbregistrationFirstname" CssClass="lbloginusername" runat="server" Text="First Name"></asp:Label><br />
            <asp:TextBox ID="txtregistrationFirstname" CssClass="txtloginusername" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldFirstName" runat="server" ErrorMessage="First Name is Required"
                ControlToValidate="txtregistrationFirstname" CssClass="registrationValidation"></asp:RequiredFieldValidator>
            <br />
            <%-- Last Name --%>
            <asp:Label ID="lbregistrationLastname" CssClass="lbloginusername" runat="server"
                Text="Last Name"></asp:Label><br />
            <asp:TextBox ID="txtregistrationLastname" CssClass="txtloginusername" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldLastname" runat="server" ErrorMessage="Last Name is Required"
                ControlToValidate="txtregistrationLastname" CssClass="registrationValidation"></asp:RequiredFieldValidator>
            <br />
            <%-- UserName --%>
            <asp:Label ID="lbregistrationusername" CssClass="lbloginusername" runat="server" Text="Username"></asp:Label><br />
            <asp:TextBox ID="txtregistrationusername" CssClass="txtloginusername" runat="server"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server"
                CssClass="registrationValidation" ErrorMessage="Email id is not Valid" ControlToValidate="txtregistrationusername"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <%-- Password --%>
            <asp:Label ID="lbregistrationpassword" CssClass="lbloginpassword" runat="server"
                Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtregistrationpassword" TextMode="Password" CssClass="txtloginpassword"
                runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldPassword" runat="server" ErrorMessage="Password Must be filled"
                CssClass="registrationValidation" ControlToValidate="txtregistrationpassword"></asp:RequiredFieldValidator>
            <br />
            <%--Retype Password --%>
            <asp:Label ID="lbregistrationrepassword" CssClass="lbloginpassword" runat="server"
                Text="Retype Password"></asp:Label><br />
            <asp:TextBox ID="txtregistrationrepassword" TextMode="Password" CssClass="txtloginpassword"
                runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldRetypePassword" runat="server" ErrorMessage="Retype your Password"
                CssClass="registrationValidation" ControlToValidate="txtregistrationrepassword"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareRetypePassword" runat="server" ErrorMessage="Password does not Match"
                ControlToValidate="txtregistrationrepassword" CssClass="registrationValidation"
                ControlToCompare="txtregistrationpassword"></asp:CompareValidator>
            <br />
            <%--Phone Number --%>
            <asp:Label ID="lbregistrationphoneNumber" CssClass="lbloginusername" runat="server"
                Text="Phone Number"></asp:Label><br />
            <asp:TextBox ID="txtregistrationphoneNumber" MaxLength="10" CssClass="txtloginusername" runat="server"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldPhoneNumber" runat="server" ErrorMessage="Phone Number is required"
                CssClass="registrationValidation" ControlToValidate="txtregistrationphoneNumber"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionPhoneNumber" runat="server"
                ErrorMessage="Please Enter Only digits" ControlToValidate="txtregistrationphoneNumber"
                CssClass="registrationValidation" ValidationExpression="^\d{10}$"> </asp:RegularExpressionValidator>
            <br />
            <%--Address--%>
            <asp:Label ID="lbregistrationaddress" CssClass="lbloginusername" runat="server"
                Text="Address"></asp:Label><br />
            <asp:TextBox ID="txtregistrationaddress" MaxLength="50"  TextMode="MultiLine" CssClass="txtregistrationaddress"
                runat="server"></asp:TextBox><br />
            <br />
            <%--Credit or Debit card Number--%>
            <asp:Label ID="lbregistrationcreditcard" CssClass="lbloginusername" runat="server"
                Text="Credit or Debit card Number"></asp:Label><br />
            <asp:TextBox ID="txtregistrationcreditcard" CssClass="txtloginusername"
                runat="server" MaxLength="16"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionCreditCard" runat="server"
                ErrorMessage="Please Enter Only digits" CssClass="registrationValidation" ControlToValidate="txtregistrationcreditcard"
                ValidationExpression="^\d{16}$"> </asp:RegularExpressionValidator>
            <br />
            <%--State--%>
            <asp:Label ID="lbregistrationstate" CssClass="lbloginusername" runat="server"
                Text="State"></asp:Label><br />
            <asp:TextBox ID="txtregistrationstate" CssClass="txtloginusername"
                runat="server" MaxLength="20"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionState" runat="server"
                ErrorMessage="Please Enter Only Character" CssClass="registrationValidation"
                ControlToValidate="txtregistrationstate"
                ValidationExpression="^[a-zA-Z]*$"> </asp:RegularExpressionValidator>
            <br />
            <%--city--%>
            <asp:Label ID="lbregistrationcity" CssClass="lbloginusername" runat="server"
                Text="city"></asp:Label><br />
            <asp:TextBox ID="txtregistrationcity" CssClass="txtloginusername"
                runat="server" MaxLength="20"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ErrorMessage="Please Enter Only Character" CssClass="registrationValidation"
                ControlToValidate="txtregistrationcity"
                ValidationExpression="^[a-zA-Z]*$"> </asp:RegularExpressionValidator>
            <br />
            <%--Zipcode--%>
            <asp:Label ID="lbregistrationZipcode" CssClass="lbloginusername" runat="server"
                Text="Zipcode"></asp:Label><br />
            <asp:TextBox ID="txtregistrationZipcode" CssClass="txtloginusername"
                runat="server" MaxLength="6"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="RegularExpressionZipcode" runat="server"
                ErrorMessage="Please Enter Only Digit" CssClass="registrationValidation"
                ControlToValidate="txtregistrationZipcode"
                ValidationExpression="^\d{6}$"> </asp:RegularExpressionValidator>
            <br />
            <%--Registration--%>
            <asp:Button ID="btregistration" CssClass="btlogin" runat="server" Text="Registration" />
        </div>
       
    </div>
</asp:Content>

