Imports System.Data.SqlClient

Partial Class Image
    Inherits System.Web.UI.Page



    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            lblerror.Text = "An exception occured." & e.Exception.Message
            e.ExceptionHandled = True
            e.AffectedRows.ToString()
        ElseIf e.AffectedRows = 0 Then
            lblerror.Text = "No rows were updated." & "Another user may have updated that category." & "Please try again."
        End If
    End Sub

        Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Me.txtfilename.Text = GridView1.SelectedRow.Cells(2).Text
        Dim spath As String = Me.txtfilename.Text
        Me.Image1.ImageUrl = spath
      
    End Sub

    
    

    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rights") = "Guest" Then
            Me.Form.Disabled = True
        ElseIf Session("Rights") = "User" Then
            Me.Form.Disabled = False
        End If

        Me.txtmemberid.Text = Session("memberid")

    End Sub
End Class
