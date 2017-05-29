Imports System.Data.SqlClient
Imports System.Data
Partial Class User_BuyFromCart
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub View1_Activate(sender As Object, e As EventArgs) Handles View1.Activate
        'CHECK WETHER THE USER IS COPY THE LINK FROM BROWSER OR NOT.
        If Request.Cookies("User-data") Is Nothing Then
            'WE ALWAYS REDIRECT BACK TO LOGIN IF USER DATA(COOKIE) IS LOST.
            Response.Redirect("~/User/Login.aspx")
        Else
            getregisterId()
            'FIND LOGGED-IN USER INFORMATION FROM DATABASE.
            cmd = New SqlCommand("select * from RegistrationMaster where registerId=@id", con)
            con.Open()

            'Session("id")
            'cmd.Parameters.AddWithValue("@id", Request.Cookies("User-data")("Registerid"))
            cmd.Parameters.AddWithValue("@id", Session("id"))
            cmd.ExecuteNonQuery()
            Using dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows Then
                    'DISPLAY USER INFORMATION TO CONTROL OF THIS VIEW.
                    dr.Read() 'read the information from database using above query.
                    TxtFname.Text = dr("firstname").ToString
                    TxtLastName.Text = dr("lastname").ToString
                    TxtEmailID.Text = dr("username").ToString
                    TxtAddress.Text = dr("addres").ToString
                    Txtphone.Text = dr("phoneNumber").ToString
                    TxtState.Text = dr("stat").ToString
                    TxtCity.Text = dr("city").ToString
                    TxtPostalCode.Text = dr("zipcode").ToString
                End If
            End Using
            con.Close()

        End If
    End Sub
    Protected Sub BtNext_Click(sender As Object, e As EventArgs) Handles BtNext.Click
        'FIRST WE DISPLAY USER INFORMATION TO USER.
        'IF USER WANT TO UPDATE HIS/HER DETAILS THEN HE/SHE CAN DO RIGHT TO THE FORM.
        'BUT WHEN SHE/HE PRESS NEXT BUTTON THEN WE WANT TO SAVE ALL CHANGE(IF HE/SHE DO) TO DATABASE.
        cmd = New SqlCommand("update RegistrationMaster " +
         "set [username]=@username,[firstname]=@firstname," +
         "[lastname]=@lastname,[phoneNumber]=@phoneNumber,[addres]=@addres," +
         "[city]=@city,[stat]=@stat,[zipcode]=@zipcode where " +
         "[registerId]=@registerId", con)
        cmd.Parameters.AddWithValue("@registerId", Session("id"))
        cmd.Parameters.AddWithValue("@username", TxtEmailID.Text)
        cmd.Parameters.AddWithValue("@firstname", TxtFname.Text)
        cmd.Parameters.AddWithValue("@phoneNumber", Txtphone.Text)
        cmd.Parameters.AddWithValue("@addres", TxtAddress.Text)
        cmd.Parameters.AddWithValue("@lastname", TxtLastName.Text)
        cmd.Parameters.AddWithValue("@city", TxtCity.Text)
        cmd.Parameters.AddWithValue("@stat", TxtState.Text)
        cmd.Parameters.AddWithValue("@zipcode", TxtPostalCode.Text)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        'REDIRECT TO NEXT PROCESS.
        MultiView1.ActiveViewIndex = 1

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Request.Cookies("User-data") Is Nothing Then
            Response.Redirect("~/User/Login.aspx")
        Else
            getregisterId()
        End If
    End Sub
    Dim dr As SqlDataReader
    Protected Sub getregisterId()
        cmd = New SqlCommand("select registerId from RegistrationMaster where username=@username", con)
        cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
        con.Open()
        Dim registerid As Integer = cmd.ExecuteScalar()
        Session("id") = registerid
        con.Close()
    End Sub
    Dim orderdate As Date
    Dim productid, productqty, productprice, registerid As Integer
    Dim productmainImage, productname, registeremail, registerUsername,
            orderpayment, registershippingadd, productbrand, productmodelNumber, productstatus As String
    Dim ordercon As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim updateqtycon As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim pcon As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim regcon As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Protected Sub Btplaceorder_Click(sender As Object, e As EventArgs) Handles Btplaceorder.Click

        'STRICTLY DON'T CHANGE ANY CODE OF THIS BUTTON.
        Dim pqty As Integer
        If RadioButtonListpayment.SelectedIndex = 0 Then
            'MEANS USER WANT TO PURCHASE VIA CREDIT/DEBTI CARD.
            orderpayment = "Credit/Debit"
        End If
        If RadioButtonListpayment.SelectedIndex = 1 Then
            'MEANS USER WANT TO PURCHASE COD(CASH ON DELIVERY).
            orderpayment = "COD"
        End If

        'GET REGISTER USER'S REGISTERID BY CALLING BELOW FUNCTION.
        getregisterIds()

        cmd = New SqlCommand("select * from cart where registerid=@rid", con)
        cmd.Parameters.AddWithValue("@rid", Session("id"))
        con.Open()
        Using dr As SqlDataReader = cmd.ExecuteReader()
            If dr.HasRows Then
                'LOOP THROUGH ALL RECORD INFORMATION FROM CART TABLE.
                While dr.Read
                    'GET NEXT RECORD INFORMATION FROM CART TABLE.
                    productqty = dr("qty")
                    productprice = dr("price")
                    productmainImage = dr("MImage")
                    productname = dr("pname")
                    productid = dr("pid")


                    'USER DETAILS.


                    cmd = New SqlCommand("select * from RegistrationMaster  where registerId=@regId", regcon)
                    cmd.Parameters.AddWithValue("@regId", Session("id"))
                    regcon.Open()
                    Using regdr As SqlDataReader = cmd.ExecuteReader
                        If regdr.HasRows Then
                            regdr.Read()
                            registerid = Session("id")
                            registershippingadd = regdr("addres").ToString
                            registeremail = regdr("username").ToString
                            registerUsername = regdr("firstname").ToString + regdr("lastname").ToString
                            productstatus = "Pending"
                            regcon.Close()
                        End If
                    End Using
                    cmd = New SqlCommand("select * from products where pid=@pid", pcon)
                    cmd.Parameters.AddWithValue("@pid", productid)
                    pcon.Open()
                    Using pdr As SqlDataReader = cmd.ExecuteReader
                        If pdr.HasRows Then
                            pdr.Read()
                            pqty = pdr("qty")
                            pcon.Close()
                        End If
                    End Using
                    'INSERT ALL RETRIEVE ABOVE INFORMATION TO ORDER TABLE.
                    cmd = New SqlCommand("insert into OrderMaster(pid,qty,price,ProductImage,productName," +
"registerId,shippingAddress,emailId,orderdate,Username,paymentMode,status) " +
"values" + "(@pid,@qty,@price,@image,@name,@registerId,@shippingAddress," +
"@emailId,@orderdate,@Username,@paymentMode,@status)", ordercon)
                    cmd.Parameters.AddWithValue("@registerId", Session("id"))
                    'cmd.Parameters.AddWithValue("@brand", productbrand)
                    cmd.Parameters.AddWithValue("@qty", productqty)
                    cmd.Parameters.AddWithValue("@price", productprice)
                    cmd.Parameters.AddWithValue("@image", productmainImage)
                    cmd.Parameters.AddWithValue("@name", productname)
                    cmd.Parameters.AddWithValue("@pid", productid)
                    cmd.Parameters.AddWithValue("@shippingAddress", registershippingadd)
                    cmd.Parameters.AddWithValue("@emailId", registeremail)
                    cmd.Parameters.AddWithValue("@orderdate", DateTime.Now.ToShortDateString)
                    cmd.Parameters.AddWithValue("@Username", registerUsername)
                    cmd.Parameters.AddWithValue("@paymentMode", orderpayment)
                    cmd.Parameters.AddWithValue("@status", productstatus)
                    'CHECK WETHER THE CONNECTION IS CLOSE AUTOMATICALLY AFTER FIRST ITRATION OR NOT .IT'S IMPORTANT BECAUSE ONCE THE CONNECTION IS CLOSE THEN NEXT ROW WON'T EXECUTE.
                    If ordercon.State = ConnectionState.Closed Then
                        ordercon.Open()
                    End If
                    cmd.ExecuteNonQuery()

                    'CODE FOR UPDATING QTY BASED ON USER SELECTED PRODUCT QTY
                    pqty = pqty - productqty
                    'PQTY IS LOCAL VARIABLE WHICH WILL CALCULATION  ABOUT QTY
                    cmd = New SqlCommand("update products set qty=@qty where pid=@pid", updateqtycon)
                    cmd.Parameters.AddWithValue("@qty", pqty)
                    cmd.Parameters.AddWithValue("@pid", productid)
                    If updateqtycon.State = ConnectionState.Closed Then
                        updateqtycon.Open()
                    End If
                    cmd.ExecuteNonQuery()

                End While
            End If
        End Using

        'DELETE CART PRODUCT AFTER USER SUCCESSFULLY PLACE ORDER.
        cmd = New SqlCommand("delete from cart where registerId=@rid", con)
        cmd.Parameters.AddWithValue("@rid", Session("id"))
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        cmd.ExecuteNonQuery()
        con.Close()
        'REDIRECT BACK TO ORDER VIEW PAGE FOR USER TO SEE WHAT PRODUCT HE/SHE BOUGHT FROM CART OR DIRECTLY BUY NOW.
        Response.Redirect("~/User/View Order.aspx")



    End Sub
    Dim drs As SqlDataReader
    'GET REGISTERID FUNCTION.
    Public Sub getregisterIds()
        cmd = New SqlCommand("select registerId from RegistrationMaster where username=@username", con)
        cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
        con.Open()
        Dim registerid As Integer = cmd.ExecuteScalar()
        Session("id") = registerid
        con.Close()
    End Sub
    Protected Sub RadioButtonListpayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonListpayment.SelectedIndexChanged

        If RadioButtonListpayment.SelectedIndex = 0 Then
            PanelcardDetails.Visible = True
            Btplaceorder.Enabled = True
        End If

        If RadioButtonListpayment.SelectedIndex = 1 Then
            PanelcardDetails.Visible = False
            Btplaceorder.Enabled = True
        End If

    End Sub
    Protected Sub getinfo()
        orderdate = DateTime.Now.ToString


    End Sub
End Class
