Imports System.Web.UI.WebControls
Imports System.Data.SqlClient

Partial Class DuplicateLicenseList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mylicense As String = Session("licenseid")

        Dim sconnection As String

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/License/LicenseDetails.aspx")
        End If


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_licensedisplacedhistory", pistolconn)

            cmdpistol.Parameters.AddWithValue("@dcplid", mylicense)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()


            Me.grddisplaced.DataSource = pistol_data
            Me.DataBind()

        Catch ex As Exception
            ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub grdpayments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grddisplaced.SelectedIndexChanged

    End Sub
End Class
