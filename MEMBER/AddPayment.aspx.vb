Imports System.Data.SqlClient


Partial Class AddArrest
    Inherits System.Web.UI.Page

       Protected Sub btnnewmember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewmember.Click
        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.txtmemberid.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcpayment", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
            cmdpistol.Parameters.AddWithValue("@amountpaid", Val(Me.txtamountpaid.Text))
            cmdpistol.Parameters.AddWithValue("@datepaid", Me.txtdatepaid.Text)
            cmdpistol.Parameters.AddWithValue("@paymentexempt", Me.chkpaymentexempt.Checked)
            cmdpistol.Parameters.AddWithValue("@reasonexempt", Me.txtreasonexempt.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            Response.Write("Payment transaction has been added for member: " & b)
            clearscreen()


        Catch ex As Exception
            Err.GetException()
        End Try
        pistolconn.Close()
    End Sub
    Function paymentdate()
        Dim sItem As String
        sItem = Me.txtdatepaid.Text

        Dim a As Integer

        a = Me.txtdatepaid.Text.Length.ToString()

        If a = 8 Then
            Me.txtdatepaid.Text = Left(Me.txtdatepaid.Text, 2) & "/" & sItem.Substring(2, 2) & "/" & Right(Me.txtdatepaid.Text, 4)
            lbldatevalidation.Visible = False
        ElseIf a < 8 Then
            Me.lbldatevalidation.Visible = True
        End If




    End Function
    
    Function clearscreen()
        Me.txtamountpaid.Text = ""
        Me.txtdatepaid.Text = ""
        Me.chkpaymentexempt.Checked = False
        Me.txtreasonexempt.Text = ""


    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim mystring As String = Session("memberid")

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        Me.txtmemberid.Text = mystring

        Dim mylicense As String = Session("licenseid")
        Me.txtdcplid.Text = mylicense

        Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

        If Session("Rights") = "Guest" Then
            Me.btnnewmember.Enabled = False

        End If


    End Sub


   
    Protected Sub txtdatepaid_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdatepaid.TextChanged
        'Call paymentdate()
    End Sub

  

    Protected Sub btnsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsearch.Click
        Dim sconnection As String

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()


        Try

            Dim cmdpistol As SqlCommand = New SqlCommand("update_sumofpayments", pistolconn)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            cmdpistol.ExecuteNonQuery()

            Response.Redirect("license/licensedetails.aspx")
        Catch

        End Try
    End Sub

End Class
