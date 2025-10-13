Imports System.Data.SqlClient

Partial Class MailAddressDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txtmailid.Text = a
            Me.txtmemberid.Text = Session("memberid")
            Me.lblUpdateSuccess.Visible = False
            Me.lblFailed.Visible = False


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_maildetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", Me.txtmailid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtmailid.Text = CStr(tbl_pistol.Rows(0)("id"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
                Me.txtmailaddress.Text = CStr(tbl_pistol.Rows(0)("mailaddress"))
                Me.txtcity.Text = CStr(tbl_pistol.Rows(0)("mailcity"))
                Me.txtstate.Text = CStr(tbl_pistol.Rows(0)("mailstate"))
                Me.txtzip.Text = CStr(tbl_pistol.Rows(0)("mailzip"))
                Me.chkCurrentAddress.Checked = CStr(tbl_pistol.Rows(0)("currentaddress"))
                Me.txtComment.Text = CStr(tbl_pistol.Rows(0)("Comments"))
                Me.txtUsername.Text = CStr(tbl_pistol.Rows(0)("username"))

                'If record is Current Address do not allow to clear it. To select
                'another Current Address user could select another record and check Currnet Address box. 
                If Me.chkCurrentAddress.Checked = True Then
                    Me.chkCurrentAddress.Enabled = False
                End If

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Retrieve Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
            Finally
                pistolconn.Close()
            End Try


        End If

        If Session("Rights") = "Guest" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        ElseIf Session("Rights") = "User" Then
            Me.btndelete.Enabled = True
            Me.btnupdate.Enabled = True
        End If

    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim sppistol As SqlCommand = New SqlCommand("update_pcmail", pistolconn)

            sppistol.Parameters.AddWithValue("@id", Me.txtmailid.Text)
            sppistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            sppistol.Parameters.AddWithValue("@mailaddress", Me.txtmailaddress.Text)
            sppistol.Parameters.AddWithValue("@mailcity", Me.txtcity.Text)
            sppistol.Parameters.AddWithValue("@mailstate", Me.txtstate.Text)
            sppistol.Parameters.AddWithValue("@mailzip", Me.txtzip.Text)
            sppistol.Parameters.AddWithValue("@currentaddress", Me.chkCurrentAddress.Checked)
            sppistol.Parameters.AddWithValue("@comments", Me.txtComment.Text)
            sppistol.Parameters.AddWithValue("@username", Session("username"))

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            'IRINA Revision 12 08/27/2009 start
            'Clear Failed Lable if update is sucussfull.
            Me.lblFailed.Visible = False

            'If Current Address box has been check do not allow to uncheck it after update is done. 
            If Me.chkCurrentAddress.Checked = True Then
                Me.chkCurrentAddress.Enabled = False
            End If
            'IRINA Revision 12 08/27/2009 END

            Me.lblUpdateSuccess.Visible = True
            Me.lblUpdateSuccess.Text = "Record for " & " " & Me.lblmember.Text & " " & "has been Updated."




        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Update Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Dim sconnection As String
        Dim a As String

        a = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        'Check, if this is last Mailing Address. If yes, then allow to delete record. 
        If Me.chkCurrentAddress.Checked = True Then
           
            Dim result As Integer
            result = CountMailAddress()
            'If there is more then one Mailing Addresses, and this is current program does not allow to delete it. User should 
            'Manually update Current address for another record. 
            If result > 1 Then
                Me.lblUpdateSuccess.Visible = False 'Revision 12 IRINA 08/27/2009
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "This is Current Mailing Address for Member " & "  " & Me.lblmember.Text & " " & "Please, select another  Current Mail address, and then delete this record."
                Exit Sub
            End If
        End If

        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcmail", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txtmailid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/GRID/mailinglist.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Delete Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Function CountMailAddress() As Integer

        Dim numberRecord As Integer
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("sel_mailinghistory", pistolconn)
            find_pistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)

            'Check how many Mailing Address for given Member
            numberRecord = tbl_pistol.Rows.Count

            Return numberRecord

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To retrive number of Mail Records." & ".  " & "Please, inform IS. "
        Finally
            pistolconn.Close()
        End Try

    End Function
    Sub ClearFields()
        Try
            Me.txtmailaddress.Text = ""
            Me.txtcity.Text = ""
            Me.txtzip.Text = ""
            Me.txtstate.Text = ""
            Me.txtComment.Text = ""
            Me.lblUpdateSuccess.Visible = False
            Me.lblFailed.Visible = False
            Me.chkCurrentAddress.Checked = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Unable Clear Fields. Please, contact IS."
        End Try
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearFields()
    End Sub

    Protected Sub chkCurrentAddress_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkCurrentAddress.CheckedChanged
        'If Me.chkCurrentAddress.Checked = False Then
        '    Me.lblFailed.Visible = True
        '    Me.lblFailed.Text = "This is current Mailing Address for Member " & "  " & Me.lblmember.Text & " " & "If you want to select another  Cureent Mail address, please go to Mail History Screen, select needed record and check Current Address Check box.  "
        '    Me.chkCurrentAddress.Checked = True
        'End If
    End Sub
End Class
