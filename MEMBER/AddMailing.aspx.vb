Imports System.Data.SqlClient

Partial Class AddMailAddress
    Inherits System.Web.UI.Page

    Protected Sub btnnewmailing_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnnewmailing.Click

        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcmail", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)

            cmdpistol.Parameters.AddWithValue("@mailaddress", Me.txtmailingaddress.Text)

            cmdpistol.Parameters.AddWithValue("@mailcity", Me.txtcity.Text)

            cmdpistol.Parameters.AddWithValue("@mailstate", Me.txtstate.Text)

            cmdpistol.Parameters.AddWithValue("@mailzip", Me.txtzip.Text)

            cmdpistol.Parameters.AddWithValue("@currentaddress", Me.chkcurrentaddress.Checked)

            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComment.Text)

            cmdpistol.Parameters.AddWithValue("@Username", Me.txtUserName.Text)


            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            Response.Redirect("~/GRID/MailingList.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to Insert Mail Information for User " & " " & Me.lblmember.Text & " " & "Please, inform IS."
        Finally
            pistolconn.Close()
        End Try


    End Sub

    Sub clearrecord()

        Try
            Me.txtmailingaddress.Text = ""
            Me.txtcity.Text = ""
            Me.txtstate.Text = ""
            Me.txtzip.Text = ""
            Me.txtComment.Text = ""
            Me.lblErrorMessage.Visible = False
            Me.chkcurrentaddress.Checked = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to clear Mail Screen. Please, inform IS."
        End Try


    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'When Session has been expired, redirect User to Logon Page
        If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
            Response.Redirect("~/default.aspx")
        End If

        'Avoid focus on browser address bar or some additional toolbar
        'tab key ASCII code is 9
        Me.btnnewmailing.Attributes.Add("onkeydown", _
        "if(event.which || event.keyCode)" & _
        "{if ((event.which == 9) || (event.keyCode == 9)) " & _
        "{document.getElementById('" & Me.txtmailingaddress.ClientID & _
        "').focus();return false;}} else {return true}; ")

        Try
            Dim mystring As String = Session("memberid")

            If Not Page.IsPostBack Then
                Me.lblErrorMessage.Visible = False
                Me.txtmemberid.Text = mystring
                Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
                Me.txtUserName.Text = Session("username")
            End If

            If Session("Rights") = "Guest" Then
                Response.Redirect("~/Member/Console.aspx")    
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Not able to Load Page on  Mail Screen. Please, inform IS."

        End Try

    End Sub

    Protected Sub btnClear_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call clearrecord()
    End Sub
End Class
