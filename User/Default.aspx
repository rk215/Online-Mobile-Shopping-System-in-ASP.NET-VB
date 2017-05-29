<%@ Page Title="" Language="VB" MasterPageFile="~/User/UserHome.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="3000"></asp:Timer>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:AdRotator ID="AdRotator1" CssClass="ad" runat="server" Width="100%" Height="340px" DataSourceID="XmlDataSource1" />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
                DataFile="~/Ad Rotator XML FIle/Ad.xml"></asp:XmlDataSource>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
           
        </Triggers>
    </asp:UpdatePanel>
   
    <h1>Upcomming Smartphones</h1>

    <asp:ImageButton ID="ImageButton2" CssClass="simage " runat="server" ImageUrl="~/Banner Image/Redmi3SMain.jpg" />
    <asp:ImageButton ID="ImageButton1" CssClass="fimage " runat="server" ImageUrl="~/Banner Image/Redmi 4A Main.jpg" />
    
</asp:Content>

