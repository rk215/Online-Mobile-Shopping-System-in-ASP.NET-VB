<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="AdminOrderDetails.aspx.vb" Inherits="Admin_AdminOrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <div class="adminOrderDetailsHeader">
                    <asp:Label ID="lbadminOrderDetailsHeader" runat="server" Text="See User Ordered Products"
                        CssClass="cssadminOrderDetailsHeader"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="adminOrderDetailsHeaderSearch">
                    <asp:Label ID="lbadminOrderDetailsSearch" CssClass="csslbadminOrderDetailsSearch"
                        runat="server"
                        Text="Enter UserID"></asp:Label>
                    <asp:TextBox ID="txtadminOrderDetailsSearch" runat="server" placeholder="We Expect User ID"
                        CssClass="csstxtadminOrderDetailsSearch"></asp:TextBox>
                    <asp:Button ID="BtSearch" CssClass="cssbtadminOrderDetailsSearch" runat="server"
                        Text="Search" />
                </div>
                <div class="adminOrderDetailsforgot">
                    <asp:HyperLink ID="HyperForgotadminOrderDetailsForgot" runat="server"  CssClass="cssHyperForgotadminOrderDetailsForgot" NavigateUrl="~/Admin/UserData.aspx">Don't Know UserID</asp:HyperLink>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="cssgridscrollable">
                <asp:GridView EmptyDataText="No order found" ID="GridView1" Caption="Shipping Details" runat="server" AutoGenerateColumns="False" CssClass="cssadminOrderDetailsgrid"
                    DataKeyNames="orderId,emailId" DataSourceID="SqlDataSource1"
                    AllowPaging="True" CellPadding="2" CellSpacing="2">
                    <HeaderStyle CssClass="cssadminOrderDetailsgridheader" />
                    <Columns>
                        <asp:BoundField DataField="orderId" HeaderText="orderId" InsertVisible="False"
                            ReadOnly="True" SortExpression="orderId" />
                        <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" />
                        <asp:BoundField DataField="registerId" HeaderText="registerId"
                            SortExpression="registerId" />
                        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="shippingAddress" HeaderText="shippingAddress"
                            SortExpression="shippingAddress" />
                        <asp:BoundField DataField="emailId" HeaderText="emailId" ReadOnly="True"
                            SortExpression="emailId" />
                        <asp:BoundField DataField="orderdate" HeaderText="orderdate"
                            SortExpression="orderdate" DataFormatString="{0:MMM dd,yyyy}" />
                        <asp:TemplateField HeaderText="Product Image"><ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' Width="70px" Height="70px" /></ItemTemplate></asp:TemplateField>                        
                        <asp:BoundField DataField="Username" HeaderText="Username"
                            SortExpression="Username" />
                        <asp:BoundField DataField="paymentMode" HeaderText="paymentMode"
                            SortExpression="paymentMode" />
                        <asp:BoundField DataField="productName" HeaderText="productName"
                            SortExpression="productName" />                      
                        <asp:BoundField DataField="status" HeaderText="status"
                            SortExpression="status" />
                    </Columns>
                </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                    SelectCommand="SELECT * FROM [OrderMaster] WHERE ([registerId] = @registerId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="registerId" SessionField="registerID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>


</asp:Content>

