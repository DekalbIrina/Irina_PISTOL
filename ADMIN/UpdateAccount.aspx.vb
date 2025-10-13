Imports System.Data.SqlClient


Partial Class UpdateAccount
    Inherits System.Web.UI.Page

    'Protected Sub btnlogon_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogon.Click
    '    Dim sconnection As String


    '    sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
    '    Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
    '    pistolconn.Open()

    '    Try
    '        Dim cmdpistol As SqlCommand = New SqlCommand("sel_logon", pistolconn)

    '        cmdpistol.Parameters.AddWithValue("@empusername", Me.txtuser.Text)
    '        cmdpistol.CommandType = Data.CommandType.StoredProcedure

    '        Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

    '        Dim pistol_data As Data.DataTable
    '        pistol_data = New Data.DataTable
    '        adppistol.Fill(pistol_data)


    '        If Me.txtpassword.Text = (pistol_data.Rows(0)("emppassword")) Then
    '            Me.txtnewpassword.Visible = True
    '            '   Me.newpassword.Visible = True
    '            Me.txtuser.Enabled = False
    '            Me.txtpassword.Enabled = False
    '            Me.btnewpassword.Visible = True
    '            Me.btnlogon.Visible = False
    '            Response.Write("Ready To Change Password!")
    '        Else
    '            If Me.txtpassword.Text <> (pistol_data.Rows(0)("emppassword")) Then
    '                Me.txtnewpassword.Visible = False
    '                Me.txtuser.Enabled = True
    '                Me.txtpassword.Enabled = True
    '                '    Me.newpassword.Visible = False
    '                Response.Write("Wrong Password, Try Again!")

    '            End If
    '        End If

    '    Catch

    '    End Try
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            ' Me.txtnewpassword.Visible = False
            ' Me.btnewpassword.Visible = False

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("Select_Password", pistolconn)


                find_pistol.Parameters.AddWithValue("@UserName", Session("username"))


                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                Dim firstName As String
                Dim lastName As String

                adap.Fill(tbl_pistol)
                adap.Dispose()

                Me.txtuser.Text = CStr(tbl_pistol.Rows(0)("EMPUSERNAME"))
                Me.txtpassword.Text = CStr(tbl_pistol.Rows(0)("EMPPASSWORD"))
                firstName = CStr(tbl_pistol.Rows(0)("FIRSTNAME"))
                lastName = CStr(tbl_pistol.Rows(0)("LASTNAME"))

                Me.lblUser.Text = firstName.ToString() & " " & lastName.ToString()

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblError.Visible = True
                Me.lblError.Text = ex.Message.ToString() & " " & "Can't retrive User Inormation. Please Contact IS."
            Finally
                pistolconn.Close()
            End Try
        End If

    End Sub

    Protected Sub btnewpassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnewpassword.Click
        Me.lblError.Visible = False
        'This function do not allow duplication of UserName+Password Combination
        ValidateUser()

    End Sub
    Sub ValidateUser()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim cmdpistol As SqlCommand = New SqlCommand("Validate_User", pistolconn)

            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtuser.Text)
            cmdpistol.Parameters.AddWithValue("@Password", Me.txtNewPassword.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            cmdpistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            adap.Fill(tbl_pistol)
            adap.Dispose()

            'If User Name  + Password combination already exists, user has to enter different Password.
            If tbl_pistol.Rows.Count > 0 Then
                Me.lblerror.Visible = True
                Me.lblError.Text = "User Name" & " " & " " & Me.txtuser.Text & " " & " And Password " & " " & Me.txtpassword.Text & " " & " already exist. Please enter another Password."
                Exit Sub
            Else
                Call UpdatePassword()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = ex.Message.ToString() & " " & "Unable to Validate  User. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub UpdatePassword()

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim sppistol As SqlCommand = New SqlCommand("Update_Password", pistolconn)

            sppistol.Parameters.AddWithValue("@empusername", Me.txtuser.Text)
            sppistol.Parameters.AddWithValue("@emppassword", Me.txtNewPassword.Text)

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()


            Me.lblSuccess.Visible = True
            Me.lblSuccess.Text = "Password has been Updated."

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblSuccess.Visible = False
            Me.lblError.Text = ex.Message.ToString() & " " & "Unapbe updatte Password. Please inform IS."
        Finally
            pistolconn.Close()
        End Try
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearFields()
    End Sub
    Sub ClearFields()
        Try
            Me.lblSuccess.Visible = False
            Me.lblError.Visible = False
            Me.txtNewPassword.Text = ""

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblSuccess.Visible = False
            Me.lblError.Text = ex.Message.ToString() & " " & "Unable to clear fields. Please inform IS."
        End Try
    End Sub
End Class
