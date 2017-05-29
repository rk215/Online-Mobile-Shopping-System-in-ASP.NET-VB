<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="ProductUpdate.aspx.vb" Inherits="Admin_ProductUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="AdminProductUpdatecontainer">
        <div class="AdminProductUpdateHeader">
            <asp:Label ID="lbHeader" runat="server" CssClass="lbHeader " Text="Product Update Information"></asp:Label>
        </div>
        <div class="AdminProductUpdateControls">
            <div class="AdminProductUpdateSearch">
                <asp:Label ID="lbAdminProductUpdateSearch" runat="server" CssClass="lbAdminProductUpdateSearch"
                    Text="Enter Product ID:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUpdateSearch" CssClass="txtAdminProductUpdateSearch"
                    runat="server" placeholder="We Expect Product id from Admin"></asp:TextBox>
                <asp:Button ID="btAdminProductUpdateSearch" runat="server" CssClass="btsearch" Text="Search" />
                <asp:Label ID="LBStatus" CssClass="lbmsg " runat="server"></asp:Label>
                <asp:HyperLink ID="HyperForgotProductId" CssClass="HyperForgotProductId" NavigateUrl="~/Admin/ProductInfo.aspx"
                    runat="server">Don't Know Product Id</asp:HyperLink>
            </div>
            <div class="AdminProductUploadControls">
                <br />
                <%--  Brand --%>
                <asp:Label ID="lbAdminProductUpdateProductbrandName" CssClass="lbproductbrand" runat="server"
                    Text="Enter Brand Name:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductbrandName" CssClass="txtproductbrand"
                    placeholder="Like Motorola"
                    runat="server" MaxLength="14"></asp:TextBox>
                <br />
                <%-- Product Name --%>
                <asp:Label ID="lbAdminProductUploadProductName" CssClass="lbproductName" runat="server"
                    Text="Product Name:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductName" CssClass="txtproductName" placeholder="Like Galaxy s8"
                    runat="server" MaxLength="20"></asp:TextBox>

                <br />

                <%-- Product Type --%>
                <asp:Label ID="lbAdminProductUpdateProducttype" CssClass="lbproducttype" runat="server"
                    Text="Select Product Type :"></asp:Label>
                <asp:DropDownList ID="drpAdminProductUploadProducttype" CssClass="dropProducttype"
                    runat="server">
                    <asp:ListItem Text="Please select product type" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Touch screen" Value="Touch_screen"></asp:ListItem>
                    <asp:ListItem Text="Slider" Value="slider"></asp:ListItem>
                    <asp:ListItem Text="Keypad" Value="Keypad"></asp:ListItem>
                    <asp:ListItem Text="Flip" Value="Flip"></asp:ListItem>
                    <asp:ListItem Text="Touch And Keypad" Value="Touch_And_Keypad"></asp:ListItem>
                </asp:DropDownList>

                <br />


                <%--  Battery--%>
                <asp:Label ID="lbAdminProductUploadProductBattery" CssClass="lbproductbattery" runat="server"
                    Text="Enter Battery Capacity:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductBattery" CssClass="txtproductBattery"
                    placeholder="Like 3000MaH"
                    runat="server" MaxLength="7"></asp:TextBox>
                <br />
                <%--  Sim Type--%>
                <asp:Label ID="lbAdminProductUpdateProductSimType" CssClass="lbproductSimtype" runat="server"
                    Text="Select Supported Sim Type:"></asp:Label>
                <asp:DropDownList ID="drpAdminProductUploadProductSimType" CssClass="dropSimtype"
                    runat="server">
                    <asp:ListItem Text="Please select Sim type" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>
                    <asp:ListItem Text="Mirco" Value="Mirco"></asp:ListItem>
                    <asp:ListItem Text="Nano" Value="Nano"></asp:ListItem>
                </asp:DropDownList>

                <br />
                <%-- Back Camera--%>
                <asp:Label ID="lbAdminProductUploadProductBackCamera" CssClass="lbproductbackcamera"
                    runat="server" Text="Enter Back Camera(In MegaPixel):"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductBackCamera" CssClass="txtproductBcamera"
                    placeholder="Like 13MP"
                    runat="server" MaxLength="4"></asp:TextBox>
                <br />
                <%--  Front Camera--%>
                <asp:Label ID="lbAdminProductUploadProductFrontCamera" CssClass="lbproductfrontCamera"
                    runat="server" Text="Enter Front Camera(In MegaPixel):"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductFrontCamera" CssClass="txtproductFcamera"
                    placeholder="Like 5MP"
                    runat="server" MaxLength="4"></asp:TextBox>
                <br />
                <%-- Platform--%>
                <asp:Label ID="lbAdminProductUpdateProductplatform" CssClass="lbproductplatform"
                    runat="server"
                    Text="Select Platform:"></asp:Label>
                <asp:DropDownList ID="drpAdminProductUploadProductplatform" CssClass="dropplatform"
                    runat="server">
                    <asp:ListItem Text="Please select Platform" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Android" Value="Android"></asp:ListItem>
                    <asp:ListItem Text="windows" Value="windows"></asp:ListItem>
                    <asp:ListItem Text="IPhone" Value="IOS"></asp:ListItem>
                    <asp:ListItem Text="Java" Value="Java"></asp:ListItem>
                    <asp:ListItem Text="Symbain" Value="Symbain"></asp:ListItem>
                    <asp:ListItem Text="Sailfish" Value="Sailfish"></asp:ListItem>
                    <asp:ListItem Text="Zolla" Value="Zolla"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <%-- OS Version--%>
                <asp:Label ID="lbAdminProductUploadProductOsVersion" CssClass="lbproductOSversion"
                    runat="server"
                    Text="Enter OS Version:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductOsVersion" CssClass="txtproductOSVersion"
                    placeholder="Like 6.0,6.1,7.0"
                    runat="server" MaxLength="28"></asp:TextBox>
                <br />
                <%-- Model Number--%>
                <asp:Label ID="lbAdminProductUploadProductModelNumber" CssClass="lbproductModelNumber"
                    runat="server" Text="Enter Model Number:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductModelNumber" CssClass="txtproductModelNumber"
                    placeholder="Like xt1643"
                    runat="server" MaxLength="6"></asp:TextBox>
                <br />
                <%--Screen--%>
                <asp:Label ID="lbAdminProductUploadProductScreen" CssClass="lbproductScreen" runat="server"
                    Text="Enter Screen Size:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductScreen" CssClass="txtproductScreen"
                    placeholder="Like 5 Inch"
                    runat="server" MaxLength="8"></asp:TextBox>
                <br />
                <%--Network--%>
                <asp:Label ID="lbAdminProductUpdateProductNetwork" CssClass="lbproductNetwork" runat="server"
                    Text="Select Support Network type:"></asp:Label>
                <asp:DropDownList ID="drpAdminProductUploadProductNetwork" CssClass="dropnetwork"
                    runat="server">
                    <asp:ListItem Text="Please select Network" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="2G" Value="2G"></asp:ListItem>
                    <asp:ListItem Text="3G" Value="3G"></asp:ListItem>
                    <asp:ListItem Text="4G" Value="4G"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <%--Sessors--%>
                <asp:Label ID="lbAdminProductUploadProductSensor" CssClass="lbproductSensor" runat="server"
                    Text="Enter Supported Sensors:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductSensor" CssClass="txtproductSensor"
                    placeholder="Like proximity,accelarometer,gyroscope etc" TextMode="MultiLine"
                    runat="server" MaxLength="55"></asp:TextBox>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionSensor" runat="server" ErrorMessage="Input Limit Exceeded Or Digit  found"
                    Display="Dynamic" ControlToValidate="txtAdminProductUploadProductSensor" CssClass="adminProductUploadValidation "
                    ValidationExpression="^[\sA-Za-z,]{0,190}$"></asp:RegularExpressionValidator><br />

                <%--Back flash--%>
                <asp:Label ID="lbAdminProductUploadProductBackflash" CssClass="lbproducBackFlash"
                    runat="server"
                    Text="Enter Back flash:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductBackflash" CssClass="txtproductBFlash"
                    placeholder="Like Dual tone"
                    runat="server" MaxLength="12"></asp:TextBox>
                <br />
                <%--Processor--%>
                <asp:Label ID="lbAdminProductUploadProductprocessor" CssClass="lbproductProcessor"
                    runat="server"
                    Text="Enter Processor:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductprocessor" CssClass="txtproductprocessor"
                    placeholder="Like Snapdragon 835"
                    runat="server" MaxLength="15"></asp:TextBox>
                <br />
                <%--Main Image--%>
                <asp:Label ID="lbAdminProductUpdateProductMainImage" CssClass="lbproductMainImage"
                    runat="server"
                    Text="Select Main Image for Product"></asp:Label>
                <asp:Image ID="imgAdminProductUpdateProductMainImage" CssClass="imgAdminProductUpdateProductMainImage"
                    runat="server" />
                <asp:FileUpload ID="fileAdminProductUpdateProductMainImage" runat="server" />
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidatorFileMain" runat="server" ErrorMessage="Please remove special character or select only jpg format" CssClass="adminProductUploadValidation"
                    ControlToValidate="fileAdminProductUpdateProductMainImage"
                    ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"></asp:RegularExpressionValidator>               
                <br />
                <%--First Image--%>
                <asp:Label ID="lbAdminProductUpdateProductfirstImage" CssClass="lbproductFirstImage"
                    runat="server" Text="Select First Image for Product"></asp:Label>
                <asp:Image ID="imgAdminProductUpdateProductfirstImage"
                    CssClass="imgAdminProductUpdateProductfirstImage"
                    runat="server" />
                <asp:FileUpload ID="fileAdminProductUpdateProductfirstImage" runat="server" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorFilefirst" runat="server" CssClass="adminProductUploadValidation"
                    ErrorMessage="Please remove special character or select only jpg format" ControlToValidate="fileAdminProductUpdateProductfirstImage"
                    ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"></asp:RegularExpressionValidator>
                <br />
                <%--Second Image--%>
                <asp:Label ID="lbAdminProductUpdateProductSecondImage" CssClass="lbproductSecondImage"
                    runat="server" Text="Select Second Image for Product"></asp:Label>
                <asp:Image ID="imgAdminProductUpdateProductSecondImage"
                    CssClass="imgAdminProductUpdateProductSecondImage" runat="server" />
                <asp:FileUpload ID="fileAdminProductUpdateProductSecondImage" runat="server" />
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidatorFileSecond" runat="server" ErrorMessage="Please remove special character or select only jpg format"
                    ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$" CssClass="adminProductUploadValidation" ControlToValidate="fileAdminProductUpdateProductSecondImage">
                </asp:RegularExpressionValidator>
                <br />
                <%--third Image--%>
                <asp:Label ID="lbAdminProductUpdateProductThirdImage" CssClass="lbproductThirdImage "
                    runat="server" Text="Select Third Image for Product"></asp:Label>
                <asp:Image CssClass="imgAdminProductUpdateProductThirdImage"
                    ID="imgAdminProductUpdateProductThirdImage"
                    runat="server" />
                <asp:FileUpload ID="fileAdminProductUpdateProductThirdImage" runat="server" />
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidatorFileThird" runat="server" ErrorMessage="Please remove special character or select only jpg format" CssClass="adminProductUploadValidation"
                    ControlToValidate="fileAdminProductUpdateProductThirdImage"
                    ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"></asp:RegularExpressionValidator>
              
                <br />
                <br />
                <%--Color--%>
                <asp:Label ID="lbAdminProductUpdateProductColor" CssClass="lbproductNetwork" runat="server"
                    Text="Select Mobile Color:"></asp:Label>
                <asp:DropDownList ID="drpAdminProductUploadProductColor" CssClass="dropcolor" runat="server">
                    <asp:ListItem Text="Select Color" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Black" Value="Black"></asp:ListItem>
                    <asp:ListItem Text="White" Value="White"></asp:ListItem>
                    <asp:ListItem Text="Silver" Value="Silver"></asp:ListItem>
                    <asp:ListItem Text="Golden" Value="Golden"></asp:ListItem>
                    <asp:ListItem Text="Orange" Value="Orange"></asp:ListItem>
                    <asp:ListItem Text="Blue" Value="Blue"></asp:ListItem>
                    <asp:ListItem Text="Gray" Value="Gray"></asp:ListItem>
                </asp:DropDownList><br />
                <%--GPU--%>
                <asp:Label ID="lbAdminProductUploadProductGPU" CssClass="lbproductGPU" runat="server"
                    Text="Enter GPU Name:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductGPU" CssClass="txtproductGPU" placeholder="Like Adreno 430"
                    MaxLength="10"
                    runat="server"></asp:TextBox>
                <br />
                <%--Price--%>
                <asp:Label ID="lbAdminProductUploadProductPrice" CssClass="lbproducprice" runat="server"
                    Text="Enter Price:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductPrice" CssClass="txtproductPrice" placeholder="Like 10000"
                    runat="server" MaxLength="8"></asp:TextBox>
                <br />
                <%--Qunatity--%>
                <asp:Label ID="lbAdminProductUploadProductQty" CssClass="lbproductQTY" runat="server"
                    Text="Enter Product Quantity:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductQty" CssClass="txtproductQty" placeholder="Like 10000"
                    MaxLength="8"
                    runat="server"></asp:TextBox>
                <br />
                <%--Operating Frequncy--%>
                <asp:Label ID="lbAdminProductUploadProductOperatingFreq" CssClass="lbproductOpertefreq"
                    runat="server" Text="Enter Product Operating Frequncy:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductOperatingFreq" MaxLength="40" TextMode="MultiLine"
                    placeholder="Like 800MgZ-1500GhZ" CssClass="txtproductoperateFreq"
                    runat="server"></asp:TextBox>

                <asp:RegularExpressionValidator
                    ID="RegularExpressionOpearefreq" runat="server" ErrorMessage="Input Limit Exceeded"
                    Display="Dynamic" ControlToValidate="txtAdminProductUploadProductOperatingFreq"
                    CssClass="adminProductUploadValidation "
                    ValidationExpression="^[0-9a-zA-z \ \-]{0,40}"></asp:RegularExpressionValidator><br />
                <%--Internal Storage--%>
                <asp:Label ID="lbAdminProductUploadProductInternalStorage" CssClass="lbproductinternal"
                    runat="server" Text="Enter Product Internal Storage:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductInternalStorage" CssClass="txtproductInternal"
                    MaxLength="5"
                    placeholder="Like 16GB"
                    runat="server"></asp:TextBox><br />
                <%--External Storage--%>
                <asp:Label ID="lbAdminProductUploadProductExternalStorage" CssClass="lbproductExternal"
                    runat="server" Text="Enter Product External Storage:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductExternalStorage" CssClass="txtproductExternal"
                    MaxLength="5"
                    placeholder="Like 64GB"
                    runat="server"></asp:TextBox><br />
                <%-- Ram --%>
                <asp:Label ID="lbAdminProductUploadProductRAM" CssClass="lbproductRam"
                    runat="server" Text="Enter Product RAM:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductRAM" CssClass="txtproductRam"
                    MaxLength="5"
                    placeholder="Like 2GB"
                    runat="server"></asp:TextBox><br />
                <%--Dimention--%>
                <asp:Label ID="lbAdminProductUploadProductDimention" CssClass="lbproductDimention "
                    runat="server"
                    Text="Enter Product Dimention:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductDimention" CssClass="txtproductDimention"
                    placeholder="Like 7.1x1x15.3CM" TextMode="MultiLine"
                    runat="server"></asp:TextBox>

                <asp:RegularExpressionValidator
                    ID="RegularExpressionDimention" runat="server" ErrorMessage="Input Limit Exceeded"
                    Display="Dynamic" ControlToValidate="txtAdminProductUploadProductDimention" CssClass="adminProductUploadValidation "
                    ValidationExpression="^[\sA-Za-z0-9.]{0,100}$"></asp:RegularExpressionValidator><br />
                <%--Warrentity Status--%>
                <asp:Label ID="lbAdminProductUploadProductWarrenty" CssClass="lbproductWarrenty "
                    runat="server"
                    Text="Enter Product Warrenty Status:"></asp:Label>
                <asp:TextBox ID="txtAdminProductUploadProductWarrenty" CssClass="txtproductWarrenty"
                    placeholder="Like 1 year manufacturing warranty" TextMode="MultiLine"
                    runat="server"></asp:TextBox><asp:RegularExpressionValidator
                        ID="RegularExpressionWarranty" runat="server" ErrorMessage="Input Limit Exceeded"
                        Display="Dynamic" ControlToValidate="txtAdminProductUploadProductWarrenty" CssClass="adminProductUploadValidation "
                        ValidationExpression="^[\sA-Za-z0-9.]{0,100}$"></asp:RegularExpressionValidator><br />
                <asp:Button ID="btadminProductUpdate" runat="server" CssClass="AdminProductUpdateupdate"
                    Text="Update" />
                <asp:Button ID="btAdminProductUpdateCancel" runat="server" CssClass="AdminProductUpdatecancel"
                    Text="Cancel" />
                <asp:Label ID="lbMsgStatus" CssClass="lbmsgStatus" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

