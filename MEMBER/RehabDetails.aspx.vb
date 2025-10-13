Imports System.Data.SqlClient
Imports System.Data

Partial Class ArrestDetails
    Inherits System.Web.UI.Page
    Shared OriginalLetterDate As String
    Shared OriginalCheckBoxChecked As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If


        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
        Me.lblFailed.Visible = False
        Me.lblUpdateSuccess.Visible = False

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txtrehabtid.Text = a
            Me.txtmemberid.Text = Session("memberid")


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_rehabdetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", Me.txtrehabtid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtrehabtid.Text = CStr(tbl_pistol.Rows(0)("id"))
                Me.txtLicenseNum.Text = CStr(tbl_pistol.Rows(0)("DCPLID"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
                Me.txthospitalname.Text = CStr(tbl_pistol.Rows(0)("hospitalname"))
                Me.txtaddress.Text = CStr(tbl_pistol.Rows(0)("address"))
                Me.txtdoctorsfirstname.Text = CStr(tbl_pistol.Rows(0)("DoctorsFirstname"))
                Me.txtdoctorslastname.Text = CStr(tbl_pistol.Rows(0)("Doctorslastname"))
                Me.txtphonenumber.Text = CStr(tbl_pistol.Rows(0)("phonenumber"))
                Me.txtrehab.Text = CStr(tbl_pistol.Rows(0)("rehabdesc"))
                Me.txtemail.Text = CStr(tbl_pistol.Rows(0)("Email"))


                Me.txtcity.Text = CStr(tbl_pistol.Rows(0)("city"))
                Me.txtstate.Text = CStr(tbl_pistol.Rows(0)("state"))
                Me.txtzip.Text = CStr(tbl_pistol.Rows(0)("zip"))

                Me.chkBoxRehabCleared.Checked = CStr(tbl_pistol.Rows(0)("RehabCleared"))
                Me.txtUserName.Text = CStr(tbl_pistol.Rows(0)("userName"))

                'Modify Empty Fields
                If tbl_pistol.Rows(0)("Hospitalletter") = ("01/01/1900") Or tbl_pistol.Rows(0)("Hospitalletter") = ("1/1/1900") Then
                    Me.txtLetterMailed.Text = ""
                    OriginalLetterDate = ""
                Else
                    Me.txtLetterMailed.Text = CStr(tbl_pistol.Rows(0)("Hospitalletter"))
                    OriginalLetterDate = Me.txtLetterMailed.Text
                End If


                If tbl_pistol.Rows(0)("DateFrom") = ("01/01/1900") Or tbl_pistol.Rows(0)("DateFrom") = ("1/1/1900") Then
                    Me.txtdatefrom.Text = ""
                Else
                    Me.txtdatefrom.Text = CStr(tbl_pistol.Rows(0)("DateFrom"))
                End If

                If tbl_pistol.Rows(0)("DateFrom") = ("01/01/1900") Or tbl_pistol.Rows(0)("DateFrom") = ("1/1/1900") Then
                    Me.txtdatefrom.Text = ""
                Else
                    Me.txtdatefrom.Text = CStr(tbl_pistol.Rows(0)("DateFrom"))
                End If

                If tbl_pistol.Rows(0)("Dateto") = ("01/01/1900") Or tbl_pistol.Rows(0)("Dateto") = ("1/1/1900") Then
                    Me.txtdateto.Text = ""
                Else
                    Me.txtdateto.Text = CStr(tbl_pistol.Rows(0)("Dateto"))
                End If

                'If Record was Cleared, do not allow to update it. 
                If Me.chkBoxRehabCleared.Checked = True Then
                    Me.chkBoxRehabCleared.Enabled = False
                    OriginalCheckBoxChecked = True
                Else
                    'Record was not cleared yet. 
                    OriginalCheckBoxChecked = False
                End If

                'Get the status of License         
                Dim loadTable As DataTable
                Dim result As Integer

                loadTable = Validate_LicenseStatus()
                result = loadTable.Rows(0)("Status")

                'Do not allow to update or Delete Rehab for Active License. If there is an arrest for Active license, license could be revoked or denied. 
                If result = 1 Then
                    ' Status is Active
                    Me.btnupdate.Enabled = False
                    Me.btndelete.Enabled = False
                    Me.btnCuncel.Enabled = False
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "License Number " & " " & Me.txtLicenseNum.Text & " " & "has ACTIVE status. You can not Update or Delete Rehab Record for License with ACTIVE Status. "
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
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        End If

    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
        Try
            Dim ReturnedFromMHD As Boolean
            Dim loadTable As DataTable

            'Set Returned Flag to TRUE
            ReturnedFromMHD = True

            'Get Returned Date
            loadTable = Validate_LicenseStatus()

            'If Batch was not returned from Mental Healt Deparment, then set flag to False
            If loadTable.Rows(0)("StateReturned") = ("01/01/1900") Or loadTable.Rows(0)("StateReturned") = ("1/1/1900") Then
                ReturnedFromMHD = False
            End If

            'User just cleared this record right now but Batch was not returned from Mental Health. Do not allow clear Rehab Record, till Batch will not return from MHD. If record was enterd by mistake, wait for batch return and clear/delete record. 
            If OriginalCheckBoxChecked = False And Me.chkBoxRehabCleared.Checked = True And ReturnedFromMHD = False Then
                Me.chkBoxRehabCleared.Checked = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Pistol License " & "  " & Me.txtLicenseNum.Text & " " & "has been assigned to Batch #" & " " & loadTable.Rows(0)("BatchWeek") & ".  " & "This Batch has not been Returned from Mental Health Department yet. Update Batch Return Date on 'Update Batch Detail Screen' and then you can clear Rehab Record for this Pistol License. "
                Exit Sub
                'Do not allow to clear Letter Mailed Date. When lettes has been mailed, this update PCBACKGROUDN.HOSPITALLETTER field. Date could be updated, not deleted. 
            ElseIf Me.txtLetterMailed.Text = "" And OriginalLetterDate <> "" Then
                Me.txtLetterMailed.Text = OriginalLetterDate
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "You can not clear Letter Mailed date for License" & "  " & Me.txtLicenseNum.Text & ".  If Letter was already sent, you can update Letter Mailed Date, but not clear it.  "
                Exit Sub
            Else
                Call UpdateRehab()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Update Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        End Try

    End Sub
    Function Validate_LicenseStatus() As DataTable

        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)


            cmdpistol.Parameters.AddWithValue("@MemberId", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtLicenseNum.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            Return loadTable

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Not able to get License Status. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Function

    Protected Sub UpdateRehab()
        Try
            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim sppistol As SqlCommand = New SqlCommand("update_pcrehab", pistolconn)

            sppistol.Parameters.AddWithValue("@id", Me.txtrehabtid.Text)
            sppistol.Parameters.AddWithValue("@hospitalname", Me.txthospitalname.Text)
            sppistol.Parameters.AddWithValue("@address", Me.txtaddress.Text)
            sppistol.Parameters.AddWithValue("@city", Me.txtcity.Text)
            sppistol.Parameters.AddWithValue("@state", Me.txtstate.Text)
            sppistol.Parameters.AddWithValue("@zip", Me.txtzip.Text)
            sppistol.Parameters.AddWithValue("@doctorsfirstname", Me.txtdoctorsfirstname.Text)
            sppistol.Parameters.AddWithValue("@doctorslastname", Me.txtdoctorslastname.Text)
            sppistol.Parameters.AddWithValue("@phonenumber", Me.txtphonenumber.Text)
            sppistol.Parameters.AddWithValue("@email", Me.txtemail.Text)
            sppistol.Parameters.AddWithValue("@rehabdesc", Me.txtrehab.Text)
            sppistol.Parameters.AddWithValue("@datefrom", Me.txtdatefrom.Text)
            sppistol.Parameters.AddWithValue("@dateto", Me.txtdateto.Text)
            sppistol.Parameters.AddWithValue("@Hospitalletter", Me.txtLetterMailed.Text)
            sppistol.Parameters.AddWithValue("@RehabCleared", Me.chkBoxRehabCleared.Checked)

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            'Do not allow to clear this value after updating. Otherwise, user could uncheck it after updating.                        
            If chkBoxRehabCleared.Checked = True Then
                Me.chkBoxRehabCleared.Enabled = False
            End If

            Me.lblUpdateSuccess.Visible = True
            Me.lblUpdateSuccess.Text = ("Rehab data has been updated for:" & " " & " " & Session("firstname") & " " & Session("lastname"))

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Update Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        End Try

    End Sub
    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Try
            Dim ReturnedFromMHD As Boolean
            Dim loadTable As DataTable

            'Set Returned Flag to TRUE
            ReturnedFromMHD = True

            'Get Returned Date
            loadTable = Validate_LicenseStatus()

            'Batch was not returned from Mental Healt Deparment, set flag to False
            If loadTable.Rows(0)("StateReturned") = ("01/01/1900") Or loadTable.Rows(0)("StateReturned") = ("1/1/1900") Then
                ReturnedFromMHD = False
            End If

            'Check for Returned Date. If Batch was not returned from Mental Health do not delete Rehab Rerocd. Reason: We don't know the result yet. If record was entered by mistake, wait till Batch returned from MHD and Delete/Clear it
            If ReturnedFromMHD = False Then
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Pistol License " & "  " & Me.txtLicenseNum.Text & " " & "has been assigned to Batch #" & " " & loadTable.Rows(0)("BatchWeek") & ".  " & "This Batch has not been Returned from Mental Health Department yet. Update Batch Return Date on 'Update Batch Detail Screen' and then you can Delete Rehab Record for this Pistol License. "
                Exit Sub
            Else
                Call DeleteRehab()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Delete Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        End Try

    End Sub

    Protected Sub DeleteRehab()
        Dim sconnection As String
        Dim a As String

        a = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcrehab", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txtrehabtid.Text)
            find_pistol.Parameters.AddWithValue("@DCPLID", Me.txtLicenseNum.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/grid/rehablist.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "Not Able To Delete Record for " & " " & Me.lblmember.Text & ".  " & "Please, inform IS. "
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub ClearedFields()

        Try
            Me.txtaddress.Text = ""
            Me.txtdatefrom.Text = ""
            Me.txtdateto.Text = ""
            Me.txtdoctorsfirstname.Text = ""
            Me.txtdoctorslastname.Text = ""
            Me.txtemail.Text = ""
            Me.txthospitalname.Text = ""
            Me.txtLetterMailed.Text = ""
            Me.txtcity.Text = ""
            Me.txtzip.Text = ""

            Me.txtphonenumber.Text = ""
            Me.txtstate.Text = ""
            Me.txtrehab.Text = ""
            Me.txtstate.Text = ""
            'Me.chkBoxRehabCleared.Checked = False
            Me.lblFailed.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
        End Try


    End Sub

    Protected Sub Menu1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Menu1.Load
        Session("rehabID") = Me.txtrehabtid.Text
    End Sub

    Protected Sub btnCuncel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCuncel.Click
        Call ClearedFields()
    End Sub
End Class
