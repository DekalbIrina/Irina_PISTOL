<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddRevoke.aspx.vb" Inherits="AddRevokedLicense" %>

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
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtcourtdate"></cc1:calendarextender>
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderColor="White"
            BorderStyle="Ridge" Font-Bold="True" ForeColor="White" Height="48px" Width="632px"></asp:Label>
        &nbsp;&nbsp;<br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblrevoke" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add Revoked License " Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <br />
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp;
        <br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>&nbsp; &nbsp;<asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="2" Width="61px" Enabled="False" ToolTip="txtmemberid" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>&nbsp;<br />
        <br />
        <asp:Label ID="lblDCPLID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="DCPLID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
            Width="129px" ToolTip="Dcplid" BackColor="#FFFFC0" BorderColor="White" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="lblStatus" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Status" Visible="False" Width="104px"></asp:Label>
        <asp:TextBox ID="txtStatus" runat="server" BackColor="#FFFFC0" ReadOnly="True" Visible="False"
            Width="120px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblRevokeDate" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Revoke Date" Width="104px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtRevokeDate" runat="server" BackColor="#FFFFC0" ForeColor="Black"
            ReadOnly="True" Width="144px"></asp:TextBox><br />
        <br />
        &nbsp;<asp:Label ID="reason1" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Reason 1" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason1" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValidateOneReason" runat="server" ControlToValidate="txtreason1"
            ErrorMessage="Please Enter Reason" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        &nbsp;<asp:Label ID="lblreason2" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Reason 2" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason2" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason2"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblreason3" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Reason 3" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason3" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason3"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblreason4" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Reason 4" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason4" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason4"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblreason5" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Reason 5" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason5" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason5"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblreason6" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Reason 6" Width="103px"></asp:Label>
        <asp:TextBox ID="txtreason6" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="reason6"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblotherreason" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Other Reason" Width="103px"></asp:Label>
        <asp:TextBox ID="txtotherreason" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="otherreason"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblcourtname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Court Name" Width="103px"></asp:Label>
        <asp:TextBox ID="txtcourtname" runat="server" MaxLength="100" TabIndex="2" Width="581px" ToolTip="court name"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblcourtdate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Court Date" Width="103px"></asp:Label>
        <asp:TextBox ID="txtcourtdate" runat="server" MaxLength="8" TabIndex="2" Width="167px" ToolTip="court date"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp;<asp:RequiredFieldValidator ID="ValidateDate" runat="server"
            ControlToValidate="txtcourtdate" ErrorMessage="Please Enter Court Date" Font-Bold="True"
            ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Lblvalidation" runat="server" ForeColor="Silver" Width="40px"></asp:Label><br />
        &nbsp;<asp:Label ID="lblcourttime" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Court Time" Width="103px" Visible="False"></asp:Label>
        <asp:TextBox ID="txtcourttime" runat="server" MaxLength="10" TabIndex="2" Width="167px" ToolTip="court time" Visible="False"></asp:TextBox>&nbsp;<br />
        &nbsp;<asp:Label ID="lblcourtaddress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Court Address" Width="144px"></asp:Label>
        <asp:TextBox ID="txtcourtaddress" runat="server" MaxLength="100" TabIndex="2" Width="544px" ToolTip="court address"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValidateAddress" runat="server" ControlToValidate="txtcourtaddress"
            ErrorMessage="Please Enter Address" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        &nbsp;<asp:Label ID="lblcity" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*City" Width="103px"></asp:Label>&nbsp;<asp:TextBox ID="txtcity" runat="server"
                ToolTip="City" Width="106px">
            </asp:TextBox>&nbsp;
        <asp:Label ID="lblstate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*State"
            Width="62px"></asp:Label>&nbsp;<asp:TextBox ID="txtstate" runat="server" ToolTip="State"
                Width="56px"></asp:TextBox>
        <asp:Label ID="lblzip" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Zip"
            Width="62px"></asp:Label>
        <asp:TextBox ID="txtzip" runat="server" ToolTip="Zip" Width="80px"></asp:TextBox>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:RequiredFieldValidator ID="ValidateCity" runat="server"
            ControlToValidate="txtcity" ErrorMessage="Please Enter City" Font-Bold="True"
            ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="ValidateState" runat="server" ControlToValidate="txtstate"
            ErrorMessage="Please Enter State" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp;<asp:RequiredFieldValidator ID="ValidateZip" runat="server" ControlToValidate="txtzip"
            ErrorMessage="Please Enter Zip Code" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblComments" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Comments" Width="104px"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="128px" Width="696px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblAddedBy" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Added  By" Width="112px"></asp:Label>
        &nbsp;<asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True"></asp:TextBox><br /><hr />
        &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnrevoke" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add Revoked License" ToolTip="Add Revoked License" Width="161px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;<asp:Button ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" ToolTip="Clear All entries" Width="88px" CausesValidation="False" />
        &nbsp;
        <asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/License/LicenseDetails.aspx"
                Text="License Portal" ToolTip="Return to License Detail Screen" Width="122px" CausesValidation="False" />&nbsp;<asp:Button
                    ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                    ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                    Width="118px" CausesValidation="False" /><br />
        &nbsp;
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
