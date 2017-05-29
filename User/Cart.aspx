<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false"
    CodeFile="Cart.aspx.vb" Inherits="User_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
    <style>
        .cssbtcheckout {
            margin-left: 667px;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" CssClass="csscartgrid" runat="server" AutoGenerateColumns="False"
        RowStyle-CssClass="cssrowstyle"
        Caption="Cart Details" EmptyDataText="No Products on cart" GridLines="Horizontal" CellPadding="10" CellSpacing="6"
        DataSourceID="SqlDataSource1" HeaderStyle-CssClass="cssgridheader"
        ShowFooter="True">
        <Columns>
            <%--Cart ID--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label Visible="false" runat="server" ID="LbItemCartId" Text='<%#Bind("cartId") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label Visible="false" runat="server" ID="LbEditCartId" Text='<%#Bind("cartId") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <%--Product ID pid--%>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Label Visible="false" runat="server" ID="LbEditpid" Text='<%#Bind("pid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label Visible="false" runat="server" ID="LbItempid" Text='<%#Bind("pid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <%-- FOR CART PRODUCT IMAGE --%>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Image runat="server" CssClass="csseditImage" ImageUrl='<%#Eval("MImage") %>'></asp:Image>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image runat="server" CssClass="cssItemImage" ImageUrl='<%#Eval("MImage") %>'></asp:Image>
                </ItemTemplate>

            </asp:TemplateField>
            <%-- FOR CART PRODUCT NAME --%>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:Label ID="LbEditpname" runat="server" Text='<%#Bind("pname") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LbItempname" runat="server" Text='<%#Bind("pname") %>'></asp:Label>
                </ItemTemplate>
                <%-- FOR CART QTY--%>
              
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qauntity">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropEidtQTY" CssClass="dropqty" runat="server">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbItemQTY" runat="server" Text='<%#Bind("qty") %>'></asp:Label>
                </ItemTemplate>
                <%-- FOR CART PRICE --%>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:Label
                        ID="Label4" runat="server" Text="&#8377;"></asp:Label>
                    <asp:Label ID="LbEditprice" runat="server" Text='<%#Bind("price") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label
                        ID="Label3" runat="server" Text="&#8377;"></asp:Label>
                    <asp:Label ID="LbItemprice" runat="server"
                        Text='<%#Bind("price")%>'>
                    </asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
            <%-- FOR CART DELETE BUTTON --%>

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure You Want to delete product from cart')"
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="cssgridheader"></HeaderStyle>
        <RowStyle CssClass="cssrowstyle"></RowStyle>
    </asp:GridView>
    <asp:Label ID="LbError" CssClass="csslbQtyError" runat="server"></asp:Label>
    <asp:Button ID="btcheckout" CssClass="cssbtcheckout" runat="server" Text="Proceed To Checkout" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
        SelectCommand="SELECT * FROM [cart] WHERE ([registerId] = @registerId)"
        DeleteCommand="DELETE from [cart] where cartId=@CID"
        UpdateCommand="update cart set price=@pr,qty=@qt where cartId=@CID">
        <SelectParameters>
            <asp:SessionParameter Name="registerId" SessionField="id" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="CID" Type="Int32" SessionField="cartId" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="pr" Type="Int32" SessionField="price" />
            <asp:SessionParameter Name="qt" Type="Int32" SessionField="qty" />
            <asp:SessionParameter Name="CID" Type="Int32" SessionField="cartId" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table class="suggestion">
        <tr>
            <th>You May also like </th>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server"
                    DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <table class="suggestionImage">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" CssClass="suggestionImage" ImageUrl='<%#"~/" + Eval("MImage") %>' runat="server" /></td>
                            </tr>
                        </table>
                        <table class="suggestionproductsInfo">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" CssClass="brandName" runat="server" Text='<%#Eval("brand ") + "&nbsp;" + Eval("pname")%>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="osversionLabel" runat="server" Text='<%# Eval("osversion") %>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="InternalStrogeLabel" runat="server"
                                        Text='<%# Eval("InternalStroge") %>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="plat_formLabel" runat="server" Text='<%# Eval("plat_form") %>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="processorLabel" runat="server" Text='<%# Eval("processor") %>' />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="priceLabel" CssClass="csssuggestionproductsInfoprice" runat="server"
                                        Text='<%#Eval("price")%>' /><asp:Label ID="Label2" runat="server" Text="&#8377;"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="BtViewDetails" CssClass="csssuggestionproductsInfoView" CommandArgument='<%#bind("pid") %>' CommandName="View" runat="server" Text="View Details" /></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <div class="separater"></div>
                    </SeparatorTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                    SelectCommand="SELECT  top 2(pid),pname, brand, osversion, price, InternalStroge, plat_form, processor, MImage FROM products ORDER BY CRYPT_GEN_RANDOM(pid)"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>



