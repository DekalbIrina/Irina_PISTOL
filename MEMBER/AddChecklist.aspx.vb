Imports System.Data.SqlClient
Imports System.Data


Partial Class AddCheckList
    Inherits System.Web.UI.Page
    Shared StatusNubmer As Integer
    Dim FBIComplete As Boolean
    Dim Holding As Boolean

    Protected Sub btnchecklist_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnchecklist.Click

        Dim Success As Integer
        'This functioin assign status. Its return 0 when Deposition or Pending/Deposition Radio button 
        'For those options Record should not be inserted. 
        Success = Status()

        If Success > 0 Then
            Dim sconnection As String

            Dim a As String
            Dim b As String

            a = Me.txtmemberid.Text
            b = Me.lblmember.Text
            Me.lblErrorMessage.Visible = False

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Try

                Dim cmdpistol As SqlCommand = New SqlCommand("insert_Background", pistolconn)

                cmdpistol.Parameters.AddWithValue("@MemberId", Me.txtmemberid.Text)
                cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
                cmdpistol.Parameters.AddWithValue("@background", StatusNubmer)
                cmdpistol.Parameters.AddWithValue("@FBIComplete", FBIComplete)
                cmdpistol.Parameters.AddWithValue("@BatchNumber", Me.txtBatchNumber.Text)
                cmdpistol.Parameters.AddWithValue("@backgroundnotes", Me.txtbackgroundnotes.Text)
                cmdpistol.Parameters.AddWithValue("@mentalhealth", Me.chkmentalhealth.Checked)
                cmdpistol.Parameters.AddWithValue("@hospitalletter", Me.chkhospitalletter.Checked)
                cmdpistol.Parameters.AddWithValue("@Holding", Holding)
                cmdpistol.Parameters.AddWithValue("@userName", Session("username"))



                cmdpistol.CommandType = Data.CommandType.StoredProcedure

                Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
                cmdpistol.ExecuteNonQuery()
                pre_adap.Dispose()

                'Response.Redirect("~/grid/BackgroundList.aspx")
                Response.Redirect("~/License/LicenseDetails.aspx")


            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = ex.Message.ToString() & "Please Contact IS."

            Finally
                pistolconn.Close()
            End Try

        End If


    End Sub
    Function Status() As Integer

        Try
            'There is arrest exists for this License, Status could not be set to FBI-GBI Complete
            If Me.RDBBackground.Text = "FBI-GBI Complete" And Me.txtbackground.Text = "Pending/Disposition" Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "There is an Arrest Record for License " & " " & Me.txtdcplid.Text & " " & "Please clear Disposition or Delete Arrest for Lisence Number " & " " & Me.txtdcplid.Text & " " & " on Arrest Page."
                Return 0
                'FBI Background Complete, waitng for Mental Health Complete, status is Pending/Rehab
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And Me.chkmentalhealth.Checked = False Then
                StatusNubmer = 6
                'Update FBIComplete field 
                FBIComplete = True
                Return 1
                'FBI Background Complete, Mental Healt Complete, set Status to Active
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And Me.chkmentalhealth.Checked = True Then
                StatusNubmer = 1
                Return 1



            ElseIf Me.RDBBackground.Text = "Pending Dispositions" Then

                If Me.txtbackground.Text = "Pending/Disposition" Then
                    Me.lblInformationMessage.Visible = True
                    Me.lblInformationMessage.Text = "STATUS Pending/Disposition already assigned to " & " " & " License" & " " & Me.txtdcplid.Text
                    Return 0
                Else
                    Me.lblInformationMessage.Visible = True
                    Me.lblInformationMessage.Text = "Use ADD ARREST screen to change status to Pending/Disposition" & " " & "for License " & " " & Me.txtdcplid.Text
                    Return 0

                End If

            ElseIf Me.RDBBackground.Text = "Dispositions Complete" Then

                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Use UPDATE ARREST screen to Clear Disposition for License " & " " & Me.txtdcplid.Text
                Return 0

                'Set Status to "Automatic"
            ElseIf Me.RDBBackground.Text = "Automatic" Then
                StatusNubmer = 5
                Return 1

                'Set status Name to "Holding", status number should not change. 
                'Based on Myrna, she wants to see previous status Name, even if record is holding.
                'Previous Status Name on Add Check List screen could be ONLY Pending/FBI-GBI. All other status will be call from Update Check List screen. 
            ElseIf Me.RDBBackground.Text = "Holding" Then
                StatusNubmer = StatusNubmer
                Holding = True
                Return 1


                'Set Status Name to "Denial"
            ElseIf Me.RDBBackground.Text = "Denial" Then
                StatusNubmer = 2
                Return 1

                'Value of Status should be selected. 
            ElseIf Me.RDBBackground.Text = "" Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Please SELECT Status in BACKGROUND BOX."
                Return 0
     
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Please Contact IS."
        End Try

    End Function
    Function Validate_Background_Existence() As Integer

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Validate_Background_Exist", pistolconn)

            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            'Background check was already added
            If loadTable.Rows.Count > 0 Then
                Return 1
            Else
                'There is no Background check
                Return 0
                Exit Function
            End If


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Please Contact IS."
            Return -1
        Finally
            pistolconn.Close()

        End Try


    End Function

    Private Sub ClearRecord()
        Try
            ' Me.RDBBackground.Text = ""
            Me.RDBBackground.SelectedIndex = -1
            Me.txtbackgroundnotes.Text = ""
            'Me.chkmentalhealth.Checked = False
            'Me.chkhospitalletter.Checked = False

            Me.lblInformationMessage.Visible = False
            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Please Contact IS."
        End Try

   
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/License/LicenseDetails.aspx")
        ElseIf Session("Rights") = "User" Then
            Response.Redirect("~/License/LicenseDetails.aspx")
        End If


        If Not Page.IsPostBack Then
            Dim mystring As String = Session("memberid")
            Me.txtmemberid.Text = mystring

            Dim mylicense As String = Session("licenseid")
            Me.txtdcplid.Text = mylicense

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
            Me.txtUser.Text = Session("username")

            Dim result As Integer
            'Define, if Background Check list was already created 
            result = Validate_Background_Existence()
            If result = 0 Then
                Call Select_LicenseStatus()
                Call SelectDepositionClearStatus()
            Else
                Response.Redirect("~/Member/ChecklistDetails.aspx")
            End If
        End If

    End Sub
    Sub Select_LicenseStatus()

        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)


            cmdpistol.Parameters.AddWithValue("@MemberId", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            StatusNubmer = loadTable.Rows(0)("Status")
            Me.txtbackground.Text = CStr(loadTable.Rows(0)("NewStatus"))
            Me.txtBatchNumber.Text = loadTable.Rows(0)("BatchWeek")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Please Contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub SelectDepositionClearStatus()
        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        Dim iArrestRecordExist As Integer
        Dim iReturn As Integer = 0

        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Select_DepositionCleared", pistolconn)

            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
            cmdpistol.Parameters.AddWithValue("@ArrestRecordExist", iReturn)

            'Set Return Value parameters Direction
            cmdpistol.Parameters("@ArrestRecordExist").Direction = ParameterDirection.Output

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            'Get value back from SP
            iArrestRecordExist = Convert.ToInt32(cmdpistol.Parameters("@ArrestRecordExist").Value)

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            'No arrest Record
            If iArrestRecordExist = 0 Then
                ' DepositionCleared = True
                ' DepositionComplete = False 'Deposition Does not exist
            ElseIf iArrestRecordExist = 1 Then
                'If row returned, thats' menans at least one Deposition not clear
                If loadTable.Rows.Count > 0 Then
                    Me.RDBBackground.Items(1).Selected = True
                Else
                    'All depositions were cleared. 
                    Me.RDBBackground.Items(2).Selected = True
                End If
            End If



        Catch ex As Exception
            ex.Message.ToString()
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Please, contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Call ClearRecord()

    End Sub

    Protected Sub RDBBackground_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RDBBackground.SelectedIndexChanged

    End Sub
End Class
