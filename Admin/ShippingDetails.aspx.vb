Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_ShippingDetails
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("ShoppingConnectionString").ConnectionString)
    Dim cmd As SqlCommand
    Dim ds As New DataSet
    Dim ad As SqlDataAdapter


    Protected Sub AdminShippingDetailsGrid_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles AdminShippingDetailsGrid.RowUpdating
        Dim id As Label = DirectCast(AdminShippingDetailsGrid.Rows(e.RowIndex).FindControl("lbEditorderID"), Label)
        Dim dro As DropDownList = DirectCast(AdminShippingDetailsGrid.Rows(e.RowIndex).FindControl("AdminShippingDetailsdrop"), DropDownList)

        'SqlDataSource1.UpdateParameters().Add("@orderId", id.Text)
        'SqlDataSource1.UpdateParameters.Add("@status", dro.SelectedItem.Text)

        Session("OrderId") = id.Text
        Session("Status") = dro.SelectedItem.Text

    End Sub
End Class
