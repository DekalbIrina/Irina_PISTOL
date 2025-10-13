
Partial Class PistolLicense
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("default.aspx")
        End If

        Me.lblpistolconsole.Text = "FireArms License Software   User:" & " " & (Session("Welcome"))

    End Sub
End Class
