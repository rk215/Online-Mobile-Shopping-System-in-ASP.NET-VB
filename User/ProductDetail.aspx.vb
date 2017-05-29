Imports System.Data.SqlClient
Imports System.Data
Partial Class User_ProductDetail
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub Repeater2_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater2.ItemCommand
        Dim mainimg As Image = DirectCast(e.Item.FindControl("ImageMain"), Image)

        'thumbnail image repeater
        'FOR FINDING FIRST IMAGE
        If e.CommandName.Equals("mainImage") Then
            Dim item As RepeaterItem = Repeater2.Items(e.Item.ItemIndex)
            Dim imgbtn As ImageButton = item.FindControl("ImageButton1")
            mainimg.ImageUrl = imgbtn.ImageUrl

        End If
        If e.CommandName.Equals("firtImage") Then
            Dim item As RepeaterItem = Repeater2.Items(e.Item.ItemIndex)
            Dim imgbtn As ImageButton = item.FindControl("ImageButton2")
            mainimg.ImageUrl = imgbtn.ImageUrl

        End If
        If e.CommandName.Equals("SecondImage") Then
            Dim item As RepeaterItem = Repeater2.Items(e.Item.ItemIndex)
            Dim imgbtn As ImageButton = item.FindControl("ImageButton3")
            mainimg.ImageUrl = imgbtn.ImageUrl

        End If
        If e.CommandName.Equals("ThirdImage") Then
            Dim item As RepeaterItem = Repeater2.Items(e.Item.ItemIndex)
            Dim imgbtn As ImageButton = item.FindControl("ImageButton4")
            mainimg.ImageUrl = imgbtn.ImageUrl

        End If

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'CHECK USER IS LOGGED IN OR NOT.
        If Request.Cookies("User-data") IsNot Nothing Then
            'MEANS USER NOT LOGGED IN SO WE DON'T WANT TO DISPLAY  CART DETAILS TO ANONYMOUSE USER. SO GO TO DATABASE AND COUNT THE PRODUCT AVAILABEL IN CART.
            'WHICH ALWAYS RETURN 0 .BECAUSE WE INTEGRET PK-FK RELATION TO DATABASE TABLE BETWEEN REGISTERMASTER AND CART TABLE.
            getproductcount() 'CALL FUNCTION 
            findqty()
        End If

    End Sub
    Protected Sub getproductcount()
        'GET MASTER PAGE CONTROL ID FOR CART COUNTING LABEL.

        cmd = New SqlCommand("SELECT count(cartId) from cart where  registerId=@register", con)
        cmd.Parameters.AddWithValue("@register", Session("id"))
        con.Open()
        Dim totalproduct As Integer = cmd.ExecuteScalar()
        con.Close()
        Dim lbCartCount As Label = Master.FindControl("lbCartCount")
        lbCartCount.Text = totalproduct

    End Sub
    Protected Sub findqty()
        'FUNCTION FOR SEE WETHER THE PRODUCT HAVE SUFFICEINT QUANTITY OR NOT. 
        cmd = New SqlCommand("select qty from products where pid=@pid", con)
        cmd.Parameters.AddWithValue("@pid", Request.QueryString("id"))
        con.Open()
        Dim i As Integer = cmd.ExecuteScalar()
        Dim pidcart As New HttpCookie("productDetails")
        pidcart("productid") = i
        pidcart.Expires = DateTime.Now.AddDays(30D)
        Response.Cookies.Add(pidcart)

        If Not i >= 1 Then
            Lbqtystatus.Text = "Product Running out of Stock"
            Btbuynow.Visible = False
            Btaddtocart.Visible = False
        Else

            Btbuynow.Visible = True
            Btaddtocart.Visible = True
        End If
    End Sub
    Protected Sub Btbuynow_Click(sender As Object, e As EventArgs) Handles Btbuynow.Click

        'CODE FOR BUYNOW BUTTON.
        'CHECK WETHER USER IS LOGGED IN OR NOT
        If Request.Cookies("User-data") Is Nothing Then
            'MEANS USER NOT LOGGED IN . SO REDIRECT TO LOGIN PAGE.
            Response.Redirect("~/User/Login.aspx")
        Else

            'USER WANT TO BUY THE PRODUCT SO NAVIAGATE TO BELOW PAGE.
            'AND GET REQUIRE INFORMATION FROM USER.
            Session("pid") = Request.QueryString("id")
            Response.Redirect("~/User/ProceedCheckOutProcees.aspx")

        End If


    End Sub
    Protected Sub Btaddtocart_Click(sender As Object, e As EventArgs) Handles Btaddtocart.Click
        'CODE OF ADD TO CART BUTTON


        If Request.Cookies("User-data") IsNot Nothing Then

            'find registerId based on login.
            cmd = New SqlCommand("select registerId from RegistrationMaster where username=@username", con)
            cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Session("pid") = Request.QueryString("id")
            con.Open()
            Dim registerid As Integer = cmd.ExecuteScalar()
            con.Close()
            'CREATE PRODUCT COOKIE BECAUSE WE NEED THE PRODUCT ID IN DIFFRENT PLACES UNTIL USER IS LOGGED IN.
            Dim productcookie As New HttpCookie("products")
            productcookie("registerID") = registerid
            productcookie("productId") = Request.QueryString("id")
            productcookie.Expires = DateTime.Now.AddDays(7D)
            Response.Cookies.Add(productcookie)
            Session("id") = registerid
            For Each item As DataListItem In DataList1.Items

                'CHECK WETHER THE PRODUCT IS ALREADY ADDED TO CART OR NOT.
                cmd = New SqlCommand("select * from cart where pid=@pid", con)
                cmd.Parameters.AddWithValue("@pid", Request.QueryString("id"))
                con.Open()
                Using dr As SqlDataReader = cmd.ExecuteReader
                    If dr.HasRows Then
                        Lbqtystatus.Text = "Already Added to cart"
                    Else
                        con.Close()
                        'FIND REQUIRED CONTROL ID HERE IN OREDER TO ADD PRODUCT TO CART.
                        Dim pname As Label = item.FindControl("brandLabel")
                        Dim mainImage As Image = item.FindControl("ImageMain")
                        Dim price As Label = item.FindControl("priceLabel")
                        cmd = New SqlCommand("insert into cart  (pid,pname,MImage,price,qty,registerId) values(@pid,@pname,@MImage,@price,@qty,@registerId)", con)
                        cmd.Parameters.AddWithValue("@pid", Request.QueryString("id"))
                        cmd.Parameters.AddWithValue("@pname", pname.Text)
                        cmd.Parameters.AddWithValue("@MImage", mainImage.ImageUrl)
                        cmd.Parameters.AddWithValue("@price", price.Text)
                        cmd.Parameters.AddWithValue("@qty", 1)
                        cmd.Parameters.AddWithValue("@registerID", registerid)
                        con.Open()
                        cmd.ExecuteNonQuery()
                        con.Close()
                        'CALL FUNCTION TO KNOW TOTAL PRODUCT IN CART.
                        getproductcount()
                    End If
                End Using
            Next
        Else
            'MEANS USER IS NOT LOGGED IN. SO REDIRECT TO LOGIN PAGE.
            Response.Redirect("~/User/Login.aspx")
        End If

    End Sub
End Class
