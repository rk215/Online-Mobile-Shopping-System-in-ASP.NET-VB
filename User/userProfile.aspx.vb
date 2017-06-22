Imports System.Data.SqlClient
Imports System.Data
Partial Class User_userProfile
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'DISPLAY ALL RECORD AT LOAD TIME OF THIS PAGE.
        loadrecord()
    End Sub
    'GET ALL REGISTER USER ID
    Protected Sub getregisterId()
        cmd = New SqlCommand("Select registerId from RegistrationMaster where username=@username", con)
        cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
        con.Open()
        Dim registerid As Integer = cmd.ExecuteScalar()
        Session("id") = registerid
        con.Close()
    End Sub

    Protected Sub btupdate_Click(sender As Object, e As EventArgs) Handles btupdate.Click
        'UPDATE USER DETAILS BY CALLING BELOW FUNCTION
        updateuserdetails()


    End Sub
    Protected Sub updateuserdetails()
        cmd = New SqlCommand("update RegistrationMaster set firstname=@firstname,lastname=@lastname,username=@username,addres=@addres,phoneNumber" + "=@phoneNumber,creditOrdebit=@creditOrdebit,city=@city,stat=@stat,zipcode=@zipcode " + "where registerId=@rId", con)
        cmd.Parameters.AddWithValue("@rId", Session("id"))
        cmd.Parameters.AddWithValue("@firstname", txtfname.Text)
        cmd.Parameters.AddWithValue("@lastname", txtlname.Text)
        cmd.Parameters.AddWithValue("@addres", txtaddress.Text)
        cmd.Parameters.AddWithValue("@username", txtemail.Text)
        cmd.Parameters.AddWithValue("@phoneNumber", txtphone.Text)
        cmd.Parameters.AddWithValue("@creditOrdebit", txtcard.Text)
        cmd.Parameters.AddWithValue("@city", txtcity.Text)
        cmd.Parameters.AddWithValue("@stat", txtstate.Text)
        cmd.Parameters.AddWithValue("@zipcode", txtzip.Text)
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()

    End Sub
    Protected Sub loadrecord()

        If IsPostBack Then
            'CHECK IF PAGE IS POSTING TO SERVER OR NOT .IF YES THEN WE HAVE POST UPDATED USER DETAILS TO SERVER BY CALLIG BELOW FUNCTION.
            'DO REMEMBER THAT THIS WILL FIRE AT FIRST PAGE LOAD .WHICH EXACTLY WE WANTS IT.
            updateuserdetails()

        End If
        ''NO NEED TO CHECK IF USER IS LOGGED ON OR NOT BECAUSE PROFILE LINK ONLY VISIBLE WHEN USER IS LOGGED ON TO OUR SYSTEM.
        ''NOW GET CURRENT  USER ID FROM DATABASE.
        cmd = New SqlCommand("select * from RegistrationMaster where registerId=@registerId", con)
        cmd.Parameters.AddWithValue("@registerId", Session("id"))
        con.Open()
        Using dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                'WE HAVE TO CALL READ() TO READ DATA FROM DATAREADER.
                dr.Read()
                txtfname.Text = dr("firstname") 'WHERE dr("DATABASE COLUMN NAME")
                txtlname.Text = dr("lastname")
                txtemail.Text = dr("username")
                txtaddress.Text = dr("addres")
                txtphone.Text = dr("phoneNumber")
                txtcard.Text = dr("creditOrdebit")
                txtcity.Text = dr("city")
                txtstate.Text = dr("stat")
                txtzip.Text = dr("zipcode")
            End If
        End Using


    End Sub
    Protected Sub btCancel_Click(sender As Object, e As EventArgs) Handles btCancel.Click
        Response.Redirect("~/User/Default.aspx")
    End Sub
End Class


