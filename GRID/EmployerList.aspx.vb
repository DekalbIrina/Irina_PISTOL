Imports System.Data.SqlClient

Partial Class ArrestList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring = Session("memberid")

        Dim sconnection As String
        

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_employmenthistory", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", mystring)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()


            Me.grdemployment.DataSource = pistol_data
            Me.DataBind()

        Catch

        End Try



    End Sub
End Class
