Imports System.Data.SqlClient
Imports System.Data
Partial Class User_ProductList
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub emptyornot()
        If ListViewProducts.Items.Count = 0 Then
            ListViewProducts.Visible = False
            LbEmptyMessage.Visible = True
            LbEmptyMessage.Text = "No Record Found."
        Else
            ListViewProducts.Visible = True
            LbEmptyMessage.Visible = False
            LbEmptyMessage.Text = "No Record Found."
        End If
    End Sub
    Protected Sub RadioButtonListPriceProductList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonListPriceProductList.SelectedIndexChanged

        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 5000-10000.
        If RadioButtonListPriceProductList.SelectedIndex = 1 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price>=5000 and price<=9999 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            emptyornot()
            con.Close()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS UNDER 5000
        If RadioButtonListPriceProductList.SelectedIndex = 0 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=4999 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            emptyornot()
            con.Close()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 10000-25000.
        If RadioButtonListPriceProductList.SelectedIndex = 2 Then
            cmd = New SqlCommand("SELECT distinct[pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=24999 AND price>=10000 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 25000-50000.
        If RadioButtonListPriceProductList.SelectedIndex = 3 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=49999 AND price>=25000 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 50000-75000.
        If RadioButtonListPriceProductList.SelectedIndex = 4 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=74999 AND price>=50000 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 75000-100000.
        If RadioButtonListPriceProductList.SelectedIndex = 5 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=100000 AND price>=750000 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS ABOVE 100000.
        If RadioButtonListPriceProductList.SelectedIndex = 6 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price>=100000 ", con)
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
    End Sub
    Protected Sub dropbrandProdutListBrand_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropbrandProdutListBrand.SelectedIndexChanged
        dropbrandProdutListplatform.SelectedIndex = -1
        'FOR SEARCH PRODUCT WHO'S BRAND NAME IS .

        cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE brand=@brand ", con)
        cmd.Parameters.AddWithValue("@brand", dropbrandProdutListBrand.SelectedValue)
        con.Open()
        cmd.ExecuteNonQuery()
        ad = New SqlDataAdapter(cmd)
        ad.Fill(ds)
        ListViewProducts.DataSource = ds
        ListViewProducts.DataSourceID = ""
        ListViewProducts.DataBind()
        con.Close()

    End Sub
    Protected Sub dropbrandProdutListplatform_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropbrandProdutListplatform.SelectedIndexChanged

        dropbrandProdutListBrand.SelectedIndex = -1

        'FOR SEARCH PRODUCT WHO'S BRAND NAME IS .

        cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE plat_form=@plat_form ", con)
        cmd.Parameters.AddWithValue("@plat_form", dropbrandProdutListplatform.SelectedValue)
        con.Open()
        cmd.ExecuteNonQuery()
        ad = New SqlDataAdapter(cmd)
        ad.Fill(ds)
        ListViewProducts.DataSource = ds
        ListViewProducts.DataSourceID = ""
        ListViewProducts.DataBind()
        con.Close()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.Cookies("User-data") IsNot Nothing Then
            getproductcount()
            getregisterId()

        Else
            ' Response.Redirect("~/User/Login.aspx")
        End If
    End Sub
    'COMMON FUNCTION FOR THE WHOLE PROJECT TO DITTERMINE HOW MANY PRODUCT AVAILABLE IN CART
    Protected Sub getproductcount()
        'GET MASTER PAGE CONTROL ID FOR CART COUNTING LABEL.
        Dim lb As Label = Master.FindControl("lbCartCount")
        cmd = New SqlCommand("SELECT count(cartId) from cart", con)
        con.Open()
        Dim totalproduct As Integer = cmd.ExecuteScalar
        con.Close()
        If totalproduct = 0 Then
            lb.Text = 0
        Else
            lb.Text = totalproduct
        End If
    End Sub


    Protected Sub getregisterId()
        cmd = New SqlCommand("select registerId from RegistrationMaster where username=@username", con)
        cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
        con.Open()
        Dim registerid As Integer = cmd.ExecuteScalar()
        Session("id") = registerid
        con.Close()
    End Sub



    Protected Sub ListViewProducts_PagePropertiesChanged(sender As Object, e As EventArgs) Handles ListViewProducts.PagePropertiesChanged
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 5000-10000.
        If RadioButtonListPriceProductList.SelectedIndex = 1 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price>=5000 and price<=9999 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            emptyornot()
            con.Close()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS UNDER 5000
        If RadioButtonListPriceProductList.SelectedIndex = 0 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=4999 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            emptyornot()
            con.Close()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 10000-25000.
        If RadioButtonListPriceProductList.SelectedIndex = 2 Then
            cmd = New SqlCommand("SELECT distinct[pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=24999 AND price>=10000 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 25000-50000.
        If RadioButtonListPriceProductList.SelectedIndex = 3 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=49999 AND price>=25000 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 50000-75000.
        If RadioButtonListPriceProductList.SelectedIndex = 4 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=74999 AND price>=50000 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS BETWEEN 75000-100000.
        If RadioButtonListPriceProductList.SelectedIndex = 5 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price<=100000 AND price>=750000 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
        'FOR SEARCH PRODUCT WHO'S PRICE IS ABOVE 100000.
        If RadioButtonListPriceProductList.SelectedIndex = 6 Then
            cmd = New SqlCommand("SELECT [pid],[pname], [brand], [osversion], [plat_form], [MImage], [color], [price] FROM [products] WHERE price>=100000 ", con)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            con.Open()
            cmd.ExecuteNonQuery()
            ad = New SqlDataAdapter(cmd)
            ad.Fill(ds)
            ListViewProducts.DataSource = ds
            ListViewProducts.DataSourceID = ""
            ListViewProducts.DataBind()
            con.Close()
            emptyornot()

        End If
    End Sub

    Protected Sub ListViewProducts_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListViewProducts.ItemCommand

        'redirect to user selected product
        If e.CommandName = "View" Then
            Response.Redirect("~/User/ProductDetail.aspx?id=" + e.CommandArgument.ToString)
        End If

    End Sub
End Class
