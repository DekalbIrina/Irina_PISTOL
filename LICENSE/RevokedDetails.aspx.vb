Imports System.Data.SqlClient

Partial Class ArrestDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
        Me.lblUpdateSuccess.Visible = False
        Me.lblFailed.Visible = False

        If Not Page.IsPostBack Then
            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txttransid.Text = a
            Me.txtmemberid.Text = Session("memberid")
            Me.txtdcplid.Text = Session("licenseid")

            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_revokeddetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", Me.txttransid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtRevokeDate.Text = CStr(tbl_pistol.Rows(0)("RevokeDate"))
                Me.txtreason1.Text = CStr(tbl_pistol.Rows(0)("reason1"))
                Me.txtreason2.Text = CStr(tbl_pistol.Rows(0)("reason2"))
                Me.txtreason3.Text = CStr(tbl_pistol.Rows(0)("reason3"))
                Me.txtreason4.Text = CStr(tbl_pistol.Rows(0)("reason4"))
                Me.txtreason5.Text = CStr(tbl_pistol.Rows(0)("reason5"))
                Me.txtreason6.Text = CStr(tbl_pistol.Rows(0)("reason6"))
                Me.txtotherreason.Text = CStr(tbl_pistol.Rows(0)("Otherreason"))
                Me.txtcourtdate.Text = CStr(tbl_pistol.Rows(0)("courtdate"))
                Me.txtcourtname.Text = CStr(tbl_pistol.Rows(0)("courtname"))
                Me.txtcourtaddress.Text = CStr(tbl_pistol.Rows(0)("address"))
                Me.txtcity.Text = CStr(tbl_pistol.Rows(0)("city"))
                Me.txtstate.Text = CStr(tbl_pistol.Rows(0)("state"))
                Me.txtzip.Text = CStr(tbl_pistol.Rows(0)("zip"))
                Me.txtcourttime.Text = Convert.ToDateTime(tbl_pistol.Rows(0)("courttime"))
                Me.txtComments.Text = CStr(tbl_pistol.Rows(0)("Comments"))
                Me.txtOperator.Text = CStr(tbl_pistol.Rows(0)("Username"))

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
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim sppistol As SqlCommand = New SqlCommand("update_pcrevoke", pistolconn)


            sppistol.Parameters.AddWithValue("@dcplid", Me.txtdcplid.Text)
            sppistol.Parameters.AddWithValue("@reason1", Me.txtreason1.Text)
            sppistol.Parameters.AddWithValue("@reason2", Me.txtreason2.Text)
            sppistol.Parameters.AddWithValue("@reason3", Me.txtreason3.Text)
            sppistol.Parameters.AddWithValue("@reason4", Me.txtreason4.Text)
            sppistol.Parameters.AddWithValue("@reason5", Me.txtreason5.Text)
            sppistol.Parameters.AddWithValue("@reason6", Me.txtreason6.Text)
            sppistol.Parameters.AddWithValue("@otherreason", Me.txtotherreason.Text)
            sppistol.Parameters.AddWithValue("@courtname", Me.txtcourtname.Text)
            sppistol.Parameters.AddWithValue("@courtdate", Me.txtcourtdate.Text)
            sppistol.Parameters.AddWithValue("@courttime", Me.txtcourttime.Text)
            sppistol.Parameters.AddWithValue("@address", Me.txtcourtaddress.Text)
            sppistol.Parameters.AddWithValue("@city", Me.txtcity.Text)
            sppistol.Parameters.AddWithValue("@state", Me.txtstate.Text)
            sppistol.Parameters.AddWithValue("@zip", Me.txtzip.Text)
            sppistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            sppistol.Parameters.AddWithValue("@username", Me.txtOperator.Text)


            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            Me.lblUpdateSuccess.Visible = True
            Me.lblUpdateSuccess.Text = "Revoke License " & " " & Me.txtdcplid.Text & " has been updated."

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Update Revoke License " & "  " & Me.txtdcplid.Text & "." & "Please, contact IS."
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
            Dim find_pistol As SqlCommand = New SqlCommand("delete_PCPistol", pistolconn)
            find_pistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Redirect("~/Grid/PistolLicenseList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Delete Revoke License " & "  " & Me.txtdcplid.Text & "." & "Please, contact IS."
        Finally
            pistolconn.Close()
        End Try


    End Sub
    Sub ClearFields()

        Try
            Me.lblUpdateSuccess.Visible = False
            Me.lblFailed.Visible = False
            Me.txtcity.Text = ""
            Me.txtComments.Text = ""
            Me.txtcourtaddress.Text = ""
            Me.txtcourtdate.Text = ""
            Me.txtcourtname.Text = ""
            Me.txtcourttime.Text = ""
            Me.txtotherreason.Text = ""
            Me.txtreason1.Text = ""
            Me.txtreason2.Text = ""
            Me.txtreason3.Text = ""
            Me.txtreason4.Text = ""
            Me.txtreason5.Text = ""
            Me.txtreason6.Text = ""
            Me.txtstate.Text = ""
            Me.txtzip.Text = ""

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString() & "   " & "Unable to Clear Fields. Please, contact IS."

        End Try
    End Sub
    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearFields()
    End Sub
End Class
