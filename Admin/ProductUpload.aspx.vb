Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_ProductUpload
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub btAdminProductUploadProductUpload_Click(sender As Object, e As EventArgs) Handles btAdminProductUploadProductUpload.Click

        'CHECK WETHER VALIDATION DONE SUCCESSFULLY.
        If Page.IsValid Then
            'STORE IMAGE IN THREE DIFFRENT FOLDERS.
            Dim main, storemain, fimage, fstore, simage, sstore, timage, tstore As String
            'FOR  MAIN IMAGE.
            main = Server.MapPath("~/MainUploadImages/")
            storemain = "MainUploadImages/" + uploadAdminProductUploadProductMainImage.FileName 'FOR STORING MAIN IMAGE IN DATABASE.
            main = main + uploadAdminProductUploadProductMainImage.FileName
            uploadAdminProductUploadProductMainImage.SaveAs(main)

            'FOR  FIRST IMAGE.
            fimage = Server.MapPath("~/FirstUploadImages/")
            fstore = "FirstUploadImages/" + uploadAdminProductUploadProductFirstImage.FileName
            fimage = fimage + uploadAdminProductUploadProductFirstImage.FileName
            uploadAdminProductUploadProductFirstImage.SaveAs(fimage)


            'FOR SEOCND IMAGE.
            simage = Server.MapPath("~/SecondUploadImages/")
            sstore = "SecondUploadImages/" + uploadAdminProductUploadProductSecondImage.FileName
            simage = simage + uploadAdminProductUploadProductSecondImage.FileName
            uploadAdminProductUploadProductSecondImage.SaveAs(simage)

            'FOR  THIRD IMAGE.
            timage = Server.MapPath("~/ThirdUploadImages/")
            tstore = "ThirdUploadImages/" + uploadAdminProductUploadProductThirdImage.FileName
            timage = timage + uploadAdminProductUploadProductThirdImage.FileName
            uploadAdminProductUploadProductThirdImage.SaveAs(timage)


            'SIMPLY INSERT THE RECORD TO DATABASE.
            cmd = New SqlCommand("insert into products([pname],[ptype],[brand],[battery],[simtype],[Fcamera],[Bcamera],[osversion],[plat_form],[modelNo],[screen],[network],[sensor],[Bflash],[processor],[MImage],[FirstImage],[SecondImage],[ThirdImage],[color],[Ram],[Gpu],[price],[qty],[operatingFrequency],[InternalStroge],[ExpandStorage],[Dimension],[warranty]) values(@pname,@ptype,@brand,@battery,@simtype,@Fcamera,@Bcamera,@osversion,@plat_form,@modelNo,@screen,@network,@sensor,@Bflash,@processor,@MImage,@FirstImage,@SecondImage,@ThirdImage,@color,@Ram,@Gpu,@price,@qty,@operatingFrequency,@InternalStroge,@ExpandStorage,@Dimension,@warranty)", con)


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
            cmd.Parameters.AddWithValue("@Bflash", txtAdminProductUploadProductBackCamera.Text)
            cmd.Parameters.AddWithValue("@processor", txtAdminProductUploadProductprocessor.Text)
            cmd.Parameters.AddWithValue("@MImage", storemain)
            cmd.Parameters.AddWithValue("@FirstImage", fstore)
            cmd.Parameters.AddWithValue("@SecondImage", sstore)
            cmd.Parameters.AddWithValue("@ThirdImage", tstore)
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

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            Lbmsg.Visible = True
            Lbmsg.Text = "Product Uploaded Successfully......."
            clearcontrols()
        End If
    End Sub
    Protected Sub clearcontrols()

        txtAdminProductUploadProductBackCamera.Text = ""
        txtAdminProductUploadProductFrontCamera.Text = ""
        txtAdminProductUploadProductBackflash.Text = ""
        txtAdminProductUploadProductBattery.Text = ""
        txtAdminProductUploadProductbrandName.Text = ""
        txtAdminProductUploadProductDimention.Text = ""
        txtAdminProductUploadProductExternalStorage.Text = ""
        txtAdminProductUploadProductInternalStorage.Text = ""
        txtAdminProductUploadProductGPU.Text = ""
        txtAdminProductUploadProductModelNumber.Text = ""
        txtAdminProductUploadProductName.Text = ""
        txtAdminProductUploadProductOperatingFreq.Text = ""
        txtAdminProductUploadProductOsVersion.Text = ""
        txtAdminProductUploadProductPrice.Text = ""
        txtAdminProductUploadProductprocessor.Text = ""
        txtAdminProductUploadProductModelNumber.Text = ""
        txtAdminProductUploadProductQty.Text = ""
        txtAdminProductUploadProductRAM.Text = ""
        txtAdminProductUploadProductScreen.Text = ""
        txtAdminProductUploadProductSensor.Text = ""
        txtAdminProductUploadProductWarrenty.Text = ""
    End Sub
    Protected Sub btAdminProductUploadProductCancel_Click(sender As Object, e As EventArgs) Handles btAdminProductUploadProductCancel.Click

        Response.Redirect("~/Admin/AdminHome.aspx")



    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load



    End Sub

End Class
