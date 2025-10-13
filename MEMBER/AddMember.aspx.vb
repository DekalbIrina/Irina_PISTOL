
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Class AddMember
    Inherits System.Web.UI.Page
    Public Shared countAddTry As Integer

    Protected Sub btnnewmember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewmember.Click

        'Validate Mandatory Fields. If Member is exempt, Agency Name should be entered.
        If Me.ddExempt.SelectedValue = "Yes" And Me.txtAgencyName.Text = "" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is Exempt Member. Please Enter Agency Name."
            Exit Sub
            'If Member is not exepmt and set to NO, Agency Name should not be added
        ElseIf Me.ddExempt.SelectedValue = "No" And Me.txtAgencyName.Text <> "" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is NOT an Exempt Member. Please, delete Agency Name."
            Exit Sub
            'If Member is not exepmt and set to empty, Agency Name should not be added
        ElseIf Me.ddExempt.SelectedValue = "" And Me.txtAgencyName.Text <> "" Then
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is NOT an Exempt Member. Please, delete Agency Name."
            Exit Sub
        Else
            'Check, if member with the same First Name, Last Name and Date Of Birth exists. 
            Call Validate_NewMember()
        End If

    End Sub
    Sub Validate_NewMember()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Validate_New_Member", pistolconn)

            cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)

            cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)

            cmdpistol.Parameters.AddWithValue("@DOB", Me.txtdateofbirth.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)


            Dim member_data As Data.DataTable
            member_data = New Data.DataTable
            pre_adap.Fill(member_data)

            'Validate Duplicate Member by First Name, Last Name and DOB only once
            If countAddTry = 0 Then
                'Duplicate Member does exist, give a warning label
                If member_data.Rows.Count > 0 Then
                    Me.lblErrorMessage.Visible = True
                    Me.lblErrorMessage.Text = "MEMBER" & " " & Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & Me.txtdateofbirth.Text & " " & "already exists. Please click CLEAR button if you dont't want to add this Member, or Click ADD MEMBER button to add this Member."

                Else
                    AddNewMember()
                End If

                countAddTry = countAddTry + 1
                'User hits Add Button second time. Allow user to add Duplicate Member.
            ElseIf countAddTry > 0 Then
                countAddTry = 0
                AddNewMember()

            End If

            pre_adap.Dispose()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Unable to Validate New Member" & " " & Me.txtfirstname.Text & "  " & Me.txtlastname.Text
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Public Sub AddNewMember()
        Dim sconnection As String

        Dim MembreIDReturn As Integer = 0
        Dim MemberIDPass As Integer

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Me.lblErrorMessage.Visible = False


            Dim cmdpistol As SqlCommand = New SqlCommand("insert_people", pistolconn)

            cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
            cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)
            cmdpistol.Parameters.AddWithValue("@MiddleName", Me.txtmiddle.Text)
            cmdpistol.Parameters.AddWithValue("@Address", Me.txtaddress.Text)
            cmdpistol.Parameters.AddWithValue("@City", Me.txtcity.Text)
            cmdpistol.Parameters.AddWithValue("@State", Me.txtState.Text)
            cmdpistol.Parameters.AddWithValue("@Zip", Me.txtzipcode.Text)
            cmdpistol.Parameters.AddWithValue("@County", Me.txtCounty.Text)
            cmdpistol.Parameters.AddWithValue("@Phone", Me.txtphone.Text)
            cmdpistol.Parameters.AddWithValue("@CellPhone", Me.txtcellphone.Text)
            cmdpistol.Parameters.AddWithValue("@Email", Me.txtemail.Text)
            'User add  Value from Drop Down Box
            If Me.ddcityofbirth.Visible = True Then
                cmdpistol.Parameters.AddWithValue("@BirthCity", Me.ddcityofbirth.Text)
                'User adds new Birth Place, get value from text box
            ElseIf Me.txtPlaceBirth.Visible = True Then
                cmdpistol.Parameters.AddWithValue("@BirthCity", Me.txtPlaceBirth.Text)
            End If

            cmdpistol.Parameters.AddWithValue("@DOB", Me.txtdateofbirth.Text)
            cmdpistol.Parameters.AddWithValue("@Exempt", Me.ddExempt.Text)
            cmdpistol.Parameters.AddWithValue("@AgencyName", Me.txtAgencyName.Text)
            cmdpistol.Parameters.AddWithValue("@INSAdmission", Me.txtINSAdmission.Text)
            cmdpistol.Parameters.AddWithValue("@sex", Me.ddgender.Text)
            cmdpistol.Parameters.AddWithValue("@race", Me.ddrace.Text)
            cmdpistol.Parameters.AddWithValue("@Hair", Me.ddhair.Text)
            cmdpistol.Parameters.AddWithValue("@Eyes", Me.ddeyes.Text)
            cmdpistol.Parameters.AddWithValue("@Height", Me.txtheight.Text)
            cmdpistol.Parameters.AddWithValue("@Weight", Me.txtweight.Text)
            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Session("username"))
            cmdpistol.Parameters.AddWithValue("@MembreIDReturn", MembreIDReturn)

            'Set Return Value Paramteres Direcion
            cmdpistol.Parameters("@MembreIDReturn").Direction = Data.ParameterDirection.Output


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            'Execute SP
            cmdpistol.ExecuteNonQuery()

            MemberIDPass = cmdpistol.Parameters("@MembreIDReturn").Value

            'Pass Member ID to Main Search Sreen as  query string variable
            'Response.Redirect("~/MainSearch.aspx?Name=" & MemberIDPass)

            'Pass Member ID to Main Search Sreen as Session variable
            Session("memberid") = MemberIDPass
            Response.Redirect("~/Member/console.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            ' ClearRecord()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "MEMBER " & Me.txtfirstname.Text & "  " & Me.txtlastname.Text & "  WAS NOT ADDED. PLEASE, CONTACT Information System." & "  " & ex.Message.ToString()

        Finally
            pistolconn.Close()
        End Try

    End Sub
    Public Sub ClearRecord()
        Try
            Me.txtfirstname.Text = ""
            Me.txtmiddle.Text = ""
            Me.txtlastname.Text = ""
            Me.txtaddress.Text = ""
            Me.txtzipcode.Text = ""
            Me.txtphone.Text = ""
            Me.txtcellphone.Text = ""
            Me.txtemail.Text = ""
            Me.txtdateofbirth.Text = ""
            Me.txtINSAdmission.Text = ""
            Me.txtheight.Text = ""
            Me.txtweight.Text = ""
            'Me.ddcityofbirth.Text = ""
            Me.txtPlaceBirth.Text = ""
            Me.txtzipcode.Text = ""
            Me.txtcity.Text = ""
            Me.txtAgencyName.Text = ""
            Me.txtComments.Text = ""

            Me.ddrace.SelectedValue = ""
            Me.ddgender.SelectedValue = ""

            Me.ddeyes.SelectedValue = ""
            Me.ddhair.SelectedValue = ""
            Me.ddExempt.SelectedValue = ""

            Me.lblErrorMessage.Visible = False
            Me.lblagelimit.Visible = False

            countAddTry = 0

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Unable to Clear Fields" & " " & ex.Message.ToString() & " " & "Please Contact IS."
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            ' Me.lbldatevalidation.Visible = False
            '    Me.lblphonevalidation.Visible = False


            'Avoid focus on browser address bar or some additional toolbar
            'tab key ASCII code is 9
            Me.btnnewmember.Attributes.Add("onkeydown", _
            "if(event.which || event.keyCode)" & _
            "{if ((event.which == 9) || (event.keyCode == 9)) " & _
            "{document.getElementById('" & Me.txtfirstname.ClientID & _
            "').focus();return false;}} else {return true}; ")


            'When Session has been expired, redirect User to Logon Page
            If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
                Response.Redirect("~/default.aspx")
            End If

            If Page.IsPostBack = False Then

                Me.txtState.Text = "GA"
                Me.txtCounty.Text = "DEKALB"

                'User Name for this session
                Dim SessionUserName As String
                SessionUserName = Session("username")
                Me.txtOperator.Text = SessionUserName

                Call LoadBirthPlace()

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Unable to Load Page. Please inform IS."
        End Try

    End Sub

    Private Sub DOBVAlidation()
        Try

            Dim agelimit As Integer

            'Dim DayOfMonth As Integer
            'Dim MonthOfYear As Integer

            Dim result As DateTime
            Dim returnValue As Boolean
            Dim bParseResult As Boolean

            'Validaste Date Lenght and Parse it
            bParseResult = ParseDOBDate()

            If bParseResult Then
                Me.lblagelimit.ForeColor = System.Drawing.Color.White
                'Validate Datetime for right Input
                returnValue = Convert.ToDateTime(Me.txtdateofbirth.Text).TryParse(Me.txtdateofbirth.Text, result)


                If returnValue Then
                    'Validation succeeded
                    agelimit = DateDiff("d", Me.txtdateofbirth.Text, Today)
                    Me.lblagelimit.Text = CInt(agelimit / 365) & " " & "year(s) of age"

                    'MonthOfYear = Convert.ToDateTime(Me.txtdateofbirth.Text).Month
                    'DayOfMonth = Convert.ToDateTime(Me.txtdateofbirth.Text).Day
                Else
                    'Validation failed.
                    Me.lblagelimit.Text = "Please Enter Valid DOB."
                    Me.lblagelimit.ForeColor = System.Drawing.Color.Red
                    Exit Sub
                End If

            Else
                'Pasring Failed failed.
                Me.lblagelimit.Text = "Please Enter Valid DOB."
                Me.lblagelimit.ForeColor = System.Drawing.Color.Red
                Exit Sub

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Unable Validate DOB. Please inform IS."
        End Try

    End Sub
    Function ParseDOBDate() As Integer
        Dim sItem As String
        sItem = Me.txtdateofbirth.Text

        Dim a As Integer
        a = Me.txtdateofbirth.Text.Length.ToString()

        If a = 8 Then
            'Parse data and add '/" symbol 
            Me.txtdateofbirth.Text = Left(Me.txtdateofbirth.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtdateofbirth.Text, 4)
            Return True
        ElseIf a < 8 Then
            Return False
        End If

    End Function
    Sub LoadBirthPlace()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cboTbl As System.Data.DataTable = New Data.DataTable
            Dim cmdLoad As SqlCommand = New SqlCommand("Select_BirthPlace", pistolconn)
            Dim AllCities As String

            'Select all cities from Table to load on the form
            AllCities = "%"

            cmdLoad.Parameters.AddWithValue("@BirthPlace", AllCities)
            cmdLoad.CommandType = Data.CommandType.StoredProcedure
            cmdLoad.ExecuteNonQuery().ToString()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdLoad)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()

            Me.ddcityofbirth.DataSource = cboTbl
            Me.ddcityofbirth.DataTextField = "CityState"

            Me.ddcityofbirth.DataBind()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Unable to Load City Of Birth" & " " & Me.txtfirstname.Text & "  " & Me.txtlastname.Text
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub btbCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btbCancel.Click
        ClearRecord()
    End Sub

    Protected Sub txtdateofbirth_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdateofbirth.TextChanged
        DOBVAlidation()
    End Sub

    Protected Sub btnAddNewPlace_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNewPlace.Click
        'Show text box and hide drop down box
        Me.txtPlaceBirth.Visible = True
        Me.txtCityOfBirhtVal.Enabled = True
        Me.ddcityofbirth.Visible = False
    End Sub

    Protected Sub btnCancelBirthCity_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelBirthCity.Click
        'Show drop Down box and hide text box
        Me.txtPlaceBirth.Visible = False
        Me.txtCityOfBirhtVal.Enabled = False
        Me.ddcityofbirth.Visible = True
    End Sub
End Class
