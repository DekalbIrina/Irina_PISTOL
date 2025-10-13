Imports System.Data.SqlClient
Imports System.Data


Partial Class AddArrest
    Inherits System.Web.UI.Page

    Sub clearrecord()
        Try
            Me.ddLicenseNumber.Items.Add("")
            Me.ddLicenseNumber.SelectedValue = ""
            Me.txtarrestdate.Text = ""
            Me.txtcharge1.Text = ""
            Me.txtcharge2.Text = ""
            Me.txtcharge3.Text = ""
            Me.txtcharge4.Text = ""
            Me.txtcharge5.Text = ""
            Me.txtcharge6.Text = ""

            Me.txtagency.Text = ""
            Me.txtcasenumber.Text = ""
            Me.txtsid.Text = ""
            Me.txttrackingnumber.Text = ""
            Me.ddfirstoffender.Text = ""
            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = (ex.Message.ToString()) & "Unable to Clear Arrest Screen. Please, infomrm IS."

        End Try
    
    End Sub

    Sub DateMask()

        Dim sItem As String
        sItem = Me.txtarrestdate.Text

        Dim a As Integer

        a = Me.txtarrestdate.Text.Length.ToString()

        If a = 8 Then
            Me.txtarrestdate.Text = Left(Me.txtarrestdate.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtarrestdate.Text, 4)
            lbldatevalidation.Visible = False
        ElseIf a < 8 Then
            Me.lbldatevalidation.Visible = True
        End If

    End Sub
    

    Protected Sub btnAddNewArrest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddNewArrest.Click

        Try
            Dim result As Integer
            result = Validate_LicenseStatus()

            'Do not allow to add Arrest to Active License. If there is an arrest for Active license, license could be revoked or denied. 
            If result = 1 Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License Number " & " " & Me.ddLicenseNumber.SelectedValue.ToString() & " " & "has ACTIVE status. You can not add arrest to License with ACTIVE Status. "
                Exit Sub
                'At least one charge should be added for arrest. 
            ElseIf Me.txtcharge1.Text = "" And _
                Me.txtcharge2.Text = "" And _
                Me.txtcharge3.Text = "" And _
                Me.txtcharge4.Text = "" And _
                Me.txtcharge5.Text = "" And _
                Me.txtcharge6.Text = "" Then

                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Please describe at least one charge for this arrest."
                Exit Sub
            Else
                Me.lblErrorMessage.Visible = False
                Call AddArrest()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Not able to Add Arrest Record. Please inform IS."
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

            Dim Status As Integer
            Status = loadTable.Rows(0)("Status")

            Return Status

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Not able to get License Status. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Function
    Sub AddArrest()

        Dim sconnection As String
        Dim a As String
        Dim b As String
        Dim ArrestIDReturned As Integer = 0
        Dim ArrestIDPassed As Integer = 0
        Dim ChargesCount As Integer = 0


        a = Me.txtmemberid.Text
        b = Me.lblmember.Text
        Me.lblErrorMessage.Visible = False

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try


            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcarrest", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.ddLicenseNumber.SelectedValue)
            cmdpistol.Parameters.AddWithValue("@arrestdate", Me.txtarrestdate.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr1", Me.txtcharge1.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr2", Me.txtcharge2.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr3", Me.txtcharge3.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr4", Me.txtcharge4.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr5", Me.txtcharge5.Text)
            cmdpistol.Parameters.AddWithValue("@ChargeDescr6", Me.txtcharge6.Text)
            cmdpistol.Parameters.AddWithValue("@Agency", Me.txtagency.Text)
            cmdpistol.Parameters.AddWithValue("@casenumber", Me.txtcasenumber.Text)
            cmdpistol.Parameters.AddWithValue("@sid", Me.txtsid.Text)
            cmdpistol.Parameters.AddWithValue("@TrackingNumber", Me.txttrackingnumber.Text)
            cmdpistol.Parameters.AddWithValue("@firstoffender", Me.ddfirstoffender.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)



            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            'Response.Redirect("~/Member/ArrestDetails.aspx") --Can't get Arrest ID, that's why we have to go to Grid First
            Response.Redirect("~/Grid/ArrestList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = (ex.Message.ToString()) & "  " & " Unable add Arrest for Member " & b & " " & "Please, infomrm IS."
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
        Me.btnAddNewArrest.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtarrestdate.ClientID & _
        "').focus();return false;}} else {return true}; ")

        If Not Page.IsPostBack Then

            Dim mystring As String = Session("memberid")
            Me.txtmemberid.Text = mystring

            Dim sOperator As String = Session("username")

            Me.txtOperator.Text = sOperator
            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

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

                '    'Add this option to be able to update all DCPLID
                '    '    Me.ddLicenseNumber.Items.Add("Select All")
                ' IRINA. DELETE THIS OPTION. 

                'Else
                '    Me.ddLicenseNumber.Items.Add("No License Exist.")
                '    Me.ddLicenseNumber.BackColor = Drawing.Color.Cyan
            Else
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "License for member " & " " & Me.lblmember.Text & " " & " was not created. Please, create a License before adding Arrest Record."
            End If



        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "  " & " Please Inform IS."
        Finally
            pistolconn.Close()
        End Try
    End Sub

    Protected Sub bntCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bntCancel.Click
        Call clearrecord()
    End Sub
End Class
