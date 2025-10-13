<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BlankFireArmsApplication.aspx.vb" Inherits="BlankFireArmsApplication" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cr:crystalreportsource id="CrystalReportSource1" runat="server">
<Report FileName="blankfirearmsapplication.rpt"></Report>
</cr:crystalreportsource>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
            Width="84px">Exit Report</asp:LinkButton></div>
        <cr:crystalreportviewer id="CrystalReportViewer1" runat="server" autodatabind="true"
            displaygrouptree="False" height="1054px" reportsourceid="CrystalReportSource1"
            width="773px"></cr:crystalreportviewer>
    </form>
</body>
</html>
