Imports System.Web.UI.WebControls
Imports System.Data.SqlClient

Partial Class ArrestList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim mylicense As String = Session("licenseid")
        

        Dim sconnection As String
        

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_paymenthistory", pistolconn)

            cmdpistol.Parameters.AddWithValue("@dcplid", mylicense)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()


            Me.grdpayments.DataSource = pistol_data
            Me.DataBind()

        Catch

        End Try




    End Sub

   
    
   
    Protected Sub grdpayments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdpayments.SelectedIndexChanged

    End Sub
End Class
