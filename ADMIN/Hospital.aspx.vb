Imports System.Data.SqlClient
Partial Class Proofofdeceased
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

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblerror.Text = "An exception occured." & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblerror.Text = "No rows were updated." & "Another user may have updated that category." & "Please try again."
        End If
    End Sub
    Function ClearFields()


        Me.txtcategory.Text = ""

    End Function


    Protected Sub Btnaddcategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnaddcategory.Click
        Dim a As String

        a = Me.txtcategory.Text

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_hospital", pistolconn)


            cmdpistol.Parameters.AddWithValue("@HospitalName", Me.txtcategory.Text)



            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()
            ClearFields()
            Me.GridView1.DataBind()
            Response.Write("Category has been added to Database: " & a)


        Catch ex As Exception

        End Try
        pistolconn.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rights") <> "Admin" Then
            Response.Redirect("pistollicense.aspx")
            'Response.Write("Only Admin's can modify Maintenance Tables")
        End If
    End Sub
End Class
