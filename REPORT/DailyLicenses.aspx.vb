
Imports CrystalDecisions.Shared
Imports System.Data.SqlClient
Partial Class DailyLicenses
    Inherits System.Web.UI.Page

    Sub licensedataset()

        Me.txtbegindate.Text = Session("licenseid")

        Dim strConn As String = "Server=IS-6HL0581;Database=Pistol;Trusted_Connection=True;"
        Dim MySQL As String = "sel_license"
        Dim MyConn As New SqlConnection(strConn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter()
        Dim Cmd As New SqlCommand(MySQL, MyConn)
        Cmd.Parameters.AddWithValue("@dcplid", Me.txtbegindate.Text)
        Cmd.CommandType = Data.CommandType.StoredProcedure
        MyConn.Open()
        da.SelectCommand = Cmd
        da.Fill(ds, "license")
        'Me.GridView1.DataSource = ds
        'Me.GridView1.DataBind()

        Me.CrystalReportSource1.DataBind()

    End Sub

    Sub AddReport()
        Try

            Dim myparameterfields As New ParameterFields()
            Dim myparameterfield As New ParameterField()
            Dim mydiscretevalue As New ParameterDiscreteValue()

            myparameterfield.ParameterFieldName = "@begindate"
            mydiscretevalue.Value = Me.txtbegindate.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            Me.CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblError.Visible = True
            Me.lblError.Text = ex.Message.ToString() & "No DB connection. Please Inform IS."
        End Try

    End Sub


    Protected Sub imgpreviewreport_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgpreviewreport.Click
        AddReport()
    End Sub

    Protected Sub CrystalReportViewer1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles CrystalReportViewer1.Init

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
