Imports System.Data.SqlClient
Imports System.Data

Partial Class UserList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim sconnection As String

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") <> "Admin" Then
            Response.Redirect("~/pistollicense.aspx")
        End If


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("Select_UserHistory", pistolconn)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim adppistol As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim pistol_data As Data.DataTable
            pistol_data = New Data.DataTable
            adppistol.Fill(pistol_data)
            adppistol.Dispose()

            Me.grdUsers.DataSource = pistol_data
            Me.DataBind()

        Catch ex As Exception
            ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub grdUsers_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grdUsers.PageIndexChanging
        Try
            Me.grdUsers.PageIndex = e.NewPageIndex
            Me.DataBind()
        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & " " & "Can't Navigate Page. Please inform IS. "
        End Try  
    End Sub

    'Protected Sub grdUsers_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles grdUsers.Sorting

    ' I TURNED OFF SORTING AND PLACE SORTING INTO SP. This funciton does not work propery. 
    '    Try
    '        Dim dataTable As Data.DataTable
    '        dataTable = Me.grdUsers.DataSource

    '        Dim dataView As DataView = New DataView(dataTable)

    '        If dataTable Is System.DBNull.Value Then
    '            'do nothing
    '        Else
    '            dataView.Sort = e.SortExpression & " " & e.SortDirection
    '        End If

    '    Catch ex As Exception
    '        ex.Message.ToString()
    '        Me.lblError.Visible = True
    '        Me.lblError.Text = ex.Message.ToString() & " " & "Can't Sort Page. Please inform IS. "
    '    End Try


    'End Sub
End Class
