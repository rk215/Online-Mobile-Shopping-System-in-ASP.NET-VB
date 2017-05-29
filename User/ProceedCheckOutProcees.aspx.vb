Imports System.Data.SqlClient
Imports System.Data
Partial Class User_ProceedCheckOutProcees
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

            'FIND LOGGED-IN USER INFORMATION FROM DATABASE.
            cmd = New SqlCommand("select * from RegistrationMaster where registerId=@id", con)
            con.Open()
            cmd.Parameters.AddWithValue("@id", Request.Cookies("User-data")("Registerid"))
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
    Protected Sub View2_Activate(sender As Object, e As EventArgs) Handles View2.Activate
        'SECOND VIEW CODE.(PAYMENT PROCESS)
        If Page.IsValid Then

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
        cmd.Parameters.AddWithValue("@registerId", Request.Cookies("User-data")("Registerid"))
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
        If Request.Cookies("User-data") IsNot Nothing Then
            getproductcount()
            getregisterId()
        Else
            Response.Redirect("~/User/Login.aspx")
        End If

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
    Dim orderdate As Date
    Dim productid, productqty, productprice, registerid As Integer
    Dim productmainImage, productname, registeremail, registerUsername,
            orderpayment, registershippingadd, productbrand, productmodelNumber, productstatus As String
    Protected Sub Btplaceorder_Click(sender As Object, e As EventArgs) Handles Btplaceorder.Click
        If Page.IsValid Then
            'RECIEVE ORDER FRM BUYNOW  BUTTON.

            '--->PUT ALL REQUIRED DATA TO ORDER MASTER TABLE<----.

            'FIRST GET ALL DATA FROM PRODUCT TABLES.
            cmd = New SqlCommand("select * from products where pid=@pid", con)
            cmd.Parameters.AddWithValue("@pid", Session("pid"))
            con.Open()
            Using dr As SqlDataReader = cmd.ExecuteReader()
                If dr.HasRows Then
                    'WE NEED FOLLOWING DETAILS FROM PRODUCT TABLE.
                    'PID,QTY,PRICE,MAINIMAGE,PRODUCTNAME,BRAND,MODELNUMBER,STATUS.
                    dr.Read()
                    productid = Session("pid")
                    'PRODUCT DETAILS.
                    productbrand = dr("brand").ToString
                    productname = dr("pname").ToString
                    productqty = dr("qty") 'WE MANUALLY SET QUANTITY TO 1 BECAUSE USER WANT'S ONE QUANTITY FROM DIRECT BUY NOW.
                    productprice = dr("price").ToString
                    productmainImage = dr("MImage").ToString
                    productmodelNumber = dr("modelNo").ToString
                    con.Close()
                End If
            End Using

            'FIND USER DETAILS.
            getregisterId()
            cmd = New SqlCommand("select * from RegistrationMaster where registerId=@registerId", con)
            cmd.Parameters.AddWithValue("@registerId", Session("id"))
            'SESSION (ID) CONTAIN REGISTERID
            con.Open()
            Using dr As SqlDataReader = cmd.ExecuteReader
                If dr.HasRows Then

                    'WE NEED FOLLOWING DETAILS FROM REGISTRATIONMASTER TABLE.
                    'REGISTER USER ID,USER SHIPPING ADDRESS,USER EMAIL ID,USER FIRST AND LAST NAME.
                    dr.Read()
                    registerid = Session("id")
                    registershippingadd = dr("addres").ToString
                    registeremail = dr("username").ToString
                    registerUsername = dr("firstname").ToString + dr("lastname").ToString
                    'WE MANUALLY SET THE INITIAL PRODUCT STATUS TO PENDING.BECAUSE EVERY PRODUCT MUST DISPLAY PENDING STATUS TO THE USER. TO LET THE USER WETHER PRODUCT IS SHIPPED OR PENDING
                    productstatus = "Pending"
                    con.Close()
                End If
            End Using
            'IF USER SELECT FIRST OPTION THEN WE KNOW USER BUY PRODUCT THROUGH CREDIT/DEBIT CARD.
            If RadioButtonListpayment.SelectedIndex = 0 Then
                orderpayment = "Credit/Debit"
            End If
            'AND IF USER SELECT SECOND OPTION THEN WE KNOW THAT USER BUY OUR PRODUCT TO THROUGH CASE ON DELIVERY.
            If RadioButtonListpayment.SelectedIndex = 1 Then
                orderpayment = "COD"
            End If
            'DISPLAY ORDER PLACED DATE.
            orderdate = DateTime.Now.ToString

            'SIMPLY INSERT ABOVE PROVIDED DETAILS TO ORDERMASTER.

            cmd = New SqlCommand("insert into OrderMaster values(@pid,@registerid,@qty,@price,@shippingaddress,@emailID,@orderdate,@productImage,@username,@orderpayment,@pname,@status)", con)
            cmd.Parameters.AddWithValue("@pid", productid)
            cmd.Parameters.AddWithValue("@registerid", registerid)
            cmd.Parameters.AddWithValue("@qty", 1)
            cmd.Parameters.AddWithValue("@price", productprice)
            cmd.Parameters.AddWithValue("@shippingaddress", registershippingadd)
            cmd.Parameters.AddWithValue("@emailID", registeremail)
            cmd.Parameters.AddWithValue("@orderdate", orderdate)
            cmd.Parameters.AddWithValue("@productImage", "~/" + productmainImage)
            cmd.Parameters.AddWithValue("@username", registerUsername)
            cmd.Parameters.AddWithValue("@orderpayment", orderpayment)
            cmd.Parameters.AddWithValue("@pname", productname)
            cmd.Parameters.AddWithValue("@brand", productbrand)
            cmd.Parameters.AddWithValue("@ModelNumber", productmodelNumber)
            cmd.Parameters.AddWithValue("@status", productstatus)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'AFTER ORDER IS SUCCESSFULLY PLACED THEN WE UPDATE OUR DATABASE PRODUCT QTY.
            updateqty()
            'REDIRECT TO ORDER VIEW PAGE.
            Response.Redirect("~/User/View Order.aspx")
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

    Protected Sub updateqty()
        Dim pqty As Integer = 1
        'CODE FOR UPDATING QTY BASED ON USER SELECTED PRODUCT QTY
        productqty  = productqty - pqty
        'PQTY IS LOCAL VARIABLE WHICH WILL CALCULATION  ABOUT QTY
        cmd = New SqlCommand("update products set qty=@qty where pid=@pid", con)
        cmd.Parameters.AddWithValue("@qty", productqty)
        cmd.Parameters.AddWithValue("@pid", productid)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

    End Sub
End Class
