<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false" CodeFile="OrderDetails.aspx.vb" Inherits="User_OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body{
            overflow:hidden;
        }
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="orderId"
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="orderdetailcontainer">
            <table>
                <tr class="orderdetailorderid">
                    <td>orderId:
            <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                        <br />
                    </td>
                </tr>
                <tr class="orderdetailsImage">
                    <td>
                        <asp:Image ID="Image1" CssClass="orderViewimage" ImageUrl='<%#Bind("ProductImage") %>' runat="server" />
                        <br />
                    </td>
                </tr>
                <tr class="orderdate">
                    <td>orderdate:
            <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate") %>' />
                        <br />
                    </td>
                </tr>
                </table>
            <table class="orderdetailsrightpart">
                <tr>
                    <td>Username:
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                        <br />
                    </td>
                </tr>
                <tr>
                    <tr>
                        <td>productName:
            <asp:Label ID="productNameLabel" runat="server"
                Text='<%# Eval("productName") %>' />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>price:
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>qty:
            <asp:Label ID="qtyLabel" runat="server" Text='<%# Eval("qty") %>' />
                            <br />
                        </td>
                    </tr>
                    <td>emailId:
            <asp:Label ID="emailIdLabel" runat="server" Text='<%# Eval("emailId") %>' />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>shippingAddress:
            <asp:Label ID="shippingAddressLabel" runat="server"
                Text='<%# Eval("shippingAddress") %>' />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>paymentMode:
            <asp:Label ID="paymentModeLabel" runat="server"
                Text='<%# Eval("paymentMode") %>' />
                        <br />

                    </td>

                </tr>
                <tr>
                    <td>status:
            <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
        SelectCommand="SELECT * FROM [OrderMaster] WHERE ([orderId] = @orderId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="orderId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

