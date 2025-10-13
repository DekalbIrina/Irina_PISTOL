Imports System.Web.SessionState
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Class Console
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnupdate.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtfirstname.ClientID & _
        "').focus();return false;}} else {return true}; ")

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If


        If Session("Rights") = "Guest" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        ElseIf Session("Rights") = "User" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = True
        End If

        Me.txtstate.Text = "GA"
        Me.txtcounty.Text = "DEKALB"
        Me.lblFailed.Visible = False
        Me.lblFailed.Text = ""
        Me.lblUpdateDone.Visible = False
        Me.lblUpdateDone.Text = ""

        If Not Page.IsPostBack Then
            Call LoadBirthPlace()
            Call KeepSession()
        End If
    End Sub
   
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
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Unable to Load City Of Birth" & " " & Me.txtfirstname.Text & "  " & Me.txtlastname.Text
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Public Sub KeepSession()


        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Dim mystring = Session("memberid")
        Me.lblFailed.Visible = False

        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("sel_memberidallfields", pistolconn)
            find_pistol.Parameters.AddWithValue("@memberid", mystring)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)

            Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
            Me.txtfirstname.Text = CStr(tbl_pistol.Rows(0)("firstname"))
            Me.txtmiddle.Text = CStr(tbl_pistol.Rows(0)("middlename"))
            Me.txtlastname.Text = CStr(tbl_pistol.Rows(0)("lastname"))
            Me.txtaddress.Text = CStr(tbl_pistol.Rows(0)("address"))
            Me.txtcity.Text = CStr(tbl_pistol.Rows(0)("city"))

            Me.txtstate.Text = CStr(tbl_pistol.Rows(0)("state"))
            Me.txtzip.Text = CStr(tbl_pistol.Rows(0)("zip"))

            Me.txtcounty.Text = CStr(tbl_pistol.Rows(0)("county"))
            Me.txtphone.Text = CStr(tbl_pistol.Rows(0)("phone"))
            Me.txtcellphone.Text = CStr(tbl_pistol.Rows(0)("cellphone"))
            Me.txtemail.Text = CStr(tbl_pistol.Rows(0)("email"))
            'Me.txtcityofbirth.Text = CStr(tbl_pistol.Rows(0)("birthcity"))
            'Me.txtstateofbirth.Text = CStr(tbl_pistol.Rows(0)("birthstate"))
            Me.ddcityofbirth.SelectedItem.Text = CStr(tbl_pistol.Rows(0)("birthcity"))

            Me.txtdateofbirth.Text = CStr(tbl_pistol.Rows(0)("dob"))

            Me.ddExempt.Text = CStr(tbl_pistol.Rows(0)("exempt"))
            Me.txtAgencyName.Text = CStr(tbl_pistol.Rows(0)("AgencyName"))
            Me.txtINSAdmission.Text = CStr(tbl_pistol.Rows(0)("insadmission"))
            Me.ddsex.Text = CStr(tbl_pistol.Rows(0)("sex"))
            Me.ddrace.Text = CStr(tbl_pistol.Rows(0)("race"))
            Me.ddhair.Text = CStr(tbl_pistol.Rows(0)("hair"))
            Me.ddeyes.Text = CStr(tbl_pistol.Rows(0)("eyes"))
            Me.txtheight.Text = CStr(tbl_pistol.Rows(0)("height"))
            Me.txtweight.Text = CStr(tbl_pistol.Rows(0)("weight"))
            Me.txtComments.Text = CStr(tbl_pistol.Rows(0)("comments"))
            Me.txtOperator.Text = CStr(tbl_pistol.Rows(0)("username"))

            Me.txtmemberid.Text = mystring

            Session("firstname") = Me.txtfirstname.Text.ToUpper
            Session("lastname") = Me.txtlastname.Text.ToUpper
            Session("dob") = Me.txtdateofbirth.Text
      
        Catch ex As Exception
            ex.Message.ToString()         
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Load Data on this page Failed for MemberID: " & mystring & "  " & ex.Message.ToString() & "  " & "Please contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
        'Validate Mandatory Fields. If Member is exempt, Agency Name should be entered.
        If Me.ddExempt.SelectedValue = "Yes" And Me.txtAgencyName.Text = "" Then
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is Exempt Member. Please Enter Agency Name."
            Exit Sub
            'If Member is not exepmt and set to NO, Agency Name should not be added
        ElseIf Me.ddExempt.SelectedValue = "No" And Me.txtAgencyName.Text <> "" Then
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is NOT an Exempt Member. Please, delete Agency Name."
            Exit Sub
            'If Member is not exepmt and set to empty, Agency Name should not be added
        ElseIf Me.ddExempt.SelectedValue = "" And Me.txtAgencyName.Text <> "" Then
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = Me.txtfirstname.Text & " " & Me.txtlastname.Text & " " & " is NOT an Exempt Member. Please, delete Agency Name."
            Exit Sub
        Else
            Me.lblFailed.Visible = False
            Call UpdateMember()
        End If

    End Sub

    Private Sub UpdateMember()

        Dim firstname As String
        Dim lastname As String

        firstname = Me.txtfirstname.Text
        lastname = Me.txtlastname.Text


        Dim sconnection As String

        Me.txtOperator.Text = Session("Username")

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim sppistol As SqlCommand = New SqlCommand("update_person", pistolconn)

            sppistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            sppistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
            sppistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)
            sppistol.Parameters.AddWithValue("@middlename", Me.txtmiddle.Text)
            sppistol.Parameters.AddWithValue("@address", Me.txtaddress.Text)
            sppistol.Parameters.AddWithValue("@city", Me.txtcity.Text)

            sppistol.Parameters.AddWithValue("@state", Me.txtstate.Text)
            sppistol.Parameters.AddWithValue("@zip", Me.txtzip.Text)

            sppistol.Parameters.AddWithValue("@county", Me.txtcounty.Text)
            sppistol.Parameters.AddWithValue("@phone", Me.txtphone.Text)
            sppistol.Parameters.AddWithValue("@cellphone", Me.txtcellphone.Text)
            sppistol.Parameters.AddWithValue("@email", Me.txtemail.Text)

            'User add  Value from Drop Down Box
            If Me.ddcityofbirth.Visible = True Then
                sppistol.Parameters.AddWithValue("@BirthCity", Me.ddcityofbirth.Text)
                'User adds new Birth Place, get value from text box
            ElseIf Me.txtPlaceBirth.Visible = True Then
                sppistol.Parameters.AddWithValue("@BirthCity", Me.txtPlaceBirth.Text)
            End If

            sppistol.Parameters.AddWithValue("@dob", Me.txtdateofbirth.Text)

            sppistol.Parameters.AddWithValue("@insadmission", Me.txtINSAdmission.Text)
            sppistol.Parameters.AddWithValue("@sex", Me.ddsex.Text)
            sppistol.Parameters.AddWithValue("@race", Me.ddrace.Text)
            sppistol.Parameters.AddWithValue("@Exempt", Me.ddExempt.Text)
            sppistol.Parameters.AddWithValue("@AgencyName", Me.txtAgencyName.Text)
            sppistol.Parameters.AddWithValue("@hair", Me.ddhair.Text)
            sppistol.Parameters.AddWithValue("@eyes", Me.ddeyes.Text)
            sppistol.Parameters.AddWithValue("@height", Me.txtheight.Text)
            sppistol.Parameters.AddWithValue("@weight", Me.txtweight.Text)
            sppistol.Parameters.AddWithValue("@comments", Me.txtComments.Text)
            sppistol.Parameters.AddWithValue("@User", Me.txtOperator.Text)

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()


            Me.lblUpdateDone.Visible = True
            Me.lblUpdateDone.Text = "Data has been updated for: " & firstname & " " & lastname


            'This information pass to Add New License Page, if license will be added
            Session("firstname") = Me.txtfirstname.Text.ToUpper
            Session("lastname") = Me.txtlastname.Text.ToUpper
            Session("dob") = Me.txtdateofbirth.Text


            'If user update DOB field in "MM/DD/YYYY" formtat, what is right also, program 
            'allow update this info into DB. To be sure, that error message for "MMDDYYYY" format 
            'does not shown, I repeat the code for DOB label here
            Dim agelimit As Integer = DateDiff("d", Me.txtdateofbirth.Text, Today)
            Me.lblagelimit.Text = CInt(agelimit / 365) & " " & "year(s) of age"


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblUpdateDone.Visible = False
            Me.lblUpdateDone.Text = ""
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Update Failed for : " & firstname & " " & lastname & "  " & ex.Message.ToString()

        Finally
            pistolconn.Close()
        End Try

    End Sub

    Public Sub CellPhone()

        Dim sItem As String
        sItem = Me.txtcellphone.Text

        Dim a As Integer

        a = Me.txtcellphone.Text.Length.ToString()

        If a = 10 Then
            txtcellphone.Text = Left(txtcellphone.Text, 3) & "-" & sItem.Substring(3, 3) & "-" & Right(txtcellphone.Text, 4)
            'lblphonevalidation.Visible = False
            'ElseIf a < 10 Then
            'Me.lblphonevalidation.Visible = True
        End If
    End Sub

    Public Sub PhoneMask()
        Dim sItem As String
        sItem = Me.txtphone.Text

        Dim a As Integer

        a = Me.txtphone.Text.Length.ToString()

        If a = 10 Then
            txtphone.Text = Left(txtphone.Text, 3) & "-" & sItem.Substring(3, 3) & "-" & Right(txtphone.Text, 4)
            'lblphonevalidation.Visible = False
            'ElseIf a < 10 Then
            'Me.lblphonevalidation.Visible = True
        End If

    End Sub

    Protected Sub txtphone_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtphone.TextChanged
        '  Call PhoneMask()
    End Sub

    Protected Sub txtcellphone_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtcellphone.TextChanged
        ' Call CellPhone()
    End Sub


    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Dim sconnection As String
        Dim a As String

        a = Me.txtfirstname.Text & " " & Me.txtlastname.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcperson", pistolconn)
            find_pistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Write("Record has been deleted for member:" & " " & a)
            Response.Redirect("~/mainsearch.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Delete Failed for : " & a & "  " & ex.Message.ToString()
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
            Me.txtphone.Text = ""
            Me.txtcellphone.Text = ""
            Me.txtemail.Text = ""
            Me.txtPlaceBirth.Text = ""
            Me.txtdateofbirth.Text = ""
            Me.txtINSAdmission.Text = ""
            Me.txtheight.Text = ""
            Me.txtweight.Text = ""          
            Me.txtzip.Text = ""
            Me.txtcity.Text = ""
            Me.txtComments.Text = ""

            Me.ddrace.SelectedValue = ""
            Me.ddsex.SelectedValue = ""

            Me.ddeyes.SelectedValue = ""
            Me.ddhair.SelectedValue = ""
            Me.ddExempt.SelectedValue = ""
  
        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Unable to Clear Fields" & " " & ex.Message.ToString() & " " & "Please Contact IS."
        End Try

    End Sub

    Protected Sub tbtnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearRecord()
        'Session("memberid") = Me.txtmemberid.Text
        'Response.Redirect("~/MainSearch.aspx?Name=" & Session("memberid"))
    End Sub
    Private Sub DOBVAlidation()

        Dim agelimit As Integer


        Dim result As DateTime
        Dim returnValue As Boolean
        Dim bParseResult As Boolean

        'Validaste Date Lenght and Parse it
        bParseResult = ParseDOBDate()

        If bParseResult Then
            Me.lblagelimit.ForeColor = System.Drawing.Color.Navy
            'Validate Datetime for right Input
            returnValue = Convert.ToDateTime(Me.txtdateofbirth.Text).TryParse(Me.txtdateofbirth.Text, result)


            If returnValue Then
                'Validation succeeded
                agelimit = DateDiff("d", Me.txtdateofbirth.Text, Today)
                Me.lblagelimit.Text = CInt(agelimit / 365) & " " & "year(s) of age"

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
    End Sub
    'Function ParseDOBDate() As Integer
    '    Dim sItem As String
    '    Dim iFirstSlash As Integer
    '    Dim iSecondSlash As Integer


    '    sItem = Me.txtdateofbirth.Text

    '    If sItem.Length = 8 Then
    '        iFirstSlash = sItem.IndexOf("/")
    '        iSecondSlash = sItem.IndexOf("/", iFirstSlash)
    '        sItem = sItem.Remove(iFirstSlash, iSecondSlash - iFirstSlash)

    '        Me.txtdateofbirth.Text = sItem
    '    ElseIf sItem.Length = 10 Then
    '        iFirstSlash = sItem.IndexOf("/")
    '        iSecondSlash = sItem.IndexOf("/", iFirstSlash + 1)
    '        sItem = sItem.Remove(iFirstSlash + 1, iSecondSlash - iFirstSlash)

    '        Me.txtdateofbirth.Text = sItem

    '    Else
    '        Return False
    '        Exit Function
    '    End If



    '    'Dim a As Integer
    '    'a = Me.txtdateofbirth.Text.Length.ToString()

    '    'If a = 8 Then
    '    '    'Parse data and add '/" symbol 
    '    '    Me.txtdateofbirth.Text = Left(Me.txtdateofbirth.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtdateofbirth.Text, 4)
    '    '    Return True
    '    'ElseIf a < 8 Then
    '    '    Return False
    '    'End If

    'End Function
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
    Protected Sub txtdateofbirth_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdateofbirth.TextChanged
        Call DOBVAlidation()
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
