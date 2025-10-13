Imports System.Data.SqlClient
Imports System.Globalization.CultureInfo

'IRINA. I DON'T USE THIS FILE. BATCH HAS BEEN ADDED AUTOMATICALLY AS SOON AS FIRST LICENSE IN THE WEEK HAS BEEN CREATED.
Partial Class AddBatch
    Inherits System.Web.UI.Page

    Private Sub clearrecord()
        Try
            Me.txtformsent.Text = ""
            Me.txtbatchtype.Text = ""
            Me.txtcheckpayable.Text = ""
            Me.txtcheckrecievable.Text = ""
            Me.txtdateofrequest.Text = ""
            Me.txtSupervisorApproving.Text = ""
            Me.txtdateofapproval.Text = ""
            Me.txtcashiersname.Text = ""
            Me.txtchecknumber.Text = ""
            Me.txtcheckamount.Text = ""
            Me.lblFailed.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
        End Try

    End Sub


    Protected Sub btnnewmember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewmember.Click
        Dim sconnection As String

        Dim a As String


        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("insert_batchmaster", pistolconn)
            cmdpistol.Parameters.AddWithValue("@batchdate", Me.txtbatchdate.Text)
            cmdpistol.Parameters.AddWithValue("@BatchNumber ", Me.txtBatchNumber.Text)
            cmdpistol.Parameters.AddWithValue("@FormsSent ", Me.txtformsent.Text)
            cmdpistol.Parameters.AddWithValue("@BatchType", Me.txtbatchtype.Text)
            cmdpistol.Parameters.AddWithValue("@Checkpayable", Me.txtcheckpayable.Text)
            cmdpistol.Parameters.AddWithValue("@Checkreceivable", Me.txtcheckrecievable.Text)
            cmdpistol.Parameters.AddWithValue("@DateofRequest ", Me.txtdateofrequest.Text)
            cmdpistol.Parameters.AddWithValue("@SupervisorApproving ", Me.txtSupervisorApproving.Text)
            cmdpistol.Parameters.AddWithValue("@DateofApproval", Me.txtdateofapproval.Text)
            cmdpistol.Parameters.AddWithValue("@Cashirname", Me.txtcashiersname.Text)
            cmdpistol.Parameters.AddWithValue("@CheckNumber", Me.txtchecknumber.Text)
            cmdpistol.Parameters.AddWithValue("@CheckAmount", Me.txtcheckamount.Text)
            cmdpistol.Parameters.AddWithValue("@UserName", Me.txtOperator.Text)



            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            Dim returnResult As Integer
            returnResult = cmdpistol.ExecuteNonQuery()

            'SP Returns -1, if Batch Number already exists. Duplicate batch should not be allowed, because Batch number its actually a week number. 
            If returnResult < 0 Then
                Me.txtBatchNumber.BackColor = Drawing.Color.Red
                Me.lblFailed.Visible = True
                Me.lblFailed.Text = "Batch Number " & " " & Me.txtBatchNumber.Text & " Already Exists."
            Else
                Response.Redirect("~/grid/BatchMasterlist.aspx")

            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.txtBatchNumber.BackColor = Drawing.Color.Red
            Me.lblFailed.Visible = True
            Me.lblFailed.Text = "Unable to add Batch Number : " & Me.txtBatchNumber.Text & " " & ex.Message.ToString()

        Finally
            pistolconn.Close()
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

 

        If Not Page.IsPostBack Then

 
            'Me.txtbatchdate.Text = Date.Now
            Me.txtbatchdate.Text = Convert.ToString(Format(Now, "MM-dd-yyyy"))
            Me.txtOperator.Text = Session("username")

            ' Me.txtBatchNumber.Text = DatePart("ww", Date.Now) I decide to use diff week calculation. This one does not count odd year. 04/21/2009
            Dim currentCulture As System.Globalization.CultureInfo
            currentCulture = System.Globalization.CultureInfo.CurrentCulture

            'Week's count will start at January 1 every year. First day of week set up to Monday. 
            Dim weekNumMonJanuary1 As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.Monday, FirstWeekOfYear.Jan1)
            Me.txtBatchNumber.Text = weekNumMonJanuary1

            'Expressions bellow represent different parameters to start week in the case we need to change.  IRINA
            'Dim weekNumberFriday As Integer = currentCulture.Calendar.GetWeekOfYear(Now, System.Globalization.CalendarWeekRule.FirstDay, DayOfWeek.Friday)
            'Dim weekNumSunJanuary1 As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.Jan1)
            'Dim weekNumSysJanuary1 As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.System, FirstWeekOfYear.Jan1)
            'Dim weekNumberSystem As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.System, FirstWeekOfYear.System)
            'Dim weekNumberFull As Integer = DatePart(DateInterval.WeekOfYear, Date.Now, Microsoft.VisualBasic.FirstDayOfWeek.Sunday, FirstWeekOfYear.FirstFullWeek)
        End If

        If Session("Rights") = "Guest" Then
            Me.btnnewmember.Enabled = False
        End If
        If Session("Rights") = "User" Then
            Me.btnnewmember.Enabled = False
        End If


    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        Try
            clearrecord()

        Catch ex As Exception
            ex.Message.ToString()
        End Try


    End Sub

    Protected Sub btListView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btListView.Click
        Response.Redirect("~/Grid/BatchMasterlist.aspx")
    End Sub

    Protected Sub btMainMenu_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btMainMenu.Click
        Response.Redirect("~/PistolLicense.aspx")
    End Sub
End Class
