Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page

    
    Public Sub btnlogon_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogon.Click

        Dim sconnection As String
        Dim UserNameTwo As String 'Variable to store Session user Name


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_logon", pistolconn)

            cmdpistol.Parameters.AddWithValue("@empusername", Me.txtuser.Text)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)

            'Check if this user in DB
            If pistol_data.Rows.Count > 0 Then
                'Validate Password
                If Me.txtpassword.Text = (pistol_data.Rows(0)("emppassword")) Then
                    'Get User Rigths
                    Session("Rights") = CStr(pistol_data.Rows(0)("emppermissions"))

                    'Get User Name from Session Variable. This value will be retrieve from any page. 
                    UserNameTwo = Me.txtuser.Text
                    Session("username") = UserNameTwo

                    Session("Welcome") = CStr(pistol_data.Rows(0)("lastname") & ", " & CStr(pistol_data.Rows(0)("firstname")))
                    Response.Redirect("pistollicense.aspx")

                Else
                    Me.lblError.Visible = True
                    Me.lblError.Text = "Password is Invalid. Please try again."
                    Me.txtpassword.Text = ""
                End If
            Else
                Me.lblError.Visible = True
                Me.lblError.Text = "User ID is Invalid. Please try again."
                Me.txtpassword.Text = ""
            End If

            'Session("Welcome") = CStr(pistol_data.Rows(0)("lastname") & ", " & CStr(pistol_data.Rows(0)("firstname")))

            'Session("Rights") = CStr(pistol_data.Rows(0)("emppermissions"))


            ''Get User Name from Session Variable. This value will be retrieve from any page. 
            'UserNameTwo = Me.txtuser.Text
            'Session("username") = UserNameTwo


            'If Me.txtpassword.Text = (pistol_data.Rows(0)("emppassword")) Then
            '    Response.Redirect("pistollicense.aspx")
            'Else
            '    If Me.txtpassword.Text <> (pistol_data.Rows(0)("emppassword")) Then
            '        'Me.lblinvalidpassword.Visible = True
            '        Me.lblError.Visible = True
            '        Me.lblError.Text = "User ID or Password is Invalid. Please try again."
            '        Me.txtpassword.Text = ""
            '    End If
            'End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & " " & "Please, inform IS."
        End Try
    End Sub

    
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnlogon.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtuser.ClientID & _
        "').focus();return false;}} else {return true}; ")

    End Sub
End Class
