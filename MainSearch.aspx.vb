Imports System.Web.UI.WebControls.DataGrid
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Drawing
Imports System.Drawing.Drawing2D


Partial Class MainSearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
  
        Dim NewAddedMemberID As Integer
        Dim sconnection As String

        'If Session("Rights") = "Guest" Then
        '    Me.btnnewmember.Visible = False
        'End If

        Select Case Me.RadioButtonList1.SelectedIndex
            Case 0
                'Set focus on text box
                Page.SetFocus(Me.txtfirstname)

                'Avoid focus on browser address bar or some additional toolbar
                'tab key ASCII code is 9
                Me.btnsubmit.Attributes.Add("onkeydown", _
                "if(event.which || event.keyCode)" & _
               "{if ((event.which == 9) || (event.keyCode == 9)) " & _
               "{document.getElementById('" & Me.txtfirstname.ClientID & _
               "').focus();return false;}} else {return true}; ")

            Case 1
                'Set focus on text box
                Page.SetFocus(Me.SearchbyDCPLID)

                'Avoid focus on browser address bar or some additional toolbar
                'tab key ASCII code is 9 (DOES NOT WORK FOR THIS TEXT BOX) IRINA
                Me.btnsubmit.Attributes.Add("onkeydown", _
                "if(event.which || event.keyCode)" & _
               "{if ((event.which == 9) || (event.keyCode == 9)) " & _
               "{document.getElementById('" & Me.SearchbyDCPLID.ClientID & _
               "').focus();return false;}} else {return true}; ")
            Case 2
                'Set focus on text box
                Page.SetFocus(Me.txtfirstname)

                'Avoid focus on browser address bar or some additional toolbar
                'tab key ASCII code is 9
                Me.btnsubmit.Attributes.Add("onkeydown", _
                "if(event.which || event.keyCode)" & _
               "{if ((event.which == 9) || (event.keyCode == 9)) " & _
               "{document.getElementById('" & Me.txtfirstname.ClientID & _
               "').focus();return false;}} else {return true}; ")
            Case 3
                'Set focus on text box
                Page.SetFocus(Me.txtmemberid)

                'Avoid focus on browser address bar or some additional toolbar
                'tab key ASCII code is 9 (DOES NOT WORK FOR THIS TEXT BOX) IRINA
                Me.btnsubmit.Attributes.Add("onkeydown", _
                "if(event.which || event.keyCode)" & _
               "{if ((event.which == 9) || (event.keyCode == 9)) " & _
               "{document.getElementById('" & Me.txtmemberid.ClientID & _
               "').focus();return false;}} else {return true}; ")
            Case 4
                'Set focus on text box
                Page.SetFocus(Me.txtfirstname)

                'Avoid focus on browser address bar or some additional toolbar
                'tab key ASCII code is 9 (DOES NOT WORK FOR THIS TEXT BOX) IRINA
                Me.btnsubmit.Attributes.Add("onkeydown", _
                 "if(event.which || event.keyCode)" & _
                "{if ((event.which == 9) || (event.keyCode == 9)) " & _
                "{document.getElementById('" & Me.txtfirstname.ClientID & _
                "').focus();return false;}} else {return true}; ")
        End Select



        'When Session has been expired, program redirect User to Login Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("default.aspx")
        End If


        If Page.IsPostBack = False Then

            'Pass varible from Update Member Screen, if User click on CANCEL Button on "Update Member Screen."
            NewAddedMemberID = Request.QueryString("Name")

            If NewAddedMemberID > 0 Then

                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try
                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_memberid", pistolconn)

                    cmdpistol.Parameters.AddWithValue("@memberid", NewAddedMemberID)
                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()

                    Me.grdsearch.Visible = True
                    Me.grdsearch.DataSource = pistol_data
                    Me.DataBind()

                    'Clear Up Variable
                    NewAddedMemberID = 0

                Catch ex As Exception
                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't search for Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()
                End Try
            End If

        End If

    End Sub

  
    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged

        Try
            Select Case Me.RadioButtonList1.SelectedIndex
               
                'Case 3
                Case 0
                    'Search by First and Last Name using wild charachter approach
                    Me.lblfirst.Visible = True
                    Me.lbllast.Visible = True
                    Me.txtlastname.Visible = True
                    Me.txtlastname.Text = ""
                    Me.txtfirstname.Visible = True
                    Me.txtfirstname.Text = ""
         

                    'Make all other controls ivisible  
                    Me.txtmemberid.Visible = False
                    Me.valMemberID.Enabled = False
                    Me.SearchbyDCPLID.Visible = False
                    Me.txtDOB.Visible = False
                    Me.valDOB.Enabled = False
                    Me.grdsearch.Visible = False
                    Me.gridOldData.Visible = False
                    Me.btnnewmember.Enabled = False


                    Me.lblDOB.Visible = False
                    Me.lblFailed.Visible = False
                    Me.lblcount.Visible = False
                    Me.lbldatevalidation.Visible = False

                Case 1
                    'Search by DCPLID
                    Me.SearchbyDCPLID.Visible = True
                    Me.SearchbyDCPLID.Text = ""
              

                    'Make all other controls ivisible  
                    Me.txtmemberid.Visible = False
                    Me.txtfirstname.Visible = False
                    Me.txtlastname.Visible = False
                    Me.txtDOB.Visible = False
                    Me.valDOB.Enabled = False
                    Me.valMemberID.Visible = False
                    Me.grdsearch.Visible = False
                    Me.gridOldData.Visible = False
                    Me.btnnewmember.Enabled = False

                    Me.lblDOB.Visible = False
                    Me.lblfirst.Visible = False
                    Me.lbllast.Visible = False
                    Me.lblFailed.Visible = False
                    Me.lblcount.Visible = False
                    Me.lbldatevalidation.Visible = False


                Case 2
                    'Search by Last Name, Fist Name, DOB
                    Me.txtlastname.Visible = True
                    Me.txtlastname.Text = ""
                    Me.txtfirstname.Visible = True
                    Me.txtfirstname.Text = ""
                    Me.txtDOB.Visible = True
                    Me.txtDOB.Text = ""
                    Me.valDOB.Enabled = True
                    Me.lblfirst.Visible = True
                    Me.lbllast.Visible = True
                    Me.lblDOB.Visible = True
     


                    'Make all other controls ivisible  
                    Me.txtmemberid.Visible = False
                    Me.valMemberID.Enabled = False
                    Me.SearchbyDCPLID.Visible = False
                    Me.grdsearch.Visible = False
                    Me.gridOldData.Visible = False
                    Me.btnnewmember.Enabled = False

                    Me.lblFailed.Visible = False
                    Me.lblcount.Visible = False
                    Me.lbldatevalidation.Visible = False
                    'Case 0
                Case 3
                    'Search by MemberID
                    Me.txtmemberid.Visible = True
                    Me.txtmemberid.Text = ""
                    Me.valMemberID.Enabled = True
                    Me.valMemberID.Visible = True
               

                    'Make all other controls ivisible  
                    Me.SearchbyDCPLID.Visible = False
                    Me.txtfirstname.Visible = False
                    Me.txtlastname.Visible = False
                    Me.txtDOB.Visible = False
                    Me.valDOB.Enabled = False
                    Me.grdsearch.Visible = False
                    Me.gridOldData.Visible = False
                    Me.btnnewmember.Enabled = False

                    Me.lblDOB.Visible = False
                    Me.lblfirst.Visible = False
                    Me.lbllast.Visible = False
                    Me.lblFailed.Visible = False
                    Me.lblcount.Visible = False
                    Me.lbldatevalidation.Visible = False


                Case 4
                    'Search by First and Last Name for Old Licenses. This data transered from old Access DB.
                    Me.lblfirst.Visible = True
                    Me.lbllast.Visible = True
                    Me.txtlastname.Visible = True
                    Me.txtlastname.Text = ""
                    Me.txtfirstname.Visible = True
                    Me.txtfirstname.Text = ""
              

                    'Make all other controls ivisible  
                    Me.txtmemberid.Visible = False
                    Me.valMemberID.Enabled = False
                    Me.SearchbyDCPLID.Visible = False
                    Me.txtDOB.Visible = False
                    Me.valDOB.Enabled = False
                    Me.grdsearch.Visible = False
                    Me.gridOldData.Visible = False
                    Me.btnnewmember.Enabled = False

                    Me.lblDOB.Visible = False
                    Me.lblFailed.Visible = False
                    Me.lblcount.Visible = False
                    Me.lbldatevalidation.Visible = False

            End Select

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Can't Select Radio Buttno. Please inform IS."
        End Try
    End Sub

    Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
        Session("memberid") = 99999999      
        Me.lblFailed.Visible = False
        Me.lblcount.Visible = False
        'Me.lblDOB.Visible = False
        'Me.valMemberID.Visible = False

        Select Case Me.RadioButtonList1.SelectedIndex
         
            ' Case 3
            Case 0
                'Seacrh by First And Last Name. This search is able to return records even if couple charachters 
                'of first and/or last  name will be entered. 
                Dim sconnection As String
                Dim a As String
                Dim b As String

                a = Me.txtfirstname.Text

                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try
                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_MemByWildCharachter", pistolconn)


                    cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
                    cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)


                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()


                    Me.grdsearch.Visible = True
                    Me.grdsearch.DataSource = pistol_data
                    Me.DataBind()


                    'If pistol_data.Rows.Count = 0 Then 'And Session("rights") <> "Guest" Then
                    If pistol_data.Rows.Count = 0 And Session("rights") <> "Guest" Then
                        Me.btnnewmember.Enabled = True
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "You Are Ready To Add New Member!"
                    ElseIf pistol_data.Rows.Count = 0 And Session("rights") = "Guest" Then
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "Record Not Found."
                    ElseIf pistol_data.Rows.Count >= 1 Then
                        Me.btnnewmember.Enabled = False
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = (pistol_data.Rows.Count) & " " & "Record(s) Returned"
                    End If

                Catch ex As Exception
                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't find Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()
                End Try


            Case 1
                'Search by License Number
                Dim sconnection As String
                Dim a As String
                Dim b As String

                a = Me.txtfirstname.Text


                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try
                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_dcplid", pistolconn)

                    cmdpistol.Parameters.AddWithValue("@dcplid", Me.SearchbyDCPLID.Text)
                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()

                    Me.grdsearch.Visible = True
                    Me.grdsearch.DataSource = pistol_data
                    Me.DataBind()

                    If pistol_data.Rows.Count = 0 And Session("rights") <> "Guest" Then
                        Me.btnnewmember.Enabled = True
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "You Are Ready To Add New Member!"
                    ElseIf pistol_data.Rows.Count = 0 And Session("rights") = "Guest" Then
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "Record Not Found."
                    ElseIf pistol_data.Rows.Count >= 1 Then
                        Me.btnnewmember.Enabled = False
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = (pistol_data.Rows.Count) & " " & "Record(s) Returned"
                    End If

                Catch ex As Exception
                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't find Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()

                End Try

            Case 2
                'Search by Fist Name, Last Name and DOB. All parameters should be exact match.
                Dim sconnection As String
                Dim a As String
                Dim b As String

                a = Me.txtfirstname.Text


                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try
                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_member", pistolconn)

                    cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
                    cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)
                    cmdpistol.Parameters.AddWithValue("@dob", Me.txtDOB.Text)

                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()


                    Me.grdsearch.Visible = True
                    Me.grdsearch.DataSource = pistol_data
                    Me.DataBind()

                    If pistol_data.Rows.Count = 0 And Session("rights") <> "Guest" Then
                        Me.btnnewmember.Enabled = True
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "You Are Ready To Add New Member!"
                    ElseIf pistol_data.Rows.Count = 0 And Session("rights") = "Guest" Then
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "Record Not Found."
                    ElseIf pistol_data.Rows.Count >= 1 Then
                        Me.btnnewmember.Enabled = False
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = (pistol_data.Rows.Count) & " " & "Record(s) Returned"
                    End If

                Catch ex As Exception
                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't find Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()
                End Try

                'Case 0
            Case 3
                'Search By Mebmer ID
                Dim sconnection As String
                Dim a As String
                Dim b As String

                a = Me.txtfirstname.Text


                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try
                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_memberid", pistolconn)

                    cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()



                    Me.grdsearch.Visible = True
                    Me.grdsearch.DataSource = pistol_data
                    Me.DataBind()


                    If pistol_data.Rows.Count = 0 And Session("rights") <> "Guest" Then
                        Me.btnnewmember.Enabled = True
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "You Are Ready To Add New Member!"
                    ElseIf pistol_data.Rows.Count = 0 And Session("rights") = "Guest" Then
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "Record Not Found."
                    ElseIf pistol_data.Rows.Count >= 1 Then
                        Me.btnnewmember.Enabled = False
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = (pistol_data.Rows.Count) & " " & "Record(s) Returned"

                    End If



                Catch ex As Exception

                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't find Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()
                End Try



    

            Case 4
                'Seacrh by First And Last Name for Old Pistol License. Data was transformed fro Old Programm Access 1997 DB.
                Dim sconnection As String
                Dim a As String
                Dim b As String

                a = Me.txtfirstname.Text

                sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
                Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
                pistolconn.Open()

                Try

                    Dim cmdpistol As SqlCommand = New SqlCommand("sel_OldLicenseByFirstLastName", pistolconn)

                    cmdpistol.Parameters.AddWithValue("@firstname", Me.txtfirstname.Text)
                    cmdpistol.Parameters.AddWithValue("@lastname", Me.txtlastname.Text)


                    cmdpistol.CommandType = Data.CommandType.StoredProcedure

                    Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

                    Dim pistol_data As Data.DataTable
                    pistol_data = New Data.DataTable
                    adppistol.Fill(pistol_data)
                    adppistol.Dispose()

                    If pistol_data.Rows.Count = 0 Then 'And Session("rights") <> "Guest" Then
                        Me.gridOldData.Visible = False
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = "Record Not Found."
                    ElseIf pistol_data.Rows.Count >= 1 Then
                        Me.gridOldData.Visible = True
                        Me.gridOldData.DataSource = pistol_data
                        Me.DataBind()
                        Me.lblcount.Visible = True
                        Me.lblcount.Text = (pistol_data.Rows.Count) & " " & "Record(s) Returned"
                    End If

                Catch ex As Exception
                    ex.Message.ToString()
                    Me.lblFailed.Visible = True
                    Me.lblFailed.Text = "Can't find Old Pistol License" & "  " & ex.Message.ToString() & "   Please contact IS.  "
                Finally
                    pistolconn.Close()
                End Try
        End Select
    End Sub


    Protected Sub grdsearch_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdsearch.RowCommand
        ' If multiple ButtonField column fields are used, use the
        ' CommandName property to determine which button was clicked.

        Try
            If e.CommandName = "Select" Then

                ' Convert the row index stored in the CommandArgument
                ' property to an Integer.
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)

                ' Get the memberid of the pistol db from the appropriate
                ' cell in the GridView control.
                Dim selectedRow As GridViewRow = grdsearch.Rows(index)
                Dim contactCell As TableCell = selectedRow.Cells(1)
                Dim pistolkey As String = contactCell.Text

                Session("memberid") = pistolkey

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Can't Retrieved Data. Please Inform IS."
        End Try
    End Sub

   
    Protected Sub grdsearch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdsearch.SelectedIndexChanged
        Response.Redirect("~/Member/console.aspx")
    End Sub

    Protected Sub btnpistolconsole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnpistolconsole.Click

    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Try
            '  Me.txtmemberid.Visible = False
            Me.txtmemberid.Text = ""
            ' Me.valMemberID.Visible = False

            Me.SearchbyDCPLID.Text = ""
            '     Me.SearchbyDCPLID.Visible = False


            '    Me.txtfirstname.Visible = False
            Me.txtfirstname.Text = ""

            '   Me.txtlastname.Visible = False
            Me.txtlastname.Text = ""

            '     Me.txtDOB.Visible = False
            Me.txtDOB.Text = ""
            Me.valDOB.Enabled = False

            '  Me.lblDOB.Visible = False
            '  Me.lblfirst.Visible = False
            '  Me.lbllast.Visible = False
            Me.lblcount.Visible = False
            Me.lbldatevalidation.Visible = False
            Me.lblFailed.Visible = False

            Me.grdsearch.Visible = False
            Me.gridOldData.Visible = False
            Me.btnnewmember.Enabled = False
            '  Me.RadioButtonList1.SelectedIndex = -1

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Clear functionality failed. Please inform IS."
        End Try
    End Sub

    Protected Sub txtDOB_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtDOB.TextChanged
        '  Call Birthdate()
    End Sub
    Public Sub Birthdate()

        'Dim sItem As String
        'sItem = Me.txtDOB.Text

        'Dim a As Integer

        'a = Me.txtDOB.Text.Length.ToString()

        'If a = 8 Then
        '    Me.txtDOB.Text = Left(Me.txtDOB.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtDOB.Text, 4)
        '    lbldatevalidation.Visible = False
        'ElseIf a < 8 Then
        '    Me.lbldatevalidation.Visible = True
        'End If

        Dim result As DateTime
        Dim returnValue As Boolean

        Me.lbldatevalidation.ForeColor = System.Drawing.Color.White

        'Validate Datetime for right Input
        returnValue = Convert.ToDateTime(Me.txtDOB.Text).TryParse(Me.txtDOB.Text, result)

        If returnValue Then
            Me.lbldatevalidation.Visible = False
        Else
            'Validatin failed.
            Me.lbldatevalidation.Visible = True
            Me.lbldatevalidation.Text = "Birthday Date was invalid. Please Click Clear Button and Search Againg."
            Me.lbldatevalidation.ForeColor = System.Drawing.Color.White
            Exit Sub
        End If

    End Sub

End Class
