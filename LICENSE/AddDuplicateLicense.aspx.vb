Imports System.Data.SqlClient


Partial Class AddDuplicateLicense
    Inherits System.Web.UI.Page

    Protected Sub btndisplaced_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndisplaced.Click

        'Me.ValDateReplaced.Visible = True
        'Me.ValDateLost.Visible = True

        Try
            Dim dlost As DateTime = Convert.ToDateTime(Me.txtdatelost.Text)
            Dim dreplace As DateTime = Convert.ToDateTime(Me.txtdatereplaced.Text)

            'License could be issue only During 48 hours since lost. Otherwise, new First Time license should be issued. 
            If dreplace = dlost Or dreplace = dlost.AddHours(24) Or dreplace = dlost.AddHours(48) Then
                Me.lblErrorMessage.Visible = False
                Call AddDuplicateLicense()
                Exit Sub
            Else
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can not add Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Duplicate License can only be issued within 48 hours, since lost of Original License."
                Exit Sub
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "   " & "Unable to Add Duplicate License. Please, contact IS."
        End Try

    End Sub
    Sub AddDuplicateLicense()

        'Check Mandatory Fields
        If Me.txtLicenseStatus.Text <> "Active" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can not add Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Status not Active for License" & " " & Me.txtdcplid.Text & "is not ACTIVE."
            Exit Sub
        ElseIf Me.txtIssueDate.Text = "" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can not  add Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & "License Number " & " " & Me.txtdcplid.Text & " " & "was not Issued."
            Exit Sub

        Else

            Dim sconnection As String

            Dim a As String
            Dim b As String

            a = Me.txtmemberid.Text
            b = Me.lblmember.Text

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()
            Try

                Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcpistdp", pistolconn)

                cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
                cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
                cmdpistol.Parameters.AddWithValue("@Datelost", Me.txtdatelost.Text)
                cmdpistol.Parameters.AddWithValue("@Datereplaced", Me.txtdatereplaced.Text)
                cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
                cmdpistol.Parameters.AddWithValue("@Operator", Me.txtoperatorname.Text)

                cmdpistol.CommandType = Data.CommandType.StoredProcedure

                Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                cmdpistol.ExecuteNonQuery()

                Session("licenseid") = Me.txtdcplid.Text
                Response.Redirect("~/Grid/DuplicateLicenseList.aspx")

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can not add Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & " " & "Please, inform IS."
            Finally
                pistolconn.Close()
            End Try
        End If

    End Sub
    
    Sub clearrecord()
        Try
            Me.txtdatelost.Text = ""        
            Me.txtComments.Text = ""
           

            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't clear Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."

        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Check if session has been expired. If yes, programm redirected to login page.
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/License/LicenseDetails.aspx")
        End If

        If Not Page.IsPostBack Then
            Try

                Dim mystring As String = Session("memberid")
                Me.txtmemberid.Text = mystring

                Dim mylicense As String = Session("licenseid")
                Me.txtdcplid.Text = mylicense

                Me.txtoperatorname.Text = Session("username")

                Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

                Me.lblErrorMessage.Visible = False

                Me.txtdatereplaced.Text = Convert.ToString(Format(Now, "MM-dd-yyyy"))

                Call LoadDatesInformation()

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can't Load Infro for  Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
            End Try

        End If

        If Session("Rights") = "Guest" Then
            Me.btndisplaced.Enabled = False
        End If

    End Sub
    Sub LoadDatesInformation()
        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)
            Dim cboTbl As System.Data.DataTable = New Data.DataTable

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cmdpistol.ExecuteNonQuery()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()

            'Get date information, modify dates format, do not show 01/01/1900 value for empty values
            If CStr(cboTbl.Rows(0)("LicenseIssued")) = ("01/01/1900") Or CStr(cboTbl.Rows(0)("LicenseIssued")) = ("1/1/1900") Then
                Me.txtIssueDate.Text = ""
            Else
                Me.txtIssueDate.Text = CStr(cboTbl.Rows(0)("LicenseIssued"))
            End If


            If CStr(cboTbl.Rows(0)("LicenseExpiration")) = ("01/01/1900") Or CStr(cboTbl.Rows(0)("LicenseExpiration")) = ("1/1/1900") Then
                Me.txtExpirationDate.Text = ""
            Else
                Me.txtExpirationDate.Text = CStr(cboTbl.Rows(0)("LicenseExpiration"))
            End If

            'Get status info
            Me.txtLicenseStatus.Text = CStr(cboTbl.Rows(0)("NewStatus"))


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Load Dates Information for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ' Me.ValDateLost.Visible = False
        'Me.ValDateReplaced.Visible = False
        Call clearrecord()
    End Sub
End Class
