<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false"
    CodeFile="ProductList.aspx.vb" Inherits="User_ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            /*background-color: #f1f0f0;*/
        }

        table {
            margin-top: -7px;
            padding: 3px;
            width: 100%;
            box-shadow: 0 0 6px #e1e1e1;
        }

        legend {
            font-weight: 600;
        }
   
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="productlistfilterTab">
        <asp:Label ID="Lbheaderfilter" CssClass="cssLbheaderfilter" runat="server" Text="Filter Options"></asp:Label>
        <fieldset class="productlistpricefilterfieldset">
            <legend>price</legend>
            <asp:RadioButtonList ID="RadioButtonListPriceProductList" runat="server"
                AutoPostBack="True">
                <asp:ListItem Text="under 5000" Value="<5000"></asp:ListItem>
                <asp:ListItem Text="5000-10000" Value="5000-10000"></asp:ListItem>
                <asp:ListItem Text="10000-25000" Value="10000-25000"></asp:ListItem>
                <asp:ListItem Text="25000-50000" Value="25000-50000"></asp:ListItem>
                <asp:ListItem Text="50000-75000" Value="50000-75000"></asp:ListItem>
                <asp:ListItem Text="75000-100000" Value="75000-100000"></asp:ListItem>
                <asp:ListItem Text="Above 100000" Value=">100000"></asp:ListItem>
            </asp:RadioButtonList>
        </fieldset>
        <div class="productlistfiltertabbrandname">
            <fieldset class="productlistfilterbrandnamefieldset">
                <legend>
                    <asp:Label ID="LbbrandProdutListBrand" runat="server" Text="Select Brand:"></asp:Label>
                </legend>
                <asp:DropDownList CssClass="productlistcssdrop" ID="dropbrandProdutListBrand" runat="server"
                    AutoPostBack="True">
                    <asp:ListItem Text="Select Option" Value="-1">
                    </asp:ListItem>
                    <asp:ListItem Text="Samsung" Value="Samsung">
                    </asp:ListItem>
                    <asp:ListItem Text="Motorola" Value="Motorola">
                    </asp:ListItem>
                    <asp:ListItem Text="Apple" Value="Apple">
                    </asp:ListItem>
                </asp:DropDownList>
            </fieldset>
        </div>
        <div class="productlistfiltertabPlatform">
            <fieldset class="productlistfilterplatformfieldset">
                <legend>
                    <asp:Label ID="lbbrandProdutListplatform" runat="server" Text="Select Platform:"></asp:Label>
                </legend>

                <asp:DropDownList CssClass="productlistcssdrop" ID="dropbrandProdutListplatform" runat="server"
                    AutoPostBack="True">
                    <asp:ListItem Text="Select Option" Value="-1">
                    </asp:ListItem>
                    <asp:ListItem Text="Android" Value="Android">
                    </asp:ListItem>
                    <asp:ListItem Text="Windows" Value="Windows">
                    </asp:ListItem>
                    <asp:ListItem Text="Iphone" Value="Iphone">
                    </asp:ListItem>
                </asp:DropDownList>
            </fieldset>
        </div>
    </div>

    <div class="productListContent">
        <asp:Label ID="LbEmptyMessage" Visible="false"
            runat="server"></asp:Label>

        <%--For product List--%>

        <asp:ListView ID="ListViewProducts" runat="server" DataKeyNames="pid" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was Found.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td rowspan="7" class="productListimg">
                            <asp:Image ID="ImageMain" CssClass="CSSProductListmainImage" runat="server" ImageUrl='<%#"~/" + Eval("MImage") %>' />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label1" CssClass="brandName" runat="server" Text='<%#Eval("brand ") + "&nbsp;" + Eval("pname")%>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Oprating System:<asp:Label ID="Label2" runat="server" Text='<%#bind("osversion") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Color:
                            <asp:Label ID="Label3" runat="server" Text='<%#bind("color") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <%--Check qty --%>
                        <td>
                            <asp:Label ID="Lblistqtystatus" CssClass="productlistqtystatus" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Price:<asp:Label ID="Label4" CssClass="lbprice" runat="server"
                            Text='<%#bind("price") %>'></asp:Label>
                            <br />
                            <asp:Button ID="BtViewDetails" CommandName="View" runat="server" Text="View Details"
                                CssClass="productlistBtViewDetails" CommandArgument='<%#eval("pid") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <div class="productlistpagerposition">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="productlistleftpagebutton" ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="false" ShowPreviousPageButton="True" />
                                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="productlistnumericbutton" CurrentPageLabelCssClass="currentpage" />
                                        <asp:NextPreviousPagerField ButtonCssClass="productlistrightpagebutton" ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="true" ShowPreviousPageButton="False" />

                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
            SelectCommand="SELECT pid, pname, ptype, brand, battery, simtype, Fcamera, Bcamera, osversion, plat_form, modelNo, screen, network, sensor, Bflash, processor, MImage, FirstImage, SecondImage, ThirdImage, color, Ram, Gpu, price, qty, operatingFrequency, InternalStroge, ExpandStorage, Dimension, warranty FROM products WHERE (pname LIKE '%' + @pname + '%') OR (brand LIKE '%' + @brand + '%')">
            <SelectParameters>
                <asp:QueryStringParameter Name="pname" QueryStringField="productDetails" />
                <asp:QueryStringParameter Name="brand" QueryStringField="productDetails" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>

