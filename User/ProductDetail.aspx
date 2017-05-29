<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false"
    CodeFile="ProductDetail.aspx.vb" Inherits="User_ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        th {
            /*Style specs header*/
            position: absolute;
            margin-top: -40px;
            color: #bb3030;
        }

        .tabletr {
            border: 1px solid #dadada;
        }

        .tabletd {
            padding: 10px;
            border: 1px solid #999;
        }
         .cssproductDetailInfo {
            position: absolute;
            margin-left: 50px;
            margin-top:-280px;
        }  

        .lbproductDetailqtystatus {
            position: absolute;
            margin-top: -50px;
            margin-left: 50px;
            font-size: 20px;
            color: #bb3030;
        }
    </style>
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="productdetailmainImageTablerepeaterMainImage">
                            <asp:Image ID="ImageMain" runat="server" ImageUrl='<%#"~/" + Eval("MImage")%>' CssClass="cssImageMainrepeater" />
                        </div>
                        <div class="productdetailthumbnails">
                            <asp:ImageButton Height="60px" Width="60px" ID="ImageButton1" CommandName="mainImage"
                                CssClass="productdetailmainImageTablecssthumbnailimg1" ImageUrl='<%#"~/" + Eval("MImage") %>'
                                runat="server" /><br />
                            <br />
                            <asp:ImageButton Height="60px" Width="60px" ID="ImageButton2" CommandName="firtImage"
                                CssClass="productdetailmainImageTablecssthumbnailimg2"
                                ImageUrl='<%#"~/" + Eval("FirstImage") %>'
                                runat="server" /><br />
                            <br />
                            <asp:ImageButton Height="60px" Width="60px" ID="ImageButton3" CommandName="SecondImage"
                                CssClass="productdetailmainImageTablecssthumbnailimg3"
                                ImageUrl='<%#"~/" + Eval("SecondImage") %>'
                                runat="server" /><br />
                            <br />
                            <asp:ImageButton Height="60px" Width="60px" ID="ImageButton4" CommandName="ThirdImage"
                                CssClass="productdetailmainImageTablecssthumbnailimg4"
                                ImageUrl='<%#"~/" + Eval("ThirdImage") %>'
                                runat="server" /><br />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                    SelectCommand="SELECT [MImage], [FirstImage], [SecondImage], [ThirdImage] FROM [products] WHERE ([pid] = @pid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
    <div class="productdetailmainImageTablecssproductinfo">
        <table class="ts">
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="ProductDetailProductImage">
                                <asp:Image ID="ImageMain" runat="server"
                                    ImageUrl='<%#"~/" + Eval("MImage")%>'
                                    CssClass="cssImageMainDatalist" />
                            </div>
                            <div class="cssproductDetailInfo">
                                <asp:Label ID="brandLabel" CssClass="cssproductdetailsBrand" runat="server"
                                    Text='<%#Eval("brand ") + "&nbsp;" + Eval("pname")%>' />
                                <br />
                                <asp:Label ID="ptypeLabel" runat="server"
                                    Text='<%# Eval("ptype") %>' CssClass="productdetailcssptype" />
                                <br />
                                <asp:Label ID="screenLabel" runat="server"
                                    Text='<%# Eval("screen") %>' CssClass="productdetailcssscreen"></asp:Label>
                                <asp:Label ID="Lbscreenttext" CssClass="productdetailcssLbscreen" runat="server" Text="Screen"></asp:Label>
                                <br />
                                <asp:Label ID="processorLabel" runat="server" Text='<%# Eval("processor") %>' CssClass="productdetailcssprocessor" />
                                <asp:Label ID="Label1" CssClass="productdetailcsslbprocessor" runat="server" Text="processor"></asp:Label>
                                <br />
                                <asp:Label ID="colorLabel" runat="server" Text='<%# Eval("color") %>' CssClass="productdetailcsscolor" />
                                <asp:Label
                                    ID="Label2" CssClass="productdetailcssLbColor" runat="server" Text="color"></asp:Label>
                                <br />
                                <asp:Label ID="InternalStrogeLabel" runat="server"
                                    CssClass="productdetailcssinternal" Text='<%# Eval("InternalStroge") %>' />
                                <asp:Label ID="Label4" runat="server" Text="Internal Memory" CssClass="productdetailcsslbinternal"></asp:Label>
                                <br />
                                <asp:Label ID="ExpandStorageLabel" runat="server"
                                    CssClass="productdetailcssexternal" Text='<%# Eval("ExpandStorage") %>' />
                                <asp:Label
                                    CssClass="productdetailcsslbexternal" ID="Label5" runat="server" Text="Expandable"></asp:Label>
                                <br />
                                <asp:Label ID="priceLabel" runat="server"
                                    Text='<%# Eval("price")%>' CssClass="productdetailcssprice"></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="&#8377;" CssClass="productdetailcsslbprice"></asp:Label>
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Label ID="Lbqtystatus" runat="server"
                        CssClass="lbproductDetailqtystatus"></asp:Label>
                    <asp:Button ID="Btbuynow" CommandName="BuyNow" CssClass="productdetailcssBtbuynow"
                        runat="server" Text="Buy Now" />
                    <asp:Button ID="Btaddtocart"
                        CommandName="addtocart" CssClass="productdetailcssBtaddtocart" runat="server" Text="Add to cart" />

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                        SelectCommand="SELECT [MImage],[pname], [ptype], [brand], [Fcamera], [Bcamera], [screen], [processor], [color], [price], [InternalStroge], [ExpandStorage] FROM [products] WHERE ([pid] = @pid)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>

                <table class="specs">
                    <tr class="tabletr">
                        <th>Full specification :-</th>
                    </tr>
                    <div>
                        <%--For first part --%>
                        <tr class="tabletr">
                            <td class="tabletd">Product Name:</td>
                            <td class="tabletd">
                                <asp:Label ID="pnameLabel" runat="server"
                                    Text='<%# Eval("pname") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">type:</td>
                            <td class="tabletd">
                                <asp:Label ID="ptypeLabel" runat="server" Text='<%# Eval("ptype") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Brand:</td>
                            <td class="tabletd">
                                <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Battery:</td>
                            <td class="tabletd">
                                <asp:Label ID="batteryLabel" runat="server" Text='<%# Eval("battery") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Sim Type:</td>
                            <td class="tabletd">
                                <asp:Label ID="simtypeLabel" runat="server" Text='<%# Eval("simtype") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Front camera:</td>
                            <td class="tabletd">
                                <asp:Label ID="FcameraLabel" runat="server" Text='<%# Eval("Fcamera") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Back camera:</td>
                            <td class="tabletd">
                                <asp:Label ID="BcameraLabel" runat="server" Text='<%# Eval("Bcamera") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">OS version:</td>
                            <td class="tabletd">
                                <asp:Label ID="osversionLabel" runat="server" Text='<%# Eval("osversion") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Platform:</td>
                            <td class="tabletd">
                                <asp:Label ID="plat_formLabel" runat="server" Text='<%# Eval("plat_form") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">ModelNo:</td>
                            <td class="tabletd">
                                <asp:Label ID="modelNoLabel" runat="server" Text='<%# Eval("modelNo") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Screen:</td>
                            <td class="tabletd">
                                <asp:Label ID="screenLabel" runat="server" Text='<%# Eval("screen") %>' />
                                <br />
                            </td>
                        </tr>
                    </div>
                </table>
                <%-- For second Part --%>
                <div>
                    <table class="secondpartspecs">
                        <%--For Second part --%>
                        <tr class="tabletr">
                            <td class="tabletd">Network:</td>
                            <td class="tabletd">
                                <asp:Label ID="networkLabel" runat="server" Text='<%# Eval("network") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Sensors:</td>
                            <td class="tabletd">
                                <asp:Label ID="sensorLabel" runat="server" Text='<%# Eval("sensor") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Back Flash:</td>
                            <td class="tabletd">
                                <asp:Label ID="BflashLabel" runat="server" Text='<%# Eval("Bflash") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Processor:</td>
                            <td class="tabletd">
                                <asp:Label ID="processorLabel" runat="server" Text='<%# Eval("processor") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Color:</td>
                            <td class="tabletd">
                                <asp:Label ID="colorLabel" runat="server" Text='<%# Eval("color") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">RAM:</td>
                            <td class="tabletd">
                                <asp:Label ID="RamLabel" runat="server" Text='<%# Eval("Ram") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">GPU:</td>
                            <td class="tabletd">
                                <asp:Label ID="GpuLabel" runat="server" Text='<%# Eval("Gpu") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Operating Frequency:</td>
                            <td class="tabletd">
                                <asp:Label ID="operatingFrequencyLabel" runat="server"
                                    Text='<%# Eval("operatingFrequency") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Internal Stroge:</td>
                            <td class="tabletd">
                                <asp:Label ID="InternalStrogeLabel" runat="server"
                                    Text='<%# Eval("InternalStroge") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Expandable Storage:</td>
                            <td class="tabletd">
                                <asp:Label ID="ExpandStorageLabel" runat="server"
                                    Text='<%# Eval("ExpandStorage") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">Dimension:</td>
                            <td class="tabletd">
                                <asp:Label ID="DimensionLabel" runat="server" Text='<%# Eval("Dimension") %>' />
                                <br />
                            </td>
                        </tr>
                        <tr class="tabletr">
                            <td class="tabletd">warranty Status:</td>
                            <td class="tabletd">
                                <asp:Label ID="warrantyLabel" runat="server" Text='<%# Eval("warranty") %>' />
                                <br />
                            </td>
                        </tr>
                </div>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
            ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
            SelectCommand="SELECT [pname], [ptype], [brand], [battery], [simtype], [Fcamera], [Bcamera], [osversion], [plat_form], [modelNo], [screen], [network], [sensor], [Bflash], [processor], [color], [Ram], [Gpu], [operatingFrequency], [InternalStroge], [ExpandStorage], [Dimension], [warranty] FROM [products] WHERE ([pid] = @pid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

