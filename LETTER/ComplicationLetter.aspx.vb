
Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data.SqlClient
Partial Class firearmsapplication
    Inherits System.Web.UI.Page

    '   Sub licensedataset()

    '    Me.txtmemberid.Text = Session("licenseid")

    '    Dim strConn As String = "Server=IS-6HL0581;Database=Pistol;Trusted_Connection=True;"
    '    Dim MySQL As String = "sel_license"
    '    Dim MyConn As New SqlConnection(strConn)
    '    Dim ds As New Data.DataSet
    '    Dim da As New SqlDataAdapter()
    '    Dim Cmd As New SqlCommand(MySQL, MyConn)
    '    Cmd.Parameters.AddWithValue("@dcplid", Me.txtmemberid.Text)
    '    Cmd.CommandType = Data.CommandType.StoredProcedure
    '    MyConn.Open()
    '    da.SelectCommand = Cmd
    '    da.Fill(ds, "license")
    '    'Me.GridView1.DataSource = ds
    '    'Me.GridView1.DataBind()

    '    Me.CrystalReportSource1.DataBind()

    'End Sub

    Sub AddReport()

        Dim userName As String

        userName = Session("username")

        Me.txtmemberid.Text = Session("memberid")

        Try
            Dim myparameterfields As New ParameterFields()
            Dim myparameterfield As New ParameterField()
            Dim mydiscretevalue As New ParameterDiscreteValue()

            'Add Member ID parameter
            myparameterfield.ParameterFieldName = "@memberid"
            mydiscretevalue.Value = Me.txtmemberid.Text
            myparameterfield.CurrentValues.Add(mydiscretevalue)

            myparameterfields.Add(myparameterfield)

            ''Add User Name Parameter I HARD COPY SANDRA WILLIAMS AS CLERK OF PROBATE COURT
            'myparameterfield.ParameterFieldName = "@username"
            'mydiscretevalue.Value = userName
            'myparameterfield.CurrentValues.Add(mydiscretevalue)

            'myparameterfields.Add(myparameterfield)


            'IRINA. Code Bellow possible allow to prompt for Name. Check it out, if needed. 

            'Dim myparameterfields As New ParameterFields()
            'Dim parameterfieldMemberID As New ParameterField() 'parameter for MemberID
            'Dim parameterfieldDCPLID As New ParameterField()  'paremeter for License Nubmer
            'Dim discretevalueMemberID As New ParameterDiscreteValue() 'Value for MemberID
            'Dim discretevalueDCPLID As New ParameterDiscreteValue()   'Value for Licnese Number

            'parameterfieldMemberID.ParameterFieldName = "@memberid"
            'discretevalueMemberID.Value = Me.txtmemberid.Text
            'myparameterfields.Add(discretevalueMemberID)


            'parameterfieldDCPLID.ParameterFieldName = "@username"
            'discretevalueDCPLID.Value = userName
            'myparameterfields.Add(discretevalueDCPLID)
            'IRINA END


            Me.CrystalReportViewer1.ParameterFieldInfo = myparameterfields
            Me.CrystalReportViewer1.RefreshReport()

            Call UpdateCompilationLetterDate()

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = ex.Message.ToString()
        End Try

    End Sub
    Sub UpdateCompilationLetterDate()
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()
        Try
            Dim tbl_pistol As New Data.DataTable
            Dim find_pistol As SqlCommand = New SqlCommand("Update_ComplicationLetterDate", pistolconn)

            find_pistol.Parameters.AddWithValue("@Memberid", Me.txtmemberid.Text)
            find_pistol.Parameters.AddWithValue("@DCPLID", Session("licenseid"))

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
