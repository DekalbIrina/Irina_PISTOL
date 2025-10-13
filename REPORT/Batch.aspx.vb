Imports CrystalDecisions.Shared
Imports System.Data.SqlClient
Partial Class BatchReport
    Inherits System.Web.UI.Page
    Sub AddReport()
        Try
            Dim myparameterfields As New ParameterFields
            Dim myparameterfield As New ParameterField
            Dim mydiscretevalue As New ParameterDiscreteValue

            myparameterfield.ParameterFieldName = "@batchweek"
            mydiscretevalue.Value = Me.txtbatch.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            mydiscretevalue = New ParameterDiscreteValue()
            mydiscretevalue.Value = Me.txtyear.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

            'Dim rptBatch As New BatchReport()
            'Me.CrystalReportSource1.setda()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & "No connection."
        End Try
     
    End Sub
    Protected Sub imgviewreport_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgviewreport.Click
        Call AddReport()
    End Sub
    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        Me.lblError.Visible = False
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        If Session("Rights") = "Guest" Then
            Response.Redirect("~/PistolLicense.aspx")
        ElseIf Session("Rights") = "User" Then
            Response.Redirect("~/PistolLicense.aspx")
        End If

    End Sub
End Class
