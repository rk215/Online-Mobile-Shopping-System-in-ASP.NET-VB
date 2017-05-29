<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false" CodeFile="View Order.aspx.vb" Inherits="User_View_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        th {
            position: absolute;
            margin-left: 410px;
            font-size: 22px;
        }
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="orderMain">
        <tr>
            <th>Your Order</th>
        </tr>
       <tr><td>
           <asp:Label ID="LbEmpty" CssClass="lbemptyOrder" runat="server"></asp:Label></td></tr>
        <tr><td>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="orderId"
                DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="orderViewContainer">
                        <div class="orderID">
                            orderId:
                    <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                            <br />
                        </div>
                        <div class="orderDate">
                            orderdate:
                    <asp:Label ID="orderdateLabel" runat="server" Text='<%# Eval("orderdate", "{0:MMM dd,yyyy}")%>' />
                            <br />
                        </div>
                        <div class="orderProductImage">
                        <asp:Image ID="Image1" CssClass="orderimage" ImageUrl='<%#Bind("ProductImage") %>' runat="server" />
                        </div>
                        <div class="ordercancel">
                        <asp:LinkButton ID="LinkButton1" CssClass="cancel" CommandArgument='<%#Bind("orderId") %>' OnClientClick="return confirm('are you sure?? You want to cancel Order')"
                            CommandName="Delete" runat="server">Cancel Order</asp:LinkButton>
                        <br />
                        </div>
                        <div class="orderinfo">

                        productName:
                    <asp:Label ID="productNameLabel" runat="server"
                        Text='<%# Eval("productName") %>' CssClass="ordername" />
                        <br /> <br />
                            Qunatity:
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("qty")%>' />
                        <br />
                            <br />
                            price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />
                            <br />
                           Order Status:
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("status") %>' />
                          
                        </div>
                        <div class="vieworderdetails">
                        <asp:Button ID="Button1" CssClass="btvieworderdetails" runat="server" CommandArgument='<%#Bind("orderId") %>'
                            CommandName="View" Text="View Details" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                SelectCommand="SELECT * FROM [OrderMaster] WHERE ([registerId] = @registerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="registerId" SessionField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        </tr>
    </table>

</asp:Content>

