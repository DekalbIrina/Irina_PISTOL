<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddDuplicateLicense.aspx.vb" Inherits="AddDuplicateLicense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: background" title="Rehab">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdatelost"></cc1:calendarextender>
        <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdatereplaced"></cc1:calendarextender>
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add Duplicate License " Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label><br />
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="40px" Width="704px"></asp:Label><br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="2" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Label ID="lblDCPLID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="DCPLID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
            Width="129px" ToolTip="DCPLID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblLicenseStatus" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="License Status" Width="104px"></asp:Label>
        <asp:TextBox ID="txtLicenseStatus" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" Width="312px"></asp:TextBox><br />
        <asp:Label ID="lblIssueDate" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Original  License Issue Date" Width="232px"></asp:Label>
        &nbsp;<asp:TextBox ID="txtIssueDate" runat="server" BackColor="#FFFFC0" ForeColor="Black"
            ReadOnly="True" Width="184px"></asp:TextBox><br />
        <asp:Label ID="lblOrigLiceExDate" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Original License Expiration Date" Width="232px"></asp:Label>
        <asp:TextBox ID="txtExpirationDate" runat="server" BackColor="#FFFFC0" ForeColor="Black"
            ReadOnly="True" Width="184px"></asp:TextBox>&nbsp;<br />
        <br />
        <br />
        <asp:Label ID="lbldatelost" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Date Lost" Width="112px"></asp:Label>
        <asp:TextBox ID="txtdatelost" runat="server" MaxLength="8" TabIndex="2"
            Width="96px" ToolTip="Date lost"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValDateLost" runat="server" ControlToValidate="txtdatelost"
            ErrorMessage="Please Enter Lost Date" Font-Bold="True" ForeColor="White" Width="232px"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lbldatereplaced" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Date Replaced" Width="112px"></asp:Label>
        <asp:TextBox ID="txtdatereplaced" runat="server" MaxLength="8" TabIndex="2"
            Width="95px" ToolTip="Date Placed" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValDateReplaced" runat="server" ControlToValidate="txtdatereplaced"
            ErrorMessage="Please  Enter Replaced Date" Font-Bold="True" ForeColor="White"
            Width="232px"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Label ID="lblComments" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Comments" Width="136px"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="152px" Width="712px" TextMode="MultiLine"></asp:TextBox><br />
        <br />
        <asp:Label ID="lbloperator" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Added By:" Width="80px"></asp:Label>&nbsp;<asp:TextBox ID="txtoperatorname"
                runat="server" Width="160px" BackColor="#FFFFC0" Font-Bold="True" ReadOnly="True"></asp:TextBox>&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
        <hr />
        &nbsp;<br />
        \<br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btndisplaced" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add Duplicate License" ToolTip="Add Displaced License" Width="161px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="72px" CausesValidation="False" />
        &nbsp;<asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
                Text="License Portal" ToolTip="Return to Pistol License Detail Screen" Width="122px" CausesValidation="False" />&nbsp;&nbsp;
        <asp:Button
                    ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                    ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                    Width="118px" CausesValidation="False" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
