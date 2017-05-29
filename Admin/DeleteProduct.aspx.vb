Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_DeleteProduct
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter

    Protected Sub bind()
        'WE ONLY WANT SOME IMPORTANT FIELD WHICH IS GIVEN BELOW FOR GRIDVIEW.
        cmd = New SqlCommand("SELECT [pid], [pname], [ptype], [brand], [osversion], [modelNo], [plat_form], [MImage], [Ram], [color], [price], [qty] FROM [products]", con)
        con.Open()
        cmd.ExecuteNonQuery()
        ad = New SqlDataAdapter(cmd)
        ad.Fill(ds)
        ProductDeleteGrid.DataSource = ds

        ProductDeleteGrid.DataBind()
        con.Close()
    End Sub



    Protected Sub ProductDeleteGrid_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles ProductDeleteGrid.RowDeleting


        'ASK USER WETHER HE/SHE WANTS  TO DELETE THE RECORD OR NOT.

        'YES WILL RETURN 6 , NO WILL RETURN 7
        Dim confirmation As Integer = MsgBox("Are you sure want to delete the Products from database???", vbYesNo, "Confirmation")
        If confirmation = 6 Then
            'FIND THE PRODUCT ID IN GRIDVIEW ALSO FIND ROWINDEX OF CURRENT CLICK BUTTON.
            Dim pid As Label = DirectCast(ProductDeleteGrid.Rows(e.RowIndex).FindControl("LbItemdeleteproductID"), Label)
            'SIMPLY DELETE THE RECORD FROM DATABASE.

            'IN CASE THE USER IS PLACE ORDER FOR THIS PRODUCT THEN WE ALSO REMOVE FROM THAT USER ORDER BAG.
            'DELETE ALL PRODUCT RELATED WHICH IS USE IN ORDER MASTER.
            cmd = New SqlCommand("delete from OrderMaster where pid=@pid", con)
            cmd.Parameters.AddWithValue("@pid", pid.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()

            'CODE FOR DELETING PRODUCT FROM PRODUCT TABLE FROM ROW  IN GRIDVIEW.
            cmd = New SqlCommand("delete from products where pid=@pid", con)
            cmd.Parameters.AddWithValue("@pid", pid.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            bind()

        End If

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'CHECK WETHER THE FORM IS POSTED TO SERVER OR NOT .
        If Not IsPostBack Then
            'MEANS ,THE FORM IS NOT POSTED TO SERVER,OR IT'S FIRST REQUEST FROM CLIENT.
            bind() 'CUSTOM METHOD TO BIND DATABASE VALUE TO GRIDVIEW.
        End If


    End Sub
End Class
