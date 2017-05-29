Imports System.Data.SqlClient
Imports System.Data
Partial Class User_Cart
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not IsPostBack Then
            getproductcount()
        End If

        'CHECK WETHER SESSION EMPTY OR NOT

        If Session("id") Is Nothing Then
            'MEANS SESSION IS EMPTY. SO WE PASS COOKIE STORE VALUE TO SESSION.
            Session("id") = Request.Cookies("User-data")("Registerid")

            'INCASE THE COOKIE IS EMPTY CALL BELOW FUNCTION.
            getregisterId()

        End If
        'CHECK WETHER COOKIES EMPTY OR NOT
        If Request.Cookies("User-data") Is Nothing Then
            'MEANS COOKIE IS EMPTY SO REDIRECT BACK TO LOGIN.ASPX PAGE.
            Response.Redirect("~/User/Login.aspx")
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
        If totalproduct = 0 Then
            btcheckout.Visible = False
        End If
        con.Close()
    End Sub
    Dim total As Double
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound

        'FIND SUMMARY PRICE.

        If e.Row.RowType = DataControlRowType.DataRow Then
            total += DataBinder.Eval(e.Row.DataItem, "price")
            getproductcount()
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(6).Style.Add("color", "#b12704")
            e.Row.Cells(6).Style.Add("font-size", "20px")
            e.Row.Cells(6).Style.Add("font-Variant-numeric", "oldstyle-nums")
            e.Row.Cells(6).Text = total
            e.Row.Cells(5).Text = "Summary"
            e.Row.Cells(5).Style.Add("font-size", "16px")
            e.Row.Cells(5).Style.Add("color", "#252525")
        End If


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
    'PRODUCT DELETE CODE
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        'DELETE THE PRODUCT HERE.
        Dim cartid As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("LbItemCartId"), Label)
        Session("cartId") = cartid.Text
    End Sub
    'PRICE UPDATE CODE.
    Dim cartqty As Integer

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        'UPDATE PRICE BASED ON QTY'S.
        Dim productId As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("LbEditpid"), Label)
        Dim price As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("LbEditprice"), Label)  'Item template id is LbItemprice
        Dim qty As DropDownList = DirectCast(GridView1.Rows(e.RowIndex).FindControl("DropEidtQTY"), DropDownList)
        Dim cartid As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("LbEditCartId"), Label)
        Dim qtylb As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("lbItemQTY"), Label)
        Dim proname As Label = DirectCast(GridView1.Rows(e.RowIndex).FindControl("LbItempname"), Label)
        'DECLARE STATIC PRICE VARIABLE.
        Dim staticprice As Double
        'SET THE PRODUCT PRICE TO STATICPRICE VARIABLE BASED ON PRODUCT ID.
        cartqty = qty.SelectedItem.Text
        If productId.Text = 1 Then
            'moto g4 plus
            staticprice = 14999.0
        End If
        If productId.Text = 3 Then
            'iphone 5s
            staticprice = 23000.0
        End If
        If productId.Text = 4 Then
            'samsung j2
            staticprice = 8099.0
        End If
        If productId.Text = 6 Then
            staticprice = 11999.0
        End If

        If productId.Text = 5 Then
            'iphone 7
            staticprice = 46000.0
        End If
        getproductcount()

        'FIND THE ORIGINAL QTY FROM PRODUCT DB.
        cmd = New sqlcommand("select qty from products where pid=@pid", con)
        Dim dbqty As Integer
        cmd.Parameters.AddWithValue("@pid", productId.Text)
        con.Open()
        dbqty = cmd.ExecuteScalar()
        con.Close()

        Dim ansqty As Integer
        'GET THE PRODUCT QTY IS SUFFICIENT OR NOT BY DECRESE CART QTY AND PRODUCT DB QTY.
        ansqty = dbqty - qty.SelectedItem.Text
        'CHECK WETHER THE QTY IS SUFFICIENT OR NOT
        If Not ansqty >= 0 Then

            LbError.Text = "Insufficient Quantity. Only " + CStr(math.abs(dbqty)) + "  Quantity left."
            Session("price") = qty.SelectedItem.Text * staticprice
            Session("qty") = qty.SelectedItem.Text
            Session("cartId") = cartid.Text

        Else
            LbError.Text = ""
            'PASS BELOW IMPOTANT VALUE TO SESSION PARAMETER OF UPDATE COMMAND.
            Session("price") = qty.SelectedItem.Text * staticprice
            Session("qty") = qty.SelectedItem.Text
            Session("cartId") = cartid.Text


        End If
    End Sub
    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand

        'NAVIGATE TO USER SELECTED PRODUCTS DETAIL PAGE.
        If e.CommandName = "View" Then
            Dim productid As String = e.CommandArgument.ToString
            Response.Redirect("~/User/ProductDetail.aspx?id=" + productid)
        End If

    End Sub
    Protected Sub btcheckout_Click(sender As Object, e As EventArgs) Handles btcheckout.Click

        'CODE FOR IMPLEMENT PROCEED CHECKOUT FEATURE.
        If Request.Cookies("User-data")("Username") IsNot Nothing Then
            'CHECK WETHER USER SELECT THE RIGHT/SUFFICIENT QTY OR NOT
            If LbError.Text = "" Then

                'MEANS USER SELECT SUFFICIENT QTY 
                Response.Redirect("~/User/BuyFromCart.aspx")

            End If

        Else
            btcheckout.Attributes.Add("onclick", "return confirm('Please log in')")
            Response.Redirect("~/User/Login.aspx")
        End If


    End Sub

    Private Sub User_Cart_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        getproductcount()
    End Sub
End Class
