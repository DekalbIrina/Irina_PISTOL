<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddMailing.aspx.vb" Inherits="AddMailAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="txtmailingaddress" runat="server">
    <div style="background-color: background" title="Rehab">
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Mailing Address" Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label>
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="32px" Width="616px"></asp:Label><br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="2" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="lblmailingaddress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Mailing Address" Width="124px"></asp:Label>
        <asp:TextBox ID="txtmailingaddress" runat="server" MaxLength="35" TabIndex="1" Width="480px" ToolTip="Mailing Address"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValidateMail" runat="server" ErrorMessage="Please, enter Mailing Address"
            Font-Bold="True" ForeColor="White" Width="224px" ControlToValidate="txtmailingaddress"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblmailcity" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Mailing City" Width="112px"></asp:Label>&nbsp;<asp:TextBox ID="txtcity" runat="server"
                Width="176px" ToolTip="Mail City" TabIndex="2"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="ValCity" runat="server" ControlToValidate="txtcity"
                ErrorMessage="Please, Enter City" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblmailstate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Mailing State" Width="112px"></asp:Label>&nbsp;<asp:TextBox ID="txtstate" runat="server"
                Width="96px" ToolTip="Mail State" TabIndex="3"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                    ID="ValState" runat="server" ControlToValidate="txtstate" ErrorMessage="Please, Enter State"
                    Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblmailzip" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Mailing Zip" Width="112px"></asp:Label>
            
        <asp:TextBox ID="txtzip" runat="server" Width="96px" ToolTip="Mail Zip Code" TabIndex="4"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValZip" runat="server" ControlToValidate="txtzip"
            ErrorMessage="Please, Enter Zip Code" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <br />
        
        <asp:CheckBox ID="chkcurrentaddress" runat="server" BackColor="LightSteelBlue" BorderWidth="1px"
            Font-Bold="True" Text="Current Address" Width="152px" ToolTip="Current Address" TabIndex="5" /><br />
        <br />
        <asp:Label ID="lblComments" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Comments" Width="152px"></asp:Label><br />
        <asp:TextBox ID="txtComment" runat="server" Height="152px" TextMode="MultiLine" Width="616px" TabIndex="6"></asp:TextBox><br />
        <br />
        &nbsp;<asp:Label ID="lblUser" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Added By" Width="136px"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtUserName" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" TabIndex="7"></asp:TextBox>
        <br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnnewmailing" runat="server" EnableViewState="False" TabIndex="8"
            Text="Add New Mailing Address" ToolTip="Add Address To Pistol Database" Width="167px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" CausesValidation="False" TabIndex="-1" />
        &nbsp;<asp:Button
            ID="btMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MEMBER/Console.aspx"
            Text="Member Portal" ToolTip="Return to Member Information Screen" Width="104px" CausesValidation="False" TabIndex="-1" />
        <asp:Button ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
            ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
            Width="118px" CausesValidation="False" TabIndex="-1" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
