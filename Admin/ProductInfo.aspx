<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="ProductInfo.aspx.vb" Inherits="Admin_ProductInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">   
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cssProdutInfoHeader">
        <asp:Label ID="lbProdutInfoHeader" CssClass="cssProdutInfoHeaderlb" runat="server"
            Text="Some Usefull information about products"></asp:Label>
    </div>
    
    <asp:GridView CssClass="cssProductinfoGrid" ID="ProductinfoGrid" runat="server" AutoGenerateColumns="False" BorderColor="#252525"
        DataKeyNames="pid" EmptyDataText="No Product Found" DataSourceID="SqlDataSource1" AllowPaging="True" 
        PageSize="5">
        <HeaderStyle CssClass="cssProductinfogridheader" />
        <Columns>            
            <asp:BoundField DataField="pid" HeaderText="Product ID" InsertVisible="False"
                ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="pname" HeaderText="name" SortExpression="pname" />
            <asp:BoundField DataField="ptype" HeaderText="type" SortExpression="ptype" />
            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
            <asp:BoundField DataField="osversion" HeaderText="osversion"
                SortExpression="osversion" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:TemplateField HeaderText="Product Main Image">
                <ItemTemplate>
                    <asp:Image ID="productInfoimgMainImage" CssClass="cssproductInfoimgMainImage" 
                        ImageUrl='<%#"~/" + Eval("MImage") %>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
            <asp:BoundField DataField="InternalStroge" HeaderText="InternalStroge"
                SortExpression="InternalStroge" />
            <asp:BoundField DataField="ExpandStorage" HeaderText="ExpandStorage"
                SortExpression="ExpandStorage" />
            <asp:BoundField DataField="Ram" HeaderText="Ram" SortExpression="Ram" />
            <asp:BoundField DataField="plat_form" HeaderText="plat_form"
                SortExpression="plat_form" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
        SelectCommand="SELECT [pid], [pname], [ptype], [brand], [osversion], [price], [qty], [MImage], [color], [InternalStroge], [ExpandStorage], [Ram], [plat_form] FROM [products]">
    </asp:SqlDataSource>
</asp:Content>

