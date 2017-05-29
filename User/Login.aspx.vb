Imports System.Data.SqlClient
Imports System.Data
Partial Class User_Login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub LinkNewUser_Click(sender As Object, e As EventArgs) Handles LinkNewUser.Click

        Response.Redirect("~/User/RegisterationForm.aspx")

    End Sub
    Protected Sub btLogin_Click(sender As Object, e As EventArgs) Handles btLogin.Click
        If Page.IsValid Then
            'CHECK WETHER USER IS AVAILABLE IN DATABASE OR NOT.
            cmd = New SqlCommand("select * from LoginMaster where username=@us and pass=@pass", con)
            cmd.Parameters.AddWithValue("@us", txtloginusername.Text)
            cmd.Parameters.AddWithValue("@pass", txtloginpassword.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            Using dr As SqlDataReader = cmd.ExecuteReader()
                If dr.HasRows Then
                    con.Close()

                    If txtloginusername.Text.Equals("Admin215@gmail.com", StringComparison.OrdinalIgnoreCase) And txtloginpassword.Text.Equals("admin", StringComparison.OrdinalIgnoreCase) Then
                        'IT MEANS THAT USER IS  Admin And AVAILABLE IN OUR DATABASE.
                        Dim usercookie As New HttpCookie("User-data")
                        usercookie("Username") = txtloginusername.Text
                        usercookie("password") = txtloginpassword.Text
                        usercookie.Expires = DateTime.Now.AddDays(7D)
                        Response.Cookies.Add(usercookie)
                        con.Close()
                        Response.Redirect("~/Admin/AdminHome.aspx")
                    Else

                        Dim usercookie As New HttpCookie("User-data")
                        usercookie("Username") = txtloginusername.Text
                        usercookie("password") = txtloginpassword.Text

                        'FIND USER NAME AND STORE IN COOKIE FOR DISLAYING IN USER HOME PAGE.
                        cmd = New SqlCommand("select * from   RegistrationMaster where username=@username", con)
                        cmd.Parameters.AddWithValue("@username", txtloginusername.Text)
                        con.Open()

                        Using innerdr As SqlDataReader = cmd.ExecuteReader
                            If innerdr.HasRows Then
                                innerdr.Read()
                                usercookie("name") = innerdr("firstname").ToString + innerdr("lastname").ToString

                            End If
                        End Using
                        con.Close()

                        'FIND REGISTER ID OF CURRENTLY LOGGED IN
                        cmd = New SqlCommand("select registerId from   RegistrationMaster where username=@username", con)
                        cmd.Parameters.AddWithValue("@username", txtloginusername.Text)
                        con.Open()
                        Dim registerid As Integer
                        registerid = cmd.ExecuteScalar()
                        Dim fname As String = cmd.ExecuteScalar
                        If registerid = 0 Then
                            getproductcount()
                            getregisterId()
                        Else
                            'PASS REGISTER ID TO USER-DATA COOKIE.
                            usercookie("Registerid") = registerid
                            'CREATE COOKIE WITH 7 DAY EXPIRATION.
                            usercookie.Expires = DateTime.Now.AddDays(7D)
                            Response.Cookies.Add(usercookie)
                            con.Close()
                            Response.Redirect("~/User/Default.aspx")

                        End If

                    End If
                Else
                    'IT MEANS THAT USER NOT AVAILABLE IN OUR DATABASE. SO REDIRECT TO REGISTER PAGE.
                    Response.Redirect("~/User/RegisterationForm.aspx")
                End If
            End Using

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
        lb.Text = totalproduct

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
