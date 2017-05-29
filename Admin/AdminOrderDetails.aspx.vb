
Partial Class Admin_AdminOrderDetails
    Inherits System.Web.UI.Page


    Protected Sub BtSearch_Click(sender As Object, e As EventArgs) Handles BtSearch.Click

        Session("registerID") = txtadminOrderDetailsSearch.Text



    End Sub
End Class
