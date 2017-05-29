<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="ShippingDetails.aspx.vb" Inherits="Admin_ShippingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <div class="AdminShippingDetailsheader">
                    <asp:Label ID="lbAdminShippingDetailsheader" CssClass="csslbAdminShippingDetailsheader"
                        runat="server" Text="Filter Shipping Details"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="AdminShippingDetailSearchControl">
                    <asp:Label ID="lbAdminShippingDetailsheaderSearch" CssClass="lbAdminShippingDetailSearchControl"
                        runat="server" Text="Select Option:"></asp:Label>
                    <asp:DropDownList ID="drpAdminShippingDetailsheaderSearch" runat="server" CssClass="dropAdminShippingDetailSearchControl">
                        <asp:ListItem Text="Select Option" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Shipped" Value="Shipped"></asp:ListItem>
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btFilter" CssClass="btAdminShippingDetailSearchControl" runat="server"
                        Text="Filter" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="gridscroll ">
                    <asp:GridView CssClass="cssAdminShippingDetailsgrid" Caption="Shipping Details"
                        ID="AdminShippingDetailsGrid" runat="server" AutoGenerateColumns="False" PageSize="5"
                        DataKeyNames="orderId,emailId"
                        AutoGenerateEditButton="True" AllowPaging="True" DataSourceID="SqlDataSource1">
                        <HeaderStyle CssClass="cssAdminShippingDetailsgridHeader" />
                        <Columns>
                            <asp:TemplateField HeaderText="Order Id"><EditItemTemplate>
                                <asp:Label ID="lbEditorderID" runat="server" Text='<%#Bind("orderId") %>'></asp:Label></EditItemTemplate><ItemTemplate>
                                <asp:Label ID="lbItemorderID" runat="server" Text='<%#Bind("orderId") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            
                            <asp:BoundField DataField="pid" HeaderText="pid"
                                SortExpression="pid" ReadOnly="true" />
                            <asp:BoundField DataField="registerId" HeaderText="registerId"
                                SortExpression="registerId" ReadOnly="true" />
                            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" ReadOnly="true" />
                            <asp:BoundField DataField="price" ReadOnly="true" HeaderText="price"
                                SortExpression="price" />
                            <asp:BoundField DataField="shippingAddress" HeaderText="shippingAddress" ReadOnly="true"
                                SortExpression="shippingAddress" />
                            <asp:BoundField DataField="emailId" HeaderText="emailId"
                                ReadOnly="true" SortExpression="emailId" /> 
                            <asp:BoundField DataField="orderdate" DataFormatString="{0:MMM dd,yyyy}" HeaderText="orderdate"
                                ReadOnly="true" SortExpression="orderdate" />
                            <asp:TemplateField HeaderText="Product Image">
                                <EditItemTemplate>
                                    <asp:Image ID="adminShippingDetailsmainImage" runat="server" ReadOnly="true" Width="70px"
                                        Height="70px" ImageUrl='<%# Eval("ProductImage") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="adminShippingDetailsmainImage" runat="server" ReadOnly="true" Width="70px"
                                        Height="70px" ImageUrl='<%#Eval("ProductImage") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Username" HeaderText="Username"
                                SortExpression="Username" ReadOnly="true" />
                            <asp:BoundField DataField="paymentMode" HeaderText="paymentMode" ReadOnly="true"
                                SortExpression="paymentMode" />
                            <asp:BoundField DataField="productName" HeaderText="productName" ReadOnly="true"
                                SortExpression="productName" />                          
                            <asp:TemplateField  HeaderText="Shipping Status">
                                <EditItemTemplate >
                                    <asp:DropDownList ID="AdminShippingDetailsdrop" runat="server" CssClass="dropAdminShippingDetailgridControl"   >
                                        <asp:ListItem Text="Select Option" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Shipped" Value="Shipped"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                  <asp:Label ID="lbitemStatus" runat="server"
                                        Text='<%#Bind("status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                        SelectCommand="SELECT * FROM [OrderMaster] WHERE ([status] = @status)" UpdateCommand="update OrderMaster set status=@status where orderId=@orderId">
                        <UpdateParameters>
                          <asp:SessionParameter Name="OrderId" SessionField="OrderId"
                               />
                            <asp:SessionParameter Name="Status" SessionField="Status" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpAdminShippingDetailsheaderSearch"
                                Name="status" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                   
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

