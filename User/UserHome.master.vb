Imports System.Data.SqlClient
Imports System.Data
Partial Class User_UserHome
    Inherits System.Web.UI.MasterPage
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Request.Cookies("User-data") Is Nothing Then
            btHomeLogin.Visible = True
            btLogout.Visible = False
            lbuser.Visible = False
            HyperProfile.Visible = False
            Hypervieworder.Visible = False

        Else
            btHomeLogin.Visible = False
            btLogout.Visible = True
            lbuser.Visible = True
            HyperProfile.Visible = True
            Hypervieworder.Visible = True
            lbuser.Text = "[" + Request.Cookies("User-data")("name").ToString + "]"
            getproductcount()
        End If
    End Sub
    Protected Sub btHomeLogin_Click(sender As Object, e As EventArgs) Handles btHomeLogin.Click

        Response.Redirect("~/User/Login.aspx")



    End Sub
    Protected Sub btLogout_Click(sender As Object, e As EventArgs) Handles btLogout.Click

        Dim usercookie As New HttpCookie("User-data")
        usercookie.Expires = DateTime.Now.AddDays(-7D)
        Response.Cookies.Add(usercookie)
        btHomeLogin.Visible = True
        btLogout.Visible = False
        lbuser.Visible = False
        lbCartCount.Text = 0
        Response.Redirect("~/User/Default.aspx")
    End Sub
    Protected Sub btSearch_Click(sender As Object, e As EventArgs) Handles btSearch.Click

        If Not TxtUserHomeSearch.Text = "" Then
            Response.Redirect("~/User/ProductList.aspx?productDetails=" + TxtUserHomeSearch.Text)
        End If


    End Sub
    Protected Sub btLogo_Click(sender As Object, e As EventArgs) Handles btLogo.Click

        Response.Redirect("~/User/Default.aspx")


    End Sub
    Protected Sub btCart_Click(sender As Object, e As EventArgs) Handles btCart.Click

        Response.Redirect("~/User/Cart.aspx")
    End Sub
    'COMMON FUNCTION FOR THE WHOLE PROJECT TO DITTERMINE HOW MANY PRODUCT AVAILABLE IN CART
    Protected Sub getproductcount()
        'GET MASTER PAGE CONTROL ID FOR CART COUNTING LABEL.

        cmd = New SqlCommand("Select count(cartId) from cart where  registerId=@register", con)
        cmd.Parameters.AddWithValue("@register", Session("id"))
        con.Open()
        Dim totalproduct As Integer = cmd.ExecuteScalar()
        con.Close()
        lbCartCount.Text = totalproduct

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
End Class

