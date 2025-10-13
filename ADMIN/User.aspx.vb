Imports System.Data.SqlClient
Partial Class AddUser
    Inherits System.Web.UI.Page

    Protected Sub Btnaddcategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnaddUser.Click
        Me.lblerror.Visible = False
        Call ValidateUser()
    End Sub

    Sub ValidateUser()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim cmdpistol As SqlCommand = New SqlCommand("Validate_User", pistolconn)

            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtusername.Text)
            cmdpistol.Parameters.AddWithValue("@Password", Me.txtusername.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            cmdpistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            adap.Fill(tbl_pistol)

            If tbl_pistol.Rows.Count > 0 Then
                Me.lblerror.Visible = True
                Me.lblerror.Text = "User Name" & " " & " " & Me.txtusername.Text & " " & " And Password " & " " & Me.txtusername.Text & " " & " already exist. Please enter another User Name."
                Exit Sub
            Else
                Call AddUser()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = ex.Message.ToString() & " " & "Unable to Validate  User. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub AddUser()
        Dim a As String

        a = Me.txtfirstname.Text

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcuser", pistolconn)

            cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
            cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)
            cmdpistol.Parameters.AddWithValue("@empusername", Me.txtusername.Text)
            cmdpistol.Parameters.AddWithValue("@emppassword", Me.txtusername.Text)
            cmdpistol.Parameters.AddWithValue("@emppermissions", Me.ddpermissions.Text)
            cmdpistol.Parameters.AddWithValue("@jobtitle", Me.txtjobtitle.Text)
            cmdpistol.Parameters.AddWithValue("@sworn", Me.chksworn.Checked)
            cmdpistol.Parameters.AddWithValue("@dateadded", Me.txtdateadded.Text)
            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()
            Response.Redirect("~/GRID/UserList.aspx")
            'Me.lblSuccess.Visible = True
            'Me.lblSuccess.Text = "User is successfuly added to Data Base."


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = "Unable to Add User. Please call IS." & " " & ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try
    End Sub
    Sub ClearFields()
        Try
            Me.txtdateadded.Text = ""
            Me.txtfirstname.Text = ""
            Me.txtjobtitle.Text = ""
            Me.txtlastname.Text = ""

            Me.txtusername.Text = ""
            Me.ddpermissions.Items.Add("")
            Me.ddpermissions.SelectedValue = ""
            Me.lblerror.Visible = False
            Me.lblSuccess.Visible = False
            Me.chksworn.Checked = False
            Me.txtComments.Text = ""

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = "Unable to clear Fields. Please call IS." & " " & ex.Message.ToString()
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") <> "Admin" Then
            Response.Redirect("~/pistollicense.aspx")
        End If

        Me.txtOperator.Text = Session("username")

        If Not Page.IsPostBack Then
            Me.lblerror.Visible = False
            Me.lblSuccess.Visible = False
        End If

   
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearFields()
    End Sub
End Class
