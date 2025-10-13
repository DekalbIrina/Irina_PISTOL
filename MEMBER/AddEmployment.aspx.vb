Imports System.Data.SqlClient


Partial Class AddArrest
    Inherits System.Web.UI.Page

    Function PhoneMask()

        Dim sItem As String
        sItem = Me.txtphone.Text

        Dim a As Integer

        a = Me.txtphone.Text.Length.ToString()

        If a = 10 Then
            Me.txtphone.Text = Left(txtphone.Text, 3) & "-" & sItem.Substring(3, 3) & "-" & Right(txtphone.Text, 4)
            lblphonevalidation.Visible = False
        ElseIf a < 10 Then
            Me.lblphonevalidation.Visible = True
        End If


    End Function

    Function DateTo()

        Dim sItem As String
        sItem = Me.txtdateend.Text

        Dim a As Integer

        a = Me.txtdateend.Text.Length.ToString()

        If a = 8 Then
            Me.txtdateend.Text = Left(Me.txtdateend.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtdateend.Text, 4)
            lbldatevalidation.Visible = False
        ElseIf a < 8 Then
            Me.lbldatevalidation.Visible = True
        End If



    End Function

    Function ClearRecord()

        Me.txtcompany.Text = ""
        Me.txtdatestart.Text = ""
        Me.txtdateend.Text = ""
        Me.txtaddress.Text = ""
        Me.txtphone.Text = ""
        Me.txtextension.Text = ""
        Me.txtwebaddress.Text = ""
        Me.txtapplicationtitle.Text = ""
        Me.ddyearsofservice.Text = ""
        Me.ckbcurrentemployer.Checked = False
        Me.txtapplicationmanager.Text = ""
        Me.txtmanageremail.Text = ""


    End Function

    Function Datefrom()

        Dim sItem As String
        sItem = Me.txtdateend.Text

        Dim a As Integer

        a = Me.txtdatestart.Text.Length.ToString()

        If a = 8 Then
            Me.txtdatestart.Text = Left(Me.txtdatestart.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtdatestart.Text, 4)
            lbldatevalidation.Visible = False
        ElseIf a < 8 Then
            Me.lbldatevalidation.Visible = True
        End If

    End Function


    Protected Sub btnaddemployment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnaddemployment.Click


        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_PCEmployer", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)

            cmdpistol.Parameters.AddWithValue("@company", Me.txtcompany.Text)

            cmdpistol.Parameters.AddWithValue("@address", Me.txtaddress.Text)

            cmdpistol.Parameters.AddWithValue("@city", Me.ddcity.Text)

            cmdpistol.Parameters.AddWithValue("@state", Me.ddstate.Text)

            cmdpistol.Parameters.AddWithValue("@zip", Me.ddzip.Text)

            cmdpistol.Parameters.AddWithValue("@phone", Me.txtphone.Text)

            cmdpistol.Parameters.AddWithValue("@extension", Me.txtextension.Text)

            cmdpistol.Parameters.AddWithValue("@webaddress", Me.txtwebaddress.Text)

            cmdpistol.Parameters.AddWithValue("@applicantmanager", Me.txtapplicationmanager.Text)

            cmdpistol.Parameters.AddWithValue("@manageremailaddress", Me.txtmanageremail.Text)

            cmdpistol.Parameters.AddWithValue("@applicanttitle", Me.txtapplicationtitle.Text)

            cmdpistol.Parameters.AddWithValue("@applicantyears", Me.ddyearsofservice.Text)

            cmdpistol.Parameters.AddWithValue("@currentemployer", Me.ckbcurrentemployer.Checked)

            cmdpistol.Parameters.AddWithValue("@datestarted", Me.txtdatestart.Text)

            cmdpistol.Parameters.AddWithValue("@dateended", Me.txtdateend.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            Response.Write("Employment record has been added for: " & b)

            ClearRecord()



        Catch ex As Exception
            Err.GetException()
        End Try
        pistolconn.Close()



    End Sub
    Function loadcity()

        Dim cityLoad As String
        cityLoad = clsdata.cnn

        Dim cboLoad As New SqlConnection
        cboLoad.ConnectionString = cityLoad

        cboLoad.Open()

        Try


            Dim cboTbl As System.Data.DataTable = New Data.DataTable
            Dim cmdLoad As SqlCommand = New SqlCommand("sel_city", cboLoad)

            cmdLoad.CommandType = Data.CommandType.StoredProcedure
            cmdLoad.ExecuteNonQuery().ToString()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdLoad)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()

            Me.ddcity.DataSource = cboTbl
            Me.ddcity.DataTextField = "city"


            Me.DataBind()

        Catch ex As Exception
            Throw

        Finally

            cboLoad.Close()
        End Try

    End Function

    Function Loadzipcode()
        Dim cityLoad As String
        cityLoad = clsdata.cnn

        Dim cboLoad As New SqlConnection
        cboLoad.ConnectionString = cityLoad

        cboLoad.Open()

        Try


            Dim cboTbl As System.Data.DataTable = New Data.DataTable
            Dim cmdLoad As SqlCommand = New SqlCommand("sel_zipcode", cboLoad)
            cmdLoad.CommandType = Data.CommandType.StoredProcedure
            cmdLoad.ExecuteNonQuery().ToString()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdLoad)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()

            Me.ddzip.DataSource = cboTbl
            Me.ddzip.DataTextField = "zipcode"

            Me.ddzip.DataBind()


        Catch ex As Exception
            Throw

        Finally

            cboLoad.Close()
        End Try
    End Function

    Function loadstate()

        Dim cityLoad As String
        cityLoad = clsdata.cnn

        Dim cboLoad As New SqlConnection
        cboLoad.ConnectionString = cityLoad

        cboLoad.Open()

        Try


            Dim cboTbl As System.Data.DataTable = New Data.DataTable
            Dim cmdLoad As SqlCommand = New SqlCommand("sel_states", cboLoad)
            cmdLoad.CommandType = Data.CommandType.StoredProcedure
            cmdLoad.ExecuteNonQuery().ToString()

            Dim cboLoadAdapter As SqlDataAdapter = New SqlDataAdapter(cmdLoad)
            cboLoadAdapter.Fill(cboTbl)
            cboLoadAdapter.Dispose()

            Me.ddstate.DataSource = cboTbl
            Me.ddstate.DataTextField = "state"

            Me.ddstate.DataBind()


        Catch ex As Exception
            Throw

        Finally

            cboLoad.Close()
        End Try

    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring As String = Session("memberid")
        Me.txtmemberid.Text = mystring

        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        loadcity()
        loadstate()
        Loadzipcode()

        If Session("Rights") = "Guest" Then
            Me.btnaddemployment.Enabled = False
        End If

    End Sub



    Protected Sub txtdateend_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdateend.TextChanged
        'DateTo()
    End Sub

    Protected Sub txtdatestart_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdatestart.TextChanged
        'Datefrom()

    End Sub

    Protected Sub txtphone_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtphone.TextChanged
        PhoneMask()

    End Sub
End Class
