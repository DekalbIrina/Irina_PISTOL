Imports System.Web.UI.WebControls
Imports System.Data.SqlClient

Partial Class ArrestList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring = Session("memberid")

       
        Dim sconnection As String

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If
        

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("sel_pistollicensehistory", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", mystring)
            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()


            Me.grdlicense.DataSource = pistol_data
            Me.DataBind()

        Catch ex As Exception
            ex.Message.ToString()
        Finally

            pistolconn.Close()
        End Try

        Session("licenseid") = ""


    End Sub

   
    
    
   
    Protected Sub grdlicense_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdlicense.RowCommand
        ' If multiple ButtonField column fields are used, use the
        ' CommandName property to determine which button was clicked.


        If e.CommandName = "Select" Then

            ' Convert the row index stored in the CommandArgument
            ' property to an Integer.
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)

            ' Get the memberid of the pistol db from the appropriate
            ' cell in the GridView control.
            Dim selectedRow As GridViewRow = grdlicense.Rows(index)
            Dim contactCell As TableCell = selectedRow.Cells(1)
            Dim pistolkey As String = contactCell.Text

            Session("licenseid") = pistolkey


        End If
    End Sub

    Protected Sub grdlicense_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdlicense.SelectedIndexChanged
        Response.Redirect("~/license/licensedetails.aspx")
    End Sub

    'Protected Sub Page_PreLoad(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreLoad
    '    Dim sconnection As String

    '    sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
    '    Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
    '    pistolconn.Open()


    '    Try

    '        Dim cmdpistol As SqlCommand = New SqlCommand("update_status", pistolconn)

    '        cmdpistol.CommandType = Data.CommandType.StoredProcedure

    '        cmdpistol.ExecuteNonQuery()

    '    Catch

    '    End Try
    'End Sub
End Class
