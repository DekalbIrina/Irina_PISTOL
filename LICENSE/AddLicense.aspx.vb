Imports System.Data.SqlClient
Imports System.Globalization.CultureInfo


Partial Class AddLicense
    Inherits System.Web.UI.Page

    Private Sub ClearRecord()

        Me.txtstatemailed.Text = ""
        Me.txtcomments.Text = ""
        Me.ddtype.SelectedValue = ""
        Me.ddTempOption.SelectedValue = ""
        Me.ddTempOption.Enabled = True
        Me.lblErrorMessage.Visible = False


    End Sub

    Protected Sub btnnewlicense_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewlicense.Click

        Dim sconnection As String
        Dim PCLisenseReturn As String

        PCLisenseReturn = ""


        'Temp Option exist only for Renewal License Type
        If Me.ddtype.Text = "FirstTime" And Me.ddTempOption.Text <> "" Then
            'IRINA. I DO NOT USE THIS PART OF CODE, now temp option shown only if type is Renewal
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "There is no Temporary Option For FirstTime Type License. Please correct the Error."
            Exit Sub
            'Licesen could not be added if correspondend Batch already sent to Mental Health Department . 
        ElseIf Me.txtstatemailed.Text <> "" Then
            Me.lblErrorMessage.Visible = True
            Me.txtBatchNumber.BackColor = Drawing.Color.Red
            Me.lblErrorMessage.Text = "You can not create License assigned to Batch Number" & " " & Me.txtBatchNumber.Text & " " & ".  This Batch is closed at" & " " & Me.txtstatemailed.Text & " " & "to be sent to Mental Health Department. "
            Exit Sub
            'Temp Option should be always selected for Renewal License Type
        ElseIf Me.ddtype.Text = "Renewal" And Me.ddTempOption.Text = "" Then
            Me.ddTempOption.Enabled = True
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Please Select Temporary Option for Renewal License Type."
            Exit Sub
            'License type is required field
        ElseIf Me.ddtype.Text = "" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Please, select License Type."
            Exit Sub

        Else
            Me.lblErrorMessage.Visible = False

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()


            Try

                Dim cmdpistol As SqlCommand = New SqlCommand("insert_PCPistol", pistolconn)

                cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
                cmdpistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)
                cmdpistol.Parameters.AddWithValue("@status", Me.txtstatus.Text)
                cmdpistol.Parameters.AddWithValue("@Ltype", Me.ddtype.Text)
                cmdpistol.Parameters.AddWithValue("@TempLicense", Me.ddTempOption.Text)
                cmdpistol.Parameters.AddWithValue("@applied", Me.txtapplied.Text)
                cmdpistol.Parameters.AddWithValue("@statemailed", Me.txtstatemailed.Text)
                cmdpistol.Parameters.AddWithValue("@Batchweek", Me.txtBatchNumber.Text)
                cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)
                cmdpistol.Parameters.AddWithValue("@Comments", Me.txtcomments.Text)
                cmdpistol.Parameters.AddWithValue("@licfee", Val(Me.ddlicensefee.Text))
                '    cmdpistol.Parameters.AddWithValue("@dcplidReturn", PCLisenseReturn)

                'Set Return Value Paramteres Direcion
                '      cmdpistol.Parameters("@dcplid").Direction = Data.ParameterDirection.Output


                cmdpistol.CommandType = Data.CommandType.StoredProcedure

                Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                'Execute SP
                Dim result As Integer
                result = cmdpistol.ExecuteNonQuery()

                'There is a condition in SP, if Active license already exist for this member, SP returns -1.
                If result > 0 Then
                    Session("licenseid") = Me.txtdcplid.Text
                    Response.Redirect("~/License/LicenseDetails.aspx")
                Else
                    'SP returns -1, that's means at least 1 Active License already exist for this member. 
                    'Its possible, SP returned - 1 because something wrong with SP, that's why I mentioned  both reason in the error message. 
                    Me.lblErrorMessage.Visible = True
                    Me.lblErrorMessage.Text = "Can't add New License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Please, check if any Active Licenses exist for this member. If not, please inform IS."
                    Exit Sub
                End If

                '    PCLisenseReturn = cmdpistol.Parameters("@dcplid").Value

                'Pass Lisense ID as Session variable
                '       Session("memberid") = PCLisenseReturn
                ' Response.Redirect("~/License/LicenseDetails.aspx")

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can't add New License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString()
            Finally
                pistolconn.Close()
            End Try

        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mystring As String = Session("memberid")

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        'Do not allow guest to Add New License
        If Session("Rights") = "Guest" Then
            Response.Redirect("~/Member/Console.aspx")
        End If

        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnnewlicense.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.ddtype.ClientID & _
        "').focus();return false;}} else {return true}; ")

        Me.ddTempOption.Enabled = False





        If Not Page.IsPostBack Then

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
            Me.txtmemberid.Text = mystring

            'Get Week Number
            ' Me.txtBatchNumber.Text = DatePart("ww", Date.Now) I decide to use diff week calculation and syncronize with Add Batch Code. This one does not count odd year. 04/21/2009
            Dim currentCulture As System.Globalization.CultureInfo
            currentCulture = System.Globalization.CultureInfo.CurrentCulture

            'Week's count will start at January 1 every year. First day of week set up to Monday. 
            Dim weekNumMonJanuary1 As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.Monday, FirstWeekOfYear.Jan1)
            Me.txtBatchNumber.Text = weekNumMonJanuary1

            Dim bLicenseInThisBatch As Integer

            bLicenseInThisBatch = Validate_DuplicateLicense()

            If bLicenseInThisBatch > 0 Then
                'No duplicate License
                Me.txtstatus.Text = "Pending/FBI-GBI"
                Me.txtOperator.Text = Session("username")

                'Me.txtapplied.Text = Now()
                Me.txtapplied.Text = Convert.ToString(Format(Now, "MM-dd-yyyy"))

                AssignLicenseNumber()
                GetStateMailedDate()
            Else
                Me.btnnewlicense.Enabled = False
                Me.btnCancel.Enabled = False
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License for " & " " & Me.lblmember.Text & " " & "already been exist in Batch" & " " & Me.txtBatchNumber.Text
            End If

        End If

        'User could use Back Error from IE to navigate. Be sure, that Add Buttom always disable, if DCPLID field is  is empty. 
        'Also, I prevent empty value for DCPLID into SP. 
        If Me.txtdcplid.Text = "" Then
            Me.btnnewlicense.Enabled = False
        End If

        If Session("Rights") = "Guest" Then
            Me.btnnewlicense.Enabled = False
        End If

    End Sub
    Protected Function Validate_DuplicateLicense() As Integer
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim tbl_pistol As New Data.DataTable

            Dim find_pistol As SqlCommand = New SqlCommand("Validate_DuplicateMemberInBatch", pistolconn)

            find_pistol.Parameters.AddWithValue("@firstname", Session("firstname"))
            find_pistol.Parameters.AddWithValue("@lastname", Session("Lastname"))
            find_pistol.Parameters.AddWithValue("@dob", Session("dob"))
            find_pistol.Parameters.AddWithValue("@batchWeek", Me.txtBatchNumber.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)
            adap.Dispose()

            If tbl_pistol.Rows.Count = 0 Then
                'No Duplicate License for given week for this member
                Return 1
            Else
                'Duplicate License for this Member exists
                Return 0
            End If

        Catch ex As Exception
            Return -1
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Validate    " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString()
            Return -1
        Finally
            pistolconn.Close()
        End Try

    End Function
    Protected Sub AssignLicenseNumber()

        Dim LicenseID As String
        Dim TransYear As Integer


        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim tbl_pistol As New Data.DataTable

            Dim find_pistol As SqlCommand = New SqlCommand("Sel_Last_LicesnceNumber", pistolconn)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)


            ''Get License Number
            LicenseID = CStr(tbl_pistol.Rows(0)("LastNumber"))

            'If License Number less then 4 characters, padd 0 at the begining
            If LicenseID.Length < 4 Then
                LicenseID = LicenseID.ToString.PadLeft(4, "0")
            End If

            'Get Year
            TransYear = CStr(tbl_pistol.Rows(0)("LastYear"))

            Me.txtdcplid.Text = TransYear & "-" & LicenseID

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Assign License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try

    End Sub
    
    Protected Sub GetStateMailedDate()

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try

            Dim tbl_pistol As New Data.DataTable
            Dim BatchYear As Integer = DatePart("yyyy", Date.Now)

            Dim find_pistol As SqlCommand = New SqlCommand("Select_StateMailedDate", pistolconn)

            find_pistol.Parameters.AddWithValue("@BatchWeek", Me.txtBatchNumber.Text)
            find_pistol.Parameters.AddWithValue("@BatchYear", BatchYear)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)
            adap.Dispose()

            'Batch does not exist and should be created
            If tbl_pistol.Rows.Count = 0 Then
                Call CreateNewBatch()
            Else
                'Show empty text box 
                If CStr(tbl_pistol.Rows(0)("maileddate")) = ("01/01/1900") Or CStr(tbl_pistol.Rows(0)("maileddate")) = ("1/1/1900") Then
                    Me.txtstatemailed.Text = ""
                Else
                    Me.txtstatemailed.Text = CStr(tbl_pistol.Rows(0)("maileddate"))
                End If

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't retrive Mail Date for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString()
        Finally

            pistolconn.Close()
        End Try

    End Sub
    Private Sub CreateNewBatch()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("insert_batchmaster", pistolconn)
            Dim tbl_pistol As New Data.DataTable

            cmdpistol.Parameters.AddWithValue("@batchdate", Date.Now())
            cmdpistol.Parameters.AddWithValue("@BatchNumber ", Me.txtBatchNumber.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            cmdpistol.ExecuteNonQuery()

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            pre_adap.Fill(tbl_pistol)

            'Batch was not creted for some reason. Do not allow to add License if Batch does not exist.
            If tbl_pistol.Rows.Count = 0 Then
                Me.txtBatchNumber.BackColor = Drawing.Color.Red
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Not able to create Batch Number " & " " & Me.txtBatchNumber.Text & ". " & " " & "Please, Inform IS IMMEDIATELLY!"
                Me.btnnewlicense.Enabled = False
                Me.btnCancel.Enabled = False 'Disable Clear button, because if Click Clear its Enable Add Buton. 
                Exit Sub
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.txtBatchNumber.BackColor = Drawing.Color.Red
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Not able to create Batch Number " & " " & Me.txtBatchNumber.Text & ". " & " " & "Please, Inform IS IMMEDIATELLY!"
            Me.btnnewlicense.Enabled = False
            Me.btnCancel.Enabled = False 'Disable Clear button, because if Click Clear its Enable Add Buton. 

        Finally
            pistolconn.Close()
        End Try
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Call ClearRecord()
    End Sub


    Protected Sub ddtype_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddtype.TextChanged
        If ddtype.SelectedValue = "Renewal" Then
            Me.ddTempOption.Enabled = True
        Else
            Me.ddTempOption.Enabled = False         
            Me.ddTempOption.SelectedValue = ""
        End If
    End Sub

    'Protected Sub ddtype_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddtype.SelectedIndexChanged
    '    If ddtype.SelectedValue = "Renewal" Then
    '        Me.ddTempOption.Enabled = True
    '    Else
    '        Me.ddTempOption.Enabled = False
    '    End If
    'End Sub
End Class
