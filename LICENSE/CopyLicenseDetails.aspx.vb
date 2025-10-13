Imports System.Data.SqlClient

Partial Class CopyLicenseDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Check if session has been expired. If yes, programm redirected to login page.
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


            Me.lblFailed.Visible = False
            Me.lblUpdateSuccess.Visible = False


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("select_CopyIssuedDetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", a)


                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txttransid.Text = CStr(tbl_pistol.Rows(0)("transid"))
                Me.txtdcplid.Text = CStr(tbl_pistol.Rows(0)("dcplid"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))

                Me.txtAffidavitDate.Text = CStr(tbl_pistol.Rows(0)("AFFIDAVITISSUEDATE"))
                Me.txtIssueDate.Text = CStr(tbl_pistol.Rows(0)("ORIGLICENSEDATE"))
                Me.txtExpirationDate.Text = CStr(tbl_pistol.Rows(0)("LicenseExpiration"))
                Me.txtCopyIssueDate.Text = (tbl_pistol.Rows(0)("COPYISSUEDATE"))
                Me.txtMailedDate.Text = CStr(tbl_pistol.Rows(0)("LICENSEMAILEDDATE"))
                Me.txtLostInMail.Text = CStr(tbl_pistol.Rows(0)("LostInMailDate"))
                Me.txtComments.Text = CStr(tbl_pistol.Rows(0)("Comments"))
                Me.txtoperatorname.Text = CStr(tbl_pistol.Rows(0)("username"))
                Me.txtLicenseStatus.Text = CStr(tbl_pistol.Rows(0)("NewStatus"))

                'Show empty fields
                'If CStr(tbl_pistol.Rows(0)("ORIGLICENSEDATE")) = ("01/01/1900") Or CStr(tbl_pistol.Rows(0)("ORIGLICENSEDATE")) = ("1/1/1900") Then
                '    Me.txtIssueDate.Text = ""
                'Else
                '    Me.txtIssueDate.Text = CStr(tbl_pistol.Rows(0)("ORIGLICENSEDATE"))
                'End If

                'If CStr(tbl_pistol.Rows(0)("LicenseExpiration")) = ("01/01/1900") Or CStr(tbl_pistol.Rows(0)("LicenseExpiration")) = ("1/1/1900") Then
                '    Me.txtExpirationDate.Text = ""
                'Else
                '    Me.txtExpirationDate.Text = CStr(tbl_pistol.Rows(0)("LicenseExpiration"))
                'End If

     


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

            'License could not be lost,  before Mailing
            If Convert.ToDateTime(Me.txtLostInMail.Text) < Convert.ToDateTime(Me.txtMailedDate.Text) Then
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Can't Update Copy  License for   " & Me.lblmember.Text.ToUpper() & ".    " & "Original License Mailed Date should be older, then License Lost in Mail Date"
                Exit Sub
            Else
                Call UpdateCopyLicense()
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Update Information. Please, contact IS."
        End Try
    End Sub
    Sub UpdateCopyLicense()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim sppistol As SqlCommand = New SqlCommand("update_CopyLicense", pistolconn)

            sppistol.Parameters.AddWithValue("@Id", Me.txttransid.Text)
            sppistol.Parameters.AddWithValue("@LostInMailDate", Me.txtLostInMail.Text)
            sppistol.Parameters.AddWithValue("@AffidavitIssueDate", Me.txtAffidavitDate.Text)
            sppistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            sppistol.Parameters.AddWithValue("@username", Session("username"))

            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            Me.lblUpdateSuccess.Visible = True
            Me.lblUpdateSuccess.Text = "Copy License " & " " & Me.txtdcplid.Text & " has been updated."

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

            Me.txtLostInMail.Text = ""
            Me.txtComments.Text = ""

            Me.lblFailed.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Can't clear Copy License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."

        End Try
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call clearrecord()
    End Sub

    Protected Sub Menu1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Menu1.Load
        'Session("dcplid") = Me.txtdcplid.Text
        Session("copyid") = Me.txttransid.Text
    End Sub
End Class
