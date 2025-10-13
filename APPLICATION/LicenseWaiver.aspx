<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LicenseWaiver.aspx.vb" Inherits="LicenseWaiver" %>

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
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="LicenseWaiver.rpt">
                <DataSources>
                    <CR:DataSourceRef TableName="sel_license;1" />
                </DataSources>
                <Parameters>
                    <CR:ControlParameter ControlID="txtarrestid" ConvertEmptyStringToNull="False" DefaultValue=""
                        Name="@dcplid" PropertyName="Text" ReportName="" />
                </Parameters>
            </Report>
        </CR:CrystalReportSource>
        &nbsp; &nbsp; &nbsp; &nbsp; 
        <asp:Label ID="lbllicenseid" runat="server" Font-Bold="True" ForeColor="#000099"
            Text="License ID"></asp:Label><asp:TextBox ID="txtarrestid" runat="server" Enabled="False"></asp:TextBox>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
            Width="84px">Exit Report</asp:LinkButton>
        <br />
        <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
            ForeColor="White" Height="24px" Visible="False" Width="720px"></asp:Label><br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
            DisplayGroupTree="False" ReportSourceID="CrystalReportSource1" />
    
    </div>
    </form>
</body>
</html>
