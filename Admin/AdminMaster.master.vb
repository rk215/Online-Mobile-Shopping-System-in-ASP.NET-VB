
Imports System.IO

Partial Class Admin_AdminMaster
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        For Each item As MenuItem In Menu1.Items
            If item.NavigateUrl.Equals(Request.AppRelativeCurrentExecutionFilePath) Then

                item.Selected = True
            End If
        Next



    End Sub
    Protected Sub btadminLogout_Click(sender As Object, e As EventArgs) Handles btadminLogout.Click

        Dim usercookie As New HttpCookie("User-data")
        usercookie.Expires = DateTime.Now.AddDays(-7D)
        Response.Cookies.Add(usercookie)
        Response.Redirect("~/User/Default.aspx")
    End Sub
End Class

