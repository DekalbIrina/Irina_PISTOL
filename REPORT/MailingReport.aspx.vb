Imports System.Data.SqlClient
Imports System.Collections
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared  'For ParametersField
Partial Class MailingReport
    Inherits System.Web.UI.Page


    Sub AddReport()
        Try
            Dim myparameterfields As New ParameterFields
            Dim myparameterfield As New ParameterField
            Dim mydiscretevalue As New ParameterDiscreteValue

            myparameterfield.ParameterFieldName = "@batchBegin"
            mydiscretevalue.Value = Me.txtBatchBegin.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            mydiscretevalue = New ParameterDiscreteValue()
            mydiscretevalue.Value = Me.txtbatchEnd.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            mydiscretevalue = New ParameterDiscreteValue()
            mydiscretevalue.Value = Me.txtyear.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

            Call UpdateMailingDate()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & "No connection."
        End Try

    End Sub
    Sub UpdateMailingDate()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("Update_MailingDate", pistolconn)

            find_pistol.Parameters.AddWithValue("@batchBegin", Me.txtBatchBegin.Text)
            find_pistol.Parameters.AddWithValue("@batchEnd", Me.txtbatchEnd.Text)
            find_pistol.Parameters.AddWithValue("@BatchYear", Me.txtyear.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & "Can not Update Mailing Date. Please Inform IS."
        Finally
            pistolconn.Close()
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
