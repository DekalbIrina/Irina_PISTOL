<%@ webservice language="VB" class="firearmsapplicationService" %>

Imports System
Imports System.Web.Services
Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.Web.Services

< WebService( Namespace:="http://crystaldecisions.com/reportwebservice/9.1/" ) > _
Public Class firearmsapplicationService
    Inherits ReportServiceBase

    Public Sub New()
        Me.ReportSource = Me.Server.MapPath("firearmsapplication.rpt")
    End Sub
End Class



 