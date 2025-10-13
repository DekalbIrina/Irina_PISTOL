Imports System.Data.SqlClient

Partial Class DuplicateLicenseDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txtdcplid.Text = Session("licenseid")
            Me.txtmemberid.Text = Session("memberid")


            Me.lblFailed.Visible = False
            Me.lblUpdateSuccess.Visible = False


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_displacedlicensedetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", a)


                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txttransid.Text = CStr(tbl_pistol.Rows(0)("transid"))
                Me.txtLicenseStatus.Text = CStr(tbl_pistol.Rows(0)("NewStatus"))
                Me.txtIssueDate.Text = CStr(tbl_pistol.Rows(0)("LicenseIssued"))
                Me.txtExpirationDate.Text = CStr(tbl_pistol.Rows(0)("LicenseExpiration"))
                Me.txtdatelost.Text = CStr(tbl_pistol.Rows(0)("datelost"))
                Me.txtdatereplaced.Text = CStr(tbl_pistol.Rows(0)("datereplaced"))
                Me.txtComments.Text = CStr(tbl_pistol.Rows(0)("Comments"))
                Me.txtoperatorname.Text = CStr(tbl_pistol.Rows(0)("username"))

                'Show empty fields. IRINA: Those fields could not be empty. Duplicate License could not be issued, if those fields are empty. 
                'If CStr(tbl_pistol.Rows(0)("LicenseIssued")) = ("01/01/1900") Or CStr(tbl_pistol.Rows(0)("LicenseIssued")) = ("1/1/1900") Then
                '    Me.txtIssueDate.Text = ""
                'Else
                '    Me.txtIssueDate.Text = CStr(tbl_pistol.Rows(0)("LicenseIssued"))
                'End If

                'If CStr(tbl_pistol.Rows(0)("LicenseExpiration")) = ("01/01/1900") Or CStr(tbl_pistol.Rows(0)("LicenseExpiration")) = ("1/1/1900") Then
                '    Me.txtExpirationDate.Text = ""
                'Else
                '    Me.txtExpirationDate.Text = CStr(tbl_pistol.Rows(0)("LicenseExpiration"))
                'End If

                ''GEt status Value
                'Me.txtLicenseStatus.Text = CStr(tbl_pistol.Rows(0)("NewStatus"))

            Catch ex As Exception
                ex.Message.ToString()
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Load Information. Please, contact IS."
            Finally
                pistolconn.Close()
            End Try

        End If

        If Session("Rights") = "Guest" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = False
        ElseIf Session("Rights") = "User" Then
            Me.btndelete.Enabled = False
            Me.btnupdate.Enabled = True
        End If

    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
        Try
            Me.lblFailed.Visible = False
            Me.lblUpdateSuccess.Visible = False

            Dim dlost As DateTime = Convert.ToDateTime(Me.txtdatelost.Text)
            Dim dreplace As DateTime = Convert.ToDateTime(Me.txtdatereplaced.Text)

            'License could be issue only During 48 hours since lost. Otherwise, new First Time license should be issued. 
            'The same buisness rule applies to UPDATE screen. 
            If dreplace = dlost Or dreplace = dlost.AddHours(24) Or dreplace = dlost.AddHours(48) Then
                Me.lblFailed.Visible = False
                Call UpdateDuplicateLicense()
                Exit Sub
            Else
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Can't Update Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Duplicate License could be issue during only 48 hours since lost of original License."
                Exit Sub
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Update Information. Please, contact IS."
        End Try
    End Sub
    Sub UpdateDuplicateLicense()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim sppistol As SqlCommand = New SqlCommand("update_pcpistdp", pistolconn)

            sppistol.Parameters.AddWithValue("@Id", Me.txttransid.Text)
            sppistol.Parameters.AddWithValue("@datelost", Me.txtdatelost.Text)
            sppistol.Parameters.AddWithValue("@datereplaced", Me.txtdatereplaced.Text)
            sppistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            sppistol.Parameters.AddWithValue("@operator", Session("username"))

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            Me.lblUpdateSuccess.Visible = True
            Me.lblUpdateSuccess.Text = "Duplicate License " & " " & Me.txtdcplid.Text & " has been updated."

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Update Information for License Number " & Me.txtdcplid.Text & ". " & "Please, contact IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub
    'Dont use Delete functionality on this page. license will be deletet from License Detail Screen.
    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Dim sconnection As String
        Dim a As String

        a = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcpistdp", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txttransid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Write("Record has been deleted for member:" & " " & a)
            Response.Redirect("grid/distplacedlist.aspx")



        Catch

        End Try
        pistolconn.Close()

    End Sub
    Sub clearrecord()
        Try
            Me.txtdatelost.Text = "" 
            Me.txtComments.Text = ""

            Me.lblFailed.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Can't clear Duplicate License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."

        End Try
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call clearrecord()
    End Sub

    Protected Sub Menu1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Menu1.Load
        ' Session("dcplid") = Me.txtdcplid.Text

        Session("duplid") = Me.txttransid.Text
    End Sub
End Class
