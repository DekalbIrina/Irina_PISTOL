Imports System.Data.SqlClient

Partial Class ArrestDetails
    Inherits System.Web.UI.Page

    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        loadcity()
        loadstate()
        loadzip()

        If Not Page.IsPostBack Then

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txtemploymentid.Text = a
            Me.txtmemberid.Text = Session("memberid")


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_employmentdetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", Me.txtemploymentid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)

                Me.txtemploymentid.Text = CStr(tbl_pistol.Rows(0)("id"))
                Me.txtmemberid.Text = CStr(tbl_pistol.Rows(0)("memberid"))
                Me.txtcompany.Text = CStr(tbl_pistol.Rows(0)("company"))
                Me.txtaddress.Text = CStr(tbl_pistol.Rows(0)("address"))
                Me.ddcity.Text = CStr(tbl_pistol.Rows(0)("city"))
                Me.ddstate.Text = CStr(tbl_pistol.Rows(0)("state"))
                Me.ddzip.Text = CStr(tbl_pistol.Rows(0)("zip"))
                Me.txtphone.Text = CStr(tbl_pistol.Rows(0)("phone"))
                Me.txtextension.Text = CStr(tbl_pistol.Rows(0)("extension"))
                Me.txtwebaddress.Text = CStr(tbl_pistol.Rows(0)("webaddress"))
                Me.txtapplicantmanager.Text = CStr(tbl_pistol.Rows(0)("applicantmanager"))
                Me.txtmanageremail.Text = CStr(tbl_pistol.Rows(0)("manageremailaddress"))
                Me.txtapplicanttitle.Text = CStr(tbl_pistol.Rows(0)("applicanttitle"))
                Me.txtdatestarted.Text = CStr(tbl_pistol.Rows(0)("datestarted"))
                Me.txtdateended.Text = CStr(tbl_pistol.Rows(0)("dateended"))
                Me.txtyearsworked.Text = CStr(tbl_pistol.Rows(0)("applicantyears"))
                Me.chkcurrentemployer.Checked = CStr(tbl_pistol.Rows(0)("currentemployer"))



            Catch

            End Try
            pistolconn.Close()

        End If


        If Session("Rights") = "Guest" Then
            Me.btnupdate.Enabled = False
            Me.btndelete.Enabled = False
        ElseIf Session("Rights") = "User" Then
            Me.btnupdate.Enabled = True
            Me.btndelete.Enabled = False
        End If

    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
        Try
            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim sppistol As SqlCommand = New SqlCommand("update_pcemployer", pistolconn)

            sppistol.Parameters.AddWithValue("@id", Me.txtemploymentid.Text)
            sppistol.Parameters.AddWithValue("@company", Me.txtcompany.Text)
            sppistol.Parameters.AddWithValue("@address", Me.txtaddress.Text)
            sppistol.Parameters.AddWithValue("@city", Me.ddcity.Text)
            sppistol.Parameters.AddWithValue("@state", Me.ddstate.Text)
            sppistol.Parameters.AddWithValue("@zip", Me.ddzip.Text)
            sppistol.Parameters.AddWithValue("@phone", Me.txtphone.Text)
            sppistol.Parameters.AddWithValue("@extension", Me.txtextension.Text)
            sppistol.Parameters.AddWithValue("@webaddress", Me.txtwebaddress.Text)
            sppistol.Parameters.AddWithValue("@applicantmanager", Me.txtapplicantmanager.Text)
            sppistol.Parameters.AddWithValue("@manageremailaddress", Me.txtmanageremail.Text)
            sppistol.Parameters.AddWithValue("@applicanttitle", Me.txtapplicanttitle.Text)
            sppistol.Parameters.AddWithValue("@applicantyears", Me.txtyearsworked.Text)
            sppistol.Parameters.AddWithValue("@currentemployer", Me.chkcurrentemployer.Checked)
            sppistol.Parameters.AddWithValue("@datestarted", Me.txtdatestarted.Text)
            sppistol.Parameters.AddWithValue("@dateended", Me.txtdateended.Text)

	





            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            Response.Write("Rehab data has been updated for:" & " " & " " & Session("firstname") & " " & Session("lastname"))



        Catch ex As Exception

            ex.Message.ToString()

        End Try
    End Sub

    Protected Sub btndelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndelete.Click
        Dim sconnection As String
        Dim a As String

        a = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim find_pistol As SqlCommand = New SqlCommand("delete_pcemployer", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txtemploymentid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Write("Record has been deleted for member:" & " " & a)
            Response.Redirect("grid/employerlist.aspx")



        Catch

        End Try
        pistolconn.Close()
    End Sub
    Function loadzip()

        If Not Page.IsPostBack Then

            Dim chargeLoad As String
            chargeLoad = clsdata.cnn

            Dim cboLoad As New SqlConnection
            cboLoad.ConnectionString = chargeLoad

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
                Me.ddzip.DataValueField = "zipcode"



                Me.DataBind()

            Catch ex As Exception
                Throw

            Finally

                cboLoad.Close()
            End Try

        End If

    End Function



    Function loadstate()

        If Not Page.IsPostBack Then

            Dim chargeLoad As String
            chargeLoad = clsdata.cnn

            Dim cboLoad As New SqlConnection
            cboLoad.ConnectionString = chargeLoad

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
                Me.ddstate.DataValueField = "state"



                Me.DataBind()

            Catch ex As Exception
                Throw

            Finally

                cboLoad.Close()
            End Try

        End If


    End Function



    Function loadcity()


        If Not Page.IsPostBack Then


            Dim chargeLoad As String
            chargeLoad = clsdata.cnn

            Dim cboLoad As New SqlConnection
            cboLoad.ConnectionString = chargeLoad

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
                Me.ddcity.DataValueField = "city"



                Me.DataBind()

            Catch ex As Exception
                Throw

            Finally

                cboLoad.Close()
            End Try

        End If


    End Function




End Class
