Imports System.Data.SqlClient
Imports System.Data
Partial Class User_Default
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click

        Response.Redirect("~/Promotion Page/FirstPromo.aspx")


    End Sub
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click

        Response.Redirect("~/Promotion Page/SecondPromo.aspx")

    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'CHECK WETHER THE USER IS LOGGED OR NOT.
        If Request.Cookies("User-data") IsNot Nothing Then
            getproductcount()
            getregisterId()
            Dim user As String = Request.Cookies("User-data")("Username").ToString
            If user = "Admin215@gmail.com" Then
                Response.Redirect("~/Admin/AdminHome.aspx")
                'Else

                '    'Response.Redirect("~/User/Default.aspx")
            End If
        Else

            'Response.Redirect("~/User/Login.aspx")
            'Dim us As String = Request.Cookies("User-data")("Username").ToString
            'us = ""
            'getregisterId()


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
End Class
