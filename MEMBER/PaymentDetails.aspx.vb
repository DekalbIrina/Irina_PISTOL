Imports System.Data.SqlClient

Partial Class ArrestDetails
    Inherits System.Web.UI.Page

    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")

            Dim sconnection As String

            sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
            Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
            pistolconn.Open()

            Dim a As String

            a = Me.Request.QueryString("id")
            Me.txttransid.Text = a

            Me.txtmemberid.Text = Session("memberid")
            Me.txtdcplid.Text = Session("licenseid")


            Try
                Dim tbl_pistol As New Data.DataTable
                Dim find_pistol As SqlCommand = New SqlCommand("sel_paymentdetails", pistolconn)
                find_pistol.Parameters.AddWithValue("@id", Me.txttransid.Text)

                find_pistol.CommandType = Data.CommandType.StoredProcedure
                find_pistol.ExecuteNonQuery().ToString()

                Dim adap As SqlDataAdapter = New SqlDataAdapter(find_pistol)
                adap.Fill(tbl_pistol)


                Me.txttransid.Text = CStr(tbl_pistol.Rows(0)("id"))
                Me.txtamountpaid.Text = CDbl(tbl_pistol.Rows(0)("amountpaid"))
                Me.txtdatepaid.Text = CStr(tbl_pistol.Rows(0)("datepaid"))
                Me.chkpaymentexempt.Checked = CStr(tbl_pistol.Rows(0)("paymentexempt"))
                Me.txtreasonexempt.Text = CStr(tbl_pistol.Rows(0)("reasonexempt"))




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

            Dim sppistol As SqlCommand = New SqlCommand("update_pcpayment", pistolconn)

            sppistol.Parameters.AddWithValue("@id", Me.txttransid.Text)
            sppistol.Parameters.AddWithValue("@paymentexempt", Me.chkpaymentexempt.Checked)
            sppistol.Parameters.AddWithValue("@reasonexempt", Me.txtreasonexempt.Text)
           
            sppistol.CommandType = Data.CommandType.StoredProcedure
            sppistol.ExecuteNonQuery().ToString()

            Response.Write("Payment has been updated for:" & " " & " " & Session("firstname") & " " & Session("lastname"))



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

            Dim find_pistol As SqlCommand = New SqlCommand("delete_PCpayment", pistolconn)
            find_pistol.Parameters.AddWithValue("@id", Me.txttransid.Text)

            find_pistol.CommandType = Data.CommandType.StoredProcedure
            find_pistol.ExecuteNonQuery().ToString()

            Response.Write("Record has been deleted for member:" & " " & a)
            Response.Redirect("grid/paymentlist.aspx")



        Catch

        End Try
        pistolconn.Close()
    End Sub
End Class
