Imports System.Data.SqlClient
Imports System.Data

Partial Class ArrestDetails
    Inherits System.Web.UI.Page
    Shared StatusNubmer As Integer
    Dim MentalHealth As Boolean
    Public Shared DepositionCleared As Boolean   'Check if Disposition Cleared
    Public Shared ArrestExist As Boolean 'Check if Arrest Exist
    Shared Holding As Boolean   ' get info about Holding 
    Shared FBIComplete As Boolean 'get info about FBI-GBI Complete
    Dim sStatusName As String



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If


        If Session("Rights") = "Guest" Then
            Response.Redirect("~/Member/Console.aspx")
        ElseIf Session("Rights") = "User" Then
            Response.Redirect("~/Member/Console.aspx")
        End If


        If Not Page.IsPostBack Then

            Me.lblErrorMessage.Visible = False
            Me.lblInformationMessage.Visible = False

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            'Me.txtmemberid.Text = Session("memberid")
            Me.txtdcplid.Text = Session("licenseid")

            Try

                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_checklistdetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)


                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("MemberId"))
                Me.txtdcplid.Text = CStr(tbl_pistol.Rows(0)("dcplid"))
                StatusNubmer = tbl_pistol.Rows(0)("BackGround")
                Me.txtbackgroundnotes.Text = CStr(tbl_pistol.Rows(0)("BackGroundNotes"))
                Me.txtUpdatedBy.Text = CStr(tbl_pistol.Rows(0)("UserName"))
                Me.chkMH.Checked = CStr(tbl_pistol.Rows(0)("mentalhealth"))
                Me.chkHL.Checked = CStr(tbl_pistol.Rows(0)("HospitalLetter"))
                FBIComplete = tbl_pistol.Rows(0)("FBIComplete")
                Holding = tbl_pistol.Rows(0)("Holding")


                'Get status of Record from PCPISTOL table
                Call Select_LicenseStatus()

                'Check if all rehab records are cleare
                Call SelectRehabRecordStatus()

                'Check if all dispositon record are cleare
                Call SelectDepositionClearStatus()


                'Select Radio Button, according data from PCBACKGROUND and Status from PCPISTOL

                'Select FBI-GBI Complete Radio Button
                If FBIComplete = True Then
                    Me.RDBBackground.Items.Item(0).Selected = True
                End If


                'Get Status Name
                sStatusName = Me.txtbackground.Text
                sStatusName = RTrim(sStatusName)
                sStatusName = LTrim(sStatusName)

                Select Case sStatusName
                    'Select Pending Rehab Radio Button
                    Case "Pending/Disposition"
                        Me.RDBBackground.Items.Item(1).Selected = True

                        'Mental helaht is TRUE. Arrest was existed and cleared.Select Disposition Complete.  
                        'Is no arrest was made, and no deposition clear,  then background button should not be selected. 
                    Case "Pending/FBI-GBI"
                        If ArrestExist = True And DepositionCleared = True Then
                            Me.RDBBackground.Items.Item(2).Selected = True
                        End If
                        'Mental Health is waiting, Arrest was existed and cleared. 
                    Case "Pending/Rehab"
                        If ArrestExist = True And DepositionCleared = True Then
                            Me.RDBBackground.Items.Item(2).Selected = True
                        End If

                        'Select Active Radibo Button
                    Case "Active"
                        Me.RDBBackground.Items.Item(4).Selected = True

                        'Select Denied Radio Button
                    Case "Denied"

                        'Rehab record exist, or Status was set to Denied manually; Arrest exist and not cleared
                        'Status set to Pending/Disposition
                        If ArrestExist = True And DepositionCleared = False Then
                            Me.RDBBackground.Items.Item(1).Selected = True

                            'Rehab exist or Manually status manually denied, Police Background complete, 
                            'Set background to FBI Complete
                        ElseIf FBIComplete = True Then
                            Me.RDBBackground.Items.Item(0).Selected = True

                            'No arrest exist, FBI not complete, status was denied manually or by adding Rehab,
                            'Background should be Denied
                        Else
                            Me.RDBBackground.Items.Item(5).Selected = True
                        End If



                    Case "Revoked"
                        Me.RDBBackground.Items.Item(6).Selected = True


                End Select

                'Select Holding  Radio Button. It shoul overrite all previous selections. 
                If Holding = True Then
                    Me.RDBBackground.Items.Item(0).Selected = False
                    Me.RDBBackground.Items.Item(1).Selected = False
                    Me.RDBBackground.Items.Item(2).Selected = False
                    Me.RDBBackground.Items.Item(3).Selected = True
                    Me.RDBBackground.Items.Item(4).Selected = False
                    Me.RDBBackground.Items.Item(5).Selected = False
                End If

                ''If Status is DENIED (PCPISTOL)) and BACKGROUMD is FBIComplete (PCBACKGROUND table) select FBI Complete Radio Button
                'If sStatusName = "Denied" And FBIComplete = True Then
                '    Me.RDBBackground.Items.Item(0).Selected = True
                '    Me.RDBBackground.Items.Item(5).Selected = False
                'End If

                'Do not allow to update thouse check boxes. It could be done
                'by appropriate actions only(add rehab, delete rehab, clear rehab, send letter)
                Me.chRehCl.Enabled = False
                Me.chkMH.Enabled = False
                Me.chkHL.Enabled = False


            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Please, contact IS."
            End Try
            pistolconn.Close()
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
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & " " & "Please, contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub SelectRehabRecordStatus()
        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        Dim iRehabRecordExist As Integer
        Dim iReturn As Integer = 0

        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Select_RehabClearedStatus", pistolconn)

            cmdpistol.Parameters.AddWithValue("@MemberId", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
            cmdpistol.Parameters.AddWithValue("@RehabRecordExist", iReturn)


            'Set Return Value parameters Direction
            cmdpistol.Parameters("@RehabRecordExist").Direction = ParameterDirection.Output

         
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            iRehabRecordExist = Convert.ToInt32(cmdpistol.Parameters("@RehabRecordExist").Value)

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()


            'No record in Rehab talbe, set check box to False
            If iRehabRecordExist = 0 Then
                Me.chRehCl.Checked = False

            ElseIf iRehabRecordExist = 1 Then
                'If row returned, thats' menans at least one Rehab record still not clear
                If loadTable.Rows.Count > 0 Then
                    Me.chRehCl.Checked = False
                Else
                    'All records are clea
                    Me.chRehCl.Checked = True
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
                ArrestExist = False 'Deposition Does not exist
                DepositionCleared = True ' I set to to True, bacause I have all logic done already based on this value. Thoug, DespositionComplete should be FALSE (no arrest - no disposition)

            ElseIf iArrestRecordExist = 1 Then
                'If row returned, thats' menans at least one Deposition is not clear
                If loadTable.Rows.Count > 0 Then
                    ArrestExist = True
                    DepositionCleared = False
                Else
                    'All depositions were cleared.
                    ArrestExist = True
                    DepositionCleared = True
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
    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click

        Dim Success As Integer

        Me.lblErrorMessage.Visible = False
        Me.lblInformationMessage.Visible = False


        'Status is Active, background is HOLDING, 
        If Me.txtbackground.Text = "Active" And Me.RDBBackground.Text = "Active" Then
            Success = Status()
            'Do not allow upadte status FROM Active status, its allow only in case its going to be changed to HOLDING
        ElseIf Me.txtbackground.Text = "Active" And Me.RDBBackground.Text <> "Holding" Then
            Me.lblInformationMessage.Visible = True
            Me.lblInformationMessage.Text = " License" & " " & Me.txtdcplid.Text & " " & "has ACTIVE status. You can not update License with Active status. If you want to Revoke License, please use Add Revoke License Screen."
            ' Do not allow update status FROM Revoke status. I put additional check for REVOKE status in SP. If passed status = 4, SP does not update table. 
        ElseIf Me.txtbackground.Text = "Revoked" Then
            Me.lblInformationMessage.Visible = True
            Me.lblInformationMessage.Text = " License" & " " & Me.txtdcplid.Text & " " & "has been Revoke. You can not update status for Revoke License."
            'In case, if Status is Active, and Backrodund was Acrive, and user wants to select HOLDING on backgorund. 
        Else
            Success = Status()
        End If

        If Success > 0 Then
            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Try

                Dim sppistol As SqlCommand = New SqlCommand("update_pcbackground", pistolconn)

                sppistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)
                sppistol.Parameters.AddWithValue("@background", StatusNubmer)
                sppistol.Parameters.AddWithValue("@memberID", Me.txtmemberid.Text)
                sppistol.Parameters.AddWithValue("@backgroundnotes", Me.txtbackgroundnotes.Text)
                sppistol.Parameters.AddWithValue("@mentalhealth", Me.chkMH.Checked)
                sppistol.Parameters.AddWithValue("@UserName", Session("UserName"))

                'Dim iHolding As Boolean
                'Dim iFBIComplete As Boolean

                'Check Holding Value again. If Original Background Value was holding, and background
                'was upadted to Any other value, Holding flag should be set to false. 

                If Me.RDBBackground.Text = "Holding" Then
                    Holding = True
                Else
                    Holding = False
                End If

                ''Get FBI Complete value
                'If Me.RDBBackground.Text = "FBI-GBI Complete" Then
                '    iFBIComplete = True
                'Else
                '    iFBIComplete = False
                'End If
                sppistol.Parameters.AddWithValue("@Holding", Holding)
                sppistol.Parameters.AddWithValue("@FBIComplete", FBIComplete)


                sppistol.CommandType = Data.CommandType.StoredProcedure
                sppistol.ExecuteNonQuery().ToString()

                Response.Redirect("~/License/LicenseDetails.aspx")


            Catch ex As Exception
                ex.Message.ToString()
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = ex.Message.ToString() & "Unable Update Background Check List for Licenese Number " & " " & Me.txtdcplid.Text & ".    Please, contact IS."
            Finally
                pistolconn.Close()
            End Try

        End If

    End Sub
    
    Function Status() As Integer
        Try
            'There is arrest exists for this License, Status could not be set to FBI-GBI Complete
            If Me.RDBBackground.Text = "FBI-GBI Complete" And DepositionCleared = False Then             
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "There is an Arrest Record for License " & " " & Me.txtdcplid.Text & ".   " & "Please clear Disposition or Delete Arrest for Lisence Number " & " " & Me.txtdcplid.Text & " " & " on Arrest Page."
                Return 0

                'FBI Background Selected, MentalHealth is Failed, Status is DEnied because of Rehab Record, 
                'Hospital Letter is checked (sent to Hospital), Rehab Record not Cleared.
                'Status still DENIED, FBI Flag in PCBACKGROUND will be set to true.
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And Me.txtbackground.Text = "Denied" And Me.chkMH.Checked = False And Me.chRehCl.Checked = False Then
                StatusNubmer = 2
                FBIComplete = True
                Return 1
                'ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And Me.chkMH.Checked = False And Me.chkHL.Checked = True And Me.chRehCl.Checked = False Then
                '    Me.lblInformationMessage.Visible = True
                '    Me.lblInformationMessage.Text = "Please, clear Rehab Record for  " & " " & " License" & Me.txtdcplid.Text
                '    Return 0


                'FBI Background Selected, depostion cleared, waitng for Mental Health Complete, status will be set to  Pending/Rehab
                'ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And DepositionCleared = True And Me.chkMH.Checked = False And Me.chkHL.Checked = False Then
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And DepositionCleared = True And Me.chkMH.Checked = False And Me.txtbackground.Text <> "Denied" Then
                StatusNubmer = 6
                FBIComplete = True
                Return 1

                'FBI Background Selected, Deposition Complete, Mental Health Complete, no Hospital Letter,  set Status to Active
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And DepositionCleared = True And Me.chkMH.Checked = True And Me.chkHL.Checked = False Then
                StatusNubmer = 1
                FBIComplete = True
                Return 1

                'FBI Background Selected, Deposition Complete, Mental Health Complete, Hospital Letter sent to Rehab, Rehab Record gets Cleared set Status to Active
            ElseIf Me.RDBBackground.Text = "FBI-GBI Complete" And DepositionCleared = True And Me.chkMH.Checked = True And Me.chkHL.Checked = True And Me.chRehCl.Checked = True Then
                StatusNubmer = 1
                FBIComplete = True
                Return 1

            ElseIf Me.RDBBackground.Text = "Pending Dispositions" Then
                If Me.txtbackground.Text = "Pending/Disposition" Then
                    Me.lblInformationMessage.Visible = True
                    Me.lblInformationMessage.Text = "STATUS Pending/Disposition already assigned to " & " " & " License" & " " & Me.txtdcplid.Text
                    Return 0
                Else
                    Me.lblInformationMessage.Visible = True
                    Me.lblInformationMessage.Text = "Use ADD ARREST screen to change Status to PENDING/DISPOSITION for License " & " " & Me.txtdcplid.Text
                    Return 0
                End If

            ElseIf Me.RDBBackground.Text = "Dispositions Complete" Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Use UPDATE ARREST screen to Cleare Disposition for License " & " " & Me.txtdcplid.Text
                Return 0

                'IRINA. I comment it out, Myrna said she wants to have the Possibility to put HOLDING on ACTIVE status. 
                'ElseIf Me.RDBBackground.Text = "Holding" And Me.txtbackground.Text = "Active" Then
                '    Me.lblInformationMessage.Visible = True
                '    Me.lblInformationMessage.Text = "License " & " " & Me.txtdcplid.Text & " " & "is ACTIVE. Cant' assign HOLDING status to Active"
                '    Return 0

                'Set status to "Holding", do not update Status Name in PCPISTOL. Myrna said, she wants to keep record for previous
                'status, if current status is HOLDING. 
            ElseIf Me.RDBBackground.Text = "Holding" Then
                StatusNubmer = StatusNubmer
                Holding = True
                Return 1

                'Set status Name to Active, but License was denied because of Rehab Record
                'Rehab record should be cleared
            ElseIf Me.RDBBackground.Text = "Active" And Me.txtbackground.Text = "Denied" And Me.chkHL.Checked = True And Me.chRehCl.Checked = False Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Can not activate Pistol License " & " " & Me.txtdcplid.Text & " ." & "This license was  DENIED because of Rehab Record. Please, update status from DENIED by clearing REHAB record."
                Return 0

                'Do not pass Metnal Health Check yet. 
            ElseIf Me.RDBBackground.Text = "Active" And Me.chkMH.Checked = False Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Can not activate Pistol License " & " " & Me.txtdcplid.Text & " ." & "Mental Health Check not complete."
                Return 0

                'Pass Mental Health but There is an Arrest and at least one Disposion was not cleared.
            ElseIf Me.RDBBackground.Text = "Active" And Me.chkMH.Checked = True And DepositionCleared = False Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Can not activate Pistol License " & " " & Me.txtdcplid.Text & " ." & "There is an Arrest for this License. Please, use UPDATE ARREST screen to Cleare Disposition for License "
                Return 0

                'Active Status Selected, Deposition is cleared or does not exist, Mental Health Passed, FBI-GBIComplete is False.
            ElseIf Me.RDBBackground.Text = "Active" And DepositionCleared = True And Me.chkMH.Checked = True And FBIComplete = False Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Can not activate Pistol License " & " " & Me.txtdcplid.Text & " ." & "FBI Check not complete for this Licence."
                Return 0

                'Active Status Selected, Deposition is cleared , Mental Health Passed, FBI-GBIComplete is True.
            ElseIf Me.RDBBackground.Text = "Active" And DepositionCleared = True And Me.chkMH.Checked = True And FBIComplete = True Then
                StatusNubmer = 1
                Return 1

                'Active Status Selected, there is no arrest,  Mental Health Passed, FBI-GBIComplete is True.
            ElseIf Me.RDBBackground.Text = "Active" And Me.chkMH.Checked = True And FBIComplete = True Then
                StatusNubmer = 1
                Return 1

                '    'Active Status Selected, Deposition is cleared or does not exist, Mental Health Passed. Set Status to ACTIVE
                'IRINA COmment out. It possible, that Deposition clear, but FBI-GBI flag still not complete
                'ElseIf Me.RDBBackground.Text = "Active" And DepositionCleared = True And Me.chkMH.Checked = True Then
                '    StatusNubmer = 1
                '    Return 1

                'Active Status Selected, Deposition Cleared, Mental Health is passed, Hospital Letter was sent but Rehab Record was cleared.
                'Set status to ACTIVE. 
            ElseIf Me.RDBBackground.Text = "Active" And DepositionCleared = True And Me.chkMH.Checked = True And Me.chkHL.Checked = True And Me.chRehCl.Checked = True Then
                StatusNubmer = 1
                Return 1

                'Set Status Name to "Denial"
            ElseIf Me.RDBBackground.Text = "Denial" Then
                StatusNubmer = 2
                Return 1

                'Active Status Selected, Deposition is cleared or does not exist, Mental Health Passed, FBI-GBIComplete is False.
            ElseIf Me.RDBBackground.Text = "Revoked" Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Can not Revoke Pistol License " & " " & Me.txtdcplid.Text & " ." & "Please, use Add Revoke License Menu on License Detail Page."
                Return 0


                'Status from Backgroudn box has not been selected      
            ElseIf Me.RDBBackground.Text = "" Then
                Me.lblInformationMessage.Visible = True
                Me.lblInformationMessage.Text = "Please SELECT Status in BACKGROUND BOX."
                Return 0
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Unable Update Background Check List for Licenese Number " & " " & Me.txtdcplid.Text & ".    Please, contact IS."
        End Try

    End Function

    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Dim sconnection As String
        Dim a As String

        a = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_PCbackground", pistolconn)
            find_pistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Write("Record has been deleted for member:" & " " & a)
            Response.Redirect("grid/backgroundlist.aspx")



        Catch ex As Exception
            ex.Message.ToString()

            Response.Write("Unable to Delete Record.")
        Finally
            pistolconn.Close()
        End Try
    End Sub
    Private Sub ClearRecord()


        Try
            Me.txtbackgroundnotes.Text = ""
            'Me.chkMH.Checked = False
            'Me.chkHL.Checked = False

            Me.lblErrorMessage.Visible = False
            Me.lblInformationMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = ex.Message.ToString() & "Unable Update Background Check List for Licenese Number " & " " & Me.txtdcplid.Text & ".    Please, contact IS."

        End Try
        Me.RDBBackground.SelectedIndex = -1
 

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearRecord()
    End Sub

End Class
