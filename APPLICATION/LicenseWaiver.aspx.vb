Imports CrystalDecisions.Shared
Imports System.Data.SqlClient
Partial Class LicenseWaiver
    Inherits System.Web.UI.Page


    Sub Addreport()
        Try
            Me.txtarrestid.Text = Session("licenseid")

            Dim myparameterfields As New ParameterFields()
            Dim myparameterfield As New ParameterField()
            Dim mydiscretevalue As New ParameterDiscreteValue()

            myparameterfield.ParameterFieldName = "@id"
            mydiscretevalue.Value = Me.txtarrestid.Text
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


    'Protected Sub CrystalReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles CrystalReportViewer1.Init

    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Addreport()

    End Sub
End Class
