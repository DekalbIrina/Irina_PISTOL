Imports System.Data.SqlClient

Partial Class AddRevokedLicense
    Inherits System.Web.UI.Page

    Protected Sub btnrevoke_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnrevoke.Click
        'This sub Inserts Record 
        Dim sconnection As String

        Dim a As String
        Dim b As String

        a = Me.txtmemberid.Text
        b = Me.lblmember.Text

        sconnection = System.Configuration.ConfigurationManager.AppSettings("connectionstring")
        Dim pistolconn As SqlConnection = New SqlConnection(sconnection)
        pistolconn.Open()

        Try
            Dim cmdpistol As SqlCommand = New SqlCommand("insert_pcrevoke", pistolconn)

            cmdpistol.Parameters.AddWithValue("@memberid", Me.txtmemberid.Text)
            cmdpistol.Parameters.AddWithValue("@DCPLID", Me.txtdcplid.Text)
            cmdpistol.Parameters.AddWithValue("@RevokeDate", Me.txtRevokeDate.Text)
            cmdpistol.Parameters.AddWithValue("@reason1", Me.txtreason1.Text)
            cmdpistol.Parameters.AddWithValue("@reason2", Me.txtreason2.Text)
            cmdpistol.Parameters.AddWithValue("@reason3", Me.txtreason3.Text)
            cmdpistol.Parameters.AddWithValue("@reason4", Me.txtreason4.Text)
            cmdpistol.Parameters.AddWithValue("@reason5", Me.txtreason5.Text)
            cmdpistol.Parameters.AddWithValue("@reason6", Me.txtreason6.Text)
            cmdpistol.Parameters.AddWithValue("@otherreason", Me.txtotherreason.Text)
            cmdpistol.Parameters.AddWithValue("@courtname", Me.txtcourtname.Text)
            cmdpistol.Parameters.AddWithValue("@courtdate", Me.txtcourtdate.Text)
            cmdpistol.Parameters.AddWithValue("@address", Me.txtcourtaddress.Text)
            cmdpistol.Parameters.AddWithValue("@city", Me.txtcity.Text)
            cmdpistol.Parameters.AddWithValue("@state", Me.txtstate.Text)
            cmdpistol.Parameters.AddWithValue("@zip", Me.txtzip.Text)
            cmdpistol.Parameters.AddWithValue("@courttime", Me.txtcourttime.Text)
            cmdpistol.Parameters.AddWithValue("@Comments", Me.txtComments.Text)
            cmdpistol.Parameters.AddWithValue("@userName", Me.txtOperator.Text)

            cmdpistol.CommandType = Data.CommandType.StoredProcedure

            Dim pre_adap As SqlDataAdapter = New SqlDataAdapter(cmdpistol)

            cmdpistol.ExecuteNonQuery()

            Session("licenseid") = Me.txtdcplid.Text
            Response.Redirect("~/License/LicenseDetails.aspx")

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't add Revoke License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        Finally
            pistolconn.Close()
        End Try

    End Sub

    Sub clearscreen()
        Try
            Me.txtreason1.Text = ""
            Me.txtreason2.Text = ""
            Me.txtreason3.Text = ""
            Me.txtreason4.Text = ""
            Me.txtreason5.Text = ""
            Me.txtreason6.Text = ""
            Me.txtotherreason.Text = ""
            Me.txtcourtname.Text = ""
            Me.txtcourtdate.Text = ""
            Me.txtcourttime.Text = ""
            Me.txtcourtaddress.Text = ""
            Me.txtcity.Text = ""
            Me.txtstate.Text = ""
            Me.txtzip.Text = ""
            Me.txtComments.Text = ""
            Me.lblErrorMessage.Visible = False

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't clear Revoke License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            'When Session has been expired, redirect User to Logon Page
            If Session("Rights") <> "Admin" And Session("Rights") <> "Guest" And Session("Rights") <> "User" Then
                Response.Redirect("~/default.aspx")
            End If

            If Session("Rights") = "Guest" Then
                Response.Redirect("~/License/LicenseDetails.aspx")
            ElseIf Session("Rights") = "User" Then
                Response.Redirect("~/License/LicenseDetails.aspx")
            End If

            'Avoid focus on browser address bar or some additional toolbar
            'tab key ASCII code is 9
            Me.btnrevoke.Attributes.Add("onkeydown", _
            "if(event.which || event.keyCode)" & _
            "{if ((event.which == 9) || (event.keyCode == 9)) " & _
            "{document.getElementById('" & Me.txtreason1.ClientID & _
            "').focus();return false;}} else {return true}; ")

            If Not Page.IsPostBack Then

                Dim mystring As String = Session("memberid")
                Me.txtmemberid.Text = mystring
                Me.lblErrorMessage.Visible = False

                Dim mylicense As String = Session("licenseid")
                Me.txtdcplid.Text = mylicense

                'Get status name in the case we have to validate Revoke license for Active status only. I
                'I do not validate it for now.
                Me.txtStatus.Text = Session("statusName")

                'Get Date
                Me.txtRevokeDate.Text = Convert.ToString(Format(Now, "MM-dd-yyyy"))

                Me.lblmember.Text = Session("Lastname") & "," & " " & Session("firstname")
                Me.txtOperator.Text = Session("username")
            End If

            If Session("Rights") = "Guest" Then
                Me.btnrevoke.Enabled = False
            End If

        Catch ex As Exception
            ex.Message.ToString()
            Me.lblErrorMessage.Visible = True
            Me.lblErrorMessage.Text = "Can't Load Infro for  Revoke License for   " & Me.lblmember.Text.ToUpper() & ".    " & Me.txtdcplid.Text & ex.Message.ToString() & "Please, inform IS."
        End Try
  
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call clearscreen()
    End Sub
End Class
