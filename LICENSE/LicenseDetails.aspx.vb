Imports System.Data.SqlClient
Imports System.Data


Partial Class LisenseDetails
    Inherits System.Web.UI.Page
    Shared StatusNumber As Integer
    Shared OriginalIssueDate As String
    Shared OriginalMailedDate As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Me.lblUpdateDone.Visible = False


        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnupdate.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtmemberid.ClientID & _
        "').focus();return false;}} else {return true}; ")


        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
        Me.lblErrorMessage.Visible = False


        If Not Page.IsPostBack Then

            Dim sconnection As String


            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            ' Me.txtBatchNumber.Text = Session("memberid")

            Me.txtlicenseid.Text = Session("licenseid")


            Try

                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_pistollicensedetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@dcplid", Me.txtlicenseid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtlicenseid.Text = CStr(tbl_pistol.Rows(0)("dcplid"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
                Me.ddtype.DataTextField = CStr(tbl_pistol.Rows(0)("ltype"))

                'Convert DBNull 
                If tbl_pistol.Rows(0)("TempLicense") Is System.DBNull.Value Then
                    Me.ddTempOption.DataTextField = ""
                Else
                    Me.ddTempOption.DataTextField = CStr(tbl_pistol.Rows(0)("TempLicense"))
                End If


                Me.txtapplied.Text = CStr(tbl_pistol.Rows(0)("applied"))
                Me.txtBatchNumber.Text = CStr(tbl_pistol.Rows(0)("batchweek"))
                Me.txtcomments.Text = CStr(tbl_pistol.Rows(0)("comments"))
                Me.txtstatus.Text = CStr(tbl_pistol.Rows(0)("newstatus"))
                StatusNumber = tbl_pistol.Rows(0)("Status")
                Me.txtOperator.Text = CStr(tbl_pistol.Rows(0)("username"))


                'Modify Date's text boxes for Empty value (01/01/1900) Values   
                If tbl_pistol.Rows(0)("statemailed") = ("01/01/1900") Or tbl_pistol.Rows(0)("statemailed") = ("1/1/1900") Then
                    Me.txtstatemailed.Text = ""
                Else
                    Me.txtstatemailed.Text = tbl_pistol.Rows(0)("statemailed")
                End If

                If tbl_pistol.Rows(0)("statereturned") = ("01/01/1900") Or tbl_pistol.Rows(0)("statereturned") = ("1/1/1900") Then
                    Me.txtReturnedfromState.Text = ""
                Else
                    Me.txtReturnedfromState.Text = tbl_pistol.Rows(0)("statereturned")
                End If

                If tbl_pistol.Rows(0)("licenseissued") = ("01/01/1900") Or tbl_pistol.Rows(0)("licenseissued") = ("1/1/1900") Then
                    Me.txtlicenseissued.Text = ""
                    OriginalIssueDate = ""
                Else
                    Me.txtlicenseissued.Text = tbl_pistol.Rows(0)("licenseissued")
                    OriginalIssueDate = Me.txtlicenseissued.Text
                End If

                If tbl_pistol.Rows(0)("licenseexpiration") = ("01/01/1900") Or tbl_pistol.Rows(0)("licenseexpiration") = ("1/1/1900") Then
                    Me.txtlicenseexpiration.Text = ""
                Else
                    Me.txtlicenseexpiration.Text = tbl_pistol.Rows(0)("licenseexpiration")
                End If


                If tbl_pistol.Rows(0)("licensemailed") = ("01/01/1900") Or tbl_pistol.Rows(0)("licensemailed") = ("1/1/1900") Then
                    Me.txtlicensemailed.Text = ""
                    OriginalMailedDate = ""

                Else
                    Me.txtlicensemailed.Text = tbl_pistol.Rows(0)("licensemailed")
                    OriginalMailedDate = Me.txtlicensemailed.Text
                End If


                Call LicenseTypeSettingSetting()
                Call StatusColorSetting()
                Call SetHoldingBackground()

                'Get Status Name
                Session("statusName") = Me.txtstatus.Text

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Not able to Retrieve information for " & Me.lblmember.Text & "   " & ex.Message.ToString() & "  Please, contact IS."
            Finally
                pistolconn.Close()
            End Try

        End If

        If Session("Rights") = "Guest" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        ElseIf Session("Rights") = "User" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = True
        End If


    End Sub

    Sub LicenseTypeSettingSetting()

        Dim PistLicenseType As String
        PistLicenseType = Me.ddtype.DataTextField
        Try
            'For New Licesnes and Renewal License edit of License Type is allowed from this Screen. 
            'All other License type will be changed  from correspondend screens. (like Duplicate of Copy license or Revoke).

            If Me.ddtype.DataTextField = "FirstTime" Then
                'Add values for FistTime Drop Down List
                Me.ddtype.Items.Add("FirstTime")
                Me.ddtype.Items.Add("Renewal")
                Me.ddtype.Enabled = True

                'Disable ddtype Temp option if License Type is Firt Time, set value to ""
                Me.ddTempOption.Enabled = False
                Me.ddTempOption.Items.Add("")

                'In the case, if user will update License type to Renewal we have to load Temp dd list
                Me.ddTempOption.Items.Add("Yes")
                Me.ddTempOption.Items.Add("No")

                'In the case, if user will update License type to Renewal we have to load Temp dd list
                'Me.ddTempOption.Enabled = True
                'Me.ddTempOption.Items.Add("")
                'Me.ddTempOption.Items.Add("Yes")
                'Me.ddTempOption.Items.Add("No")

                'Add values for Renewal Type Drop Down List
            ElseIf Me.ddtype.DataTextField = "Renewal" Then
                Me.ddtype.Items.Add("Renewal")
                Me.ddtype.Items.Add("FirstTime")
                Me.ddtype.Enabled = True
                Me.ddTempOption.Enabled = True

                'Get existing values from DB and assign to Drop Dowon List in correspondend order
                If Me.ddTempOption.DataTextField = "Yes" Then
                    Me.ddTempOption.Items.Add("Yes")
                    Me.ddTempOption.Items.Add("No")
                    Me.ddTempOption.Items.Add("")
                ElseIf Me.ddTempOption.DataTextField = "No" Then
                    Me.ddTempOption.Items.Add("No")
                    Me.ddTempOption.Items.Add("Yes")
                    Me.ddTempOption.Items.Add("")
                End If
            Else
                'Assign value from DB
                Me.ddtype.Items.Add(PistLicenseType)
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able  to Get Type for Pistol License for " & "  " & Session("firstname") & " " & Session("lastname") & ex.Message.ToString()
        End Try
    End Sub
    Sub StatusColorSetting()
        Try
            If StatusNumber = 1 Then  'Active
                Me.txtstatus.BackColor = Drawing.Color.Yellow           
            ElseIf StatusNumber = 2 Then 'Denied
                Me.txtstatus.BackColor = Drawing.Color.Red
                'ElseIf StatusNumber = 3 Then 'Holding is not a status, its background. 
                '    Me.txtstatus.BackColor = Drawing.Color.Orange
            ElseIf StatusNumber = 4 Then 'Revoked
                Me.txtstatus.BackColor = Drawing.Color.Violet
            ElseIf StatusNumber = 5 Then 'Pending/FBI-GBI
                Me.txtstatus.BackColor = Drawing.Color.LawnGreen
            ElseIf StatusNumber = 6 Then 'Pending/Rehab
                Me.txtstatus.BackColor = Drawing.Color.SlateBlue
            ElseIf StatusNumber = 7 Then 'Pending/Dispositon
                Me.txtstatus.BackColor = Drawing.Color.Aqua
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to Get Status for Pistol License for " & "  " & Session("firstname") & " " & Session("lastname") & ex.Message.ToString()
        End Try
    End Sub
    Sub SetHoldingBackground()

        Dim sconnection As String
        Dim chkHolding As Boolean

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Validate_Background_Exist", pistolconn)

            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtlicenseid.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()


            If loadTable.Rows.Count > 0 Then
                'Record exists into PCBACKGROUND table, check value
                chkHolding = (loadTable.Rows(0)("Holding"))
                'Assign value to Holding check box
                If chkHolding = True Then
                    Me.chHld.Checked = True
                Else
                    Me.chHld.Checked = False
                End If
            Else
                'Record does not exist into PCBACKROUND table, value assign to False.
                Me.chHld.Checked = False
            End If



        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Unable to Set Holding Background. Please Contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub ClearFields()
        Try
            Me.ddtype.Items.Add("")
            Me.ddtype.SelectedValue = ""
            Me.ddTempOption.Items.Add("")
            Me.ddTempOption.SelectedValue = ""
            Me.txtlicenseissued.Text = ""
            Me.txtlicenseexpiration.Text = ""
            Me.txtcomments.Text = ""
            Me.txtlicensemailed.Text = ""
            Me.lblErrorMessage.Visible = False
            Me.lblUpdateDone.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to Clear Fields for Pistol License for " & "  " & Session("firstname") & " " & Session("lastname") & ex.Message.ToString()
        End Try
    End Sub
    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click

        Try
            'Hide Information labels before update
            Me.lblUpdateDone.Visible = False
            Me.lblErrorMessage.Visible = False

            'Temp Option exist only for Renewal License Type
            If Me.ddtype.Text = "FirstTime" And Me.ddTempOption.Text <> "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "There is no Temporary Option For FirstTime Type License. Please correct the Error."
                Exit Sub
            ElseIf Me.ddtype.Text = "Renewal" And Me.ddTempOption.Text = "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Please Select Temporary Option for Renewal License Type."
                Exit Sub
                'License type is required field
            ElseIf Me.ddtype.Text = "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Please, select License Type."
                Exit Sub
                'License could not be issued, if status NOT ACTIVE
            ElseIf StatusNumber <> 1 And Me.txtlicenseissued.Text <> "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "You can not issue license" & " " & Me.txtlicenseid.Text & ".  " & "This license has status  " & " " & Me.txtstatus.Text & " " & "and can not be issued."
                Exit Sub
                'License could not be issued, if Background is HOLDING
            ElseIf Me.chHld.Checked = True And Me.txtlicenseissued.Text <> "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "You can not issue license" & " " & Me.txtlicenseid.Text & ".  " & "Background for this license is HOLDING. Update Background to ACTIVE on Update Background Status Screen."
                Exit Sub
                'Do not allow to clear License Issue Date if License already has  been issued
            ElseIf Me.txtlicenseissued.Text = "" And OriginalIssueDate <> "" Then
                Me.txtlicenseissued.Text = OriginalIssueDate
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "You can not clear issue date for License" & "  " & Me.txtlicenseid.Text & ".  License has been already issued. You can update Issued Date, but not clear it.  "
                Exit Sub
                'Do not allow enter maildate,  if license was not issued
            ElseIf OriginalIssueDate = "" And Me.txtlicenseissued.Text = "" And Me.txtlicensemailed.Text <> "" Then
                Me.txtlicenseissued.Text = OriginalIssueDate
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "You can not Mail License" & "  " & Me.txtlicenseid.Text & ".  License has not  been issued yet."
                Exit Sub
                'Do not allow to clear License Mailed date if License already has been mailed
            ElseIf Me.txtlicensemailed.Text = "" And OriginalMailedDate <> "" Then
                Me.txtlicensemailed.Text = OriginalMailedDate
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License" & "  " & Me.txtlicenseid.Text & " has already been sent. You can update Mailed Date, but not clear it."
                Exit Sub
            Else
                Call UpdateLicense()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to call Update Functionality. Please Contact IS. "
        End Try

     


    End Sub
    Sub UpdateLicense()

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try
            Me.lblErrorMessage.Visible = False

            'Calculate Expiration Date
            Dim ExpirationDate As DateTime
            Dim sExpirationDate As String

            If Me.txtlicenseissued.Text = "" Then
                'No Issue date, that's why Epxiraton Date is empty
                sExpirationDate = ""
            Else
                'Expiration date calculating as Issue Date + 5 years.
                ExpirationDate = Me.txtlicenseissued.Text
                ExpirationDate = ExpirationDate.AddYears(5)
            End If

            Dim sppistol As SqlCommand = New SqlCommand("update_pcpistol", pistolconn)


            sppistol.Parameters.AddWithValue("@dcplid", Me.txtlicenseid.Text)
            sppistol.Parameters.AddWithValue("@Ltype", Me.ddtype.Text)
            sppistol.Parameters.AddWithValue("@TempLilcense", Me.ddTempOption.Text)
            sppistol.Parameters.AddWithValue("@applied", Me.txtapplied.Text)
            sppistol.Parameters.AddWithValue("@statemailed", Me.txtstatemailed.Text)
            sppistol.Parameters.AddWithValue("@statereturned", Me.txtReturnedfromState.Text)

            sppistol.Parameters.AddWithValue("@licenseissued", Me.txtlicenseissued.Text)

            'If Issue date has been empty, Exparatin date is empty as well and pass empty string to DB. If there is  a value  - pass Datetime value
            If Me.txtlicenseissued.Text = "" Then
                sppistol.Parameters.AddWithValue("@licenseexpiration", sExpirationDate)
            Else
                sppistol.Parameters.AddWithValue("@licenseexpiration", ExpirationDate)
            End If

            sppistol.Parameters.AddWithValue("@licensemailed", Me.txtlicensemailed.Text)
            sppistol.Parameters.AddWithValue("@comments", Me.txtcomments.Text)
            sppistol.Parameters.AddWithValue("@username", Session("username"))


            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            'Get Status Name
            Session("statusName") = Me.txtstatus.Text

            'Show Expiration date after Update is done
            If Me.txtlicenseissued.Text <> "" Then
                Me.txtlicenseexpiration.Text = ExpirationDate
            End If

            Me.lblUpdateDone.Visible = True
            Me.lblUpdateDone.Text = ("Pistol License data has been updated for:" & " " & " " & Session("firstname") & " " & Session("lastname"))


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able  to Update Pistol License for " & "  " & Session("firstname") & " " & Session("lastname") & ex.Message.ToString()
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


        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_PCPistol", pistolconn)
            find_pistol.Parameters.AddWithValue("@dcplid", Me.txtlicenseid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/grid/pistollicenselist.aspx")

        Catch ex As Exception
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to Delete Pistol License for " & "  " & Session("firstname") & " " & Session("lastname") & ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try

    End Sub


    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearFields()
    End Sub

    Protected Sub txtlicenseissued_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtlicenseissued.TextChanged

    End Sub

    Protected Sub ddtype_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddtype.TextChanged
        If ddtype.SelectedValue = "Renewal" Then
            Me.ddTempOption.Enabled = True                    
        Else
            Me.ddTempOption.Enabled = False
            'Me.ddTempOption.Items.Add("")
            Me.ddTempOption.SelectedValue = ""
        End If
    End Sub
End Class
