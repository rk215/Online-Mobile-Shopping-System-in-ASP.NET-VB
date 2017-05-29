﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="DeleteProduct.aspx.vb" Inherits="Admin_DeleteProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="AdminProductDeletecontainer">
        <div class="AdminProductDeleteHeader">
            <asp:Label ID="lbHeader" runat="server" CssClass="lbAdminDeleteHeader " Text="Product Update Information"></asp:Label>
        </div>
        <div class="AdminProductDeleteControls">
            <asp:GridView ID="ProductDeleteGrid" CssClass="cssProductdeleteGrid"
                BorderColor="#5e5454" runat="server" AutoGenerateDeleteButton="true"
                AutoGenerateColumns="False"
                DataKeyNames="pid" AllowPaging="True">
                <HeaderStyle CssClass="cssProductDeletegridheader" />
                <Columns>
                    <asp:TemplateField HeaderText="Product ID">
                        <ItemTemplate>
                            <asp:Label ID="LbItemdeleteproductID" runat="server" Text='<%#Bind("pid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="prname" />
                    <asp:BoundField DataField="ptype" HeaderText="ptype" SortExpression="ptype" />
                    <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                    <asp:BoundField DataField="plat_form" HeaderText="Platform" />
                    <asp:BoundField DataField="osversion" HeaderText="osversion"
                        SortExpression="osversion" />
                    <asp:BoundField DataField="modelNo" HeaderText="modelNo"
                        SortExpression="modelNo" />
                    <asp:BoundField DataField="plat_form" HeaderText="plat_form"
                        SortExpression="plat_form" />
                    <asp:TemplateField HeaderText="Main Image">
                        <ItemTemplate>
                            <asp:Image runat="server" CssClass="cssProductDeleteMainImage" ImageUrl='<%#"~/" + Eval("MImage") %>'>
                            </asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Ram" HeaderText="Ram" SortExpression="Ram" />
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                </Columns>

            </asp:GridView>
            
        </div>
    </div>
</asp:Content>

