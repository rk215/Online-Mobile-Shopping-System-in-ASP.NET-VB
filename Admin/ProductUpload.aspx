<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="ProductUpload.aspx.vb" Inherits="Admin_ProductUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <style>
        body {
            padding: 0;
            margin: 0;
        } 
   </style>
    
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="AdminProductUploadcontainer">
        <div class="AdminProductUploadHeader">
            <asp:Label ID="lbHeader" runat="server" CssClass="lbproductUploadHeader " Text="Product Upload Information"></asp:Label>
        </div>
        <div class="AdminProductUploadControls">
            <br />
            <%--  Brand --%>
            <asp:Label ID="lbAdminProductUploadProductbrandName" CssClass="lbproductUploadbrand" runat="server"
                Text="Enter Brand Name:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductbrandName" CssClass="txtproductUploadbrand"
                placeholder="Like Motorola"
                runat="server" MaxLength="14"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldBrandName"
                runat="server" ErrorMessage="Product Brand Name is Required"
                ControlToValidate="txtAdminProductUploadProductbrandName"></asp:RequiredFieldValidator><br />
            <%-- Product Name --%>
            <asp:Label ID="lbAdminProductUploadProductName" CssClass="lbproductUploadName" runat="server"
                Text="Product Name:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductName" CssClass="txtproductUploadproductName" placeholder="Like Moto g4 Plus"
                runat="server" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldProductName" runat="server" CssClass="adminProductUploadValidation"
                ErrorMessage="Product Name is Required"
                ControlToValidate="txtAdminProductUploadProductName"></asp:RequiredFieldValidator>
            <br />

            <%-- Product Type --%>
            <asp:Label ID="lbAdminProductUploadProducttype" CssClass="lbproductUploadSimtype" runat="server"
                Text="Select Product Type :"></asp:Label>
            <asp:DropDownList ID="drpAdminProductUploadProducttype" CssClass="dropproductUploadtype"
                runat="server">
                <asp:ListItem Text="Please Select product type" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Touch screen" Value="Touch_screen"></asp:ListItem>
                <asp:ListItem Text="Slider" Value="slider"></asp:ListItem>
                <asp:ListItem Text="Keypad" Value="Keypad"></asp:ListItem>
                <asp:ListItem Text="Flip" Value="Flip"></asp:ListItem>
                <asp:ListItem Text="Touch And Keypad" Value="Touch_And_Keypad"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldProducttype"
                InitialValue="-1"
                runat="server" ErrorMessage="Please select product type"
                ControlToValidate="drpAdminProductUploadProducttype"></asp:RequiredFieldValidator>
            <br />


            <%--  Battery--%>
            <asp:Label ID="lbAdminProductUploadProductBattery" CssClass="lbproductUploadbattery" runat="server"
                Text="Enter Battery Capacity:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductBattery" CssClass="txtproductUploadBattery"
                placeholder="Like 3000MaH"
                runat="server" MaxLength="7"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldBattery"
                runat="server" ErrorMessage="Product Battery is Required"
                ControlToValidate="txtAdminProductUploadProductBattery"></asp:RequiredFieldValidator><br />
            <%--  Sim Type--%>
            <asp:Label ID="lbAdminProductUploadProductSimType" CssClass="lbproductSimtype" runat="server"
                Text="Select Supported Sim Type:"></asp:Label>
            <asp:DropDownList ID="drpAdminProductUploadProductSimType" CssClass="dropproductUploadSimtype"
                runat="server">
                <asp:ListItem Text="Please Select Sim type" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Normal" Value="Normal"></asp:ListItem>
                <asp:ListItem Text="Mirco" Value="Mirco"></asp:ListItem>
                <asp:ListItem Text="Nano" Value="Nano"></asp:ListItem>
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldSimtype" runat="server"
                ErrorMessage="Please select Sim type" CssClass="adminProductUploadValidation"
                ControlToValidate="drpAdminProductUploadProductSimType"
                InitialValue="-1"></asp:RequiredFieldValidator><br />
            <%-- Back Camera--%>
            <asp:Label ID="lbAdminProductUploadProductBackCamera" CssClass="lbproductUploadbackcamera"
                runat="server" Text="Enter Back Camera(In MegaPixel):"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductBackCamera" CssClass="txtproductUploadBcamera"
                placeholder="Like 13MP"
                runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldBackCamera"
                runat="server" ErrorMessage="Product Back Camera is Required"
                ControlToValidate="txtAdminProductUploadProductBackCamera"></asp:RequiredFieldValidator><br />
            <%--  Front Camera--%>
            <asp:Label ID="lbAdminProductUploadProductFrontCamera" CssClass="lbproductUploadfrontCamera"
                runat="server" Text="Enter Front Camera(In MegaPixel):"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductFrontCamera" CssClass="txtproductUploadFcamera"
                placeholder="Like 5MP"
                runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldFrontCamera"
                runat="server" ErrorMessage="Product Front Camera is Required"
                ControlToValidate="txtAdminProductUploadProductFrontCamera"></asp:RequiredFieldValidator><br />
            <%-- Platform--%>
            <asp:Label ID="lbAdminProductUploadProductplatform" CssClass="lbproductUploadplatform"
                runat="server"
                Text="Select Platform:"></asp:Label>
            <asp:DropDownList ID="drpAdminProductUploadProductplatform" CssClass="dropproductUploadplatform"
                runat="server">
                <asp:ListItem Text="Please Select Platform" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Android" Value="Android"></asp:ListItem>
                <asp:ListItem Text="windows" Value="windows"></asp:ListItem>
                <asp:ListItem Text="IPhone" Value="IOS"></asp:ListItem>
                <asp:ListItem Text="Java" Value="Java"></asp:ListItem>
                <asp:ListItem Text="Symbain" Value="Symbain"></asp:ListItem>
                <asp:ListItem Text="Sailfish" Value="Sailfish"></asp:ListItem>
                <asp:ListItem Text="Zolla" Value="Zolla"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldPlatform" runat="server"
                ErrorMessage="Please select Platform" CssClass="adminProductUploadValidation"
                ControlToValidate="drpAdminProductUploadProductplatform"
                InitialValue="-1"></asp:RequiredFieldValidator><br />
            <%-- OS Version--%>
            <asp:Label ID="lbAdminProductUploadProductOsVersion" CssClass="lbproductUploadOSversion"
                runat="server"
                Text="Enter OS Version:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductOsVersion" CssClass="txtproductUploadOSVersion"
                placeholder="Like 6.0,6.1,7.0"
                runat="server" MaxLength="28"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldOSVersion"
                runat="server" ErrorMessage="Product OS Version is Required"
                ControlToValidate="txtAdminProductUploadProductOsVersion"></asp:RequiredFieldValidator><br />
            <%-- Model Number--%>
            <asp:Label ID="lbAdminProductUploadProductModelNumber" CssClass="lbproductUploadModelNumber"
                runat="server" Text="Enter Model Number:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductModelNumber" CssClass="txtproductUploadModelNumber"
                placeholder="Like xt1643"
                runat="server" MaxLength="6"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldModelNumber"
                runat="server" ErrorMessage="Product Model Number is Required"
                ControlToValidate="txtAdminProductUploadProductModelNumber"></asp:RequiredFieldValidator><br />
            <%--Screen--%>
            <asp:Label ID="lbAdminProductUploadProductScreen" CssClass="lbproductUploadScreen" runat="server"
                Text="Enter Screen Size:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductScreen" CssClass="txtproductUploadScreen"
                placeholder="Like 5 Inch"
                runat="server" MaxLength="8"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldScreen"
                runat="server" ErrorMessage="Product Screen  value is Required"
                ControlToValidate="txtAdminProductUploadProductScreen"></asp:RequiredFieldValidator><br />
            <%--Network--%>
            <asp:Label ID="lbAdminProductUploadProductNetwork" CssClass="lbproductUploadNetwork" runat="server"
                Text="Select Support Network type:"></asp:Label>
            <asp:DropDownList ID="drpAdminProductUploadProductNetwork" CssClass="dropproductUploadnetwork"
                runat="server">
                <asp:ListItem Text="Please Select Network" Value="-1"></asp:ListItem>
                <asp:ListItem Text="2G" Value="2G"></asp:ListItem>
                <asp:ListItem Text="3G" Value="3G"></asp:ListItem>
                <asp:ListItem Text="4G" Value="4G"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldNetwork" runat="server"
                ErrorMessage="Please Select Network" CssClass="adminProductUploadValidation"
                ControlToValidate="drpAdminProductUploadProductNetwork"
                InitialValue="-1"></asp:RequiredFieldValidator><br />
            <%--Sessors--%>
            <asp:Label ID="lbAdminProductUploadProductSensor" CssClass="lbproductUploadSensor" runat="server"
                Text="Enter Supported Sensors:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductSensor" CssClass="txtproductUploadSensor"
                placeholder="Like proximity,accelarometer,gyroscope etc" TextMode="MultiLine"
                runat="server" MaxLength="55"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldVSensor"
                runat="server" ErrorMessage="Product Sensor Information is Required"
                Display="Dynamic" ControlToValidate="txtAdminProductUploadProductSensor"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                ID="RegularExpressionSensor" runat="server" ErrorMessage="Input Limit Exceeded Or Digit  found"
                Display="Dynamic" ControlToValidate="txtAdminProductUploadProductSensor" CssClass="adminProductUploadValidation "
                ValidationExpression="^[\sA-Za-z,]{0,190}$"></asp:RegularExpressionValidator><br />

            <%--Back flash--%>
            <asp:Label ID="lbAdminProductUploadProductBackflash" CssClass="lbproductUploadBackFlash"
                runat="server"
                Text="Enter Back flash:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductBackflash" CssClass="txtproductUploadBFlash"
                placeholder="Like Dual tone"
                runat="server" MaxLength="12"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldBackFlash"
                runat="server" ErrorMessage="Product Back Flash Information is Required"
                ControlToValidate="txtAdminProductUploadProductBackflash"></asp:RequiredFieldValidator><br />
            <%--Processor--%>
            <asp:Label ID="lbAdminProductUploadProductprocessor" CssClass="lbproductUploadProcessor"
                runat="server"
                Text="Enter Processor:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductprocessor" CssClass="txtproductUploadprocessor"
                placeholder="Like Snapdragon 835"
                runat="server" MaxLength="15"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldProcessor"
                runat="server" ErrorMessage="Product Processor Information is Required"
                ControlToValidate="txtAdminProductUploadProductprocessor"></asp:RequiredFieldValidator><br />
            <%--Main Image--%>
            <asp:Label ID="lbAdminProductUploadProductMainImage" CssClass="lbproductUploadMainImage"
                runat="server"
                Text="Select Main Image for Product"></asp:Label>
            <asp:FileUpload ID="uploadAdminProductUploadProductMainImage" CssClass="productuploadfileuploadMainimg"
                runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainImage" runat="server" ErrorMessage="Image is Required" CssClass="adminProductUploadValidation " ControlToValidate="uploadAdminProductUploadProductMainImage"
                Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorMainImage" runat="server"
                ControlToValidate="uploadAdminProductUploadProductMainImage" Display="Dynamic"
                CssClass="adminProductUploadValidation " ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"
                ErrorMessage="Please remove special character from filename"></asp:RegularExpressionValidator><br />
            <br />
            <%--First Image--%>
            <asp:Label ID="lbAdminProductUploadProductfirstImage" CssClass="lbproductUploadFirstImage"
                runat="server" Text="Select First Image for Product"></asp:Label>
            <asp:FileUpload CssClass="productuploadfileuploadfirstimg" ID="uploadAdminProductUploadProductFirstImage"
                runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstImage" runat="server" ErrorMessage="Image is Required" CssClass="adminProductUploadValidation " ControlToValidate="uploadAdminProductUploadProductFirstImage"
                Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorFirstImage"
                runat="server" Display="Dynamic" ControlToValidate="uploadAdminProductUploadProductFirstImage"
                ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$" CssClass="adminProductUploadValidation "
                ErrorMessage="Please remove special character from filename"></asp:RegularExpressionValidator>
             <br />
            <br />
            <%--Second Image--%>
            <asp:Label ID="lbAdminProductUploadProductSecondImage" CssClass="lbproductUploadSecondImage"
                runat="server" Text="Select Second Image for Product"></asp:Label>
            <asp:FileUpload CssClass="productuploadfileuploadSecondimg" ID="uploadAdminProductUploadProductSecondImage"
                runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSecondImage" runat="server" ErrorMessage="Image is Required" CssClass="adminProductUploadValidation " ControlToValidate="uploadAdminProductUploadProductSecondImage"
                Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"
                ControlToValidate="uploadAdminProductUploadProductSecondImage" Display="Dynamic" CssClass="adminProductUploadValidation "
                ErrorMessage="Please remove special character from filename"></asp:RegularExpressionValidator>
          <br />
            <br />
            <%--third Image--%>
            <asp:Label ID="lbAdminProductUploadProductThirdImage" CssClass="lbproductUploadThirdImage "
                runat="server" Text="Select Third Image for Product"></asp:Label>
            <asp:FileUpload CssClass="productuploadfileuploadthirdimg" ID="uploadAdminProductUploadProductThirdImage"
                runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorThirdImage" runat="server" ErrorMessage="Image is Required" CssClass="adminProductUploadValidation " ControlToValidate="uploadAdminProductUploadProductThirdImage"
                Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="uploadAdminProductUploadProductThirdImage" CssClass="adminProductUploadValidation "
                Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"
                ErrorMessage="Please remove special character from filename"></asp:RegularExpressionValidator>
           <br />
            <br />
            <br />
            <%--Color--%>
            <asp:Label ID="lbAdminProductUploadProductColor" CssClass="lbproductUploadcolor" runat="server"
                Text="Select Mobile Color:"></asp:Label>
            <asp:DropDownList ID="drpAdminProductUploadProductColor" CssClass="dropproductUploadcolor" runat="server">
                <asp:ListItem Text="Please Select Color" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Black" Value="Black"></asp:ListItem>
                <asp:ListItem Text="White" Value="White"></asp:ListItem>
                <asp:ListItem Text="Silver" Value="Silver"></asp:ListItem>
                <asp:ListItem Text="Red" Value="Red"></asp:ListItem>
                <asp:ListItem Text="Golden" Value="Golden"></asp:ListItem>
                <asp:ListItem Text="Orange" Value="Orange"></asp:ListItem>
                <asp:ListItem Text="Blue" Value="Blue"></asp:ListItem>
                <asp:ListItem Text="Gray" Value="Gray"></asp:ListItem>
            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldColor" runat="server"
                ErrorMessage="Please Select Color" ControlToValidate="drpAdminProductUploadProductColor"
                InitialValue="-1" CssClass="adminProductUploadValidation"></asp:RequiredFieldValidator><br />
            <%--GPU--%>
            <asp:Label ID="lbAdminProductUploadProductGPU" CssClass="lbproductUploadGPU" runat="server"
                Text="Enter GPU Name:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductGPU" CssClass="txtproductUploadGPU" placeholder="Like Adreno 430"
                MaxLength="10"
                runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldGpu"
                runat="server" ErrorMessage="Product GPU Information is Required"
                ControlToValidate="txtAdminProductUploadProductGPU"></asp:RequiredFieldValidator><br />
            <%--Price--%>
            <asp:Label ID="lbAdminProductUploadProductPrice" CssClass="lbproductUploadprice" runat="server"
                Text="Enter Price:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductPrice" CssClass="txtproductUploadPrice" placeholder="Like 10000"
                runat="server" MaxLength="8"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldPrice"
                runat="server" ErrorMessage="Product Price Information is Required"
                ControlToValidate="txtAdminProductUploadProductPrice"></asp:RequiredFieldValidator><br />
            <%--Qunatity--%>
            <asp:Label ID="lbAdminProductUploadProductQty" CssClass="lbproductUploadQTY" runat="server"
                Text="Enter Product Quantity:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductQty" CssClass="txtproductUploadQty" placeholder="Like 10000"
                MaxLength="8"
                runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="adminProductUploadValidation" ID="RequiredFieldQty"
                runat="server" ErrorMessage="Product Qunatity Information is Required"
                ControlToValidate="txtAdminProductUploadProductQty"></asp:RequiredFieldValidator><br />
            <%--Operating Frequncy--%>
            <asp:Label ID="lbAdminProductUploadProductOperatingFreq" CssClass="lbproductUploadOpertefreq"
                runat="server" Text="Enter Product Operating Frequncy:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductOperatingFreq" MaxLength="40" TextMode="MultiLine"
                placeholder="Like 800MgZ-1500GhZ" CssClass="txtproductUploadoperateFreq"
                runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldOPfrenq" CssClass="adminProductUploadValidation"
                Display="Dynamic" runat="server" ErrorMessage="Product Frequancy Information is Required"
                ControlToValidate="txtAdminProductUploadProductOperatingFreq"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                ID="RegularExpressionOpearefreq" runat="server" ErrorMessage="Input Limit Exceeded"
                Display="Dynamic" ControlToValidate="txtAdminProductUploadProductOperatingFreq"
                CssClass="adminProductUploadValidation "
                ValidationExpression="^[0-9a-zA-z \ \-]{0,40}"></asp:RegularExpressionValidator><br />
            <%--Internal Storage--%>
            <asp:Label ID="lbAdminProductUploadProductInternalStorage" CssClass="lbproductUploadinternal"
                runat="server" Text="Enter Product Internal Storage:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductInternalStorage" CssClass="txtproductUploadInternal"
                MaxLength="5"
                placeholder="Like 16GB"
                runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldInternalStorage"
                    runat="server" ErrorMessage="Product Internal Storage Information is Required"
                    ControlToValidate="txtAdminProductUploadProductInternalStorage" CssClass="adminProductUploadValidation"></asp:RequiredFieldValidator><br />
            <%--External Storage--%>
            <asp:Label ID="lbAdminProductUploadProductExternalStorage" CssClass="lbproductUploadExternal"
                runat="server" Text="Enter Product External Storage:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductExternalStorage" CssClass="txtproductUploadExternal"
                MaxLength="5"
                placeholder="Like 64GB"
                runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldExternalStorage"
                    runat="server" ErrorMessage="Product External Storage Information is Required"
                    CssClass="adminProductUploadValidation" ControlToValidate="txtAdminProductUploadProductExternalStorage"></asp:RequiredFieldValidator><br />
            <%-- Ram --%>
            <asp:Label ID="lbAdminProductUploadProductRAM" CssClass="lbproductUploadRam"
                runat="server" Text="Enter Product RAM:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductRAM" CssClass="txtproductUploadRam"
                MaxLength="5"
                placeholder="Like 2GB"
                runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldRAM"
                    CssClass="adminProductUploadValidation" runat="server" ErrorMessage="Product RAM Information is Required"
                    ControlToValidate="txtAdminProductUploadProductRAM"></asp:RequiredFieldValidator><br />
            <%--Dimention--%>
            <asp:Label ID="lbAdminProductUploadProductDimention" 
                CssClass="lbproductUploadDimention"
                runat="server"
                Text="Enter Product Dimention:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductDimention" CssClass="txtproductUploadDimention"
                MaxLength="40"
                placeholder="Like 7.1x1x15.3CM" TextMode="MultiLine"
                runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldDimention"
                runat="server" ErrorMessage="Product Dimention Information is Required"
                CssClass="adminProductUploadValidation" Display="Dynamic" ControlToValidate="txtAdminProductUploadProductDimention"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
                ID="RegularExpressionDimention" runat="server" ErrorMessage="Input Limit Exceeded"
                Display="Dynamic" ControlToValidate="txtAdminProductUploadProductDimention" CssClass="adminProductUploadValidation "
                ValidationExpression="^[\sA-Za-z0-9.]{0,100}$"></asp:RegularExpressionValidator><br />
            <%--Warrentity Status--%>
            <asp:Label ID="lbproductWarrenty" CssClass="lbproductUploadWarrenty"
                runat="server"
                Text="Enter Product Warrenty Status:"></asp:Label>
            <asp:TextBox ID="txtAdminProductUploadProductWarrenty" CssClass="txtproductUploadWarrenty"
                placeholder="Like 1 year manufacturing warranty" TextMode="MultiLine"
                runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldWarrenty"
                    CssClass="adminProductUploadValidation" runat="server" ErrorMessage="Product Warrenty Information is Required"
                    Display="Dynamic"
                    ControlToValidate="txtAdminProductUploadProductWarrenty"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionWarranty" runat="server" ErrorMessage="Input Limit Exceeded"
                        Display="Dynamic" ControlToValidate="txtAdminProductUploadProductWarrenty" CssClass="adminProductUploadValidation "
                        ValidationExpression="^[\sA-Za-z0-9]{0,100}$"></asp:RegularExpressionValidator><br />
            <asp:Button ID="btAdminProductUploadProductUpload" CssClass="btproductUploadlogin" runat="server"
                Text="Upload" />
            <asp:Button
                ID="btAdminProductUploadProductCancel" CssClass="btproductUploadcancel" runat="server"
                Text="Cancel" CausesValidation="False" /><br />
            <br />
            <asp:Label ID="Lbmsg" Visible="false" CssClass="lbproductUploadmsg" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>

