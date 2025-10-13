Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Partial Class Directory
    Inherits System.Web.UI.Page
    Protected Sub GridView1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.Load
        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If
    End Sub
End Class
