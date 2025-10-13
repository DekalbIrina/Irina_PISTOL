Imports System.Data.SqlClient
Imports System.Data

Partial Class ArrestDetails
    Inherits System.Web.UI.Page
    Public Shared pcarrestchargeId1 As Integer
    Public Shared pcarrestchargeId2 As Integer
    Public Shared pcarrestchargeId3 As Integer
    Public Shared pcarrestchargeId4 As Integer
    Public Shared pcarrestchargeId5 As Integer
    Public Shared pcarrestchargeId6 As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("arrestid")
            ' a = Me.Request.QueryString("id")
            Me.txtarrestid.Text = a
            Me.txtmemberid.Text = Session("memberid")
            Me.lblFailed.Visible = False


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_arrestdetails", pistolconn)

                '  find_pistol.Parameters.AddWithValue("@id", Me.txtarrestid.Text)
                find_pistol.Parameters.AddWithValue("@arrestid", Me.txtarrestid.Text)


                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtarrestid.Text = CStr(tbl_pistol.Rows(0)("ARRESTID"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
                Me.txtarrestdate.Text = CStr(tbl_pistol.Rows(0)("arrestdate"))
                Me.txtLicenseNumber.Text = CStr(tbl_pistol.Rows(0)("DCPLID"))
                'Format Empty Date field
                If tbl_pistol.Rows(0)("complicationletter") = ("01/01/1900") Or tbl_pistol.Rows(0)("complicationletter") = ("1/1/1900") Then
                    Me.txtcomplication.Text = ""
                Else
                    Me.txtcomplication.Text = CStr(tbl_pistol.Rows(0)("complicationletter"))
                End If

                Me.txtagency.Text = CStr(tbl_pistol.Rows(0)("agency"))
                Me.txtcasenumber.Text = CStr(tbl_pistol.Rows(0)("casenumber"))
                Me.txtsid.Text = CStr(tbl_pistol.Rows(0)("sid"))
                Me.txttrackingnumber.Text = CStr(tbl_pistol.Rows(0)("trackingnumber"))
                Me.txtfirstoffender.Text = CStr(tbl_pistol.Rows(0)("firstoffender"))
                Me.txtoperator.Text = CStr(tbl_pistol.Rows(0)("USERNAME"))

                Call LoadCharges()
                'Make Chagrges READ ONLY if status of License is ACTIVE
                Call DisableChargesForActive()

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Load Arrest Information. Please, contact IS."
            Finally
                pistolconn.Close()
            End Try

        End If

 
        'If Session("Rights") = "Guest" Then  '08/27/2009 Revision 12. IRINA Commnet out this code. Guest can not get to this page, program redirects it on Member Portal Screen
        '    Response.Redirect("~/Member/Console.aspx")
        'End If

        'User will should not be allow to Update or Delete Arrest Record. Revision 12 08/29/2009 IRINA
        If Session("Rights") = "User" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        End If

    End Sub
    Sub LoadCharges()

        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("sel_charge", pistolconn)

            find_pistol.Parameters.AddWithValue("@arrestid", Me.txtarrestid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
            adap.Fill(tbl_pistol)



            'Load Charges and Dispositions
    
            pcarrestchargeId1 = CStr(tbl_pistol.Rows(0)("chargeID"))
            Me.txtcharge1.Text = CStr(tbl_pistol.Rows(0)("CHARGEDESCR"))
            Me.txtdisposition1.Text = CStr(tbl_pistol.Rows(0)("DISPOSITIONDESCR"))
            Me.chkcleared1.Checked = CStr(tbl_pistol.Rows(0)("DISPOSITIONCLEARED"))
 
            pcarrestchargeId2 = CStr(tbl_pistol.Rows(1)("chargeID"))
            Me.txtcharge2.Text = CStr(tbl_pistol.Rows(1)("CHARGEDESCR"))
            Me.txtdisposition2.Text = CStr(tbl_pistol.Rows(1)("DISPOSITIONDESCR"))
            Me.chkcleared2.Checked = CStr(tbl_pistol.Rows(1)("DISPOSITIONCLEARED"))

            pcarrestchargeId3 = CStr(tbl_pistol.Rows(2)("chargeID"))
            Me.txtcharge3.Text = CStr(tbl_pistol.Rows(2)("CHARGEDESCR"))
            Me.txtdisposition3.Text = CStr(tbl_pistol.Rows(2)("DISPOSITIONDESCR"))
            Me.chkcleared3.Checked = CStr(tbl_pistol.Rows(2)("DISPOSITIONCLEARED"))
   
            pcarrestchargeId4 = CStr(tbl_pistol.Rows(3)("chargeID"))
            Me.txtcharge4.Text = CStr(tbl_pistol.Rows(3)("CHARGEDESCR"))
            Me.txtdisposition4.Text = CStr(tbl_pistol.Rows(3)("DISPOSITIONDESCR"))
            Me.chkcleared4.Checked = CStr(tbl_pistol.Rows(3)("DISPOSITIONCLEARED"))

            pcarrestchargeId5 = CStr(tbl_pistol.Rows(4)("chargeID"))
            Me.txtcharge5.Text = CStr(tbl_pistol.Rows(4)("CHARGEDESCR"))
            Me.txtdisposition5.Text = CStr(tbl_pistol.Rows(4)("DISPOSITIONDESCR"))
            Me.chkcleared5.Checked = CStr(tbl_pistol.Rows(4)("DISPOSITIONCLEARED"))

      
            pcarrestchargeId6 = CStr(tbl_pistol.Rows(5)("chargeID"))
            Me.txtcharge6.Text = CStr(tbl_pistol.Rows(5)("CHARGEDESCR"))
            Me.txtdisposition6.Text = CStr(tbl_pistol.Rows(5)("DISPOSITIONDESCR"))
            Me.chkcleared6.Checked = CStr(tbl_pistol.Rows(5)("DISPOSITIONCLEARED"))

            'Do not allow update cleared Disposition box, if Disposition was already cleared
            If Me.chkcleared1.Checked = True Then
                Me.chkcleared1.Enabled = False
            End If
            If Me.chkcleared2.Checked = True Then
                Me.chkcleared2.Enabled = False
            End If
            If Me.chkcleared3.Checked = True Then
                Me.chkcleared3.Enabled = False
            End If
            If Me.chkcleared4.Checked = True Then
                Me.chkcleared4.Enabled = False
            End If
            If Me.chkcleared5.Checked = True Then
                Me.chkcleared5.Enabled = False
            End If
            If Me.chkcleared6.Checked = True Then
                Me.chkcleared6.Enabled = False
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "" & "Unable to load Charges."
        Finally
            pistolconn.Close()
        End Try


    End Sub
    Sub DisableChargesForActive()

        Try
            Dim result As Integer
            result = Validate_LicenseStatus()

            'If status is ACTIVE, record could not be updated or Deleted
            If result = 1 Then
                MakeFieldsReadOnly()
                Me.btnupdate.Enabled = False
                Me.btnCancel.Enabled = False
                Me.btndelete.Enabled = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "License Number " & " " & Me.txtLicenseNumber.Text & " " & "has ACTIVE status. You can not Update or Delete Arrest Record for License with ACTIVE Status. "
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Unable To Disable Charges."
        End Try

    End Sub
    Sub MakeFieldsReadOnly()
        Try
            'Disable Charges, Disposition and Disposition Cleared boxes. 
            Me.txtcharge1.ReadOnly = True
            Me.txtcharge1.BackColor = Drawing.Color.Yellow
            Me.txtdisposition1.ReadOnly = True
            Me.txtdisposition1.BackColor = Drawing.Color.Yellow
            Me.chkcleared1.Enabled = False

            Me.txtcharge2.ReadOnly = True
            Me.txtcharge2.BackColor = Drawing.Color.Yellow
            Me.txtdisposition2.ReadOnly = True
            Me.txtdisposition2.BackColor = Drawing.Color.Yellow
            Me.chkcleared2.Enabled = False

            Me.txtcharge3.ReadOnly = True
            Me.txtcharge3.BackColor = Drawing.Color.Yellow
            Me.txtdisposition3.ReadOnly = True
            Me.txtdisposition3.BackColor = Drawing.Color.Yellow
            Me.chkcleared3.Enabled = False

            Me.txtcharge4.ReadOnly = True
            Me.txtcharge4.BackColor = Drawing.Color.Yellow
            Me.txtdisposition4.ReadOnly = True
            Me.txtdisposition4.BackColor = Drawing.Color.Yellow
            Me.chkcleared4.Enabled = False

            Me.txtcharge5.ReadOnly = True
            Me.txtcharge5.BackColor = Drawing.Color.Yellow
            Me.txtdisposition5.ReadOnly = True
            Me.txtdisposition5.BackColor = Drawing.Color.Yellow
            Me.chkcleared5.Enabled = False

            Me.txtcharge6.ReadOnly = True
            Me.txtcharge6.BackColor = Drawing.Color.Yellow
            Me.txtdisposition6.ReadOnly = True
            Me.txtdisposition6.BackColor = Drawing.Color.Yellow
            Me.chkcleared6.Enabled = False


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Unable To Disable All Fields. Please inform IS."
        End Try

    End Sub
    Sub ClearFields()
        Try
            Me.txtagency.Text = ""
            Me.txtarrestdate.Text = ""
            Me.txtcasenumber.Text = ""
            Me.txtcharge1.Text = ""
            Me.txtcharge2.Text = ""
            Me.txtcharge3.Text = ""
            Me.txtcharge4.Text = ""
            Me.txtcharge5.Text = ""
            Me.txtcharge6.Text = ""
            Me.txtdisposition1.Text = ""
            Me.txtdisposition2.Text = ""
            Me.txtdisposition3.Text = ""
            Me.txtdisposition4.Text = ""
            Me.txtdisposition5.Text = ""
            Me.txtdisposition6.Text = ""
            Me.txtsid.Text = ""
            Me.txtcomplication.Text = ""
            Me.txttrackingnumber.Text = ""
            Me.txtfirstoffender.Text = ""
            Me.lblFailed.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Clear Information for:" & " " & " " & Session("firstname") & " " & Session("lastname") & "  " & "Please, contact IS."
        End Try

    End Sub
    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
        Try

            ''Do not allow to update Arrest to Active License. If there is an arrestt for Active license, license could be revoked or denied. 
            'IT WAS MY OWN PERSEPTION. I DELETED THIS FUNCTIONALITY, maybe they have to have ability to update record. Anyway they are not able to clear it, 
            ''if Clear Field is checked, its not updatable, and I am not allow to add new chages in LoadCharghesForActive() function
            'Dim result As Integer
            'result = Validate_LicenseStatus()
            'If result = 1 Then
            '    Me.lblFailed.Visible = True
            '    Me.lblFailed.Text = "License Number " & " " & Me.txtLicenseNumber.Text & " " & "has ACTIVE status. You can not update arrest for License with ACTIVE Status. "
            '    Exit Sub

            'At least one charge should be added for arrest. 
            If Me.txtcharge1.Text = "" And _
                Me.txtcharge2.Text = "" And _
                Me.txtcharge3.Text = "" And _
                Me.txtcharge4.Text = "" And _
                Me.txtcharge5.Text = "" And _
                Me.txtcharge6.Text = "" Then

                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Please describe at least one charge for this arrest."
                Exit Sub

                'Do not allow Clear Disposition if there is no correspondend Charge Description. 
            ElseIf Me.chkcleared1.Checked = True And Me.txtcharge1.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 1. Please Enter Charges 1 and then clear Disposition 1."
                Exit Sub
            ElseIf Me.chkcleared2.Checked = True And Me.txtcharge2.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 2. Please Enter Charges 2 and then clear Disposition 2."
                Exit Sub
            ElseIf Me.chkcleared3.Checked = True And Me.txtcharge3.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 3. Please Enter Charges 3 and then clear Disposition 3."
                Exit Sub
            ElseIf Me.chkcleared4.Checked = True And Me.txtcharge4.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 4. Please Enter Charges 4 and then clear Disposition 1."
                Exit Sub
            ElseIf Me.chkcleared5.Checked = True And Me.txtcharge5.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 5. Please Enter Charges 5 and then clear Disposition 5."
                Exit Sub
            ElseIf Me.chkcleared6.Checked = True And Me.txtcharge6.Text = "" Then
                Me.lblUpdateSuccess.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "There is no Charges for Disposition 6. Please Enter Charges 6 and then clear Disposition 6."
                Exit Sub
            Else
                Me.lblFailed.Visible = False
                Call UpdateArrest()
            End If
        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Not able to Update Arrest Record. Please Inform IS."
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
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtLicenseNumber.Text)


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
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & " " & "Not able to get License Status. Please inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Function
    Sub UpdateArrest()

        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Me.lblFailed.Visible = False

        Try

            Dim sppistol As SqlCommand = New SqlCommand("update_pcarrest", pistolconn)

            sppistol.Parameters.AddWithValue("@MemberID", Me.txtmemberid.Text)
            sppistol.Parameters.AddWithValue("@id", Me.txtarrestid.Text)
            sppistol.Parameters.AddWithValue("@arrestdate", Me.txtarrestdate.Text)
            sppistol.Parameters.AddWithValue("@dcplid", Me.txtLicenseNumber.Text)


            sppistol.Parameters.AddWithValue("@chargeId1", pcarrestchargeId1)
            sppistol.Parameters.AddWithValue("@chargedesc1", Me.txtcharge1.Text)
            sppistol.Parameters.AddWithValue("@disposition1", Me.txtdisposition1.Text)
            sppistol.Parameters.AddWithValue("@cleared1", Me.chkcleared1.Checked)

            sppistol.Parameters.AddWithValue("@chargeId2", pcarrestchargeId2)
            sppistol.Parameters.AddWithValue("@chargedesc2", Me.txtcharge2.Text)
            sppistol.Parameters.AddWithValue("@disposition2", Me.txtdisposition2.Text)
            sppistol.Parameters.AddWithValue("@cleared2", Me.chkcleared2.Checked)

            sppistol.Parameters.AddWithValue("@chargeId3", pcarrestchargeId3)
            sppistol.Parameters.AddWithValue("@chargedesc3", Me.txtcharge3.Text)
            sppistol.Parameters.AddWithValue("@disposition3", Me.txtdisposition3.Text)
            sppistol.Parameters.AddWithValue("@cleared3", Me.chkcleared3.Checked)

            sppistol.Parameters.AddWithValue("@chargeId4", pcarrestchargeId4)
            sppistol.Parameters.AddWithValue("@chargedesc4", Me.txtcharge4.Text)
            sppistol.Parameters.AddWithValue("@disposition4", Me.txtdisposition4.Text)
            sppistol.Parameters.AddWithValue("@cleared4", Me.chkcleared4.Checked)



            sppistol.Parameters.AddWithValue("@chargeId5", pcarrestchargeId5)
            sppistol.Parameters.AddWithValue("@chargedesc5", Me.txtcharge5.Text)
            sppistol.Parameters.AddWithValue("@disposition5", Me.txtdisposition5.Text)
            sppistol.Parameters.AddWithValue("@cleared5", Me.chkcleared5.Checked)

            sppistol.Parameters.AddWithValue("@chargeId6", pcarrestchargeId6)
            sppistol.Parameters.AddWithValue("@chargedesc6", Me.txtcharge6.Text)
            sppistol.Parameters.AddWithValue("@disposition6", Me.txtdisposition6.Text)
            sppistol.Parameters.AddWithValue("@cleared6", Me.chkcleared6.Checked)

            sppistol.Parameters.AddWithValue("@agency", Me.txtagency.Text)
            sppistol.Parameters.AddWithValue("@casenumber", Me.txtcasenumber.Text)
            sppistol.Parameters.AddWithValue("@complicationletter", Me.txtcomplication.Text)
            sppistol.Parameters.AddWithValue("@sid", Me.txtsid.Text)
            sppistol.Parameters.AddWithValue("@firstoffender", Me.txtfirstoffender.Text)
            sppistol.Parameters.AddWithValue("@trackingnumber", Me.txttrackingnumber.Text)
            sppistol.Parameters.AddWithValue("@username", Me.txtoperator.Text)

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()


            'IRINA. I comment out this code. Now as soon as user update page, he will be redirected to Histopy page.
            'Reason for that: I want to prevent situation, when user clear Disposition, and add new charges after. That's will screw up Status. 
            'Do not allow update Dispositon Clear box again. Information already stored into DB and all
            'relative changes had been done. 
            'Call DisableDispositionCleared()

            'Me.lblUpdateSuccess.Visible = True
            ' Me.lblUpdateSuccess.Text = "Arrest data has been updated for:" & " " & " " & Session("firstname") & " " & Session("lastname")

            Response.Redirect("~/GRID/ArrestList.aspx")


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Update Arrest Information for:" & " " & " " & Session("firstname") & " " & Session("lastname") & "  " & "Please, contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    'IRINA. I dont use this sub. 
    Sub DisableDispositionCleared()
        Try
            If Me.chkcleared1.Checked = True Then
                Me.chkcleared1.Enabled = False
                ' Call MakeFieldsReadOnly()
            End If

            If Me.chkcleared2.Checked = True Then
                Me.chkcleared2.Enabled = False
                'Call MakeFieldsReadOnly()
            End If

            If Me.chkcleared3.Checked = True Then
                Me.chkcleared3.Enabled = False

            End If

            If Me.chkcleared4.Checked = True Then
                Me.chkcleared4.Enabled = False

            End If

            If Me.chkcleared5.Checked = True Then
                Me.chkcleared5.Enabled = False

            End If

            If Me.chkcleared6.Checked = True Then
                Me.chkcleared6.Enabled = False

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Not able to clear Dipositin Check Box. Please, Inform IS."
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

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcarrest", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txtarrestid.Text)
            find_pistol.Parameters.AddWithValue("@DCPLID", Me.txtLicenseNumber.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/grid/arrestlist.aspx")


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Unable to Delete Member :  " & " " & a
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub Menu1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Menu1.Load
        Session("ArrestID") = Me.txtarrestid.Text
        Session("Memberid") = Me.txtmemberid.Text
        Session("licenseid") = Me.txtLicenseNumber.Text
    End Sub

   
    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Call ClearFields()
    End Sub
End Class
