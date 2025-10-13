<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddCopyIssuedLicense.aspx.vb" Inherits="AddCopyIssuedLicense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="txtLostInMail" runat="server">
    <div style="background-color: background" title="Rehab">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtLostInMail"></cc1:calendarextender>
        <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateoriginMailed"></cc1:calendarextender>
        <cc1:calendarextender id="CalendarExtender3" runat="server" targetcontrolid="txtCopyLicenseIssued"></cc1:calendarextender>
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblTitle" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add Copy Issued in Mail  License " Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label><br />
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="40px" Width="704px"></asp:Label><br />
        <br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Label ID="lblDCPLID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="DCPLID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20"
            Width="129px" ToolTip="DCPLID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
        <br />
        <br />
        <asp:Label ID="lblLicenseStatus" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="License Status" Width="128px"></asp:Label>&nbsp; &nbsp;<asp:TextBox
                ID="txtLicenseStatus" runat="server" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black"
                ReadOnly="True" Width="272px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblOriginalIssueDate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Original License Issue Date" Width="248px" Height="16px" ToolTip="Original License Issue Date"></asp:Label>
        &nbsp; &nbsp;<asp:TextBox ID="txtIssueDate" runat="server" MaxLength="8"
            Width="152px" ToolTip="Date lost" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
        <asp:Label ID="lblOriginalExpiration" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" ForeColor="Black" Text="Original License Expiration Date"
            Width="248px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtExpirationDate" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" Width="152px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblOrigLiceMaileDate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Original License Mailed Date" Width="248px" Height="16px" ToolTip="Date when Original License was mailed to applicant"></asp:Label>&nbsp;
        <asp:TextBox ID="txtdateoriginMailed" runat="server" MaxLength="8"
            Width="152px" ToolTip="Date Placed" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        <br />
        <asp:Label ID="lblLostinmail" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="*Lost In Mail Date" Width="248px"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtLostInMail" runat="server" Width="152px" TabIndex="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValLostInMail" runat="server" ControlToValidate="txtLostInMail"
            ErrorMessage="Enter Lost In Mail Date" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <br />
        <br />
        <asp:Label ID="lblCopyLicenseIssue" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Copy License Issue Date" Width="256px"></asp:Label>
        &nbsp;<asp:TextBox ID="txtCopyLicenseIssued" runat="server" Width="152px" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblComments" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Comments" Width="136px"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="152px" Width="712px" TextMode="MultiLine" TabIndex="2"></asp:TextBox><br />
        <br />
        <asp:Label ID="lbloperator" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Added By:" Width="80px"></asp:Label>&nbsp;<asp:TextBox ID="txtoperatorname"
                runat="server" Width="160px" BackColor="#FFFFC0" Font-Bold="True" ReadOnly="True" TabIndex="3"></asp:TextBox>&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
        <br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btnAddCopyLicense" runat="server" EnableViewState="False" TabIndex="4"
            Text="Add Copy Issued License" ToolTip="Add Displaced License" Width="168px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="72px" CausesValidation="False" TabIndex="-1" />
        &nbsp;<asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
                Text="License Portal" ToolTip="Return to Pistol License Detail Screen" Width="122px" CausesValidation="False" TabIndex="-1" />&nbsp;&nbsp;
        <asp:Button
                    ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                    ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                    Width="118px" CausesValidation="False" TabIndex="-1" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
