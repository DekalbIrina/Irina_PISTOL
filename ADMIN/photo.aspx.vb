
Partial Class photo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring As String = Session("memberid")
        Me.txtmemberid.Text = mystring
        Dim a As String = Session("firstname")
        Me.txtfirstname.Text = a
        Dim b As String = Session("lastname")
        Me.txtlastname.Text = b


    End Sub
End Class
