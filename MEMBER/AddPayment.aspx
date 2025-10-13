<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddPayment.aspx.vb" Inherits="AddArrest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: background" title="Rehab">
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add License Payment" Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="2" Width="61px" Enabled="False" ToolTip="Member ID"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Label ID="lblDCPLID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="DCPLID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
            Width="129px" ToolTip="License #"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblamountpaid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Amount Paid" Width="99px"></asp:Label>
        <asp:TextBox ID="txtamountpaid" runat="server" MaxLength="10" TabIndex="2"
            Width="97px" ToolTip="Amount Paid"></asp:TextBox>&nbsp;
        <asp:Label ID="lbldatepaid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Date Paid" Width="99px"></asp:Label>
        <asp:TextBox ID="txtdatepaid" runat="server" MaxLength="8" TabIndex="2"
            Width="100px" ToolTip="Date Paid"></asp:TextBox>
        <asp:Label ID="lbldatevalidation" runat="server" ForeColor="Silver" Text="Date Started/Ended Must Have 8 numeric digits"
            Visible="False" Width="302px"></asp:Label><br />
        <asp:CheckBox ID="chkpaymentexempt" runat="server" BackColor="LightSteelBlue" BorderWidth="1px"
            Font-Bold="True" Text="Payment Exempt" Width="146px" ToolTip="Payment Exempt" /><br />
        &nbsp;<asp:Label ID="lblreasonexempt" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Height="23px" Text="Reason Exempt" Width="116px"></asp:Label>
        <asp:TextBox ID="txtreasonexempt" runat="server" Height="31px" MaxLength="255"
            TabIndex="2" Width="390px" ToolTip="Reason Exempt"></asp:TextBox><br />
        &nbsp; &nbsp; &nbsp; 
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdatepaid"></cc1:calendarextender>
        &nbsp;&nbsp;<br />
        <br />
        &nbsp; &nbsp; &nbsp;<br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnnewmember" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add Payment" ToolTip="Add Payment To License" Width="131px" /><asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy"
                Text="Pistol License" ToolTip="Pistol License" Width="122px" />&nbsp;<asp:Button
                    ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                    ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                    Width="118px" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
