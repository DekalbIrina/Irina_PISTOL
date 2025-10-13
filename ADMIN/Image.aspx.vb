Imports System.Data.SqlClient

Partial Class Image
    Inherits System.Web.UI.Page

    Protected Sub btnviewimage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnviewimage.Click
       

        Dim spath As String = "Y:\PistolImages\" & Me.FileUpload1.FileName
        Me.txtfilename.Text = "Y:\PistolImages\" & Me.FileUpload1.FileName
        Me.Image1.ImageUrl = spath

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mystring As String = Session("memberid")
        Me.txtmemberid.Text = mystring
        Dim a As String = Session("firstname")
        Me.txtfirstname.Text = a
        Dim b As String = Session("lastname")
        Me.txtlastname.Text = b


        If Me.FileUpload1.HasFile Then
            Me.btnimage.Enabled = True
        Else
            Me.btnimage.Enabled = False
        End If


        If Session("Rights") = "Guest" Then
            Me.Form.Disabled = True
        ElseIf Session("Rights") = "User" Then
            Me.Form.Disabled = False


        End If

    End Sub
    Function UploadImage()

        Dim isizelimit As Integer = 5242880
        If Me.FileUpload1.HasFile Then
            If Me.FileUpload1.PostedFile.ContentLength <= isizelimit Then
                Dim spath As String = "C:\PistolImages\" & Me.FileUpload1.FileName
                Response.Write(spath)
                Me.FileUpload1.SaveAs(spath)
            End If
        End If
    End Function
    Protected Sub btnimage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnimage.Click
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_Images", pistolconn)
            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@picturepath", Me.txtfilename.Text)
            cmdpistol.Parameters.AddWithValue("@picturedescription", Me.txtimagedescription.Text)
            
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()
            Response.Write("Image Path Has been added to DB." & Me.txtfilename.Text)

            Me.txtimagedescription.Text = ""
            Me.txtfilename.Text = ""
            Me.Image1.ImageUrl = ""

        Catch ex As Exception

        End Try
        pistolconn.Close()
    End Sub
















  
End Class
