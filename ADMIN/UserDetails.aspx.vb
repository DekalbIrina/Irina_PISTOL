Imports System.Data.SqlClient
Partial Class UserDetails
    Inherits System.Web.UI.Page


    Sub ClearFields()
        Try
            Me.txtdateadded.Text = ""
            Me.txtfirstname.Text = ""
            Me.txtjobtitle.Text = ""
            Me.txtlastname.Text = ""


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

            Call RetriveUser()
            Me.lblUserLastandFistName.Text = Me.txtlastname.Text & " " & Me.txtfirstname.Text

        End If


    End Sub
    Sub RetriveUser()
        Dim sconnection As String
        Dim userId As String

        userId = Me.Request.QueryString("userid")

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("Select_UserDetails", pistolconn)
            find_pistol.Parameters.AddWithValue("@userID", userId)


            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)
            adap.Dispose()

            Me.txtUserID.Text = CStr(tbl_pistol.Rows(0)("UserID"))
            Me.txtlastname.Text = CStr(tbl_pistol.Rows(0)("LastName"))
            Me.txtfirstname.Text = CStr(tbl_pistol.Rows(0)("FirstName"))
            Me.txtjobtitle.Text = CStr(tbl_pistol.Rows(0)("JobTitle"))
            Me.txtusername.Text = CStr(tbl_pistol.Rows(0)("EmpUserName"))
            Me.ddpermissions.SelectedValue = CStr(tbl_pistol.Rows(0)("EmpPermissions"))
            Me.txtdateadded.Text = CStr(tbl_pistol.Rows(0)("DateAdded"))
            Me.chksworn.Checked = CStr(tbl_pistol.Rows(0)("Sworn"))
            Me.txtComments.Text = CStr(tbl_pistol.Rows(0)("Comments"))
            Me.txtOperator.Text = CStr(tbl_pistol.Rows(0)("Username"))


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = ex.Message.ToString() & " " & "Unable to Retrive information. Please call IS."

        Finally
            pistolconn.Close()
        End Try
    End Sub
    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearFields()
    End Sub

    Protected Sub btnUpdateUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateUser.Click

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Update_UserDetails", pistolconn)

            cmdpistol.Parameters.AddWithValue("@UserID", Me.txtUserID.Text)
            cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
            cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)
            cmdpistol.Parameters.AddWithValue("@empusername", Me.txtusername.Text)
            cmdpistol.Parameters.AddWithValue("@emppermissions", Me.ddpermissions.Text)
            cmdpistol.Parameters.AddWithValue("@jobtitle", Me.txtjobtitle.Text)
            cmdpistol.Parameters.AddWithValue("@sworn", Me.chksworn.Checked)
            cmdpistol.Parameters.AddWithValue("@dateadded", Me.txtdateadded.Text)
            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            cmdpistol.ExecuteNonQuery().ToString()

            Me.lblSuccess.Visible = True
            Me.lblSuccess.Text = "User" & " " & Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & "has been updated."

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = ex.Message.ToString() & " " & "Unable Update User " & " " & Me.lblUserLastandFistName.Text
        Finally
            pistolconn.Close()
        End Try
    End Sub

    Protected Sub btnDeleteUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteUser.Click
        Dim sconnection As String
        Dim userId As String

        userId = Me.Request.QueryString("userid")

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Delete_PCUser", pistolconn)

            cmdpistol.Parameters.AddWithValue("@UserID", Me.txtUserID.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            cmdpistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/GRID/UserList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblerror.Visible = True
            Me.lblerror.Text = ex.Message.ToString() & " " & "Unable to Delete user. Please call IS."

        Finally
            pistolconn.Close()
        End Try

    End Sub
End Class
