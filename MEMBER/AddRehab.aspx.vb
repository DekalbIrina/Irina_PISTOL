Imports System.Data.SqlClient
Imports System.Data

Partial Class AddRehab
    Inherits System.Web.UI.Page
    Shared weekNumber As Integer

    Sub PhoneMask()
        Dim sItem As String
        sItem = Me.txtphonenumber.Text

        Dim a As Integer

        a = Me.txtphonenumber.Text.Length.ToString()

        If a = 10 Then
            Me.txtphonenumber.Text = Left(txtphonenumber.Text, 3) & "-" & sItem.Substring(3, 3) & "-" & Right(txtphonenumber.Text, 4)
            lblphonevalidation.Visible = False
        ElseIf a < 10 Then
            Me.lblphonevalidation.Visible = True
        End If
    End Sub

    Sub clearrecord()
        Try
            Me.ddLicenseNumber.Items.Add("")
            Me.ddLicenseNumber.SelectedValue = ""
            Me.txtaddress.Text = ""
            Me.txtdoctorsname.Text = ""
            Me.txtdoctorslastname.Text = ""
            Me.txthospital.Text = ""
            Me.txtemail.Text = ""
            Me.txtphonenumber.Text = ""
            Me.txtcity.Text = ""
            Me.txtstate.Text = ""
            Me.txtzip.Text = ""
            Me.txtdatefrom.Text = ""
            Me.txtdateto.Text = ""
            Me.txtrehab.Text = ""
            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "  " & " Please Inform IS."
        End Try
    End Sub

    Protected Sub btnnewmember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewmember.Click
        Try
            Dim result As Integer
            result = Validate_LicenseStatus()

            'Do not allow to add Rehab Record to Active License. If there is an unknown Rehab will be added to  Active license, 
            'license should be revoked or denied. 
            If result = 1 Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License Number " & " " & Me.ddLicenseNumber.SelectedValue.ToString() & " " & "has ACTIVE status. You can not add Rehab Record to License with ACTIVE Status. "
                Exit Sub
                'Do not allow add Rehab Record if correspondedn Batch was not send to DHR to evaluate Mental Health. 
            ElseIf result = 2 Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License Number " & " " & Me.ddLicenseNumber.SelectedValue.ToString() & " " & "assigned to Batch # " & weekNumber & " " & ", which was not send to Mental Health Department. You are not allowed to Add Rehab Record. "
                Exit Sub
                'I comment it out for Release 1, Revision 11. 
                'Reason: it could be scenario, when FBI-GBI Complete Flag set to true for License.
                'Rehab Record should be added BEFORE return from State filed on Batch screen will be updated. 
                ' When Admin will update Retunred From State field on Update Batch Detail screen, program will automatically assign this license status to ACTIVE. And there is no way to add rehab record to license with active status. Procedure should be like that: Admin get documents from MHD, ADD 
                'REHAB RECORD and then will update Returned From State Field on Batch screen.

                'ElseIf result = 3 Then
                '    Me.lblErrorMessage.Visible = True
                '    Me.lblErrorMessage.Text = "License Number " & " " & Me.ddLicenseNumber.SelectedValue.ToString() & " " & "assigned to Batch # " & weekNumber & " " & ", which was not returned from  Mental Health Department. You are not allowed to Add Rehab Record. "
                '    Exit Sub
            Else
                Me.lblErrorMessage.Visible = False
                Call AddRehab()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Not able to Add Rehab. Please inform IS."
        End Try

    End Sub
    Function Validate_LicenseStatus() As Integer

        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)

            cmdpistol.Parameters.AddWithValue("@MemberId", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.ddLicenseNumber.SelectedValue.ToString())

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            If loadTable.Rows(0)("Status") = 1 Then
                Return 1
            ElseIf loadTable.Rows(0)("StateMailed") = ("01/01/1900") Or loadTable.Rows(0)("StateMailed") = ("1/1/1900") Then
                weekNumber = loadTable.Rows(0)("Batchweek")
                Return 2
            ElseIf loadTable.Rows(0)("StateReturned") = ("01/01/1900") Or loadTable.Rows(0)("StateReturned") = ("1/1/1900") Then
                weekNumber = loadTable.Rows(0)("Batchweek")
                Return 3
            End If


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Not able to get License Status. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Function
    Sub AddRehab()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcrehab", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.ddLicenseNumber.Text)
            cmdpistol.Parameters.AddWithValue("@hospitalname", Me.txthospital.Text)
            cmdpistol.Parameters.AddWithValue("@address", Me.txtaddress.Text)
            cmdpistol.Parameters.AddWithValue("@city", Me.txtcity.Text)
            cmdpistol.Parameters.AddWithValue("@state", Me.txtstate.Text)
            cmdpistol.Parameters.AddWithValue("@zip", Me.txtzip.Text)
            cmdpistol.Parameters.AddWithValue("@doctorsfirstname", Me.txtdoctorsname.Text)
            cmdpistol.Parameters.AddWithValue("@doctorslastname", Me.txtdoctorslastname.Text)
            cmdpistol.Parameters.AddWithValue("@phonenumber", Me.txtphonenumber.Text)
            cmdpistol.Parameters.AddWithValue("@rehabdesc", Me.txtrehab.Text)
            cmdpistol.Parameters.AddWithValue("@email", Me.txtemail.Text)
            cmdpistol.Parameters.AddWithValue("@datefrom", Me.txtdatefrom.Text)
            cmdpistol.Parameters.AddWithValue("@dateto", Me.txtdateto.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()
            Response.Redirect("~/Grid/RehabList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "  " & " Please Inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If


        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnnewmember.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txthospital.ClientID & _
        "').focus();return false;}} else {return true}; ")


        If Not Page.IsPostBack Then

            Dim mystring As String = Session("memberid")
            Me.txtmemberid.Text = mystring

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
            Me.txtOperator.Text = Session("username")

            Call LoadLicenseNumber()

            If Session("Rights") = "Guest" Then
                Response.Redirect("~/Member/Console.aspx")
            ElseIf Session("Rights") = "User" Then
                Response.Redirect("~/Member/Console.aspx")
            End If

        End If


    End Sub
    Sub LoadLicenseNumber()

        'This Routine Load all Licenses Number, which assigned to Selected Member

        Dim sconnection As String


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Me.lblErrorMessage.Visible = False

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("select_PistolLicenseNumber", pistolconn)
            Dim cboTbl As System.Data.DataTable = New Data.DataTable

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cmdpistol.ExecuteNonQuery()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cboLoadAdapter.Fill(cboTbl)

            'Check if License is exist for this Member and change color of drop down box, if not
            If cboTbl.Rows.Count > 0 Then
                'Load Table
                Me.ddLicenseNumber.DataSource = cboTbl
                Me.ddLicenseNumber.DataTextField = "dcplid"

                'Loop through Table to load Drop Donw Box
                For count As Integer = 0 To cboTbl.Rows.Count - 1
                    Me.ddLicenseNumber.Items.Add(cboTbl.Rows(count)("dcplid"))

                Next

                'Add this option to be able to update all DCPLID
                '       Me.ddLicenseNumber.Items.Add("Select All")
                'IRINA. DELETE THIS OPTION. 
                'Else
                '    Me.ddLicenseNumber.Items.Add("No License Exist.")
                '    Me.ddLicenseNumber.BackColor = Drawing.Color.Cyan
            Else
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License for member " & " " & Me.lblmember.Text & " " & " was not created. Please, create a License before adding Rehab Record."
            End If



        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "  " & " Please Inform IS."
        Finally
            pistolconn.Close()
        End Try
    End Sub

    Protected Sub txtphonenumber_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtphonenumber.TextChanged
        PhoneMask()
    End Sub

    Protected Sub bntCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bntCancel.Click
        Call clearrecord()
    End Sub
End Class
