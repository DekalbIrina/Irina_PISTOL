Imports System.Data.SqlClient


Partial Class AddCopyIssuedLicense
    Inherits System.Web.UI.Page

    Protected Sub btnAddCopyLicense_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCopyLicense.Click

        Try
            If Me.txtLicenseStatus.Text <> "Active" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can not add Copy License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Status for License " & " " & Me.txtdcplid.Text & "is not ACTIVE."
                Exit Sub
                'Do not allow to add Copy License, if License there is no issue date
            ElseIf Me.txtIssueDate.Text = "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can not Add Copy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & "License Nubmer " & " " & Me.txtdcplid.Text & " " & "was not issued. "
                Exit Sub
            ElseIf Me.txtdateoriginMailed.Text = "" Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can't Add Copy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & "License  " & " " & Me.txtdcplid.Text & " " & "was not mailed. "
                Exit Sub
                'License could not be lost,  before Mailing
            ElseIf Convert.ToDateTime(Me.txtLostInMail.Text) < Convert.ToDateTime(Me.txtdateoriginMailed.Text) Then
                Me.lblErrorMessage.Visible = True
                Me.lblErrorMessage.Text = "Can't Add Copy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Original License Mailed Date should be older, then License Lost in Mail Date"
                Exit Sub
            Else
                Call AddCopyLicense()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't add Copy License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        End Try

    End Sub
    Sub AddCopyLicense()
        Dim sconnection As String
        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_PCCopyIssuedInMail", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
            cmdpistol.Parameters.AddWithValue("@LostInMailDate", Me.txtLostInMail.Text)
            cmdpistol.Parameters.AddWithValue("@LicenseMailedDate", Me.txtdateoriginMailed.Text)
            cmdpistol.Parameters.AddWithValue("@CopyIssuedDate", Me.txtCopyLicenseIssued.Text)
            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtoperatorname.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            Session("licenseid") = Me.txtdcplid.Text
            Response.Redirect("~/Grid/CopyLicenseList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can not add Copy License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Sub clearrecord()
        Try
            Me.txtLostInMail.Text = ""
            Me.txtComments.Text = ""

            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't clear Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."

        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Check if session has been expired. If yes, programm redirected to login page. 
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/License/LicenseDetails.aspx")
        End If

        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnAddCopyLicense.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtLostInMail.ClientID & _
        "').focus();return false;}} else {return true}; ")

        Try
            If Not Page.IsPostBack Then
                Call RetrieveInfoCopyLicense()
            End If


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Load Page forCopy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."

        End Try


    End Sub
    Sub RetrieveInfoCopyLicense()
        Try

            Dim mystring As String = Session("memberid")
            Me.txtmemberid.Text = mystring

            Dim mylicense As String = Session("licenseid")
            Me.txtdcplid.Text = mylicense

            Me.txtoperatorname.Text = Session("username")

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

            'Me.txtCopyLicenseIssued.Text = Date.Now
            Me.txtCopyLicenseIssued.Text = Convert.ToString(Format(Now, "MM-dd-yyyy"))

            Me.lblErrorMessage.Visible = False

            Call LoadDatesInformation()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Load Infro for  Copy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        End Try

    End Sub
    Sub LoadDatesInformation()
        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)
            Dim cboTbl As System.Data.DataTable = New Data.DataTable

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure
            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cmdpistol.ExecuteNonQuery()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()


            Me.txtLicenseStatus.Text = CStr(cboTbl.Rows(0)("NewStatus"))
            'Modify dates fields for empty value
            If CStr(cboTbl.Rows(0)("LicenseIssued")) = ("01/01/1900") Or CStr(cboTbl.Rows(0)("LicenseIssued")) = ("1/1/1900") Then
                Me.txtIssueDate.Text = ""
            Else
                Me.txtIssueDate.Text = CStr(cboTbl.Rows(0)("LicenseIssued"))
            End If

            If CStr(cboTbl.Rows(0)("LicenseExpiration")) = ("01/01/1900") Or CStr(cboTbl.Rows(0)("LicenseExpiration")) = ("1/1/1900") Then
                Me.txtExpirationDate.Text = ""
            Else
                Me.txtExpirationDate.Text = CStr(cboTbl.Rows(0)("LicenseExpiration"))
            End If

            If CStr(cboTbl.Rows(0)("LicenseMailed")) = ("01/01/1900") Or CStr(cboTbl.Rows(0)("LicenseMailed")) = ("1/1/1900") Then
                Me.txtdateoriginMailed.Text = ""
            Else
                Me.txtdateoriginMailed.Text = CStr(cboTbl.Rows(0)("LicenseMailed"))
            End If


        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Load Dates Information for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call clearrecord()
    End Sub
End Class
