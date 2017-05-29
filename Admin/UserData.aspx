<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="UserData.aspx.vb" Inherits="Admin_UserData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="LbAdminUserDataHeader" CssClass="cssLbAdminUserDataHeader" runat="server"
                    Text="Here You Can Find All User Data"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <div class="cssgridscrollable">
                    <asp:GridView ID="GridView1" CssClass="cssadminUserdatagrid" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" Caption="User Details"
                        DataKeyNames="registerId" CellPadding="5" CellSpacing="5" DataSourceID="SqlDataSource1">
                        <HeaderStyle CssClass="cssadminUserdatagridheader" />
                        <Columns>
                            <asp:BoundField DataField="registerId" HeaderText="registerId"
                                InsertVisible="False" ReadOnly="True" SortExpression="registerId" />
                            <asp:BoundField DataField="username" HeaderText="username"
                                SortExpression="username" />
                            <asp:BoundField DataField="pass" HeaderText="password" SortExpression="pass" />
                            <asp:BoundField DataField="firstname" HeaderText="firstname"
                                SortExpression="firstname" />
                            <asp:BoundField DataField="lastname" HeaderText="lastname"
                                SortExpression="lastname" />
                            <asp:BoundField DataField="phoneNumber" HeaderText="phoneNumber"
                                SortExpression="phoneNumber" />
                            <asp:BoundField DataField="addres" HeaderText="addres"
                                SortExpression="addres" />
                            <asp:BoundField DataField="creditOrdebit" HeaderText="creditOrdebit"
                                SortExpression="creditOrdebit" />
                            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                            <asp:BoundField DataField="stat" HeaderText="stat" SortExpression="stat" />
                            <asp:BoundField DataField="zipcode" HeaderText="zipcode"
                                SortExpression="zipcode" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ShoppingConnectionString %>"
                    SelectCommand="SELECT * FROM [RegistrationMaster]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

