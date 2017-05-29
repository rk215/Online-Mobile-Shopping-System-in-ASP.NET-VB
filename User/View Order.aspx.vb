Imports System.Data.SqlClient
Imports System.Data
Partial Class User_View_Order
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.Cookies("User-data") IsNot Nothing Then
            getregisterId()
            getproductcount()
        Else
            Response.Redirect("~/User/Login.aspx")
        End If
        If Not IsPostBack Then
            emptyornot()
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
    'FIND REGISTER ID BASED ON LOGIN.
    Protected Sub getregisterId()
        cmd = New SqlCommand("select registerId from RegistrationMaster where username=@username", con)
        cmd.Parameters.AddWithValue("@username",
                   Request.Cookies("User-data")("Username").ToString)
        con.Open()
        Dim registerid As Integer = cmd.ExecuteScalar()
        Session("id") = registerid
        con.Close()
    End Sub
    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand

        If e.CommandName = "View" Then
            'FULL ORDER INFORMATION.
            Response.Redirect("~/User/OrderDetails.aspx?id=" + e.CommandArgument.ToString)
        End If
        If e.CommandName = "Delete" Then
            'GET THE QUANTITY FROM ORDER TABLE.
            cmd = New SqlCommand("select qty from OrderMaster where orderId=@oid", con)
            cmd.Parameters.AddWithValue("@oid", e.CommandArgument.ToString)
            con.Open()
            Dim orderqty As Integer = cmd.ExecuteScalar
            con.Close()

            'GET THE PRODUCT ID .WHERE USER IS CANCEL THE ORDER AND WE HAVE TO UPDATE OUR DATABASE.
            cmd = New SqlCommand("select pid from OrderMaster where orderId=@oid", con)
            cmd.Parameters.AddWithValue("@oid", e.CommandArgument.ToString)
            con.Open()
            Dim orderpid As Integer = cmd.ExecuteScalar
            con.Close()

            'GET THE QUANTITY FROM USER SELECTED PRODUCT IN PRODUCT TABLE.
            cmd = New SqlCommand("select qty from products where pid=@id", con)
            cmd.Parameters.AddWithValue("@id", orderpid)
            con.Open()
            Dim preader As SqlDataReader = cmd.ExecuteReader
            Dim productsqty As Integer
            If preader.HasRows Then
                preader.Read()
                productsqty = preader("qty").ToString

            End If
            con.Close()

            'TAKE BACK THE PRODUCT AND UPDATE OUR DATABASE PRODUCT QUANTITY.
            productsqty = productsqty + orderqty
            'UPDATE THE PRODUCT QUANTITY BY PERFORMING FOLLOWING QUARY.
            cmd = New SqlCommand("update products set qty=@qty where pid=@id", con)
            cmd.Parameters.AddWithValue("@id", orderpid)
            cmd.Parameters.AddWithValue("@qty", productsqty)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()


            'ORDER CANCELLATION CODE.
            cmd = New SqlCommand("delete from OrderMaster where orderId=@oid", con)
            cmd.Parameters.AddWithValue("@oid", e.CommandArgument.ToString)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'CALL FUNCTION TO BIND DATALIST
            bind()
        End If

    End Sub
    Protected Sub bind()
        cmd = New SqlCommand("SELECT * FROM [OrderMaster] WHERE ([registerId] = @rId)", con)
        cmd.Parameters.AddWithValue("@rId", Session("id"))
        con.Open()
        cmd.ExecuteNonQuery()
        ad = New SqlDataAdapter(cmd)
        ad.Fill(ds)
        DataList1.DataSource = ds
        DataList1.DataSourceID = ""
        DataList1.DataBind()
        con.Close()
    End Sub

    Protected Sub updateqty()

        ''find  max id of order id in ordermaster table
        cmd = New SqlCommand("select MAX(orderId) from OrderMaster", con)
        Dim maxid As Integer
        con.Open()
        maxid = cmd.ExecuteScalar()
        con.Close()

        cmd = New SqlCommand("select orderId  from OrderMaster", con)
        'cmd.Parameters.AddWithValue("@oid", maxid)
        con.Open()
        Dim ordermaxid As Integer = cmd.ExecuteScalar
        con.Close()

        cmd = New SqlCommand("select pid from OrderMaster where orderId=@oid", con)
        cmd.Parameters.AddWithValue("@oid", maxid)
        con.Open()
        Dim orderpid As Integer = cmd.ExecuteScalar
        con.Close()

        'FIND THE ORIGINAL QTY FROM PRODUCT TABLE.
        cmd = New SqlCommand("select qty from OrderMaster where registerId =@regid", con)
        Dim dbqty As Integer
        cmd.Parameters.AddWithValue("@regid", Session("id"))
        con.Open()
        dbqty = cmd.ExecuteScalar()
        con.Close()

        'dbqty = dbqty + orderqty
        cmd = New SqlCommand("update products set qty=@qty where pid=@pid", con)
        cmd.Parameters.AddWithValue("@qty", dbqty)
        cmd.Parameters.AddWithValue("@pid", maxid)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Protected Sub emptyornot()
        If DataList1.Items.Count = 0 Then
            DataList1.Visible = False
            LbEmpty.Visible = True
            LbEmpty.Text = "No Product in Your Order bag"
        Else
            DataList1.Visible = True
            LbEmpty.Visible = False
            LbEmpty.Text = ""
        End If
    End Sub

    Private Sub User_View_Order_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        emptyornot()
    End Sub
End Class
