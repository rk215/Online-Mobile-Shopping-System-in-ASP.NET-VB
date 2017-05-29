<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false"
    CodeFile="BuyFromCart.aspx.vb" Inherits="User_BuyFromCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            font-family: Arial, Helvetica, sans-serif;
        }       
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <fieldset class="CssUserDetails">
                <legend>User Details</legend>
                <table>
                    <%-- First Name --%>
                    <tr>
                        <td>
                            <asp:Label CssClass="lbproceedFirstname" ID="Label1" runat="server" Text="First Name:"></asp:Label><br />
                            <asp:TextBox ID="TxtFname" CssClass="txtproceedFirstname" runat="server"></asp:TextBox><br />
                        </td>
                    </tr>
                    <%-- Last Name --%>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" CssClass="lbcsslastname" Text="Last Name:"></asp:Label><br />
                            <asp:TextBox CssClass="txtcsslastname" ID="TxtLastName" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- Email ID --%>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" CssClass="lbcssemailid" runat="server" Text="Email ID:"></asp:Label><br />
                            <asp:TextBox ID="TxtEmailID" CssClass="txtcssemailid" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- Address--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" CssClass="lbcssaddress" runat="server" Text="Address:"></asp:Label><br />
                            <asp:TextBox CssClass="txtcssaddress" TextMode="MultiLine" ID="TxtAddress" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- State --%>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" CssClass="lbcssstate" runat="server" Text="State:"></asp:Label><br />
                            <asp:TextBox ID="TxtState" CssClass="txtcssstate" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- City--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" CssClass="lbcsscity" runat="server" Text="City:"></asp:Label><br />
                            <asp:TextBox ID="TxtCity" CssClass="txtcsscity" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- Postal Code--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" CssClass="lbcsspostal" runat="server" Text="Postal Code(zipcode):"></asp:Label>
                            <br />
                            <asp:TextBox ID="TxtPostalCode" CssClass="txtcsspostal" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- PhoneNumber --%>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" CssClass="lbcssphone" runat="server" Text="Phone Number:"></asp:Label>
                            <br />
                            <asp:TextBox ID="Txtphone" CssClass="txtcssphone" runat="server"></asp:TextBox>

                        </td>
                    </tr>
                    <%-- Button--%>
                    <tr>
                        <td>
                            <asp:Button CssClass="btnext" ID="BtNext" runat="server" Text="Next &#8594;" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </asp:View>
        <asp:View ID="View2" runat="server">

            <fieldset>
                <legend>Payment Process</legend>
                <table>
                    <tr>
                        <td class="paymenttitle">Select Payment Option</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonListpayment" AutoPostBack="true" CssClass="radioOption"
                                runat="server">
                                <asp:ListItem Text="Credit/Debit Card" Value="creditordebit"></asp:ListItem>
                                <asp:ListItem Text="Cash on Delivery" Value="COD"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelcardDetails" CssClass="paymentpanel" Visible="false" runat="server">
                    <br />
                    <table id="cardDetails">
                        <tr>
                            <td>
                                <asp:Label ID="Label9" CssClass="paymentlbcard" runat="server" Text="Card Number:"></asp:Label></td>
                            <td>
                                <asp:TextBox CssClass="paymentcsscard" MaxLength="16" ID="TxtCard" placeholder="Only 16 Digit allowed"
                                    runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCard" runat="server" ControlToValidate="TxtCard"
                                    CssClass="paymentvalidationCard"
                                    Display="Dynamic" ErrorMessage="Card Details is Required"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    Display="Dynamic" ValidationExpression="^[0-9]{16}$" ControlToValidate="TxtCard"
                                    CssClass="paymentvalidationCard"
                                    ID="RegularExpressionValidatorcard" runat="server" ErrorMessage="Not A Valid Input"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" CssClass="paymentcssexpire" runat="server" Text="Expire Date:"></asp:Label>
                            </td>
                            <td>
                                <%-- Expire Month --%>
                                <asp:DropDownList CssClass="dropexmonth" ID="DropExpireMonth" runat="server">
                                    <asp:ListItem Text="Select Expire Month" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="February" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMonth" CssClass="paymentValidation"
                                    runat="server" ControlToValidate="DropExpireMonth"
                                    InitialValue="-1" ErrorMessage="Month Selection is required"></asp:RequiredFieldValidator>
                                <%-- Expire Year --%>
                                <asp:DropDownList CssClass="dropexyear" ID="DropExpireYear" runat="server">
                                    <asp:ListItem Text="Select Expire Year" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                                    <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                    <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                                    <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                                    <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                                    <asp:ListItem Text="2025" Value="2025"></asp:ListItem>
                                    <asp:ListItem Text="2026" Value="2026"></asp:ListItem>
                                    <asp:ListItem Text="2027" Value="2027"></asp:ListItem>
                                    <asp:ListItem Text="2028" Value="2028"></asp:ListItem>
                                    <asp:ListItem Text="2029" Value="2029"></asp:ListItem>
                                    <asp:ListItem Text="2030" Value="2030"></asp:ListItem>
                                    <asp:ListItem Text="2031" Value="2031"></asp:ListItem>
                                    <asp:ListItem Text="2032" Value="2032"></asp:ListItem>
                                    <asp:ListItem Text="2033" Value="2033"></asp:ListItem>
                                    <asp:ListItem Text="2034" Value="2034"></asp:ListItem>
                                    <asp:ListItem Text="2035" Value="2035"></asp:ListItem>
                                    <asp:ListItem Text="2036" Value="2036"></asp:ListItem>
                                    <asp:ListItem Text="2037" Value="2037"></asp:ListItem>
                                    <asp:ListItem Text="2038" Value="2038"></asp:ListItem>
                                    <asp:ListItem Text="2039" Value="2039"></asp:ListItem>
                                    <asp:ListItem Text="2040" Value="2040"></asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropExpireYear"
                                    InitialValue="-1" CssClass="paymentValidation"
                                    ErrorMessage="Year Selection is required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" CssClass="paymentlbCVV" runat="server" Text="Enter CVV Code:"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtCVVCode" CssClass="paymentCVV" MaxLength="3" runat="server" placeholder="CVV Code"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCVV" runat="server" Display="Dynamic"
                                    CssClass="paymentValidation" ControlToValidate="TxtCVVCode"
                                    ErrorMessage="Must Enter Code"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorCVV" runat="server"
                                    CssClass="paymentValidation" Display="Dynamic" ErrorMessage="Only Digit Allowed"
                                    ControlToValidate="TxtCVVCode"
                                    ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Button ID="Btplaceorder" CssClass="paymentorderplace" Enabled="false" TabIndex="1" runat="server" Text="Place Order" />
            </fieldset>
        </asp:View>
    </asp:MultiView>

</asp:Content>

