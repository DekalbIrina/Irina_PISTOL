Imports System.Data.SqlClient

Partial Class BatchDetails
    Inherits System.Web.UI.Page
    Shared OriginalReturnedDate As String
    Shared ReturnedDateUpdated As Boolean
    Shared OriginalLicenseIssueDate As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnupdate.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtbatchtype.ClientID & _
        "').focus();return false;}} else {return true}; ")

        Me.lblFailed.Visible = False

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("transid")
            Me.lblFailed.Visible = False

            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_batchdetails", pistolconn)

                find_pistol.Parameters.AddWithValue("@transid", a)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)
                adap.Dispose()

                Me.txttransid.Text = CStr(tbl_pistol.Rows(0)("transid"))
                Me.txtbatchnumber.Text = CStr(tbl_pistol.Rows(0)("batchnumber"))
                Me.txtbatchdate.Text = CStr(tbl_pistol.Rows(0)("batchdate"))

                Me.txtformsent.Text = CStr(tbl_pistol.Rows(0)("formssent"))
                Me.txtcheckamount.Text = CStr(tbl_pistol.Rows(0)("checkamount"))

                Me.txtformsreturned.Text = CStr(tbl_pistol.Rows(0)("formsreturned"))
                Me.txtbatchtype.Text = CStr(tbl_pistol.Rows(0)("batchtype"))
                Me.txtcheckpayable.Text = CStr(tbl_pistol.Rows(0)("checkpayable"))
                Me.txtcheckrecievable.Text = CStr(tbl_pistol.Rows(0)("checkreceivable"))
                Me.txtSupervisorApproving.Text = CStr(tbl_pistol.Rows(0)("SupervisorApproving"))
                Me.txtcashiersname.Text = CStr(tbl_pistol.Rows(0)("cashiersname"))
                Me.txtchecknumber.Text = CStr(tbl_pistol.Rows(0)("checknumber"))

                Me.txtOperator.Text = CStr(tbl_pistol.Rows(0)("username"))

                '  Call RetrieveLicenseIssueDate()

                ' Call SelectFormSentAndAmount()

                'Modify Date's text boxes for Empty value (01/01/1900) Values 
                If tbl_pistol.Rows(0)("DateofRequest") = ("01/01/1900") Or tbl_pistol.Rows(0)("DateofRequest") = ("1/1/1900") Then
                    Me.txtdateofrequest.Text = ""
                Else
                    Me.txtdateofrequest.Text = CStr(tbl_pistol.Rows(0)("DateofRequest"))
                End If

                If tbl_pistol.Rows(0)("dateofapproval") = ("01/01/1900") Or tbl_pistol.Rows(0)("dateofapproval") = ("1/1/1900") Then
                    Me.txtdateofapproval.Text = ""
                Else
                    Me.txtdateofapproval.Text = CStr(tbl_pistol.Rows(0)("dateofapproval"))
                End If


                'NOTE: I did not use calendar for this field. If this field is not empty, it should be read only. If there is a calendar, I was not able to make this field Read Only. 
                If tbl_pistol.Rows(0)("MailedDate") = ("01/01/1900") Or tbl_pistol.Rows(0)("MailedDate") = ("1/1/1900") Then
                    Me.txtmaileddate.Text = ""

                Else
                    'If Mailed Date is not empty, that's mean, that Batch was sent to Mental Health Department.   
                    Me.txtmaileddate.Text = CStr(tbl_pistol.Rows(0)("MailedDate"))
                    'Date should not be updated.
                    Me.txtmaileddate.ReadOnly = True
                    Me.txtmaileddate.BackColor = Drawing.Color.LightYellow
                    Me.txtmaileddate.Font.Bold = True
                End If

                If tbl_pistol.Rows(0)("ReturnDate") = ("01/01/1900") Or tbl_pistol.Rows(0)("ReturnDate") = ("1/1/1900") Then
                    Me.txtreturndate.Text = ""
                    OriginalReturnedDate = ""
                Else
                    Me.txtreturndate.Text = CStr(tbl_pistol.Rows(0)("ReturnDate"))
                    OriginalReturnedDate = Me.txtreturndate.Text
                End If


                If tbl_pistol.Rows(0)("IssueLicenseDate") = ("01/01/1900") Or tbl_pistol.Rows(0)("IssueLicenseDate") = ("1/1/1900") Then
                    Me.txtLicenseIssued.Text = ""
                    OriginalLicenseIssueDate = ""
                Else
                    Me.txtLicenseIssued.Text = CStr(tbl_pistol.Rows(0)("IssueLicenseDate"))
                    OriginalLicenseIssueDate = Me.txtLicenseIssued.Text
                End If

                If tbl_pistol.Rows(0)("ExpirationLicenseDate") = ("01/01/1900") Or tbl_pistol.Rows(0)("ExpirationLicenseDate") = ("1/1/1900") Then
                    Me.txtLicensExparation.Text = ""
                Else
                    Me.txtLicensExparation.Text = CStr(tbl_pistol.Rows(0)("ExpirationLicenseDate"))
                End If


            Catch ex As Exception
                ex.Message.ToString()

                Me.lblFailed.Visible = True
                Me.lblFailed.Text = ex.Message.ToString() & "YOU ARE NOT ABLE TO SELECT BATCH NUMBER   " & Me.txtbatchnumber.Text & "  " & "PLEASE CONTACT INFORMATION SYSTEM ABOUT THIS ERROR."

            Finally
                pistolconn.Close()
            End Try
        End If


    End Sub
    'I DONT USE THIS FUNCTION ANYMORE. Check Amount and number of forms calculated during add/delete Licenses and Members. 
    Sub SelectFormSentAndAmount()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("sel_batchwaivers", pistolconn)
            Dim Batchyear As String
            Dim sYear As String

            sYear = Me.txtbatchdate.Text

            Batchyear = Me.txtbatchdate.Text.Substring(sYear.Length - 4, 4)

            find_pistol.Parameters.AddWithValue("@batchweek", Me.txtbatchnumber.Text)
            find_pistol.Parameters.AddWithValue("@batchyear", Batchyear)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)
            adap.Dispose()

            Me.txtformsent.Text = CStr(tbl_pistol.Rows(0)("Licensecount"))
            Me.txtcheckamount.Text = (Convert.ToInt32(Me.txtformsent.Text) * 3)

        Catch ex As Exception
            ex.Message.ToString()

            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "YOU ARE NOT ABLE TO CALCULATE AMOUNT FOR    " & Me.txtbatchnumber.Text & "  " & "PLEASE CONTACT INFORMATION SYSTEM ABOUT THIS ERROR."

        Finally
            pistolconn.Close()
        End Try


    End Sub


    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click

        Try

            'Do not clear ReturnedDate, if it was save into the Data Base previously. Status was updated. To save integrity, this date could not be empty, once udpated.
            If Me.txtreturndate.Text = "" Then
                If OriginalReturnedDate <> "" Then
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Batch Returned Date for this Batch could not be cleared. The Date already was issued and Status for all licenses for this batch have been updated. Please, enter Return Date."
                    ReturnedDateUpdated = False
                    Me.lblUpdateDone.Visible = False
                    Me.txtreturndate.Text = OriginalReturnedDate
                    Exit Sub
                End If
            End If
            'Do not clear License Issue date, if it was saved in DB Previously. It could be done manually on License Portal.
            If Me.txtLicenseIssued.Text = "" Then
                If OriginalLicenseIssueDate <> "" Then
                    Me.lblUpdateDone.Visible = False
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "License Issue Date for this Batch could not be cleared. The Date was issued and  all licenses for this batch have been updated. Please, enter License Issue Date. You are able to update License Issue Date manually for each License on the License Portal Screen."
                    Me.txtLicenseIssued.Text = OriginalLicenseIssueDate
                    Exit Sub
                End If
            End If

            'Do not allow to enter Return Date if Mailded date is empty
            If Me.txtmaileddate.Text = "" And Me.txtreturndate.Text <> "" Then
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Batch Number " & Me.txtbatchnumber.Text & " " & "was not sent to  Mental Health Department. Returned date could not be entered."
                Exit Sub
            End If

            'Do not allow update License Issue Date if Batch was not returned from Health Department
            If Me.txtreturndate.Text = "" And Me.txtLicenseIssued.Text <> "" Then
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Batch Number " & Me.txtbatchnumber.Text & " " & "was not approved at Mental Health Department. Licenses could not be issued."
                Exit Sub
            End If

            Call UpdateBatch()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Can''t Update Batch Number " & " " & Me.txtbatchnumber.Text & " " & "Please Inform IS."
        End Try


    End Sub

    Sub UpdateBatch()
        Dim sconnection As String
        Dim a As String

        a = Me.txtbatchnumber.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try
            Dim sppistol As SqlCommand = New SqlCommand("update_batchmaster", pistolconn)
            Dim BatchYear As String = Convert.ToDateTime(Me.txtbatchdate.Text).Year

            Dim ExpirationDate As DateTime
            Dim sExpirationDate As String

            'Set up Expiration Date. 
            If Me.txtLicenseIssued.Text = "" Then
                'No Issue date, that's why Epxiraton Date is empty
                sExpirationDate = ""
            Else
                'Expiration date calculating as Issue Date + 5 years.
                ExpirationDate = Me.txtLicenseIssued.Text
                ExpirationDate = ExpirationDate.AddYears(5)
            End If

            sppistol.Parameters.AddWithValue("@TransID", Me.txttransid.Text)
            sppistol.Parameters.AddWithValue("@BatchNumber", Me.txtbatchnumber.Text)
            sppistol.Parameters.AddWithValue("@BatchYear", BatchYear)
            sppistol.Parameters.AddWithValue("@MailedDate", Me.txtmaileddate.Text)
            sppistol.Parameters.AddWithValue("@ReturnDate", Me.txtreturndate.Text)
            sppistol.Parameters.AddWithValue("@FormsSent", Me.txtformsent.Text)
            sppistol.Parameters.AddWithValue("@Formsreturned", Me.txtformsreturned.Text)
            sppistol.Parameters.AddWithValue("@Batchtype", Me.txtbatchtype.Text)
            sppistol.Parameters.AddWithValue("@checkpayable", Me.txtcheckpayable.Text)
            sppistol.Parameters.AddWithValue("@Checkreceivable", Me.txtcheckrecievable.Text)
            sppistol.Parameters.AddWithValue("@Dateofrequest", Me.txtdateofrequest.Text)
            sppistol.Parameters.AddWithValue("@SupervisorApproving", Me.txtSupervisorApproving.Text)
            sppistol.Parameters.AddWithValue("@DateofApproval", Me.txtdateofapproval.Text)
            sppistol.Parameters.AddWithValue("@CashiersName", Me.txtcashiersname.Text)
            sppistol.Parameters.AddWithValue("@CheckNumber", Me.txtchecknumber.Text)
            sppistol.Parameters.AddWithValue("@CheckAmount", Val(Me.txtcheckamount.Text))
            sppistol.Parameters.AddWithValue("@username", Session("username"))
            sppistol.Parameters.AddWithValue("@ReturnedDateUpdated", ReturnedDateUpdated) 'If this flag is True, SP will update Status of all applications for this week. 
            sppistol.Parameters.AddWithValue("@LicenseIssued", Me.txtLicenseIssued.Text)

            If Me.txtLicenseIssued.Text = "" Then
                sppistol.Parameters.AddWithValue("@LicenseExpiration", sExpirationDate)
            Else
                sppistol.Parameters.AddWithValue("@LicenseExpiration", ExpirationDate)
            End If


            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            If Me.txtLicenseIssued.Text <> "" Then
                Me.txtLicensExparation.Text = ExpirationDate
            End If

            Me.lblUpdateDone.Visible = True
            Me.lblUpdateDone.Text = "Batch Number" & " " & Me.txtbatchnumber.Text & " " & "has been Updated."

            'Do not allow delete the Return date after updating, becouse all lisenses status will be updated already.  To update this field user should reopen the page. 
            If Me.txtreturndate.Text <> "" Then
                Me.txtreturndate.Enabled = False
                Me.txtreturndate.BackColor = Drawing.Color.Yellow
                Me.txtreturndate.Font.Bold = True
            End If

            'Response.Redirect("~/grid/BatchMasterlist.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ("BATCH NUMBER  " & a & "   WAS NOT UPDATED." & " " & ex.Message.ToString())
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub btnbatchentries_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnbatchentries.Click

        Dim sYear As String

        sYear = Convert.ToDateTime(Me.txtbatchdate.Text).Year
        Session("yearbatch") = sYear
        Session("weekbatch") = Me.txtbatchnumber.Text
        Response.Redirect("BatchEntries.aspx")


    End Sub

    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        'I disable DELETE button. There is no sence to delete any batch. If we will decide to delete batch, SP should
        'be created to check if any entry exist for Deleted Batch. 
        Dim sconnection As String


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_batchmaster", pistolconn)
            find_pistol.Parameters.AddWithValue("@transid", Me.txttransid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/Grid/batchmasterlist.aspx")


        Catch ex As Exception
            ex.Message.ToString()
            clearrecord()
            Me.txtbatchdate.BackColor = Drawing.Color.Red
            Me.txtbatchnumber.BackColor = Drawing.Color.Red
            Response.Write("BATCH NUMBER  " & Me.txtbatchnumber.Text & "   WAS NOT DELETED. PLEASE CONTACT INFORMATION SYSTEM.")
            Response.Write(ex.Message.ToString())
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Private Sub clearrecord()
        Try
            Me.txtformsent.Text = ""
            Me.txtbatchtype.Text = ""
            Me.txtcheckpayable.Text = ""
            Me.txtcheckrecievable.Text = ""
            Me.txtdateofrequest.Text = ""
            Me.txtSupervisorApproving.Text = ""
            Me.txtdateofapproval.Text = ""
            Me.txtcashiersname.Text = ""
            Me.txtchecknumber.Text = ""
            Me.txtcheckamount.Text = ""
            Me.txtmaileddate.Text = ""
            Me.txtreturndate.Text = ""
            Me.txtLicenseIssued.Text = ""
            Me.txtLicensExparation.Text = ""
            Me.lblFailed.Visible = False
            Me.lblUpdateDone.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
        End Try

    End Sub

    Protected Sub txtCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        clearrecord()
    End Sub

    Protected Sub txtreturndate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtreturndate.TextChanged
        'Send this flag to Store Procudure. If this flag is True, SP will update Status of all applications
        ReturnedDateUpdated = True
    End Sub

End Class
