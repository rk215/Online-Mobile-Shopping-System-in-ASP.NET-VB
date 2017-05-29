Imports System.Data.SqlClient
Imports System.Data
Partial Class User_RegisterationForm
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub btregistration_Click(sender As Object, e As EventArgs) Handles btregistration.Click
        'CHECK WETHER ALL VALIADATION IS SUCCESSFULLY DONE OR NOT.
        If Page.IsValid = True Then
            'IT MEANS VALIDATION SUCCESSFULLY DONE.
            'LET ADD RECORD TO MASTER TABLE(LOGIN MASTER).
            cmd = New SqlCommand("insert into LoginMaster(username,pass) values(@us,@pass)", con)
            cmd.Parameters.AddWithValue("@us", txtregistrationusername.Text)
            cmd.Parameters.AddWithValue("@pass", txtregistrationpassword.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()

            'LET ADD RECORD TO CHILD TABLE(REGISTERATION MASTER).
            cmd = New SqlCommand("insert into RegistrationMaster(username,pass,firstname,lastname,phoneNumber,addres,creditOrdebit,city,stat,zipcode) values(@us,@pass,@fname,@lname,@phone,@add,@credit,@city,@state,@zipcode)", con)
            cmd.Parameters.AddWithValue("@us", txtregistrationusername.Text)
            cmd.Parameters.AddWithValue("@pass", txtregistrationpassword.Text)
            cmd.Parameters.AddWithValue("@fname", txtregistrationFirstname.Text)
            cmd.Parameters.AddWithValue("@lname", txtregistrationLastname.Text)
            cmd.Parameters.AddWithValue("@phone", txtregistrationphoneNumber.Text)
            cmd.Parameters.AddWithValue("@add", txtregistrationaddress.Text)
            cmd.Parameters.AddWithValue("@credit", txtregistrationcreditcard.Text)
            cmd.Parameters.AddWithValue("@city", txtregistrationcity.Text)
            cmd.Parameters.AddWithValue("@state", txtregistrationstate.Text)
            cmd.Parameters.AddWithValue("@zipcode", txtregistrationZipcode.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            Dim usercookie As New HttpCookie("User-data")
            usercookie("Username") = txtregistrationusername.Text
            usercookie("password") = txtregistrationpassword.Text
            usercookie("Phonenumber") = txtregistrationphoneNumber.Text
            usercookie("fname") = txtregistrationFirstname.Text
            usercookie("lname") = txtregistrationLastname.Text
            usercookie("city") = txtregistrationcity.Text
            usercookie("state") = txtregistrationstate.Text
            usercookie("address") = txtregistrationaddress.Text
            usercookie("credit") = txtregistrationcreditcard.Text

            'FIND USER NAME AND STORE IN COOKIE FOR DISLAYING IN USER HOME PAGE.
            cmd = New SqlCommand("select * from   RegistrationMaster where username=@username", con)
            cmd.Parameters.AddWithValue("@username", txtregistrationusername.Text)
            con.Open()

            Using innerdr As SqlDataReader = cmd.ExecuteReader()
                If innerdr.HasRows Then
                    innerdr.Read()
                    Dim str As String
                    ' 
                    usercookie("name") = innerdr("firstname").ToString + innerdr("lastname").ToString
                    str = usercookie("name")
                End If
            End Using
            usercookie.Expires = DateTime.Now.AddDays(7D)
            Response.Cookies.Add(usercookie)
            con.Close()
            Response.Redirect("~/User/Default.aspx")
        End If





    End Sub
End Class
