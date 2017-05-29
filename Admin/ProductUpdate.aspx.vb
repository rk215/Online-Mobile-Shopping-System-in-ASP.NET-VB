Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_ProductUpdate
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            invisible()
        End If
    End Sub
    Protected Sub invisible()
        fileAdminProductUpdateProductfirstImage.Visible = False
        fileAdminProductUpdateProductMainImage.Visible = False
        fileAdminProductUpdateProductSecondImage.Visible = False
        fileAdminProductUpdateProductThirdImage.Visible = False
        txtAdminProductUploadProductBackCamera.Visible = False
        txtAdminProductUploadProductBackflash.Visible = False
        txtAdminProductUploadProductBattery.Visible = False
        txtAdminProductUploadProductbrandName.Visible = False
        txtAdminProductUploadProductDimention.Visible = False
        txtAdminProductUploadProductExternalStorage.Visible = False
        txtAdminProductUploadProductFrontCamera.Visible = False
        txtAdminProductUploadProductGPU.Visible = False
        txtAdminProductUploadProductInternalStorage.Visible = False
        txtAdminProductUploadProductModelNumber.Visible = False
        txtAdminProductUploadProductName.Visible = False
        txtAdminProductUploadProductOperatingFreq.Visible = False
        txtAdminProductUploadProductOsVersion.Visible = False
        txtAdminProductUploadProductPrice.Visible = False
        txtAdminProductUploadProductprocessor.Visible = False
        txtAdminProductUploadProductQty.Visible = False
        txtAdminProductUploadProductRAM.Visible = False
        txtAdminProductUploadProductScreen.Visible = False
        txtAdminProductUploadProductSensor.Visible = False
        txtAdminProductUploadProductWarrenty.Visible = False

        'invisible labels.
        lbAdminProductUpdateProducttype.Visible = False
        lbAdminProductUpdateProductSimType.Visible = False
        lbAdminProductUpdateProductplatform.Visible = False
        lbAdminProductUpdateProductNetwork.Visible = False
        lbAdminProductUpdateProductfirstImage.Visible = False
        lbAdminProductUpdateProductMainImage.Visible = False
        lbAdminProductUpdateProductSecondImage.Visible = False
        lbAdminProductUpdateProductThirdImage.Visible = False
        lbAdminProductUpdateProductColor.Visible = False
        lbAdminProductUploadProductBackCamera.Visible = False
        lbAdminProductUploadProductBackflash.Visible = False
        lbAdminProductUploadProductBattery.Visible = False
        lbAdminProductUpdateProductbrandName.Visible = False
        lbAdminProductUploadProductDimention.Visible = False
        lbAdminProductUploadProductExternalStorage.Visible = False
        lbAdminProductUploadProductFrontCamera.Visible = False
        lbAdminProductUploadProductGPU.Visible = False
        lbAdminProductUploadProductInternalStorage.Visible = False
        lbAdminProductUploadProductModelNumber.Visible = False
        lbAdminProductUploadProductName.Visible = False
        lbAdminProductUploadProductOperatingFreq.Visible = False
        lbAdminProductUploadProductOsVersion.Visible = False
        lbAdminProductUploadProductPrice.Visible = False
        lbAdminProductUploadProductprocessor.Visible = False
        lbAdminProductUploadProductQty.Visible = False
        lbAdminProductUploadProductRAM.Visible = False
        lbAdminProductUploadProductScreen.Visible = False
        lbAdminProductUploadProductSensor.Visible = False
        lbAdminProductUploadProductWarrenty.Visible = False

        'hide upload controls.
        imgAdminProductUpdateProductfirstImage.Visible = False
        imgAdminProductUpdateProductMainImage.Visible = False
        imgAdminProductUpdateProductSecondImage.Visible = False
        imgAdminProductUpdateProductThirdImage.Visible = False
        'hide drop controls.

        drpAdminProductUploadProductColor.Visible = False
        drpAdminProductUploadProductNetwork.Visible = False
        drpAdminProductUploadProductplatform.Visible = False
        drpAdminProductUploadProductSimType.Visible = False
        drpAdminProductUploadProducttype.Visible = False

        'hide buttons.
        btadminProductUpdate.Visible = False

        btAdminProductUpdateCancel.Visible = False

    End Sub
    Protected Sub visibles()
        fileAdminProductUpdateProductfirstImage.Visible = True
        fileAdminProductUpdateProductMainImage.Visible = True
        fileAdminProductUpdateProductSecondImage.Visible = True
        fileAdminProductUpdateProductThirdImage.Visible = True
        txtAdminProductUploadProductBackCamera.Visible = True
        txtAdminProductUploadProductBackflash.Visible = True
        txtAdminProductUploadProductBattery.Visible = True
        txtAdminProductUploadProductbrandName.Visible = True
        txtAdminProductUploadProductDimention.Visible = True
        txtAdminProductUploadProductExternalStorage.Visible = True
        txtAdminProductUploadProductFrontCamera.Visible = True
        txtAdminProductUploadProductGPU.Visible = True
        txtAdminProductUploadProductInternalStorage.Visible = True
        txtAdminProductUploadProductModelNumber.Visible = True
        txtAdminProductUploadProductName.Visible = True
        txtAdminProductUploadProductOperatingFreq.Visible = True
        txtAdminProductUploadProductOsVersion.Visible = True
        txtAdminProductUploadProductPrice.Visible = True
        txtAdminProductUploadProductprocessor.Visible = True
        txtAdminProductUploadProductQty.Visible = True
        txtAdminProductUploadProductRAM.Visible = True
        txtAdminProductUploadProductScreen.Visible = True
        txtAdminProductUploadProductSensor.Visible = True
        txtAdminProductUploadProductWarrenty.Visible = True

        ''Show labels.
        lbAdminProductUpdateProducttype.Visible = True
        lbAdminProductUpdateProductSimType.Visible = True
        lbAdminProductUpdateProductplatform.Visible = True
        lbAdminProductUpdateProductNetwork.Visible = True
        lbAdminProductUpdateProductfirstImage.Visible = True
        lbAdminProductUpdateProductMainImage.Visible = True
        lbAdminProductUpdateProductSecondImage.Visible = True
        lbAdminProductUpdateProductThirdImage.Visible = True
        lbAdminProductUpdateProductColor.Visible = True
        lbAdminProductUploadProductBackCamera.Visible = True
        lbAdminProductUploadProductBackflash.Visible = True
        lbAdminProductUploadProductBattery.Visible = True
        lbAdminProductUpdateProductbrandName.Visible = True
        lbAdminProductUploadProductDimention.Visible = True
        lbAdminProductUploadProductExternalStorage.Visible = True
        lbAdminProductUploadProductFrontCamera.Visible = True
        lbAdminProductUploadProductGPU.Visible = True
        lbAdminProductUploadProductInternalStorage.Visible = True
        lbAdminProductUploadProductModelNumber.Visible = True
        lbAdminProductUploadProductName.Visible = True
        lbAdminProductUploadProductOperatingFreq.Visible = True
        lbAdminProductUploadProductOsVersion.Visible = True
        lbAdminProductUploadProductPrice.Visible = True
        lbAdminProductUploadProductprocessor.Visible = True
        lbAdminProductUploadProductQty.Visible = True
        lbAdminProductUploadProductRAM.Visible = True
        lbAdminProductUploadProductScreen.Visible = True
        lbAdminProductUploadProductSensor.Visible = True
        lbAdminProductUploadProductWarrenty.Visible = True

        ''Show upload controls.
        imgAdminProductUpdateProductfirstImage.Visible = True
        imgAdminProductUpdateProductMainImage.Visible = True
        imgAdminProductUpdateProductSecondImage.Visible = True
        imgAdminProductUpdateProductThirdImage.Visible = True
        ''Show  drop controls.

        drpAdminProductUploadProductColor.Visible = True
        drpAdminProductUploadProductNetwork.Visible = True
        drpAdminProductUploadProductplatform.Visible = True
        drpAdminProductUploadProductSimType.Visible = True
        drpAdminProductUploadProducttype.Visible = True

        'Show buttons.

        btadminProductUpdate.Visible = True
        btAdminProductUpdateCancel.Visible = True

    End Sub
    Protected Sub btAdminProductUpdateCancel_Click(sender As Object, e As EventArgs) Handles btAdminProductUpdateCancel.Click
        'REDIRECT TO ADMIN HOME PAGE.
        Response.Redirect("~/Admin/AdminHome.aspx")

    End Sub
    Protected Sub btAdminProductUpdateSearch_Click(sender As Object, e As EventArgs) Handles btAdminProductUpdateSearch.Click
        If txtAdminProductUpdateSearch.Text = "" Then
            LBStatus.Text = "Please enter Product ID"
        Else
            'SEARCH PRODUCT CODE.
            cmd = New SqlCommand("select * from products where pid=@pid", con)
            cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            Using dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows Then
                    LBStatus.Text = ""
                    dr.Read()
                    txtAdminProductUploadProductbrandName.Text = dr("brand").ToString
                    txtAdminProductUploadProductName.Text = dr("pname").ToString
                    drpAdminProductUploadProducttype.SelectedItem.Text = dr("ptype").ToString
                    txtAdminProductUploadProductBattery.Text = dr("battery").ToString
                    drpAdminProductUploadProductSimType.SelectedItem.Text = dr("simtype").ToString
                    txtAdminProductUploadProductBackCamera.Text = dr("Bcamera").ToString
                    txtAdminProductUploadProductFrontCamera.Text = dr("Fcamera").ToString
                    txtAdminProductUploadProductOsVersion.Text = dr("osversion").ToString
                    drpAdminProductUploadProductplatform.SelectedItem.Text = dr("plat_form").ToString
                    txtAdminProductUploadProductModelNumber.Text = dr("modelNo").ToString
                    txtAdminProductUploadProductScreen.Text = dr("screen").ToString
                    drpAdminProductUploadProductNetwork.SelectedItem.Text = dr("network").ToString
                    txtAdminProductUploadProductSensor.Text = dr("sensor").ToString
                    txtAdminProductUploadProductBackflash.Text = dr("Bflash").ToString
                    txtAdminProductUploadProductprocessor.Text = dr("processor").ToString
                    imgAdminProductUpdateProductMainImage.ImageUrl = "~/" + dr("MImage").ToString
                    imgAdminProductUpdateProductfirstImage.ImageUrl = "~/" + dr("FirstImage").ToString
                    imgAdminProductUpdateProductSecondImage.ImageUrl = "~/" + dr("SecondImage").ToString
                    imgAdminProductUpdateProductThirdImage.ImageUrl = "~/" + dr("ThirdImage").ToString
                    drpAdminProductUploadProductColor.SelectedItem.Text = dr("color").ToString
                    txtAdminProductUploadProductRAM.Text = dr("Ram").ToString
                    txtAdminProductUploadProductGPU.Text = dr("Gpu").ToString
                    txtAdminProductUploadProductPrice.Text = dr("price").ToString
                    txtAdminProductUploadProductQty.Text = dr("qty").ToString
                    txtAdminProductUploadProductOperatingFreq.Text = dr("operatingFrequency").ToString
                    txtAdminProductUploadProductInternalStorage.Text = dr("InternalStroge").ToString
                    txtAdminProductUploadProductExternalStorage.Text = dr("ExpandStorage").ToString
                    txtAdminProductUploadProductDimention.Text = dr("Dimension").ToString
                    txtAdminProductUploadProductWarrenty.Text = dr("warranty").ToString
                    visibles()
                Else
                    LBStatus.Text = "Record Not found"
                    invisible()
                End If
            End Using
        End If

    End Sub
    Protected Sub btadminProductUpdate_Click(sender As Object, e As EventArgs) Handles btadminProductUpdate.Click

        'CODE FOR PRODUCT UPDATE.

        cmd = New SqlCommand("update products set  pname=@pname, ptype=@ptype, brand" + "=@brand,battery=@battery,simtype=@simtype," +
"Fcamera=@Fcamera,Bcamera=@Bcamera,osversion=@osversion,plat_form=@plat_form," +
"modelNo=@modelNo,screen=@screen,network=@network,sensor=@sensor,Bflash=@Bflash," +
"processor=@processor,color=@color,Ram=@Ram,Gpu=" +
"@Gpu,price=@price,qty=@qty," +
"operatingFrequency=@operatingFrequency,InternalStroge=@InternalStroge," +
"ExpandStorage=@ExpandStorage, Dimension=@Dimension,warranty=@warranty where pid=@pid", con)

        cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
        cmd.Parameters.AddWithValue("@pname", txtAdminProductUploadProductName.Text)
        cmd.Parameters.AddWithValue("@ptype", drpAdminProductUploadProducttype.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@brand", txtAdminProductUploadProductbrandName.Text)
        cmd.Parameters.AddWithValue("@battery", txtAdminProductUploadProductBattery.Text)
        cmd.Parameters.AddWithValue("@simtype", drpAdminProductUploadProductSimType.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@Fcamera", txtAdminProductUploadProductFrontCamera.Text)
        cmd.Parameters.AddWithValue("@Bcamera", txtAdminProductUploadProductBackCamera.Text)
        cmd.Parameters.AddWithValue("@osversion", txtAdminProductUploadProductOsVersion.Text)
        cmd.Parameters.AddWithValue("@plat_form", drpAdminProductUploadProductplatform.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@modelNo", txtAdminProductUploadProductModelNumber.Text)
        cmd.Parameters.AddWithValue("@screen", txtAdminProductUploadProductScreen.Text)
        cmd.Parameters.AddWithValue("@network", drpAdminProductUploadProductNetwork.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@sensor", txtAdminProductUploadProductSensor.Text)
        cmd.Parameters.AddWithValue("@Bflash", txtAdminProductUploadProductBackflash.Text)
        cmd.Parameters.AddWithValue("@processor", txtAdminProductUploadProductprocessor.Text)
        cmd.Parameters.AddWithValue("@color", drpAdminProductUploadProductColor.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@Ram", txtAdminProductUploadProductRAM.Text)
        cmd.Parameters.AddWithValue("@Gpu", txtAdminProductUploadProductGPU.Text)
        cmd.Parameters.AddWithValue("@price", txtAdminProductUploadProductPrice.Text)
        cmd.Parameters.AddWithValue("@qty", txtAdminProductUploadProductQty.Text)
        cmd.Parameters.AddWithValue("@operatingFrequency", txtAdminProductUploadProductOperatingFreq.Text)
        cmd.Parameters.AddWithValue("@InternalStroge", txtAdminProductUploadProductInternalStorage.Text)
        cmd.Parameters.AddWithValue("@ExpandStorage", txtAdminProductUploadProductExternalStorage.Text)
        cmd.Parameters.AddWithValue("@Dimension", txtAdminProductUploadProductDimention.Text)
        cmd.Parameters.AddWithValue("@warranty", txtAdminProductUploadProductWarrenty.Text)
        updateimages()
        con.Open()
        cmd.ExecuteNonQuery()
        lbMsgStatus.Text = "Product Infomation is Successfully Updated.."
        Response.Redirect("~/Admin/ProductUpdate.aspx")
        con.Close()
    End Sub
    Protected Sub updateimages()
        Dim mpath, mstore, fpath, spath, tpath, fstore, sstore, tstore As String
        'FOR UPDATING IMAGE .
        If fileAdminProductUpdateProductMainImage.HasFile Then
            'FOR UPDATE MAIN IMAGE
            mpath = Server.MapPath("~/MainUploadImages/")
            mstore = "MainUploadImages/" + fileAdminProductUpdateProductMainImage.FileName
            mpath = mpath + fileAdminProductUpdateProductMainImage.FileName
            fileAdminProductUpdateProductMainImage.SaveAs(mpath)
            cmd = New SqlCommand("update products set MImage=@MImage where pid=@pid", con)
            cmd.Parameters.AddWithValue("@MImage", mstore)
            cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If
        'FOR UPDATE FIRST IMAGE.
        If fileAdminProductUpdateProductfirstImage.HasFile Then

            fpath = Server.MapPath("~/FirstUploadImages/")
            fstore = "FirstUploadImages/" + fileAdminProductUpdateProductfirstImage.FileName
            fpath = fpath + fileAdminProductUpdateProductfirstImage.FileName
            fileAdminProductUpdateProductfirstImage.SaveAs(fpath)
            cmd = New SqlCommand("update products set FirstImage=@FirstImage where pid=@pid", con)
            cmd.Parameters.AddWithValue("@FirstImage", fstore)
            cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If
        'FOR UPDATE SECOND IMAGE.
        If fileAdminProductUpdateProductSecondImage.HasFile Then

            spath = Server.MapPath("~/SecondUploadImages/")
            sstore = "SecondUploadImages/" + fileAdminProductUpdateProductSecondImage.FileName
            spath = spath + fileAdminProductUpdateProductSecondImage.FileName
            fileAdminProductUpdateProductSecondImage.SaveAs(spath)
            cmd = New SqlCommand("update products set SecondImage=@SecondImage where pid=@pid", con)
            cmd.Parameters.AddWithValue("@SecondImage", sstore)
            cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If
        'FOR UPDATE Third IMAGE.
        If fileAdminProductUpdateProductThirdImage.HasFile Then

            tpath = Server.MapPath("~/ThirdUploadImages/")
            tstore = "ThirdUploadImages/" + fileAdminProductUpdateProductThirdImage.FileName
            tpath = tpath + fileAdminProductUpdateProductThirdImage.FileName
            fileAdminProductUpdateProductThirdImage.SaveAs(tpath)
            cmd = New SqlCommand("update products set ThirdImage=@ThirdImage where pid=@pid", con)
            cmd.Parameters.AddWithValue("@ThirdImage", tstore)
            cmd.Parameters.AddWithValue("@pid", txtAdminProductUpdateSearch.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End If
    End Sub

End Class
