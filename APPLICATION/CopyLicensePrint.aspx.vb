
Imports CrystalDecisions.Shared
Imports System.Data.SqlClient
Imports System.Data
Partial Class CopyLicensePrint
    Inherits System.Web.UI.Page
    Shared LicenseType As String


    'Function licensedataset()

    '    Me.txtlicenseid.Text = Session("licenseid")

    '    Dim strConn As String = "Server=IS-6HL0581;Database=Pistol;Trusted_Connection=True;"
    '    Dim MySQL As String = "sel_license"
    '    Dim MyConn As New SqlConnection(strConn)
    '    Dim ds As New Data.DataSet
    '    Dim da As New SqlDataAdapter()
    '    Dim Cmd As New SqlCommand(MySQL, MyConn)
    '    Cmd.Parameters.AddWithValue("@dcplid", Me.txtlicenseid.Text)
    '    Cmd.CommandType = Data.CommandType.StoredProcedure
    '    MyConn.Open()
    '    da.SelectCommand = Cmd
    '    da.Fill(ds, "license")
    '    'Me.GridView1.DataSource = ds
    '    'Me.GridView1.DataBind()

    '    Me.CrystalReportSource1.DataBind()

    'End Function

    Sub AddReport()
        Try
            Me.txtlicenseid.Text = Session("licenseid")

            Dim myparameterfields As New ParameterFields()
            Dim myparameterfield As New ParameterField()
            Dim mydiscretevalue As New ParameterDiscreteValue()

            myparameterfield.ParameterFieldName = "@dcplid"
            mydiscretevalue.Value = Me.txtlicenseid.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            Me.CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString()
        End Try
    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load

        Try
            Dim result As Integer
            result = Select_LicenseType()

            If result = 1 Then
                Me.CrystalReportViewer1.Visible = True
                Me.lblFailed.Visible = False
                AddReport()
            Else
                ' Response.Redirect("~/APPLICATION/DuplicateLicensePrint.aspx")
                Me.CrystalReportViewer1.Visible = False
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "You are not able to print Copy License for  " & " " & LicenseType & " " & "License Type."
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString()
        End Try

    End Sub
    Function Select_LicenseType() As Integer

        Dim sconnection As String
        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("Select_LicenseStatus", pistolconn)


            cmdpistol.Parameters.AddWithValue("@MemberId", Session("memberid"))
            cmdpistol.Parameters.AddWithValue("@DCPLID", Session("licenseid"))


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)
            Dim loadTable As New DataTable

            cmdpistol.ExecuteNonQuery()

            pre_adap.Fill(loadTable)
            pre_adap.Dispose()

            LicenseType = loadTable.Rows(0)("LType")

            If LicenseType = "Copy" Then
                Return 1
            Else
                Return 0
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Return 0
        Finally
            pistolconn.Close()
        End Try

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If
    End Sub
End Class
