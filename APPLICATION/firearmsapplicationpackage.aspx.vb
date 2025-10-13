Imports CrystalDecisions.CrystalReports.Engine.PrintOptions
Imports CrystalDecisions.CrystalReports.Engine.ReportDocument
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Web.Report
Imports CrystalDecisions.web
Imports CrystalDecisions.Shared
Imports System.Data.SqlClient

Partial Class firearmsapplication
    Inherits System.Web.UI.Page

    Private WithEvents reportDocument1 As CrystalDecisions.CrystalReports.Engine.ReportDocument
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
        AddReport()

    End Sub

    Protected Sub btnprintreport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnprintreport.Click

        Me.reportDocument1 = New CrystalDecisions.CrystalReports.Engine.ReportDocument
        reportDocument1.Load("C:\Inetpub\wwwroot\Pistol\APPLICATION\firearmsapplicationpackage.rpt")
        CrystalReportViewer1.ReportSource = reportDocument1
        Me.reportDocument1.FileName = "firearmsapplicationpackage.rpt"
        reportDocument1.PrintOptions.PrinterDuplex = CrystalDecisions.Shared.PrinterDuplex.Default
        Me.reportDocument1.PrintToPrinter(1, True, 1, 2)

        'Me.reportDocument1 = New CrystalDecisions.CrystalReports.Engine.ReportDocument
        'Me.reportDocument1.FileName = "rassdk://C:\Inetpub\wwwroot\Pistol\firearmsapplicationpackage.rpt"
        'reportDocument1.PrintOptions.PrinterDuplex = CrystalDecisions.Shared.PrinterDuplex.Default
        'Me.reportDocument1.PrintToPrinter(1, True, 1, 3)

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'InitializeComponent()
        
    End Sub

    Private Sub InitializeComponent()
        'Dim reportdocument1 As New ReportDocument()
        'reportdocument1.Load("C:\Inetpub\wwwroot\Pistol\firearmsapplicationpackage.rpt")
        'CrystalReportViewer1.ReportSource = reportdocument1

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim Exempt As String
        'Exempt = "Yes"

        'If Exempt = "Yes" Then
        '    Response.Redirect("~/APPLICATION/BlankFireArmsApplication.aspx")
        'End If
        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If


    End Sub
End Class
