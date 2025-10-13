
Imports CrystalDecisions.Shared
Imports System.Data.SqlClient
Partial Class CopyLicenseAffidavit
    Inherits System.Web.UI.Page

    'Sub licensedataset()

    '    Me.txtransid.Text = Session("licenseid")

    '    Dim strConn As String = "Server=IS-6HL0581;Database=Pistol;Trusted_Connection=True;"
    '    Dim MySQL As String = "sel_license"
    '    Dim MyConn As New SqlConnection(strConn)
    '    Dim ds As New Data.DataSet
    '    Dim da As New SqlDataAdapter()
    '    Dim Cmd As New SqlCommand(MySQL, MyConn)
    '    Cmd.Parameters.AddWithValue("@dcplid", Me.txtransid.Text)
    '    Cmd.CommandType = Data.CommandType.StoredProcedure
    '    MyConn.Open()
    '    da.SelectCommand = Cmd
    '    da.Fill(ds, "license")
    '    'Me.GridView1.DataSource = ds
    '    'Me.GridView1.DataBind()

    '    Me.CrystalReportSource1.DataBind()

    'End Sub

    Sub AddReport()

        Try
            Me.txtransid.Text = Session("copyid")

            Dim myparameterfields As New ParameterFields()
            Dim myparameterfield As New ParameterField()
            Dim mydiscretevalue As New ParameterDiscreteValue()

            myparameterfield.ParameterFieldName = "@id"
            mydiscretevalue.Value = Me.txtransid.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            Me.CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

            Call UpdateCopyAffidavitDate()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString()
        End Try

    End Sub
    Sub UpdateCopyAffidavitDate()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("Update_CopyLicenseAffidavitDate", pistolconn)

            find_pistol.Parameters.AddWithValue("@copyid", Session("copyid"))

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString()
        Finally
            pistolconn.Close()
        End Try
    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load

        AddReport()

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If
    End Sub

End Class
