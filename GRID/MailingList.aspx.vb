Imports System.Data.SqlClient

Partial Class MailAddressList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring = Session("memberid")

        Dim sconnection As String

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/Member/Console.aspx")
        End If


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_mailinghistory", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", mystring)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()


            Me.grdmail.DataSource = pistol_data
            Me.DataBind()

        Catch ex As Exception
            ex.Message.ToString()
        End Try

    End Sub
End Class
